<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;

%>
<html>
<head>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
function toggleDetails(id, show)
{// alert(id);
	var popup = document.getElementById("popup"+id);
	//alert(popup)
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

function showFTPImage(imageName)
{	
	var url="IncidentFtpImage.jsp?imageName=" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
}

</script>
<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		</style>
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
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 
<br></br>
			 <table border="0" width="900px" bgcolor="#77D7D4" align="center">
				<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3"><b>Incident Detail Report</b> </font></div>
					</td>
				</tr>
			</table>
			<br>
			<%-- <table border="1" align="center" class="sortable">
				<tr>
					<!-- <td><font color="black"> <b>Sr.</b></font></td>
					<td><font color="black"><b> Incident ID</b></font></td>
           			<td><font color="black"><b> Vehicle Reg no.</b></font></td>
					<td><font color="black"><b> Transporter</b></font></td>
					<td><font color="black"><b> UnitID</b></font></td>
					<td><font color="black"><b> Recieved<br>ByMailDate</b></font></td>
					<td><font color="black"><b> Recieved<br>ByMailTime</b></font></td>
					<td><font color="black"><b> Received<br>By</b></font></td>
					<td><font color="black"><b> Received<br>From</b></font></td>
            		<td><font color="black"><b> Downloaded by</b></font></td>
            		<td><font color="black"><b> reported through<br>Mail/Sms</b></font></td>
            		<td><font color="black"><b> Date</b></font></td>
            		<td><font color="black"><b> Time</b></font></td>
            		<td><font color="black"><b>Observation<br>From<br>Incident Data</b></font></td>
            		<td><font color="black"><b>Driver<br>Training<br>Details</b></font></td>
            		<td><font color="black"><b>Location<br>(Map)</b></font></td>
            		<td><font color="black"><b>Location<br>(Satelite)</b></font></td>
            		<td><font color="black"><b>Last<br>Journey<br>(Map)</b></font></td>
            		<td><font color="black"><b>Data<br>Download Status</font></td>
            		<td><font color="black"><b>EntBy</b></font></td> -->
                </tr>
                <%
                Class.forName(MM_dbConn_DRIVER);
                conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
                st=conn1.createStatement();
                st1=conn1.createStatement();
                String sql="select * from t_incidentreport order by UpdatedDateTime DESC ";
                ResultSet rs=st.executeQuery(sql);
                int i=1;
                String datadownloadstus="";
                while(rs.next()){
                	
                	String sqlqry="select datadownload from db_gps.t_incidentsms where unitid='"+rs.getString("UnitID")+"' and IncidentID='"+rs.getString("IncidentID")+"'";
                	ResultSet rs1=st1.executeQuery(sqlqry);
                	if(rs1.next()){
                		
                		datadownloadstus=rs1.getString("datadownload");
                	}
                	%>
                	<tr>
					<td><font color="black"> <%=i%></font></td>
					<td><font color="black"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rs.getString("IncidentID")%></a></font>
				<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="detailsOfIncident.jsp?transp=<%=rs.getString("Transporter")%>&vehno=<%=rs.getString("VehicleRegNo")%>&unitid=<%=rs.getString("UnitID")%>"  onclick="toggleDetails(<%=i%>,false);">Edit</a></td></tr>
	 <tr>
		<td>
		editDetailsOfIncident.jsp?incidentID=<%=rs.getString("IncidentID")%>
			<a href="generateIncidentReport.jsp?incidentID=<%=rs.getString("IncidentID")%>" >Generate PDF</a>
		</td>
	</tr> 
	<tr>
		<td>
			<a href="javascript:toggleDetails(<%=i%>,false);">Close</a>
		</td>
	</tr>
	</table></div>
	</td>
           			<td><font color="black"><%=rs.getString("VehicleRegNo")%></font></td>
					<td><font color="black"><%=rs.getString("Transporter")%></font></td>
					<td><font color="black"><%=rs.getString("UnitID")%></font></td>
					<td><font color="black"><%=rs.getString("IncidentRecievedByMailDate")%></font></td>
					<td><font color="black"><%=rs.getString("IncidentRecievedByMailTime")%></font></td>
					<td><font color="black"><%=rs.getString("ReceivedBy")%></font></td>
					<td><font color="black"><%=rs.getString("ReceivedFrom")%></font></td>
            		<td><font color="black"><%=rs.getString("DataDownloadedBy")%></font></td>
            		<td><font color="black"><%=rs.getString("ReportedThrough")%></font></td>
            		<td><font color="black"><%=rs.getString("IncidentDate")%></font></td>
            		<td><font color="black"><%=rs.getString("IncidentTime")%></font></td>
            		<td><div align="left" style="overflow: auto; width: 100px; height: 100px"><font color="black"><%=rs.getString("ObservationOFIncident1")%>
            																			<%=rs.getString("ObservationOFIncident2")%>
            																			<%=rs.getString("ObservationOFIncident3")%>
            																			<%=rs.getString("ObservationOFIncident4")%></font></div></td>
            		<td><div align="left" style="overflow: auto; width: 150px;"><font color="black"><%=rs.getString("DriverTrainingDetails")%></font></div></td>
            		<td><div align="left" style="overflow: auto; width: 50px;"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("IncidentLocationMap")%>');"><%=rs.getString("IncidentLocationMap")%></a></font></div></td>
<td><div align="left"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("IncidentLocationMap")%>');"><%=rs.getString("IncidentLocationMap")%></a></font></div></td>
                        <td><div align="left" style="overflow: auto; width: 50px;"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("IncidentLocationSatelite")%>');"><%=rs.getString("IncidentLocationSatelite")%></a></font></div></td>
<td><div align="left"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("IncidentLocationSatelite")%>');"><%=rs.getString("IncidentLocationSatelite")%></a></font></div></td>
            		<td><div align="left" style="overflow: auto; width: 50px;"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("LastTripJourneyMap")%>');"><%=rs.getString("LastTripJourneyMap")%></a></font></div></td>
<td><div align="left"><font color="black"><a href="#" onclick="showFTPImage('<%=rs.getString("LastTripJourneyMap")%>');"><%=rs.getString("LastTripJourneyMap")%></a></font></div></td>

               		<td><font color="black"><%=datadownloadstus%></font></td>
               		
               		<td><font color="black"><%=rs.getString("EntBy")%></font></td>
                </tr>
                	<% i++;
                }
                %>
             </table> --%>

<table width="1100px" height="350px">
	<tr>
	
	
			
			
		<td align="right">
		<font size="2">
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			</font>
		<iframe id="myIframe" width="120%" height="850px" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=incidentdetail.rptdesign&__showtitle=false";> 
</iframe>
		
		</td>
	</tr>
</table>

<!-- code end here ---></div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright \A9 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>