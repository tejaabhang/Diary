<%@ include file="header.jsp"%>
<%@page import="java.util.Date"%>
<html>
<head>
<script language="JavaScript">
function loadalert (msg,gotoPage) 
{
	alert(msg);
	window.location = gotoPage;
}
</script>
</head>
<body onLoad="loadalert('<%=request.getParameter("msg") %>','<%=request.getParameter("goto") %>','<%=request.getParameter("vehno") %>','<%=request.getParameter("unitid") %>')">
<table>
<tr><td>.</td></tr>
</table>
<% 
String msg="";
%>
<%
msg=request.getParameter("msg");
%>
</body>
</html>