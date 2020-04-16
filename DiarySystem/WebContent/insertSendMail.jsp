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

con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(),
stmt2=con1.createStatement(),
stmt3=con1.createStatement(),
stmt4=con1.createStatement(),
stmt5=con1.createStatement(),
stmt6=con1.createStatement(),
stmt7=con1.createStatement(),
stmtinsert=con1.createStatement();
int i=0;
String entby=session.getAttribute("email").toString();
String transporter=request.getParameter("transporter");
String vehno=request.getParameter("vehno");

String vid=request.getParameter("vid");

String unitid=request.getParameter("unitid");
String template=request.getParameter("template");
String description=request.getParameter("description");
String body=request.getParameter("body");
String CC=request.getParameter("CC");
String  tid=request.getParameter("tid"); 
//System.out.println(">>>tid<<<"+tid);


String user1=session.getAttribute("DisplayName").toString();	

body=body.replace("'","\'");
body=body.replace("#","<br>");
boolean a=CC.endsWith(",");
StringTokenizer st=null;
if(true==a){
	 int index=CC.length();
	 //System.out.println(CC);
	 CC=CC.substring(0, index-1);
	  //System.out.println(CC);
	   st=new StringTokenizer(CC,",");
	  i=st.countTokens();
	  //System.out.println("i===>"+i);
}else{
	 st=new StringTokenizer(CC,",");
	  i=st.countTokens();
	  //System.out.println("i===>"+i);
}
//out.println(entby);
//out.println(transporter);
//out.println(template);
//out.println(vehno);
//out.println(unitid);out.println(description +body);

String cntr=request.getParameter("cntr");
////System.out.println(cntr);
int cntrint=Integer.parseInt(cntr);
////System.out.println(cntrint);
String to="";
String[] uncntchk = new String[cntrint];
int chkdcntr1=0, chkdcntr=0;

for(int k=0; k<cntrint; k++) 
{
		uncntchk[k] = request.getParameter("emailid"+k);
	//	//System.out.println(uncntchk[k]+k);
		
	if(uncntchk[k]==null)
		{
 
		} 
		else
		{
		chkdcntr1++;
		//System.out.println(chkdcntr1);
		to=to+","+uncntchk[k];

		}
}

