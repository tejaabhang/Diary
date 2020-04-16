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
//System.out.println("************came to RespondFVComplaint**************");
try
{
	String EntEmail="";
	//Statement st=null;
	Statement stmt1=null;
	Statement st1=null;
	Statement st2=null;
	Statement st3=null;
	Statement st4=null;
	Statement st50=null;
	//Statement stmt10=null;
	final String userName=session.getAttribute("username").toString();
	String entby=session.getAttribute("email").toString();
	
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm");
	Format formatter3 = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    stmt1=con.createStatement();
	    st1=con.createStatement();
 		st2 = con.createStatement();
 		st3 = con.createStatement();
 		st4 = con.createStatement();
 		st50 = con.createStatement();
	} catch (Exception e) {
	}
	
	String RId=request.getParameter("RId");
	//System.out.println("The complaint id is :"+RId);
	
	String cat=request.getParameter("cat");
	
	String rTime="";
	double hours=0.0,hrs=0.0;
	long resTime,diff,diff1;
    String query = "select MaxTimeInHrs from db_gps.t_complaintscategory where CategoryID='"+cat+"'";
     ResultSet rs1 = st4.executeQuery(query);
     if(rs1.next())
      {
    	 rTime =rs1.getString("MaxTimeInHrs");
      }
     	 hours = Double.parseDouble(rTime);
     	long hoursmillisec=(long)hours*60*60*1000;
     	//System.out.println("The hoursmillisec is :"+hoursmillisec);
     
     java.util.Date date = new java.util.Date();
     //System.out.println("The date is :"+date);
     long todaysmillisec=date.getTime();
     //System.out.println("Todays milisec is :"+todaysmillisec);
     
     String td=formatter3.format(date);
     //System.out.println("td is :"+td);
     String todate=td+" 17:30:00";
     //System.out.println("todate is :"+todate);
     
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     java.util.Date convertedDate = dateFormat.parse(todate); 
     
     //System.out.println("The convertedDate date is :"+convertedDate);
     
     long tomolisec = convertedDate.getTime();
     //System.out.println("The milisec of the todate is :"+tomolisec);
     
     if((todaysmillisec+hoursmillisec)<tomolisec) {
    	 	 //System.out.println("in if");
    	 	 resTime=todaysmillisec+hoursmillisec;
     }else{
    	 	if(todaysmillisec<tomolisec) {
    	 	 //System.out.println("in else if");
    	 	 diff=tomolisec-todaysmillisec;
    	 	 diff1=hoursmillisec-diff;
    	 	 resTime=tomolisec+16*60*60*1000+diff1;
    	 	}else {
    	 		//System.out.println("in else else");
    	 		resTime=16*60*60*1000+tomolisec+hoursmillisec;
    	 	}
     }
     long milisec = resTime;
     //System.out.println("The total milisecond is :"+milisec);
     java.util.Date date2 = new java.util.Date(milisec);
     
     //System.out.println("The milisecond date is :"+date2);
     Format frt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     Format frt2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
     
     String dDate="";
     String rDate="";
     
     dDate = frt1.format(date2);
     rDate = frt2.format(date2);
     
     //System.out.println("The dDate is :"+dDate);
     //System.out.println("The rDate is :"+rDate);

	String resComment=request.getParameter("resComment");
	
	//System.out.println("the complaint id is :"+RId);
	//System.out.println("the response comment is :"+resComment);
	//System.out.println("the user name  is :"+userName);
	
	
	//++++++++++++++++++++++++++++++++++++
	
	String sql="update db_gps.t_ComplaintDetail set  Status='Responded' where ComplaintID='"+RId+"' ";
	//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql);
	int i=st2.executeUpdate(sql);
	
	
	
	String clsdcmnt="-",escltddept="-",clsdby="-",transporter="-",cmpdate="-",resoldate="-",email11="-",enby="-",pagenm="-",descr="-",flnm="-",issue="-",date1="",report="-",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",priority="-",recipientid="-";
	String sql1="select * from db_gps.t_ComplaintDetail where ComplaintID='"+RId+"'";
	ResultSet rs=stmt1.executeQuery(sql1);
	if(rs.next()){
		
		
		
		clsdcmnt=rs.getString("ClosingComment");
		escltddept=rs.getString("EscalatedDept");
		
		clsdby=rs.getString("ClosedBy");
		transporter=rs.getString("Transporter");
		
		issue=rs.getString("Description");
		date1=rs.getString("ComplaintDateTime");
		
		resoldate=rs.getString("ComplaintResolutionTime");
		
		
		pagenm=rs.getString("PageName");
		//descr=rs.getString("Description");
		flnm=rs.getString("FileName");
		
		report=rs.getString("ReportName");
		Website=rs.getString("Website");
		EntBy=rs.getString("Name");
		enby=rs.getString("EntBy");
		
		
		Category=rs.getString("Category");
		ContactNumber=rs.getString("ContactNumber");
		priority=rs.getString("Priority");
		recipientid=rs.getString("Email1");
		email11=rs.getString("EmailID");
		
		
		
		//System.out.println("**********>>>>>>>>>>:"+mailto);
	}
	
	
	
	
	try{
		
		if(resoldate!=null)
		{
			String sql2="insert into db_gps.t_ComplaintDetailHistory(Website,ClosingComment,EscalatedDept,ClosedBy,Transporter,FileName,ComplaintDateTime,ComplaintResolutionTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Description,PageName,ReportName,Name,updateComment,ExpectedResolutionTime,Status) values('"+Website+"',  '"+clsdcmnt+"', '"+escltddept+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date1+"','"+resoldate+"','"+Category+"','"+priority+"','"+recipientid+"','"+email11+"','"+enby+"','"+RId+"','"+issue+"','"+pagenm+"','"+report+"', '"+userName+"','"+resComment+"','"+dDate+"','Responded')";
		
			//System.out.println("The query is :"+sql2);
			int j = st2.executeUpdate(sql2);
			//System.out.println("The query is :"+sql2);
		}else{
			
			String sql2="insert into db_gps.t_ComplaintDetailHistory(Website,ClosingComment,EscalatedDept,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Description,PageName,ReportName,Name,updateComment,ExpectedResolutionTime,Status) values('"+Website+"','"+clsdcmnt+"','"+escltddept+"','"+clsdby+"','"+transporter+"','"+flnm+"','"+date1+"','"+Category+"','"+priority+"','"+recipientid+"','"+email11+"','"+enby+"','"+RId+"','"+issue+"','"+pagenm+"','"+report+"', '"+userName+"','"+resComment+"','"+dDate+"','Responded')";
			//System.out.println("The query is :"+sql2);
			int j = st2.executeUpdate(sql2);
			//System.out.println("The query is :"+sql2);
		}
		
		}catch(Exception e1) {
			//System.out.println("the exception is$$$$$$$$$$$$$$ :"+e1);
		}
	
	
	
	
	
	
	
	
	//System.out.println("recipientid is************ :"+recipientid);
	
	
	 
	try{
		String sql10="select Email from db_CustomerComplaints.t_admin where Name='"+EntBy+"'";
		ResultSet rs10=st1.executeQuery(sql10);
		//System.out.println("The query is :"+sql10);
		if(rs10.next()) {
			EntEmail = rs10.getString("Email");
		}
		}catch(Exception e){
			//System.out.println("The exception is :"+e);
			e.printStackTrace();
		}
		//+++++++++++++++++++++++++++++++++++
		
		//System.out.println("the entered email id is *************************:"+EntEmail);
		
		
		if(EntEmail!=null && !(EntEmail.equalsIgnoreCase(recipientid)) && !(EntEmail.contains("")))
		{
		EntEmail=EntEmail+","+recipientid;
		
		
		
		}else{
			
			EntEmail=	recipientid;
			
			
		}
		
		
		//System.out.println("the entered email id is *****$$$$$$$$****:"+EntEmail);
		//username
		String body="<html><head><title>Mail Body</title></head><body><table border=^18^ bordercolor=^#E6E6FA^ align=^center^ width=^30%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^><table  style=^margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;^><tr><td width=^100%^><a href=^http://www.mobile-eye.in^ target=^_blank^><img src=^http://myfleetview.com/DiarySystem/images/mobile.jpg^ style=^height: 80px; width: 100px;^ title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a><br/><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><div>"
			 +"Hello "+EntBy+",<br><br>Thank you for contacting us. "
			 +"<br>Your Complaint regarding complaint ID "+RId+" has been responded.Details of ticket are given below:"
			 +"<br></br><br></br><div style=^width:90%; margin-left: 5%;^><table align=^left^ border=^0^ cellpadding=^0^ cellspacing=^0^ width=^100%^ style=^background: white;^><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint ID: </font></td><td width = ^60%^><font size=^2^ face=^Arial^>"+""
           +RId+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Description: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +issue+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint Date&Time:</font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Report Name: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +report+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Category: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +Category+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Priority: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +priority+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Recipient IDs: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +recipientid+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Response comments: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +resComment+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Contact No: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +ContactNumber+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Expected Resolution Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +rDate+" </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Responsed By: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
           +userName+"</font></td></tr>";
           		
           
           String query1 = "select Status,updateComment,Description from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND Status<>'Pending' order by SrNo ASC";
           ResultSet rs2 = st1.executeQuery(query1);
           while(rs2.next())
            {
        	
        	body=body+"<tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>"+rs2.getString("Status")+"</font></td><td width=^60%^><font size=^2^ face=^Arial^>"+rs2.getString("updateComment")+"</font></td></tr>";
           }
          	body=body+"</table></div><br><br></div>"         
           +"<div style=^width:100%; float:left;^><br><br>Regards,<br>Transworld Support Team.<br>"
           +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";
	
         /* 	if(body.contains("^")) {
     		String Data1=body.replace("^","'");
     		//System.out.println("the data change back"+Data1);  
        	} */
	
	//if(i>0){
		System.out.println("in the RespondFVComplaint page and before the subjectline ");			
		String subjectline = "Responded to complaint #"+RId;
		System.out.println("in the RespondFVComplaint page and before the subjectline "+subjectline);
		DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		Calendar cal1 = Calendar.getInstance();
   		String DateTime = dateFormat1.format(cal1.getTime());
   		//System.out.println(DateTime); 
   		
      try{
    	  //'Complaint Responded - Transworld compressor technology ltd,Pune'
    	  String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint respond Email','"+body+"','"+subjectline+"','"+EntEmail+"','"+entby+"','"+DateTime+"','Pending','Transworld')";
    	  st50.executeUpdate(q);
    	  System.out.println("The query is  :"+q);
    	  
    	//recipientAddrs[0] = new InternetAddress(EntEmail);
    	//recipientAddrs1[0] = new InternetAddress(entby);
     
      }catch(Exception e10){
    	  //System.out.println("The exception in data insertion is :"+e10);
      }     
      		//System.out.println("the record has been successfully insered into table");
		
		              
//}
	
	
	
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
%>
</body>

</html>