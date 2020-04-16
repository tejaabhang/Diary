<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*" language="java"%>
<% // page import="incident.IncidentDateProcessing"
%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.net.*" import="java.util.*"
	import="java.text.*" import="java.io.*" import="javax.swing.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection con1;
%>
<%
          Class.forName(MM_dbConn_DRIVER);
		   con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		   Statement stmt1=con1.createStatement();
		   Statement stmt2=con1.createStatement();
		   Statement st2=con1.createStatement();
		   
		   
		   String transporter="",vehno="",unitid="",receiveby="",receivefrm="",replocation="",Rdate="",RIdate="",sql="",Rtime="",RRmain="";
		   String buffer="";
		   
		   transporter=request.getParameter("trans");
		   vehno=request.getParameter("vehno");
		   unitid=request.getParameter("unitid");
		   receiveby=request.getParameter("receiveby");
		   receivefrm=request.getParameter("receivefrm");
		   replocation=request.getParameter("location");
		   
		   RRmain=request.getParameter("date");//Reported date time
		   
		   
		   Rdate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(RRmain));
		   
		   Rtime=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(RRmain));
		   
		   
		   RIdate=request.getParameter("receiveIdate");
		   RIdate=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(RIdate));

		   
		   
		   
			//IncidentRecievedByMailDate='"+calender+"',IncidentRecievedByMailTime='"+hourmail+":"+minutesmail+"',	

		   
		   
	try{
		
		
		
		
		String sqlck="select * from db_gps.t_incidentreport where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime  DESC limit 1  ";

		ResultSet rsck=stmt1.executeQuery(sqlck);
		if(rsck.next())
		{
			sql="update db_gps.t_incidentreport set Transporter='"+transporter+"',VehicleRegNo='"+vehno+"',UnitID='"+unitid+"',ReceivedBy='"+receiveby+"',ReceivedFrom='"+receivefrm+"',ReportedLocation='"+replocation+"',IncidentRecievedByMailDate='"+Rdate+"',IncidentRecievedByMailTime='"+Rtime+"',ReportedInciDate='"+RIdate+"' where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime DESC limit 1   ";
			//System.out.println("update is " +sql);
			st2.executeUpdate(sql);
			buffer="Yes";
			
		}
		else{
			
			//sql="insert into db_gps.t_incidentreport(Transporter,VehicleRegNo,UnitID,ReceivedBy,ReceivedFrom,ReportedLocation,IncidentRecievedByMailDate,IncidentRecievedByMailTime,ReportedInciDate) values ('"+transporter+"','"+vehno+"','"+unitid+"','"+receiveby+"','"+receivefrm+"','"+replocation+"','"+Rdate+"','"+Rtime+"','"+RIdate+"')";
			//System.out.println("update is " +sql);
			//st2.executeUpdate(sql);
			sql="update db_gps.t_incidentreport set Transporter='"+transporter+"',VehicleRegNo='"+vehno+"',UnitID='"+unitid+"',ReceivedBy='"+receiveby+"',ReceivedFrom='"+receivefrm+"',ReportedLocation='"+replocation+"',IncidentRecievedByMailDate='"+Rdate+"',IncidentRecievedByMailTime='"+Rtime+"',ReportedInciDate='"+RIdate+"' where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime DESC limit 1   ";
			//System.out.println("update is " +sql);
			st2.executeUpdate(sql);
			buffer="Yes";
		}
		
		if(buffer.equalsIgnoreCase("Yes"))
		{
			out.print(buffer);
		}
		
		
		
		
	}
	
	catch(Exception e)
	{
		e.printStackTrace();
	}
		   
		   
		   
		    %>