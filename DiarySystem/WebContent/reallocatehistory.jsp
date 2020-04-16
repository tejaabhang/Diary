<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1, con2;
%>
<html>
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

<script language="javascript" >
</script>
</head>

<body>
  <form name="reallocatehistory" method="post">
  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="";
int totmanufcnt=0, tottechcnt=0, totcustcnt=0, totunitcount=0;
String tno=request.getParameter("tno");
%>

	<table border="0" width="750px" align="center" bgcolor="#77D7D4">
		<tr>
			<td align="center"> <font color="black" size="3"> <B>Re-Allocation History For <%=tno%> </B> </font> </td>
		</tr>
	</table>
<br></br>
	<table width="100%" border="1"  class="sortable">
		
	
		<tr>
			<td>Srno</td>
			<td>TNo</td>
			<td>VehRegNo</td>
			<td>Transporter</td>
			<td>NewAvailableDate</td>
			<td>NewLocation</td>
			<td>NewTechnician</td>
			<td>AllocationDateTime</td>
			<td>OldAvailableDate</td>
			<td>OldLocation</td>
			<td>OldTechnician</td>
			<td>AllocatedBy</td>
			<td>Reason</td>
			<td>comment</td>
			<td>contact details</td>
		</tr>

<%
	int i=1;
	sql1="select * from t_reallocated where Tno='"+tno+"'";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		
%>
		<tr>
			<td> <%=i%> </td>
			<td><%=rs1.getString("Tno") %></td>
			<td><%=rs1.getString("VehRegNo") %></td>
			<td><%=rs1.getString("Transporter") %></td>
			<td><%=rs1.getString("NewAvailableDate") %></td>
			<td><%=rs1.getString("NewLocation") %> </td>
			<td><%=rs1.getString("NewTechnician") %></td>
			<td><%=rs1.getString("AlocationDateTime") %></td>
			<td> <%=rs1.getString("OldAvailableDate") %></td>
			<td><%=rs1.getString("OldLocation") %></td>
			<td><%=rs1.getString("OldTechnician") %></td>
			<td><%=rs1.getString("AllocatedBy") %> </td>
			<td><%=rs1.getString("Reason") %></td>
			<td><%=rs1.getString("comment") %></td>
			<td><%=rs1.getString("contactdetails") %></td>
</tr>
<%		i++;
	}	
%>
	
	</table>

<% 
 con1.close();
 con2.close();
  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
<!-- code end here --->
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</form>
</body>
</html>
