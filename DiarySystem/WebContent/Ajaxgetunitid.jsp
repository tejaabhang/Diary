<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
	//con1= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String veh=request.getParameter("veh");

sql1="select * from t_vehicledetails where VehicleRegNumber='"+veh+"' ";
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	String unitid=rs1.getString("TheFieldFromEmailAddress");
	unitid=unitid.substring(2,unitid.indexOf("@"));
	out.print(unitid+"#");
}
String sql2="select * from t_onlinedata where VehicleRegNo='"+veh+"'";
ResultSet rs2=stmt1.executeQuery(sql2);
if(rs2.next()){
	String TheDate=rs2.getString("TheDate");
	out.print(TheDate+"#");
}
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>