Boolean flag=false;
try{
	              Properties props = new Properties();
	              
	              
	              /*
	              String host="a.mobileeye.in";
	              String protocol="smtp";
	              final    String user="tripend@mobile-eye.in"; 
	              final    String pass="transworld";
	              props.put("mail.smtp.starttls.enable","true");
	              props.put("mail.smtp.auth", "true");
	              props.put("mail.smtp.user", "user");
	              props.put("mail.smtp.password", "pass");  
	              props.put("mail.store.protocol", protocol);
	              props.put("mail.smtps.host", host);
	              props.put("mail.smtp.port", "25");
	               // Construct the message
	             */
	             
	             String host = "a.mobileeye.in";

	             String protocol = "smtp";

	           final  String user = "9100";
	           final String pass = "transworld";

	             props.put("mail.smtp.starttls.enable", "true");
	             props.put("mail.smtp.auth", "true");
	             props.put("mail.smtp.user", user);
	             props.put("mail.smtp.password", pass);
	             props.put("mail.store.protocol", protocol);
	             props.put("mail.smtp.host", "a.mobileeye.in");
	             props.put("mail.smtp.port", "25");
	               
	               
	               
	               java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	              Session session1 = Session.getDefaultInstance(props, null);
		              
		              session1 = Session.getInstance(props,
				                new javax.mail.Authenticator() {

				                    protected PasswordAuthentication getPasswordAuthentication() {
				                        return new PasswordAuthentication(user, pass);
				                    }
				                });

				      session1.setDebug(true);
	               
	               
	               
	               
	               Message msg = new MimeMessage(session1);
	               msg.setSubject(description);
	               msg.setSentDate(new java.util.Date());
	              // Address add1=new InternetAddress(email,email2);
	         //     	//System.out.println("stp1"+chkdcntr1);
	            			  //  mail id-------------
	            	      Address recipientAddrs[] = new InternetAddress[chkdcntr1];
	            	  for(int m=0; m<cntrint; m++){
	            			
	            		  recipientAddrs[m] = new InternetAddress(uncntchk[m]);
	            			//System.out.println("stp1"+recipientAddrs[m]+m);
	            		 
	            		
	            	  }
	            int j=i+2;
	          System.out.println("j===>"+j);
				   Address recipientAddrs1[] = new InternetAddress[j];
		               recipientAddrs1[0] = new InternetAddress(entby);
		               recipientAddrs1[1] = new InternetAddress("Avlsupport@mobile-Eye.in");
		               for(int m=2; m<j; m++){
		            	   System.out.println("m===>"+m);
		            	   if(st.hasMoreTokens()) {
		            	        // //System.out.println(st.nextToken());
		            	   recipientAddrs1[m] = new InternetAddress(st.nextToken());
		            			//System.out.println("stp1"+recipientAddrs1[m]);
		            		 
		            	   }
		            	  }
		         	//System.out.println("stp2"+recipientAddrs1);
	             //  Address add1=new InternetAddress(mailid);
	               msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
	              msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
	        // System.out.println("stp3");
	               Address fromAddress=new InternetAddress(entby,"Transworld"); // in second "", it is short name
	       // System.out.println("stp4");
	               msg.setFrom(fromAddress);
	       //  System.out.println("stp5");
	               msg.setContent(body,"text/html; charset=ISO-8859-1"); 
	               // Send the message
	               Transport t = session1.getTransport("smtps");
	               msg.saveChanges(); // don't forget this
	      //  System.out.println("stp6");
	             
	               try
	               {
	       // System.out.println("stp7");
	                   t.connect(host, user, pass);
	        //System.out.println("stp8>>>>>>>>>>>>>>>.");
	                    t.sendMessage(msg, msg.getAllRecipients());
	         System.out.println("stp9**********************");
	                   // t.sendMessage(msg1, msg1.getAllRecipients());
	                    flag=true;
	      // System.out.println("Your message has been sent@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	               }/*catch(SMTPSendFailedException smp)
	               {
	            	   System.out.print("Error:--"+smp.getCommand()+smp.getReturnCode());
	               }*/
	               catch(Exception e)
	               {
	                   System.out.print("Exception----mail sendingggggggggggg->"+e);
	                  
	               } 
	               finally 
	               {
	                   t.close(); 
	               } 
	          		try{
	          			 Transport.send(msg);
	          		}catch(Exception e){
	          			
	          		}
	              
	          				               
	              // Transport.send(msg1);
	               String sql="";
	              if(tid==null || tid.equals("null") ||  tid.equals("-")){
	               sql="insert into t_emailmaster (vahno,transporter,subject,body,template,fromid,Toid,UnitID) values ('"+vehno+"','"+transporter+"','"+description+"','"+body+"','"+template+"','"+entby+"','"+to+"','"+unitid+"')";
	               
	              }else{
	            	  	            	  
	            	  sql="insert into t_emailmaster (TicketID,vahno,transporter,subject,body,template,fromid,Toid,UnitID) values ('"+tid+"','"+vehno+"','"+transporter+"','"+description+"','"+body+"','"+template+"','"+entby+"','"+to+"','"+unitid+"')"; 
	            	  
	              }
	              //System.out.println(sql);
	               stmt2.executeUpdate(sql);
	               
	              
	               if(tid==null || tid.equals("null") ||  tid.equals("-")){
	            	   
	            	   
	               }else{
	               
	               String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Send Mail','"+description+"','"+user1+"','"+vid+"','"+vehno+"','"+transporter+"') ";
	           	stmt1.executeUpdate(sqlths);
	           	//System.out.println(">>>sqlths<<<"+sqlths);
	              
	               }
	       
}catch(Exception e){
	e.printStackTrace();
}

response.sendRedirect("sendmail.jsp?vehno="+vehno+"&unitid="+unitid+"&transp="+transporter);
%>
</body>
</html>