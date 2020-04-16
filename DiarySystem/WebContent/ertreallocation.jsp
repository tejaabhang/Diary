<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn;
%>

<% 
try {
	Class.forName(MM_dbConn_DRIVER);
	conn= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	out.print("Hi All...");

} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
conn.close();

}
%>
