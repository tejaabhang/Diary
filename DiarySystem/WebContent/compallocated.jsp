<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,transporter;
int total,updated,dealy,disconnected,notactive,transid;
String trans="", alloctech="", tcktlgddte="", vehicle="" ;
int i=0, tick=0;

%>
<%
String  userrole1=session.getAttribute("userrole").toString();
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script language="javascript">
	function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
function showtextarea(a,b,c)
{
		document.getElementById("div"+a).innerHTML='<form action="callinfo.jsp" method="get"><TEXTAREA name="callinfo" id="callinfo" class="formElement"></TEXTAREA><br><input type="Submit" name="Submit" value="Submit" class="formElement"><input type="button" value="Cancel" onclick="canceldiv('+a+');" class="formElement"><br><input type="hidden" name="rname" id="rname" value="'+b+'"><br><input type="hidden" name="transporter" id="transporter" value="'+c+'"><br><input type="hidden" name="pagename" value="complaintview.jsp"></form>';
}
function canceldiv(A,B,C)
{	
	var B="'"+document.getElementById("rname").value+"'";
	var C="'"+document.getElementById("transporter").value+"'";
	document.getElementById("div"+A).innerHTML='<a href="javascript:showtextarea('+A+','+B+','+C+');">Edit</a>';
	
}
</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
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
        <%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
transporter=request.getParameter("transporter");
i=0;
tick=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
		%>
	
		<table border="0" width="750px" align="center">
		<tr><td>
		<hr width="750px"></hr>
<div align="center"><font color="#330011" size="2"> <B> <U>Transporter <%=transporter%></U><B></font></div>
<hr width="750px"></hr>
<div align="center"><font color="#330011" size="2"> <B> <U>Contact Person's</U><B></font></div>
<hr width="750px"></hr>
<P></P>
<table border="1" width="750px" class="sortable">
<tr>
<th>Sr.</th>
<th>Contact Name</th>
<th>Phone</th>
<th>Mobile</th>
<th>Email</th>
<th>Location</th>
<th>Comments</th>
</tr>
<%
sql1="select * from t_recieverinfo where Transporter='"+transporter+"'";
ResultSet rst4=st.executeQuery(sql1);
int a=1;
while(rst4.next())
{
String rname=rst4.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td><a href="javascript:toggleDetails1(<%=a%>,true);" title="Click Here">
<%=rst4.getString("RecieverName")%>
</a>
<br/>	
	<div class="popup" id="popupx<%=a%>">
	<table border="0" >
	<tr><td><a href='showdetails.jsp?res=<%=rst4.getString("RecieverName")%>&today=<%=today%>' onclick="toggleDetails1(<%=a%>,false);">Show Details</a></td></tr>
	<tr><td><a href="javascript:toggleDetails1(<%=a%>,false);">Close</a></td></tr>
	</table>
	
</div>
</td>
<td><%=rst4.getString("Phone")%></td>
<td><%=rst4.getString("Mobile")%></td>
<td><a href="mailto:<%=rst4.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst4.getString("Email")%></a></td>
<td><%=rst4.getString("PlaceName")%></td>
<td><div id="div<%=a%>"><a href="javascript:showtextarea(<%=a%>,'<%=rname%>','<%=transporter%>');">Edit</a></div></td>
</tr>
<%
a++;
}
%>
</table>

<p></p>
		
		</td></tr>
		<tr>
		<td align="center"><font color="#330011" size="2"> <B> <U>Allocated Complaints List.
		</U></B> </font>
		</td>
		</tr>
		</table>
		<hr width="750px"> </hr>
		<table border="0" width="750px" align="center"  class="sortable" >
		<tr>
		<td>
		<form name="mainform" method="post" action="alloc.jsp">
<table border="1" width="750px" class="sortable">
  <tr>
      <th> Sr. No </th>
      <th> Ticket No </th>
      <th> Vehicle No </th>
      <th> Ticket Logged Date </th>
      <th> Problem </th>
      <th> Location </th> 
      <th> Technician </th> 
      <th> Veh. Avail Date </th>
      <th> Re-Allocate </th>
          
  </tr>
<%
	sql="select * from t_complaints1 where Customer='"+transporter+"' and Status in ('Allocated','Attended') and VehAvaildate >= '"+today+"' order by VehAvaildate Asc";
ResultSet rst=st.executeQuery(sql);
//out.print(sql);
int i=1;
while(rst.next())
{
%>
<tr>
<td><%=i%></td>
<td><%=rst.getString("Tno")%></td>
<td><%=rst.getString("VehicleNo")%></td>
<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></td>
<td><%=rst.getString("Complaint")%></td>
<td><%=rst.getString("VehAttLoc")%></td>
<%
	sql="select * from t_callocation1 where Tno='"+rst.getString("Tno")+"'";
	ResultSet rst1=st1.executeQuery(sql);
	if(rst1.next())
	{
	%>
	<td><%=rst1.getString("Technicion")%></td>
	<td><%
	
	if(null==rst.getString("VehAvailDate"))
	{
		out.print("-");
	}
	else
	{
		out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvailDate")));
	}
	
	%></td>
	<%
	}
	else
	{
	%>
	<td>-</td>
	<td>-</td>
	<%	
	}
%>

<td><a href="reallocate.jsp?tno=<%=rst.getString("Tno")%>">RE-ALLOCATE</a></td>
</tr>
<%
i++;
}

%>
</table>
</td></tr>
	
		</table>
		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>
	<%

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		

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
