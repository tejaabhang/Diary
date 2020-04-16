
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">


</script>

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
<!--- code start here ------>

<!-- code end here --->
<table width="850px" height="350px" border="0">

		<tr align="center"><td>
		<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st3=conn.createStatement();
	
	st2=conn1.createStatement();
	
	String userrole=session.getAttribute("userrole").toString();
	String insert=request.getParameter("insert");
	String transporter=request.getParameter("transporter");
	
	
	
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
		
%>	

<% 
username=session.getAttribute("username").toString();

System.out.println("username:-----"+username);

	userrole=session.getAttribute("userrole").toString();
	
	System.out.println("userrole:-----"+userrole);
	
	%>	

		<tr >
		<td align="right" >
<!-- 		<div id="data"  style="margin-left: 85%;"> -->
<font size="2">
			<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			</font>
			<!-- </div> -->
			<div id="reportData">	
	<iframe id="myIframe" width="120%" height="750px" src="http://twtech.in:8080/birt/frameset?__report=Dailyreport.rptdesign&Urole=<%=userrole%>&user=<%=username%>&__showtitle=false">

	</iframe>
			</div>
			

			
		<%
}
catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
		<script>
		
// 		window.onload=birt1;
</script>		
		
		<!-- </td></tr> -->
		</table>

</body>
</html>

<%--  <%@ include file="footer.jsp" %> --%>