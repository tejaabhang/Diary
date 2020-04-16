<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection con1;
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<!-- <script src="sorttable.js" type="text/javascript"></script>
	  <style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="bootstrap-datepicker.de.js" charset="UTF-8"></script>
	  -->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    

    <style>
.ui-datepicker {
    width: 17em;
    padding: .2em .2em 0;
    display: none;
    background:#846733; 
}
.ui-datepicker .ui-datepicker-title {
    margin: 0 2.3em;
    line-height: 1.8em;
    text-align: center;
    color:#FFFFFF;
    background:#846733; 
}
.ui-datepicker table {
    width: 100%;
    font-size: .7em;
    border-collapse: collapse;
    font-family:verdana;
    margin: 0 0 .4em;
    color:#000000;
    background:#FDF8E4;   
}
.ui-datepicker td {

    border: 0;
    padding: 1px;

   
}
.ui-datepicker td span,
.ui-datepicker td a {
    display: block;
    padding: .8em;
    text-align: right;
    text-decoration: none;
}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8" />
      <!-- Style sheet for default theme (flat azure) -->
      <style type="text/css" class="cssStyles">
   .control {
         margin: 0 auto;
         width: 210px;
   }
</style>
      <link href="http://cdn.syncfusion.com/16.4.0.42/js/web/flat-azure/ej.web.all.min.css" rel="stylesheet" />
      <!--Scripts-->
      <script src="http://cdn.syncfusion.com/js/assets/external/jquery-1.10.2.min.js"> </script>
      <script src="http://cdn.syncfusion.com/16.4.0.42/js/web/ej.web.all.min.js"></script>
      <!--Add custom scripts here -->
<script language="javascript">

function validate()
{
	var tech=document.techattend.tech.value;
	var loc=document.techattend.loc.value;
	var okayunits=document.techattend.okayunits.value;
	var faultyunits=document.techattend.faultyunits.value;
	var comment=document.techattend.comment.value;


	var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?abcdefghijklmnopqrstuvwxyz";



	if(tech=="Select")
	{
		alert("Please select Technician from the list");
		return false;
	}

	if(loc=="Select")
	{
		alert("Please select Location from the list");
		return false;
	}

	
	if(okayunits.length>=2)
	{
		for (var i = 0; i < okayunits.length; i++) 
		{
	  		if (iChars.indexOf(okayunits.charAt(i)) != -1) 
			{
			  	alert ("Special Characters / Alphabets are not allowed");
			  	return false;
	  		}
	  	}
	}	

	if(faultyunits.length>2)
	{
		for (var i = 0; i < faultyunits.length; i++) 
		{
	  		if (iChars.indexOf(faultyunits.charAt(i)) != -1) 
			{
			  	alert ("Special Characters / Alphabets are not allowed");
			  	return false;
	  		}
	  	}
	}			 	
	if(okayunits.length < 2)
	{
		alert("Please enter Okay Units");
		return false;
	}	
	/*if(isNaN(okayunits))
	{
		alert("Please enter proper integer value for no. of Okay Units");
		return false;
	}
*/
	if(faultyunits.length < 2)
	{
		alert("Please enter Faulty Units");
		return false;
	}	
	/*if(isNaN(faulty))
	{
		alert("Please enter proper integer value for no. of Faulty Units");
		return false;
	} 
	*/
	if(comment.length < 2)
	{
		alert("Please enter Comments");
		return false;
	}
	return true;
}

function GetLocForTech()
{
	var tech=document.techattend.tech.value;
	//alert(tech);

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
			     
			 var mySplitResult = reslt.split("$");
                        //var mySplitResult1=  mySplitResult[0]; 
                         //var mySplitResult2=  mySplitResult[1];
				//alert(mySplitResult[1]);
				document.getElementById("locations").innerHTML=mySplitResult[0];
				//document.getElementById("okayunits").innerHTML=mySplitResult[1];
				//document.getElementById("faultyunits").innerHTML=mySplitResult[3];
				document.getElementById("okunitprint").innerHTML=mySplitResult[1];
				document.getElementById("faultyunitprint").innerHTML=mySplitResult[3];
				
				document.getElementById("lastdetails").innerHTML=mySplitResult[5]; 				
		 		document.getElementById("dispdets").innerHTML=mySplitResult[6];	
				document.getElementById("recdetails").innerHTML=mySplitResult[7];
				document.getElementById("lastcommentprint").innerHTML=mySplitResult[8];

				//document.techattend.okayunits.value=mySplitResult[2];
				//document.techattend.faultyunits.value=mySplitResult[4];

				
					
				 			 			
        	        }
        	   }
               	   var queryString = "?tech=" +tech;
 		   ajaxRequest.open("GET", "Ajaxgetlocfortech.jsp" + queryString, true);
 		   ajaxRequest.send(null);   
}
</script>
<script>
$(function() {
	 
	 var oldDate = new Date("Thu Jan 01 1970 18:30:00 GMT +0000(IST)");
	 var date=new Date();
	 date.setHours(oldDate.getHours());
	 date.setMinutes(oldDate.getMinutes());
	 date.setSeconds(oldDate.getSeconds());
	 
	
	    var date1=new Date();
	  
	    date.setDate(date.getDate()-2 );
	  
	     date1.setDate(date1.getDate()); 
	    	   
	        	    
    $('#date_ex').ejDateTimePicker({
   	 
     dateTimeFormat: "dd-MMM-yyyy HH:mm:ss ",
      timePopupWidth: "150px",
     timeDisplayFormat: "HH:mm:ss",
     pickDate: false,
     pickSeconds: false,
     pick12HourFormat: false , 
     minDateTime:date,
     maxDateTime:date1,
     width: '200px'
  });
});      

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
        if(userrole1.equalsIgnoreCase("supertech"))
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
<form name="techattend" method="get" action="techattendinsrt.jsp" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
			</tr>
		</table>
