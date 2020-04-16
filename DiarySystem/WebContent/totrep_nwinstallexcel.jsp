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
	System.out.println("--excel-->"+thename );
	
	
	System.out.println("Hiiiiiiiiiiiiii    ..<<>>>>>  sql--excel-->"+thename );
	
	
	%>
	<%
	if(!(null==thename))
	{
		if(thename.equals("ALL"))
		{ 
	
	
	
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">New Unit Installation report for All Representatives from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	
	<td><b>Transporter</b></td>
	<td><b>VehRegNo.</b></td>
	
	<td><b>Date</b></td>
	<td><b>New Unit Id</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Technician</b></td>
	<td><b>Place</b></td>
	<td><b>Ent. By</b></td>
	</tr>
	</tr>
	<%
		sql="select * from t_unitreplacement where  InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New' and  EntBy in (select name from db_CustomerComplaints.t_admin where URole='service' OR URole = 'SuperTech' and Active ='yes') ";
		ResultSet rst=st2.executeQuery(sql);
		System.out.println("sql--ut total-->" +  sql);
		int i=1;
		while(rst.next())
		{
		//sql="select * from t_techlist where TechName='"+rst.getString("InstBy")+"' and Available='Yes'";
		//ResultSet rst1=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		%>
		<tr>
		<td align ="right"><%=i%></td>
		<td align ="left"><%=rst.getString("OwnerName")%></td>
		
		<td><%=rst.getString("VehRegNo")%></td>
				
		<td align ="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstDate"))%></td>
		<td align ="right"> <div align="right"><%=rst.getString("NewUnitId")%></div></td>
		
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("InstDate")+"' or TheDate < '"+rst.getDate("InstDate")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
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
		
		
		<td align ="left"><%=rst.getString("InstBy")%></td>	
	   <td align ="left"><%=rst.getString("InstPlace")%></td>
	      <td align ="left"><%=rst.getString("EntBy") %></td>
		</tr>		
		<%
		i++;
		
		}	
		}
		else
		{
		%>	<table border="0" width="750px" align="center">
			<tr><td align="center"><font color="brown" size="2">New Unit Installation report of <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
			<tr><td>
			<table border="1" width="100%" align="center" class="sortable">
			<tr>
			<td><b>Sr.</b></td>
			
			<td><b>Transporter</b></td>
			<td><b>VehRegNo.</b></td>
			
			<td><b>Date</b></td>
			<td><b>New Unit Id</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Technician</b></td>
			<td><b>Place</b></td>
			<td><b>Ent. By</b></td>
			</tr>
			</tr>
			<%
				sql="select distinct(VehRegNo) as VehRegNo,EntBy,OwnerName,InstDate,NewUnitId,InstBy,InstPlace from t_unitreplacement where InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New' and EntBy in (select name from db_CustomerComplaints.t_admin where URole='service' OR URole = 'SuperTech' and Active ='yes') group by VehRegNo";
				ResultSet rst=st2.executeQuery(sql);
				System.out.println("sql---->" +  sql);
				int i=1;
				while(rst.next())
				{
				sql="select * from t_techlist where TechName='"+rst.getString("InstBy")+"' and Available='Yes'";
				ResultSet rst1=st.executeQuery(sql);
				if(rst1.next())
				{
				%>
				<tr>
				<td align ="right"><%=i%></td>
				<td align ="left"><%=rst.getString("OwnerName")%></td>
				
				<td align ="right"><%=rst.getString("VehRegNo")%></td>
						
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstDate"))%></td>
				<td align ="right"><div align="right"><%=rst.getString("NewUnitId")%></div></td>
				
			<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("InstDate")+"' or TheDate < '"+rst.getDate("InstDate")+"') order by TheDate Desc";
					ResultSet rst11=st3.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(rst11.next())
					{
			%>
						<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
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
				
				
				<td align ="left"><%=rst.getString("InstBy")%></td>	
			   <td align ="left"><%=rst.getString("InstPlace")%></td>
			    <td align ="left"><%=rst.getString("EntBy") %></td>
				</tr>		
				<%
				i++;
				}
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
