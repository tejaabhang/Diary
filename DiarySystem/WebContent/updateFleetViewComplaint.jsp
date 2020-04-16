<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!Connection con1, con2;%>
<%
Class.forName(MM_dbConn_DRIVER);

con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmtinsert=con1.createStatement();
String entby=session.getAttribute("email").toString();
String complaintID=request.getParameter("ComplaintID");
String sql="update t_ComplaintDetail set Status='Solved' where ComplaintID='"+complaintID+"'";
int i=stmt1.executeUpdate(sql);
String issue="",date="",report="",Website="",mailto="",EntBy="",Category="",ContactNumber="";
String sql1="select * from t_ComplaintDetail where ComplaintID='"+complaintID+"'";
ResultSet rs=stmt2.executeQuery(sql1);
if(rs.next()){
	issue=rs.getString("Description");
	date=rs.getString("ComplaintDateTime");
	report=rs.getString("ReportName");
	Website=rs.getString("Website");
	EntBy=rs.getString("Name");
	Category=rs.getString("Category");
	ContactNumber=rs.getString("ContactNumber");
	mailto=rs.getString("Email1");
}
String body="Mam/Sir,\nYour Complaint regarding complaint ID "+complaintID+" is <b>SOLVED</b> "+"<html><body>"+
			"<table align=center  cellpadding=0 cellspacing=3 width=100% border=1><tr><td><b>Report</b></td><td>"+report+"</td></tr><tr><td><b>Description</b></td><td>"+
			issue+"</td></tr><tr><td><b>Registered Date</b></td><td>"+date+"</td></tr><tr><td><b>Ent By</b></td><td>"+
			EntBy+"</td></tr><tr><td><b>Category</b></td><td>"+Category+"</td></tr><tr><td><b>ContactNumber</b></td><td align=right>"+ContactNumber+"</td></tr>"+
			"</table>\n\n<table><tr><td> <b>In case of any queries,kindly reply to mail id :avlsupport@mobile-eye.in for assistance <b></td></tr><tr><td>Thanks and Regards></td></tr><tr><td>Transworld Team></td></tr><table> ";
if(i>0){


	              Properties props = new Properties();
	              String host="smtp.transworld-compressor.com";
	              String protocol="smtp";
	              String user="tripend@mobile-eye.in"; 
	              String pass="transworld";
	              props.put("mail.smtp.starttls.enable","true");
	              props.put("mail.smtp.auth", "true");
	              props.put("mail.smtp.user", "user");
	              props.put("mail.smtp.password", "pass");  
	              props.put("mail.store.protocol", protocol);
	              props.put("mail.smtps.host", host);
	              java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	              Session session1 = Session.getDefaultInstance(props, null);
	               // Construct the message
	               Message msg = new MimeMessage(session1);
	               msg.setSubject("Complaint Details:"+complaintID);
	               msg.setSentDate(new java.util.Date());
	            	      Address recipientAddrs[] = new InternetAddress[1];
	            		  recipientAddrs[0] = new InternetAddress(mailto);
	            	 
	           
				   Address recipientAddrs1[] = new InternetAddress[2];
		               recipientAddrs1[0] = new InternetAddress(entby);
		               recipientAddrs1[1] = new InternetAddress("Avlsupport@mobile-Eye.in");
	               msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
	              msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
	         //   	//System.out.println("stp3");
	               Address fromAddress=new InternetAddress(entby,"Transworld"); // in second "", it is short name
	         //   	//System.out.println("stp4");
	               msg.setFrom(fromAddress);
	         //   	//System.out.println("stp5");
	               msg.setContent(body,"text/html; charset=ISO-8859-1"); 
	               // Send the message
	               Transport t = session1.getTransport("smtps");
	               msg.saveChanges(); // don't forget this
	        //    	//System.out.println("stp6");
	             
	               try
	               {
	        //    	 	//System.out.println("stp7");
	                    t.connect(host, user, pass);
	        //         	//System.out.println("stp8");
	                    t.sendMessage(msg, msg.getAllRecipients());
	       
	               }
	               catch(Exception e)
	               {
	                   System.out.print("Exception----->"+e);
	                  
	               } 
	               finally 
	               {
	                   t.close();
	               } 
	          		try{
	          			 Transport.send(msg);
	          		}catch(Exception e){
	          			
	          		}
	          		
}
response.sendRedirect("FleetViewComplaintReport.jsp?dataFilter=All&update=Yes&comp="+complaintID);
%>
</body>
</html>