<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>

<script language="javascript">
function validate()
{
	v1=document.changepass.curpass.value;
	v2=document.changepass.newpass.value;
	v3=document.changepass.confpass.value;
	v4=document.changepass.curpasschk.value;

   if(v1.length==0)
   {
      alert("Please enter your current password");
      return false;
   }
   if(v1!=v4)
   {
      alert("Entered current Password doesn't match with our records ");
      return false;
   }
   
   if(v2.length==0)
   {
      alert("Please enter new password");
      return false;
   }

   if(v3.length==0)
   {
      alert("Please confirm your password");
      return false;
   }
 
   if(v2!=v3)
   {
      alert("Text in New password and confirm password doesn't match");
      return false;
   }
      return true;
}
</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>

	
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

<form name="changepass" method="get" action="" onSubmit="return validate();">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	ResultSet rs1=null,rs2=null,rs3=null, rs4=null;
	String sql1="",sql,sql2,sql3, sql4;
	String user="", curpass="";

	String changed=request.getParameter("changed");
	if(changed==null)	
	{
	}
	else
	{ %>
		<table border="0" width="750px">
		  <tr>
		      <td> <div align="center">  <font color="maroon"> <U> Password changed successfully </U> </font> </div> </td>
  		</tr>
		</table>
<%	}
%>
		<table border="0" width="750px">
		  <tr>
		      <td> <div align="center">  <font color="maroon" size="3"> <B> Java Bean Test </B> </font> </div> </td>
  		</tr>
		</table>
<%
	 user=session.getAttribute("userid").toString();
%>
<input type="hidden" name="user" value="<%=user%>" />
<%	
	sql1="select * from t_admin where UName='"+user+"' ";
	
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
  		curpass=rs1.getString("pass");
	}
%>
<input type="hidden" name="curpasschk" value="<%=curpass %>" />
<table border="0" width="750px">
 <tr>
     <td> <div align="center">
	<table border="1" width="400px">
	  <tr>
	       <td> <font color="maroon"> <B> Current Password </B> </font> </td>
	       <td> <input type="password" name="curpass" class="formElement" /> </td>
	  </tr>
	       <td> <font color="maroon"> <B> New Password </B> </font> </td>
	       <td> <input type="password" name="newpass" class="formElement" /> </td>
	  </tr>      
	       <td> <font color="maroon"> <B> Confirm Password </B> </font> </td>
	       <td> <input type="password" name="confpass" class="formElement" /> </td>
	  </tr>
	  <tr>
	       <td colspan="2"> <div align="center"> <input type="submit" name="submit" 	value="Submit" class="formElement" /> </div> </td> 
	  </tr>
   	</table>
  </div> </td>
 </tr>
</table>



<% 
}catch(Exception e)
{ 
	out.print("Exception -->"+e);
	
}
finally
{
	con1.close();
}
%>
		
<table width="750px" height='350px">
<tr><td></td></tr>
</table>

<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  

</body>
</html>
<div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>


