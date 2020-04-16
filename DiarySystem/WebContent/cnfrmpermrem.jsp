<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
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

<script language="javascript" >

</script>
</head>

<body>
  <form name="removeunitform" method="get" action="removeunitinsrt.jsp" onsubmit="return validate();">
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
<form name="removeunitform" method="get" action="removeunitinsrt.jsp" onsubmit="return validate();">
<%
try
{
String 	transp=request.getParameter("owner");
String 	vehno=request.getParameter("vehreg");
String 	unitid=request.getParameter("unid");
String 	oldunitwth=request.getParameter("techname");
String 	comment=request.getParameter("cmnt");
%>	

<input type="hidden" name="owner" value="<%=transp%>"  />
<input type="hidden" name="vehreg" value="<%=vehno%>" />	
<input type="hidden" name="unid" value="<%=unitid%>" />
<input type="hidden" name="techname" value="<%=oldunitwth%>" />
<input type="hidden" name="cmnt" value="<%=comment%>" />

<center>
<table border="0" width="750px" >
<tr>
	<td> <font color="maroon"> Note: If below given details are wrong, please click <a href="javascript:history.go(-1)"> Here </a> </font> </td>
</tr>
<tr>
   <td> <div align="center">
	<table border="10" width="450px" >
		<tr>
			<td colspan="4"><div align="center"><font color="brown" size="3"> <B> Confirm Records</B> </font></div></td>
		</tr>
		<tr> <td> <font color="maroon"> Transporter: </font> </td>
  			<td> <%=transp%> </td>
		</tr> 
		<tr> <td> <font color="maroon"> Vehicle No.: </font> </td>
  			<td> <%=vehno%> </td>
		</tr>  
		<tr> <td> <font color="maroon"> Unit Id: </font> </td>
  			<td> <%=unitid%> </td>
		</tr> 
		<tr> <td> <font color="maroon"> Old Unit Id: </font> </td>
  			<td> <%=oldunitwth%> </td>
		</tr> 
		<tr> <td> <font color="maroon"> Comment: </font> </td>
  			<td> <%=comment%> </td>
		</tr> 
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Update" class="formElement" /> </td>
		</tr>    
	</table>
 </div> </td>	
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
