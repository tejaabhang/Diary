<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"  errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%! 
Connection con,con1;
%>
<html>
<head>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Diary System.</title>
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
		<td align="center" colspan="2"><font color="#2A0A12" size="3"><b>Service And Repaire Report for <%=request.getParameter("repaire") %></b></font></td>
	</tr>
</table>
<br></br>
<%
try{
 Class.forName(MM_dbConn_DRIVER);
 con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 Statement st=con.createStatement();
 Statement st2=con.createStatement();
 Statement st3=con.createStatement();
 Statement st4=con.createStatement();
 Statement stmt1 = con1.createStatement();
 Statement stmt2 = con.createStatement();
 Statement stmt3 = con.createStatement();
 Statement stmt4 = con.createStatement();
 Statement stmt5 = con1.createStatement();
 Statement stmt6 = con1.createStatement();
 Statement stmt7 = con1.createStatement();
 Statement stmt8 = con1.createStatement();
 Statement stmt9 = con1.createStatement();
 Statement stmt10 = con1.createStatement();
 Statement stmt11 = con.createStatement();
 Statement stmt13 = con.createStatement();
 Statement stmt14 = con.createStatement();
 Statement stmt12 = con.createStatement();
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
 String repaire=request.getParameter("repaire");
 if(repaire.equalsIgnoreCase("LastDayReceived"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	 String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
	 ResultSet rs=st.executeQuery(sql);
	 System.out.println(">>>>>>>sql:"+sql);
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }
 %>
 </table>
 <% }
 
 
 if(repaire.equalsIgnoreCase("0to30Life"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	    int receivecount=0;
		String UnitLife="",lastDispDate="";
		String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			String sql31="select * from db_gps.t_unitmasterhistory " +
					"where Status='Dispatched' and UnitID='"+rs.getString("UnitID")+"' order by DispDate DESC";
			System.out.println(sql31);
			ResultSet rs31=st2.executeQuery(sql31);
			
			if(rs31.next())
			{
				lastDispDate=rs31.getString("DispDate");
			}
			int fnlunitlife = 0;
			System.out.println(">>>>>>lastDispDate:"+lastDispDate);
			receivecount++;
			
			String sql30="select * from db_gps.t_unitreplacement where " +
					"OldUnitID='"+rs.getString("UnitID")+"' " +
					"and EntDate>='"+lastDispDate+"' order by EntDate DESC";
		
			ResultSet rs30=st3.executeQuery(sql30);
			System.out.println(sql30);
			while(rs30.next())
			{
				UnitLife=rs30.getString("UnitLife");
				System.out.println("unitlige"+UnitLife);
				System.out.println("UnitLife^^^^^^^^^^^^^"+UnitLife);
				if("-".equalsIgnoreCase(UnitLife))
				{
				//	System.out.println("unitid is '-'--------->"+UnitLife);
					UnitLife="0";
				}
				else
				{
				  if(UnitLife.endsWith("."))
				  {
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
					int length=UnitLife.length();
					UnitLife=UnitLife.substring(0, length-1);
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
				  }
				
				}
				
				//System.out.println("fnlunitlife---->"+fnlunitlife);
				if("null".equalsIgnoreCase(UnitLife))
				{
					
				}
				else
				{
				fnlunitlife=fnlunitlife+Integer.parseInt(UnitLife);
				}
			//	System.out.println("fnlunitlife---->"+fnlunitlife);
			}
			
				
			
			if(fnlunitlife<30)
			{
				//	System.out.println("UnitLife is less than 30");
					
			 //String sql="SELECT * FROM t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
	         //ResultSet rs=st4.executeQuery(sql);		
			 //System.out.println(">>>>>>>>>>>>sql:"+sql);
			
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }

 %>
 </table>
 <% 
			}
		 }
 }
 if(repaire.equalsIgnoreCase("30to100Life"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	    int receivecount=0;
		String UnitLife="",lastDispDate="";
		String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			String sql31="select * from db_gps.t_unitmasterhistory " +
					"where Status='Dispatched' and UnitID='"+rs.getString("UnitID")+"' order by DispDate DESC";
			System.out.println(sql31);
			ResultSet rs31=st2.executeQuery(sql31);
			
			if(rs31.next())
			{
				lastDispDate=rs31.getString("DispDate");
			}
			int fnlunitlife = 0;
			System.out.println(">>>>>>lastDispDate:"+lastDispDate);
			receivecount++;
			
			String sql30="select * from db_gps.t_unitreplacement where " +
					"OldUnitID='"+rs.getString("UnitID")+"' " +
					"and EntDate>='"+lastDispDate+"' order by EntDate DESC";
		
			ResultSet rs30=st3.executeQuery(sql30);
			System.out.println(sql30);
			while(rs30.next())
			{
				UnitLife=rs30.getString("UnitLife");
				System.out.println("unitlige"+UnitLife);
				System.out.println("UnitLife^^^^^^^^^^^^^"+UnitLife);
				if("-".equalsIgnoreCase(UnitLife))
				{
				//	System.out.println("unitid is '-'--------->"+UnitLife);
					UnitLife="0";
				}
				else
				{
				  if(UnitLife.endsWith("."))
				  {
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
					int length=UnitLife.length();
					UnitLife=UnitLife.substring(0, length-1);
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
				  }
				
				}
				
				//System.out.println("fnlunitlife---->"+fnlunitlife);
				if("null".equalsIgnoreCase(UnitLife))
				{
					
				}
				else
				{
				fnlunitlife=fnlunitlife+Integer.parseInt(UnitLife);
				}
			
			}
			
				
			System.out.println("fnlunitlife---->"+fnlunitlife);
			if(fnlunitlife<30)
			{
				
			}
			else if(fnlunitlife>30 && fnlunitlife<=100)
			{
				
			
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }

 %>
 </table>
 <% 
			}
		 }
 }

 if(repaire.equalsIgnoreCase("LifeGreater200"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	    int receivecount=0;
		String UnitLife="",lastDispDate="";
		String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			String sql31="select * from db_gps.t_unitmasterhistory " +
					"where Status='Dispatched' and UnitID='"+rs.getString("UnitID")+"' order by DispDate DESC";
			System.out.println(sql31);
			ResultSet rs31=st2.executeQuery(sql31);
			
			if(rs31.next())
			{
				lastDispDate=rs31.getString("DispDate");
			}
			int fnlunitlife = 0;
			System.out.println(">>>>>>lastDispDate:"+lastDispDate);
			receivecount++;
			
			String sql30="select * from db_gps.t_unitreplacement where " +
					"OldUnitID='"+rs.getString("UnitID")+"' " +
					"and EntDate>='"+lastDispDate+"' order by EntDate DESC";
		
			ResultSet rs30=st3.executeQuery(sql30);
			System.out.println(sql30);
			while(rs30.next())
			{
				UnitLife=rs30.getString("UnitLife");
				System.out.println("unitlige"+UnitLife);
				System.out.println("UnitLife^^^^^^^^^^^^^"+UnitLife);
				if("-".equalsIgnoreCase(UnitLife))
				{
				//	System.out.println("unitid is '-'--------->"+UnitLife);
					UnitLife="0";
				}
				else
				{
				  if(UnitLife.endsWith("."))
				  {
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
					int length=UnitLife.length();
					UnitLife=UnitLife.substring(0, length-1);
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
				  }
				
				}
				
				//System.out.println("fnlunitlife---->"+fnlunitlife);
				if("null".equalsIgnoreCase(UnitLife))
				{
					
				}
				else
				{
				fnlunitlife=fnlunitlife+Integer.parseInt(UnitLife);
				}
			
			}
			
				
			System.out.println("fnlunitlife---->"+fnlunitlife);
			if(fnlunitlife<30)
			{
				
			}
			else if(fnlunitlife>200)
			{
				
			
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }

 %>
 </table>
 <% 
			}
		 }
 }
 if(repaire.equalsIgnoreCase("100to200Life"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	    int receivecount=0;
		String UnitLife="",lastDispDate="";
		String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate = DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY) AND `InTransit` = 'No' and Transporter !='tscrap' ";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			String sql31="select * from db_gps.t_unitmasterhistory " +
					"where Status='Dispatched' and UnitID='"+rs.getString("UnitID")+"' order by DispDate DESC";
			System.out.println(sql31);
			ResultSet rs31=st2.executeQuery(sql31);
			
			if(rs31.next())
			{
				lastDispDate=rs31.getString("DispDate");
			}
			int fnlunitlife = 0;
			System.out.println(">>>>>>lastDispDate:"+lastDispDate);
			receivecount++;
			
			String sql30="select * from db_gps.t_unitreplacement where " +
					"OldUnitID='"+rs.getString("UnitID")+"' " +
					"and EntDate>='"+lastDispDate+"' order by EntDate DESC";
		
			ResultSet rs30=st3.executeQuery(sql30);
			System.out.println(sql30);
			while(rs30.next())
			{
				UnitLife=rs30.getString("UnitLife");
				System.out.println("unitlige"+UnitLife);
				System.out.println("UnitLife^^^^^^^^^^^^^"+UnitLife);
				if("-".equalsIgnoreCase(UnitLife))
				{
				//	System.out.println("unitid is '-'--------->"+UnitLife);
					UnitLife="0";
				}
				else
				{
				  if(UnitLife.endsWith("."))
				  {
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
					int length=UnitLife.length();
					UnitLife=UnitLife.substring(0, length-1);
				//	System.out.println("^%%&^(*&*()(*)----------->"+UnitLife);
				  }
				
				}
				
				//System.out.println("fnlunitlife---->"+fnlunitlife);
				if("null".equalsIgnoreCase(UnitLife))
				{
					
				}
				else
				{
				fnlunitlife=fnlunitlife+Integer.parseInt(UnitLife);
				}
			
			}
			
				
			System.out.println("fnlunitlife---->"+fnlunitlife);
			if(fnlunitlife<30)
			{
				
			}
			else if(fnlunitlife>100 && fnlunitlife<=200)
			{
				
			
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }

 %>
 </table>
 <% 
			}
		 }
 }
 if(repaire.equalsIgnoreCase("RecButNotRepaire5"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	 int Srno=1;
	 %> 
	
<br></br>
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
//Received in 5 days, but Not Repaired===============================================================================================
	String sql="SELECT * " +
	"FROM db_CustomerComplaints.t_unitreceived " +
	"WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 5 DAY )" +
	"  and InTransit='No' and Transporter not in ('tscrap') order by UnitID";
System.out.println(sql);
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
String sql63="select * from db_gps.t_unitmasterhistory where UnitID='"+rs.getString("UnitID")+"' " +
		"and concat(EntDate,EntTime)>='"+rs.getString("Rdate")+" "+rs.getString("Rtime")+"' and Status='Tested' and HoldBy='Transworld'";
System.out.println(sql63);
ResultSet rs63=st2.executeQuery(sql63);
if(rs63.next())
{
	System.out.println("unit is tested");
	
}
else
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
 }
}
 %>
 </table>
 <% }
 
 if(repaire.equalsIgnoreCase("RecButNotRepaire5to10"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	 String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 10 DAY ) and Rdate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 5 DAY ) and InTransit='No' and Transporter not in ('tscrap') order by UnitID ";
	 ResultSet rs=st.executeQuery(sql);
	 System.out.println(">>>>>>>sql:"+sql);
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }
 %>
 </table>
 <% }
 if(repaire.equalsIgnoreCase("RecButNotRepaire10to30"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	 String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 30 DAY ) and Rdate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 10 DAY ) and InTransit='No' and Transporter not in ('tscrap') order by UnitID ";
	 ResultSet rs=st.executeQuery(sql);
	 System.out.println(">>>>>>>sql:"+sql);
	 %> 

