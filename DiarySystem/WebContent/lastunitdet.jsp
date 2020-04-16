<%-- 
    Document   : lastunitdet
    Created on : JAN 09,2010
    Created By     : Ayaz A.
    Discroption: This page shoe the last dya's units details given by the Technician
    
--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	

<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="unitdetails" method="get"  action="" onsubmit="return validate();">

<%!
Connection con2;
String username,today;
String getunit="",getunit1="";

%>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
username=session.getAttribute("username").toString();
String userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);

	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
Statement stmt1=con2.createStatement();

ResultSet rs1=null;

String sql1="";

ResultSet rs11=null;

String techname=request.getParameter("holdername");

%>
		
	<table border="0" width="100%">
		<tr>
			<td align="center"> <font color="maroon" size="3"> <B>Last Unit Details Given By <%=techname%></B> </font> </td>
		</tr>
					 	
	<tr></tr>
	<tr></tr>
	<td>
	<table border="2" width="300px">
	<tr><td align="center" colspan="2"><b>OK UNITS</b></td> </tr>
		<tr>
			<td><b>Sr. No.</b></td>
			<td> <b>Unit Id </b> </td>	
							
		</tr>
<%
	String nextstr="";

	int i=0;	
 
		sql1="select * from t_techattendance where TechName = '"+techname+"' and AttendDateTime < '"+today+"' order by AttendDateTime Desc limit 1";
		rs1=stmt1.executeQuery(sql1);
			
		while(rs1.next())
		{
		
			getunit=rs1.getString("OkayUnitsToday");
			StringTokenizer strtok = new StringTokenizer(getunit,",");
			 while (strtok.hasMoreTokens())
			 {
				 
				 nextstr=strtok.nextToken();
				 i++;
			%>
			<tr>
			<td><%=i %></td>
			<td><%=nextstr%></td>
			</tr>
			<%
			
			 }
		}
		
		int totokunit=i;
		%>
		
		<tr>
		<td><b>Total Ok Units</b></td>
		<td><b><font color="RED"><%=totokunit %></font></b></td>
		</tr>
		
		</table>
		</td>
		
		<td>
		<table border="2" width="300px">
		<tr><td align="center" colspan="2"><b>FAULTY UNITS</b></td></tr>
		<tr>
			<td><b>Sr. No.</b></td>
			<td><b>Unit Id </b></td>	
							
		</tr>
		
		<%
		
		String nextstr1="";
		int j=0;
		
		
		sql1="select * from t_techattendance where TechName = '"+techname+"' and AttendDateTime < '"+today+"' order by AttendDateTime Desc limit 1";
		rs1=stmt1.executeQuery(sql1);
			
		while(rs1.next())
		{	
			getunit1=rs1.getString("FaultyUnitsToday");
			StringTokenizer unitid=new StringTokenizer(getunit1,",");
			while(unitid.hasMoreTokens())
			{
				 nextstr1=unitid.nextToken();
				j++;		
			%>
			<tr><td><%=j %></td>
			<td><%=nextstr1 %></td>
			</tr>
			<%
			}
		}
		
		int totfaultyunit=j;
	%>
		<tr>
		<td><b>Total Faulty Units</b></td>
		<td><b><font color="RED"><%=totfaultyunit %></font></b></td>
		</tr>
		</table>
		</td>
		</table>
		<table border="2" width="500px">
		<tr>
		<td><b>Total Units Last Day Given By <font color="maroon"><%=techname%></font></b></td> 
		<%
		int totunit=i+j;
		%>
		<td><b><font color="RED"><%=totunit %></font></b></td>
		</tr>
		</table>
		
		
<%

} catch(Exception e) {out.println(e);}

finally
{
con2.close();
}

%>
