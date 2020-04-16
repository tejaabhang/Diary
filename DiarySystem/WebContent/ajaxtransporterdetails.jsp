
<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();

ResultSet rs1=null, rs2=null;
String sql1="", sql2="";
String transporter=request.getParameter("transporter");
int Userlimit=0,Unitlimit=0;
String ActiveStatus="",comment="",datetime="",user="",adminEmail="",customertype="",operationalstatus="",ERPCode="",category="";
sql1="select TypeValue,Userlimit,Unitlimit,ActiveStatus,comment,datetime,EnteredBy,AdminEmail,CustomerType,OperationalStatus,ERPCode,category from t_transporter where TypeValue='"+transporter+"'";
rs1=stmt1.executeQuery(sql1);
String userrole=session.getAttribute("userrole").toString();
while(rs1.next())
{
	transporter=rs1.getString("TypeValue");
	Userlimit=rs1.getInt("Userlimit");
	Unitlimit=rs1.getInt("Unitlimit");
	ActiveStatus=rs1.getString("ActiveStatus");
	comment=rs1.getString("comment");
	datetime = rs1.getString("datetime");
	user = rs1.getString("EnteredBy");
	adminEmail= rs1.getString("AdminEmail");
	customertype=rs1.getString("CustomerType");
	operationalstatus=rs1.getString("OperationalStatus");
	System.out.println("Ajax"+operationalstatus);
        ERPCode=rs1.getString("ERPCode");
        category=rs1.getString("category");
}
out.println(transporter+"#"+Userlimit+"#"+Unitlimit+"#"+ActiveStatus+"#"+comment+"#"+datetime+"#"+user+"#"+adminEmail+"#"+customertype+"#"+operationalstatus+"#"+ERPCode+"#"+category+'#');

} catch(Exception e) 
{out.println(e);}

finally
{
con1.close();
}

%>


