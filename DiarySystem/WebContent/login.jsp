<%-- 
    Document   : login
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: page having code to check the valid user.
    last updated : July 07, 2009.
	BY: Azhar
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%!
Connection con;
String user,pass,UserType="", UserTypeValue="", sql ="",Svehlist;

Statement s=null,s1=null;
%>
<%
try
{	
	user=request.getParameter("loginid");
	pass=request.getParameter("pass");
	Class.forName("org.gjt.mm.mysql.Driver");
	//con = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_CustomerComplaints","diary","d@1ry");
	con = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_CustomerComplaints","diary","d@1ry");
	 s = con.createStatement();
	 s1 = con.createStatement();
	sql="select * from t_admin where UName='"+user+"' and pass='"+pass+"' and Active='Yes'";
	ResultSet rst=s.executeQuery(sql);
	if(rst.next())
	{
		session.setAttribute("username",rst.getString("Name"));
		session.setAttribute("userid",rst.getString("UName"));
		session.setAttribute("userrole",rst.getString("UserType"));
		session.setAttribute("Urole",rst.getString("Urole"));
		session.setAttribute("DisplayName",rst.getString("Name"));
		session.setAttribute("email",rst.getString("Email"));
		session.setAttribute("typevalue",rst.getString("TypeValue"));
		response.sendRedirect("validateuser.jsp");
	   
	}
	else
	{
		response.sendRedirect("index.jsp?err=err");
	}
}catch(Exception e)
{
	out.println("Exception --->" +e);
}
finally
{
	con.close();
	s.close();
	s1.close();
}

%>
