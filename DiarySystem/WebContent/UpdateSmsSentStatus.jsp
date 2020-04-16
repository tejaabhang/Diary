<%@page import="java.security.acl.Owner"%><%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
	Connection con;
	
	%>
<head>
</head>

<body onload="window.opener.location.reload();setTimeout('self.close()',5);"> 
<%
//out.println(incdtCmt+"=============="+permanentSol);
try
{

	Statement st=null;
	final String userName=session.getAttribute("username").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st = con.createStatement();
	} catch (Exception e) {
	}
	
	String RId=request.getParameter("RId");
	String ConfStatus=request.getParameter("ConfStatus");
	String ConfComments=request.getParameter("ConfComments");
	String sql="update db_gps.t_msgSentDetails set  ConfStatus='Confirmed' , ConfComments='"+ConfComments+"' ,ConfDateTime='"+today+"' ,ConfBy='"+userName+"' where RId='"+RId+"'	";
	//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql);
	st.executeUpdate(sql);
	
	
	
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
%>
</body>

</html>