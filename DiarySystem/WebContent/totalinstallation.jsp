<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1>Transworld Compressor Technologies Ltd.</h1>
            <p>We care about your Vehicles</p>
          </div>
          <div id="nav">
            <ul>
              <li><a href="index.html">MAIN PAGE</a></li>
              <li><a href="http://www.myfleetview.com">TRACKING</a></li>
              <li><a href="http://www.mobile-eye.in/contact.html">CONTACT US</a></li>
		<li><a href="#">WELCOME </a><font color="red"><%=session.getAttribute("username").toString()%></font></li>
		<li><a href="logout.jsp">LOGOUT</a></li>
		<li><%
			
			java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String s=formatter1.format(d);
			out.print(s);
		%></li>
            </ul>
            <div class="clear"> </div>

          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
transporter=request.getParameter("transporter");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
Svehlist="(0";
%>
<center><font color="black" size="2">All Vehicle of <%=transporter %>.</font></center>
<p></p>
		<table border="1" width="750px" align="center" class="sortable">
<tr>
<th>Vehicle No</th>
<th>Updated</th>
<th>Location</th>
</tr>

<%
try
{
	Class.forName("org.gjt.mm.mysql.Driver");
	 conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	sql="select *  from db_gps.t_vehicledetails where OwnerName='"+transporter+"'";
	ResultSet rst=st1.executeQuery(sql);
	while(rst.next())
	{
	Svehlist=Svehlist+","+rst.getString("VehicleCode");
	}
	Svehlist=Svehlist+")";
	sql="select * from db_gps.t_onlinedata where Transporter='"+transporter+"' and VehicleCode in "+Svehlist;
	ResultSet rst1=st1.executeQuery(sql);
	while(rst1.next())
	{
	%>
	<tr>
	<td><%=rst1.getString("VehicleRegNo")%></td>
	<td><%=rst1.getString("TheDate")%> <%=rst1.getString("TheTime")%></td>
	<td><%=rst1.getString("Location")%></td>
	</tr>

        <%
	}
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();

}

%>
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
