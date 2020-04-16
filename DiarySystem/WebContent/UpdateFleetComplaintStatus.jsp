<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>



<head>


<title>Update Complaint  Status</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<script type="text/javascript">
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
} 
</script>
</head>

<body>
<%
//Statement st=conn.createStatement();

String RId=request.getParameter("RId");
//System.out.println("************"+RId+"***********");
String ConfComments="";
%>
<form action="UpdateFVComplaintStatus.jsp" method="get">

<table style="background: #E6E6E6;" align="center" width="80%">
	<tr align="center">
		<td align="center">
			<font size="2"><b>Update Complaint Status</b></font>
		</td>
	</tr>
</table>
			
<table border="0" cellpadding="3" width="80%" style="background: #E6E6E6;" align="center">
	<tr  bgcolor="#BDBDBD">
		<td align="left"><font size="2">ConfComments:</font></td>
			<td align="left">
				<input type="hidden" name="RId" id="RId" value="<%= RId%>">
				<input type="text" name="ConfComments" id="ConfComments" value="<%= ConfComments%>">
				<input type="hidden" name="ConfComments" id="ConfComments" value="<%= ConfComments%>">
			</td>
	</tr>
	<tr  bgcolor="#BDBDBD">
		<td align="center" colspan="2"><input type="submit" id="search-submit" name="submitFollowUp" value="Update"  /></td>
	</tr>
</table>
</form>
</body>
</html>