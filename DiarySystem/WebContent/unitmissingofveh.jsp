<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">

function validate()
{
     var cmnt=document.unitmissingform.cmnt.value;
     
     if(cmnt.length<2)
	{
		 alert("Please enter your Comments");
	       return false;
	}
	return true;
     
}
</script>

</head>
<body>
<form name="unitmissingform" method="get" action="unitmissinginsrt.jsp" onsubmit="return validate();">
 <!--- code start here ------>
<%

try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	
	String username=session.getAttribute("username").toString();
	
	java.util.Date defaultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(defaultdate);
	
	String vehcode=request.getParameter("vid");
	String vehno=request.getParameter("vehregno");
	String unitid=request.getParameter("unitid");
	String transp=request.getParameter("transporter");
	
%>

<input type="hidden" name="owner" value="<%=transp %>" />
<input type="hidden" name="vehreg" value="<%=vehno %>" />
<input type="hidden" name="unitid" value="<%=unitid %>" />

<input type="hidden" name="singveh" value="ForSingleVeh" />

<%
	String alrdydone=request.getParameter("alrdydone");
	String inserted=request.getParameter("inserted");

	if(!(inserted==null) )
	{ %>
			<center>
    		<table border="0" width="400px">
    			<tr>
    				<td align="center"> Successfully Inserted. </td>
    			</tr>
    			<tr>	
    				<td align="center"> <a href="javascript:window.close();"> Close </a> </td>
    			</tr>
    		</table>
<%	}
	else if(!(alrdydone==null))
	{%>
	<center>
	<table border="0" width="400px">
		<tr>
			<td align="center"> Entry already done! </td>
		</tr>
		<tr>	
			<td align="center"> <a href="javascript:window.close();"> Close </a> </td>
		</tr>
	</table>
		
<% 	}
	else
	{	
%>
<center>
    <table border="0" width="400px">
    	<tr>
    		<td align="center"> Unit Missing Entry</td>
    	</tr>
    <table>
    
	<table border="1" width="400px">
		<tr>
			<th> Vehicle No</th>
			<td> <%=vehno %> </td>
		</tr>
		<tr>
			<th>Unit Id </th>
			<td> <%=unitid %></td>
		</tr>
		<tr>
			<th> Comment </th>
			<td> <textarea name="cmnt" class="formElement"> </textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
		</tr>
	</table>	

<%
	} //close of else
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
}

%>
	</table>
	
</table>
	
<!-- code end here --->
</form>
</body>
</html>


