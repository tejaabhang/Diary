<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection con1;
%>

<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmtinsert=con1.createStatement();
	ResultSet rs6=null;
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";

	String vehcode="", fnlowner="",fnlgroup="", fnlvehno="", typechk="", email="", oldveh="", oldowner="", oldgroup="", comment="";

	String username=session.getAttribute("username").toString();

		
    String vehtyp=request.getParameter("edit3");
	
	////System.out.println("vehtyp>>>in cnfrm edit>>>"+vehtyp);

	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);
	
	////System.out.println("fnlgroup->>>>>>>.@@@@@@  --->"+fnlgroup);
	////System.out.println("fnlowner->>>>>>>.@@@@@@  --->"+fnlowner);

	
	
	 ////System.out.println("INSIDE IF LOOP-  --->");
    
   


sql9="insert into db_gps.t_vehtypmaster (VehType) values ('"+vehtyp.trim()+"')";
//Query for t_sqlquery
//////System.out.println(sql9);

stmt1.executeUpdate(sql9);
////System.out.println("sql-9 -insert query-->" +  sql9);
  


con1.close();
response.sendRedirect("addvehtyp.jsp?updated=yes");
return;

}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
}
%>