<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }
 %>
 </table>
 <% }
 
 if(repaire.equalsIgnoreCase("RecButNotRepaireGre30"))
 {
	  
     ///System.out.println(">>>>>>CURRENT_DATE( ):"+CURRENT_DATE( ));
	 String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 30 DAY ) and Rdate > '2011-08-01' and InTransit='No' and Transporter not in ('tscrap') order by UnitID";
	 ResultSet rs=st.executeQuery(sql);
	 System.out.println(">>>>>>>sql:"+sql);
	 %> 
	
<br></br>
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
 int Srno=1;
 while(rs.next())
 {%>
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
 }
 %>
 </table>
 <% }
 if(repaire.equalsIgnoreCase("QTDone"))
 {
	 
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
     
 %> 

<br></br>
<table width="100%" border="1" align="center" class="sortable">
				<tr>
				<td class="hed"><font color="RED"> Sr.</font></td>
			
			<!--  Quick Test Options from table db_CustomerComplaints.t_hwunittest --> 
				<td class="hed"><font color="RED"> QT Date</font></td>
				<td class="hed"><font color="RED"> QT Unit ID</font></td>
				<td class="hed"><font color="RED"> Unit Type</font></td>
				<td class="hed"><font color="RED"> SW Comment</font></td>
				<td class="hed"><font color="RED"> Debit Note</font></td>
				<td class="hed"><font color="RED"> Correction</font></td>
				<td class="hed"><font color="RED"> AVL Pcb Ver</font></td>
				<td class="hed"><font color="RED"> Pow Pcb Ver</font></td>
				<td class="hed"><font color="RED"> RLED</font></td>
				<td class="hed"><font color="RED"> GLED</font></td>
				<td class="hed"><font color="RED"> GLEDBlink</font></td>
				<td class="hed"><font color="RED"> GPSAnt</font></td>
				<td class="hed"><font color="RED"> GPSAntLED</font></td> 
				<td class="hed"><font color="RED"> SW ver</font></td> 
				<td class="hed"><font color="RED"> SWGpsdata</font></td> 
				<td class="hed"><font color="RED"> QTby</font></td> 
				</tr>		
				<%
				
				sql2="SELECT * FROM db_CustomerComplaints.hwunittest WHERE TheDate >= '"+now+"' ";
				///"WHERE TheDate >= '"+now+"' ";
				System.out.print(">>>>>>sql2:"+sql2);
				int i=1;
				rs2=stmt2.executeQuery(sql2);
				while(rs2.next())
				{	
					//System.out.println(rs2.getString("count"));
					String dispdate=null,disptime=null,firstinstdate="-",dispadd=null,qtdate=null,qttime=null,correction=null,dispby="-",QTby=null,typeoffail=null,pcbversion=null,powersupplyversion=null,codeversion=null;
					String spcomment=null,spentby=null,rectime=null,entdate="-",trans="-",vehreg="-",replaceunit="-",replacedate="-",reploc="-",repby="-",repconfigby="-";
					String RedLight="-";
					String GreenLight="-";
					String GPSLight="-";
					String Ringing="-";
					String life="-",Comment="-";
					String phydamage="",debitnote="";

					//Recived Details
					 String unitid,recdate=null,recloc=null;
						 
					 qtdate=rs2.getString("TheDate");
					 qttime=rs2.getString("TheTime");
					 unitid=rs2.getString("UnitID");
					 typeoffail=rs2.getString("SWComment");
					 debitnote =rs2.getString("SWDebitNote");
					 phydamage=rs2.getString("Physicaldamage");
					 if(!(phydamage==null||phydamage.equalsIgnoreCase("null")||phydamage.trim().length()<=0))
	                    {
	                       Comment =typeoffail+","+phydamage;
	                    }
				    else
				    {
					  Comment =typeoffail;
	 			    }
				 	 correction=rs2.getString("Correctiondone");
					 QTby=rs2.getString("User");
					 String UnitType=rs2.getString("UnitType");
					 String AVLPcbVer=rs2.getString("AVLPcbVer");
					 String PowPcbVer=rs2.getString("PowPcbVer");
					 String RLED=rs2.getString("RLED");
					 String GLED=rs2.getString("GLED");
					 if(GLED==null || GLED.equalsIgnoreCase("null")) 
						 	GLED="N.A";
					 String GLEDBlink=rs2.getString("GLEDBlink");
					 String GPSAnt=rs2.getString("GPSAnt");
					 if(GPSAnt==null || GPSAnt.equalsIgnoreCase("null"))
						 GPSAnt="N.A";
					 String GPSAntLED=rs2.getString("GPSAntLED");
					 String SWswver=rs2.getString("SWswver");
					 String SWGpsdata=rs2.getString("SWGpsdata");
					 
					
					 
					 						 
					
					
					// added by pradnya
				
					// get the unitreplacement details as per ajay sir requirement-------------------
					// unit life count-------------
					//------
							
							
							
							
							
						
							
							
							//---------------------------------------------------------------------------
							
								%>
						
							<tr>
								<td> <%=i%></td>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(qtdate))%></td>
								<td><%=unitid%></td>
								<td><%=UnitType%></td>
								<td><%=Comment%></td>
								<td><%=debitnote%></td>
								<td><%=correction%></td>
								<td><%=AVLPcbVer%></td>
								<td><%=PowPcbVer%></td>
							 	<td><%=RLED%></td>
							 	<td><%=GLED%></td>
							 	<td><%=GLEDBlink%></td>
							 	<td><%=GPSAnt%></td>
							 	<td><%=GPSAntLED%></td>
							 	<td><%=SWswver%></td>
							 	<td><%=SWGpsdata%></td>
								<td><%=QTby%></td>
								
							</tr>	
						<%
						i++;	
						
					}
					
				   %>
				   
				</table>
 <% }
 if(repaire.equalsIgnoreCase("RecAndScrap"))
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
	 String sql="SELECT * FROM db_CustomerComplaints.t_unitreceived WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 1 DAY ) ";
     System.out.println(sql);
     ResultSet rs=st.executeQuery(sql);
     while(rs.next())
     {
	  String sql62="select * from db_gps.t_unitmaster where UnitID='"+rs.getString("UnitID")+"' " +
			"and concat(EntDate,EntTime)>='"+rs.getString("Rdate")+" "+rs.getString("Rtime")+"'  and HoldBy='transworldscrap'";
	  System.out.println(sql62);
	  ResultSet rs62=st2.executeQuery(sql62);
	  if(rs62.next())
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
     }
 
	  }
     %>
     </table>
     <%

 }
 if(repaire.equalsIgnoreCase("ScrapThisMonth"))
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
	 String sql="SELECT * " +
		"FROM db_CustomerComplaints.t_unitreceived " +
		"WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 30 DAY )" +
		" and Rdate < DATE_SUB( CURRENT_DATE( ) , INTERVAL 10 DAY ) and InTransit='No' and Transporter not in ('tscrap') order by UnitID ";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			String sql54="select * from db_gps.t_unitmaster where UnitID='"+rs.getString("UnitID")+"' " +
					"and concat(EntDate,EntTime)>='"+rs.getString("Rdate")+" "+rs.getString("Rtime")+"' and Status='Tested'  and HoldBy='Transworld'";
		System.out.println(sql54);
			ResultSet rs54=st2.executeQuery(sql54);
			if(rs54.next())
			{
				System.out.println("unit is tested");
				
			}
			else
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
     }
 
	  }
		%>
		 </table>
		 <%

 }
 if(repaire.equalsIgnoreCase("ScrapThisYear"))
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
	  int count=1,count1=1;
	 String sql="SELECT * " +
		"FROM db_CustomerComplaints.t_unitreceived " +
		"WHERE Rdate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 1 YEAR )";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>sql:"+sql);
		while(rs.next())
		{
			
			count++;
			String sql65="select * from db_gps.t_unitmaster where UnitID='"+rs.getString("UnitID")+"' " +
					"and concat(EntDate,EntTime)>='"+rs.getString("Rdate")+" "+rs.getString("Rtime")+"'  and HoldBy='transworldscrap'";
		System.out.println(sql65);
			ResultSet rs65=st2.executeQuery(sql65);
			while(rs65.next())
			{
				
				count1++;
			//System.out.println("unit is tested in second group");
			
			
				
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
     }
 
	  }
		%>
		 </table>
		 <%
