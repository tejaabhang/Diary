<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1, con2;
String sql, transporter,group,vehicle, unit, sim, mobile, thedate, location,instdate,instplace,instby,enterby;
String vehcode,replaced,repdate,oldunit,dispdate,dispto,dispby,sql1,sql2;
Statement st, st1,st2,st3,st4,st5,st6; 
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
function formsubmit()
{
	var aa=document.trans.transporter.value;
	if(!(aa=="Select"))
	{	
		document.trans.submit();
	}
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
          <div id="nav">
  				<%@ include file="header1.jsp" %>
			</div>
            <div class="clear"> </div>

          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=con2.createStatement();
	st1=con2.createStatement();
	st2=con2.createStatement();
	st3=con2.createStatement();
	st4=con1.createStatement();
	st5=con1.createStatement();
	st6=con1.createStatement();
%>
<table width="750px" align="center" border ="1">
<tr><td>
<form name="trans" action="" method="get">
<select name="transporter" id="transporter" onchange="formsubmit();">
<option value="Select">Select</option>
<% 
sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps order by Transporter";
	ResultSet rst=st4.executeQuery(sql);
	while(rst.next())
	{
	%>
	<option value="<%=rst.getString("Transporter")%>"><%=rst.getString("Transporter")%></option>	
	<%
	}

%>
</select>
<font color="gray" size="2"> Please select transporter name.</font>
</form>
</td></tr>
<tr><td align="center">
<%
 	transporter=request.getParameter("transporter");
		if(!(null==transporter))
		{
			%>
			<font color="brown" size="2">Details of <%=transporter%> <div align="right"><a href="excelreconcillation.jsp?transporter=<%=transporter%>"  title="Export to Excel">
<img src="images/excel.jpg" width="15px" height="15px">
</a></div></font>	
			<%
		}
		%>
</td></tr>
<tr><td><div style="overflow:auto;height:450px;width:750px;" align="center" >
<table border="1" widht="100%" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Customer</td>
<td>Group</td>
<td>Vehicle</td>
<td>Unit</td>
<td>Sim</td>
<td>Mobile</td>
<td>Track Sim</td>
<td>Track Mobile</td>
<td>Updated</td>
<td>Location</td>
<td>InstDate</td>
<td>InstPlace</td>
<td>InstBy</td>
<td>EnterBy</td>
<td>Replaced</td>
<td>Rep Date</td>
<td>Old Unit</td>
<td>Dispatch Date</td>
<td>Dispatch To</td>
<td>Dispatch By</td>
</tr>
<%
 if(!(null==transporter))
{
		
		sql1="select * from t_vehicledetails where OwnerName='"+transporter+"'";
		ResultSet rst1=st1.executeQuery(sql1);
		int i=1;
		while(rst1.next())
		{
			vehcode=rst1.getString("VehicleCode");
			sql2="select * from t_group where vehcode='"+vehcode+"'";
			ResultSet rst2=st3.executeQuery(sql2);
			group="";
			while(rst2.next())
			{
				group=group+rst2.getString("GPName")+",";
			}
			vehicle=rst1.getString("vehicleregnumber");
			
			try{
			String uu=rst1.getString("TheFieldFromEmailAddress");
			unit=uu.substring(2,uu.indexOf("@"));
			}catch(Exception eee)
			{
				unit=rst1.getString("UnitId");
				
			}
			try{
				instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			}
			catch(Exception er)
			{
				instdate=rst1.getString("InstalledDate");
			}
			instplace=rst1.getString("InstalledPlace");
			instby=rst1.getString("InstalledBy");

			sql="select * from t_onlinedata where vehiclecode='"+vehcode+"'";
			ResultSet rst3=st2.executeQuery(sql);
			thedate="";
			location="";
			if(rst3.next())
			{
			try{
				thedate=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("TheDate"))+" "+rst3.getString("TheTime");
				}
				catch(Exception err)
				{
					thedate=rst3.getString("TheDate")+" "+rst3.getString("TheTime");
				}
				location=rst3.getString("Location");
			}
			sql="select * from t_unitmasterhistory where unitid='"+unit+"' order by DispDate desc limit 1";
			ResultSet rst4=st2.executeQuery(sql);
			sim="";
			mobile="";
			dispdate="";
			dispto="";
			dispby="";
			if(rst4.next())
			{
				sim=rst4.getString("SimNo");
				mobile=rst4.getString("MobNo");
				try{
					dispdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("DispDate"));
				}catch(Exception errr)
				{
				dispdate=rst4.getString("DispDate");
				}	
				dispby=rst4.getString("user");
				sql="select * from t_unitorder where reqno='"+rst4.getString("OrderNo")+"'";
				ResultSet rescust=st4.executeQuery(sql);
				if(rescust.next())
				{
					dispto=rescust.getString("Cust");
				}
	
			}
		sql="select * from t_unitreplacement where NewUnitID='"+unit+"' and instType='New' order by InstDate desc limit 1";
		ResultSet rst5=st2.executeQuery(sql);
		enterby="";
		if(rst5.next())
		{
			enterby=rst5.getString("EntBy");
		}
		sql="select * from t_unitreplacement where vehregno='"+vehicle+"' and InstType='Rep' order by InstDate desc limit 1";
		ResultSet rst6=st2.executeQuery(sql);
		replaced="No";
		repdate="";
		oldunit="";
		if(rst6.next())
		{
			replaced="Yes";
			try{
			repdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst6.getDate("InstDate"));
			}catch(Exception erer)
			{
			repdate=rst6.getString("InstDate");
			}
			oldunit=rst6.getString("OldUnitId");
		}
		%>
		<tr>
			<td><%=i%></td>
			<td><%=transporter%></td>
			<td><%=group%></td>
			<td><%=vehicle%></td>
			<td><%=unit%></td>
			<td><%=sim%></td>
			<td><%=mobile%></td>
			<td></td>
			<td></td>
			<td><%=thedate%></td>
			<td><%=location%></td>
			<td><%=instdate%></td>
			<td><%=instplace%></td>
			<td><%=instby%></td>
			<td><%=enterby%></td>
			<td><%=replaced%></td>
			<td><%=repdate%></td>
			<td><%=oldunit%></td>
			<td><%=dispdate%></td>
			<td><%=dispto%></td>
			<td><%=dispby%></td>
		</tr>
	<%
	i++;
	}
}
%>
</table>
</div></td></tr></table>
<table width="750px" height="350px">
<tr><td></td></tr>
</table>
<%
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
	
	con1.close();
	con2.close();
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
