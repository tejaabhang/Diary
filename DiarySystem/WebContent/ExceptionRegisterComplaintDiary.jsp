<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st,st1,st2;
String sql,sql1;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Register Exception complaints</title>
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

	String TheDate= request.getParameter("TheDate");
	String VehCode = request.getParameter("VehCode");
	String VehRegNo = request.getParameter("VehRegNo");
	String Trans= request.getParameter("Trans");
	String ViolationType= request.getParameter("ViolationType");
	String ViolationDate= request.getParameter("ViolationDate");
	String ViolationTime= request.getParameter("ViolationTime");
	String ViolationValue= request.getParameter("ViolationValue");
	String ViolationValue2= request.getParameter("ViolationValue2");
	String fDate= request.getParameter("fDate");
	String tDate= request.getParameter("tDate");
	
	//System.out.println("The violation 2 is :"+ViolationValue2);
	
	if(TheDate.contains("\'"))
	{
		TheDate = TheDate.replaceAll("\'","");
	}
	if(VehCode.contains("\'"))
	{
		VehCode = VehCode.replaceAll("\'","");
	}
	if(VehRegNo.contains("\'"))
	{
		VehRegNo = VehRegNo.replaceAll("\'","");
	}
	if(Trans.contains("\'"))
	{
		Trans = Trans.replaceAll("\'","");
	}
	if(ViolationType.contains("\'"))
	{
		ViolationType = ViolationType.replaceAll("\'","");
	}
	if(ViolationDate.contains("\'"))
	{
		ViolationDate = ViolationDate.replaceAll("\'","");
	}
	if(ViolationTime.contains("\'"))
	{
		ViolationTime = ViolationTime.replaceAll("\'","");
	}
	if(ViolationValue.contains("\'"))
	{
		ViolationValue = ViolationValue.replaceAll("\'","");
	}
	//System.out.println("The violation 2 is :"+ViolationValue2);
	if(ViolationValue2 == null) {}else{
	if(ViolationValue2.contains("\'"))
	{
		ViolationValue2 = ViolationValue2.replaceAll("\'","");
	}
	}
	//System.out.println("The violation 2 is :"+ViolationValue2);
	if(fDate.contains("\'"))
	{
		fDate = fDate.replaceAll("\'","");
	}
	if(tDate.contains("\'"))
	{
		tDate = tDate.replaceAll("\'","");
	}
	
	
	//trim the white spaces
	
	if(TheDate.contains(" "))
	{
		TheDate = TheDate.trim();
	}
	if(VehCode.contains(" "))
	{
		VehCode = VehCode.trim();
	}
	if(VehRegNo.contains(" "))
	{
		VehRegNo = VehRegNo.trim();
	}
	if(Trans.contains(" "))
	{
		Trans = Trans.trim();
	}
	if(ViolationType.contains(" "))
	{
		ViolationType = ViolationType.trim();
	}
	if(ViolationDate.contains(" "))
	{
		ViolationDate = ViolationDate.trim();
	}
	if(ViolationTime.contains(" "))
	{
		ViolationTime = ViolationTime.trim();
	}
	if(ViolationValue.contains(" "))
	{
		ViolationValue = ViolationValue.trim();
	}
	if(ViolationValue2 == null) {}else{
	if(ViolationValue2.contains(" "))
	{
		ViolationValue2 = ViolationValue2.trim();
	}
	}
	if(fDate.contains(" "))
	{
		fDate = fDate.trim();
	}
	if(tDate.contains(" "))
	{
		tDate = tDate.trim();
	}
	
	
		//System.out.println("The  TheDate is :"+TheDate);
		//System.out.println("The  VehCode is :"+VehCode);
		//System.out.println("The  VehRegNo is :"+VehRegNo);
		//System.out.println("The  Trans is :"+Trans);
		//System.out.println("The  ViolationType is :"+ViolationType);
		//System.out.println("The  ViolationDate is :"+ViolationDate);
		//System.out.println("The  ViolationTime is :"+ViolationTime);
		//System.out.println("The  ViolationValue is :"+ViolationValue);
		//System.out.println("The  ViolationValue2 is :"+ViolationValue2);
		//System.out.println("The  fDate is :"+fDate);
		//System.out.println("The  tDate is :"+tDate);
		
		//complaint parameters
		String ReportName = "-";
		String Description = "-";
		String uname=session.getAttribute("userid").toString();
		String name=session.getAttribute("username").toString();
		String EmailID="avlsupport@mobile-eye.in";
		String Email2 = "-";
		String Status = "Pending";
		String ContactNumber = "-";
		String Category = "Software";
		String Priority = "Low";
		String ComplaintDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		String comID = "";
		
		//System.out.println("The  ReportName is :"+ReportName );
		//System.out.println("The  Description is :"+Description);
		//System.out.println("The  uname is :"+uname);
		//System.out.println("The  name is :"+name);
		//System.out.println("The  EmailID is :"+EmailID);
		//System.out.println("The  Email2 is :"+Email2);
		//System.out.println("The  Status is :"+Status);
		//System.out.println("The  ContactNumber is :"+ContactNumber);
		//System.out.println("The  Category is :"+Category);
		//System.out.println("The  Priority is :"+Priority);
		//System.out.println("The  ComplaintDateTime is :"+ComplaintDateTime);
		
		if(ViolationValue2==null) {
			System.out.printf("In if");
			 Description = "Invalid '"+ViolationType+"' violation of '"+TheDate+"' for '"+VehRegNo+"' and  Vehicle Code is '"+VehCode+"' and transporter is '"+Trans+"'. The violation date and  time is '"+ViolationDate+" "+ViolationTime+"' and the violation value is '"+ViolationValue+"' ";
			//System.out.println("The DESC>>>"+Description);
			 if(Description.contains("\'"))
				{
				 Description = Description.replaceAll("\'","");
				}
			 
			 if(Description.contains(" "))
				{
				 Description = Description.trim();
				}
			 
		}else { 
			System.out.printf("In else");
			 Description = "Invalid '"+ViolationType+"' violation of '"+TheDate+"' for '"+VehRegNo+"' and  Vehicle Code is '"+VehCode+"' and transporter is '"+Trans+"'. The violation date and time is '"+ViolationDate+" "+ViolationTime+"' and the violation values is '"+ViolationValue+"' and '"+ViolationValue2+"' ";
		
			 if(Description.contains("\'"))
				{
				 Description = Description.replaceAll("\'","");
				}
			
			 if(Description.contains(" "))
				{
				 Description = Description.trim();
				}
		}
		//System.out.println("The desc is :"+Description);
		
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    st1=conn.createStatement();
    st2=conn.createStatement();
    
    //System.out.println("Connection Created");
    
   
