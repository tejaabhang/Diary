<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null,rs2=null;
String sql1="",sql2="";
String transporter=request.getParameter("trans");
String getunid=request.getParameter("typevalue");
if(getunid.equals("Transporter"))
{
sql1="select Distinct(RecieverName) as Transporter from t_recieverinfo where Transporter='"+transporter+"' order by Transporter";
}
else
{
sql1="select Distinct(TechName) as Transporter from t_techlist where Available='Yes' order by Transporter";
}
rs1=stmt1.executeQuery(sql1);
%>
<select name="callername" id ="callername" class="formElement">
<option value="Select">Select</option>
<%
while(rs1.next())
{
  %>
	<option value='<%=rs1.getString("Transporter") %>'><%=rs1.getString("Transporter") %></option>
  <%
}
%>
</select>
<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>




