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
//System.out.println("************came to EscalationFVComplaint**************");
try
{
	String HODId="";
	String HodEmail="";
	String comResInc="";
	String comResIncEmail="";
	String expResoTime="";
	Statement st=null;
	Statement st1=null;
	Statement st2=null;
	Statement st3=null;
	Statement st4=null;
	Statement st5=null;
	Statement st6=null;
	Statement st7=null;
	Statement st50=null;
	String escComment=request.getParameter("escComment");
	String esclateDept=request.getParameter("esclateDept");
	final String userName=session.getAttribute("username").toString();
	String entby=session.getAttribute("email").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    st=con.createStatement();
 		st1= con.createStatement();
 		st2= con.createStatement();
 		st3= con.createStatement();
 		st4= con.createStatement();
 		st5= con.createStatement();
 		st6= con.createStatement();
 		st7= con.createStatement();
 		st50= con.createStatement();
	} catch (Exception e) {
	}
	
	String RId=request.getParameter("RId");
	//System.out.println("The complaint id is :"+RId);
	
	String sql="update db_gps.t_ComplaintDetail set  Status='Escalated',EscalatedDept='"+esclateDept+"' where ComplaintID='"+RId+"' ";
	//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql);
	int i=st.executeUpdate(sql);
	
	
	

	String issue="-",date="",report="",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",priority="-";
	
	String clsdcmnt="-",escltddept="-",clsdby="-",transporter="-",cmpdate="-",resoldate="-",email11="-",enby="-",pagenm="-",descr="-",flnm="-",date1="",recipientid="-";
	String sql2="select * from db_gps.t_ComplaintDetail where ComplaintID='"+RId+"'";
	ResultSet rs=st2.executeQuery(sql2);
	if(rs.next()){
		clsdcmnt=rs.getString("ClosingComment");
		clsdby=rs.getString("ClosedBy");
		transporter=rs.getString("Transporter");
		resoldate=rs.getString("ComplaintResolutionTime");
		
		pagenm=rs.getString("PageName");
		
		escltddept=rs.getString("EscalatedDept");
		
		issue=rs.getString("Description");
		date=rs.getString("ComplaintDateTime");
		report=rs.getString("ReportName");
		Website=rs.getString("Website");
		EntBy=rs.getString("Name");
		Category=rs.getString("Category");
		ContactNumber=rs.getString("ContactNumber");
		priority=rs.getString("Priority");
		mailto=rs.getString("Email1");
		enby=rs.getString("EntBy");
		email11=rs.getString("EmailID");
		
		flnm=rs.getString("FileName");
		
		//System.out.println("**********>>>>>>>>>>:"+mailto);
		/////System.out.println("**********>>>>>>>>>>:"+mailto);
		
	//	recipientid=rs.getString("Email1");
		//email11=rs.getString("EmailID");
		
		//System.out.println("****esclateDept******>>>>>>>>>>:"+esclateDept);
	}
	
	
	
	
	
	try{
		
		if(resoldate!=null){
		String sql1="insert into db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,ComplaintResolutionTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Name,updateComment,EscalatedDept,Status)values('"+issue+"','"+pagenm+"','"+report+"', '"+Website+"',  '"+clsdcmnt+"', '"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+resoldate+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','"+userName+"','"+escComment+"','"+esclateDept+"','Escalated')";
		//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql1);
		int j=st1.executeUpdate(sql1);
		}else{
			
			String sql1="insert into db_gps.t_ComplaintDetailHistory(Description,PageName,ReportName,Website,ClosingComment,ClosedBy,Transporter,FileName,ComplaintDateTime,Category,Priority,Email1,EmailID,EntBy,ComplaintID,Name,updateComment,EscalatedDept,Status)values('"+issue+"', '"+pagenm+"','"+report+"','"+Website+"',  '"+clsdcmnt+"','"+clsdby+"','"+transporter+"','"+flnm+"','"+date+"','"+Category+"','"+priority+"','"+mailto+"','"+email11+"','"+enby+"','"+RId+"','"+userName+"','"+escComment+"','"+esclateDept+"','Escalated')";
			//System.out.println("@@@@@@@@@@@@>>>>>>ELSE >>>>>>>:"+sql1);
			int j=st1.executeUpdate(sql1);
			
		}
	
	
	}catch(Exception e1) {
			//System.out.println("the exception in inserting in HISTORY  :"+e1);
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
		String sql3="select HODId from db_leaveapplication.t_department where DeptName='"+esclateDept+"'";
		ResultSet rs3=st3.executeQuery(sql3);
		//System.out.println("The query is :"+sql3);
		if(rs3.next()) {
			HODId = rs3.getString("HODId");
		}
		}catch(Exception e){
			//System.out.println("The exception is :"+e);
			e.printStackTrace();
		}
		//+++++++++++++++++++++++++++++++++++
		
		//+++++++++++++++++++++++++++++++++++
		
		//System.out.println("the entered hod id is :"+HODId);
		
		try{
			String sql4="select Email from db_leaveapplication.t_leaveadmin where EmpID='"+HODId+"'";
			ResultSet rs4=st4.executeQuery(sql4);
			//System.out.println("The query is :"+sql4);
			if(rs4.next()) {
				HodEmail = rs4.getString("Email");
			}
			}catch(Exception e){
				//System.out.println("The exception is :"+e);
				e.printStackTrace();
			}
			
			
			
			//+++++++++++++++++++++++++++++++++++
			
			
			
			
			//System.out.println("the entered hod emailid is $$$$$$$$$$$$$$:"+HodEmail);
			
			
			
			
			try{
				String sql5="select CompResInCharge from db_leaveapplication.t_department where DeptName='"+esclateDept+"'";
				ResultSet rs5=st5.executeQuery(sql5);
				//System.out.println("The query is :"+sql5);
				if(rs5.next()) {
					comResInc = rs5.getString("CompResInCharge");
				}
				}catch(Exception e){
					//System.out.println("The exception is :"+e);
					e.printStackTrace();
				}
				//+++++++++++++++++++++++++++++++++++
				
				//System.out.println("the entered CompResInCharge id is $$$$$$$$$$"+comResInc);
			
				
				try{
					String sql6="select Email from db_leaveapplication.t_leaveadmin where EmpID='"+comResInc+"'";
					ResultSet rs6=st6.executeQuery(sql6);
					//System.out.println("The query is :"+sql6);
					if(rs6.next()) {
						comResIncEmail = rs6.getString("Email");
					}
					}catch(Exception e){
						//System.out.println("The exception is :"+e);
						e.printStackTrace();
					}
					//+++++++++++++++++++++++++++++++++++
					
					//System.out.println("the entered CompResInCharge Emailid is****** *******:"+comResIncEmail);
					
					
					
					
					comResIncEmail=comResIncEmail+","+entby;
					
					//System.out.println("the CompResInCharge Emailid is final $$$$$$$$$$$$$$$$$$$$$>>>>>>>"+comResIncEmail);
					
					
					String body="<html><head><title>Mail Body</title></head><body><table border=^18^ bordercolor=^#E6E6FA^ align=^center^ width=^30%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^><table  style=^margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;^><tr><td width=^100%^><a href=^http://www.mobile-eye.in^ target=^_blank^><img src=^http://202.65.131.44:8080/DiarySystem/images/mobile.jpg^ style=^height: 80px; width: 100px;^ title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a><br/><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><div>"
						 +"Hello "+userName+",<br><br>Thank you for contacting us. "
						 +"<br>Your Complaint regarding complaint ID "+RId+" has been escalated to "+esclateDept+".Details of ticket are given below:"
			 			 +"<br></br><br></br><div style=^width:90%; margin-left: 5%;^><table align=^left^ border=^0^ cellpadding=^0^ cellspacing=^0^ width=^100%^ style=^background: white;^><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint ID: </font></td><td width = ^60%^><font size=^2^ face=^Arial^>"+""
		                +RId+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Description: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +issue+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint Date & Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>ExpResolutionDate&Time: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(expResoTime))+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Report Name: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +report+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Category: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +Category+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Priority: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +priority+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Recipient IDs: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +mailto+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Contact No: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +ContactNumber+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Escalation comments: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +escComment+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Escalation Dept: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
		                +esclateDept+" </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Escalated By: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
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
		     	
		              /*  if(body.contains("^")) {
		             		String Data1=body.replace("^","'");
		             		//System.out.println("the data change back"+Data1);  
		                	} */
	
	if(i>0){


		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		Calendar cal = Calendar.getInstance();
   		String DateTime = dateFormat.format(cal.getTime());
   		//System.out.println(DateTime);
   		
      try{
    	  
    	  String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint escalation Email','"+body+"','Complaint Escalation - Transworld Compressor Technologies Ltd,Pune','"+comResIncEmail+"','"+HodEmail+"','"+DateTime+"','Pending','Transworld')";
    	  st50.executeUpdate(q);
    	  //System.out.println("The query is ALL PENDING MAIL TABLE**********  :"+q);
    	  
    	  //recipientAddrs[0] = new InternetAddress(comResIncEmail);
    	//recipientAddrs1[0] = new InternetAddress(HodEmail);
     
      }catch(Exception e10){
    	  //System.out.println("The exception in data insertion of ALL PENDING MAIL TABLE is :"+e10);
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