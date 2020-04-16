<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String vid;
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
function validate()
{
	alert("Hi Dear !!!");
	return false;
}
function AJAXFunc()
{
  
  var v1=document.createlogin.usertype.value;
 // alert(v1);

  var ajaxRequest;  // The variable that makes Ajax possible!

     try{
 	        // Opera 8.0+, Firefox, Safari
 	 	ajaxRequest = new XMLHttpRequest();
        }  
        catch (e)
        {
 	        // Internet Explorer Browsers
 	        try
                 {
 	             ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 	        } 
                 catch (e)
                 {
 		    try
                     {
 		        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 		    } 
                     catch (e)
                     {
 		           // Something went wrong
 	                   alert("Your browser broke!");
 			   return false;
 	            }
 	        }
          }
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;
								//alert(reslt);
								document.getElementById("div1").innerHTML=reslt;
                      // Results from Ajaxunitadd.jsp are put into fields
		 	       }
            }
            
  
      var queryString = "?usertype=" +v1;
 	   ajaxRequest.open("GET", "getusertype.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}
function getTypeValue()
{
 var v1=document.createlogin.fullname.value;
 // alert(v1);

  var ajaxRequest;  // The variable that makes Ajax possible!

     try{
 	        // Opera 8.0+, Firefox, Safari
 	 	ajaxRequest = new XMLHttpRequest();
        }  
        catch (e)
        {
 	        // Internet Explorer Browsers
 	        try
                 {
 	             ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
 	        } 
                 catch (e)
                 {
 		    try
                     {
 		        ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
 		    } 
                     catch (e)
                     {
 		           // Something went wrong
 	                   alert("Your browser broke!");
 			   return false;
 	            }
 	        }
          }
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;
								//alert(reslt);
								document.getElementById("tyepvalue").value=reslt;
                      // Results from Ajaxunitadd.jsp are put into fields
		 	       }
            }
            
  
      var queryString = "?fullname=" +v1;
 	   ajaxRequest.open("GET", "ajaxGetTypeValue.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
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
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<table border="0" width="750px" align="center">
<tr><td align="center"><font color="brown" size="3"><b>Create New Login </b></font>
</td></tr>
<tr><td>
<form name="createlogin" action="" method="post" onsubmit="return validate();"> 
<table border="1" wodth="100%" align="center">
<tr><td><font color="brown" size="2">User Name :</font></td><td><input type="text" name="loginid" id="loginid"></td></tr>
<tr><td><font color="brown" size="2">User Type :</font></td>
<td><select name="usertype" id="usertype" onchange="AJAXFunc();">
<option value="Select">Select</option>
<option value="Transporter">Transporter</option>
<option value="GROUP">GROUP</option>
<option value="Subuser">SUBUSER</option>
</select></td></tr>
<tr><td><font color="brown" size="2">Full Name :</font></td><td><div id="div1"><select name="fullname" id="fullname"><option value="Select">Select</option></select></div></td></tr>
<tr><td><font color="brown" size="2">Type Value :</font></td><td><input type="text" name="tyepvalue" id="tyepvalue"></td></tr>
<tr><td align="center" colspan="2"><font color="brown" size="2"><input type="submit" value="Submit" name="Submit"></font></td></tr>
</table>
</form>
</td></tr>
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
