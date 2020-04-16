<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,cust;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
	<script language="javascript">
	function fun2()
	{	
		document.form1.submit();
	}	
	</script>
	</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <p></p>
          <%@ include file="header1.jsp" %>
          </div>
                   
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
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
cust="All Customer";
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
	
	
	thename=request.getParameter("radio1");
	if(null==thename)
	{
	
	thename="ALL";
	}
	
	%>
	
	<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" value="ALL" <% if(thename.equals("ALL")) { out.print("CHECKED"); } %> onclick="fun2();" >ALL
				<input type="radio" name="radio1" value="Distinct" <% if(thename.equals("Distinct")) { out.print("CHECKED"); } %> onclick="fun2();">Distinct
								
								
				</td>
				
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="custnewinstallexcel.jsp?thename=<%=thename%>&fromdate=<%=fromdate %>&todate=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				
				</tr>
								
				</table>	
				</form>	
	
	
	<%
	if(!(null==thename))
	{
		if(thename.equals("ALL"))
		{ 
	
	
	
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">New Unit Installation report of <%=cust%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
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
	</tr>
	<%
		sql="select * from t_unitreplacement where InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New' order by InstDate Desc";
		ResultSet rst=st2.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		sql1="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc";
		ResultSet rst1=st3.executeQuery(sql1);
		if(rst1.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		
		<td><%=rst.getString("OwnerName")%></td>	
		<td><%=rst.getString("VehRegNo")%></td>
		
		<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstDate"))%></td>
		<td><div align="right"><%=rst.getString("NewUnitId")%></div></td>
		
		<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("InstDate")+"' or TheDate <'"+rst.getDate("InstDate")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td><font color="Red"><%=rst11.getString("Location") %></font></td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
		
		
		<td><%=rst.getString("InstBy")%></td>	
	   <td><%=rst.getString("InstPlace")%></td>
		</tr>		
		<%
		i++;
		}
		}
		}
		else
		{
		%>	
			<table border="0" width="750px" align="center">
			<tr><td align="center"><font color="brown" size="2">New Unit Installation report of <%=cust%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
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
			</tr>
			<%
				sql="select distinct(VehRegNo) as VehRegNo,OwnerName,InstBy,InstDate,NewUnitId,InstPlace from t_unitreplacement where InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New' group by VehRegNo order by InstDate Desc";
				ResultSet rst=st2.executeQuery(sql);
				int i=1;
				while(rst.next())
				{
				sql1="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc";
				ResultSet rst1=st3.executeQuery(sql1);
				if(rst1.next())
				{
				%>
				<tr>
				<td><%=i%></td>
				
				<td><%=rst.getString("OwnerName")%></td>	
				<td><%=rst.getString("VehRegNo")%></td>
				
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstDate"))%></td>
				<td><div align="right"><%=rst.getString("NewUnitId")%></div></td>
				
				<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("InstDate")+"' or TheDate <'"+rst.getDate("InstDate")+"') order by TheDate Desc";
					ResultSet rst11=st3.executeQuery(sql);
					if(rst11.next())
					{
			%>
						<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
						<td><font color="Red"><%=rst11.getString("Location") %></font></td>
			<%		}
					else
					{
						%>
						<td>-</td>
						<td>-</td>
			<%
					}
					
			%>
				
				
				<td><%=rst.getString("InstBy")%></td>	
			   <td><%=rst.getString("InstPlace")%></td>
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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
