<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,stmtinsert;
%><%
try{
	String Name=request.getParameter("Name");
	String UName=request.getParameter("UName");
	String URole=request.getParameter("URole");
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		stmtinsert=conn1.createStatement();
		
		String sql="update db_CustomerComplaints.t_admin set Active='Yes' where Name='"+Name+"' and UName='"+UName+"' and URole='"+URole+"' ";
		//System.out.println(sql);
		//Query for t_sqlquery
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
		st.executeUpdate(sql);

	//	String redirectto=request.getParameter("redirectto");
			response.sendRedirect("employee.jsp?update=yes");
		
	}catch(Exception e)
	{
		//System.out.println("Exception----> "+e);
	}
	finally
	{
		conn.close();
		conn1.close();
	}
%>
