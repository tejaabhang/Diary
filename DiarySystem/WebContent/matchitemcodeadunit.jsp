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
    String checkInvorefNo = request.getParameter("checkInvorefNo");
    String actqunty = request.getParameter("actqunty");
    String ival = request.getParameter("ival");
	String hod =null;
	String count="0";
	String cnt="";
	//System.out.println("username   "+username);
    sql1 = "select count(*) as count from db_gps.t_vehicledetails where InnoviceNo = '"+checkInvorefNo+"'";
    rs1 = stmt1.executeQuery(sql1);
   //System.out.println("****    "+sql1);
    if(rs1.next())
    {
    	count=rs1.getString("count");
    	
    }
    int countint=Integer.parseInt(count);
    int actquntyint=Integer.parseInt(actqunty);
   // out.println(countint+">"+actquntyint);
    if(countint>actquntyint)
    {
       out.println("Yes#"+ival+"");	
    }else
    {
       out.println("No#"+ival+"");
    }
    //System.out.println(hod);
    

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