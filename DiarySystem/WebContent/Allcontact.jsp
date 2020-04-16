<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.RecieverInformation"
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
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css" />
	<link rel="stylesheet" href="css/ajax-tooltip-demo.css" media="screen" type="text/css" />
</head>

<body>
  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></img></h1>
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
final String username=session.getAttribute("username").toString();
final String transpoter="";
final String activeStatus="Yes";
int details=0;
List<RecieverInformation> recieverInformation=null;
try{
	recieverInformation=unitDetailsDao.getRecieverInformation(transpoter,activeStatus);
	details = recieverInformation.size();
} catch(Exception e){
	e.printStackTrace();
}
%>
<div align="right">  <a href="Allcontactexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> 	
<table border="1" width="750px" class="sortable">
	<tr>
		<td>Sr.</td>
		<td>Transporter</td>
		<td>Contact Name</td>
		<td>Phone</td>
		<td>Mobile</td>
		<td>Email</td>
		<td>Location</td>
		<td>Comment</td>
	</tr>
<%
for (int counter = 0; counter < details; counter++) 
	{
		final RecieverInformation currentRecord = recieverInformation.get(counter);
		int i = counter+1;
%>
	<tr>
		<td><%=i%></td>
		<td><%=currentRecord.getTransporter()%></td>
		<td>
			<a href="#" onclick="window.open ('last10callinfo.jsp?reciever=<%=currentRecord.getContactName()%>&trans=<%=currentRecord.getTransporter()%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=currentRecord.getContactName()%></a>
		</td>
		<td><%=currentRecord.getPhoneNumber()%></td>
		<td><%=currentRecord.getMobileNumber()%></td>
		<td><a href="mailto:<%=currentRecord.getEmailId()%>?subject=Vehicle%20Complaints%20"><%=currentRecord.getEmailId()%></a></td>
		<td><%=currentRecord.getPlaceName()%></td>
		<td><a href="javascript: flase" onclick="window.open ('addcall.jsp?reciever=<%=currentRecord.getContactName()%>&trans=<%=currentRecord.getTransporter()%>', 'win1', 'width=400, height=250, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Click</a></td>
	</tr>
<%
	}
%>
</table>

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