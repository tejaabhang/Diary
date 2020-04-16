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
									pageSize : 'A0',

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
					String ddx = request.getQueryString();

					if (ddx == null) {

						System.out.println(" In First If  ");

						datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

						data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

						Calendar c = Calendar.getInstance(); // this takes current date
						c.set(Calendar.DAY_OF_MONTH, 1);
						System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
						datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());

					} else {

						System.out.println(" In First Else  ");

						String fromdate = request.getParameter("chkdate");
						String todate = request.getParameter("chkdate1");

						System.out.println(" In First Else chkdate  " + fromdate);

						System.out.println(" In First Else  chkdate 1" + todate);

						if (fromdate != null && todate != null) {

							data1 = fromdate;
							data2 = todate;

							datex1 = fromdate;
							datex2 = todate;

						} else {

							data1 = new SimpleDateFormat("yyyy-MM-dd")
									.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
							data2 = new SimpleDateFormat("yyyy-MM-dd")
									.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));

							datex1 = request.getParameter("data");
							datex2 = request.getParameter("data1");
						}
					}

					String Bt = request.getParameter("button");
					System.out.println(" Button :- " + Bt);

					if (Bt == null || Bt == " " || Bt == " ") {

						String fromdate = request.getParameter("chkdate");
						String todate = request.getParameter("chkdate1");

						System.out.println(" In Button Null   " + fromdate);

						System.out.println(" In Button Null   chkdate 1" + todate);

						if (fromdate != null && todate != null) {

							datex1 = new SimpleDateFormat("dd-MMM-yyyy")
									.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));

							datex2 = new SimpleDateFormat("dd-MMM-yyyy")
									.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));

							data1 = fromdate;

							data2 = todate;

							departmentNew = request.getParameter("departmentNew");

						} else {
							datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
							data1 = data2 = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

							Calendar c = Calendar.getInstance(); // this takes current date
							c.set(Calendar.DAY_OF_MONTH, 1);
							System.out.println(" current date " + new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime()));
							datex1 = new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
						}
					} else {
						data1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")));
						data2 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")));

						datex1 = request.getParameter("data");
						datex2 = request.getParameter("data1");
					}

					System.out.println(" datex1 " + datex1 + " datex2 " + datex2);

					String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

					String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

					System.out.println(" dt :-  " + dt + " dt1 :-  " + dt1);

					int details = 0;
					String d = "";

					System.out.println("Date---->" + d);
					String dtt1 = "";
					int i = 1;
					ResultSet res8 = null;
					ResultSet res81 = null;
					int yy = 0;
					String arr = "";

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
					Format formatter = new SimpleDateFormat("yyyy-MM-dd");
					String day = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
					String today = new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

					String dd = request.getParameter("data");
				%>



				<table border="0" width="750px" align="center">
					<tr>
						<td>
							<form name="form1" id="form1" action="" method="post">
								<table border="1" width="100%" align="center">
									<tr>
										<td align="center"><font face="Arial" color="black"
											size="2"><b>From </b></font>&nbsp;&nbsp; <input type="text"
											id="data" height="10px" name="data" value="<%=datex1%>"
											size="13px" readonly class="element text medium"
											style="width: 125px; font-size: 12px; height: 29px; color: black" />
											<script type="text/javascript">
												Calendar.setup({
													inputField : "data", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data" // ID of the button
												});
											</script></td>


										<td align="center"><font face="Arial" color="black"
											size="2"><b>To </b></font>&nbsp;&nbsp; <input type="text"
											id="data1" name="data1" value="<%=datex2%>" size="13px"
											readonly class="element text medium"
											style="width: 125px; font-size: 12px; height: 29px; color: black" />
											<script type="text/javascript">
												Calendar.setup({
													inputField : "data1", // ID of the input field
													ifFormat : "%d-%b-%Y", // the date format
													button : "data1" // ID of the button
												});
											</script></td>


										<td align="center"><input type="submit" name="button"
											id="button" value="Submit" class="formElement"
											onclick="chk()"></td>


									</tr>

								</table>
							</form>
						</td>

						<%
							String btt = request.getParameter("button");
							if (btt == null || btt.equals(null)) {
							} else {
						%>

						<br>

						<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
							<tr>
								<td>
									<table border="0" width="100%">
										<tr>
											<td align="center"><font color="black" size="3">Dragonroid
													Installations Details for <%=datex1%> to <%=datex2%></font></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br>


						<%
							}
						%>

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
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">SrNo.
										</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">User
											Name</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Veh
											Reg No</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Vehicle
											Code</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Unit
											ID</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Email
											ID</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Mob
											No.</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Address
										</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Company
											Code</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">imei
											No</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">OTP
										</th>

										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Reg
											Date</th>


										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">UpDated
											Time</th>


										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">UpDated
											Location</th>
										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">KM
										</th>


										<th
											style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: right; background-color: #e6e6e6; color: black;">Running
											Hours</th>

									</tr>
								</thead>

								<tbody>

									<%
										if (Bt == null) {
										} else {
											data = request.getParameter("data");
											data1 = request.getParameter("data1");
											String owner = request.getParameter("owner");

											System.out.println(">>>>>>>owner>>>>>>" + owner);

											data = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
											data1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));

											//sql2="Select * from db_CustomerComplaints.hwunittest where TheDate between '"+data+"' and '"+data1+"' and TypeValue='2' order by TheDate desc";
											int VehCode = 0, RD = 0, OS = 0, cnt1 = 0, RA = 0, cnt = 0, cnt3 = 0, cnt2 = 0, cnt5 = 0, cnt9 = 0,
													cnt8 = 0;
											int cumulative = 0;
											String todaykm = "";
											int TotalImgCam2 = 0, TotalImgCam3 = 0, TotalVidCam1 = 0, TotalVidCam2 = 0, cnt4 = 0, TotalAdCount5 = 0,
													TotalAdCounthr = 0;
											int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
											data = data + " 00:00:00";
											data1 = data1 + " 23:59:59";
											String ddd = "";
											String TheDate = "", TheTime = "", Location = "", concat = "";
											String sql = "select distinct(imeino),UserName,EmailId,InsertDate,MobileNo,Address,CompanyCode,OTP from db_gps.t_dragondroiduserreg where InsertDate>='"
													+ dt + "' and InsertDate <='" + dt1 + "' group by imeino ";
											//System.out.println("Running: " + sql);
											res2 = stmt.executeQuery(sql);
											while (res2.next()) {
												UnitID = "";
												ddd = "";
												TheDate = "";
												TheTime = "";
												Location = "";
												concat = "";
												UserName = res2.getString("UserName");
												//System.out.println("UserName" + UserName);

												EmailId = res2.getString("EmailId");
												//System.out.println("EmailId"+EmailId);

												MobileNo = res2.getString("MobileNo");
												// System.out.println("MobileNo"+MobileNo); 

												Address = res2.getString("Address");
												// System.out.println("Address"+Address);

												CompanyCode = res2.getString("CompanyCode");
												//	System.out.println("CompanyCode" + CompanyCode);

												if (CompanyCode == "" || CompanyCode.equals("")) {
													CompanyCode = "-";
												}

												imeiNo = res2.getString("imeiNo");
												// System.out.println("imeiNo"+imeiNo); 

												OTP = res2.getString("OTP");
												// System.out.println("OTP"+OTP); 

												InsertDate = res2.getString("InsertDate");
												// System.out.println("InsertDate"+InsertDate); 

												dt111 = new SimpleDateFormat("dd-MMM-yyyy")
														.format(new SimpleDateFormat("yyyy-MM-dd").parse(InsertDate));

												String sql12 = "select UnitID from db_gps.t_unitmaster where WMSN='" + imeiNo + "'";
												//	System.out.println("sql12: " + sql12);
												ResultSet res12 = stmt12.executeQuery(sql12);
												if (res12.next()) {
													UnitID = res12.getString("UnitID");
													////System.out.println("UnitID" + UnitID);

												}

												else {
													String sql13 = "select unitid from db_gps.t_imeidetails where imei='" + imeiNo
															+ "' order by sr desc limit 1";

													ResultSet res13 = stmt13.executeQuery(sql13);
													if (res13.next()) {
														UnitID = res13.getString("unitid");

													}
												}

												if (UnitID == null) {
													String sql13 = "select unitid from db_gps.t_imeidetails where imei='" + imeiNo
															+ "' order by sr desc limit 1";
													System.out.println("sql13: " + sql13);
													ResultSet res13 = stmt13.executeQuery(sql13);
													if (res13.next()) {
														UnitID = res13.getString("unitid");
														//	System.out.println("UnitID" + UnitID);

													}
												}
												if (UnitID == "") {
													UnitID = "-";
												} else {

													String sql2 = "Select * from db_gps.t_vehicledetails where unitid=" + UnitID + "";
													//System.out.println("Running: " + sql2);
													res8 = st.executeQuery(sql2);
													if (res8.next()) {

														OwnerName = res8.getString("OwnerName");
														//System.out.println("OwnerName"+OwnerName);

														VehicleRegNumber = res8.getString("VehicleRegNumber");

														VehicleCode = res8.getString("VehicleCode");

													}

													String sql10 = "select (TheDistance-LastDayKm) as todaykm,TheDistance as cumulative from  db_gps.t_onlinedata where VehicleCode='"
															+ VehicleCode + "'";

													ResultSet res10 = stmt10.executeQuery(sql10);
													if (res10.next()) {
														todaykm = res10.getString("todaykm");
														System.out.println("todaykm" + todaykm);

														cumulative = res10.getInt("cumulative");
														////System.out.println("cumulative" + cumulative);

													}

													arr = todaykm.substring(0);

													System.out.println("ii" + arr);

													if (arr.contains("-")) {
														yy = Integer.parseInt(arr);

														yy = 0 - (yy);
													} 
													 else {
														if (todaykm == null || todaykm.equals("")) {
															yy = 0;
														} else {
															yy = Integer.parseInt(todaykm);
														}

														System.out.println("21111112:::::" + yy);

														yy = yy;
													}
													System.out.println("22222222:::::" + yy);

													String sql20 = "Select Distance,RDurationinHrs from db_gpsExceptions.t_veh" + VehicleCode
															+ "_ds where TheDate>='" + dt + "' and TheDate <='" + dt1 + "' ";

													ResultSet rs20 = st2.executeQuery(sql20);

													if (rs20.next()) {

														runninghours = rs20.getString("RDurationinHrs");
														System.out.println(runninghours);

													}

													String sql22 = "select * from  db_gps.t_onlinedata where VehicleCode=" + VehicleCode + "";

													Location = "-";

													concat = "-";

													res81 = stmt81.executeQuery(sql22);
													if (res81.next()) {

														TheDate = res81.getString("TheDate");

														TheTime = res81.getString("TheTime");

														Location = res81.getString("Location");
														System.out.println("Location" + Location);

														if (Location == "" || Location.equals("") || Location == " ") {
															Location = "-";

														}

														TheTime = res81.getString("TheTime");

														if (TheTime == "" || TheTime.equals("") || TheTime == " ") {
															concat = "-";
														}

														if (TheDate == "" || TheDate.equals("") || TheDate == " ") {
															concat = "-";
														} else {

															ddd = new SimpleDateFormat("dd-MMM-yyyy")
																	.format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));

															concat = ddd + " " + TheTime;
														}

													}

												}
									%>

									<tr>
										<td align="right"><font face=Arial><%=i%></font></td>
										<td align="left"><font face=Arial><a
												href="dragon.jsp?value=<%=dt%>
													&value1=<%=dt1%>&value2=<%=imeiNo%>&value3=<%=UserName%> "
												target="_blank" style="color: blue;"><%=UserName%></a></font></td>
										<td align="left"><font face=Arial><%=VehicleRegNumber%></font></td>
										<td align="right"><font face=Arial><%=VehicleCode%></font></td>
										<td align="right"><font face=Arial><%=UnitID%></font></td>
										<td align="left"><font face=Arial><%=EmailId%></font></td>
										<td align="right"><font face=Arial><%=MobileNo%></font></td>
										<td align="left"><font face=Arial><%=Address%></font></td>
										<td align="right"><font face=Arial><%=CompanyCode%></font></td>
										<td align="right"><font face=Arial><%=imeiNo%></font></td>
										<td align="right"><font face=Arial><%=OTP%></font></td>
										<td align="right"><font face=Arial><%=dt111%></font></td>
										<td align="right"><font face=Arial><%=concat%></font></td>
										<td align="left"><font face=Arial><%=Location%></font></td>
										<td align="right"><font face=Arial><%=yy%></font></td>
										<td align="right"><font face=Arial><%=runninghours%></font></td>

									</tr>


									<%
										i++;

											}
									%>
								</tbody>
							</table>
						</div>
						<%
							}
						%>
					
</body>
</html>