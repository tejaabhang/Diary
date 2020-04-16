<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<%!
Connection conn;
Statement st;
ResultSet rs=null;
String reciever,caller,calltype,thedate,thetime,transporter,comment,username,sql,limit1;

String Caller,Reciever,TheDate,TheTime,CallInfo,Transporter,CallType,CallerType;
%>
<%
transporter=request.getParameter("trans");
limit1=request.getParameter("limit");
thedate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
thetime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
username=session.getAttribute("username").toString();
%>
<body onload="focusChild();">
<form action="" method="post" >

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<tr bgcolor="#BDBDBD"><td  align="center">
<font size="3" color="#2A0A12"><b>Last 10 Call Inforamation of <%=transporter%>
</b></font></td></tr>
</table>
<br></br>
<table border="1" width="750px" align="center" class="sortable">
<tr bgcolor="#BDBDBD">
<td><b>Sr.</b></td>
<td><b>Date & time</b></td>
<td><b>Caller Name</b></td>
<td><b>Reciever Name</b></td>
<td><b>Call Description</b></td>
<td><b>Transporter Name</b></td>
<td><b>Call Type</b></td>
<td><b>Caller Type</b></td>
<td><b>Reason Of Call</b></td>
<td><b>Vehicle Tracking</b></td>
<td><b>FleetView</b></td>
<td><b>Sales Followup</b></td>
</tr>

<%
try
{
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	//out.print(transporter+"  "+reciever+" "+thedate+"  "+thetime+"  "+username+"  "+calltype+" "+comment);
	sql="select * from t_callinformation where transporter like '"+transporter+"' order by concat(TheDate,TheTime) desc limit "+limit1;
	//out.print(sql);
	rs=st.executeQuery(sql);
	int i=1;
	while(rs.next())
	{
		TheDate= new SimpleDateFormat("dd-MMM-yyyy").format(rs.getDate("TheDate"));
		TheTime=rs.getString("TheTime");
		Reciever=rs.getString("Reciever");
		Caller=rs.getString("Caller");
		CallInfo=rs.getString("Callinfo");
		Transporter=rs.getString("Transporter");
		CallType=rs.getString("CallType");
		CallerType=rs.getString("CallerType");
		
%>
	<tr>
		<td align="center"><%=i%></td>
		<td align="center"><%=TheDate%> <%=TheTime%></td>
		<td align="center"><%=Caller%></td>
		<td align="center"><%=Reciever%></td>
		<td align="center"><%=CallInfo%></td>
		<td align="center"><%=Transporter%></td>
		<td align="center"><%=CallType%></td>	
		<td align="center"><%=CallerType%></td>
		<td align="center"><%=rs.getString("reasonOfCall")%></td>
		<td align="center"><%=rs.getString("vehicleTracking")%></td>
		<td align="center"><%=rs.getString("FleetView")%></td>
		<td align="center"><%=rs.getString("salesFollowup")%></td>
		
	</tr>
	
<%
		i++;
	} 	
	}
	catch(SQLException e)
	{
		out.print("Exception -->"+e);
	}	
	catch(Exception e)
	{
		out.print("Exception -->"+e);
	}
	finally
	{
		conn.close();
	}
	


%>



<tr><td colspan="20"><div align="center"><a href="javascript:window.close();"><b>Close</b></a></div></td></tr>
</table>
</form>
</body>
</html>
