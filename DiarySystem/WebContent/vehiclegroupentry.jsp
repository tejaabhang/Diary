<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con, con2;
Statement stmt1,stmt2;
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script language="javascript">
	
function formsubmit()
{
	var aa=document.addgrpform.owner.value;
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
		document.addgrpform.owner[0].value = "Select";
		document.addgrpform.owner[0].selected = true;
		//alert(document.addgrpform.vehcles.value)f;
	}

}
function formsubmit1()
{
	var aa=document.addgrpform.owner1.value;
	alert(aa);
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
		document.addgrpform.owner1[0].value = "Select";
		document.addgrpform.owner1[0].selected = true;
		//alert(document.addgrpform.vehcles.value)f;
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
	if(owner=="Select"){
			alert("Please select owner name");
			return false;
		}
	var vehcles=document.getElementById("vehcles").value;
	if(vehcles=="Select"){
			alert("Please select vehicle registration number");
			return false;
		}
	var gadd=document.getElementById("gadd").value;
	if(gadd==" "){
			alert("Please insert group name");
			return false;
		}
	document.addgrpform.action="newconfirmgrp.jsp";
	document.addgrpform.submit();
	
}

function redirect1()
{
	var owner=document.getElementById("owner").value;
	if(owner=="Select"){
			alert("Please select owner name");
			return false;
		}
	var vehcles=document.getElementById("vehcles").value;
	if(vehcles=="Select"){
			alert("Please select vehicle registration number");
			return false;
		}
	var group=document.getElementById("group").value;
	if(group=="Select"){
			alert("Please select group");
			return false;
		}
	document.addgrpform.action="deletegroup.jsp";
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
	
		var url="getVehiclenum.jsp";
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
 
   <form name="addgrpform" method="post" action="" onSubmit="return validate();">
   <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Add/Delete Group</b>  </font></td>
		</tr>
	</table>

<%
   try
{
	    Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    stmt1=con.createStatement();
        stmt2=con.createStatement();
	    String sql,sql1; 
	    ResultSet rs1,rs2;
        String OwnerName=request.getParameter("owner");
        String RegNo=request.getParameter("vehcles"); 
        String thename=request.getParameter("radio1");   
        if(thename==null)
        {
       	 thename="add";
        }
          

%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td>
			 <input type="radio" name="radio1" value="add" <% if(thename.equals("add")) { out.print("CHECKED"); } %> onclick=""><b>ADDGroup</b>
			 <input type="radio" name="radio1" value="delete" <% if(thename.equals("delete")) { out.print("CHECKED"); } %> onclick=""><b>DeleteGroup</b>
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		     <input type="submit" name="Submit" value="Submit" class="formElement">
		</td>
	</tr>
    </table>   
    <input type="hidden" name="radioSeletected" id="radioSeletected" value="<%=thename%>">
    <br></br>      
<%
if(!(null==thename))
  {
  	 if(thename.equals("add"))
    	{    
%>
  <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
       <tr>
       		<td align="center" colspan="2">
       			<b>ADD GROUP</b>
       		</td>
       </tr>
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
        sql="select distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";
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
      <td> <select name="vehcles" id="vehcles">
           <option value="Select">Select</option>
      
	   <%
	   sql="select Distinct(VehicleRegNumber) from t_vehicledetails where OwnerName='"+OwnerName+"' order by VehicleRegNumber";
	   rs2=stmt2.executeQuery(sql);
	   while(rs2.next())
   	   { %>
      		<option value="<%=rs2.getString("VehicleRegNumber") %> "> <%=rs2.getString("VehicleRegNumber") %> </option>
	<% } %>
     		
	    </select></td>
  </tr>
  <tr bgcolor="#BDBDBD">
  	<td>  <font color="black"><b>Groups :</b> </font> </td>
     <td colspan="3"> <input type="text" name="gadd" id="gadd" value=" " ></input>
           
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
      		
	<% } %>
     		
	    
  	
  </tr>
   <tr>
	<td colspan="4" ><div align="center"><input type="button" name="Submit" value="Add"  onclick="redirect();"></input></div></td>
	
  </tr>
	    </table> 
  	  <% 
  	  }         
     else if(thename.equals("delete"))
     {           
%>
    <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
       <tr>
       		<td align="center" colspan="2">
       			<b>DELETE GROUP</b>
       		</td>
       </tr>
       <tr bgcolor="#BDBDBD">
       		<td> 
       			<font color="black"><b> Owner Name:</b> </font>
       		</td>
         	<td colspan="3">
        		 <select name="owner" id="owner" onChange="formsubmit();"> 
         			<option value="Select">Select</option>
<%
 			if(!(null==OwnerName))
 			{
%>
 		       
 					<option value="<%=OwnerName %>" selected="selected"><%=OwnerName %></option>
<%
 			}
        sql="select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName not like '%del' and status='-' order by OwnerName";
        rs1=stmt1.executeQuery(sql);
        while(rs1.next())
   	   { %>
      		<option value="<%=rs1.getString("Transporter") %> "> <%=rs1.getString("Transporter") %> </option>
	<% }
        
        
%>
		</select> 
		</td> 
  </tr>
 <tr bgcolor="#BDBDBD">
      <td>  <font color="black"><b>Vehicles :</b> </font> </td>
      <td> <select name="vehcles" id="vehcles" onChange="getVehicleByOwner(this);">
           <option value="Select">Select</option>
      
	   <%
	  
	   sql1="select Distinct(VehicleRegNumber),VehicleCode from t_vehicledetails where OwnerName='"+OwnerName+"' order by VehicleRegNumber";
	   rs2=stmt2.executeQuery(sql1);
	   while(rs2.next())
   	   { %>
      		<option value="<%=rs2.getString("VehicleCode") %> "> <%=rs2.getString("VehicleRegNumber") %> </option>
	<% }
     	
	    %>
     			</select></td>		  
	      </tr>
		  <tr bgcolor="#BDBDBD"> 
		 
	       <td>  <font color="black"><b>Selected Vehicle Available in Group/s :</b> </font> </td>
           <td><div id="veh_group">  </div></td>
	       </tr>
		 
   <tr>
	
	<td colspan="4" >
	<div align=center>
	<input type="button" name="Submit" value="Delete" onclick="redirect1();"></td>
	</div>
  </tr>
</table>
    	 
   <%     }
    	 
    
        	
        	
   }    	
        	
       	} 
catch(Exception e)
{
	out.println(e);
	}
finally
{
  con.close();	
}
%>
</div>
</form>
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








