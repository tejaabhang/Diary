<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%!Connection con;%>
<%
	Statement st = null;
	String CategoryID = "";
	String CategoryDetails = "";
	String MaxTimeInHrs = "";
	String srno="";
	
	try {
		con = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = con.createStatement();

	} catch (Exception e) {
	}
%>
<head>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style>

<title>Complaints Category Settings</title>
<script src="sorttable.js" type="text/javascript"></script>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

<script type="text/javascript">

function Reload()
{
    window.location.reload(); 
}
function Editvalues() {
	//alert(">>");
	window.open ("ComplaintCatSettingsAddNew.jsp",'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}
function Editvalues1(i) {
	//alert(">>>>>>"+i+"<<<<<<<");
	try{
	//var srno= i;
		window.open ("ComplaintCatSettingsEdit.jsp?SrNo="+i,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
	}catch(e) {
		alert(e);
}
}
</script>
<script type="text/javascript">
</script>
</head>


<body>

<div id="form_container" style="width:60%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Category Edit Form</a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<form id="catedit"  name="catedit" class="appnitro" enctype="multipart/form-data" method="get" onsubmit="return confirmSubmit()">
								
  <ul >
	<div align="center" style="width:100%; ">
	<table border="1" width="100%" align="center" CELLPADDING=10 style="background: #f8fcff" class=mytable>
			
	<tr>
	<th align="right" colspan="4" >			
			<b>SrNo </b> 		
	  </th>
		<th align="left" colspan="4" >			
			<b>CategoryID </b> 		
	  </th>
	  <th align="left" colspan="4">			
			<b>CategoryDetails </b>		
	  </th>
	  <th align="right" colspan="4">			
			<b>MaxTimeInHrs </b> 		
	  </th>
	  <th align="right" colspan="4">			
			<b>Edit </b> 		
	  </th>
   </tr>
	
	
	<%
		String sql = "select * from db_gps.t_complaintscategory order by SrNo ASC";
		ResultSet rs = st.executeQuery(sql);
		int i = 0;
		String cat = "";
		while (rs.next()) {
			srno = rs.getString("SrNo");
			CategoryDetails = rs.getString("CategoryDetails");
			CategoryID = rs.getString("CategoryID");
			CategoryDetails = rs.getString("CategoryDetails");
			MaxTimeInHrs = rs.getString("MaxTimeInHrs");
			
		
	%>
	
	<tr>
	<td align="right" colspan="4" >			
			<%=srno %> 		
	  </td>
		<td align="left" colspan="4" >			
			<%=CategoryID %> 		
	  </td>
	  <td align="left" colspan="4">			
			<%=CategoryDetails %>
	 </td>
	 <td align="right" colspan="4">			
			<%=MaxTimeInHrs %>
	 </td>
	 <td align="right" colspan="4"><input type="button" id="edit_button" name="edit_button" style="background-color:#BDBDBD;"
			value="Edit" onclick="Editvalues1(<%=srno%>);"></input>
	</td>
	</tr>
	
	<%} %>
	
</table>
<table border="0" width="100%" align="center" CELLPADDING=10 style="background: #f8fcff">
	<tr>
	<td align="right" width="40%"><input type="button" name="addnew" id="addnew" value="Add New" onclick="Editvalues();" style="background-color:#BDBDBD;"></input></td>
	</tr>
</table>
</div>
</form>

</div>		
</ul>
</body>
</html>