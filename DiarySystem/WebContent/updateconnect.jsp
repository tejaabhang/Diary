<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con;
Statement s,s1,stmtinsert;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
<% 
try
{
	Class.forName(MM_dbConn_DRIVER);
	con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	s=con.createStatement();
	s1=con.createStatement();
	stmtinsert=con.createStatement();
}
catch(Exception e)
{
	out.println(e);
}
%>
<%
try
{
	
	String OldStartPlace="",OldEndPlace="";
Double OldKm=0.0,OldTTime=0.0,OldStartlat=0.0,OldStartlong=0.0,OldEndlat=0.0,OldEndLong=0.0;
	String newStartPlace=request.getParameter("StartPlace");
	String newEndPlace=request.getParameter("EndPlace");
	String newStartcode=request.getParameter("startcode2");
	String newEndcode=request.getParameter("endcode2");
	String newKm=request.getParameter("Km");
	String newTTime=request.getParameter("TTime");
	String newStartlat=request.getParameter("Startlat");
    String newStartlong=request.getParameter("Startlong");
	String newEndlat=request.getParameter("Endlat");
	String newEndLong=request.getParameter("EndLong");
	Calendar cal= Calendar.getInstance();
	String UpdateDate=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String user=session.getAttribute("username").toString();
	String status="updated";

    String sql1	= "select * from t_castrolroutes where  StartPlace='"+newStartPlace+"'  and EndPlace='"+newEndPlace+"' ";
    ResultSet rs= s1.executeQuery(sql1);    
	while(rs.next())
	{
		 OldKm=rs.getDouble("Km");
		 OldTTime=rs.getDouble("TTime");
		 OldStartlat=rs.getDouble("Startlat");
		 OldStartlong=rs.getDouble("Startlat");
		 OldEndlat=rs.getDouble("Endlat");
		 OldEndLong=rs.getDouble("EndLong");
	}
   
     String sql="update t_castrolroutes set Km='"+newKm+"',TTime='"+newTTime+"',Startlat='"+newStartlat+"',Startlat='"+newStartlat+"',Startlong='"+newStartlong+"',Endlat='"+newEndlat+"',EndLong='"+newEndLong+"' where StartPlace='"+newStartPlace+"'  and EndPlace='"+newEndPlace+"'";
   //Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	 s.executeUpdate(sql);	
		
	 String sql2="insert into t_CastrolRoutesHistory(OldStartCode,OldStartPlace,OldEndCode,OldEndPlace,OldKm,OldTTime,OldStartlat,OldStartlong,OldEndlat,OldEndLong,NewStartCode,NewStartPlace,NewEndCode,NewEndPlace,NewKm,NewTTime,NewStartlat,NewStartlong,NewEndlat,NewEndLong,UpdateDate,Insertedby,status)Values('"+newStartcode+"','"+newStartPlace+"','"+newEndcode+"','"+newEndPlace+"','"+OldKm+"','"+OldTTime+"','"+OldStartlat+"','"+OldStartlong+"','"+OldEndlat+"','"+OldEndLong+"','"+newStartcode+"','"+newStartPlace+"','"+newEndcode+"','"+newEndPlace+"','"+newKm+"','"+newTTime+"','"+newStartlat+"','"+newStartlong+"','"+newEndlat+"','"+newEndLong+"','"+UpdateDate+"','"+user+"','"+status+"')";
	//Query for t_sqlquery
		String abcd1=sql2.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
	 s.executeUpdate(sql2);	
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
	<tr align="center"><td><font color="BROWN" size="5"><%out.print("UPDATED SUCCESSFULLY");%></font></td></tr>
	<td><a href="castrolroutes.jsp">Back To FIRST PAGE</a></td>	
	</table>

</body>
</html>
