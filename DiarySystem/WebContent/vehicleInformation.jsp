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
<td align="center" colspan="2"><font color="#2A0A12" size="3"><b>Vehicle Information Report For  </b><%=request.getParameter("information") %></font></td>
	</tr>
</table>
<br></br>
<% 

try
{
	java.util.Date defaultdate = new java.util.Date();
	String DateRequest = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());	
	//System.out.println("===DateRequest=================>>"+ DateRequest);
	 
	
	
	 Class.forName(MM_dbConn_DRIVER);
	 con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 Statement st=con.createStatement();
	 Statement st1=con.createStatement();
	 Statement st2=con.createStatement();
	 Statement st3=con.createStatement();
	 String information=request.getParameter("information");
	 String abc=DateRequest.substring(0, 7);
	 //System.out.println(""+abc);
	 abc=abc+"-01";
	 //System.out.println("now=====>"+abc);
	 NumberFormat nf=new DecimalFormat("0.00");
	 
	 ///================================*****************************==============================
	 if(information.equalsIgnoreCase("CompPending1to7"))
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
//	Total Complaints Pending 1-7 Days--------------------------------------------------------------------------------------------------------
	String sql="SELECT * FROM db_CustomerComplaints.t_complaints1 " +
			"WHERE `Result` = 'Unsolved' " +
			"AND `VehAvaildate` > DATE_SUB( CURRENT_DATE( ) , INTERVAL 7 DAY )";
  ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
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
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  		if(rs.getString("PSolDate")!=null)
  	  	 {
  	 
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
  	 <%
  	  	}
  	  	 else
  	  	 {
  	  		 %>
  	  		 <td><div align="right"><%=rs.getString("PSolDate") %><%=rs.getString("PSolTime") %></div></td>
  	  		 <%
  	  	 }
  	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 
	 if(information.equalsIgnoreCase("CompPending7"))
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
    String sql="SELECT * FROM db_CustomerComplaints.t_complaints1 " +
	"WHERE `Result` = 'Unsolved' " +
	"AND `VehAvaildate` < DATE_SUB( CURRENT_DATE( ) , INTERVAL 8 DAY ) " +
	"AND `VehAvaildate` > DATE_SUB( CURRENT_DATE( ) , INTERVAL 15 DAY )";
	ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
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
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  		if(rs.getString("PSolDate")!=null)
 	  	 {
 	 
 	 %>
 	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
 	 <%
 	  	}
 	  	 else
 	  	 {
 	  		 %>
 	  		 <td><div align="right"><%=rs.getString("PSolDate") %><%=rs.getString("PSolTime") %></div></td>
 	  		 <%
 	  	 }
  	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 
	 if(information.equalsIgnoreCase("CompPending15"))
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
  String sql="SELECT * FROM db_CustomerComplaints.t_complaints1 " +
	"WHERE `Result` = 'Unsolved' " +
	"AND `VehAvaildate` < DATE_SUB( CURRENT_DATE( ) ,INTERVAL 15 DAY )";
  ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
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
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  	 if(rs.getString("PSolDate")!=null)
 	  	 {
 	 
 	 %>
 	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
 	 <%
 	  	}
 	  	 else
 	  	 {
 	  		 %>
 	  		 <td><div align="right"><%=rs.getString("PSolDate") %><%=rs.getString("PSolTime") %></div></td>
 	  		 <%
 	  	 }
  	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(information.equalsIgnoreCase("CompCreation"))
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
    String sql="SELECT * FROM db_CustomerComplaints.t_complaints1 " +
	"WHERE `Result` = 'Unsolved' " +
	"AND `TdyDate` < DATE_SUB( CURRENT_DATE( ) , INTERVAL 15 DAY )";
  ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
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
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  		 
  	  if(rs.getString("PSolDate")!=null)
   	  {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
  	 <%
   	}
    	
   	 else
   	 {
   		 %>
   		 <td><div align="right"><%=rs.getString("PSolDate") %><%=rs.getString("PSolTime") %></div></td>
   		 <%
   	 }
   	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(information.equalsIgnoreCase("ReCompDone"))
	 {
		 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>VehRegNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Transporter</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OldLocation</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OldTechnician</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>NewLocation</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>NewTechnician</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AllocatedBy</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Reason</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AlocationDateTime</b></font></th>
     </tr>
 
  <% 
  String sql="SELECT * " +
	"FROM t_reallocated " +
	"WHERE UpdatedDateTime >='"+now+" 00:00:00' " +
	"AND UpdatedDateTime <= '"+now+" 23:59:59'";
  ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("VehRegNo")%></div></td>
  	 <td><div align="left"><%=rs.getString("Transporter")%></div></td>
  	 <td><div align="left"><%=rs.getString("OldLocation")%></div></td>
  	 <td><div align="left"><%=rs.getString("OldTechnician")%></div></td>
  	 <td><div align="left"><%=rs.getString("NewLocation")%></div></td>
  	 <td><div align="left"><%=rs.getString("NewTechnician")%></div></td>
  	 <td><div align="left"><%=rs.getString("AllocatedBy")%></div></td>
  	 <td><div align="left"><%=rs.getString("Reason")%></div></td>
  	 <%
  	 try
  	 {
  	 if(rs.getString("AlocationDateTime")!=null)
  	   {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AlocationDateTime")))%> </div></td>
  	 <%
  	  }
  	
  	 else
  	 {
  		 %>
  		 <td><div align="right"><%=rs.getString("AlocationDateTime") %></div></td>
  		 <%
  	 }
  	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 %>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(information.equalsIgnoreCase("ReOfOpenComp"))
	 {
		 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); 
	   int Srno=1;
		 %>	 
     <table border="1" width="100%" align="left" class="sortable">
     <tr>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>VehRegNo</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Transporter</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OldLocation</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>OldTechnician</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>NewLocation</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>NewTechnician</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AllocatedBy</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Reason</b></font></th>
     <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>AlocationDateTime</b></font></th>
     </tr>
 
  <% 
  String sql="SELECT * " +
	"FROM t_reallocated " +
	"WHERE UpdatedDateTime >='"+now+" 00:00:00' " +
	"AND UpdatedDateTime <= '"+now+" 23:59:59'";
  ResultSet rs=st.executeQuery(sql);
  //System.out.println(">>>>>>>>>sql:"+sql);
  while(rs.next())
  {
	  String Tno=rs.getString("Tno");
		String sql38="SELECT * " +
		"FROM t_complaints1 " +
		"WHERE `Result` = 'Unsolved' and Tno='"+Tno+"'";
		ResultSet rs38=st2.executeQuery(sql38);
		if(rs38.next())
		{
		 //System.out.println("complant is not yet solved");
		}
		else
		{  
  
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="right"><%=rs.getString("VehRegNo")%></div></td>
  	 <td><div align="left"><%=rs.getString("Transporter")%></div></td>
  	 <td><div align="left"><%=rs.getString("OldLocation")%></div></td>
  	 <td><div align="left"><%=rs.getString("OldTechnician")%></div></td>
  	 <td><div align="left"><%=rs.getString("NewLocation")%></div></td>
  	 <td><div align="left"><%=rs.getString("NewTechnician")%></div></td>
  	 <td><div align="left"><%=rs.getString("AllocatedBy")%></div></td>
  	 <td><div align="left"><%=rs.getString("Reason")%></div></td>
  	 <%
  	 try
  	 {
  	 if(rs.getString("AlocationDateTime")!=null)
  	   {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("AlocationDateTime")))%> </div></td>
  	 <%
  	  }
  	
  	 else
  	 {
  		 %>
  		 <td><div align="right"><%=rs.getString("AlocationDateTime") %></div></td>
  		 <%
  	 }
  	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 %>
  	 </tr>
  <% 
  Srno++;
  }
  }%>
  </table>
 <% 	 }
	 if(information.equalsIgnoreCase("OutOfWarrantyVehicle"))
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
//	Total Out of Warranty Vehicle Attended – complaint closed of out of warranty / not inspection------------------------------------------------
	String sql="select * from db_CustomerComplaints.t_complaints1 where Status='Solved' and PSolDate=DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) and inspection='No'";
	ResultSet rs=st.executeQuery(sql);
	//System.out.println(">>>>>>>sql:"+sql);
	while (rs.next())
	{
		String VehicleNo=rs.getString("VehicleNo");
		//System.out.println(VehicleNo);
		String sql56="select * from db_gps.t_amchistory where VehNo = '"+VehicleNo+"' order by NewDate desc limit 1";
		ResultSet rs56=st2.executeQuery(sql56);
		//System.out.println(">>>>>>>sql56:"+sql56);
		if(rs56.next())
		{
			String WarrantyTill=rs56.getString("WarrantyTill");
			if(!(null==WarrantyTill))
			{
			try{	
			String sql57="select TO_DAYS('"+WarrantyTill+"')-TO_DAYS(CURRENT_DATE()) as days";
			ResultSet rs57=st3.executeQuery(sql57);
			//System.out.println(">>>>>>>sql57:"+sql57);
			if(rs57.next())
			{
				//out.print(rsamc1.getInt("days"));
				if(rs57.getInt("days") > 0)
				{
					
				}
				else
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
  		//System.out.println(">>>>>>>>1:"+e);
  	 }
  	 
  	 %>
  	 <td><div align="right"><%=rs.getString("Action")%></div></td>
  	 <td><div align="right"><%=rs.getString("PSolBy")%></div></td>
  	<%
  	 try
  	 {
  		 
  	  if(rs.getString("PSolDate")!=null)
   	  {
  	 %>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("PSolDate")))%> <%=rs.getString("PSolTime") %></div></td>
  	 <%
   	}
    	
   	 else
   	 {
   		 %>
   		 <td><div align="right"><%=rs.getString("PSolDate") %><%=rs.getString("PSolTime") %></div></td>
   		 <%
   	 }
   	 }
  	 catch(Exception e)
  	 {
  		//System.out.println(">>>>>>>>2:"+e);
  	 }
  	 
  	 %>
  	 </tr>
  <% 
  Srno++;
  }
  }
			}
			
			catch(Exception X)
			{
			}
			}
		}
		}
		%>
  </table>
 <% 	 }
	 if(information.equalsIgnoreCase("outOfWarrantyEmail"))
	 {
		 
		 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		 %> 
	
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>vahno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>subject</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>body</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>fromid</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Toid</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UpdatedDateTime</b></font></th>
	 </tr> 
	 <% 
	    int Srno=1;
//		Total Out Of Warranty Email Sent to Customer-----------------------------------------------------------------------------------------------
		String sql="SELECT * FROM db_CustomerComplaints.t_emailmaster " +
		"WHERE template LIKE ('%Out of Warranty%')" +
		"AND UpdatedDateTime >= '"+now+" 00:00:00' " +
		"AND UpdatedDateTime <= '"+now+" 23:59:59' ";
         //System.out.println(">>>>>>>>>sql:"+sql);
		ResultSet rs=st.executeQuery(sql);

		while(rs.next())
        {
	%>
	  	 <tr>
	  	 <td><div align="right"><%=Srno%></div></td>
	  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
	  	 <td><div align="left"><%=rs.getString("vahno") %></div></td>
	  	 <td><div align="left"><%=rs.getString("transporter") %></div></td>
	  	 <td><div align="left"><%=rs.getString("subject") %></div></td>
	  	 <td><div align="left"><%=rs.getString("body") %></div></td>
	  	 <td><div align="left"><%=rs.getString("fromid") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Toid") %></div></td>
	  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("UpdatedDateTime")))%> </div></td>
	  	 </tr>
	 
	 <% 
	 Srno++;
	 }
	 %>
	 </table>
	 <% }
	 if(information.equalsIgnoreCase("SpecialEmail"))
	 {
		 
		 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		 %> 
	
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>vahno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>subject</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>body</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>fromid</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Toid</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UpdatedDateTime</b></font></th>
	 </tr> 
	 <% 
	    int Srno=1;
//		Total Out Of Warranty Email Sent to Customer-----------------------------------------------------------------------------------------------
		String sql="SELECT * FROM db_CustomerComplaints.t_emailmaster " +
		"WHERE template LIKE ('%Special Report%')" +
		"AND UpdatedDateTime >= '"+now+" 00:00:00' " +
		"AND UpdatedDateTime <= '"+now+" 23:59:59' ";
         //System.out.println(">>>>>>>>>sql:"+sql);
		ResultSet rs=st.executeQuery(sql);

        while(rs.next())
        {
	%>
	  	 <tr>
	  	 <td><div align="right"><%=Srno%></div></td>
	  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
	  	 <td><div align="left"><%=rs.getString("vahno") %></div></td>
	  	 <td><div align="left"><%=rs.getString("transporter") %></div></td>
	  	 <td><div align="left"><%=rs.getString("subject") %></div></td>
	  	 <td><div align="left"><%=rs.getString("body") %></div></td>
	  	 <td><div align="left"><%=rs.getString("fromid") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Toid") %></div></td>
	  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("UpdatedDateTime")))%> </div></td>
	  	 </tr>
	 
	 <% 
	 Srno++;
	 }
	 %>
	 </table>
	 <% }
	 if(information.equalsIgnoreCase("ReportGenerate"))
	 {
		 
		 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		 %> 
	
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>VehRegNo</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Complaint</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Technician</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Comment</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>EnterDate</b></font></th>
	 </tr> 
	 <% 
	    int Srno=1;
//		Total Special Report Generated-------------------------------------------------------------------------------------------------------------
		String sql="SELECT * FROM t_specialreports " +
				"WHERE EnterDate >= '"+now+" 00:00:00' " +
				"AND EnterDate <= '"+now+" 23:59:59'";
         //System.out.println(">>>>>>>>>sql:"+sql);
		ResultSet rs=st.executeQuery(sql);

        while(rs.next())
        {
	%>
	  	 <tr>
	  	 <td><div align="right"><%=Srno%></div></td>
	  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
	  	 <td><div align="left"><%=rs.getString("VehRegNo") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Transporter") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Complaint") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Technician") %></div></td>
	  	 <td><div align="left"><%=rs.getString("Comment") %></div></td>
	  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("EnterDate")))%> </div></td>
	  	 </tr>
	 
	 <% 
	 Srno++;
	 }
	 %>
	 </table>
	 <% }
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