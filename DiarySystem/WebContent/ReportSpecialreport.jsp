<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.transworld.diary.framework.SpacialReportOfTransporter"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
				
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application"></jsp:useBean>

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
int numRecords = 0;
List<SpacialReportOfTransporter> spacialReportOfTransporter=null;
try{
	spacialReportOfTransporter = unitDetailsDao.getSpacialReportOfTransporter();       	
   	numRecords = spacialReportOfTransporter.size();	 
} catch(Exception e){
	e.printStackTrace();
}
%>
<table border="0" width="750px" align="center" bgcolor="#77D7D4">	
	<tr>
		<td>
			<div align="center"><font color="black" size="3">Report For Special Reports</font></div>
		</td>
	</tr>
	<tr>
		<td colspan="" bgcolor="">  
			<div align="right"><a href="ReportSpecialreportexcel.jsp"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> 
		</td>	
	</tr>
	</table>
	<br></br>
	<table border="1" width="750px" align="center" class="sortable">
				<tr>
		 			<td>Sr</td>
		  			<td>Transporter</td>
		   			<td>Veh. Reg. No.</td>
					<td>DriverName</td>
					<td>UnitID</td>
		  			<td>EnterDate</td>
		  			<td>Location</td>
		  			<td>Technician</td>
		  			<td>Amount</td>
		  			<td>Comment</td>
	    		</tr>
<%
	try
	{
		for (int counter = 0; counter < numRecords; counter++) 
		{
			final SpacialReportOfTransporter record = spacialReportOfTransporter.get(counter);
			int i = counter+1;
%>						    	
				<tr>
		  			<td><%= i %></td>
		   			<td><%=record.getTrasporter()%></td>
		   			<td><%=record.getVehicleRegistrationNumber()%></td>
					<td><%=record.getDriverName()%></td>
		   			<td><%=record.getUnitId()%></td>
		   			<td><%=record.getEnteredDate()%></td>
		  			<td><%=record.getLocation()%></td>
		   			<td><%=record.getTechnicianAssignToVehicle()%></td>
		   			<td><%=record.getAmount()%></td>
		   			<td><%=record.getComment()%></td>
		   		</tr>
<%
		}
	}catch (Exception e) {
			out.println("<tr><td colspan=10>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
	</table>
<%
	}	
%>
		

<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>