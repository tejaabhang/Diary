<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
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
<form name="addgrpform" method="get" action="insrtgrp.jsp" onSubmit="return validate();">
<%
try
{	
	 String OwnerName=request.getParameter("owner");
	 String vehcles=request.getParameter("vehcles");
	 String grp=request.getParameter("grp");
	 
	%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Add Vehicle To Group</b>  </font></td>
		</tr>
</table>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
       <td> <font color="black"> <b>Owner Name:</b> </font> </td>
       <td><font color="black"><%=OwnerName %></font></td>
 </tr>
 
  <tr bgcolor="#BDBDBD">
      <td>  <font color="black"><b>Vehicles : </b></font> </td>
      <td><font color="black"><%=vehcles %></font></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Groups :</b> </font> </td>
     <td><font color="black"><%=grp %></font></td>
  </tr>
  	
  
  
  <tr>
	 <td colspan="2" align="center">
		 <input type="hidden" name=owner value="<%=OwnerName %>" />
	  	 <input type="hidden" name=vehcles value="<%=vehcles %>" />	
	     <input type="hidden" name=grp value="<%=grp %>" />	
		 <input type="submit" name="Submit" value="Submit" class="formElement" onclick="redirect();"/>
	 </td>
 </tr>
</table>

 

<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<!-- code end here --->

 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
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
