<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>

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
	<script type="text/javascript">
	function redirect()
	{
//	alert("in validation");
//	var a=document.unittransfer.cmnt.value;
//	alert(a);
//	var b=document.unittransfer.techlist.value;
//alert(b);
//	if(a=="")
//	{
//		alert("Please enter reason of delay");
//		return false;
//    }
//	else if(b=="Select")
//	{
//		alert("Please select technician");
//		return false;
//   }else{
	var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransfertotechnician.jsp?";
//	alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("tech"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&tech"+i+"="+document.getElementById("tech"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
//    }
	}
	
	function redirect1()
	{
	//alert("in validation");
		var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransferbycourier.jsp?";
	//alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("transp"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&transp"+i+"="+document.getElementById("transp"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
		
	}
	function submitUser(){
			
	       		 var listbox = document.resourceFrm.assigned;
	        		for(var count=0; count < listbox.options.length; count++) {
	            		listbox.options[count].selected = isSelect;
	    	
		}
	        document.resourceFrm.submit();
		}




	function addUser() {
	    var src = document.resourceFrm.resources;
	    var dest = document.resourceFrm.assigned;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function removeUser() {
	    var src =document.resourceFrm.assigned;
	    var dest =  document.resourceFrm.resources;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function show(id)
	{
		//alert(id);
		if(id==0)
		{
			document.getElementById("transfer").style.display="";
			document.getElementById("courierby").style.display='none';
			
		}
		else if(id==1)
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display="";
			
		}
		else
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display='none';
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
<!-- Checking request from tech type or not, and making headers available accordingly-->


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
              
<%
Connection con;
Statement st,st1,st2;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt88,stmt7,stmt10,stmt111,stmt13;
Class.forName(MM_dbConn_DRIVER);
con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con.createStatement();
st1=con.createStatement();
stmt1=con.createStatement();
stmt2=con.createStatement();
stmt3=con.createStatement();
stmt4=con.createStatement();
stmt5=con.createStatement();
stmt6=con.createStatement();
stmt88=con.createStatement();
stmt7=con.createStatement();
stmt10=con.createStatement();
stmt111=con.createStatement();
stmt13=con.createStatement();
String userrole=session.getAttribute("userrole").toString();
java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String today=formatter.format(dte);
String updated=request.getParameter("updated");
if(updated==null){
	
}else{
	%>
	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="black"> Selected Unit Id has already been received. </font> </td>
			</tr>
		</table>
	<%
}
String inserted=request.getParameter("inserted");
if(inserted==null){}else{
%>	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>	
		<td align="center"> <font color="black"> Selected Unit Id has already been transfer by courier. </font> </td>
	</tr>
</table>
<%
}

%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="black" size="3"> <b>Unit pending on technician</b></font> 
				</td>
				<td align="right">
					<a href='singleUnitTransferToTechnician.jsp'> <B> Do you know UnitID? </B></a>
				</td>
			</tr>
</table>
<form method="post" name="resourceFrm" action="unitTransferToTechnician3.jsp">

<table width="100%" border="1" cellpadding="4" cellspacing="0" class="std" >
<tr>
	<td valign="top" align="center">
		<table cellspacing="0" cellpadding="2" border="0" bgcolor="#77D7D4">
			<tr>

				<td><font color="black" ><b>Technician</b></font></td>
				<td><font color="black" ><b>Selected technician:</b></font></td>
			</tr>
			<tr>
				<td>
					
<select name="resources" style="width:380px" size="15" id="resources" >
	<%
	
	String sql="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
	ResultSet rs=st.executeQuery(sql);
	int i=0;
	while(rs.next()){
		%>
		<option value="<%=rs.getString("TechName")%>" ><%=rs.getString("TechName")%></option>
		<%
	i++;
	}
	
	%>
</select>
				</td>
				<td>
					
<select name="assigned" style="width:320px" size="15" multiple="multiple">
	
</select>

				</td>
				</tr>
					<tr>
						<td align="right"><input type="button" class="button" value="&gt;" onClick="addUser();" /></td>
						<td align="left"><input type="submit" class="submit" value="submit" onClick="submitUser()" /></td>				
						<td align="left"><input type="button" class="button" value="&lt;" onClick="removeUser()" /></td>					
					</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</form>
	<br></br>
	