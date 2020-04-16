<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole1,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String userrole4="";
%>
<%
 userrole4=session.getAttribute("userrole").toString();

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
function AJAXFunc()
{
  
  var v1=document.form1.callertype.value;
  var trans=document.form1.transporter.value;
  //alert(v1);

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

                      document.getElementById("divmain").innerHTML=reslt; 	       }
            }
            
  
      var queryString = "?typevalue=" +v1+"&trans="+trans;
 	   ajaxRequest.open("GET", "Ajaxgetinfo.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}

function validate()
{
	//alert("hi atul");
	var aa=document.form1.callertype.selectedIndex;
	//alert(aa);
	if(aa==0)
	{
		alert("Please Select Caller/Reciver Type");
		return false;
	}
	if(document.form1.callername.value=="Select")
	{
		alert("Please Select Caller Name");
		return false;
	}
	if(document.form1.callinformation.value=="")
	{
		alert("Please Enter Call Information");
		return false;
	}
	
	return true;
}
function fun1()
{
	
	var selObj = document.form1.callertype;
	selObj.selectedIndex = 0;
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
          
           <%
        if(userrole4.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
          
        
         </div>
          <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
%>
<table border="10" width="750px">
<tr><td>
<center><font color="moon" size="3">Call Capture Screen</font></center>
<center><%
String ss=request.getParameter("err");
if(!(null==ss))
{
out.print("Inserted Successfully");
}
%></center>
</td></tr>
<tr><td> 
<form name="form1" method="post" action="insertcallinfo.jsp" onSubmit="return validate();">
<table border="1" width="450px" align="center">
<tr><td>Call Type :</td>
<td>
<input type="radio" name="calltype" value="InComing" checked > INCOMING<br>
<input type="radio" name="calltype" value="OutGoing" > OUTGOING<br>
<input type="radio" name="calltype" value="NotCalled" >NOT CALLED<br>	
</td></tr>
<tr><td>Transporter :</td>
<td>
<%
sql="select  distinct(TypeValue)  from db_gps.t_transporter where ActiveStatus='Yes' order by TypeValue";
ResultSet rstx=st1.executeQuery(sql);
%>
<select name="transporter" class="formElement" onchange="fun1();">
<%
while(rstx.next())
{
%>
<option value='<%=rstx.getString("TypeValue")%>'><%=rstx.getString("TypeValue")%></option>
<%
}
%>
</select>
</td>
</tr>
<tr><td>Caller/Reciver Type :</td>
<td>
<select name="callertype" class="formElement" onchange="AJAXFunc();">
<option value="Select" Selected>Select</option>
<option value="Transporter">Transporter</option>
<option value="Technician">Technician</option>
</select>
</td></tr>
<tr><td>Caller/Reciver Name :</td>
<td>
<div id="divmain">
<select name="callername" id="callername" class="formElement">
<option value="Select">Select</option>
</select>
</div>
<div><a href="addcontact.jsp"><font color="red">Not in list click to add contact.</font></a></div>
</td>
</tr>
<tr><td>Call Information :</td>
<td>
<textarea rows="2" cols="20" name="callinformation">
</textarea>
</td>
</tr>
<tr><td colspan="2" align="center"><input type="submit" name="Submit" value="Submit" class="formElement"></td></tr>
</table>
</form>
</td></tr>
</table>
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
<table border="0" width="750px" height="350px">
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
