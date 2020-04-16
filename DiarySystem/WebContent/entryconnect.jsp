<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
Statement s1,stmtinsert;

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
	con1=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	s1=con1.createStatement();
	stmtinsert=con1.createStatement();
}
catch(Exception e)
{
	out.println(e);
}
%>
<%
try
{
	String OwnerName=request.getParameter("OwnerName");
	////System.out.println(OwnerName);
	String StartCode=request.getParameter("StartCode");
	String StartPlace=request.getParameter("StartPlace");
	String EndCode=request.getParameter("EndCode");
	String EndPlace=request.getParameter("EndPlace");
	String Km=request.getParameter("Km");
	String TTime=request.getParameter("TTime");
	String Startlat=request.getParameter("Startlat");
	String Startlong=request.getParameter("Startlong");
	String Endlat=request.getParameter("Endlat");
	String EndLong=request.getParameter("EndLong");
	String radio2=request.getParameter("radio2");
	String zone=request.getParameter("zone");
	String RCode=StartCode+"-"+EndCode;
	
	java.util.Date defoultdate = new java.util.Date();
	String today=new SimpleDateFormat("yyyy-MM-dd").format(defoultdate);
	String user=session.getAttribute("username").toString();
		
	
	String sql="insert into t_castrolroutes(StartCode,StartPlace,EndCode,EndPlace,Km,TTime,Startlat,Startlong,Endlat,EndLong,Updateddate,EntBy,Owner)Values('"+StartCode+"','"+StartPlace+"','"+EndCode+"','"+EndPlace+"','"+Km+"','"+TTime+"','"+Startlat+"','"+Startlong+"','"+Endlat+"','"+EndLong+"','"+today+"','"+user+"','"+OwnerName+"')";
	//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	s1.executeUpdate(sql);
	if(radio2.equalsIgnoreCase("Fixed"))
	{
		String sql1="insert into t_routedetails(RCode,Owner,Start,Startlat,Startlon,End,Endlat,Endlon,FixedTime,FixedDistance,Zone,EntBy)Values('"+RCode+"','"+OwnerName+"','"+StartPlace+"','"+Startlat+"','"+Startlong+"','"+EndPlace+"','"+Endlat+"','"+EndLong+"','"+TTime+"','"+Km+"','"+zone+"','"+user+"')";
		//Query for t_sqlquery
		String abcd1=sql1.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
		s1.executeUpdate(sql1);
		
		String sql11="insert into t_routeorderpoints(RCode,Place,Lat,Lon,PointOrder)Values('"+RCode+"','"+StartPlace+"','"+Startlat+"','"+Startlong+"','1')";
		//Query for t_sqlquery
		String abcd2=sql11.replace("'","#");	
		abcd2=abcd2.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
		
		s1.executeUpdate(sql11);
		String sql111="insert into t_routeorderpoints(RCode,Place,Lat,Lon,PointOrder)Values('"+RCode+"','"+EndPlace+"','"+Endlat+"','"+EndLong+"','2')";
		//Query for t_sqlquery
		String abcd3=sql111.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
		s1.executeUpdate(sql111);
	}
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
 <table border="0">
	<tr align="center"><td><font color="BROWN" size="5"><%out.print("INSERTED SUCCESSFULLY");%></font></td></tr>
	<td><a href="castrolroutes.jsp">Back To FIRST PAGE</a></td>	
	</table>


</body>
</html>
