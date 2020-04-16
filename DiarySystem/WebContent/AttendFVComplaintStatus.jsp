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
System.out.println("======inside the close fvcomplaintsStatus========");
String escperson="";
try
{
	int i=0;
	Statement st1=null;
	Statement st2=null;
	Statement st3=null;
	Statement st4=null;
	Statement st5=null;
	Statement st6=null;
	Statement st7=null;
	Statement st50=null;
	String escPersonEmail="";
	String expResoTime="";
	final String userName=session.getAttribute("username").toString();
	String entby=session.getAttribute("email").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st1 = con.createStatement();
 		st2 = con.createStatement();
 		st3 = con.createStatement();
 		st4 = con.createStatement();
 		st5 = con.createStatement();
 		st6 = con.createStatement();
 		st7 = con.createStatement();
 		st50 = con.createStatement();
	} catch (Exception e) {
	}
	
	
	String RId=request.getParameter("RId");	
	String resTime=request.getParameter("resTime");
	String HH=request.getParameter("hr");
	String MM=request.getParameter("min");
	//String ResponseTime =resTime+" "+HH+"hr "+MM+"min";
	
	SimpleDateFormat fromUser = new SimpleDateFormat("dd-MMM-yyyy");
	SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
	String ResponseTime = myFormat.format(fromUser.parse(resTime));
	
	ResponseTime=ResponseTime+" "+HH+":"+MM+":00";
	System.out.println("The response time  is :"+ResponseTime);
	
	String Comments=request.getParameter("attendingComment");
	
	System.out.println("the complaint id is :"+RId);
	System.out.println("the attending comments is :"+Comments);
	
	try{
	String sql1="update db_gps.t_ComplaintDetail set  Status='Attended',ComplaintResolutionTime='"+ResponseTime+"' where ComplaintID='"+RId+"'	";
	System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql1);
	 i=st1.executeUpdate(sql1);
	}catch(Exception e1){
		System.out.println("the exception1 is :"+e1);
	}
	
	try{
		String sql2="insert db_gps.t_ComplaintDetailHistory(ComplaintID,Status,Name,ComplaintResolutionTime,updateComment)values('"+RId+"','Attended','"+userName+"','"+ResponseTime+"','"+Comments+"')	";
		System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql2);
		int j=st2.executeUpdate(sql2);
		}catch(Exception e2){
			System.out.println("the exception2 is :"+e2);
		}
	
	String issue="-",date="",report="-",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",priority="-";
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
		mailto=rs3.getString("Email1");
		System.out.println("**********>>>>>>>>>>:"+mailto);
	}
	
	
	try{
		String sql9="select ExpectedResolutionTime from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND ExpectedResolutionTime<>''";
		ResultSet rs9=st7.executeQuery(sql9);
		System.out.println("The query is :"+sql9);
		if(rs9.next()) {
			expResoTime = rs9.getString("ExpectedResolutionTime");
		}
		}catch(Exception e9){
			System.out.println("The exception is :"+e9);
			e9.printStackTrace();
		}
		//+++++++++++++++++++++++++++++++++++
		
		System.out.println("the entered expResoTime is :"+expResoTime);
	
	try{
		//email id who register the complaint
		String sql6="select Name from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND Status='Escalated' order by UpdatedDateTime desc";
		ResultSet rs6=st5.executeQuery(sql6);
		if(rs6.next()) {
			escperson = rs6.getString("Name");
		}
		}catch(Exception e6) {
			System.out.println("the exception5 is :"+e6);
		}
		System.out.println("the name of the person who escalated is  :"+escperson);
	
	try{
	//email id who escalate the complaint
	String sql5="select Email from db_CustomerComplaints.t_admin where Name='"+escperson+"'";
	ResultSet rs5=st5.executeQuery(sql5);
	if(rs5.next()) {
		escPersonEmail = rs5.getString("Email");
	}
	}catch(Exception e5) {
		System.out.println("the exception5 is :"+e5);
	}
	
	System.out.println("the user email id  is :"+escPersonEmail);
	

	String body="<html><head><title>Mail Body</title></head><body><table border=^18^ bordercolor=^#E6E6FA^ align=^center^ width=^30%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^><table  style=^margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;^><tr><td width=^100%^><a href=^http://www.mobile-eye.in^ target=^_blank^><img src=^http://myfleetview.com/DiarySystem/images/mobile.jpg^ style=^height: 80px; width: 100px;^ title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a><br/><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><div>"
		 +"Hello "+userName+",<br><br>Thank you for contacting us. "
		 +"<br>Your Complaint regarding complaint ID "+RId+" has been attended.Details of ticket are given below:"
		 +"<br></br><br></br><div style=^width:90%; margin-left: 5%;^><table align=^left^ border=^0^ cellpadding=^0^ cellspacing=^0^ width=^100%^ style=^background: white;^><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint ID: </font></td><td width = ^60%^><font size=^2^ face=^Arial^>"+""
       +RId+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Description: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +issue+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint Date & Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>ExpResolutionDate&Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(expResoTime))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Report Name: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +report+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Attended comments: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +Comments+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Category: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +Category+" </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Priority: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +priority+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Recipient IDs: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +mailto+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Contact No: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +ContactNumber+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>ComplaintResolutionTime: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
       +ResponseTime+" </font></td></tr>";
       
       
       String query1 = "select Status,updateComment,Description from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' AND Status<>'Pending' order by SrNo ASC";
       ResultSet rs2 = st1.executeQuery(query1);
       while(rs2.next())
        {
    	
    	body=body+"<tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>"+rs2.getString("Status")+"</font></td><td width=^60%^><font size=^2^ face=^Arial^>"+rs2.getString("updateComment")+"</font></td></tr>";
       }
      	body=body+"</table></div><br><br></div>"         
       +"<div style=^width:100%; float:left;^><br><br>Regards,<br>Transworld Support Team.<br>"
       +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";

       
     /*  	if(body.contains("^")) {
 		String Data1=body.replace("^","'");
 		System.out.println("the data change back"+Data1);  
    	}*/

	if(i>0){


		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		Calendar cal = Calendar.getInstance();
   		String DateTime = dateFormat.format(cal.getTime());
   		System.out.println(DateTime);
   		
      try{
    	  
    	  String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint attended Email','"+body+"','Complaint Attended - Transworld Compressor Technologies Ltd,Pune','"+escPersonEmail+"','"+entby+"','"+DateTime+"','Pending','Transworld')";
    	  st50.executeUpdate(q);
    	  System.out.println("The query is  :"+q);
    	  
    	System.out.println("The email id of escalated person is "+escPersonEmail);
    	System.out.println("The email id of entby person is "+entby);
    	 
     
      }catch(Exception e10){
    	  System.out.println("The exception in data insertion is :"+e10);
      }     
      		System.out.println("the record has been successfully insered into table");
		             
		          		
	}
	
	
	
}
catch(Exception e)
{
	System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
%>
</body>

</html>