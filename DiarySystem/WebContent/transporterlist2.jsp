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
	java.util.Date defaultdate = new java.util.Date();
	String DateRequest = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());	
	System.out.println("===DateRequest=================>>"+ DateRequest);
	 
	
	
	 Class.forName(MM_dbConn_DRIVER);
	 con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 Statement st=con.createStatement();
	 Statement st1=con.createStatement();
	 Statement st2=con.createStatement();
	 Statement st3=con.createStatement();
	 String transporter=request.getParameter("transporter");
	 String abc=DateRequest.substring(0, 7);
	 System.out.println(""+abc);
	 abc=abc+"-01";
	 System.out.println("now=====>"+abc);
	 NumberFormat nf=new DecimalFormat("0.00");
	 if(transporter.equalsIgnoreCase("sla85"))
	 {
		 String sql="SELECT Transporter,avg(SLATillDate) as SLATillDate FROM db_gps.t_billingdetails where  month1='"+abc+"' AND SLATillDate BETWEEN 80 AND 101 group by Transporter";
		 ResultSet rs=st.executeQuery(sql); 
		 System.out.println(">>>>>>>>>>>sql:"+sql);
		 %>	 
  <table border="1" width="300" align="left" class="sortable">
  <tr>
  <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
 <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Transporter</b></font></th>
  <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>SLATillDate</b></font></th>
  </tr>
 
  <% 
  int Srno=1;
  while(rs.next())
  {
  %>
    <tr>
  	 <td><div align="right"><%= Srno %></div></td>
  	 <td><div align="left"><%=rs.getString("Transporter") %></div></td>
  	 <td><div align="right"><%=nf.format(rs.getDouble("SLATillDate"))%></div></td>
  	 </tr>
  <% 
  Srno++;
  }%>
  </table>
 <% 	 }
	 if(transporter.equalsIgnoreCase("sla7585"))
	 {
		 String sql1="SELECT Transporter,avg(SLATillDate) as SLATillDate FROM db_gps.t_billingdetails where  month1='"+abc+"' AND SLATillDate BETWEEN '74' AND '86' group by Transporter";
		 ResultSet rs1=st1.executeQuery(sql1); 
		 System.out.println(">>>>>>>>>>>sql:"+sql1);
		 %>	 
		 <table border="1" width="300" align="left" class="sortable">
          <tr>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Transporter</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>SLATillDate</b></font></th>
         </tr>
         <% 
         int Srno=1;
         while(rs1.next())
        {%>
           <tr>
  	       <td><div align="right"><%=Srno%></div></td>
  	       <td><div align="left"><%=rs1.getString("Transporter") %></div></td>
  	       <td><div align="right"><%=nf.format(rs1.getDouble("SLATillDate")) %></div></td>
  	       </tr>
  <% 
  Srno++;
  }%>
  </table>
 
<% }
	 if(transporter.equalsIgnoreCase("sla5075"))
	 {
		 String sql2="SELECT Transporter,avg(SLATillDate) as SLATillDate FROM db_gps.t_billingdetails where  month1='"+abc+"' AND SLATillDate BETWEEN '50' AND '76' group by Transporter";
		 ResultSet rs2=st2.executeQuery(sql2); 
		 System.out.println(">>>>>>>>>>>sql:"+sql2);
		 %>	 
		 <table border="1" width="300" align="left" class="sortable">
          <tr>
          <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Srno</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>Transporter</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" size="2"><b>SLATillDate</b></font></th>
         </tr>
         <% 
         int Srno=1;
         while(rs2.next())
        {%>
           <tr>
  	       <td><div align="right"><%=Srno%></div></td>
  	       <td><div align="left"><%=rs2.getString("Transporter") %></div></td>
  	       <td><div align="right"><%=nf.format(rs2.getDouble("SLATillDate")) %></div></td>
  	       </tr>
  <% 
  Srno++;
  }%>
  </table>
 
<% }
	 if(transporter.equalsIgnoreCase("sla50"))
	 {
		 String sql3="SELECT Transporter,avg(SLATillDate) as SLATillDate FROM db_gps.t_billingdetails where  month1='"+abc+"' AND SLATillDate BETWEEN '0' AND '51' group by Transporter";
		 ResultSet rs3=st3.executeQuery(sql3); 
		 System.out.println(">>>>>>>>>>>sql:"+sql3);
		 %>	 
		 <table border="1" width="300" align="left" class="sortable">
          <tr>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Srno</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>Transporter</b></font></th>
          <th align="center" bgcolor="#B0C4DE"><font color="white" ><b>SLATillDate</b></font></th>
         </tr>
         <% 
         int Srno=1;
         while(rs3.next())
        {%>
           <tr>
  	       <td><div align="right"><%=Srno%></div></td>
  	       <td><div align="left"><%=rs3.getString("Transporter") %></div></td>
  	       <td><div align="right"><%=nf.format(rs3.getDouble("SLATillDate")) %></div></td>
  	       </tr>
  <% 
  Srno++;
  }%>
  </table>
 
<% }

}catch(Exception e)
{
}finally
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