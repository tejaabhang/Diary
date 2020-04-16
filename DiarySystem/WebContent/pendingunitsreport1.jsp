<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1,con1,con2;
Statement sttrans,sttech;
String sqltrans,sqltech,username,userrole,thename;

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
function fun1()
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

username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
sttrans=conn1.createStatement();
sttech=conn.createStatement();

//--------------------------------------------------------------------------------------------
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
Statement stmt2=con2.createStatement();
Statement stmt3=con1.createStatement();
Statement stmt4=con2.createStatement();
Statement stmt5=con1.createStatement();
Statement stmt6=con1.createStatement();
Statement stmt7=con1.createStatement();

Statement stmt88=con1.createStatement();
Statement stmt99=con1.createStatement();
Statement stmt10=con2.createStatement();
Statement stmt111=con1.createStatement();
Statement stmt12=con1.createStatement();
Statement stmt13=con1.createStatement();



//String sql1,sql2,sql3,sql4;
ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
ResultSet rs5=null;


String sql1="";
String sql2="";
String sql3="";
String sql4="";
String sql5="";


String sql11="";
String sql22="";
String sql33="";
String sql44="";
String sql55="";
String sql66="";
String sql77="";
String sql88="";
String sql99="";
String sql10="";
String sql111="";
String sql12="";
String sql13="";

ResultSet rs11=null;
ResultSet rs22=null;
ResultSet rs33=null;
ResultSet rs44=null;
ResultSet rs55=null;
ResultSet rs66=null;
ResultSet rs77=null;
ResultSet rs88=null;
ResultSet rs99=null;
ResultSet rs10=null;
ResultSet rs111=null;
ResultSet rs12=null;
ResultSet rs13=null;



int totcount=0;

//---------------------------------------------------------------


int i=1;
thename=request.getParameter("radio1");
if(null==thename)
{
	thename="Transporter";
}

%>
	<table>
	<tr><td>
		<table border="0" width="750px" >
			<tr>
				<td>
					<div align="center"><font color='Brown' size='3'>PENDING UNITS REPORT</font></div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="left">
				<form action="" name="form1" id="form1" method="get">
					<input type="radio" name="radio1" value="Transporter" <% if(thename.equals("Transporter")) { out.print("CHECKED"); } %> onclick="fun1();" >Transporter</input>
					<input type="radio" name="radio1" value="Technician" <% if(thename.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun1();" >Technician</input>
	
			 		
				</form>
				</div>
				</td>
			</tr>	
		</table>
	</td></tr>
		<%
		if(!(null==thename))
		{
			if(thename.equals("Transporter"))
			{
		 %>
		 
			<tr>
				<td align="center"><font color="RED" size="2">ALL TRANSPORTERS LIST. </font></td>
			</tr>
			<tr> 
				<td>
					<div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Transporter To Know Pending Units To It.</font> </marquee> </div>
				</td>
			</tr>	
			<tr>
				<td>
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Transporter</b></td>
						
					</tr>
					
					<%
					sqltrans="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";// where Available='Yes'";	
					ResultSet rsttrans=sttrans.executeQuery(sqltrans);
					while(rsttrans.next())
					{
						String transp=rsttrans.getString("OwnerName");
						int count=0;
						int count1=0;
						int totunits=0;
						%>
						<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td width="20%"><a href="#" onClick="window.open ('PendingUnits.jsp?trans=<%=rsttrans.getString("OwnerName")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <%=rsttrans.getString("OwnerName")%> </td>
							
						<%
						i++;
						
					}
					%>
					
					</table>
				</td>
			</tr>
	
		
	
		<%
		
			}
			else
			{
				%>
				<tr>
				<td align="center"><font color="RED" size="2">ALL TECHNICIANS LIST. </font></td>
			</tr>
			<tr> 
				<td>
					<div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Technician To Know His Pending Units.</font> </marquee> </div>
				</td>
			</tr>	
			<tr>
				<td>
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Technician Name</b></td>
						<td><b>Mobile Number</b></td>
						
					</tr>
					
			<%
			sqltech="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
			ResultSet rsttech=sttech.executeQuery(sqltech);
			
			while(rsttech.next())
			{
				String techname=rsttech.getString("Techname");
				int count=0;
				int totunits=0;
				
			%>
				<tr>
					<td><div align="right"><%=i%></div></td>
					<td><a href="#" onClick="window.open ('unitholdbytech1.jsp?holdername=<%=rsttech.getString("TechName")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <%=rsttech.getString("TechName")%> </td>
					<td><div align="right"><%=rsttech.getString("MobNo")%></div></td>
					<%
						i++;
						
					}
					%>
					
					</table>
				</td>
			</tr>
						
					
			<%	
			
				
			
			}
		}
		else
		{
			%>
			</table>
				</td>
			</tr>
			 
			<tr>
				<td align="center"><font color="RED" size="2">ALL TRANSPORTERS LIST. </font></td>
			</tr>
			<tr> 
				<td>
					<div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Transporter To Know Pending Units To It.</font> </marquee> </div>
				</td>
			</tr>	
			<tr>
				<td>
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Transporter</b></td>
						
					</tr>
					
					<%
					sqltrans="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";// where Available='Yes'";	
					ResultSet rsttrans=sttrans.executeQuery(sqltrans);
					while(rsttrans.next())
					{
						String transp=rsttrans.getString("OwnerName");
						int count=0;
						int count1=0;
						int totunits=0;
						%>
						<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td width="20%"><a href="#" onClick="window.open ('PendingUnits.jsp?trans=<%=rsttrans.getString("OwnerName")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <%=rsttrans.getString("OwnerName")%> </td>
							
						<%
						i++;
						
					}
					%>
					
					</table>
				</td>
			</tr>
	
		
	
		<%
		}
	
		
			
	%>
	
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
