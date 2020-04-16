<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
      <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld - Leave Application</title>

	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script type="text/javascript">
function onSubmit(rid,index)
{
	alert(rid);
	alert(index);
	var msg=confirm("Do you want to submit");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=update&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
function onSubmitForNot(rid,index)
{
	alert(rid);
	alert(index);
	var msg=confirm("Do you want to submit");
	if(msg==true)
	{
		var url="leaveapproved.jsp";
		document.leave.action=url+"?rid="+rid+"&type=not&index="+index;
		document.leave.submit();
	}
	else
	{
		return false;
	}
}
</script>
</head>
<body bgcolor="Silver">

<p></p>
<p></p>
<table bgcolor="White" border="0" height="750" width="1200" align="center">
<tr>
<td><b><font size="6" color="#6699ff">Transworld - Leave Application report</font></b></td>
</tr>
<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>

<tr></tr>
<tr><td>
<form method="post" name="leave" action="leaveapproved.jsp" onsubmit="return validate();">
<p></p>


<table bgcolor="White" border="1" height="700" width="1000" align="center" class="sortable">
	<tr>
		<td><b>sr no</b></td>
		<td> <b>No OF Days applied </b></td>
		<td><b>first day of leave</b></td>
		<td><b>type of leave</b></td>
		<td><b>reason for leave</b></td>
		<td><b>date of reporting</b></td>
		<td><b>name</b></td>
		<td><b>details</b></td>
		<td><b>status</b></td>
		<td><b>HOD</b></td>
		<td><b>leave Approved</b></td>
		<td><b>Not Approved</b></td>
	</tr>
<%
Connection conn,conn1;
Statement st,st1,st2,st3;
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
java.util.Date d= new java.util.Date();
//out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
//out.println(datetoday);
 String sql="select * from db_gps.t_leaverequest where 1";
ResultSet rs=st.executeQuery(sql);
int i=1;
while(rs.next()){
	%>
	<tr><input type="hidden" name="rid<%=i%>" id="rid<%=i%>" value="<%=rs.getString("srno")%>" ></input>
		<td><%=i %></td>
		<td><%=rs.getString("daysapplied") %></td>
		<td><%=rs.getString("firstdayofleave") %></td>
		<td><%=rs.getString("typeofleave") %></td>
		<td><%=rs.getString("reasonforleave") %></td>
		<td><%=rs.getString("dateofreporting") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("details") %></td>
		<td><%=rs.getString("status") %></td>
		<td><%=rs.getString("HOD") %></td>
		<td align="center"><input type="submit" name="btnsubmit<%=i%>" id="btnsubmit<%=i%>" value="Approved" onclick="return onSubmit('<%=rs.getString("srno") %>','<%=i%>')"" ></input></td>
		<td align="center"><input type="button" name="btnnot<%=i%>" id="btnnot<%=i%>" value="Not Approved" onclick="return onSubmitForNot('<%=rs.getString("srno") %>','<%=i%>')"" ></input></td>
	
	</tr>
	
	<%
i++;	
}
%>
</table>
</form>
</td></tr>

</table>
<p></p>
</body>
</html>