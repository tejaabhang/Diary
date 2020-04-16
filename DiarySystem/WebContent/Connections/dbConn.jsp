<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%!
String MM_dbConn_DRIVER;
String MM_dbConn_USERNAME;
String MM_dbConn_PASSWORD="";
String MM_dbConn_STRING;
String MM_dbConn_STRING1;
Connection getDattabase;
Statement getStatement;
%>
<%
try{
Class.forName("org.gjt.mm.mysql.Driver");
getDattabase= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","diary","d@1ry");
//getDattabase= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","diary","d@1ry");
getStatement=getDattabase.createStatement();
String sql="select * from t_security where TypeValue='"+session.getAttribute("usertypevalue").toString()+"'";
ResultSet getResultset=getStatement.executeQuery(sql);
if(getResultset.next())
{
	MM_dbConn_DRIVER=getResultset.getString("MM_DBConn_Driver");
	MM_dbConn_USERNAME=getResultset.getString("MM_dbConn_UserName");
	MM_dbConn_STRING=getResultset.getString("MM_dbConn_String");
	MM_dbConn_STRING1=getResultset.getString("MM_dbConn_String1");
}

}catch(Exception e)
{
	out.print("Exception "+e);
}finally
{
getStatement.close();
getDattabase.close();
}


%>
