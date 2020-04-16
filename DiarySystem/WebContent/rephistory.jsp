<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate,username,ui,insdate;
int repcount;
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
repcount=0;
int complaintCount=0,inspectionCount=0,specialReportCount=0;
transporter=request.getParameter("trans");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
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
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("yyyy-MM-dd");
Format fmt1 = new SimpleDateFormat("dd-MM-yyyy");
String sdt = fmt.format(td);
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
	out.print(fromdate);
	out.print(todate);
	%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Maintenance History of Transporter <%=transporter%>	</font></td></tr>
			</table>
		</td>
	</tr>
</table>
	<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr id="daterange" bgcolor="#BDBDBD"> <td><font color="black" size="2"><b>From Date:</b> </font>
					<input type="text" id="calender" name="calender" size="13" value="<%=sdt%>" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;&nbsp;&nbsp;
					
				<font color="black" size="2"><b>To Date:</b> </font>
					<input type="text" id="calender1" name="calender1" size="13" value="<%=sdt%>" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "calender1",         // ID of the input field
			                    ifFormat    : "%Y-%m-%d",     // the date format
			                    button      : "trigger1"       // ID of the button
			               }
			                             );
              		 </script>
		</td></tr>
	    <tr>
			<td align="center" colspan="2">
			<input type="hidden" name="trans" id="trans" value=<%=transporter%>>
				<input type="submit" name="submit" id="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>
	<br></br>
	
	
	<table border="0" width="750px" align="center">
	<tr><td align="right"><font color="brown" size="3">
	<a href="excelrephistory.jsp?trans=<%=transporter%>"  title="Export to Excel">
<img src="images/excel.jpg" width="15px" height="15px">
</a></font>
	</td></tr>	
	</table>
	
		<table border="1" width="100%" align="center" class="sortable">
			<tr bgcolor="#BDBDBD">
				<td><font  size="2"><b>Sr.</b></font></td>
				<td><font  size="2"><b>Vehicle Reg. No</b></font></td>
				<td><font  size="2"><b>Unit ID</b></font></td>
				<td><font  size="2"><b>Install Date</b></font></td>
				<td><font  size="2"><b>Replacement</b></font></td>
				<td><font  size="2"><b>Complaints</b></font></td>
				<td><font  size="2"><b>Inspection</b></font></td>
				<td><font  size="2"><b>Special report</b></font></td>
			</tr>	
