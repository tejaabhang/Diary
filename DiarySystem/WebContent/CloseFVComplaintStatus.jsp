<%@page import="java.security.acl.Owner"%><%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
	Connection con;
	
	%>
<head>
</head>

<body onload="window.opener.location.reload();setTimeout('self.close()',5);"> 
<%
//System.out.println("======inside the close fvcomplaintsStatus========");
try
{
	int i=0;
	Statement st1=null;
	Statement st2=null;
	Statement st3=null;
	Statement st4=null;
	Statement st5=null;
	Statement st7=null;
	Statement st50=null;
	String usrEmail="";
	String expResoTime="";
	 String userName=session.getAttribute("username").toString();
	 
	String entby=session.getAttribute("email").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st1 = con.createStatement();
 		st2 = con.createStatement();
 		st3 = con.createStatement();
 		st4 = con.createStatement();
 		st5 = con.createStatement();
 		st7 = con.createStatement();
 		st50 = con.createStatement();
	} catch (Exception e) {
	}
	
	
	String RId=request.getParameter("RId");	
	String Comments=request.getParameter("closingComment");
	
	//System.out.println("the complaint id is :"+RId);
	//System.out.println("the closing comments is :"+Comments);
	//System.out.println("the  entby is :"+entby);
	
	try{
	String sql1="update db_gps.t_ComplaintDetail set  Status='Closed' , ClosingComment='"+Comments+"' ,ClosedBy='"+userName+"',Closeddatetime='"+today+"' where ComplaintID='"+RId+"'	";
	//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql1);
	 i=st1.executeUpdate(sql1);
	}catch(Exception e1){
		//System.out.println("the exception1 is :"+e1);
	}
	
	
	
	String issue="-",date="",report="-",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",ClosingComment="-",ClosingTime="-",ResponseTime="-",priority="-";
	String clsdcmnt="-",escltddept="-",clsdby="-",transporter="-",cmpdate="-",resoldate="-",email11="-",enby="-",pagenm="-",descr="-",flnm="-",date1="",recipientid="-";
	
	String sql3="select * from db_gps.t_ComplaintDetail where ComplaintID='"+RId+"'";
	ResultSet rs3=st3.executeQuery(sql3);
	if(rs3.next()){
		issue=rs3.getString("Description");
		date=rs3.getString("ComplaintDateTime");
		report=rs3.getString("ReportName");
		Website=rs3.getString("Website");
		EntBy=rs3.getString("Name");
		Category=rs3.getString("Category");
		priority=rs3.getString("Priority");
		ContactNumber=rs3.getString("ContactNumber");
		ClosingComment=rs3.getString("ClosingComment");
		ClosingTime=rs3.getString("Closeddatetime");
		ResponseTime=rs3.getString("ComplaintResolutionTime");
		mailto=rs3.getString("Email1");
		//mailto=rs3.getString("Email1");
		//System.out.println("**********>>>>>>>>>>:"+mailto);
		
		

		

		clsdcmnt=rs3.getString("ClosingComment");
		clsdby=rs3.getString("ClosedBy");
		transporter=rs3.getString("Transporter");
		resoldate=rs3.getString("ComplaintResolutionTime");
		
		pagenm=rs3.getString("PageName");
		
		escltddept=rs3.getString("EscalatedDept");
		
		issue=rs3.getString("Description");
		date=rs3.getString("ComplaintDateTime");
		report=rs3.getString("ReportName");
		Website=rs3.getString("Website");
		EntBy=rs3.getString("Name");
		Category=rs3.getString("Category");
		ContactNumber=rs3.getString("ContactNumber");
		priority=rs3.getString("Priority");
		mailto=rs3.getString("Email1");
		enby=rs3.getString("EntBy");
		email11=rs3.getString("EmailID");
		
		flnm=rs3.getString("FileName");
		
		//System.out.println("**********>>>>>>>>>>:"+mailto);
		/////System.out.println("**********>>>>>>>>>>:"+mailto);
		
	//	recipientid=rs.getString("Email1");
		//email11=rs.getString("EmailID");
		
		////System.out.println("****esclateDept******>>>>>>>>>>:"+esclateDept);
	
		
		
		
		
		
		
		date=rs3.getString("ComplaintDateTime");
		report=rs3.getString("ReportName");
		Website=rs3.getString("Website");
		EntBy=rs3.getString("Name");
		Category=rs3.getString("Category");
		priority=rs3.getString("Priority");
		ContactNumber=rs3.getString("ContactNumber");
		mailto=rs3.getString("Email1");
		//System.out.println("****resoldate******>>>>>>>>>>:"+resoldate);
	
		
		
		
		
		
	}
	
	
	try{
		
		if(resoldate!=null)	
		{
	//	String sql2="insert db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Status,ComplaintResolutionTime)values('"+issue+"','"+pagenm+"','"+report+"', '"+Website+"',  '"+clsdcmnt+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','Closed','"+Comments+"','"+userName+"','"+today+"','"+resoldate+"')	";
		String sql2="insert db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Status,Name,ComplaintResolutionTime,updateComment)values('"+issue+"','"+pagenm+"','"+report+"', '"+Website+"',  '"+clsdcmnt+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','Closed','"+userName+"','"+ResponseTime+"','"+Comments+"')";
		
		//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql2);
		int j=st2.executeUpdate(sql2);
		}else{
			
//			String sql2="insert db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Status,ClosingComment,Closeddatetime)values('"+issue+"','"+pagenm+"','"+report+"', '"+Website+"',  '"+clsdcmnt+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','Closed','"+Comments+"','"+userName+"','"+today+"')	";
			String sql2="insert db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Status,Name,updateComment)values('"+issue+"','"+pagenm+"','"+report+"', '"+Website+"',  '"+clsdcmnt+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','Closed','"+userName+"','"+Comments+"')";
			
			
			//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql2);
			int j=st2.executeUpdate(sql2);
			
		}
		
		
		
		
		}catch(Exception e2){
			//System.out.println("the exception2 is :"+e2);
		}
	
	
	
	try{
		String sql9="select ExpectedResolutionTime from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND ExpectedResolutionTime<>''";
		ResultSet rs9=st7.executeQuery(sql9);
		//System.out.println("The query is :"+sql9);
		if(rs9.next()) {
			expResoTime = rs9.getString("ExpectedResolutionTime");
		}
		}catch(Exception e9){
			//System.out.println("The exception is :"+e9);
			e9.printStackTrace();
		}
		//+++++++++++++++++++++++++++++++++++
		
		//System.out.println("the entered expResoTime is :"+expResoTime);
	
	try{
	//email id who register the complaint
	String sql5="select Email from db_CustomerComplaints.t_admin where Name='"+EntBy+"'";
	ResultSet rs5=st5.executeQuery(sql5);
	if(rs5.next()) {
		usrEmail = rs5.getString("Email");
	}
	}catch(Exception e5) {
		//System.out.println("the exception5 is :"+e5);
	}
	
	//System.out.println("the user email id  is :"+usrEmail);
	
	usrEmail=usrEmail+","+mailto;
	
	//System.out.println("usrEmail********************* :"+usrEmail);
	
	

	if(usrEmail!=null && !(usrEmail.equalsIgnoreCase(mailto)) && !(usrEmail.contains("")))
	{
		usrEmail=usrEmail+","+mailto;
	
	
	
	}else{
		
		usrEmail=	mailto;
		
		
	}
	
	//System.out.println("usrEmail***********AFTER********** :"+usrEmail);
	
	String body="";
	if(expResoTime == null || expResoTime ==""){
		expResoTime = "-";
	}else{
		expResoTime = formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(expResoTime));
	}
	
	if(ResponseTime == null || ResponseTime ==""){
		ResponseTime = "-";
	}else{
		ResponseTime = formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ResponseTime));
	}
	
	if(ClosingTime == null || ClosingTime ==""){
		ClosingTime = "-";
	}else{
		ClosingTime = formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ClosingTime));
	}
	
	
	//System.out.println("The expected resolution time=================================>>>>"+expResoTime);
	//System.out.println("The ResponseTime time=================================>>>>"+ResponseTime);
	//System.out.println("The ClosingTime time=================================>>>>"+ClosingTime);
	
	
	if(userName!=null)
	{
		
		
		
	}else{
		
		userName="-";
		
	}//userName
	
	if(Website.equalsIgnoreCase("-") || Website.equalsIgnoreCase("")) Website="FleetView"; 
	
	try{
	 body="<html><head><title>Mail Body</title></head><body><table border=^18^ bordercolor=^#E6E6FA^ align=^center^ width=^30%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^><table  style=^margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;^><tr><td width=^100%^><a href=^http://www.mobile-eye.in^ target=^_blank^><img src=^http://103.8.126.138:8080/DiarySystem/images/mobile.jpg^ style=^height: 80px; width: 100px;^ title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a><br/><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><div>"
		 +"Hello "+EntBy+",<br><br>Thank you for contacting us. "
		 +"<br>Your Complaint regarding complaint ID "+RId+" has been closed.Details of ticket are given below:"
		 +"<br></br><br></br><div style=^width:90%; margin-left: 5%;^><table align=^left^ border=^0^ cellpadding=^0^ cellspacing=^0^ width=^100%^ style=^background: white;^><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint ID: </font></td><td width = ^60%^><font size=^2^ face=^Arial^>"+""
      +RId+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Description: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +issue+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint Date & Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>ExpResolutionDate&Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +expResoTime+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Report Name: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +report+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Category: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +Category+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Priority: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +priority+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Contact No: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +ContactNumber+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Recipient IDs: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +mailto+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Closing comments: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +Comments+" </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Closed By: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +userName+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>ComplaintResolutionTime: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +ResponseTime+" </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Closing Date & Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
      +ClosingTime+"</font></td></tr>";
	}catch(Exception e){
		//System.out.println("Exception =>"+e);
	}
      String query1 = "select Status,updateComment,Description from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND Status<>'Pending' order by SrNo ASC";
      ResultSet rs2 = st1.executeQuery(query1);
      //System.out.println("query1>>>>>>>>>>>"+query1);  
      
      while(rs2.next())
       {
   	
   //	body=body+"<tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>"+rs2.getString("Status")+"</font></td><td width=^60%^><font size=^2^ face=^Arial^>"+rs2.getString("updateComment")+"</font></td></tr>";
      }
     	body=body+"</table></div><br><br></div>"         
      +"<div style=^width:100%; float:left;^><br><br>Regards,<br>Transworld Support Team.<br>"
      +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";

     
    /*  if(body.contains("^")) {
		String Data1=body.replace("^","'");
		//System.out.println("the data change back"+Data1);  
 		} */
	
	if(i>0){


		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		Calendar cal = Calendar.getInstance();
   		String DateTime = dateFormat.format(cal.getTime());
   		
   		String Subject = "Closed Complaint #"+RId;//+"Transworld"+Website;
   		//System.out.println(DateTime);
   		
      try{
    	  
    	  String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New  Complaint closing confirmation Email','"+body+"','"+Subject+"','"+usrEmail+"','"+entby+"','"+DateTime+"','Pending','Transworld')";//Complaint closed - Transworld compressor technology ltd,Pune'
    	  st50.executeUpdate(q);
    	  //System.out.println("The query is  :"+q);
    	
    	/*  	//System.out.println("The email id of  person who register the complaint is "+usrEmail);
    		//System.out.println("The email id of entby person is "+entby);*/
     
      }catch(Exception e10){
    	  //System.out.println("The exception in data insertion is :"+e10);
      }     
      		//System.out.println("the record has been successfully insered into table");
		              
		          		
	}
	
	
	
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
%>
</body>

</html>