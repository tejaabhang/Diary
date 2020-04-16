<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
int instcount,currcount,delcount,discount,notacount,unallocated, unallocatedall;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<title>Seven Day Diary System.</title>
	<script type="text/javascript">

function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

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
          <%@ include file="header1.jsp" %>
          </div>
          <div id="gbox1">
           <!-- <div id="gbox-top1"> </div> --> 
            <div id="gbox-bg1">
              <div id="gbox-grd1">
        
   
<!--- code start here ------>
<%
instcount=0;
currcount=0;
delcount=0;
discount=0;
notacount=0;
unallocatedall=0;
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-6000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	%>
	<table border="1" width="750px" align="center">
	<tr>
	<td align="center" align="center">Exclusion List
	<div align="center"><font color="brown">
	These are vehicles excluded from the castrol's login. These vehicles have not been sent to castrol for loading since the date shown. Data for these vehicles is accessible in all castrol ids by feeding specific vehicle nombers in the box provided.	
	</font></div>
	</td>
	</tr>	
	<tr>
	<td>
	<table border="1" class="sortable" width="100%">
	<tr>
<td><b>Sr.</b></td>
<td><b>VehRegNo.</b></td>
<td><b>Transporter</b></td>
<td><b>Last Trip Date</b></td>
<td><b>Updated</b></td>
<td><b>Location</b></td>
</tr>
<%
	sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where GPName='"+username+"'";
	ResultSet rst=st.executeQuery(sql);
	int i=1;
	while(rst.next())
	{
	sql="select *  from t_group where GPName='"+username+"' and VehRegNo='"+rst.getString("Transporter")+"' and Active='No'";
	ResultSet rst1=st2.executeQuery(sql);
	while(rst1.next())
	{
		%>
<tr>
<td><%=i%></td>
<td><%=rst1.getString("Transporter")%></td>
<td><%=rst1.getString("VehRegNo")%></td>
<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("LastTripDate"))%></td>
<%
sql="select * from t_onlinedata where VehicleCode='"+rst1.getString("VehCode")+"'";
ResultSet rst2=st3.executeQuery(sql);
if(rst2.next())
{
%>
<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("TheDate"))%> <%=rst2.getString("TheTime")%></td>
<td><%=rst2.getString("Location")%></td>
<%
}
else
{
%>
<td>Not Active</td>
<td>Not Active</td>
<%
}
%>

</tr>		
		<%
		i++;
	}
	}
%>
	</table>	
	</td>
	</tr>	
	</table>	
	<table border="0" width="750px" height="350px">
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
