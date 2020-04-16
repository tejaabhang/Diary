<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%-- <%@ include file="headernew.jsp"%> --%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
<%--  <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%> 

	<%@ include file="header.jsp" %> 
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

</head>
<head>
<style type="text/css">
#edit 
    

{ 
background-color: #d9d9d9;
}
</style>
</hesd>
<script LANGUAGE="JavaScript">

function fun()
{
	//alert("Hi");
	
	
var name=document.getElementById("Name").value;
//alert(name);
var invalid=/[^A-Za-z\s]/;
var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
//if(name=="" || oth==""){
	//document.getElementById("lblNameMsg1").style.display="";
		//return false;
	//}
if(invalid.test(name)){
 //document.getElementById("lblNameMsg2").style.display="";
 alert("Please Enter Character Value For Name");
	     return false;
	 }	

	

	var contact=document.getElementById("firstName").value;
	//alert(contact);
		 if(isNaN(contact))
			{
				//document.getElementById("lblMoNoMsg1").style.display="";
				alert("Please Enter Numeric Value For Driver Number");
				return false;
			}	
			 if((contact.trim().length < 10)  || (contact.trim().length >15))
				 {
				 //document.getElementById("lblMoNoMsg2").style.display="";
				 alert("Mobile No Should Be Greater Than 9 Digits and Less Than 15 Digits");
	        return false;
	    }
	}
	function validate()
	{
		
		
		
		
		var empCode=document.editEmpName.empCode.value;
		var mobileNo=document.editEmpName.mobileNo.value;

		
		if(firstName.length==0)
	     {
	         alert("Please enter first name");
	         return false;
	     } 

		if(lastName.length==0)
	     {
	         alert("Please enter last name");
	         return false;	
	     }
		
		
	
	
	}

function validateName()
{
	document.getElementById("lblNameMsg1").style.display="none";
	document.getElementById("lblNameMsg2").style.display="none";	
var name=document.getElementById("Name").value;
var invalid=/[^A-Za-z\s]/;
var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
//if(name=="" || oth==""){
	//document.getElementById("lblNameMsg1").style.display="";
		//return false;
	//}
if(invalid.test(name)){
 document.getElementById("lblNameMsg2").style.display="";
	     return false;
	 }	
}

function validateContact()
{
	document.getElementById("lblMoNoMsg1").style.display="none";
	document.getElementById("lblMoNoMsg2").style.display="none";
	document.getElementById("lblMoNoMsg3").style.display="none";	
	
		var contact=document.getElementById("firstName").value;
		
			 if(isNaN(contact))
				{
					document.getElementById("lblMoNoMsg1").style.display="";
					return false;
				}	
				 if((contact.trim().length < 10)  || (contact.trim().length >15))
					 {
					 document.getElementById("lblMoNoMsg2").style.display=""; 
		        return false;
		    }
		
}
	
</script>
</head>
<body>
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
 
		<form name="editEmpName" action="insertEditDriver.jsp" onSubmit=" return fun();">
<div id=edit  >
		<table border="0" width="50%" align="center"  class="sortable_entry">
			<tr>
		<td colspan="2">
		<div align="center" ><font size="3"> <b>
		Edit Driver Details </b> </font> 
		</div>

		</td>
		</tr>

<%!Connection conn, conn1;%>
<%

String vehcode=request.getParameter("vehcode");


Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt=conn1.createStatement();
Statement stmt2=conn1.createStatement();
ResultSet st, rst2;

String empname="", vehiclecode="", FirstName="", LastName="", Vehid="", empCode="", MobilePhNo="", vehtype="";

String sql="select Empname,Empcode from t_vehicledetails where vehiclecode="+vehcode+"  limit 1 ";
System.out.println(" sql 1 "+sql);
ResultSet rs=stmt.executeQuery(sql);
int i=0;
while(rs.next())
{
		 empname=rs.getString("Empname");
		 
		 empCode=rs.getString("Empcode");
		 
		 System.out.println(" empName "+empname+" vehiclecode "+vehiclecode+ " Empcode"+empCode);
}


%>	

<input type="hidden" id="vehcode" name="vehcode" value="<%= vehcode %>" > </input>
		<tr>
				<td>
				</td>
		</tr>
		<tr>
				<td><font size="2"><b> Driver Name    </b> </font></td>
				<td><input type="text" name="Name"  id ="Name" size="25"  value="<%= empname %>">
				<!-- <label id="lblNameMsg1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Name</font></label> -->
				<label id="lblNameMsg2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Character Value For Name..</font></label>
				 </td>
	   </tr>
		
		<tr>
				<td><font size="2"><b> Contact No    </b> </font>  </td>
				<td><input type="text" name="firstName"  id ="firstName" size="25"  value="<%=empCode%>">
				<label id="lblMoNoMsg1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value For Mobile Number</font></label>
				<label id="lblMoNoMsg2" style="display: none;"><font face="Arial" size="2" color="red">Mobile No Should Be Greater Than 9 Digits and Less Than 15 Digits</font></label>
				 </td>
	   </tr>
	   
	   
	   <tr>
         		<td></td>
         		<td  >  <input type="submit" name="Submit" value="Submit"  /> 
         		
  	   </tr>
	
		</table>
</div>
</form>
	
	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
		
		
</body>
</html>
	 <%-- </jsp:useBean> --%> 


