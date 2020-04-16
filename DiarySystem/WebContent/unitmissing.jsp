<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
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
    var ownname=document.unitmissingform.owner.value;
    var veh=document.unitmissingform.vehreg.value;
    var unid=document.unitmissingform.unitid.value;
    var cmnt=document.unitmissingform.cmnt.value;
     
     
 if(ownname=="Select")
     {
       alert("Please select Owner Name from the List");
       return false;
     }
     if(veh=="Select")
     {
       alert("Please select Vehicle Registration No.");
       return false;
     }

     if(unid.length=="")
     {
       alert("Please enter Unit Id");
       return false;
     }     
     
   if(cmnt.length<2)
	{
		 alert("Please enter your Comments");
	       return false;
	}
	return true;
     
}


function OnChangeFunc3(dropdown)
{
   var vv1=dropdown.selectedIndex;
   var SelValue1 = dropdown.options[vv1].value;
// alert(SelValue1);
   
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

        //  document.getElementById("mydiv").innerHTML="<select name='vehreg' id='vehreg'> " ;
                 // Create a function that will receive data sent from the server
               ajaxRequest.onreadystatechange = function()
               {
    		 if(ajaxRequest.readyState == 4)
                  {
                 	var reslt=ajaxRequest.responseText;
                         //alert(reslt);
                         document.getElementById("mydiv").innerHTML=reslt;
		  }
               }
           var queryString = "?owname=" +SelValue1;
	   ajaxRequest.open("GET", "Ajaxrepunit1.jsp" + queryString, true);
	   ajaxRequest.send(null); 
}


function AJAXFunc()
{
    var vehregno=document.unitmissingform.vehreg.value;

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
   			   document.unitmissingform.unitid.value = reslt;
                           
			}
        	}
        var queryString = "?vehregno=" +vehregno;
	ajaxRequest.open("GET", "Ajaxrepunit.jsp" + queryString, true);
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
          <p></p>
         <%@ include file="header1.jsp" %>
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
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";

		sql1="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='Transporter' order by TypeValue";
	rs1=stmt1.executeQuery(sql1);
		
%>
<form name="unitmissingform" method="get" action="unitmissinginsrt.jsp" onsubmit="return validate();">
	
<%
	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				 <td> <div align="center"> <font color="maroon"> Successfully Inserted!</font> </div> </td>
			</tr>
		</table>
<%	}
	
	String alrdydone=request.getParameter("alrdydone");
	if(alrdydone==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				 <td> <div align="center"> <font color="maroon">  Entry already done!</font> </div> </td>
			</tr>
		</table>
<%	}
%>
<table border="0" width="750px">
<tr> <td> <div align="center">	
	<table border="10" width="450px" align="center">
		<tr>
			<th colspan="2" align="center"> <font color="maroon" size="2"> Unit Missing Details</font> </th>
		</tr>
		<tr>
			<th> <font color="maroon"> Transporter: </font> </th>
			<td> 
				 <select name="owner" onChange="OnChangeFunc3(this);" class="formElement"> 
		    		  <option value="Select"> Select </option>
<%
					while(rs1.next())
					{
%>
					   <option value="<%=rs1.getString("TypeValue") %>" > <%=rs1.getString("TypeValue") %> </option>
<% 
					} %>
%>
			     </select> 
			</td>
		</tr>
		<tr>
			<th>  <font color="maroon"> Vehicle Reg. No.:  </font>
			</th>
			<td>
 				<div id="mydiv">
					<select name="vehreg" class="formElement" onChange="AJAXFunc();">
					<option value="Select"> Select </option>
					 </select>

				</div> 
			</td>
		</tr>
		<tr>
			<th>  <font color="maroon"> Unit Id:  </font> </th>
			<td> <input type="text" name="unitid" class="formElement" size="8"  /> </td>
		</tr>
		<tr>
			<th>  <font color="maroon"> Comment:  </font> </th>
			<td> <textarea name="cmnt" class="formElement"> </textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /></td>
		</tr>
		
	</table>


</div>
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
	con2.close();
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
