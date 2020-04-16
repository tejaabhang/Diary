<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<%
try {
    
    
    Class.forName(MM_dbConn_DRIVER);
//	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement stmt1=con1.createStatement();
    Statement stmt2=con1.createStatement();
    ResultSet rs1=null;
    String sql1=""; 
    String username = request.getParameter("username");
	String hod =null;
	//System.out.println("username   "+username);
    sql1 = "select hodid from db_gps.t_userdetails where username = '"+username.trim()+"'";
    rs1 = stmt1.executeQuery(sql1);
   //System.out.println("****    "+sql1);
    if(rs1.next())
    {
    	//System.out.println(rs1.getString("hodid"));
    	String sql2 = "select username from db_gps.t_userdetails where Srno = '"+rs1.getString("hodid")+"'";
    	 //System.out.println("****    "+sql2);
    	ResultSet rs = stmt2.executeQuery(sql2);
    	
    	if(rs.next())
    	{
    		hod = rs.getString("username");
    	}
    	else
    	{
    		hod = "-";
    	}
    }
    else
    {
    	hod = "-";
    }
    //System.out.println(hod);
    out.println(hod);


} 
catch(Exception e)
	{
		out.println(e);
	}

finally
{
con1.close();
}
%>