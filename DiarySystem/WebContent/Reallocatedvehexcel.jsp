<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Vehicle_Report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st22,st3,st5,sttrans;
String sql,sql1,sql2,sql3,sqltrans,today,olddate,username,userrole,thename;
String fromdate,todate;
int Ocount,Icount,CAcount,CScount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
%>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
//out.println(today);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
//out.println(olddate);

try
{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
sttrans=conn1.createStatement();
st5=conn1.createStatement();
fromdate=request.getParameter("calender");
todate=request.getParameter("calender1");
String thename=request.getParameter("radio1");

int i=1;


	if(!(null==thename))
	{
		if(thename.equals("reallocated"))
		{
			
			%>
			
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Transporter</b></td>
	<td><b>Vehicle Reg. No</b></td>
	<td><b>Reason</b></td>
	<td><b>New Available Date</b></td>
	<td><b>New Location</b></td>
	<td><b>New Technician</b></td>
	<td><b>Alocation Date/Time</b></td>
	<td><b>OldAvailable Date</b></td>
	<td><b>Old Location</b></td>
	<td><b>OldTechnician</b></td>
	<td><b>Allocated By</b></td>
	</tr>
	
			
			
			<%
	

	sqltrans="select * from t_reallocated where AlocationDateTime >='"+fromdate+"' and AlocationDateTime <='"+todate+"' order by NewAvailableDate Desc ";	
	ResultSet rsttrans=st.executeQuery(sqltrans);
	while(rsttrans.next())
	{
		%>
		<tr>
			<td><%=i %></td>
			<td><%=rsttrans.getString("Transporter") %></td>
			<td><%=rsttrans.getString("VehRegNo") %></td>
			<td><%=rsttrans.getString("Reason") %></td>
			<%
			try
			{
			%>
			<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("NewAvailableDate"))) %></font></td>
			<%
			}catch(Exception e)
			{
				out.println("-");
			}
			
			%>
			<td><font color="red"><%=rsttrans.getString("NewLocation") %></font></td>
			<td><font color="red"><%=rsttrans.getString("NewTechnician") %></font></td>
			<%
			try
			{
			%>
			<td><%=rsttrans.getString("AlocationDateTime") %></td>
			<%
			}catch(Exception e)
			{
				out.println("-");
			}
			try
			{
			%>
			<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("OldAvailableDate"))) %></td>
			<%
			}catch(Exception e)
			{
				out.println("-");
			}
			
			%>
			<td><%=rsttrans.getString("OldLocation") %></td>
			<td><%=rsttrans.getString("OldTechnician") %></td>
			<td><%=rsttrans.getString("AllocatedBy") %></td>
			
		
		
		<%
		i++;
	}
	%>
	</tr>
		</table>
	<%
		}
		
		else
			if(thename.equals("available"))
			{
				
				%>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Transporter</b></td>
				<td><b>Vehicle Reg. No</b></td>
				<td><b>Unit ID</b></td>
				<td><b>Updated</b></td>
				<td><b>Location</b></td>
				<td><b>Date Of Allocation</b></td>
				<td><b>Date Of Complaint</b></td>
				<td><b>Complaint Description</b></td>
				<td><b>Available Date</b></td>
				<td><b>Available Location</b></td>
				<td><b>Allocated To Technician</b></td>
				<td><b>Status</b></td>
				<td><b>Entered By</b></td>
				</tr>
				
						
						
						<%
				
				sqltrans="select Distinct * from t_complaints1 where VehAvaildate >='"+fromdate+"' and VehAvaildate <='"+todate+"' order by VehAvaildate Desc ";	
				ResultSet rsttrans=st.executeQuery(sqltrans);
				//out.println(sqltrans);
				while(rsttrans.next())
				{	
					sql="select * from t_callocation1 where Tno='"+rsttrans.getString("Tno")+"' ";
					ResultSet rst=st1.executeQuery(sql);
					if(rst.next())
					{
						
						sql1="select * from t_onlinedata where VehicleRegNo='"+rsttrans.getString("VehicleNo")+"'";
						ResultSet rst2=st2.executeQuery(sql1);
						if(rst2.next())
						{

					%>
					<tr>
						<td><%=i %></td>
						<td><%=rsttrans.getString("Customer") %></td>
						<td><%=rsttrans.getString("VehicleNo") %></td>
						<td><%=rsttrans.getString("UnitNo") %></td>
						<td><font color="red"><%=rst2.getString("TheDate") %> <%=rst2.getString("TheTime") %></font></td>
						<td><font color="red"><%=rst2.getString("Location") %></font></td>
						<%
						try
						{
						%>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate"))) %></td>
						<%
						}catch(Exception e){
							out.println("-");
						}
						try
						{
						%>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("CDate"))) %></td>
						<%
						}catch(Exception e){
							out.println("-");
						}
						%>
						<td><%=rsttrans.getString("Complaint") %></td>
						<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate"))) %></font></td>
						<td><%=rsttrans.getString("VehAttLoc") %></td>
						<td><font color="red"><%=rst.getString("Technicion") %></font></td>
						<td><%=rst.getString("Status") %></td>
						<td><%=rsttrans.getString("RegBy") %></td>
						
						
					
					
					<%
					i++;
					}
					}
				}
				%>
				</tr>
					</table>
				<%
				
			}
			else
				if(thename.equals("notattend"))

			{

				%>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Transporter</b></td>
				<td><b>Vehicle Reg. No</b></td>
				<td><b>Unit ID</b></td>
				<td><b>Updated</b></td>
				<td><b>Location</b></td>
				<td><b>Date Of Allocation</b></td>
				<td><b>Date Of Complaint</b></td>
				<td><b>Complaint Description</b></td>
				<td><b>Available Date</b></td>
				<td><b>Available Location</b></td>
				<td><b>Allocated To Technician</b></td>
				<td><b>Status</b></td>
				<td><b>Entered By</b></td>
				</tr>
				
						
						
						<%
				
				sqltrans="select * from t_complaints1 where VehAvaildate >='"+fromdate+"' and VehAvaildate <='"+todate+"' and Result='UnSolved' order by VehAvaildate Desc ";	
				//out.println(sqltrans);
				ResultSet rsttrans=st.executeQuery(sqltrans);
				while(rsttrans.next())
				{	
					sql="select * from t_callocation1 where Tno='"+rsttrans.getString("Tno")+"' and status='UnSolved'";
					ResultSet rst=st1.executeQuery(sql);
					if(rst.next())
					{
						
						sql1="select * from t_onlinedata where VehicleRegNo='"+rsttrans.getString("VehicleNo")+"'";
						ResultSet rst2=st2.executeQuery(sql1);
						if(rst2.next())
						{

					%>
					<tr>
						<td><%=i %></td>
						<td><%=rsttrans.getString("Customer") %></td>
						<td><%=rsttrans.getString("VehicleNo") %></td>
						<td><%=rsttrans.getString("UnitNo") %></td>
						<td><font color="red"><%=rst2.getString("TheDate") %> <%=rst2.getString("TheTime") %></font></td>
						<td><font color="red"><%=rst2.getString("Location") %></font></td>
						<%
						try
						{
						%>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate"))) %></td>
						<%
						}catch(Exception e)
						{
							out.println("-");
						}
						try
						{
						%>
						
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("CDate"))) %></td>
						
						<%
						}catch(Exception e)
						{
							out.println("-");
						}
						
						%>
						<td><%=rsttrans.getString("Complaint") %></td>
						<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate"))) %></font></td>
						<td><%=rsttrans.getString("VehAttLoc") %></td>
						<td><font color="red"><%=rst.getString("Technicion") %></font></td>
						<td><%=rst.getString("Status") %></td>
						<td><%=rsttrans.getString("RegBy") %></td>
						
						
					
					
					<%
					i++;
					}
					}
				}
				%>
				</tr>
					</table>
				<%
			
				
			}
		
				else
					if(thename.equals("action"))

				{

					%>
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
					<td><b>Sr.</b></td>
					<td><b>Transporter</b></td>
					<td><b>Vehicle Reg. No</b></td>
					<td><b>Unit ID</b></td>
					<td><b>Updated</b></td>
					<td><b>Location</b></td>
					<td><b>Date Of Allocation</b></td>
					<td><b>Complaint Description</b></td>
					<td><b>Available Date</b></td>
					<td><b>Available Location</b></td>
					<td><b>Technician Name</b></td>
					<td><b>Action By Technician</b></td>
					<td><b>Solved Date</b></td>
					<td><b>Entered By</b></td>
					</tr>
					
							
							
							<%
					
					sqltrans="select * from t_complaints1 where PSolDate >='"+fromdate+"' and PSolDate <='"+todate+"' and status='Solved' order by PSolDate Desc ";	
					ResultSet rsttrans=st.executeQuery(sqltrans);
					while(rsttrans.next())
					{	
						sql="select * from t_callocation1 where Tno='"+rsttrans.getString("Tno")+"' ";
						ResultSet rst=st1.executeQuery(sql);
						if(rst.next())
						{
							
							sql1="select * from t_onlinedata where VehicleRegNo='"+rsttrans.getString("VehicleNo")+"'";
							ResultSet rst2=st2.executeQuery(sql1);
							if(rst2.next())
							{

						%>
						<tr>
							<td><%=i %></td>
							<td><%=rsttrans.getString("Customer") %></td>
							<td><%=rsttrans.getString("VehicleNo") %></td>
							<td><%=rsttrans.getString("UnitNo") %></td>
							<td><font color="red"><%=rst2.getString("TheDate") %> <%=rst2.getString("TheTime") %></font></td>
							<td><font color="red"><%=rst2.getString("Location") %></font></td>
							<%
							try
							{
							%>
							
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate"))) %></td>
							<%
							}catch(Exception e)
							{
								out.println("-");	
							}
							
							
							%>
							<td><%=rsttrans.getString("Complaint") %></td>
							<%
							try
							{
							%>
							<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate"))) %></font></td>
							<%
							}catch(Exception e)
							{
								out.println("-");	
							}
							
							%>
							<td><%=rsttrans.getString("VehAttLoc") %></td>
							<td><%=rst.getString("Technicion") %></td>
							<td><font color="red"><%=rst.getString("ActualProb") %></font></td>
							<%
							try
							{
							%>
							<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("PSolDate"))) %></font></td>
							<%
							}catch(Exception e)
							{
								out.println("-");	
							}
							
							%>
							<td><%=rsttrans.getString("RegBy") %></td>
							
							
						
						
						<%
						i++;
						}
						}
					}
					%>
					</tr>
						</table>
					<%
				
					
				}
	}
	
	else
	{

		
		%>
		<table border="1" width="100%" align="center" class="sortable">
		<tr>
		<td><b>Sr.</b></td>
		<td><b>Transporter</b></td>
		<td><b>Vehicle Reg. No</b></td>
		<td><b>Unit ID</b></td>
		<td><b>Updated</b></td>
		<td><b>Location</b></td>
		<td><b>Date Of Allocation</b></td>
		<td><b>Date Of Complaint</b></td>
		<td><b>Complaint Description</b></td>
		<td><b>Available Date</b></td>
		<td><b>Available Location</b></td>
		<td><b>Allocated To Technician</b></td>
		<td><b>Status</b></td>
		<td><b>Entered By</b></td>
		</tr>
		
				
				
				<%
		
		sqltrans="select Distinct * from t_complaints1 where VehAvaildate >='"+fromdate+"' and VehAvaildate <='"+todate+"' group by VehicleNo order by VehAvaildate Desc ";	
		ResultSet rsttrans=st.executeQuery(sqltrans);
		//out.println(sqltrans);
		while(rsttrans.next())
		{	
			sql="select * from t_callocation1 where Tno='"+rsttrans.getString("Tno")+"' ";
			ResultSet rst=st1.executeQuery(sql);
			if(rst.next())
			{
				
				sql1="select * from t_onlinedata where VehicleRegNo='"+rsttrans.getString("VehicleNo")+"'";
				ResultSet rst2=st2.executeQuery(sql1);
				if(rst2.next())
				{

			%>
			<tr>
				<td><%=i %></td>
				<td><%=rsttrans.getString("Customer") %></td>
				<td><%=rsttrans.getString("VehicleNo") %></td>
				<td><%=rsttrans.getString("UnitNo") %></td>
				<td><font color="red"><%=rst2.getString("TheDate") %> <%=rst2.getString("TheTime") %></font></td>
				<td><font color="red"><%=rst2.getString("Location") %></font></td>
				<%
				try
				{
				%>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("TdyDate"))) %></td>
				<%
				}catch(Exception e){
					out.println("-");
				}
				try
				{
				%>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("CDate"))) %></td>
				<%
				}catch(Exception e){
					out.println("-");
				}
				%>
				<td><%=rsttrans.getString("Complaint") %></td>
				<td><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttrans.getString("VehAvaildate"))) %></font></td>
				<td><%=rsttrans.getString("VehAttLoc") %></td>
				<td><font color="red"><%=rst.getString("Technicion") %></font></td>
				<td><%=rst.getString("Status") %></td>
				<td><%=rsttrans.getString("RegBy") %></td>
				
				
			
			
			<%
			i++;
			}
			}
		}
		%>
		</tr>
			</table>
		<%
		
	
	}
	%>
	
	<%
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>