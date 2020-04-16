<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn1;
Statement st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,today,olddate,username,userrole,thename;
String fromdate,todate;
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

function fun2()
{	
	document.form1.submit();
}	
</script>
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
        <div id="gbox-top1"> </div>
        <div id="gbox-bg1">
          <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();

java.util.Date defoulttime = new java.util.Date();
Format formatterxxx1 = new SimpleDateFormat("hh:mm:ss");
String time= formatterxxx1.format(defoulttime);
defoultdate.setTime(miliseconds);
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
String option=request.getParameter("rad1");
try
{
Class.forName(MM_dbConn_DRIVER);

conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

st1=conn1.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
st4=conn1.createStatement();
if(null==option)
{
	option="ftrip";
}

int i=1;

%>
		<form name="form1" id="form1" action="" method="post">
		
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Faulty Trip Report.</b>  </font></td>
		</tr>
	</table>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
			<td>
			<input type="radio" name="rad1" value="ftrip"<% if(option.equals("ftrip")){out.print("CHECKED");} %> onclick="fun2();"><b>Faulty Vehicle[Trip Entry]</b>
			<input type="radio" name="rad1" value="tripf" <% if(option.equals("tripf")) {out.print("CHECKED");} %> onclick="fun2();"><b>FaultyVehicle [During Trip]</b>
			</td>
		</tr>
	</table>
		<br></br>
	<%
	if(null==option){
		option="ftrip";
	}
	
	if(option.equals("ftrip"))
	{
	
	%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td align='center'><font color="black" size="3"> Faulty Vehicles At The Time Of Trip Entry</font></td>
			</tr>
		</table>
		<table border="1" width="100%" align="center" class="sortable">
			<tr bgcolor="#BDBDBD">
				<td><b>Sr.</b></td>
				<td><b>Transporter</b></td>
				<td><b>Faulty</b></td>
    		</tr>
<%	
		String sqldistinct="select DISTINCT(OwnerName) as OwnerName from db_gps.t_startedjourney where JStatus='Running'";
		ResultSet rsdistinct=st4.executeQuery(sqldistinct);
		while(rsdistinct.next()){
			int countforfaulty=0;
			sql1="select * from t_startedjourney where JStatus='Running' and OwnerName='"+rsdistinct.getString("OwnerName")+"' order by StartDate Desc";	
			ResultSet rst1=st1.executeQuery(sql1);
			while(rst1.next())
			{
				sql2="select * from t_onlinedata where VehicleRegNo='"+rst1.getString("VehRegNo").trim()+"' and TheDate >= '"+rst1.getString("StartDate")+"'";		
				ResultSet rst2=st2.executeQuery(sql2);
				if(rst2.next())
				{
				}
				else
				{
					String jtime=rst1.getString("StartTime");
					if(null==rst1.getString("StartTime"))
					{
						jtime="00:00:00";	
					}
					sql3="select * from t_onlinedata where VehicleRegNo='"+rst1.getString("VehRegNo").trim()+"' and TheDate < '"+rst1.getString("StartDate")+"'";		
					ResultSet rst3=st3.executeQuery(sql3);
		    		if(rst3.next())
		    		{
		    			countforfaulty++;
		    		}}}
			if(countforfaulty>0){
%>
				<tr>					
					<td width="5%"><div align="right"><%=i%></div></td>
					<td><%=rsdistinct.getString("OwnerName")%></td>
					<td width="10%"><div align="right"><a href="TripReport.jsp?option=ftrip&OwnerName=<%=rsdistinct.getString("OwnerName")%>"><%=countforfaulty %></a></div></td>
				</tr>
		<%
		i++;}
		    
			
	}
		%>
		</table>
		<%
			}else if(option.equals("tripf"))
	{
		%>
			<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
				<tr>
					<td align='center'><font color="black" size="3">Faulty Vehicles During Trip</font></td>
				</tr>
			</table>
			<table border="1" width="100%" align="center" class="sortable">
				<tr bgcolor="#BDBDBD">
				<td><b>Sr.</b></td>
				<td><b>Veh. Reg. Number</b></td>
				<td><b>Faulty</b></td>
    		</tr>
		<%
	String sqldistinct="select DISTINCT(OwnerName) as OwnerName from db_gps.t_startedjourney where JStatus='Running'";
	ResultSet rsdistinct=st4.executeQuery(sqldistinct);
	while(rsdistinct.next()){
		int countforfaulty=0;
		sql1="select * from t_startedjourney where JStatus='Running' and OwnerName='"+rsdistinct.getString("OwnerName")+"'";	
		ResultSet rst1=st1.executeQuery(sql1);
		while(rst1.next())
		{
			sql2="select * from t_onlinedata where VehicleRegNo='"+rst1.getString("VehRegNo").trim()+"' and TheDate > '"+rst1.getString("StartDate")+"'";		
			ResultSet rst2=st2.executeQuery(sql2);
			if(rst2.next())
			{
				sql3="select   * from t_onlinedata where VehicleRegNo='"+rst1.getString("VehRegNo").trim()+"' and TheDate < '"+today+"'";		
				ResultSet rst3=st3.executeQuery(sql3);
		  	 	 if(rst3.next())
		  	 	 {
		  	 		countforfaulty++;
		   		 }
			}
		}
	if(countforfaulty>0){
		 %>
			<tr>					
				<td width="5%"><div align="right"><%=i%></div></td>
				<td><%=rsdistinct.getString("OwnerName")%></td>
				<td><div align="right"><a href="TripReport.jsp?option=tripf&OwnerName=<%=rsdistinct.getString("OwnerName")%>"><%=countforfaulty%></a></div></td>
			</tr>
		<%i++;
	}
	}
		
		
		    }
		
	%>
	</table>
	<%
	
}catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>

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
