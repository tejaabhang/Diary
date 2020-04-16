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
//out.println(incdtCmt+"=============="+permanentSol);
try
{

	Statement st=null;
	Statement stmt1=null;
	final String userName=session.getAttribute("username").toString();
	String entby=session.getAttribute("email").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss");
	String today=formatter.format(dte);
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    stmt1=con.createStatement();
 		st = con.createStatement();
	} catch (Exception e) {
	}
	
	String RId=request.getParameter("RId");
	//String ConfStatus=request.getParameter("ConfStatus");
	String ConfComments=request.getParameter("ConfComments");
	String sql="update db_gps.t_ComplaintDetail set  Status='Solved' , ClosingComment='"+ConfComments+"' ,ClosedBy='"+userName+"',Closeddatetime='"+today+"' where ComplaintID='"+RId+"'	";
	//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql);
	int i=st.executeUpdate(sql);
	String issue="",date="",report="",Website="",mailto="",EntBy="",Category="",ContactNumber="";
	String sql1="select * from db_gps.t_ComplaintDetail where ComplaintID='"+RId+"'";
	ResultSet rs=stmt1.executeQuery(sql1);
	if(rs.next()){
		issue=rs.getString("Description");
		date=rs.getString("ComplaintDateTime");
		report=rs.getString("ReportName");
		Website=rs.getString("Website");
		EntBy=rs.getString("Name");
		Category=rs.getString("Category");
		ContactNumber=rs.getString("ContactNumber");
		mailto=rs.getString("Email1");
		//System.out.println("**********>>>>>>>>>>:"+mailto);
	}
	String body=EntBy+",<br><br>\nYour Complaint regarding complaint ID "+RId+" is closed. Details of ticket are given below: <br><br>"+
				"Complaint ID: "+RId+
				"<br>Description: "+issue+""+
				"<br>Complaint Date: "+formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date))+
				"<br>Category: "+Category+
				"<br>Closing comments: "+ConfComments+
				"<br><br>*In case of any queries,kindly reply to mail id avlsupport@mobile-eye.in "+
				"for assistance.<br><br>Regards,<br>Transworld Support Team <br>"+
				"Phone: 9120 41214444"+
				"<br>Email: avlsupport@Mobile-Eye.in <mailto:avlsupport@Mobile-Eye.in>";
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
		               msg.setSubject("Complaint Details:"+RId);
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
	//response.sendRedirect("FleetViewComplaintReport.jsp?dataFilter=All&update=Yes&comp="+RId);
	
	
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
%>
</body>

</html>