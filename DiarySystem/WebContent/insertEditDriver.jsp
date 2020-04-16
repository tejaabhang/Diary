<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript">
		//alert("Data inserted successfully");
		redirectTime = "10";
		redirectURL = "liveticket.jsp";
		window.onload=function(){
			setTimeout("location.href = redirectURL;",redirectTime);
}

</script>

</head>
<body>
<%!Connection conn, conn1;%>
<%

 
String vehcode=request.getParameter("vehcode");



String empname=request.getParameter("Name");
String empCode=request.getParameter("firstName");



try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt=conn1.createStatement();
	Statement stmt2=conn1.createStatement();
	ResultSet st, rst2;
	String empName="";
	
	String sql="update t_vehicledetails set Empname='"+empname+"', Empcode='"+empCode+"' where vehiclecode="+vehcode+"  limit 1 ";
	
	stmt.executeUpdate(sql);
	
	
	
	out.println("<script>alert('Updated Successfully')</script>");
	
	
	
}catch(Exception e)
{
	
	System.out.println("Exception in upodate"+e.getMessage());
	
}
%>



</body>
</html>
<%-- </jsp:useBean> --%>