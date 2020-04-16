<%@page import="beanpack.incidentpdfgeneration"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
	
<%@ include file="header.jsp" %>


<%!
Connection con2;
%>
<%
Class.forName(MM_dbConn_DRIVER);
con2= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con2.createStatement(),stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt4=con2.createStatement(), stmt5=con2.createStatement();
Statement stmtinsert=con2.createStatement();
%>

	<%
	String Transporter="",VehicleRegNo="",UnitID="",DataDownloadedBy="",ReportedThrough="",ReceivedBy="",ReceivedFrom="";
	String IncidentDate="",IncidentTime="",IncidentRecievedByMailDate="",IncidentRecievedByMailTime="";
	String ObservationOFIncident1="",ObservationOFIncident2="",ObservationOFIncident3="",ObservationOFIncident4="";
	String DriverTrainingDetails="",IncidentLocationMap="",IncidentLocationSatelite="",LastTripJourneyMap="";
	String TheDate="",TheTime="",Location="";
	String incidentID=request.getParameter("incidentID");
	String sql="select * from db_gps.t_incidentreport where IncidentID='"+incidentID+"' order by UpdatedDateTime DESC";
	ResultSet rs=stmt1.executeQuery(sql);
	if(rs.next()){
		Transporter=rs.getString("Transporter");
		VehicleRegNo=rs.getString("VehicleRegNo");
		UnitID=rs.getString("UnitID");
		DataDownloadedBy=rs.getString("DataDownloadedBy");
		ReportedThrough=rs.getString("ReportedThrough");
		ReceivedBy=rs.getString("ReceivedBy");
		ReceivedFrom=rs.getString("ReceivedFrom");
		IncidentDate=rs.getString("IncidentDate");
		IncidentTime=rs.getString("IncidentTime");
		IncidentRecievedByMailDate=rs.getString("IncidentRecievedByMailDate");
		IncidentRecievedByMailTime=rs.getString("IncidentRecievedByMailTime");
		ObservationOFIncident1=rs.getString("ObservationOFIncident1");
		ObservationOFIncident2=rs.getString("ObservationOFIncident2");
		ObservationOFIncident3=rs.getString("ObservationOFIncident3");
		ObservationOFIncident4=rs.getString("ObservationOFIncident4");
		DriverTrainingDetails=rs.getString("DriverTrainingDetails");
		IncidentLocationMap=rs.getString("IncidentLocationMap");
		IncidentLocationSatelite=rs.getString("IncidentLocationSatelite");
		LastTripJourneyMap=rs.getString("LastTripJourneyMap");
		TheDate=rs.getString("LastDataDate");
		TheTime=rs.getString("LastDataTime");
		Location=rs.getString("LastDataLocation"); 
	}
	
	incidentpdfgeneration msg = new incidentpdfgeneration();
	
	msg.send(incidentID,Transporter,
			VehicleRegNo,UnitID,
			DataDownloadedBy,ReportedThrough,ReceivedBy,
			ReceivedFrom,IncidentDate,
			IncidentTime,IncidentRecievedByMailDate,
			IncidentRecievedByMailTime,TheDate,
			TheTime,Location,
			ObservationOFIncident1,ObservationOFIncident2,
			ObservationOFIncident3,ObservationOFIncident4,
			DriverTrainingDetails,IncidentLocationMap,
			IncidentLocationSatelite,LastTripJourneyMap);
	response.sendRedirect("detailsOfIncidentReport.jsp");
	%>
