<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3, stlife;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate,username,vehno,insdate,newunit,installplace,installby;
%>
<html>
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
vehno=request.getParameter("vehno");
insdate=request.getParameter("insdate");
newunit=request.getParameter("uid");
transporter=request.getParameter("trans");
String fromdate=request.getParameter("fromdate");
String todate=request.getParameter("todate");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
Format form = new SimpleDateFormat("dd-MMM-yyyy");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	stlife=conn1.createStatement();

	//out.print(vehno);
	%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr>
					<td align="center">
						<font color="black" size="3">
							Maintenance History of <%=vehno%> 
							for <%=transporter%> from  <%=form.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=form.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%>
						</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
	<%
	sql="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' and Status <>'Deleted'";	
	ResultSet rst=st1.executeQuery(sql);
		if(rst.next())
		{
		installplace=rst.getString("InstalledPlace");
		installby=rst.getString("InstalledBy");
		}
	%>
		<td align="center"><p></p><font color="DarkCyan" size="2">Present Unit DI :<font color="red"><%=newunit%></font>, Install Date : <font color="red"><%=insdate%></font>, Install Place : <font color="red"><%=installplace%></font>, Install By :<font color="red"><%=installby%></font>.</font><p></p></td>
	</tr>	
</table>
	<p></p>
	<table border="1" width="100%" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			<td><b>Sr.</b></td>
			<td><b>Old Unit Inst. Date</b></td>
			<td><b>Rep-Date</b></td>
			<td><b>Old-Unit</b></td>
			<td><b>New-Unit</b></td>
			<td><b>Rep-Place</b></td>
			<td><b>Rep-By</b></td>
			<td><b>Unit Life(Days)</b></td>
		</tr>	
	<%
	sql="select * from t_unitreplacement where VehRegNo='"+vehno+"' and InstType='Rep' and InstDate between '"+fromdate+"' and '"+todate+"' order by InstDate";	
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
		
		int days=0;
		String sqllife="select * from t_unitreplacement where VehRegNo='"+vehno+"' and NewUnitID='"+rst1.getString("OldUnitId")+"' and InstDate <= '"+rst1.getString("InstDate")+"' ";
			ResultSet rslife=stlife.executeQuery(sqllife);
			if(rslife.next())
			{	
				String sqld="select (TO_DAYS('"+rst1.getString("InstDate")+"')-TO_DAYS('"+rslife.getString("InstDate")+"'))";
				ResultSet rsdays=st.executeQuery(sqld);
				if(rsdays.next())
				{
					days=rsdays.getInt(1);
					//out.println(days);
				}
			}
		
		
	%>
	<tr>
	<td><div align="right"><%=i%></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rslife.getDate("InstDate"))%></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate"))%></div></td>
	<td><div align="right"><%=rst1.getString("OldUnitId")%></div></td>
	<td><div align="right"><%=rst1.getString("NewUnitId")%></div></td>
	<td><%=rst1.getString("InstPlace")%></td>
	<td><%=rst1.getString("InstBy")%></td>
	<td><div align="right"><font color="red"><%=rst1.getString("UnitLife") %></font></div></td>
	</tr>
	
	<%
	i++;
	}
	%>
	</table>	
	
	<%
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
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
 		 
		<div id="gbox-bot1"> 
		</div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
