<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%!
	Connection con;
	
	%>
<%
String srno=request.getParameter("SrNo");
%>
<%
String CategoryID="";
String CategoryDetails = "";
String MaxTimeInHrs = "";
Statement st = null;
Statement st1 = null;
//System.out.println("The >>>>");
try {
	con = DriverManager.getConnection(MM_dbConn_STRING,
			MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	st = con.createStatement();
	st1 = con.createStatement();

} catch (Exception e2) {
	//System.out.println("The exception is :"+e2);
}
%>

<%
try{
	
String sql ="select * from db_gps.t_complaintscategory where SrNo='"+srno+"'";
ResultSet rs=st.executeQuery(sql);
//System.out.println("The query is :"+sql);
while(rs.next()) {
	CategoryID=rs.getString("CategoryID");
	CategoryDetails=rs.getString("CategoryDetails");
	MaxTimeInHrs=rs.getString("MaxTimeInHrs");
}
}catch(Exception e1) {
	//System.out.println("The exception is :"+e1);
}
//System.out.println("The sr no is :"+srno);
//System.out.println("The catID is :"+CategoryID);
//System.out.println("The CategoryDetails is :"+CategoryDetails);
//System.out.println("The MaxTimeInHrs is :"+MaxTimeInHrs);
%>
<head>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style>

<title>Complaints Category Edit Settings</title>
<script src="sorttable.js" type="text/javascript"></script>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

</head>


<body>
<%
String Msg = request.getParameter("Msg");
if(Msg!=null && Msg.equalsIgnoreCase("1"))
{
	%>
		<script>
		opener.Reload();
		window.close();
		</script>
	<%
}

%>
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Category Edit Form</a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<form id="catedit"  name="catedit" class="appnitro" enctype="multipart/form-data" action="ComplaintCatFVSettings.jsp" method="get">
								
  <ul >
	<div align="center" style="width:100%; ">
	<table border="1" width="100%" align="center" CELLPADDING=10 style="background: #f8fcff" class=mytable>
	
	<tr>
	  <td style="text-align: left"><font size="2">Sr No :</font></td>
	  <td ><font size="2"><%=srno%></input></font></td>
	</tr>		
	<tr>
	  <td style="text-align: left"><font size="2">CategoryID :</font></td>
	  <td ><font size="2"><input type="text" id="CategoryID" name="CategoryID" value="<%=CategoryID%>" style="width: 50%;background: white;"></input></font></td>
	</tr>
	
	<tr>
	  <td style="text-align: left"><font size="2">CategoryDetails :</font></td>
	  <td ><font size="2"><input type="text" id="CategoryDetails" name="CategoryDetails" value="<%=CategoryDetails%>" style="width: 50%;background: white;"></input></font></td>
	</tr>
	
	<tr>
	  <td style="text-align: left"><font size="2">MaxTimeInHrs :</font></td>
	  <td ><font size="2"><input type="text" id="MaxTimeInHrs" name="MaxTimeInHrs" value="<%=MaxTimeInHrs%>" style="width: 50%;background: white;"></input></font></td>
	
	</tr>
	  <input type="hidden" id="srno" name="srno" value="<%=srno%>" style="width: 99%;background: white;"></input>
	
	
	<tr><td></td><td align="left"><input type="submit" name="catsett" id ="catsett" value="Submit"></input></td>
	</tr>

</table>
</div>
</form>
</div>		
</ul>

</body>
</html>