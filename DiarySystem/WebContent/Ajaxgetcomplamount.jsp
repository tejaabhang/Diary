<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>
<%

try
{
	Class.forName(MM_dbConn_DRIVER);
con1= DriverManager.getConnection				(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String compltype=request.getParameter("compltype");

//out.print(compltype);

sql1="select * from t_specialcomp where Complaint = '"+compltype+"' ";
//out.println(sql1);
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	out.println(rs1.getDouble("Amount"));
}
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>







