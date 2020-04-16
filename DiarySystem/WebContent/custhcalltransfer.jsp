<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,caller;
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
caller="All Customer";
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
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="3">Outgoing calls to <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Transporter</b></td>
	<td><b>Caller</b></td>
	<td><b>Reciever</b></td>
	<td><b>Date</b></td>
	<td><b>Time</b></td>
	
	<td><b>Comment</b></td>
	<td><b>Reason Of Call</b></td>
	<td><b>Vehicle Tracking</b></td>
	<td><b>FleetView</b></td>
	<td><b>Sales Followup</b></td>
	</tr>
	<%
		sql="select * from db_CustomerComplaints.t_callinformation where Reciever in(select distinct(OwnerName)as OwnerName from db_gps.t_vehicledetails where status='-' order by OwnerName Asc) and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='Call Transfer'";
		ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td><%=i%></td>
	<td><%=rst.getString("Transporter")%></td>
	<td><%=rst.getString("Caller")%></td>
	<td><%=rst.getString("Reciever")%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TheDate"))%></td>
	<td><%=rst.getString("TheTime")%></td>
	
	<td><%=rst.getString("CallInfo")%></td>
	<td><%=rst.getString("reasonOfCall")%></td>
	<td><%=rst.getString("vehicleTracking")%></td>
	<td><%=rst.getString("FleetView")%></td>
	<td><%=rst.getString("salesFollowup")%></td>
	</tr>		
		<%
		i++;
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
