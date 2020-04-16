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
String gettrans=request.getParameter("trans");

sql1="select VehicleRegNumber from t_vehicledetails where OwnerName='"+gettrans+"' order by VehicleRegNumber asc ";
//out.println(sql1);
rs1=stmt1.executeQuery(sql1);
out.println("<select name='vehno' onChange='OnChangeFunc4(this);' class='formElement' >");
out.println("<option value='Select'>Select</option> ");
while(rs1.next())
{
out.println("<option value='"+rs1.getString("VehicleRegNumber")+"'> "+rs1.getString("VehicleRegNumber")+" </option> " );
}
out.println("</select>");
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>






