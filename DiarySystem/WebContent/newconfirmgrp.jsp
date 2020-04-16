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
<form name="addgrpform" action="insertgroup.jsp" method="post">
 <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<%
try
{	
	 String OwnerName=request.getParameter("owner");
	 String vehcles=request.getParameter("vehcles");
	 String gadd=request.getParameter("gadd");
	 
	%>

       <tr>
       		<td align="center" colspan="2">
       			<b>ADD GROUP</b>
       		</td>
       </tr>
  <tr bgcolor="#BDBDBD">
      <td> <font color="black"> Owner Name: </font> </td>
      <td><%=OwnerName %></td>
   
 
 </tr>
 
   <tr bgcolor="#BDBDBD">
      <td>  <font color="black">Vehicles : </font> </td>
      <td><%=vehcles %></td>
     
      
        </tr>

   <tr bgcolor="#BDBDBD">
     <td>  <font color="black">Groups : </font> </td>
     <td><%=gadd %></td>
    
 
  </tr>
  
  
  <tr>
	<td colspan="2" align="center">
	<input type="hidden" name="owner1" value="<%=OwnerName%>"></input>
 <input type="hidden" name="vehcles1" value="<%=vehcles%>"></input>
 <input type="hidden" name="gadd1" value="<%=gadd%>"></input>
	<input type="submit" name="Submit" value="Submit"></td>
 </tr>
 
</table>

 </form>
 
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>

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
