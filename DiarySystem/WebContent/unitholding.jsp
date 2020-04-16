<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1, con2;
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

<script language="javascript" >
</script>
</head>

<body>
  <form name="unitholding" method="get" action="" onsubmit="return validate();">
  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="";
int totmanufcnt=0, tottechcnt=0, totcustcnt=0, totunitcount=0;
%>

	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="blue" size="2"> <B> Unit Holding Details </B> </font> </td>
		</tr>
	</table>

	<table border="1" width="750px">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Manufacturer / WareHouse </B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int i=1;
	sql1="select * from t_admin where URole = 'manufacturer' order by Name asc ";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String manufname=rs1.getString("Name");
		int manufcount=0;
%>
		<tr>
			<td align="center"> <%=i%> </td>
			<td align="center"> <%=rs1.getString("Name")%> </td>
<%
	sql2="select * from t_unitmaster where HoldBy='"+manufname+"' ";
	//out.print(sql2);
	rs2=stmt2.executeQuery(sql2);
	while(rs2.next())
	{
		manufcount++;
		totmanufcnt++;
	}
%>
	<td align="center"> <a href="#" onClick="window.open ('unitdetails.jsp?holdby=Manufacturer/Warehouse&holdername=<%=manufname%>', 'win1', 'width=500, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=manufcount%> </a> </td>			
		</tr>	
<%		i++;
	}	
%>
	<tr>
		<th colspan="3" align="right"> Total = <%=totmanufcnt%> </th>
	</tr>
	</table>
<br>

	<table border="1" width="750px">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Technician </B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int j=1;
	sql3="select distinct(TechName) as techname from t_techlist order by TechName asc ";
	rs3=stmt1.executeQuery(sql3);
	while(rs3.next())
	{
		String techname=rs3.getString("techname");
		int techcount=0;
%>
		<tr>
			<td align="center"> <%=j%> </td>
			<td align="center"> <%=rs3.getString("techname")%> </td>
<%
	sql4="select * from t_unitmaster where HoldBy='"+techname+"' ";
	//out.print(sql4);
	rs4=stmt2.executeQuery(sql4);
	while(rs4.next())
	{
		techcount++;
		tottechcnt++;
	}
%>
			<td align="center"> <a href="#" onClick="window.open ('unitdetails.jsp?holdby=Technician&holdername=<%=techname%>', 'win1', 'width=500, height=630, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')">  <%=techcount%> </a> </td>			
		</tr>	
<%		j++;
	}	
%>
		<tr>
			<th colspan="3" align="right"> Total = <%=tottechcnt%> </th>
		</tr>
	</table>
<br>

	<table border="1" width="750px">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Customer</B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int k=1;
	sql5="select distinct(TypeValue) as cust from t_security order by TypeValue asc ";
	rs5=stmt2.executeQuery(sql5);
	while(rs5.next())
	{
		String custname=rs5.getString("cust");
		int custcount=0;
%>
		<tr>
			<td align="center"> <%=k%> </td>
			<td align="center"> <%=rs5.getString("cust")%> </td>
<%
	sql6="select * from t_unitmaster where HoldBy='"+custname+"' ";
	//out.print(sql6);
	rs6=stmt3.executeQuery(sql6);
	while(rs6.next())
	{
		custcount++;
		 totcustcnt++;
	}
%>
			<td align="center"> <a href="#" onClick="window.open ('unitdetails.jsp?holdby=Customer&holdername=<%=custname%>', 'win1', 'width=630, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=custcount%> </a> </td>			
		</tr>	
<%		k++;
	}	
%>
		<tr>
			<th colspan="3" align="right"> Total = <%=totcustcnt%> </th>
		</tr>
	</table>
	<br>
<%
	sql7="select count(*) as cnt from t_unitmaster";
	rs7=stmt3.executeQuery(sql7);
	if(rs7.next())
	{
		totunitcount=rs7.getInt("cnt");
	}
%>

	<table border="1" width="750px">
		<tr>
			<td align="left"> <font color="blue" size="2"><B>Total no. of Units (Identified) = <%=totmanufcnt+tottechcnt+totcustcnt %> </B> </font></td>
			<td align="right"> <font color="blue" size="2"><B>Total no. of Units Manufactured = <%=totunitcount %> </B> </font></td>
		</tr>
	</table>
<% 
 con1.close();
 con2.close();
  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
<!-- code end here --->
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
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
