<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%! Connection con; %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>LIST</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css">
	
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>


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
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<tr bgcolor="#BDBDBD">
<td align="center" colspan="2"><font color="#2A0A12" size="3"><b>Technician Information Report For  </b><%=request.getParameter("Technician") %></font></td>
	</tr>
</table>
<br></br>
<% 

try
{
	java.util.Date defaultdate = new java.util.Date();
	String DateRequest = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());	
	System.out.println("===DateRequest=================>>"+ DateRequest);
	 
	
	
	 Class.forName(MM_dbConn_DRIVER);
	 con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 Statement st=con.createStatement();
	 Statement st1=con.createStatement();
	 Statement st2=con.createStatement();
	 Statement st3=con.createStatement();
	 String Technician=request.getParameter("Technician");
	 String abc=DateRequest.substring(0, 7);
	 System.out.println(""+abc);
	 abc=abc+"-01";
	 System.out.println("now=====>"+abc);
	 NumberFormat nf=new DecimalFormat("0.00");
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	 String finalOkayUnitsToday="-",finalFaultyUnitsToday="-";
	 ///================================*****************************==============================
	 if(Technician.equalsIgnoreCase("ActiveTech"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Available</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>MobNo</b></font></th>
     </tr>
 
  <% 
//Total Active Technician----------------------------------------------------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_techlist " +
			"where Available='Yes' and TechName not in ('Transworld','customer') ";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
  	 <td><div align="left"><%=rs.getString("Available")%></div></td>
  	 <td><div align="right"><%=rs.getString("MobNo")%></div></td>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("PresentTech"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OkayUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>FaultyUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Comment</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>User</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AttendDateTime</b></font></th>
     </tr>
 
  <% 
//Present Technicians--------------------------------------------------------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_techattendance " +
	"		where AttendDateTime between '"+now+"  00:00:00' and '"+now+"  23:00:00' AND (Present ='Yes' or Present ='Half Day')";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
  	 <td><div align="right"><%=rs.getString("OkayUnitsToday")%></div></td>
  	 <td><div align="right"><%=rs.getString("FaultyUnitsToday")%></div></td>
  	 <td><div align="left"><%=rs.getString("Comment")%></div></td>
  	 <td><div align="left"><%=rs.getString("User")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AttendDateTime")))%> </div></td>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("AbsentTech"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OkayUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>FaultyUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Comment</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>User</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AttendDateTime</b></font></th>
     </tr>
 
  <% 
//Absent Technicians--------------------------------------------------------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_techattendance " +
	"		where AttendDateTime between '"+now+" 00:00:00' and '"+now+" 23:00:00' AND Present ='No'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
  	 <td><div align="right"><%=rs.getString("OkayUnitsToday")%></div></td>
  	 <td><div align="right"><%=rs.getString("FaultyUnitsToday")%></div></td>
  	 <td><div align="left"><%=rs.getString("Comment")%></div></td>
  	 <td><div align="left"><%=rs.getString("User")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AttendDateTime")))%> </div></td>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 
	 if(Technician.equalsIgnoreCase("Inspection"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>VehicleNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Customer</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Complaint</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>CDate-Time</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Action</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>PSolBy</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>PSolDate</b></font></th>
     </tr>
 
  <% 
	//Total Inspections Done----------------------------------------------------------------------------------------------
  String sql="SELECT * FROM t_complaints1 WHERE TdyDate = '"+now+"' and inspection='Yes'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("UnitNo") %></div></td>
  	 <td><div align="right"><%=rs.getString("VehicleNo")%></div></td>
  	 <td><div align="right"><%=rs.getString("Customer")%></div></td>
  	 <td><div align="right"><%=rs.getString("Complaint")%></div></td>
  	 <%
  	 try
  	 {
  		 
  	 if(rs.getString("CDate")!=null)
  	 {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("CDate")))%> <%=rs.getString("Ctime") %></div></td>
  	 <%
  	 }
  	 else
  	 {
  		 %>
  		 <td><div align="right"><%=rs.getString("CDate") %><%=rs.getString("Ctime") %></div></td>
  		 <%
  	 }
  	 }
  	 catch(Exception e)
  	 {
  		System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
  	 <%
  	 }
  	 catch(Exception e)
  	 {
  		System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("CompResolved"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>VehicleNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Customer</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Complaint</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>CDate-Time</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Action</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>PSolBy</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>PSolDate</b></font></th>
     </tr>
 
  <% 
	//Total Complaints Resolved-----------------------------------------------------------------------------------------------------
  String sql="SELECT * FROM t_complaints1 WHERE PSolDate = '"+now+"' and Status='Solved' and inspection='No'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("UnitNo") %></div></td>
  	 <td><div align="right"><%=rs.getString("VehicleNo")%></div></td>
  	 <td><div align="right"><%=rs.getString("Customer")%></div></td>
  	 <td><div align="right"><%=rs.getString("Complaint")%></div></td>
  	 <%
  	 try
  	 {
  		 
  	 if(rs.getString("CDate")!=null)
  	 {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("CDate")))%> <%=rs.getString("Ctime") %></div></td>
  	 <%
  	 }
  	 else
  	 {
  		 %>
  		 <td><div align="right"><%=rs.getString("CDate") %><%=rs.getString("Ctime") %></div></td>
  		 <%
  	 }
  	 }
  	 catch(Exception e)
  	 {
  		System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
  	 <%
  	 }
  	 catch(Exception e)
  	 {
  		System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("Replacement"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>VehRegNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OldUnitID</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>NewUnitID</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OwnerName</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>InstBy</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>EntBy</b></font></th>
        <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitLife</b></font></th>
       <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>InstDate-Time</b></font></th>
     </tr>
 
  <% 
//Total Replacement Done---------------------------------------------------------------------------------------------
  String sql="select * from db_gps.t_unitreplacement where InstType='Rep' and EntDate='"+now+"'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("VehRegNo") %></div></td>
  	 <td><div align="right"><%=rs.getString("OldUnitID") %></div></td>
  	 <td><div align="right"><%=rs.getString("NewUnitID")%></div></td>
  	 <td><div align="left"><%=rs.getString("OwnerName")%></div></td>
  	 <td><div align="left"><%=rs.getString("InstBy")%></div></td>
  	 <td><div align="left"><%=rs.getString("EntBy")%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitLife")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("InstDate")))%> <%=rs.getString("InstTime") %></div></td>
  	 
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("DispIntransit5"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitID</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OrderNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisAdd</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DispDate-Time</b></font></th>
     </tr>
 
  <% 
//Total Dispatches In-Transit 5-10 Days------------------------------------------------------------------------------------
	String sql="SELECT * FROM db_gps.t_unitmaster" +
			" WHERE DispDate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 10 DAY )" +
			" AND DispDate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 5 DAY ) " +
			"AND ( RecBytech = 'No' AND RecByCust = 'No') AND STATUS = 'Dispatched'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="right"><%=rs.getString("OrderNo") %></div></td>
  	 <td><div align="left"><%=rs.getString("DisName")%></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%> <%=rs.getString("DispTime") %></div></td>
  	 
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("RecIntransit5"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
 <tr>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Utype</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>TechName</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>RDate-Time</b></font></th>
 </tr> 
 
  <% 
   //Total Receipts In-Transit 5-10 Days-------------------------------------------------------------------------------------
	String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived " +
			"where InTransit='Yes' and Rdate>=DATE_SUB('2011-11-26',INTERVAL 10 DAY) " +
			"and Rdate<=DATE_SUB('2011-11-26',INTERVAL 5 DAY)";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
     <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="left"><%=rs.getString("Utype") %></div></td>
  	 <td><div align="left"><%=rs.getString("Transporter") %></div></td>
  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("Rdate")))%>  <%=rs.getString("Rtime") %></div></td>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("RecIntransit10"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitID</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OrderNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisAdd</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DispDate-Time</b></font></th>
     </tr>
 
  <% 
     //Total Dispatches In-Transit >10 Days------------------------------------------------------------------------------------
	
	String sql="SELECT * FROM db_gps.t_unitmaster" +
	" WHERE DispDate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 3 MONTH )" +
	" AND DispDate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 10 DAY ) " +
	"AND ( RecBytech = 'No' AND RecByCust = 'No') AND STATUS = 'Dispatched'";
  ResultSet rs=st.executeQuery(sql);
  System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="right"><%=rs.getString("OrderNo") %></div></td>
  	 <td><div align="right"><%=rs.getString("DisName")%></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%> <%=rs.getString("DispTime") %></div></td>
  	 
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("NotUsed"))
	 {
		 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>UnitID</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OrderNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DisAdd</b></font></th>
      <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>DispDate-Time</b></font></th>
     </tr>
 
  <% 
//Units Not being Used for more than 30 Days-------------------------------------------------------------------------------
	String sql="SELECT * FROM db_gps.t_unitmaster where DispDate<=DATE_SUB(CURRENT_DATE(),INTERVAL 30 DAY) " +
			"and (RecBytech='Yes' or RecByCust='Yes') and Status='Dispatched'";
	ResultSet rs=st.executeQuery(sql);
	System.out.println(">>>>>>>>>>sql:"+sql);
	int ulgt30=0;
	while(rs.next())
	{
		String unitid=rs.getString("UnitID");
		String sql27="select * from db_gps.t_vehicledetails where Status='-' and UnitID='"+unitid+"'";
		ResultSet rs27=st2.executeQuery(sql27);
		System.out.println(">>>>>>>>>>sql:"+sql27);
		if(rs27.next())
		{
			
		}else
		{
			String sql57="select * from db_gps.t_unitreplacement where NewUnitID='"+unitid+"' and EntDate>='"+rs.getString("DispDate")+"'";
			ResultSet rs57=st3.executeQuery(sql57);
			System.out.println(">>>>>>>>>>sql:"+sql57);
			if(rs57.next())
			{
				
			}else
			{
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="right"><%=rs.getString("OrderNo") %></div></td>
  	 <td><div align="right"><%=rs.getString("DisName")%></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd")%></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%> <%=rs.getString("DispTime") %></div></td>
  	 
  	 </tr>
  <% 
  Srno++;
  
  }
  }
  }%>
  </table>
 <%
		
 }
	 if(Technician.equalsIgnoreCase("OkayVerbal"))
	 {
		 
	   int Srno=1;
		 %>	 
      <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OkayUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>FaultyUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Comment</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>User</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AttendDateTime</b></font></th>
     </tr>
 
  <% 
//Total Okay Units with Tech Present (Attendance)-------------------------------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_techattendance " +
	"		where AttendDateTime between '"+now+" 00:00:00' and '"+now+" 23:59:59'";
	System.out.println(">>>>>>>sql:"+sql);	
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
	  %>
	    <tr>
	  	 <td><div align="right"><%= Srno %></div></td>
	  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
	  	 <td><div align="right"><%=rs.getString("OkayUnitsToday")%></div></td>
	  	 <td><div align="right"><%=rs.getString("FaultyUnitsToday")%></div></td>
	  	 <td><div align="left"><%=rs.getString("Comment")%></div></td>
	  	 <td><div align="left"><%=rs.getString("User")%></div></td>
	  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AttendDateTime")))%> </div></td>
	  	 </tr>
	  <% 
	  Srno++;
	  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("OkaySystem"))
	 {
		 
	   int Srno=1;
	   int okayunits=0;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Available</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>MobNo</b></font></th>
     </tr>
 
  <% 
    String sql="SELECT * FROM db_CustomerComplaints.t_techlist WHERE Available = 'Yes' and TechName not in ('Transworld','customer')";
	ResultSet rs=st1.executeQuery(sql);
	System.out.println(">>>>>>>sql:"+sql);
	while(rs.next())
	{
		String sql32="select count(UnitID) as cnt from db_gps.t_unitmaster where HoldBy='"+rs.getString("TechName")+"' and FaultyUnit='No' ";
		System.out.println(">>>>>>sql32:"+sql32);
		ResultSet rs32=st2.executeQuery(sql32);
	   while(rs32.next())
	   {
		    //int cnt=rs32.getInt("cnt");
			//System.out.println("cnt---->"+cnt);
			//okayunits=okayunits+cnt;
			 //System.out.println("okayunits-------->"+okayunits);
  %>
       <tr>
  	      <td><div align="right"><%= Srno %></div></td>
  	      <td><div align="left"><%=rs.getString("TechName") %></div></td>
  	      <td><div align="left"><%=rs.getString("Available")%></div></td>
  	      <td><div align="right"><%=rs.getString("MobNo")%></div></td>
  	   </tr>
  <% 
  Srno++;
  }
  }
  %>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("FaultyVerbal"))
	 {
		 
	   int Srno=1;
		 %>	 
      <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OkayUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>FaultyUnitsToday</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Comment</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>User</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AttendDateTime</b></font></th>
     </tr>
 
  <% 
//Total Okay Units with Tech Present (Attendance)-------------------------------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_techattendance " +
	"		where AttendDateTime between '"+now+" 00:00:00' and '"+now+" 23:59:59'";
	System.out.println(">>>>>>>sql:"+sql);	
	ResultSet rs=st.executeQuery(sql);
	 while(rs.next())
	  {
	  %>
	    <tr>
	  	 <td><div align="right"><%= Srno %></div></td>
	  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
	  	 <td><div align="right"><%=rs.getString("OkayUnitsToday")%></div></td>
	  	 <td><div align="right"><%=rs.getString("FaultyUnitsToday")%></div></td>
	  	 <td><div align="left"><%=rs.getString("Comment")%></div></td>
	  	 <td><div align="left"><%=rs.getString("User")%></div></td>
	  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AttendDateTime")))%> </div></td>
	  	 </tr>
	  <% 
	  Srno++;
	  }%>
  </table>
 <% 	 }
	 if(Technician.equalsIgnoreCase("FaultySystem"))
	 {
		 
		 
		   int Srno=1;
			 %>	 
	     <table border="1" width="100%" align="left" class="sortable">
	     <tr>
	     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
	     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>TechName</b></font></th>
	     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Available</b></font></th>
	     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>MobNo</b></font></th>
	     </tr>
	 
	  <% 
	  int okayunits=0;
		int faulty=0;
	String sql="SELECT * FROM db_CustomerComplaints.t_techlist WHERE Available = 'Yes' and TechName not in ('Transworld','customer')";
	ResultSet rs=st1.executeQuery(sql);
	while(rs.next())
	{
		String sql32="select count(UnitID) as cnt from db_gps.t_unitmaster where HoldBy='"+rs.getString("TechName")+"' and FaultyUnit='No' ";
		  System.out.println(sql32);
		ResultSet rs32=st2.executeQuery(sql32);
		while(rs32.next())
		{
			//String cnt=rs32.getString("UnitID");
			//okayunits=okayunits+","+cnt;
			int cnt=rs32.getInt("cnt");
			System.out.println("cnt---->"+cnt);
			okayunits=okayunits+cnt;
			System.out.println("okayunits"+okayunits);
		}
		
		String sql33="select count(UnitID) as cnt from db_gps.t_unitmaster where HoldBy='"+rs.getString("TechName")+"' and FaultyUnit='Yes' ";
	System.out.println(sql33);
		ResultSet rs33=st2.executeQuery(sql33);
		while(rs33.next())
		{
			
			int cnt=rs33.getInt("cnt");
			faulty=faulty+cnt;
		
	  %>
	    <tr>
	  	 <td><div align="right"><%= Srno %></div></td>
	  	 <td><div align="left"><%=rs.getString("TechName") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Available")%></div></td>
	  	 <td><div align="right"><%=rs.getString("MobNo")%></div></td>
	  	 </tr>
	  <% 
	  Srno++;
		} 
		
		}%>
  </table>
 <% 	
		
		
	 }
}catch(Exception e)
{
}
finally
{
	con.close();	
}
 %>
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