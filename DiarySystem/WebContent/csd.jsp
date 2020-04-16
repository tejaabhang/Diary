<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>





<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="sorttable.js" type="text/javascript"></script>
<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/ajax-tooltip.js"></script>
<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen"
	type="text/css">

<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>
</head>
<script type="text/javascript">
	function show() {
		var op = document.getElementById('select');
		var ind = op.options[op.selectedIndex].value;
		if (ind == "all") {
			document.getElementById('form2').style.visibility = 'visible';
			return false;
		}
		if (ind == "Customerinformation") {
			document.getElementById('ci').style.visibility = 'visible';
			document.getElementById('ti').style.visibility = 'hidden';

			//document.getElementById('vi').style.visibility='hidden';
			document.getElementById('sar').style.visibility = 'hidden';

		}
		if (ind == "Technicianinformation") {

			document.getElementById('ti').style.visibility = 'visible';
			document.getElementById('ci').style.visibility = 'hidden';
			//document.getElementById('vi').style.visibility='hidden';
			document.getElementById('sar').style.visibility = 'hidden';

		}
		//      if(ind=="Vehicleinformation")
		// 	     {
		//			document.getElementById('ti').style.visibility='hidden';
		//	        document.getElementById('ci').style.visibility='hidden';
		//	        //document.getElementById('vi').style.visibility='visible';
		// 	        document.getElementById('sar').style.visibility='hidden';
		//		}
		if (ind == "Serviceandrepair") {

			document.getElementById('ti').style.visibility = 'hidden';
			document.getElementById('ci').style.visibility = 'hidden';
			//document.getElementById('vi').style.visibility='hidden';
			document.getElementById('sar').style.visibility = 'visible';

		}
	}
