<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1, con2;
%>


<%@page import="org.omg.PortableServer.ForwardRequest"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
function formsubmit()
{
	var aa=document.addgrpform.owner.value;
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
		document.addgrpform.vehcles[0].value = "Select";
		document.addgrpform.vehcles[0].selected = true;
		//alert(document.addgrpform.vehcles.value);
	}

}

function formsubmit2()
{

	var bb=document.addgrpform.vehcles.value;
	
	if(!(bb=="Select"))
	{	
		document.addgrpform.submit();
	}

}

function redirect()
{
	var owner=document.getElementById("owner").value;
	//alert(owner);
	if(owner=="Select"){
			alert("please select OwnerName");
			return false;
		}
	var vehcles=document.getElementById("vehcles").value;
	//alert(vehcles);
	if(vehcles=="Select"){
			alert("please select vehicle registration page");
			return false;
		}
	var grp=document.getElementById("grp").value;
	//alert(grp);
	if(grp=="Select"){
			alert("please select group");
			return false;
		}
	
	document.addgrpform.action="cnfrmgrp.jsp";
	document.addgrpform.submit();
	
}

function getVehicleByOwner(dropdown)
{
var vv1=dropdown.selectedIndex;

var lowerLimit = dropdown.options[vv1].value;
//alert ("lowerLimit----->"  + lowerLimit);

var ajaxRequest;

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



	ajaxRequest.onreadystatechange = function()
	{
     	if(ajaxRequest.readyState == 4)
         {
			
	         	var reslt=ajaxRequest.responseText;
	         //	alert ("reslt---->" +  reslt);
             	reslt=ajaxRequest.responseText;
             	document.getElementById("veh_group").innerHTML=reslt; 
            
         } 
	}
	
	
	  	var url="GetVehicleNumber.jsp";
       	url = url + "?TripID="+lowerLimit;
	    ajaxRequest.open("GET", url , true);
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
<form name="addgrpform" method="post" >
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Add Vehicle To Group</b>  </font></td>
		</tr>
</table>
<%
try
{//1 gps 
	//System.out.println(">>>>>addvehtogrp.....>>>>");
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmt3=con2.createStatement(), stmt4=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null,rs4=null, rs5=null;
	String sql="", sql1="", sql2="", sql3="",sql4="", sql5="";
	String tm="";

	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);

	tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();

	
	 String OwnerName=request.getParameter("owner");
	 ////System.out.println("OwnerName--->" + OwnerName);
	 String RegNo=request.getParameter("vehcles");
	 String insert=request.getParameter("inserted");
	 //System.out.println(">>>>insert value>>>.>"+insert);
	 
	
	if(insert==null){

		}else{
		%> 
		 	 
	 <script type="text/javascript">
	  alert("Inserted Sucessfully");
	  window.location = "addvehtogrp.jsp";
		  
   </script>
		 	
		<%
		}
	 
 
		
	%>
 
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">

 <tr bgcolor="#BDBDBD">
       <td> <font color="black"> <b>Owner Name:</b> </font> </td>
       <td colspan="3">
       
      	 <select name="owner" id="owner" onchange="formsubmit();"> 
         <option value="Select">Select</option>
          <%
 			if(!(null==OwnerName))
 			{
 				%>
 		       
 					<option value="<%=OwnerName %>" selected="selected"><%=OwnerName %></option>
 				 <%
 			}
 		%>
        <%
        sql="select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName not like '%del' order by OwnerName";
        rs1=stmt2.executeQuery(sql);
        while(rs1.next())
   	   { %>
      		<option value="<%=rs1.getString("Transporter") %> "> <%=rs1.getString("Transporter") %> </option>
	<% } %>
		</select> 
		
   	   </td>
 </tr>
 
   <tr bgcolor="#BDBDBD">
         <td>  <font color="black"><b>Vehicles :</b> </font> </td>
      <td> <select name="vehcles" id="vehcles" onchange="getVehicleByOwner(this);">
           <option value="Select">Select</option>
      
	   <%
	   sql="select Distinct(VehicleRegNumber) from t_vehicledetails where OwnerName='"+OwnerName+"' and Status='-' order by VehicleRegNumber ";
	   rs2=stmt2.executeQuery(sql);
	   while(rs2.next())
   	   { %>
      		<option value="<%=rs2.getString("VehicleRegNumber") %> "> <%=rs2.getString("VehicleRegNumber") %> </option>
	<% } %>
     		
	    </select></td>
	    
	       <td>  <font color="black">Selected Vehicle Available in Group/s : </font> </td>
           <td><div id="veh_group">  </div></td>
		   
          
  </tr>
  <tr bgcolor="#BDBDBD">
  	<td>  <font color="black"><b>Groups :</b> </font> </td>
     <td colspan="3"> <select name="grp" id="grp">
           <option value="Select">Select</option>
	   <%
	  // String OwnerName=request.getParameter("owner");
		////System.out.println(OwnerName);
	   sql="select Distinct(GPName) as grp from t_group where GPName not like '%del' order by GPName";
	   ////System.out.println("sql----->" +  sql);
	  	String str = "select Distinct(GPName) as grp from t_group where GPName not like '%del' where GPName Not In (select Distinct(GPName) from t_group where transporter='"+RegNo+"') order by GPName"; 
	   ////System.out.println("str--->" +str);
	  	rs2=stmt2.executeQuery(sql);
	   while(rs2.next())
   	   { %>
      		<option value="<%=rs2.getString("grp") %> "> <%=rs2.getString("grp") %> </option>
	<% } %>
     		
	    </select></td>
  	
  </tr>
   <tr>
	<td colspan="4" align="center"><input type="button" name="Submit" value="Submit" class="formElement" onclick="redirect();"></td>
	
  </tr>
</table>

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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
