<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate,username,fromdate,todate;
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
transporter=request.getParameter("trans");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
try
{
	fromdate=olddate;
	todate=today;
	if(!(null==request.getParameter("calender")))
	{
		fromdate=request.getParameter("calender");
		todate=request.getParameter("calender1");
	}
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	//out.print(transporter);
	%>
	<table border="1" width="750px" align="center">
	<tr><td>
	<form name="form1" id="form1" action="" method="post">
				<table border="1" width="50%" align="right">
				<tr>
				<td><input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromdate%>" readonly/>
             <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=todate%>" readonly/>
             <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
				</tr>
								
				</table>	
				</form>		
	</td></tr>
	<tr><td align="center"><font color="brown" size="3">
	Call History of Transporter <%=transporter%>	from date <%=new SimpleDateFormat("dd-MMM-yyyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font>
	</td></tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><font color="brown" size="2">Sr.</font></td>
	<td><font color="brown" size="2">Reciever</font></td>
	<td><font color="brown" size="2">Date-Time</font></td>
	<td><font color="brown" size="2">Call Type</font></td>
	<td><font color="brown" size="2">Comment</font></td>
	<td><font color="brown" size="2">Caller</font></td>
	<td><font color="brown" size="2">Reason Of Call</font></td>
	<td><font color="brown" size="2">Vehicle Tracking</font></td>
	<td><font color="brown" size="2">FleetView</font></td>
	<td><font color="brown" size="2">Sales Followup</font></td>
	</tr>	
	<%
		sql="select * from t_callinformation where Transporter='"+transporter+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"'";
		ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst.getString("Reciever")%></td>
		<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TheDate"))%><%=" "+rst.getString("TheTime")%></td>
		<td><%=rst.getString("CallType")%></td>
		<td><%=rst.getString("CallInfo")%></td>
		<td><%=rst.getString("Caller")%></td>
		<td><%=rst.getString("reasonOfCall")%></td>
		<td><%=rst.getString("vehicleTracking")%></td>
		<td><%=rst.getString("FleetView")%></td>
		<td><%=rst.getString("salesFollowup")%></td>
		
		</tr>		
		<%
		i++;
		} 	
	%>
	</table>	
	</td></tr>
	</table>
	<%
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();

}

%>
	</table>
	
</table>
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
