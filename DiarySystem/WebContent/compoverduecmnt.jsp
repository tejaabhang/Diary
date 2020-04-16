<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="dets" method="get"  action="" onsubmit="return validate();">

<%!
Connection con1,con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
Statement stmt1=con1.createStatement();
Statement stmtinsert=con2.createStatement();

ResultSet rs1=null,rs2=null;
String sql1="", sql2="";

String veh=request.getParameter("vehno");
String tickno=request.getParameter("tno");

String prvscmnt="";
sql1="select * from t_complaints1 where Tno='"+tickno+"' ";

rs1=stmt1.executeQuery(sql1);	
if(rs1.next())
{
	prvscmnt=rs1.getString("CompOverdueCmnt");	
}

String submchk=request.getParameter("subm");

if(null==submchk)
{
%>
<input type="hidden" name="tno" value="<%=tickno%>" />
<center>	
	<table border="10" width="350px">
		<tr>
			<td colspan="2" align="center"> <font color="maroon"> <B> Over-Due Comment for <%=veh%></B> </font> </td>
		</tr>
		<tr>
			<td> Comment</td>
			<td> <textarea name="cmnt" class="formElement"> </textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="submit" class="formElement" /> </td>
		</tr>
	</table>
<input type="hidden" name="subm" value="yes">
<%
}
else
{
	String cmnt=request.getParameter("cmnt");

	int pos=0;
	pos=cmnt.indexOf("'");
	if(pos>0)
	{
		cmnt=cmnt.replace("'","");
	}
	
	String newcmnt=prvscmnt+", "+cmnt;

	sql1="update t_complaints1 set CompOverdueCmnt='"+newcmnt+"' where Tno='"+tickno+"' ";
	//Query for t_sqlquery
		String abcd=sql1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

	stmt1.executeUpdate(sql1);
%>
<center>
	<table border="0" width="350px">
		<tr>
			<td> Successfully Updated. Please refresh the main Page.</td>
		</tr>
		<tr>
			<td> <a href="#" onClick="window.close();">Close </a> </td>
		</tr>
	</table>
<%
}

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>
