<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2;
//st3,st33,st4,st5,st6,st7,st8,st9,st10,st11,st51,st12,st13;
String sql,sql1,sql2;
//,today,olddate,username,userrole,thename,sql3,sql33,sql4,sql5,sql6,sql7,sql8,sql9,sql10;
String fromdate,todate;
//int Ocount,Icount,CAcount,CAvcount=0,CScount,CPcount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
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
	function fun2()
	{	
		
				 //getElementById("calender").value);
		var dt1 = document.form1.calender.value; 
		//alert("dt1---->" +dt1);
		var dt2 = document.form1.calender1.value;
		var representative  = document.form1.hiddenrep.value; 
		
		document.form1.action ="Representative_Detail.jsp?representative="+representative+"&date1="+dt1+"&date2="+dt2;									
		alert("ok i am in fun 2");
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
String representative = request.getParameter("representative");
String fromdate = request.getParameter("date1");
String todate = request.getParameter("date2");
String myfromdate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
String mytodate = new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));

%>
<table border="0" width="750px" align="center">
<tr>
<td>							
				<form name="form1"  action="" method="post">
					<table border="1" width="100%" align="center">		
					<tr>
							<td>
								<input type="hidden" id="hiddenrep" name="hiddenrep" size="13" class="formElement" value="<%=representative%>" readonly="readonly"/>
								<input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromdate%>" readonly="readonly"/>
             					<input type="button" name="trigger" id="trigger" value="From Date" class="formElement"/>
             					<script type="text/javascript">
             						Calendar.setup(
             						{
                 						inputField  : "calender",         // ID of the input field
                 						ifFormat    : "%Y-%m-%d",     // the date format
                 						button      : "trigger"       // ID of the button
            						}
                           		);
             					</script>
             				</td>
							<td>
								<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=todate%>" readonly="readonly"/>
             					<input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement"/>
             							<script type="text/javascript">
             								Calendar.setup(
             									{
                 									inputField  : "calender1",         // ID of the input field
                 									ifFormat    : "%Y-%m-%d",     // the date format
                 									button      : "trigger1"       // ID of the button
             									}
                           					);
             							</script>
             				</td>
							<td>
									<input type="submit" name="Submit" value="Submit" class="formElement"  onclick="fun2();"/>
							</td>
					</tr>
				</table>
</form>

					
<tr>
<div align="center" width = "100%"><font color="brown">SMS alert Report for <%= representative %> from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>

<table border="1" width="100%" class="sortable">
<tr>
<th>Sr.</th>
<td>Vehicle number</td>
<td>Transporter</td>
<td>Technician name</td>
<td>Vehicle availability date</td>
<td>Contact details</td>
<td>SMS Date and Time sent</td>
<td>Representative Name</td>
<td>Reallocation/Allocation</td>
</tr>


<%
try
{
	// <%= request.getContextPath() +"./DiarySystem/
	
////System.out.println("i am in representative detail");
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();

sql="SELECT * FROM `t_ComplaintAllocationSMS` where Trim(AllotedBy) like Trim('"+ representative +"') and Complaint_date BETWEEN ' " + myfromdate + "' AND '" + mytodate+ "'";
////System.out.println("sql...............!!!!" + sql);
ResultSet rst=st.executeQuery(sql);
int i = 1;
while (rst.next())
{
%>

<tr>
<td><%= i++ %></td>
<td><%= rst.getString ("VehicleNo") %></td>
<td><%= rst.getString ("Transporter") %></td>
<td><%= rst.getString ("TechName") %></td>
<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString ("VehAvaildate")));
%>
<td><%= available_dt %></td>
<td><%= rst.getString ("ContDets") %></td>
<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString ("Complaint_date")));
%>
<td><%= complaint_dt %></td>
<td><%= rst.getString ("AllotedBy")%></td>
<td><%= rst.getString ("data_type")%></td>
</tr>

<%
}
}

catch(Exception e){} %>
</form>	
</table>
</table>
</body>
</html>