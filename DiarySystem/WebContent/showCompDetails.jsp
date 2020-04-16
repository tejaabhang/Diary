<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"  import=" java.text.*" import=" java.util.*" errorPage="" %>
<html>

<head>
<script language="JavaScript">
</script>
</head>
<body>
<%
String attloc="", compdate="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
compdate=request.getParameter("compdate");
attloc=request.getParameter("attloc");
availdate=request.getParameter("availdate");
allocatedto=request.getParameter("allocatedto");
desc=request.getParameter("desc");
contpers=request.getParameter("contpers");
entby=request.getParameter("entby");
DetDesc=request.getParameter("DetDesc");
%>
<table width="100%">
<tr><td><font size="2"><b>Comp. Date : </b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate)) %></font></td></tr>
<tr><td><font size="2"><b>Location : </b> <%=attloc %></font></td></tr>
<tr><td><font size="2"><b>Avail Date :</b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate)) %> </font></td></tr>
<tr><td><font size="2"><b>Allocated to : </b><%=allocatedto %> </font></td></tr>
<tr><td><font size="2"><b>Description : </b><%=desc %> </font></td></tr>
<tr><td><font size="2"><b>Detailed Desc : </b><%=DetDesc %> </font></td></tr>
<tr><td><font size="2"><b>Contact Person:</b> <%=contpers %> </font></td></tr>
<tr><td><font size="2"><b>Ent. By : </b><%=entby %> </font></td></tr>

</table>
</body>
</html>
