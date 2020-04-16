<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
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
     
     var own=document.newcustaddform.ownname.value;
     var uid=document.newcustaddform.uid.value;
     var pass=document.newcustaddform.pass.value;
     var cpass=document.newcustaddform.cpass.value;
     

     if(own.length=="")
     {
       alert("Please enter Owner Name");
       return false;
     }

     if(uid.length=="")
     {
       alert("Please enter User Id");
       return false;
     }

     if(pass.length=="")
     {
       alert("Please enter Password");
       return false;
     }
  
     if(cpass.length=="")
     {
       alert("Please enter Confirm Password");
       return false;
     }

     if(!(pass==cpass))
     {
       alert("Two Password's doesn's match");
       return false;
     }
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
 <%
			
			java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String s=formatter1.format(d);
			//out.print(s);
		%></li>
            </ul>
            <div class="clear"> </div>

          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="newcustaddform" method="get" action="newcustinsrt.jsp" onsubmit="return validate();">
<% 
String chk=request.getParameter("i");
//out.println(chk);
if(chk==null)
  {}
else
  {
   %>
<table border="1" width="750px">
<tr> <td colspan="100%" class="bodyText"> <div class="bodyText" align="center"> <font color="red"><b>New Customer has been added Successfully </b></font> </div></td>
</tr>
</table>
<% }
%>  



<table border="0" width="750px" align="center">
 <tr> <td align="center">
<table border="0" width="350px" align="center"> 
<tr> <th colspan="2"><font color="#990000"  size="2"> <b> <u> Add Customer Details </u> </b> </font>
</th> </tr>

<tr>
  <td width="50%"> 
<b><font color="#990000"> Name: </font> </b> </td>
  <td>
<input type="text" name="ownname" class="formElement"> </input> </td> </tr>
  <tr>
  <td width="50%"> 
<b><font color="#990000"> Type of User: </font> </b> </td>
<td>
    <select name="typusr" class="formElement">
       <option value="Transporter">Transporter  </option>
       <option value="GROUP">Group  </option>
    </select>
  </td>
</tr>

<tr>
 
 <td> 
 <b><font color="#990000">User Id: </font> </b> </td>
<td>
  <input type="text" name="uid" class="formElement"> </input> </td> </tr>
<tr>
  <td> 
<b><font color="#990000">Password: </font> </b> </td>
<td>
  <input type="password" name="pass" class="formElement"> </input> </td>
</tr>

<tr>
  <td> 

<b><font color="#990000"> Confirm Password: </font> </b> </td>
<td>
  <input type="password" name="cpass" class="formElement"> </input> </td>
</tr> 
 

<tr>
   <td colspan="2"><center> <input type="submit" name="submit" value="Submit" class="formElement"> </input> </center>
   </td>
</tr>
</table>

  </td> </tr> </table>

</form>

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