<%
	String us=username.toUpperCase();
		if(us.equals("CASTROL"))
		{
			sql="select * from t_vehicledetails where vehicleCode in (select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"')";
		}
		else
		{
		sql="select *  from t_vehicledetails where OwnerName='"+transporter+"' and Status <> 'Deleted'";
		}
		//sql="select * from t_vehicledetails where OwnerName='"+transporter+"' and Status <> 'Deleted'";	
		ResultSet rst=st1.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst.getString("VehicleRegNumber")%></td>
		<td><div align="right"><%
			//ui=rst.getString("TheFieldFromEmailAddress");	
			//ui=ui.substring(2,ui.indexOf("@"));
			ui=rst.getString("UnitId");	
			out.print(ui);	
		%>
		</div>		
		</td>
		<td><div align="right"><%
		if(null==rst.getString("InstalledDate"))
		{
		sql="select * from t_unitreplacement where NewUnitID='"+ui+"' order by InstDate limit 1";
		ResultSet rst1=st2.executeQuery(sql);
		if(rst1.next())
		{
			try{
			out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate")));
			insdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate"));
			}catch(Exception e)
			{
			
			}
		}
		}
		else
		{		
		try{
		out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstalledDate")));
		insdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstalledDate"));
		}catch(Exception e)
			{
			}
		}
		%></div></td>
		<td><div align="right">
		<%
			sql="select count(*) as count from t_unitreplacement where VehRegNo='"+rst.getString("VehicleRegNumber")+"' and InstType='Rep' and InstDate between '"+fromdate+"' and '"+todate+"' ";		
			//out.println(sql);
			ResultSet rst2=st2.executeQuery(sql);
			if(rst2.next())
			{
			out.print("<a href='vehiclehistory.jsp?vehno="+rst.getString("VehicleRegNumber")+"&trans="+transporter+"&uid="+ui+"&insdate="+insdate+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getInt("count")+"</a>");
			repcount=repcount+rst2.getInt("count");
			}
			else
			{
				out.print("0");
			}
		%>		
		</div>
		</td>
		<td><div align="right">
		<%
		sql="SELECT count(*) as count FROM db_CustomerComplaints.t_complaints1 "+
			"WHERE TdyDate "+
			"BETWEEN '"+fromdate+"' "+
			"AND '"+todate+"' "+
			"AND VehicleNo='"+rst.getString("VehicleRegNumber").trim()+"' and inspection='No'";	
			//out.println(sql);
			ResultSet rst3=st2.executeQuery(sql);
			if(rst3.next())
			{
			out.print("<a href='vehiclecomplainthistory1.jsp?vehno="+rst.getString("VehicleRegNumber")+"&trans="+transporter+"&uid="+ui+"&insdate="+insdate+"&fromdate="+fromdate+"&todate="+todate+"&type=specific'>"+rst3.getInt("count")+"</a>");
			complaintCount=complaintCount+rst3.getInt("count");
			}
			else
			{
				out.print("0");
			}
		%>		
		</div>
		</td>
		<td>
		<div align="right">
		<%
		String sql4="SELECT count(*) as count FROM db_CustomerComplaints.t_complaints1 "+
			"WHERE TdyDate "+
			"BETWEEN '"+fromdate+"' "+
			"AND '"+todate+"' "+
			"AND VehicleNo='"+rst.getString("VehicleRegNumber").trim()+"' and inspection='Yes'";	
			//out.println(sql);
			ResultSet rst4=st2.executeQuery(sql4);
			if(rst4.next())
			{
			out.print("<a href='vehiclehistory.jsp?vehno="+rst.getString("VehicleRegNumber")+"&trans="+transporter+"&uid="+ui+"&insdate="+insdate+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst4.getInt("count")+"</a>");
			inspectionCount=inspectionCount+rst4.getInt("count");
			}
			else
			{
				out.print("0");
			}
		%>		
		</div>
		</td>
		<td>
		<div align="right">
		<%
		String sql5="SELECT count(*) as count "+
			"FROM db_CustomerComplaints.t_specialreports "+
			"WHERE EnterDate >= '"+fromdate+" 00:00:00' "+
			"AND EnterDate <= '"+todate+" 23:59:59' and VehRegNo='"+rst.getString("VehicleRegNumber")+"'";	
		//	out.println(sql5);
			ResultSet rst5=st2.executeQuery(sql5);
			if(rst5.next())
			{
			out.print("<a href='vehiclehistory.jsp?vehno="+rst.getString("VehicleRegNumber")+"&trans="+transporter+"&uid="+ui+"&insdate="+insdate+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getInt("count")+"</a>");
			specialReportCount=specialReportCount+rst5.getInt("count");
			}
			else
			{
				out.print("0");
			}
		%>		
		</div>
		</td>
		
		</tr>		
		
		<%
		i++;
		}
		
	%>
		<tr bgcolor="#BDBDBD">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<div align="right">
					<font color="red" size="3"> 
						<a href='vehiclehistory1.jsp?trans=<%=transporter %>&fromdate=<%=fromdate%>&todate=<%=todate%>'><%=repcount%></a>
					</font>
				</div>
			</td>
			<td>
				<div align="right">
					<font color="red" size="3"> 
						<a href='vehiclecomplainthistory1.jsp?trans=<%=transporter %>&type=Total&fromdate=<%=fromdate%>&todate=<%=todate%>'><%=complaintCount%></a>
					</font>
				</div>
			</td>
			<td>
				<div align="right">
					<font color="red" size="3"> 
						<a href='vehiclehistory1.jsp?trans=<%=transporter %>&fromdate=<%=fromdate%>&todate=<%=todate%>'><%=inspectionCount%></a>
					</font>
				</div>
			</td>
			<td>
				<div align="right">
					<font color="red" size="3"> 
						<a href='vehiclehistory1.jsp?trans=<%=transporter %>&fromdate=<%=fromdate%>&todate=<%=todate%>'><%=specialReportCount%></a>
					</font>
				</div>
			</td>
		</tr>
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
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
