
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
String sql1="",sql2="";
int limit=0;
String transporter=request.getParameter("transporter");
String mobno="-",simno="-", holdby="", recby="",recbycust="",recbytech="";
sql1="select Unitlimit from t_transporter where TypeValue='"+transporter+"' ";
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	limit=rs1.getInt(1);
	////System.out.println(limit);
}
int count=0;
String str="select count(*) as count from t_vehicledetails where status <> 'Deleted' and OwnerName='"+transporter+"'";
rs2=stmt2.executeQuery(str);
if(rs2.next())
{
	count=rs2.getInt("count");
	////System.out.println(count);
}
if(count!=0 && limit!=0 && count==limit)
	out.println("No"+"#");
else if(count!=0 && limit!=0 && count>limit){
	out.println("Yes1"+"#");
}else{
	out.println("Yes"+"#");
}
int ST=0,TX=0,RA=0,RD=0,OS=0;
String sqlDefault1="select ST,TX,AccelerationSpeedVarLimit,DecelerationSpeedVarLimit,Overspeedlimit from db_gps.t_defaultvals where OwnerName='Default'";
ResultSet rsDefault1=stmt2.executeQuery(sqlDefault1);
if(rsDefault1.next()){
	ST=rsDefault1.getInt("ST");
	TX=rsDefault1.getInt("TX");
	RA=rsDefault1.getInt("AccelerationSpeedVarLimit");
	RD=rsDefault1.getInt("DecelerationSpeedVarLimit");
	OS=rsDefault1.getInt("Overspeedlimit");
}

String sqlDefault="select ST,TX,AccelerationSpeedVarLimit,DecelerationSpeedVarLimit,Overspeedlimit from db_gps.t_defaultvals where OwnerName='"+transporter+"'";
ResultSet rsDefault=stmt2.executeQuery(sqlDefault);
if(rsDefault.next()){
	ST=rsDefault.getInt("ST");
	TX=rsDefault.getInt("TX");
	RA=rsDefault.getInt("AccelerationSpeedVarLimit");
	RD=rsDefault.getInt("DecelerationSpeedVarLimit");
	OS=rsDefault.getInt("Overspeedlimit");
}
out.println(ST+"#"+TX+"#"+RA+"#"+RD+"#"+OS+"#");
}catch(Exception e)
		{
			e.printStackTrace();
		}
%>
