
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>



<%@page import="java.sql.ResultSet"%>
<%!Connection conn;
	Statement st1, st2, st3, st4, st5;
	String query1, query2, query3, query4, query5;%>

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
<title>Incident Report</title>
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
									title : 'Incident Report',

								}, {
									extend : 'pdf',
									title : 'Incident Report',
								}, {
									extend : 'csv',
									title : 'Incident Report',
								}, {
									extend : 'print',
									title : 'Incident Report',
								}, {
									extend : 'copy',
									title : 'Incident Report',
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
		//          else if(date1 > currentDate)
		//          {
		//              alert("From Date should be less than current date");
		//              return false; 
		//          }
		//          else if(date2 > currentDate) 
		//          {
		//              alert("To Date should be less than current date");
		//              return false; 
		//          }

		return true;

	}
</script>



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
				<!--- code start here ------>


				<%
					try {
						Class.forName("org.gjt.mm.mysql.Driver");
						Connection con1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps", "java",
								"transjava!1");
				%>

				<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
					<tr>
						<td>
							<table border="0" width="100%">
								<tr>
									<td align="center"><font color="black" size="3">Incident
											Report</font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br /> <br />
				<!--- code start here ------>
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

						if (Bt == null || Bt == " " || Bt == "") {

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

						String dt = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex1));

						String dt1 = new SimpleDateFormat("yyyy-MM-dd")
								.format(new SimpleDateFormat("dd-MMM-yyyy").parse(datex2));

						System.out.println(" dt :-  " + dt + " dt1 :-  " + dt1);

						int details = 0;
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


										<td><input type="submit" name="button" id="button"
											value="Submit" class="formElement" onclick="chk()"></td>


									</tr>
								</table>
							</form>
							<form name="SimmasterReport" id="SimmasterReport" action=""
								method="post">

								<%
									String exportFileName = "Incident_report.xls";
								%>
								<table width="750px" border="0" align="center">
									<tr>


										<td><input type="hidden" id="tableHTML" name="tableHTML"
											value="" /> <input type="hidden" id="fileName"
											name="fileName" value="<%=exportFileName%>" /> <!-- <div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{goToFullExcel();}catch(e){alert(e);}">Full Excel</a>
							<a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{gotoExcel('table1','tableHTML');}catch(e){alert(e);}">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"/></a></div>
    --></td>
									</tr>
								</table>
								<div class="form" style="width: 750px; color: black;">
									<table id="example" width="750px" border="0" align="center">


										<thead>
											<tr>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">SrNo.
												</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Count
												</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Unit
													ID</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Vechile
													Code</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Stamp
												</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Stamp
													Date</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Stamp
													Time</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #e6e6e6; color: black;">Updated
												</th>
												<th
													style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">mail
													Date Time</th>

											</tr>
										</thead>
										<tbody>
											<%
											        int i=1;
												    String count = " ";
													String Unitid = " ";
													String VechCode = " ";
													String stamp = " ";
													String stampDate = " ";
													String stampTime = " ";
													String updateDate = " ";
													String mailDateTime = " ";

													if (Bt == null || Bt.equals("null")) {

													} else {

														Statement stmt0 = con1.createStatement();

														String sql = "select count(*) as count,unitid,vehcode,stamp,stampdate,stamptime,updateddt,mailDateTime from db_gps.t_processincident where maildatetime >='"
																+ dt + "00:00:00" + "' and maildatetime<='" + dt1 + " 23:59:00" + "' group by unitid";

														System.out.println(sql);
	
														ResultSet result = stmt0.executeQuery(sql);
														while (result.next()) {
															
															
	                                                           
															count = result.getString("count");
															Unitid = result.getString("unitid");
															VechCode = result.getString("vehcode");
															stamp = result.getString("stamp");
															stampDate = result.getString("stampdate");
															stampTime = result.getString("stamptime");
															updateDate = result.getString("updateddt");
															mailDateTime = result.getString("maildatetime");
															
																String sd = new SimpleDateFormat("dd-MMM-yyyy")
																	.format(new SimpleDateFormat("yyyy-MM-dd").parse(stampDate));
																
																String ud = new SimpleDateFormat("dd-MMM-yyyy")
																		.format(new SimpleDateFormat("yyyy-MM-dd").parse(updateDate));
																
																String mdt = new SimpleDateFormat("dd-MMM-yyyy")
																		.format(new SimpleDateFormat("yyyy-MM-dd").parse(mailDateTime));
															
											%>
											<tr>
												<td><%=i%></td>
												<td><a
													href="IncidentDataReport.jsp?value=<%=dt%>
													&value1=<%=dt1%>&value2=<%=Unitid%>"><%=count%></a></td>
												<td><%=Unitid%></td>
												<td><%=VechCode%></td>
												<td><%=stamp%></td>
												<td><%=sd%></td>
												<td><%=stampTime%></td>
												<td><%=ud%></td>
												<td><%=mdt%></td>
											</tr>

											<%
										        	i++;
												}
													}
												} catch (Exception e) {
													e.printStackTrace();
												}
											%>





											</div>
											</td>

											</div>
											<div id="copyright">Copyright &copy; 2008 by Transworld
												Compressor Technologies Ltd. All Rights Reserved.</div>
</body>
</html>
