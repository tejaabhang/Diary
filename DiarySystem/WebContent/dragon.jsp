<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>


<%!public int nullIntconv(String str) {
		int conv = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			conv = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return conv;
	}%>

<html>
<head>

<style type=text/css>
table.mytable {
	font: 13px arial, sans-serif;
	border-collapse: collapse;
	border: 1px solid #839E99;
	background: #f8fcff;
}
</style>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 -->
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {

				$('#example').DataTable(
						{
							"pagingType" : "full_numbers",

							dom : 'Blfrtip',
							responsive : true,
							scrollY : "500px",
							scrollX : true,
							scrollCollapse : true,
							buttons : [

							{
								extend : 'collection',

								text : 'Export',
								buttons : [ {
									extend : 'excel',
									title : 'Dragondroid Report',

								}, {
									extend : 'pdf',
									title : 'Dragondroid Report',
								}, {
									extend : 'csv',
									title : 'Dragondroid Report',
								}, {
									extend : 'print',
									title : 'Dragondroid Report',
								}, {
									extend : 'copy',
									title : 'Dragondroid Report',
								},

								/* 'copy', 'csv', 'excel', 'pdf', 'print' */
								]
							} ],
							lengthMenu : [ [ -1, 10, 25, 50, 100 ],
									[ "All", 10, 25, 50, 100 ] ],

						});
			});
</script>

<script type="text/javascript">
	function chk() {

		var chkf = "";
		var chkt = "";
		var objFromDate = document.getElementById("data").value;

		var fdate = objFromDate.split("-");
		if (fdate[1] == "Jan") {
			chkf = "01";
		}
		if (fdate[1] == "Feb") {
			chkf = "02";
		}
		if (fdate[1] == "Mar") {
			chkf = "03";
		}
		if (fdate[1] == "Apr") {
			chkf = "04";
		}
		if (fdate[1] == "May") {
			chkf = "05";
		}
		if (fdate[1] == "Jun") {
			chkf = "06";
		}
		if (fdate[1] == "Jul") {
			chkf = "07";
		}
		if (fdate[1] == "Aug") {
			chkf = "08";
		}
		if (fdate[1] == "Sep") {
			chkf = "09";
		}
		if (fdate[1] == "Oct") {
			chkf = "10";
		}
		if (fdate[1] == "Nov") {
			chkf = "11";
		}
		if (fdate[1] == "Dec") {
			chkf = "12";
		}
		var objFromDate1 = "" + fdate[2] + "-" + chkf + "-" + fdate[0] + "";
		var objToDate = document.getElementById("data1").value;
		var tdate = objToDate.split("-");
		if (tdate[1] == "Jan") {
			chkt = "01";
		}
		if (tdate[1] == "Feb") {
			chkt = "02";
		}
		if (tdate[1] == "Mar") {
			chkt = "03";
		}
		if (tdate[1] == "Apr") {
			chkt = "04";
		}
		if (tdate[1] == "May") {
			chkt = "05";
		}
		if (tdate[1] == "Jun") {
			chkt = "06";
		}
		if (tdate[1] == "Jul") {
			chkt = "07";
		}
		if (tdate[1] == "Aug") {
			chkt = "08";
		}
		if (tdate[1] == "Sep") {
			chkt = "09";
		}
		if (tdate[1] == "Oct") {
			chkt = "10";
		}
		if (tdate[1] == "Nov") {
			chkt = "11";
		}
		if (tdate[1] == "Dec") {
			chkt = "12";
		}
		var objToDate1 = "" + tdate[2] + "-" + chkt + "-" + tdate[0] + "";
		// alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);

		var date1 = new Date(objFromDate1);
		var date2 = new Date(objToDate1);

		//alert("from > "+date1+" Todate > "+date2);

		var date3 = new Date();
		var date4 = date3.getMonth() + "-" + date3.getDay() + "-"
				+ date3.getYear();
		var currentDate = new Date(date4);

		if (date1 > date2) {
			alert("From Date Should be Less Than To Date");
			return false;
		}

		return true;

	}
</script>
<style>
#example {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#example td, #example th {
	border: 1px solid #ddd;
	padding: 16px;
}

#example tr:nth-child(even) {
	background-color: #f2f2f2;
}

#example tr:hover {
	background-color: #ddd;
}

#example th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>

