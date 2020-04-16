<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>



<head>


<title>Update Sms Status</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<script type="text/javascript">
function validate(){
	var ConfComments=document.getElementById("ConfComments").value;
	//alert("ConfComments====>"+ConfComments);
	if(ConfComments==""||ConfComments==null){
		alert("Please enter confirmation comment");	
		return false;
	}
	return true;
}
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
String ConfStatus=request.getParameter("ConfStatus");
//System.out.println("************"+ConfStatus+"***********");
String ConfComments="";
%>
<form action="UpdateSmsSentStatus.jsp" method="get" onsubmit="return validate();">

<table style="background: #E6E6E6" align="center" width="80%">
<tr align="center"><td align="center">
<font size="2"><b>Update Sms Status</b></font>
</td></tr>
</table>
			
<table border="0" cellpadding="3" width="80%" style="background: #E6E6E6" align="center">
<tr>
			
			<td align="left">
				
				<input type="hidden" name="RId" id="RId" value="<%= RId%>">
				<input type="hidden" name="ConfStatus" id="ConfStatus" value="<%= ConfStatus%>">
			</td>
			</tr>
			<tr  bgcolor="#BDBDBD">
			<td valign="top" align="left"><font size="2">ConfComments:</font></td>
			<td align="left">
			<input type="text" name="ConfComments" id="ConfComments" value="<%= ConfComments%>">
				<input type="hidden" name="ConfComments" id="ConfComments" value="<%= ConfComments%>"></td>
</tr>
</table>

<table border="0" cellpadding="3" width="80%" style="background: #E6E6E6" align="center">
<tr>
<td align="center"><input type="submit" id="search-submit" name="submitFollowUp" value="Update"  /></td>
</tr>
</table>
</form>
</body>
</html>