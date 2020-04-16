<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%!
String startdate,origin,destination;

%>
<%
 startdate=request.getParameter("startdate");
 origin=request.getParameter("origin");
 destination=request.getParameter("destination");
%>
<body background="images/green_grad_bot.jpg">
<p></p>
<table border="0" width="100%">
<tr><td>Start Date :</td><td>
<%
java.util.Date ShowDatex = new SimpleDateFormat("yyyy-MM-dd").parse(startdate);
Format formatter = new SimpleDateFormat("dd-MMM-yyyy");
String ddd=formatter.format(ShowDatex);
out.print(ddd);
%></td></tr>
<tr><td>Origin :</td><td><%=origin%></td></tr>
<tr><td>Destination :</td><td><%=destination%></td></tr>
<tr><td colspan="2" align="center"><a href="javascript:window.close();">Close</a></td></tr>
</table>
</body>
</html>
