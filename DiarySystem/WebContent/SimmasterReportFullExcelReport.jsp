<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" import="java.sql.*" import=" java.text.*"%>
    <%@ include file="header.jsp"%>
    
    <%
    String operator = request.getParameter("operator");
    String status = request.getParameter("status");
    String plan = request.getParameter("plan");
    
    System.out.println("The opeator is :"+operator);
    System.out.println("The status is  :"+status);
    System.out.println("The plan is  :"+plan);
    %>
<% 
	
	String filename="Full_Excel_of_"+operator+"_simmaster_report.xls";
	response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%!
	Connection conn;
	
	%>


<%
Statement st=null;

		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st = conn.createStatement();
		
%>

<SCRIPT LANGUAGE="JavaScript1.2" SRC="js/graph.js"></SCRIPT>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>	
<body>
<table border="1" width="100%" CELLPADDING=2 style="background: #f8fcff;" class="mytable">
	<tr bgcolor="#E8EEF7">
	<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Sim No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Mob No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Date Of Purchase</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Purchase No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Status</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Service Provider</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Plan</font></th>
	</tr>

<%
int srno=0;
String sql="SELECT * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan  = '"+plan+"'";
ResultSet rs =  st.executeQuery(sql);
System.out.println("The query is :"+sql);
while(rs.next()){
	
	String Simno=rs.getString("Simno");
	String Mobno=rs.getString("Mobno");
	String DateOfPurchase=rs.getString("DateOfPurchase");
	String PurchaseNo=rs.getString("PurchaseNo");
	String Status=rs.getString("Status");
	String Service_provider=rs.getString("Service_provider");
	String Plan=rs.getString("Plan");
%>
<tr>
		<td align="right">			
			<div align="right"><%=++srno %></div>	
	    </td>
	  	<td align="right">			
			<div align="right"><%=Simno %></a></div>
			
	  	</td>
	  	<td align="right">			
			<div align="right"><%=Mobno %></div>
	  	</td>
	  	<td align="center">			
			<div align="center"><%=DateOfPurchase %></div>
	  	</td>
	  	<td align="right">			
			<div align="right"><%=PurchaseNo %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=Status %></div>
	  	</td>	  	
	  	<td align="left">			
			<div align="left"><%=Service_provider %></div>
	  	</td>	
	  	<td align="left">			
			<div align="left"><%=Plan %></div>
	  	</td>  	
	</tr> 
	
 <%} 
 %>	
 
 </table>