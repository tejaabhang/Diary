<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.MissingUnitsDetails"
		import="com.transworld.diary.framework.UnitDetailsDao"%>

<jsp:useBean id="unitDetailsDao"
	type="com.transworld.diary.framework.UnitDetailsDao"
	scope="application"></jsp:useBean>

<%
String  userrole1=session.getAttribute("userrole").toString();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css"charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);
	</style>
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
					<div id="gbox1">
						<div id="gbox-top1"></div>
							<div id="gbox-bg1">
								<div id="gbox-grd1">
								
<!--- code start here ------>

<form name="missingunits" method="get" action="unitfoundinsrt.jsp">
<%
	final String transporter=request.getParameter("trans");
	final String nounitselected=request.getParameter("nounitselected");
	final String updated=request.getParameter("updated");
	int numRecords = 0;
	List<MissingUnitsDetails> missingUnitsDetails=null;
    try{
    	missingUnitsDetails = unitDetailsDao.getMissingUnitsDetails(transporter);       	
       	numRecords = missingUnitsDetails.size();	 
	} catch(Exception e){
		e.printStackTrace();
	}
	if(nounitselected!=null)
	{
%>
<table border="0" width="750px">
	<tr>
		<td>
		<div align="center"><font color="maroon"> No Unit was selected. Please select the check-box to remove it from Unit Missing list.</font></div>
		</td>
	</tr>
</table>
<%} 
	
	if(updated!=null)
	{ 
%>
<table border="0" width="750px">
	<tr>
		<td>
		<div align="center"><font color="maroon"> Updated Successfully</font></div>
		</td>
	</tr>
</table>
<%	
}
%>
<table border="0" width="750px">
	<tr>
		<td colspan="5" align="center"><font color="maroon" size="2">
		<B> Unit Missing Details </B> </font></td>
	</tr>
</table>

<table class="sortable">
	<tr>
		<td></td>
		<td>
			<div align="center"><B> Sr. No. </B></div>
		</td>
		<td>
			<div align="center"><B> Date/Time </B></div>
		</td>
		<td>
			<div align="center"><B> Owner </B></div>
		</td>
		<td>
			<div align="center"><B> Vehicle No. </B></div>
		</td>
		<td>
			<div align="center"><B> Unit Id </B></div>
		</td>
		<td>
			<div align="center"><B> Comment </B></div>
		</td>
	</tr>
<%
for (int counter = 0; counter < numRecords; counter++) 
	{
		final MissingUnitsDetails currentRecord = missingUnitsDetails.get(counter);
		int i = counter+1;
		int j=0;
%>
	<tr>
		<td>
			<div align="center"><input type="checkbox" name="dis<%=j %>" value="dis<%=j%>"></div>
			<input type="hidden" name="id<%=j%>" value="<%=currentRecord.getSrNo()%>" />
		</td>
		<td>
			<div align="center"><%=i%></div>
		</td>
		<td>
			<div align="center"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(currentRecord.getEnteredDateTime()))%></div>
		</td>
		<td>
			<div align="center"><%=currentRecord.getOwner()%></div>
		</td>
		<td>
			<div align="center"><%=currentRecord.getVehicleNumber()%></div>
		</td>
		<td>
			<div align="center"><%=currentRecord.getUnitId()%></div>
		</td>
		<td>
			<div align="center"><%=currentRecord.getComment() %></div>
		</td>
	</tr>
	<%
		j++;
		}
	%>
	<tr>
		<td colspan="7">
		<div align="center"><input type="submit" name="submit"
			value="Submit" class="formElement" /></div>
		</td>
	</tr>

</table>

</form>
<!-- code end here --->

	<table width="750px" height="350px" border="0">
		<tr>
			<td></td>
		</tr>
	</table>
								</div>
							</div>
						<div id="gbox-bot1"></div>
					</div>
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
