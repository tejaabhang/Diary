<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<% 


String RegNo=request.getParameter("TripID");

Class.forName(MM_dbConn_DRIVER);
Connection con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


String sql4="";
Statement stmt3 = con1. createStatement();
ResultSet rs4 = null;
sql4="select Distinct(GPName) from t_group where transporter='"+RegNo+"'";

rs4 = stmt3.executeQuery(sql4);
out.println("<table>");

  while(rs4.next())
  {
	  out.println("<tr>");
	  out.println("<td>");
	  out.println(rs4.getString("GPName"));
	  out.println("</td>");
	  out.println("</tr>");
  }
  out.println("</table>");
%>