<% 	}

	String alrdyinserted=request.getParameter("alrdyinserted");
	if(alrdyinserted==null)
	{
	}
	else
	{
		String tech=request.getParameter("tech");
 %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon">Today's Attendance for <%=tech%> has already been taken </font> </td>
			</tr>
		</table>
<% 	}
%>

<%	
	sql1="select distinct(TechName) as TechName from t_techlist where Available='Yes' order by TechName asc ";
	
	rs1=stmt1.executeQuery(sql1);
%>
	<table border="0" width="350px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Technician Attendance </b> </font> </td>
		</tr>
	</table>
	
<table border="0" width="750px" >
<tr> <td align="left">
	<table border="10" width="350px" >
		<tr>
			<td align="center"> <font color="maroon"> Tech:</font> </td>
			<td align="left"> <select name="tech" class="formElement" onChange="GetLocForTech();">
				<option value="Select">Select</option>
<%
		while(rs1.next())
		{ 
	
%>
			<option value="<%=rs1.getString("TechName")%>"><%=rs1.getString("TechName")%></option>		
	<%	}
%>
		</select> </td>
		</tr>
		<tr>
		  <td align="center"> <font color="maroon">Date </font></td>
		   <td align="left"> <!-- <input type="text" size="20" id="date_ex" name="Presentday" readonly="readonly"> -->
		   
      <div class="content-container-fluid">
   <div class="row">
      <div class="cols-sample-area">
         <div class="frame">
            <div class="control">
		   
    <input  type="text" id="date_ex" name="date_ex" ></input>
          

  </div>
         </div>
      </div>
   </div>
</div>
		 </td>  
		</tr>
		<tr>
<!-- 			<td align="center"> <font color="maroon"> Present:</font> </td>
 -->			<!-- <td align="left"> <input type="radio" name="present" value="Yes" checked>Yes</input> &nbsp;&nbsp;&nbsp;
			<input type="radio" name="present" value="No">No</input>
			<input type="radio" name="present" value="Half Day">Half Day</input> -->
			
						<td align="center"> <font color="maroon"> Status:</font> </td>
			
			<td align="left"> <input type="radio" name="present" value="IN" checked>CheckIn</input> &nbsp;&nbsp;&nbsp;
			<input type="radio" name="present" value="OUT">CheckOut</input>
			 </td>
		</tr>
		<tr>
			<td align="center"> <font color="maroon"> Holiday:</font> </td>
			<td align="left"> <input type="radio" name="holiday" value="Yes" >Yes</input> &nbsp;&nbsp;&nbsp;
			<input type="radio" name="holiday" value="No" checked>No</input>
			 </td>
		</tr>	
		
		<tr>
			<td align="center"> <font color="maroon"> LastDay Night Working:</font> </td>
			<td align="left"> <input type="radio" name="night" value="Yes" >Yes</input> &nbsp;&nbsp;&nbsp;
			<input type="radio" name="night" value="No" checked>No</input>
			 </td>
		</tr>
<%
	sql2="select * from t_location order by LName asc";
	rs2=stmt1.executeQuery(sql2);
%>
		<tr>
			<td align="center"> <font color="maroon"> Location:</font> </td>
			<td align="left"> <div id="locations">
			 <select name="loc" class="formElement">
		<option value="Select">Select</option>

<%
		while(rs2.next())
		{ %>
				<option value="<%=rs2.getString("LName")%>" > <%=rs2.getString("LName")%> </option>
<%		}
%>
				<option value="Home">Home</option>
			</select>
			</div> </td>
		</tr>
		<tr>
			<td align="center"> <font color="maroon"> Okay Units:</font> </td>
			<td align="left" id="okayunits"> <textarea name="okayunits" class="formElement"> </textarea>  
			
			 <div id="okunitprint"> </div> </td>  
		</tr>
		<tr>
			<td align="center"> <font color="maroon"> Faulty Units:</font> </td>
			<td align="left" id="faultyunits"> <textarea name="faultyunits" class="formElement"> </textarea>  
			<div id="faultyunitprint"> </div> </td>  
		</tr>
		<tr>
			<td align="center"> <font color="maroon"> Comment:</font> </td>
			<td align="left"> <textarea name="comment" class="formElement" > </textarea> 
			<div id="lastcommentprint"> </div>
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="2"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
		</tr>

	</table>
</td>
<td align="right">
	<div id="lastdetails"> </div>
</td>
</tr>
<tr>
	<td> <div id="dispdets"> </div> </td>
	
	<td align="right"> <div id="recdetails"> </div>
</td>
</tr>
</table>
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
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
   Copyright \A9 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>