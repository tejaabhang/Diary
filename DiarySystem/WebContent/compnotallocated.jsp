<%-- 
    Document   : Complaint Not Allocated
    Created on : Oct 2009
    Author     : Ayaz A.
    Discroption: This page shows the vehicles Which Are Faulty And For Them the Complaints Are not Allocated
    last updated : 9 Jan 2010
    Modified by:   Ayaz A.
    
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st22,st3,st5,sttrans;
String sql,sql1,sql2,sql3,sqltrans,today,olddate,username,userrole,thename;
String fromdate,todate;
int Ocount,Icount,CAcount,CScount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
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
//out.println(today);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
Ocount=0;
Icount=0;
CAcount=0;
CScount=0;
try
{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st22=conn.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
sttrans=conn1.createStatement();
st5=conn1.createStatement();
int i=1;
%>
		<table border="0" width="750px" >
	<!-- Excel -->	
	<tr>
	
	<td align="right">  <a href="compnotallocatedexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td></tr>
	<tr><td align="center"><font color="brown" size="3">Report For Vehicle Which Are Faulty But Complaints Not Allocated. </font></td></tr>
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Transporter</b></td>
	<td><b>Faulty Vehicle</b></td>
	<td><b>Not Reallocated vehicles</b></td>
	</tr>
	<%
	sqltrans="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '%del' and OwnerName not like '%Rem' and OwnerName not like '%Removed' order by OwnerName Asc";// where Available='Yes'";	
	ResultSet rsttrans=sttrans.executeQuery(sqltrans);
	while(rsttrans.next())
	{
		Icount=0;
		CAcount=0;
		%>
		<tr>					
		<td width="5%"><div align="right"><%=i%></div></td>
		<td width="20%"><font color='red'><%=rsttrans.getString("OwnerName")%></font></td>
		<td width="25%"><div align="right">
		<%
		sql="select VehicleRegNumber from t_vehicledetails where Status='-' and OwnerName='"+rsttrans.getString("OwnerName")+"'";
		ResultSet rst=st2.executeQuery(sql);
		
		while(rst.next())
		{
			String veh=rst.getString("VehicleRegNumber");
			sql1="select TheDate,TheTime,Location,VehicleRegNo from t_onlinedata where VehicleRegNo='"+veh+"' and Transporter='"+rsttrans.getString("OwnerName")+"' and TheDate < '"+today+"' order by TheDate Desc";
			ResultSet rst1=st3.executeQuery(sql1);
			while(rst1.next())
			{
				String veh1=rst1.getString("VehicleRegNo");
				sql2="select DofAllocation,VehRegNo from t_callocation1 where DofAllocation >= '"+rst1.getString("TheDate")+"' and VehRegNo='"+veh1+"' order by DofAllocation Desc limit 1";
				ResultSet rst2=st22.executeQuery(sql2);
				if(rst2.next())
				{
					String veh2=rst2.getString("VehRegNo");
					sql3="select DofAllocation,VehAvailDate from t_callocation1 where VehAvailDate >= '"+today+"' and VehRegNo='"+veh2+"' order by DofAllocation Desc limit 1";
					ResultSet rst3=st22.executeQuery(sql3);
					if(rst3.next())
					{
							
					}
					else
					{
						CAcount++;
					}
				}
				else
				{
				Icount++;
				}
			}
			}
		%>
	 	 <a href='faultyvehicles.jsp?cust=<%=rsttrans.getString("OwnerName")%> '> <%=Icount %></a>
	 	 <td width="25%"><div align="right">
	 	 <a href='faultyvehnotreallo.jsp?cust=<%=rsttrans.getString("OwnerName")%> '> <%=CAcount %></a>
		<%
		Ocount=Ocount+Icount;
		CScount=CScount+CAcount;
		%>
		</td>
		</tr>
		<%
		i++;
		}
	%>
	<tr>
	<td></td>
	<td><font color="red"><b>Total</b></font></td>
	<td><!-- <font color="red"><b><a href="allfaultyvehicles.jsp?"> --><div align="right"><%=Ocount%></a></div></b></font></td>
	<td><!-- <font color="red"><b><a href="allfaultyvehicles.jsp?"> --><div align="right"><%=CScount%></a></div></b></font></td>
	</tr>					
	</table>	
	</table>
	</td></tr>
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
