<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<title>Insert title here</title>
</head>
<body>
 <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <p></p>
  <%@ include file="header1.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<%!
Connection con;
Statement s,stmtinsert;

%>
<% 
try
{
	Class.forName(MM_dbConn_DRIVER);
	con= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	s=con.createStatement();
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
	
	
	String OldStartPlace=request.getParameter("StartPlace");
	
	String OldEndPlace=request.getParameter("EndPlace");
	String OldStartcode=request.getParameter("startcode1");
	String OldEndcode=request.getParameter("endcode1");
	String OldKm=request.getParameter("Km");
	String OldTTime=request.getParameter("TTime");
	String OldStartlat=request.getParameter("Startlat");
	
	String OldStartlong=request.getParameter("Startlong");
	String OldEndlat=request.getParameter("Endlat");
	String OldEndLong=request.getParameter("EndLong");
	Calendar cal= Calendar.getInstance();
	String UpdateDate=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String user=session.getAttribute("username").toString();
	String status="deleted";

   
		
	 String sql2="insert into t_CastrolRoutesHistory(OldStartCode,OldStartPlace,OldEndCode,OldEndPlace,OldKm,OldTTime,OldStartlat,OldStartlong,OldEndlat,OldEndLong,UpdateDate,Insertedby,status)Values('"+OldStartcode+"','"+OldStartPlace+"','"+OldEndcode+"','"+OldEndPlace+"','"+OldKm+"','"+OldTTime+"','"+OldStartlat+"','"+OldStartlong+"','"+OldEndlat+"','"+OldEndLong+"','"+UpdateDate+"','"+user+"','"+status+"')";
	//Query for t_sqlquery
		String abcd=sql2.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
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