</script>

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
<%@ include file="header1.jsp"%></div>
<div id="gbox1">
<div id="gbox-top1"></div>
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 
<%!Connection con;
	Statement st, st1, st2, st4;%> <%
 	try {

 		java.util.Date defaultdate = new java.util.Date();
 		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
 		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
 		String DateRequest = new SimpleDateFormat("yyyy-MM-dd")
 				.format(new java.util.Date());
 		if (null == request.getQueryString()) {
 			java.util.Date d= new java.util.Date();
 			long miliseconds=d.getTime();
 			miliseconds=miliseconds - 1000 * 60 * 60 *24;
 			d.setTime(miliseconds);	
 			String yestdte1= new SimpleDateFormat("yyyy-MM-dd").format(d); 
 			DateRequest = yestdte1;

 		} else {
 			DateRequest = request.getParameter("tDate");
 		}
 		System.out.println(DateRequest);
 		System.out.println(sdf
 				.format(new SimpleDateFormat("yyyy-MM-dd")
 						.parse(DateRequest)));
 		String abc = sdf.format(new SimpleDateFormat("yyyy-MM-dd")
 				.parse(DateRequest));
 		Class.forName(MM_dbConn_DRIVER);
 		con = DriverManager.getConnection(MM_dbConn_STRING,
 				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st = con.createStatement();
 		st1 = con.createStatement();
 		st2 = con.createStatement();
 		st4 = con.createStatement();
 %>
<form name="form1" id="form2" method="get">
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td align="center" colspan="2"><font color="#2A0A12" size="3"><b>CSD
		(Customer Service Department) Report </b></font></td>
	</tr>
	<tr>
		<td><b>Date:</b> <input type="text" id="tDate" name="tDate" size="13" class="formElement" value="<%=DateRequest%>" readonly/>
					<script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "tDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<Select id="select" name="info">
			<option value=all>all</option>
			<option value=Customerinformation>Customer Information</option>
			<option value=Technicianinformation>Technician Information</option>
			<option value=Vehicleinformation>Vehicle Information</option>
			 <option value=Serviceandrepair>Service and Repair</option>
		</Select></td>
		<td>
		<div align="center"><input type="Submit" name="Submit"
			Value="Submit" onclick="show()" class="formElement"></div>
		</td>
	</tr>
</table>
</form>
<br></br>
<%
	String info = request.getParameter("info");
		if (info == null || info.equalsIgnoreCase("null")) {
			info = "all";
		}
%>
<table border="0" width="100%" align="center">
	<%
		if (info.equalsIgnoreCase("all")
					|| info.equalsIgnoreCase("Customerinformation")) {
	%>
	<tr>
		<td>
		<%
			String sql1 = "select * from db_CustomerComplaints.t_CustInformationCSD where Date='"
							+ abc + "'";
					System.out.println(sql1);
					ResultSet rs = st.executeQuery(sql1);
					System.out.println(sql1);
					while (rs.next()) {
		%>

		<table border="0" width="420px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td colspan="2"><font size="3"><b>Customer Information</b></font></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Total Transporter</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=total><b><%=rs.getString("TotalTransporter")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Active Transporter</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=active><b><%=rs.getString("ActiveTransporter")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>New Installations Pending</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=pinst><b><%=rs.getString("PendingInst")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>New Installations Done</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=dinst><b><%=rs.getString("DoneInstallations")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Outgoing Calls</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=outgoing><b><%=rs.getString("outgoing")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Incoming Calls</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=incoming><b><%=rs.getString("incoming")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Not Called Active Transporters</td>
				<td align="right"><a href=transporterlist1.jsp?transporter=NotCalled><b><%=rs.getString("NotCalled")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>SLA > 85% MTD Days</td>
				<td align="right"><a href=transporterlist2.jsp?transporter=sla85><b><%=rs.getString("SLA85")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>SLA 75-85% MTD Days</td>
				<td align="right"><a href=transporterlist2.jsp?transporter=sla7585><b><%=rs.getString("SLA75to85")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>SLA 50-75% MTD Days</td>
				<td align="right"><a href=transporterlist2.jsp?transporter=sla5075><b><%=rs.getString("SLA50to75")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>SLA <50% MTD Days</td>
				<td align="right"><a href=transporterlist2.jsp?transporter=sla50><b><%=rs.getString("SLA50")%></b></a></td>
			</tr>

		</table>
		<%
			}
		%>
		</td>
		
		<%
			}
				if (info.equalsIgnoreCase("all")
						|| info.equalsIgnoreCase("Vehicleinformation")) {
		%>

		<td>
		<%
			String sql3 = "select * from db_CustomerComplaints.t_vehicleInformation where Date='"
							+ abc + "'";
					ResultSet rs3 = st2.executeQuery(sql3);
					System.out.println(sql3);
					while (rs3.next()) {
		%>
		<table border="0" width="420px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td colspan="2"><font color="#000000" size="3"><b>Vehicle Information</b></font></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Complaint Pending<br>1-7 Days</td>
				<td align="right"><a href=vehicleInformation.jsp?information=CompPending1to7><b><%=rs3.getString("CompPending1to7")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Complaint Pending<br>7-15 Days </td>
				<td align="right"><a href=vehicleInformation.jsp?information=CompPending7><b><%=rs3.getString("CompPending7")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Complaints Pending >15 Days</td>
				<td align="right"><a href=vehicleInformation.jsp?information=CompPending15><b><%=rs3.getString("CompPending15")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Complaints Pending (Creation) >15 Days</td>
				<td align="right"><a href=vehicleInformation.jsp?information=CompCreation><b><%=rs3.getString("CompCreation")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Reallocation of Complaints Done</td>
				<td align="right"><a href=vehicleInformation.jsp?information=ReCompDone><b><%=rs3.getString("ReCompDone")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Reallocation of Open Complaints</td>
				<td align="right"><a href=vehicleInformation.jsp?information=ReOfOpenComp><b><%=rs3.getString("ReOfOpenComp")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Out of Warranty Vehicle Attended ?complaint closed of out of warranty / not inspection</td>
				<td align="right"><a href=vehicleInformation.jsp?information=OutOfWarrantyVehicle><b><%=rs3.getString("OutOfWarrantyVehicle")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Out Of Warranty Email Sent to Customer</td>
				<td align="right"><a href=vehicleInformation.jsp?information=outOfWarrantyEmail><b><%=rs3.getString("outOfWarrantyEmail")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Special Report Email Sent to Customer</td>
				<td align="right"><a href=vehicleInformation.jsp?information=SpecialEmail><b><%=rs3.getString("SpecialEmail")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Special Report Generated</td>
				<td align="right"><a href=vehicleInformation.jsp?information=ReportGenerate><b><%=rs3.getString("ReportGenerate")%></b></a></td>
			</tr>

		</table>

		<%
			}
		%>
		</td>
		
	</tr>
	<%
		}
			if (info.equalsIgnoreCase("all")
					|| info.equalsIgnoreCase("Technicianinformation")) {
	%>
	<tr>
		
		<td>
		<%
			String sql2 = "SELECT * FROM db_CustomerComplaints.t_technicalInfoCSD where Date='"
							+ abc + "'";
					System.out.println(sql2);
					ResultSet rs1 = st1.executeQuery(sql2);
					System.out.println(sql2);
					while (rs1.next()) {
		%>
		<table border="0" width="420px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td><font size="3"><b>Technician Information</b></font></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Active Technician</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=ActiveTech><b><%=rs1.getString("ActiveTech")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Present Technicians</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=PresentTech><b><%=rs1.getString("PresentTech")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Absent Technicians</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=AbsentTech><b><%=rs1.getString("AbsentTech")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Inspections Done</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=Inspection><b><%=rs1.getString("Inspection")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Complaints Resolved</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=CompResolved><b><%=rs1.getString("CompResolved")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Replacement Done</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=Replacement><b><%=rs1.getString("Replacement")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Dispatches In-Transit 5-10 Days</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=DispIntransit5><b><%=rs1.getString("DispIntransit5")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Receipts In-Transit 5-10 Days</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=RecIntransit5><b><%=rs1.getString("RecIntransit5")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Dispatches In-Transit >10 Days</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=DispIntransit10><b><%=rs1.getString("DispIntransit10")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Receipts In-Transit >10 Days</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=RecIntransit10><b><%=rs1.getString("RecIntransit10")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Not being Used(>30 Days)</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=NotUsed><b><%=rs1.getString("NotUsed")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Okay Stock (Verbal)</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=OkayVerbal><b><%=rs1.getString("OkayVerbal")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Okay Stock (System)</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=OkaySystem><b><%=rs1.getString("OkaySystem")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Faulty Stock (Verbal)</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=FaultyVerbal><b><%=rs1.getString("FaultyVerbal")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Faulty Stock (System)</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=FaultySystem><b><%=rs1.getString("FaultySystem")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Units Not Used > 30 Days</td>
				<td align="right"><a href=TechnicianInformation.jsp?Technician=DiddBetNotAndOkay><b><%=rs1.getString("DiddBetNotAndOkay")%></b></a></td>
			</tr>
		</table>
		<%
			}
		%>
		</td>
		
		<%
			}
				if (info.equalsIgnoreCase("all")
						|| info.equalsIgnoreCase("Serviceandrepair")) {
		%>

		<td>
		<%
			String sql4 = "select * from  db_CustomerComplaints.t_ServiceAndRepaireCSD where Date='"
							+ abc + "'";
					ResultSet rs4 = st4.executeQuery(sql4);
					while (rs4.next()) {
		%>
		<table border="0" width="420px" bgcolor="#E6E6E6" align="center">

			<tr>
				<td colspan="2"><font size="3"><b>Service and Repair</b></font></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Devices Received yesterday</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=LastDayReceived><b><%=rs4.getString("LastDayReceived")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received(0-30 Days Life)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=0to30Life><b><%=rs4.getString("0to30Life")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received(30-100 Days Life)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=30to100Life><b><%=rs4.getString("30to100Life")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received(100-200 Days Life)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=100to200Life><b><%=rs4.getString("100to200Life")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received(life > 200 days)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=LifeGreater200><b><%=rs4.getString("LifeGreater200")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Unique device count QT Done</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=QTDone><b><%=rs4.getString("QTDone")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received in 5 days, but Not Repaired</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RecButNotRepaire5><b><%=rs4.getString("RecButNotRepaire5")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received in 5-10 days,but Not Repaired</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RecButNotRepaire5to10><b><%=rs4.getString("RecButNotRepaire5to10")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received in 10-30 days,but Not Repaired</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RecButNotRepaire10to30><b><%=rs4.getString("RecButNotRepaire10to30")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received in > 30 days & < August 01, 2011,but Not Repaired</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RecButNotRepaireGre30><b><%=rs4.getString("RecButNotRepaireGre30")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Received yesterday,and in Scrap</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RecAndScrap><b><%=rs4.getString("RecAndScrap")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Scrapped This Month</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=ScrapThisMonth><b><%=rs4.getString("ScrapThisMonth")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Scrapped This Year</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=ScrapThisYear><b><%=rs4.getString("ScrapThisYear")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>New Devices Dispatched</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=NewDispatch><b><%=rs4.getString("NewDispatch")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Repaired Devices Dispatched</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=RepaireDispatch><b><%=rs4.getString("RepaireDispatch")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Order Pending between 5-20 Days (New)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=orderPendingNew><b><%=rs4.getString("orderPendingNew")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>In Manufacturing (Yesterday)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=Inmanufacture><b><%=rs4.getString("Inmanufacture")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Passed QA/QC (Yesterday)</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=PassedQAQC><b><%=rs4.getString("PassedQAQC")%></b></a></td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>Not Passed QA/QC This Month</td>
				<td align="right"><a href=ServiceAndRepair.jsp?repaire=NotPassedQAQC><b><%=rs4.getString("NotPassedQAQC")%></b></a></td>
			</tr>
		</table>

		<%
			}
		%>
		</td>
		</div>
	</tr>
	<%
		}
	%>
</table>




<%
	} catch (Exception e) {
		System.out.println("Exception --->" + e);
	} finally {
		con.close();
	}
%>
<table border="0" width="750px" height="300px">
	<tr>
		<td></td>
	</tr>
</table>
<!-- code end here ---></div>
</div>
<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>
<div id="copyright">Copyright © 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>