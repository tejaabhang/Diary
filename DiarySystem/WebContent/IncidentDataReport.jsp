<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

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
<title>Incident Data Report</title>
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
	function confirmSubmit() {
		

		if (operator == "select") {
			alert("Please select Service Provider!");
			return false;
		}
		if (status == "select") {
			alert("Please select Status!");
			return false;
		}
		if (plan == "select") {
			alert("Please select Plan!");
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
											Data Report</font></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>



				<%
					String exportFileName = "incidentData_report.xls";
				%>
				<table width="750px" border="0" align="center">
					<tr>


						<td><input type="hidden" id="tableHTML" name="tableHTML"
							value="" /> <input type="hidden" id="fileName" name="fileName"
							value="<%=exportFileName%>" /> <!-- <div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{goToFullExcel();}catch(e){alert(e);}">Full Excel</a>
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
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">lati
								</th>
								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">longi</th>

								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Speed</th>

								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">dirdig</th>

								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">Updated
									</th>

								<th
									style="font-size: 14px; face: san-serif; border: 1px solid #ddd; padding: 10px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #e6e6e6; color: black;">mail
									Date Time</th>

							</tr>
						</thead>
						<tbody>
							<%
							        int i=1;	    
							
									String Unitid = " ";
									String VechCode = " ";
									String stamp = " ";
									String stampDate = " ";
									String stampTime = " ";
									String lati = " ";
									String longi = " ";
									float Speed ;
									String dirgid = " ";
									String updateDate = " ";
									String mailDateTime = " ";

									Statement stmt0 = con1.createStatement();

									String fromdate = request.getParameter("value");
									String todate = request.getParameter("value1");
									String unit = request.getParameter("value2");
									
									

									String sql = "select *  from db_gps.t_processincident where maildatetime >='"+ fromdate + "00:00:00" + "' and maildatetime<='" + todate + " 23:59:00" + "' and unitid='" + unit + "' ";

									System.out.println(sql);

									ResultSet result = stmt0.executeQuery(sql);
									while (result.next()) {
										
										Unitid = result.getString("unitid");
										VechCode = result.getString("vehcode");
										stamp = result.getString("stamp");
										stampDate = result.getString("stampdate");
										stampTime = result.getString("stamptime");
										lati = result.getString("lati");
										longi = result.getString("longi");
										Speed = result.getFloat("speed");
										dirgid = result.getString("dirdig");
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
								<td><%=Unitid%></td>
								<td><%=VechCode%></td>
								<td><%=stamp%></td>
								<td><%=sd%></td>
								<td><%=stampTime%></td>
								<td><%=lati%></td>
								<td><%=longi%></td>
								<td><%=Math.round(Speed)%></td>
								<td><%=dirgid%></td>
								<td><%=ud%></td>
								<td><%=mdt%></td>
							</tr>

							<%
							i++;
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
