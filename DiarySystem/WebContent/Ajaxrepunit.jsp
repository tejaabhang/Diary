<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<%
try
{	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String getvehno=request.getParameter("vehregno");

sql1="select TheFieldFromEmailAddress from t_vehicledetails where VehicleRegNumber='"+getvehno+"'  and MobilePhNo > 0 ";
//out.println(sql1);
rs1=stmt1.executeQuery(sql1);

String email="";
String unid="";
while(rs1.next())
{
  email=rs1.getString("TheFieldFromEmailAddress");
  int pos=email.indexOf('@');
  unid=email.substring(2,pos);
  out.print(unid);
}


} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>





