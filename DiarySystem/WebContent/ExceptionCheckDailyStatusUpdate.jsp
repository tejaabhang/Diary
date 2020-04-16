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
<title>Exception Daily update</title>
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
	String [] tokens1 =null;
	String [] tokens2 =null;
	String [] tokens3 =null;
	String [] tokens4 =null;
	String [] tokens5 =null;
	String [] tokens6 =null;
	String [] tokens7 =null;
	String [] tokens8 =null;

	String theDate= request.getParameter("thedate");
	String vehCode= request.getParameter("vehCode");
	String vegRegNo= request.getParameter("vehreg");
	String trans= request.getParameter("trans");
	String violationType= request.getParameter("vt");
	String violationDate = request.getParameter("violationDate");
	String violationTime = request.getParameter("violationTime");
	String suggestedAction= request.getParameter("status");
	final String userName=session.getAttribute("username").toString();
	String cnt= request.getParameter("cnt");
	
	
	if(theDate.contains("\'")) {
		theDate = theDate.replaceAll("\'","");
	}	
	if(vehCode.contains("\'")) {
		vehCode = vehCode.replaceAll("\'","");
	}
	if(vegRegNo.contains("\'")) {
		vegRegNo = vegRegNo.replaceAll("\'","");
	}
	if(trans.contains("\'")) {
		trans = trans.replaceAll("\'","");
	}
	if(violationType.contains("\'")) {
		violationType = violationType.replaceAll("\'","");
	}
	if(violationDate.contains("\'")) {
		violationDate = violationDate.replaceAll("\'","");
	}
	if(violationTime.contains("\'")) {
		violationTime = violationTime.replaceAll("\'","");
	}
	if(suggestedAction.contains("\'")) {
		suggestedAction = suggestedAction.replaceAll("\'","");
	}
	if(cnt.contains("\'")) {
		cnt = cnt.replaceAll("\'","");
	}
	
		if(theDate.contains(",")) {
			tokens1 = theDate.split(",");
		}
		if(vehCode.contains(",")) {
			tokens2 = vehCode.split(",");
		}
		if(vegRegNo.contains(",")) {
			tokens3 = vegRegNo.split(",");
		}
		if(trans.contains(",")) {
			tokens4 = trans.split(",");
		}
		if(violationType.contains(",")) {
			tokens5 = violationType.split(",");
		}
		if(violationDate.contains(",")) {
			tokens6 = violationDate.split(",");
		}
		if(violationTime.contains(",")) {
			tokens7 = violationTime.split(",");
		}
		if(suggestedAction.contains(",")) {
			tokens8 = suggestedAction.split(",");
		}
		
		//System.out.println("The  theDate is :"+theDate);
		//System.out.println("The  vehCode is :"+vehCode);
		//System.out.println("The  vegRegNo is :"+vegRegNo);
		//System.out.println("The  trans is :"+trans);	
		//System.out.println("The  violationType is :"+violationType);
		//System.out.println("The  violationDate is :"+violationDate);
		//System.out.println("The  violationTime is :"+violationTime);
		//System.out.println("The  suggestedAction is :"+suggestedAction);
		//System.out.println("The  cnt is :"+cnt);
		//System.out.println("The  userName is :"+userName);
			
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    
    //System.out.println("Connection Created");
    
    
%>


<br />			

<form id="ExceptionCheckDailyStatus" name="ExceptionCheckDailyStatus" action="" method="post">
	<%
	
	if(Integer.parseInt(cnt) > 1) {
	for(int i = 0; i < Integer.parseInt(cnt); i++) {
			sql ="insert into db_gps.t_exceptioncheckingaction(TheDate,vehcode,vehRegNo,Transporter,ViolationType,ViolationDate,ViolationTime,SuggestedAction,ActionBy) values ('"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tokens1[i]))+"','"+tokens2[i]+"','"+tokens3[i]+"','"+tokens4[i]+"','"+tokens5[i]+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tokens6[i]))+"','"+tokens7[i]+"','"+tokens8[i]+"','"+userName+"')";
			st.executeUpdate(sql);
			//System.out.println("The sql >>>>"+sql);
			
			
	}//end of for
	}//end of if
	else{
		sql ="insert into db_gps.t_exceptioncheckingaction(TheDate,vehcode,vehRegNo,Transporter,ViolationType,ViolationDate,ViolationTime,SuggestedAction,ActionBy) values ('"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(theDate))+"','"+vehCode+"','"+vegRegNo+"','"+trans+"','"+violationType+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(violationDate))+"','"+violationTime+"','"+suggestedAction+"','"+userName+"')";
		st.executeUpdate(sql);
		//System.out.println("The sql >>>>"+sql);
	}
	
		response.sendRedirect("ExceptionDailySummaryReport.jsp");
	
	}catch(Exception e) {
		//System.out.println("The Exception is >>=>>>"+e);
	}
	%>

</form>
<div id="gbox-bot1"></div>
</body>
</html>