<body style="background-color: #FFFFFF;">
	<div id="wrapper">
		<div id="logo">
			<h1>
				<img src="images/Transworld.gif">
			</h1>
			<p>We care about your Vehicles</p>
		</div>
		<P></p>
		<%@ include file="header1.jsp"%></div>


	<div id="gbox1">
		<!-- <div id="gbox-top1"> </div> -->
		<div id="gbox-bg1">
			<div id="gbox-grd1">



				<%!Connection con1;
	Connection con2;
	String refno = null;%>

				<%
					System.out.println("in the QuickTestReport jsp page ");
					Class.forName(MM_dbConn_DRIVER);
					con1 = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					con2 = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
					Statement stmt = con1.createStatement();
					Statement st = con2.createStatement();
					Statement st2 = con2.createStatement();
					Statement st1 = con2.createStatement();
					Statement stmt1 = con2.createStatement();
					Statement stmt2 = con1.createStatement();
					Statement stmt3 = con1.createStatement();
					Statement stmt4 = con1.createStatement();
					Statement stmt19 = con2.createStatement();
					Statement stmt6 = con2.createStatement();
					Statement stmt7 = con2.createStatement();
					Statement stmt8 = con2.createStatement();
					Statement stmt9 = con2.createStatement();
					Statement stmt10 = con2.createStatement();
					Statement stmt11 = con1.createStatement();
					Statement stmt13 = con1.createStatement();
					Statement stmt14 = con1.createStatement();
					Statement stmt12 = con1.createStatement();
					Statement stmt51 = con1.createStatement();
					Statement stmt81 = con1.createStatement();
				%>




				<%
					String datex1, datex2, data1, data2;
					String departmentNew = "";

					int details = 0;
					String d = "";

					System.out.println("Date---->" + d);
					String dtt1 = "";
					int i = 1;
					ResultSet res8 = null;
					ResultSet res81 = null;

					String dt111 = "";
					ResultSet res = null;
					ResultSet res2 = null;
					String unitid = "", OwnerName = "", GPName = "", UnitID = "", version = "", VehicleCode = "", dt5 = "",
							WMSN = "", VehicleRegNumber = "", InsertDate = "", OTP = "", imei = "", MailDate = "",
							MailTime = "", km = "", runninghours = "";
					String CompanyCode = "", imeiNo = "", UserName = "", MobileNo = "", Address = "", EmailId = "";
					ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null,
							rs9 = null, rs10 = null, rs11 = null, rs99 = null;
					String data = "", data11 = "", vendor = "", Statustype = "", technician = "";
					String user = session.getAttribute("username").toString();
				%>



				<%
					String date = request.getParameter("value");
					String date1 = request.getParameter("value1");
					String ui = request.getParameter("value2");
					String user1 = request.getParameter("value3");

					System.out.println("date " + date);
					System.out.println("date1  " + date1);
					System.out.println("Unit Id " + ui);
				%>

				<br> <br>







				<%
					String exportFileName = "Dragondroid_report.xls";
				%>
				<table width="750px" border="0" align="center">
					<tr>


						<td><input type="hidden" id="tableHTML" name="tableHTML"
							value="" /> <input type="hidden" id="fileName" name="fileName"
							value="<%=exportFileName%>" />
					</tr>
				</table>



				<div class="form" style="width: 750px; color: black;">
					<table id="example" width="750px" border="0" align="center">


						<thead>
							<tr>
								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">SrNo.
								</th>
								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">User
									Name</th>

								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">OTP
								</th>


							</tr>
						</thead>

						<tbody>

							<%
								String owner = request.getParameter("owner");

								System.out.println(">>>>>>>owner>>>>>>" + owner);

								//sql2="Select * from db_CustomerComplaints.hwunittest where TheDate between '"+data+"' and '"+data1+"' and TypeValue='2' order by TheDate desc";
								int VehCode = 0, RD = 0, OS = 0, cnt1 = 0, RA = 0, cnt = 0, cnt3 = 0, cnt2 = 0, cnt5 = 0, cnt9 = 0,
										cnt8 = 0;
								int todaykm = 0, cumulative = 0;
								int TotalImgCam2 = 0, TotalImgCam3 = 0, TotalVidCam1 = 0, TotalVidCam2 = 0, cnt4 = 0, TotalAdCount5 = 0,
										TotalAdCounthr = 0;
								int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;

								String ddd = "";
								String TheDate = "", TheTime = "", Location = "", concat = "";
								String sql = "select OTP from db_gps.t_dragondroiduserreg where InsertDate>='" + date + "00:00:00"
										+ "' and InsertDate <='" + date1 + "23:59:00" + "' and imeino='" + ui + "'";
								res2 = stmt.executeQuery(sql);
								while (res2.next()) {

									OTP = res2.getString("OTP");
							%>

							<tr>
								<td align="center"><font face=Arial><%=i%></font></td>
								<td align="center"><font face=Arial><%=user1%></font></td>
								<td align="center"><font face=Arial><%=OTP%></font></td>

							</tr>


							<%
								i++;
								}
							%>
						</tbody>
					</table>
				</div>


				<%
					
				%>
			
</body>
</html>

