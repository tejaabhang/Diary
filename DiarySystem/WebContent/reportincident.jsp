<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 

String userrole1="";
%>

<%
 userrole1=session.getAttribute("userrole").toString(); 
 System.out.println("the userrole 1 "+userrole1);

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
	function validate()
	{
	
	}
	function formsubmitt()
	{
	//alert("in formsubmit");	
		var dropdown=document.POST.dropdown.value;
	//	alert(dropdown);
		if(!(dropdown=="Select"))
		{	
			
			document.POST.submit();
			document.addgrpform.dropdown[0].value = "Select";
			document.addgrpform.dropdown[0].selected = true;
			//alert(document.addgrpform.vehcles.value)f;
		}

	}
	
	function redirect()
	{
	  
		var transporter=document.POST.transporter.value;
		var vehno=document.getElementById("vehno").value;
		var unitid=document.getElementById("unitid").value;
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
	            {if(ajaxRequest.readyState == 4)
	            {
	                var reslt=ajaxRequest.responseText;

	                var mySplitResult = reslt.split("#");
	                var mySplitResult1=  mySplitResult[0]; 
	                var mySplitResult2=  mySplitResult[1];
	                var mySplitResult3=  mySplitResult[2];
	                var mySplitResult4=  mySplitResult[3];
	                var mySplitResult5=  mySplitResult[4];
	                var mySplitResult6=  mySplitResult[5];
	                var mySplitResult7=  mySplitResult[6];

	//Results from Ajaxunitadd.jsp are put into fields

		      	
	      }
	            }
	            
	  
	           var queryString = "?transporter="+transporter+"&vehno="+vehno+"&unitid="+unitid;
	 	   ajaxRequest.open("GET", "insertreportincident.jsp" + queryString, true);
	 	   ajaxRequest.send(null); 
	}

	
	</script>
<title>Mail API</title>
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
 <%
 String vid=request.getParameter("vid");
 String vehno=request.getParameter("vehno");
 String unitid=request.getParameter("unitid");
 String transp=request.getParameter("transp");
 String GPName=request.getParameter("GPName");
 %>
  <form method="POST" name="POST" action="insertreportincident.jsp" onsubmit="return validate();">
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  <tr align="center">
  	<td>
		<font size="3"><b>Do you really want to report incident??</b></font>  	
  	</td>
  	</tr>
  	
  	<tr>
  		<td>
  			<table border="1" width="750px" align="center" class="sortable" bgcolor="#E6E6E6">
  				<tr bgcolor="#BDBDBD">
  					<td>
  						<font color="black" size="2"><b>Transporter</b></font>
  					</td>
  					<td>
  						<font color="black" size="2"><%=transp%></font>
  					</td>
  				</tr>
  				<tr  bgcolor="#BDBDBD">
  					<td>
  						<font color="black" size="2"><b>Vehicle Registration Number</b></font>
  					</td>
  					<td>
  						<font color="black" size="2"><%=vehno%></font>
  					</td>
  				</tr>
  				<tr  bgcolor="#BDBDBD">
  					<td>
  						<font color="black" size="2"><b>UnitID</b></font>
  					</td>
  					<td>
  						<font color="black" size="2"><%=unitid%></font>
  					</td>
  				</tr>
  				<tr  bgcolor="#BDBDBD">
  					<td>
  						<font color="black" size="2"><b>GPName</b></font>
  					</td>
  					<td>
  						<font color="black" size="2"><%=GPName%></font>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2"  align="center"><div align="center">
  							<input type="hidden" name="transporter" value="<%=transp%>" />	
 							<input type="hidden" name="vehno" id="vehno" value="<%=vehno%>" />	
   							<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" />
   							<input type="hidden" name="GPName" id="GPName" value="<%=GPName%>" />
  							<input type="submit" value="Yes" name="Yes">
  							<input type="button" value="Cancel" name="Cancel" onclick="history.go(-1);">
  							</div>
  					</td>
  				</tr>
  			</table>
  		</td>
  	</tr>
  </table>
  <br></br>

 
  </form>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>