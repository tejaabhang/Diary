<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1;
String sql,sql1,today,olddate,username,userrole;

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
		
function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}


function OnChangeFunc4(veh)
{
		var aa=veh.value;
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
                  var mySplitResult = reslt.split("#");
                  mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//trim
                  mySplitResult[1] = mySplitResult[1].replace(/^\s+|\s+$/g,"");//trim
                   		      		    document.form1.unitid.value = mySplitResult[0];
                                        document.form1.calender1.value = mySplitResult[1];
                 }
            }
            
  
           var queryString = "?veh=" +aa;
 	   ajaxRequest.open("GET", "Ajaxgetunitid.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}

function OtherComp()
{
	var aa=document.getElementById("comp").value; 
	if(aa=='Other')
	{
			document.form1.othercomp.style.visibility="visible";
	}
	else
	{  
			document.form1.othercomp.style.visibility="hidden";
			document.form1.othercomp.value="";
			

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
				document.form1.amount.value=reslt;
				document.getElementById("amnt").innerHTML=reslt;
        	         }
        	    }
            
 	
        	   var queryString = "?compltype=" +aa;
 		   ajaxRequest.open("GET", "Ajaxgetcomplamount.jsp" + queryString, true);
 		   ajaxRequest.send(null);   
	} 
	
}
function OtherLoc()
{
	var aa=document.getElementById("location").value;
	if(aa=='Other')
	{
			document.form1.otherloc.style.visibility="visible";
	}
	else
	{
			document.form1.otherloc.style.visibility="hidden";
	}
	
}
function OtherTech()
{
	var aa=document.getElementById("technician").value;
	if(aa=='Other')
	{
			document.form1.othertech.style.visibility="visible";
	}
	else
	{
			document.form1.othertech.style.visibility="hidden";
	}
	
}
function validate()
{
	if(document.form1.transporter.value=="Select")
	{
		alert("Please Select Transporter Name");
		return false;
	}
	if(document.form1.vehno.value=="Select")
	{
		alert("Please Select Vehicle Registration Number");
		return false;
	}
	
	if(document.form1.drivername.value=="")
	{
		alert("Please Enter Driver Name");
		return false;
	}
	if(document.form1.drivercode.value=="")
	{
		alert("Please Enter Driver Code");
		return false;
	}
	if(document.form1.unitid.value=="")
	{
		alert("Please Enter Unit ID");
		return false;
	}
	if(document.form1.comp.value=="Select")
	{
		alert("Please select Complaint Type");
		return false;
	}
	if(document.form1.comp.value=="Other")
	{
		if(document.form1.othercomp.value=="")
		{
		alert("Please Enter Complaint.");
		return false;
		}
	}
	if(document.form1.calender.value=="")
	{
		alert("Please Select Date");
		return false;
	}
	if(document.form1.location.value=="Other")
	{
		if(document.form1.otherloc.value=="")
		{
		alert("Please Enter Location.");
		return false;
		}
	}
	if(document.form1.technician.value=="Other")
	{
		if(document.form1.othertech.value=="")
		{
		alert("Please Enter Technician Name.");
		return false;
		}
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


<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);

long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	
	String trans="", vehno="", unitid="", tickno="", allocplace="", technician="", inserted="";
	
	trans=request.getParameter("trans");
	vehno=request.getParameter("vehno");
	tickno=request.getParameter("tickno");
	allocplace=request.getParameter("allocplace");
	technician=request.getParameter("technician");
	inserted=request.getParameter("inserted");
	
	String comptype =request.getParameter("comptype"); 
	String tid=request.getParameter("tid"); 
	String ticknonew=request.getParameter("tickno");
	
	String vid=request.getParameter("vehid"); 
	
	//System.out.println(">>>vid<<<"+vid);
%>

<input type="hidden" name="redirectto" value="specialreport11" />

		<table border="0" width="750px" align="center" bgcolor="#77D7D4">
			<tr>
				<td align="center"><font color="maroon" size="3"><i><u>Special Report</u></i></font>
				<div align="center">
				<%  
					if(!(null==trans))
					{
						out.print("<font color='red' size='1'>Inserted Sucessfully. Now enter details for Special Report </font>");
					}
					
				%></div>
				</td>
			</tr>
			</table>
		<br></br>	
<form name="form1" action="insertspecialreport.jsp" method="post" onsubmit="return validate();">
	<table class="sortable" border="1" width="750px" align="center">
  		<tr>
			<td><B>Ticket No :</B></td>
			<td> <%=tickno%> 
				<input type="hidden" name="tickno" value="<%=tickno%>" /></td>
 		 </tr>
 		 <tr>
			<td><B>Transporter :</B></td>
			<td> <%=trans%> 
				<input type="hidden" name="transporter" value="<%=trans%>" /></td>
		 </tr>
 		<tr>
			<td><B>Vehicle Reg.No :</B></td>
			<td> <%=vehno%> 
				<input type="hidden" name="vehno" value="<%=vehno%>" /></td>
		 </tr>
<%
				String sql2="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
				ResultSet rs2=st1.executeQuery(sql2);	
				if(rs2.next())
				{
					unitid=rs2.getString("UnitId");
				}
%>
		 <tr>
			<td><B>Unit Id :</B></td>
			<td> <%=unitid%> 
				<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" class="formElement"></td> 
 		</tr>
		 <tr>
			<td><B>Driver Name :</B></td>
			<td><input type="text" name="drivername" id="drivername" class="formElement"></td>
 		 </tr>
		 <tr>
			<td><B>Driver Code :</B></td>
			<td><input type="text" name="drivercode" id="drivercode" class="formElement"></td>
 		 </tr>
 		  <tr>
			<td><B>Complaint Type :</B></td>
 			<td> <div align="center">
<%
			sql="select * from t_specialcomp where CompStatus='Yes'";
			ResultSet rst2=st.executeQuery(sql);
%>
			<select name="comp" id="comp" class="formElement" onChange="OtherComp();">
				<option value="Select">Select </option>
<%		
				 while(rst2.next())
				{
%>
				<option value='<%=rst2.getString("Complaint")%>'><%=rst2.getString("Complaint")%></option>						
<%
				}			
%>		
				<option value="Other">Other</option>		
			</select>&nbsp;&nbsp;&nbsp;	
			<input type="hidden" name="othercomp" id="othercomp" class="formElement" style="visibility:hidden">
			</div>					
			</td>
 		</tr>
		<tr>
			<td><B>Amount :</B></td>
			<td> <div id="amnt"> </div> 
				<input type="text" name="amount" id="amount" class="formElement"></td>
 		</tr>	
 		<tr>
						<td><B>Email to Customer :</B></td>
						<td colspan="2" align="left"> 
							<input type="radio" name="emailtocust" value="Yes" >Yes
	   						 <input type="radio" name="emailtocust" value="No">No
	   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   						<b>Comment:</b> <textarea name="commentformail" cols="50" class="formElement"> </textarea>		
						</td>
					
					</tr>
					<tr>
						<td><B>Informed Customer Over Phone :</B></td>
						<td colspan="2" align="left"> 
							<input type="radio" name="phone" value="Yes" >Yes
	   						 <input type="radio" name="phone" value="No">No	
	   						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   						<b>Comment:</b> <textarea name="commentforphone" cols="50" class="formElement"> </textarea>		
						</td>
					
					</tr>
					<tr>
						<td><B> From Date :</B></td>
						<td>
							<input type="text" id="calender1" name="calender1" size="20" class="formElement" value=""/>
             					<script type="text/javascript">
             						Calendar.setup(
             						{
                 						inputField  : "calender1",         // ID of the input field
                 						ifFormat    : "%Y-%m-%d",     // the date format
                 						button      : "trigger1"       // ID of the button
             						}
                           			);
             					</script>
             			</td>
					</tr>
					<tr>
						<td><B> Found Date :</B></td>
						<td>
							<input type="text" id="calender" name="calender" size="20" class="formElement" value="" readonly/>
             					<script type="text/javascript">
             						Calendar.setup(
             						{
                 						inputField  : "calender",         // ID of the input field
                 						ifFormat    : "%Y-%m-%d",     // the date format
                 						button      : "trigger"       // ID of the button
             						}
                           			);
             					</script>
             			</td>
					</tr>
 		<tr>
			<td><B>Date :</B></td>
			<td>
				<input type="text" id="calender2" name="calender2" size="13" class="formElement" value="<%=today%>" readonly/>
         	    <input type="button" name="trigger" id="trigger" value="Date" class="formElement">
             		<script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "calender2",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
             		</script>
             </td>
 		</tr>
 		<tr>
			<td><B>Location :</B></td>
			<td>
				<%=allocplace%>
				<input type="hidden" name="location" value="<%=allocplace%>" />
			</td>
 		</tr>
 		<tr>
			<td><B>Technician :</B></td>
			<td>	<%=technician%>
					<input type="hidden" name="technician" value="<%=technician%>" />
			</td>					
 		</tr>	
 		<tr>
			<td> <B> Comment :</B> </td>	
			<td> <textarea name="comment" class="formElement"> </textarea>
			<input type="hidden" name="tid" value="<%=tid%>" />
			<input type="hidden" name="vehid" value="<%=vid%>" />
								<input type="hidden" name="comptype" value="<%=comptype%>" />
								<input type="hidden" name="vid" value="<%=vid%>" />
								
			 </td>
 		</tr>
 		<tr>
			<td colspan="2" align="center"><input type="submit" name="Submit" value="Submit" class="formElement"></td>					
 </tr>
 <tr>
	<td colspan="2" align="left"><font color="red" size="1"> <B> All Fields Are Mandatory </B> </font></td>					
 </tr>				
</table>
</form>


<%
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
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
