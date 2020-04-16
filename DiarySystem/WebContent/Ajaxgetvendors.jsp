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
	//con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";


sql1="select Name from t_admin where URole='manufacturer' order by Name asc";
//out.println(sql1);
rs1=stmt1.executeQuery(sql1);
out.println("<select name='cname'  class='formElement' >");
out.println("<option value='Select'>Select</option> ");
while(rs1.next())
{
out.println("<option value='"+rs1.getString("Name")+"'> "+rs1.getString("Name")+" </option> " );
}
out.println("</select>");
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>







