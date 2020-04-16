<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="Dailyreport_custcallocated.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,caller="";
%>

<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
caller=request.getParameter("tech");
fromdate=request.getParameter("fromdate");
todate=request.getParameter("todate");
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	
	
	thename=request.getParameter("thename");
	//System.out.println("--excel-->"+thename );
	
	
	//System.out.println("Hiiiiiiiiiiiiii    ..<<>>>>>  sql--excel-->"+thename );
	
	
	%>
	<%
	if(!(null==thename))
	{
		if(thename.equals("ALL"))
		{ 
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Complaints pending by <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Allocation Date</b></td>
	<td><b>Vehicle Available Date </b></td>
	<td><b>Transporter</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Allocated By</b></td>
	<td><b>Status</b></td>
	</tr>
	<%
		sql="select * from t_callocation1 where Customer='"+caller+"'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' ) ";
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--pend excel- all->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td align ="right"><%=i%></td>
		<td align ="right"><%=rst.getString("Tno")%></td>
		<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
		<%
		try
		{
		%>
		
		<td align ="right"><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvailDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>
	<td align ="right"><%=rst1.getString("Customer")%></td>
	<td ><%=rst.getString("VehRegNo")%></td>
	
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate <'"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td align ="right"><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td align ="left"><font color="Red"><%=rst11.getString("Location") %></font></td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
	
	<td align ="left"><%=rst1.getString("RegBy")%></td>
	<td align ="left"><%=rst.getString("Status") %></td>
	<%
		}
		else
		{
		%>
	<td>--</td>
	<td>--</td>
	<td>--</td>
	<%
		}	
	%>
		</tr>		
		<%
		i++;
		}
		}
		else
		{
			%>
			<table border="0" width="750px" align="center">
			<tr><td align="center"><font color="brown" size="2">Complaints solved by <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
			<tr><td>
			<table border="1" width="100%" align="center" class="sortable">
			<tr>
			<td><b>Sr.</b></td>
			<td><b>Tiket.No</b></td>
			<td><b>Allocation Date</b></td>
			<td><b>Vehicle Available Date </b></td>
			<td><b>Transporter</b></td>
			<td><b>VehRegNo.</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Allocated By</b></td>
			<td><b>Status</b></td>
			</tr>
			<%
				sql="select distinct(VehRegNo) as VehRegNo,Status,VehAvailDate,ActualProb,Tno,DofAllocation from t_callocation1 where Customer='"+caller+"' and   VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and  Tno in (select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')  group by VehRegNo";
				ResultSet rst=st.executeQuery(sql);
				//System.out.println("sql--pend excel distinct-->" +  sql);
				int i=1;
				while(rst.next())
				{
				%>
				<tr>
				<td align ="right"><%=i%></td>
				<td align ="right"><%=rst.getString("Tno")%></td>
				<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
				<%
		try
		{
		%>
		
		<td align ="right"><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvailDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
				<%
				sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
				ResultSet rst1=st1.executeQuery(sql);
				if(rst1.next())
				{
			%>
			<td align ="left"><%=rst1.getString("Customer")%></td>
			<td align ="left"><%=rst.getString("VehRegNo")%></td>
			
			<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate <'"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
					ResultSet rst11=st3.executeQuery(sql);
					if(rst11.next())
					{
			%>
						<td align ="left"><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
						<td align ="left"><font color="Red"><%=rst11.getString("Location") %></font></td>
			<%		}
					else
					{
						%>
						<td>-</td>
						<td>-</td>
			<%
					}
					
			%>
			
			<td align ="left"><%=rst1.getString("RegBy")%></td>
			<td align ="left"><%=rst.getString("Status") %></td>
			<%
				}
				else
				{
				%>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<%
				}	
			%>
				</tr>		
				<%
				i++;
				}
		}
	}
	else
	{
		
	}
	%>
	</table>
	</td></tr>
	</table>
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
		<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>

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
