<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con;
Statement s,stmtinsert;
%>
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>

<%
	   Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    s=con.createStatement();
	    stmtinsert=con.createStatement();
   

try
{
	
	String StartPlace=request.getParameter("StartPlace");
	String EndPlace=request.getParameter("EndPlace");
String OldStartcode=request.getParameter("startcode1");
	String OldEndcode=request.getParameter("endcode1");
	String Km=request.getParameter("Km");
	String TTime=request.getParameter("TTime");
	String Startlat=request.getParameter("Startlat");
	String Startlong=request.getParameter("Startlong");
	String Endlat=request.getParameter("Endlat");
	String EndLong=request.getParameter("EndLong");
	java.util.Date defoultdate = new java.util.Date();
	String today=new SimpleDateFormat("yyyy-MM-dd").format(defoultdate);
	String user=session.getAttribute("username").toString();
	String status="deleted";
		
	String sql2="insert into t_CastrolRoutesHistory(OldStartCode,OldStartPlace,OldEndCode,OldEndPlace,OldKm,OldTTime,OldStartlat,OldStartlong,OldEndlat,OldEndLong,UpdateDate,Insertedby,status)Values('"+OldStartcode+"','"+StartPlace+"','"+OldEndcode+"','"+EndPlace+"','"+Km+"','"+TTime+"','"+Startlat+"','"+Startlong+"','"+Endlat+"','"+EndLong+"','"+today+"','"+user+"','"+status+"')";
	//Query for t_sqlquery
		String abcd=sql2.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	 s.executeUpdate(sql2);	


	String sql="delete from t_castrolroutes where StartPlace='"+StartPlace+"' and EndPlace='"+EndPlace+"' and Km='"+Km+"' and TTime='"+TTime+"' and Startlat='"+Startlat+"' and Startlong='"+Startlong+"' and Endlat='"+Endlat+"' and EndLong='"+EndLong+"'";
	//Query for t_sqlquery
		String abcd1=sql.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
	
		
	s.executeUpdate(sql);	
	
	
}
catch(Exception e)
{
	out.println(e);	
}
finally
{
	con.close();
}
%>
<table border="0">
	<tr align="center"><td><font color="BROWN" size="5"><%out.print("DELETED SUCCESSFULLY");%></font></td></tr>
	<td><a href="castrolroutes.jsp">Back To FIRST PAGE</a></td>	
	</table>

</body>
</html>
