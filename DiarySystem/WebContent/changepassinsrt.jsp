<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection con1,con2;
%>

<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	ResultSet rs1=null;
	String sql1="";
	String pass="", user="";

	user=request.getParameter("user");
	pass=request.getParameter("newpass");
		
	sql1="update t_admin set pass='"+pass+"' where UName='"+user+"' ";
	//Query for t_sqlquery
		String abcd=sql1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	
	stmt1.executeUpdate(sql1);
	
	response.sendRedirect("changepassword.jsp?changed=yes");
	return;

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>
