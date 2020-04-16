<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st;
String sql;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Exception update</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
		
<script type="text/javascript">
</script>
</head>


<body>
<%


try{
	String [] tokens =null;
	String [] tokens1 =null;
	String [] tokens2 =null;

	String status= request.getParameter("status");
	String violationTime = request.getParameter("violationTime");
	String violationDate = request.getParameter("violationDate");
	String vehCode= request.getParameter("vehCode");
	String fDate= request.getParameter("fDate");
	String tDate= request.getParameter("tDate");
	String vt= request.getParameter("vt");
	String cnt= request.getParameter("cnt");
	
	if(status.contains("\'")) {
		status = status.replaceAll("\'","");
	}
	if(violationTime.contains("\'")) {
		violationTime = violationTime.replaceAll("\'","");
	}
	if(violationDate.contains("\'")) {
		violationDate = violationDate.replaceAll("\'","");
	}
	if(vehCode.contains("\'")) {
		vehCode = vehCode.replaceAll("\'","");
	}
	if(fDate.contains("\'")) {
		fDate = fDate.replaceAll("\'","");
	}
	if(tDate.contains("\'")) {
		tDate = tDate.replaceAll("\'","");
	}
	if(vt.contains("\'")) {
		vt = vt.replaceAll("\'","");
	}
	if(cnt.contains("\'")) {
		cnt = cnt.replaceAll("\'","");
	}
		if(status.contains(",")) {
			tokens = status.split(",");
		}
		if(violationTime.contains(",")) {
			tokens1 = violationTime.split(",");
		}
		if(violationDate.contains(",")) {
			tokens2 = violationDate.split(",");
		}
		//System.out.println("The  status is :"+status);
		//System.out.println("The  violationDate is :"+violationDate);
		//System.out.println("The  violationTime is :"+violationTime);
		//System.out.println("The  vehCode is :"+vehCode);
		//System.out.println("The  vt is :"+vt);
		//System.out.println("The  fDate is :"+fDate);
		//System.out.println("The  tDate is :"+tDate);
		//System.out.println("The  cnt is :"+cnt);
		
	//	//System.out.println("The  tokens is :"+tokens[0]+" "+tokens[1]);
	//	//System.out.println("The  tokens1 is :"+tokens1[0]+" "+tokens1[1]);
	//	//System.out.println("The  tokens2 is :"+tokens2[0]+" "+tokens2[1]);
		
		
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    
    //System.out.println("Connection Created");
    
    
%>


<br />			

<form id="ExceptionCheckStatus" name="ExceptionCheckStatus" action="" method="post">
	<%
	
	if(Integer.parseInt(cnt) > 1) {
	for(int i = 0; i < Integer.parseInt(cnt); i++) {
			sql ="update db_gps.t_exceptiondetails SET CheckingStatus ='"+tokens[i]+"' where VehID ='"+vehCode+"' AND ViolationDate = '"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tokens2[i]))+"' AND ViolationTime = '"+tokens1[i]+"' ";
			st.executeUpdate(sql);
			//System.out.println("The sql >>>>"+sql);
			
			
	}//end of for
	}//end of if
	else{
		sql ="update db_gps.t_exceptiondetails SET CheckingStatus ='"+status+"' where VehID ='"+vehCode+"' AND ViolationDate = '"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(violationDate))+"' AND ViolationTime = '"+violationTime+"' ";
		st.executeUpdate(sql);
		//System.out.println("The sql >>>>"+sql);
	}
	
	if(vt=="ND" || vt.equals("ND")) {
		response.sendRedirect("ExceptionSummaryNDCount.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(vt=="CD" || vt.equals("CD")){
		response.sendRedirect("ExceptionSummaryCDCount.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(vt=="Distance" || vt.equals("Distance")) {
		response.sendRedirect("ExceptionSummaryDSCount.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(vt=="RAlimit" || vt.equals("RAlimit")) {
		response.sendRedirect("ExceptionSummaryRALimit.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(vt=="RDlimit" || vt.equals("RDlimit")){
		response.sendRedirect("ExceptionSummaryRDLimit.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else {
		response.sendRedirect("ExceptionSummaryOSLimit.jsp?vehID='"+vehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}
	}catch(Exception e) {
		//System.out.println("The Exception is >>=>>>"+e);
	}
	%>

</form>
<div id="gbox-bot1"></div>
</body>
</html>
