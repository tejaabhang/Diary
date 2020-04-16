

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
<td align="center" colspan="2"><font color="#2A0A12" size="3"><b>Customer Information Report For  </b><%=request.getParameter("transporter") %></font></td>
	</tr>
</table>
<br></br>
<%
try{
 Class.forName(MM_dbConn_DRIVER);
 con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 Statement st=con.createStatement();
 Statement st2=con.createStatement();
 Statement st3=con.createStatement();
 String transporter=request.getParameter("transporter");
 
 if(transporter.equalsIgnoreCase("total"))
 {
 
 
 String sql="SELECT DISTINCT OwnerName FROM db_gps.t_vehicledetails";
 System.out.println(">>>>>>>>>>>sql:"+sql);
 ResultSet rs=st.executeQuery(sql);
 %>
 
 <table border="1" width="50%" align="left" class="sortable">
 <tr>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Ownername</b></font></th>
 </tr> 
 <% 
 int Srno=1;
 while(rs.next())
 {%>
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="left"><%=rs.getString("OwnerName") %></div></td>
  	 </tr>
 
 <% 
 Srno++;
 }
 %>
 </table>
<% 

}
 if(transporter.equalsIgnoreCase("active"))
 {
	 String sql="SELECT DISTINCT OwnerName FROM db_gps.t_vehicledetails where Status='-'";
	 ResultSet rs=st.executeQuery(sql);
	 System.out.println(">>>>>>>>>>>sql:"+sql);
	 %> 
<table border="1" width="50%" align="left" class="sortable">
 <tr>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Ownername</b></font></th>
 </tr> 
 <% 
 int Srno=1;
 while(rs.next())
 {%>
  	 <tr>
  	 <td><div align="right"><%=Srno%></div></td>
  	 <td><div align="left"><%=rs.getString("OwnerName") %></div></td>
  	 </tr>
 
 <% 
 Srno++;
 }
 %>
 </table>
 <% }
 if(transporter.equalsIgnoreCase("pinst"))
 {
	 
	 int i=1;
	 String sql3="SELECT a.Unitlimit,b.count,b.OwnerName,(a.Unitlimit-b.count) as pendingInstallations " +
		"FROM db_gps.t_transporter a " +
		"RIGHT OUTER JOIN ( " +
		"SELECT count( * ) AS count, OwnerName " +
		"FROM db_gps.t_vehicledetails " +
		"WHERE STATUS = '-'" +
		"GROUP BY ownername" +
		")b ON ( b.OwnerName = a.TypeValue )";
	 ResultSet rs1=st.executeQuery(sql3);
	 System.out.println(">>>>>>>>>>>sql:"+sql3);
	 %>
<table border="1" width="100%" align="left" class="sortable">
 <tr>
  <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Sr.no</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>unitlimit</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>count</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>ownername</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>pendinginstallation</b></font></th>
 </tr> 
 <% 
 while(rs1.next())
 {%>
 
 <tr>
 <td><div align="right"><%=i %></div></td>
 <td><div align="right"><%=rs1.getString("Unitlimit") %></div></td>
 <td><div align="right"><%=rs1.getString("count") %></div></td>
 <td><div align="left"><%=rs1.getString("OwnerName") %></div></td>
 <td><div align="right"><%=rs1.getString("pendingInstallations") %></div></td>
 </tr> 
 
 <%
 i++;
 } %>
  
 </table>
	<% }
%>

 <% 
 if(transporter.equalsIgnoreCase("dinst"))
 {
	 
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Sr.no</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>VehRegNo</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>OwnerName</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>NewUnitID</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>InstDateTime</b></font></th>
	 </tr> 
	<%
     int i=1;
     String sql="select * from db_gps.t_unitreplacement where InstType='New' and EntDate='"+now+"'";
		ResultSet rs=st.executeQuery(sql);
		System.out.println(">>>>>>>>>>>>sql:"+sql);
		while(rs.next())
		{
			//NewInstallations=rs4.getInt("count4");
	 %>

 
 
 <tr>
 <td><div align="right" style="size: 10px"><%=i %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("VehRegNo") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("OwnerName") %></div></td>
 <td><div align="right" style="size: 10px"><%=rs.getString("NewUnitID") %></div></td>
 <%
 try
 {
 %>
 <td><div align="right" style="size: 10px"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("InstDate")))%>  <%=rs.getString("InstTime") %></div></td>
 <%}
 catch(Exception e)
 {
	 System.out.println(">>>>>>>>:"+e);
 }
 %>
 </tr> 
 
 <%
 i++;
 } %>
  
 </table>
	<% }
 if(transporter.equalsIgnoreCase("outgoing"))
 {
	 
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Sr.no</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Reciever</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Caller</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Callinfo</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>reasonOfCall</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DateTime</b></font></th>
	 </tr> 
	<%
     int i=1;
	String sql="SELECT * FROM db_CustomerComplaints.t_callinformation where CallType='OutGoing' and TheDate='"+now+"'";
	ResultSet rs=st.executeQuery(sql);
	System.out.println(">>>>>>>>sql:"+sql);
	while(rs.next())
	{
		
	 %>

 
 
 <tr>
 <td><div align="right" style="size: 10px"><%=i %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Reciever") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Caller") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Transporter") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Callinfo") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("reasonOfCall") %></div></td>

 <%
 try
 {
 %>
 <td><div align="right" style="size: 10px"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("TheDate")))%>  <%=rs.getString("TheTime") %></div></td>
 <%}
 catch(Exception e)
 {
	 System.out.println(">>>>>>>>:"+e);
 }
 %>
 </tr> 
 
 <%
 i++;
 } %>
  
 </table>
	<% }
 
 if(transporter.equalsIgnoreCase("incoming"))
 {
	 
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Sr.no</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Reciever</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Caller</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Callinfo</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>reasonOfCall</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DateTime</b></font></th>
	 </tr> 
	<%
     int i=1;
	String sql="SELECT * FROM db_CustomerComplaints.t_callinformation where CallType='InComing' and TheDate='"+now+"'";
	ResultSet rs=st.executeQuery(sql);
	System.out.println(">>>>>>>>sql:"+sql);
	while(rs.next())
	{
		
	 %>

 
 
 <tr>
 <td><div align="right" style="size: 10px"><%=i %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Reciever") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Caller") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Transporter") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Callinfo") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("reasonOfCall") %></div></td>

 <%
 try
 {
 %>
 <td><div align="right" style="size: 10px"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("TheDate")))%>  <%=rs.getString("TheTime") %></div></td>
 <%}
 catch(Exception e)
 {
	 System.out.println(">>>>>>>>:"+e);
 }
 %>
 </tr> 
 
 <%
 i++;
 } %>
  
 </table>
	<% }
 if(transporter.equalsIgnoreCase("NotCalled"))
 {
	 
	 String now=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	 %>
	 <table border="1" width="100%" align="left" class="sortable">
	 <tr>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Sr.no</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Reciever</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Caller</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Callinfo</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>reasonOfCall</b></font></th>
	 <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>DateTime</b></font></th>
	 </tr> 
	<%
     int i=1;
	String sql="SELECT * FROM db_CustomerComplaints.t_callinformation where CallType='Not Called' and TheDate='"+now+"'";
	ResultSet rs=st.executeQuery(sql);
	System.out.println(">>>>>>>>sql:"+sql);
	while(rs.next())
	{
		
	 %>

 
 
 <tr>
 <td><div align="right" style="size: 10px"><%=i %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Reciever") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Caller") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Transporter") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("Callinfo") %></div></td>
 <td><div align="left" style="size: 10px"><%=rs.getString("reasonOfCall") %></div></td>

 <%
 try
 {
 %>
 <td><div align="right" style="size: 10px"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("TheDate")))%>  <%=rs.getString("TheTime") %></div></td>
 <%}
 catch(Exception e)
 {
	 System.out.println(">>>>>>>>:"+e);
 }
 %>
 </tr> 
 
 <%
 i++;
 } %>
  
 </table>
	<% }
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