<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.ComplaintCharges"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>

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
	<script language="javascript">
		function newwindow(webadd)
		{ 
		  window.open(webadd,'jav','width=700,height=100,resizable=yes');
		} 
	</script>
	<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
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
final String userRole=session.getAttribute("userrole").toString();
int numRecords = 0;
List<ComplaintCharges> complaintChargesDetails=null;
try{
	complaintChargesDetails = unitDetailsDao.getComplaintCharges();       	
   	numRecords = complaintChargesDetails.size();	 
} catch(Exception e){
	e.printStackTrace();
}
%>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Complaint Charges</B> </font>
<%
			if(MANAGER.equalsIgnoreCase(userRole)||SUPERADMIN.equalsIgnoreCase(userRole))
			{ 
%>
				<div align="right"> <a href="" onClick="newwindow('addcomplaintcharges.jsp');return false" target="_parent"> <B> Add more </B> </a> </div>
<%			
			}
%>
			</td> 
		</tr>
	</table>
	<table class="sortable">
		<tr>
			<td> <div align="center"> <B> Sr.No </B> </div> </td>
			<td> <div align="center"> <B> Complaint </B> </div> </td>
			<td> <div align="center"> <B> Amount </B> </div> </td>
<%
			if(MANAGER.equalsIgnoreCase(userRole)|| SUPERADMIN.equalsIgnoreCase(userRole))
			{ 
%>
				<td> <div align="center"> <B> Edit </B> </div> </td>	
<%			
			}
%>
		</tr>	
		<%
for (int counter = 0; counter < numRecords; counter++) 
	{
		final ComplaintCharges chargesRecord = complaintChargesDetails.get(counter);
		int i = counter+1;
		int j=0;
%>
		<tr>	
			<td><input type="hidden" name="compid" value="<%=chargesRecord.getSrNo()%>" />
			<div align="left"> <%=i%> </div></td>
			<td> <div align="left"> <%=chargesRecord.getComplaint()%> </div> </td>
			<td> <div align="left"> <%=chargesRecord.getAmount()%> </div> </td>
<%
			if(MANAGER.equalsIgnoreCase(userRole)|| SUPERADMIN.equalsIgnoreCase(userRole))
			{ 
%>
			<td> <div align="left"> <a href="" onClick="newwindow('editcomplaintchrgs.jsp?complid=<%=chargesRecord.getSrNo()%>');return false" target="_parent"> Edit</a> </div> </td>
<%				
			} 
%>
		</tr>
<% 
	}
%>
	</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
 <table border="1" width="100%" align="center">
	<tr>
		<td bgcolor="#98AFC7" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</body>
</html>
