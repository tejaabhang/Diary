<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<%!
Connection con1;
%>

<%
try {
    
          
    Class.forName(MM_dbConn_DRIVER);
	
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
    Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement(),stmt5=con1.createStatement(),stmt6=con1.createStatement(),stmt7=con1.createStatement(),stmtinsert=con1.createStatement();
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
    String sql1=""; 
    String unitid="", Data="",newunit="",vehcode="",serviceprovider="",simno="",ownername="",TheDate="",TheTime="",lastdata="",ftpdate="";

String mobno=request.getParameter("mobile");
String reason=request.getParameter("reason");
String mail=request.getParameter("chkmail");
String username=session.getAttribute("DisplayName").toString();
java.util.Date datefrmdb1=new java.util.Date();
Format formatter1=new SimpleDateFormat("yyyy-MM-dd");
String decdate=formatter1.format(datefrmdb1);
simno=request.getParameter("sim");
////System.out.println("mobile"+mobno+"mail"+mail);
java.util.Date datefrmdb2=new java.util.Date();
Format formatter2=new SimpleDateFormat("yyyy-MM-dd");
String insertdate=formatter2.format(datefrmdb2);

String inserttime=new SimpleDateFormat("HH:mm:ss").format(datefrmdb2);

String sql2="Select Service_provider from t_simmaster where Mobno='"+mobno+"'";
rs3=stmt1.executeQuery(sql2);
if(rs3.next())
{
	serviceprovider=rs3.getString("Service_provider");
}
else
{
	response.sendRedirect("mobiledeactivation.jsp?Service_provider=no&mobileno="+mobno);
	return;
}

	String str="insert into t_deactivatednosnew(MobNo,DecaDate,InsertDate,InsertTime,Reason,SProvider,EntBy) values('"+mobno+"','"+decdate+"','"+insertdate+"','"+inserttime+"','"+reason+"','"+serviceprovider+"','"+username+"')";
	//Query for t_sqlquery
		String abcd=str.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	int i=stmt2.executeUpdate(str);
//	//System.out.println("updated");
	
	String que="Update t_simmaster set DeactiveDate='"+decdate+"',Status='Deactivated' where Simno='"+simno+"'";
	//Query for t_sqlquery
	String abcd1=que.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
	stmt6.executeUpdate(que);
//	//System.out.println("t_simmaster updated");
	
	Boolean flag=false;
	
	//------------ send mail to service provider----------------------------------------------
	
	String email="";
	if(mail!=null && mail.equalsIgnoreCase("yes"))
	{
		
		String str1="Select Mail_Id from t_serviceprovidermailID where ServiceProvider='"+serviceprovider+"'";
		ResultSet rst=stmt5.executeQuery(str1);
		if(rst.next())
		{
			email=rst.getString("Mail_Id");
		}
		
		 //email="p_ghotkule@transworld-compressor.com";
		 
		 Data="Hello Sir/Mam,\n\n\t  Please Deactivate the below Mobile No/s" +
   		" \n Details of Mobile:"+"\n\n Mobile No.:"+mobno+" \n Reason To Deactivate:"+reason;
		 
		String  Data1="Hello Sir/Mam,\n\n\t The below Mobile No/s has been send for deactivation to: "+email+" \n By: "+username+
	   		" \n Details of Mobile:"+"\n\n Mobile No.:"+mobno+" \n Reason To Deactivate:"+reason;
		 
		
	 try
		        {
		  			 flag=false;
		  			  //String email2="v_george@transworld-compressor.com ;";// p_ghotkule@transworld-compressor.com ; p_pethkar@transworld-compressor.com";
		  		//	String email3="p_ghotkule@transworld-compressor.com; p_pethkar@transworld-compressor.com";
					//  String email2="k_manoj@transworld-compressor.com";
					//  String email3="r_maner@transworld-compressor.com";
				//String email4="p_pethkar@transworld-compressor.com";
					  //String email4="a_laddha@myfleetview.com";
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
		               msg.setSubject("Mobile Deactivation. This is a autogenerated mail please do not reply to it.");
		               msg.setSentDate(new java.util.Date());
		              // Address add1=new InternetAddress(email,email2);
		               Address add1=new InternetAddress(email);
		               msg.addRecipient(Message.RecipientType.TO,add1);
		               Address fromAddress=new InternetAddress("noreply@transworld-compressor.com","Transworld"); // in second "", it is short name
		          
		               msg.setFrom(fromAddress);
		               msg.setContent(Data+"\n\n Thanks and Regards, \n Transworld Team" ,"text/plain"); 
		               // Send the message
		               Transport t = session1.getTransport("smtps");
		               msg.saveChanges(); // don't forget this
		               
		               
		               Message msg1 = new MimeMessage(session1);
		               msg1.setSubject("Mobile Deactivation Confirmation Mail. This is a autogenerated mail please do not reply to it.");
		               msg1.setSentDate(new java.util.Date());
		             //  Address add=new InternetAddress(email2);
		               Address recipientAddrs[] = new InternetAddress[3];
		               recipientAddrs[0] = new InternetAddress("k_manoj@transworld-compressor.com");
		               recipientAddrs[1] = new InternetAddress("r_maner@transworld-compressor.com"); 
		               recipientAddrs[2] = new InternetAddress("a_laddha@myfleetview.com"); 
		              // Address add=new InternetAddress(email2,email3,email4);
		               msg1.addRecipients(Message.RecipientType.TO,recipientAddrs);
		               //addRecipient(Message.RecipientType.TO,add);
		             //msg1.setRecipient(Message.RecipientType.CC,email3);
		               msg1.setFrom(fromAddress);
		               msg1.setContent(Data1+"\n\n Thanks and Regards, \n Transworld Team" ,"text/plain"); 
		               // Send the message
		          
		               msg1.saveChanges(); // don't forget this
		               
		               
		               
		               
		               try
		               {
		            	  
		                    t.connect(host, user, pass);
		                    t.sendMessage(msg, msg.getAllRecipients());
		                    t.sendMessage(msg1, msg1.getAllRecipients());
		           //         //System.out.println("Your message has been sent");
		                    flag=true;
		               }/*catch(SMTPSendFailedException smp)
		               {
		            	   System.out.print("Error:--"+smp.getCommand()+smp.getReturnCode());
		               }*/
		               catch(Exception e)
		               {
		          //         System.out.print("Exception----->"+e);
		                  
		               } 
		               finally 
		               {
		                   t.close();
		               } 
		          		
		               Transport.send(msg);
		          				               
		               Transport.send(msg1);

		            

		       }// end of inner try
		        catch(Exception e)
		        {
		        	
		        	////System.out.println("Sorry, your mail cannot be sent due to Congestion"+e);
		        	
		 
		        }
			}
	if(flag==true)
	{
		String query="Update t_deactivatednosnew set Mail='Yes' where MobNo='"+mobno+"'";
		//Query for t_sqlquery
		String abcd2=query.replace("'","#");	
		abcd2=abcd2.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
		stmt7.executeUpdate(query);
	}
	
	//------------------------------------------------------------------------------------------
	response.sendRedirect("mobiledeactivation.jsp?inserted=yes&mobileno="+mobno+"&flag="+flag);
	return;


} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>