System.out.println(">>>>>>>>>>count:"+count);
System.out.println(">>>>>>>>>>count1:"+count1);
 }
 if(repaire.equalsIgnoreCase("NewDispatch"))
 {
	 int Srno=1; 
 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>typeunit</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>CommentForDispatch</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DisAdd</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DispDate-Time</b></font></th>
	 </tr> 
	 <%
	 String sql="SELECT * " +
		"FROM db_gps.t_unitmaster " +
		"WHERE DispDate = DATE_SUB( CURRENT_DATE( ) , INTERVAL 1 DAY ) " +
		"AND STATUS = 'Dispatched' " +
		"AND InstType = 'New'";
	 System.out.println(">>>>>>>sql:"+sql);
    ResultSet rs=st.executeQuery(sql);
   while(rs.next())
    {
	

			
				
	    %>
	    
	    
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="left"><%=rs.getString("typeunit") %></div></td>
  	 <td><div align="left"><%=rs.getString("CommentForDispatch") %></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd") %></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%>  <%=rs.getString("DispTime") %></div></td>
  	 </tr>
 
 <% 
      Srno++;
     }
  
	
 %>
 </table>
 <%
 }
 
 if(repaire.equalsIgnoreCase("orderPendingNew"))
 {
	 int Srno=1; 
 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>typeunit</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>CommentForDispatch</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DisAdd</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DispDate-Time</b></font></th>
	 </tr> 
	 <%
	   String sql="SELECT * " +
		"FROM db_CustomerComplaints.t_unitorder " +
		"where ReqDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 20 DAY) " +
		"and  ReqDate<DATE_SUB(CURRENT_DATE(),INTERVAL 5 DAY) " +
		"and Status not in ('Dispatched','Cancelled') " +
		"and Ordertype='External' and InsType='New'";
         System.out.println(">>>>>.sql:"+sql);
         ResultSet rs=st.executeQuery(sql);
         while(rs.next())
         {
	     
	

			
				
	    %>
	    
	    
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="left"><%=rs.getString("typeunit") %></div></td>
  	 <td><div align="left"><%=rs.getString("CommentForDispatch") %></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd") %></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%>  <%=rs.getString("DispTime") %></div></td>
  	 </tr>
 
 <% 
      Srno++;
     }
  
	
 %>
 </table>
 <%
 }
 if(repaire.equalsIgnoreCase("PassedQAQC"))
 {
	 int Srno=1; 
 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>typeunit</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>CommentForDispatch</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DisAdd</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DispDate-Time</b></font></th>
	 </tr> 
	 <%
	     String sql="SELECT * FROM db_gps.t_unitmasterhistory " +
					"where DispDate>=DATE_SUB(CURRENT_DATE(),INTERVAL 1 DAY ) " +
					"and status='Tested'";
		  System.out.println(">>>>>>>>>sql:"+sql);
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
				
	    %>
	    
	    
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="left"><%=rs.getString("typeunit") %></div></td>
  	 <td><div align="left"><%=rs.getString("CommentForDispatch") %></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd") %></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%>  <%=rs.getString("DispTime") %></div></td>
  	 </tr>
 
 <% 
      Srno++;
     }
  
	
 %>
 </table>
 <%
 }
 if(repaire.equalsIgnoreCase("NotPassedQAQC"))
 {
	 int Srno=1; 
 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>UnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>typeunit</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>CommentForDispatch</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DisAdd</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DispDate-Time</b></font></th>
	 </tr> 
	 <%
//		New Devices Manufactured, but Not Received in Stock 0-30 Days-----------------------------------------------------------------------------------
		String sql="SELECT * " +
				"FROM db_gps.t_unitmaster " +
				"WHERE EntDate >= DATE_SUB( CURRENT_DATE( ) , INTERVAL 30 DAY ) and InstType='New'";
		System.out.println(">>>>>>>>>sql:"+sql);
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
			String unitid=rs.getString("UnitID");
			String EntDate=rs.getString("EntDate");
			String sql50="select * from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and EntDate>='"+EntDate+"' and Status='Tested'";
			System.out.println(">>>>>>>>>sql50:"+sql50);
			ResultSet rs50=st2.executeQuery(sql50);
			if(rs50.next())
			{
			   	
			}
			else
			{
				String sql60="select * from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and EntDate>='"+EntDate+"' and Status='Dispatched'";
				System.out.println(">>>>>sql50:"+sql60);
					ResultSet rs60=st3.executeQuery(sql60);
					if(rs60.next())
					{
						System.out.println("\n>>>>>>>>>In If Loop");
					}
					else
					{
				      
					
				
	    %>
	    
	    
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="right"><%=rs.getString("UnitID") %></div></td>
  	 <td><div align="left"><%=rs.getString("typeunit") %></div></td>
  	 <td><div align="left"><%=rs.getString("CommentForDispatch") %></div></td>
  	 <td><div align="left"><%=rs.getString("DisAdd") %></div></td>
  	 <td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DispDate")))%>  <%=rs.getString("DispTime") %></div></td>
  	 </tr>
 
 <% 
      Srno++;
     }
  
	}
		 }
 %>
 </table>
 <%

		}
 %>


<%}catch(Exception e)
{
	System.out.println("Exception --->"+e);
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