%>
<br />			

<form id="ExceptionRegisterComplaint" name="ExceptionRegisterComplaint" action="" method="post">
	<%
	
	String sql="insert into db_gps.t_ComplaintDetail(ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,Category,Priority,ComplaintDateTime,Status,Website,PageName,EscalatedDept) "+
	" values('"+ReportName+"','"+Description+"','"+uname+"','"+name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+Status+"','Diary','ExceptionSummary.jsp','Service')";	
	
	//System.out.println("\n\nquery sqlinsert-->>"+sql);
	int i=st.executeUpdate(sql);
	//System.out.println("Successfully inserted in  complaint details");
	//System.out.println("\ni=>"+i);
	
	//get comId
	try{
	String Q ="select max(ComplaintID) as ak from db_gps.t_ComplaintDetail";
	ResultSet rs = st2.executeQuery(Q);
	//System.out.println("query q :"+Q);
	if(rs.next()) {
		comID = rs.getString("ak");
	}
	//System.out.println("\n\nThe complaint ID is :"+comID);
	}catch(Exception e){
		//System.out.println("The exception is :"+e);
	}
			
	//insert into complaint history
	String sql1="insert into db_gps.t_ComplaintDetailHistory(ComplaintID,ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,Category,Priority,ComplaintDateTime,Status,Website,PageName,EscalatedDept) "+
			" values('"+comID+"','"+ReportName+"','"+Description+"','"+uname+"','"+name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+Status+"','Diary','ExceptionSummary.jsp','Service')";	
			
	//System.out.println("\n\nquery sqlinsert-->>"+sql1);
	//System.out.println("\n\nquery sqlinsert history table-->>"+sql1);
							  
	int k=st1.executeUpdate(sql1);
	//System.out.println("Successfully inserted in complaint details history");
	//System.out.println("\nk=>"+k);
	
	//update the exception details table
	String sql2="update db_gps.t_exceptiondetails SET CompStatus ='Registered' where TheDate = '"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(TheDate))+"' AND VehID ='"+VehCode+"' AND Transporter='"+Trans+"' AND ViolationType ='"+ViolationType+"' AND ViolationDate = '"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(ViolationDate))+"' AND ViolationTime ='"+ViolationTime+"'";		
	//System.out.println("\n\nquery sqlinsert-->>"+sql2);				  
	int l=st2.executeUpdate(sql2);
	//System.out.println("Successfully updated");
	//System.out.println("\nl=>"+l);
	
	if(ViolationType=="ND" || ViolationType.equals("ND")) {
		response.sendRedirect("ExceptionSummaryNDCount.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(ViolationType=="CD" || ViolationType.equals("CD")){
		response.sendRedirect("ExceptionSummaryCDCount.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(ViolationType=="Distance" || ViolationType.equals("Distance")) {
		response.sendRedirect("ExceptionSummaryDSCount.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(ViolationType=="RAlimit" || ViolationType.equals("RAlimit")) {
		response.sendRedirect("ExceptionSummaryRALimit.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else if(ViolationType=="RDlimit" || ViolationType.equals("RDlimit")){
		response.sendRedirect("ExceptionSummaryRDLimit.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}else {
		response.sendRedirect("ExceptionSummaryOSLimit.jsp?vehID='"+VehCode+"'&fDate='"+fDate+"'&tDate='"+tDate+"'");
	}
		
	}catch(Exception e) {
		//System.out.println("The Exception is >>=>>>"+e);
	}
	%>

</form>
<div id="gbox-bot1"></div>
</body>
</html>
