<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
    <%@ include file="header.jsp" %>
    <%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String DaysApplied=request.getParameter("DaysApplied");
out.println("DaysApplied"+DaysApplied);
String FirstDayOfLeave=request.getParameter("FirstDayOfLeave");
out.println("FirstDayOfLeave"+FirstDayOfLeave);
String reason=request.getParameter("reason");
out.println("reason"+reason);
String reasonForLeave=request.getParameter("reasonForLeave");
out.println("reasonForLeave"+reasonForLeave);
String DateOfReporting=request.getParameter("DateOfReporting");
out.println("DateOfReporting"+DateOfReporting);
String emailAdd=request.getParameter("emailAdd");
out.println("emailAdd"+emailAdd);
String Details=request.getParameter("Details");
out.println("Details"+Details);
String name=request.getParameter("name");

String HODemailAdd=request.getParameter("HODemailAdd");
out.println("HODemailAdd"+HODemailAdd);
String reason2=request.getParameter("reason2");
out.println("reason2"+reason2);
String reason3=request.getParameter("reason3");
out.println("reason3"+reason3);
String typeofleave="";


Boolean innerflag=false;
Class.forName(MM_dbConn_DRIVER);
Connection conn,conn1;
Statement st,st1,st2,st3;
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
java.util.Date d= new java.util.Date();
out.println(d);
String datetoday=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
out.println(datetoday);
Boolean flag=false;
String sql="insert into db_gps.t_leaverequest(daysapplied,firstdayofleave,typeofleave,reasonforleave,dateofreporting,emailid,details,status,HOD,name,inserteddatetime) values ('"+DaysApplied+"','"+FirstDayOfLeave+"','"+reason+"','"+reasonForLeave+"','"+DateOfReporting+"','"+emailAdd+"','"+Details+"','Pending','"+HODemailAdd+"','"+name+"','"+datetoday+"')";
out.println("sql--->"+sql);
String Data="<html><body>"+"\n\n Mam/Sir, \n Please approve leave as per below details "+"<table border="+1+"><tr><td><b>Days applied</b></td><td>"+DaysApplied+"</td></tr><tr><td><b>First Day of leave</b></td><td>"+FirstDayOfLeave+"</td></tr><tr><td><b>Type Of Leave</b></td><td>"+reason+"</td></tr><tr><td><b>Reason for leave </b></td><td>"+reasonForLeave+"</td></tr><tr><td><b>Date when reporting / reported</b></td><td>"+DateOfReporting+"</td></tr></table>";
int i=st.executeUpdate(sql);
if(i>0){
	out.println("leave added");
	innerflag=true;
	try{

		 flag=false;
		 if(innerflag==true)
		 {
			
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
		               msg.setSubject("Leave Application of "+name);
		               msg.setSentDate(new java.util.Date());
		               Address recipientAddrs[] = new InternetAddress[1];
		               Address recipientAddrs1[] = new InternetAddress[1];
		               recipientAddrs[0] = new InternetAddress(emailAdd);
		               recipientAddrs1[0] = new InternetAddress(HODemailAdd);
		               msg.addRecipients(Message.RecipientType.TO,recipientAddrs1);
		               msg.addRecipients(Message.RecipientType.CC,recipientAddrs);
		               Address fromAddress=new InternetAddress("noreply@transworld-compressor.com","Transworld"); // in second "", it is short name
		          
		               msg.setFrom(fromAddress);
		               msg.setContent(Data+"<br> Thanks and Regards, <br> Transworld Team" ,"text/html; charset=ISO-8859-1"); 
		               // Send the message
		               Transport t = session1.getTransport("smtps");
		               msg.saveChanges(); // don't forget this
		               try
		               {
		            	  
		                    t.connect(host, user, pass);
		                    t.sendMessage(msg, msg.getAllRecipients());
		                    flag=true;
		                   // //System.out.println("Your message has been sent");
		               }/*catch(SMTPSendFailedException smp)
		               {
		            	   System.out.print("Error:--"+smp.getCommand()+smp.getReturnCode());
		               }*/
		               catch(Exception e)
		               {
		                   System.out.print("Exception----->"+e);
		                  
		               } 
		               finally 
		               {
		                   t.close();
		               } 
		          		
		               Transport.send(msg);
		          				               
		              // Transport.send(msg1);

		              
		 }//if innerflag
		       
	}catch(Exception e){
		
	}
	response.sendRedirect("leave application.jsp");
}

%>
</body>
</html>