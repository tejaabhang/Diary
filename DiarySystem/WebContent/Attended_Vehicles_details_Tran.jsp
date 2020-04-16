<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st13;
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
String transporter = request.getParameter("transporter");
String fromdate = request.getParameter("date1");
String todate = request.getParameter("date2");
String myfromdate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
String mytodate = new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));

%>
<div align="center"><font color="brown" size="2">SMS alert Report for <%= transporter %> from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
<br></br>

<table border="1" width="100%" class="sortable">
<tr>
<td>Sr.</td>
<td>Vehicle number</td>
<td>Transporter</td>
<td>Technician name</td>
<td>Vehicle availability date</td>
<td>Contact details</td>
<td>SMS Date and Time sent</td>
<td>Representative Name</td>
<!-- <td>Allocation/Reallocation</td> -->
</tr>


<%
try
{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st13=conn.createStatement();
sql="SELECT * FROM `t_ComplaintAllocationSMS` where Transporter like '"+transporter + "' and Complaint_date BETWEEN ' " + myfromdate + "' AND '" + mytodate+ "'";	
//System.out.println("sql---->" + sql);
ResultSet rst=st.executeQuery(sql);
int i = 1;
while (rst.next())

	
	
{
	int tno = rst.getInt("Tno");
	
	String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
	//System.out.println("sql3---->" + sql3);
	ResultSet rst3=st13.executeQuery(sql3);

	if (rst3.next())
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

<%
//String sql1 = "SELECT count(*) as allocation_count FROM `t_ComplaintAllocationSMS` where TechName like '"+ rst.getString ("TechName") + "' and Complaint_date BETWEEN '"+ fromdate + "' AND '" + todate  + "' and VehicleNo like '" + rst.getString ("VehicleNo") + "'";
//System.out.println("sql1");
//ResultSet rst1=st1.executeQuery(sql1);
//if(rst1.next())
	}
}

}

catch(Exception e){}

%>
</table>
</body>
</html>