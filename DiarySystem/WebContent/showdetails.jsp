<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String today,res;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
	function fun1()
	{
		document.form1.submit();
	}	
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
<%
today=request.getParameter("today");
res=request.getParameter("res");
//out.print(today+"  "+res);
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
}
catch(Exception e)
{
	out.print("Exception-->"+e);
}
%>
<table border="1" width="750px">
<tr><td align="center"><div><font color="brown"><b><u><i>Call Information, Date :- <%
Format fr = new SimpleDateFormat("dd-MMM-yyyy");
java.util.Date dt=new SimpleDateFormat("yyyy-MM-dd").parse(today);
String dtt=fr.format(dt);
out.print(dtt);
%></i></u></b></font>
</div>
<div align="right">
<form action="" method="get" name="form1" id="form1">
<input type="text" id="today" name="today" size="13" class="formElement" value="<%=today%>" onchange="fun1()"; readonly/>
<input type="button" name="trigger" id="trigger" value="Date" class="formElement">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "today",         // ID of the input field
      ifFormat    : "%Y-%m-%d",     // the date format
      button      : "trigger"       // ID of the button
    }
  );
</script>
<input type="hidden" name="res" value=<%=res%>>
 <!-- <input type="submit" name="Submit" value="Submit" class="formElement"> -->
 
</form>
</div></td></tr>
<tr><td>
<table width="100%" class="sortable">
<tr>
<td><font color="brown"><b>Sr.</b></font></td>
<td><font color="brown"><b>Contact Name</b></font></td>
<td><font color="brown"><b>Date</b></font></td>
<td><font color="brown"><b>Time</b></font></td>
<td><font color="brown"><b>Caller</b></font></td>
<td><font color="brown"><b>Comment</b></font></td>
<td><font color="brown"><b>Transporter</b></font></td>
</tr>
<%
try{
sql="select * from t_callinformation where Reciever='"+res+"' and TheDate='"+today+"'";
ResultSet rst=st.executeQuery(sql);
int i=1;
while(rst.next())
{
%>
<tr>
<td><%=i%></td>
<td><%=rst.getString("Reciever")%></td>
<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TheDate"))%></td>
<td><%=rst.getString("TheTime")%></td>
<td><%=rst.getString("Caller")%></td>
<td><%=rst.getString("Callinfo")%></td>
<td><%=rst.getString("Transporter")%></td>
</tr>
<%
i++;
}
}
catch(Exception e)
{
	out.print("Exception-->"+e);
}
%>
</table>
</td></tr></table>
		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
