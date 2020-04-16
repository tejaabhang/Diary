<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<%!
Connection con1;
%>

<%
try {
    
	System.out.println("INSERT ****"); 
    Class.forName(MM_dbConn_DRIVER);
	
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement(),stmt5=con1.createStatement(),stmt6=con1.createStatement(),stmt7=con1.createStatement(),stmtinsert=con1.createStatement();
    Statement stmt66 = con1.createStatement();
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
    String sql1=""; 
    int cnt=0;
   // String unitid="", Data="",newunit="",vehcode="",serviceprovider="",simno="",ownername="",TheDate="",TheTime="",lastdata="",ftpdate="";
	String notinserted="",insertedmob="",AirtelMob="",IdeaMob="",VodafoneMob="",RelianceMob="",AirtelSim="",IdeaSim="",VodafoneSim="",RelianceSim="",airtelreason="",ideareason="",vodafonereason="",reliancereason="";
	String Data="";
    String submitted="";
    submitted="fail";
	String username=session.getAttribute("DisplayName").toString();
	java.util.Date datefrmdb1=new java.util.Date();
	Format formatter1=new SimpleDateFormat("yyyy-MM-dd");
	String decdate=formatter1.format(datefrmdb1);

	ArrayList servprov=new ArrayList();

	java.util.Date datefrmdb2=new java.util.Date();
	Format formatter2=new SimpleDateFormat("yyyy-MM-dd");
	String insertdate=formatter2.format(datefrmdb2);

	String inserttime=new SimpleDateFormat("HH:mm:ss").format(datefrmdb2);
	
	java.util.Date datefrmdb12=new java.util.Date();
	Format formatter12=new SimpleDateFormat("dd-MMM-yyyy");
	String decdate12=formatter12.format(datefrmdb12);

    
    String cntr=request.getParameter("cntr");
    
   
 int cntint=0;   	
    	
System.out.println("cntr"+cntr);
if(cntr!=null)
{
     cntint=Integer.parseInt(cntr);
}
    if(cntr==null)
    {
    	
    	out.println("<script>");  
    	out.println("alert('Please Check Status');");  
    	out.println("window.history.go(-1);");
    	out.println("</script>");
    	
    	
    }
    if(cntint < 1)
    {
    out.println("<script>");  
	out.println("alert('Please Check Status Before Submit');");  
	out.println("window.history.go(-1);");
	out.println("</script>");
	
    	
    }
    
    String[] uncntchk = new String[cntint+1];
    for(int i=1,j=0;i<=cntint;i++,j++)
    {
    	uncntchk[j]=request.getParameter("chk"+i);
  //  	//System.out.println(request.getParameter("chk"+i));
    	if(uncntchk[j]!=null)
    	{
    			
    	String mobno=request.getParameter("mobno"+i);
    	 
    	String reason=request.getParameter("reason"+i);
    
    	String mailchk=request.getParameter("mail"+i);
    	String simno=request.getParameter("sim"+i);
    	String serviceprovider=request.getParameter("servprov"+i);
    	
	Boolean flag=false;
	/*String sql2="Select Service_provider from t_simmaster where Mobno='"+mobno+"'";
	rs3=stmt1.executeQuery(sql2);*/
	if(!serviceprovider.equalsIgnoreCase("N.A"))
	{	
	//serviceprovider=rs3.getString("Service_provider");
	// simno=rs3.getString("Simno");
	flag=true;
	if(!servprov.contains(serviceprovider) && (mailchk!=null) && (mailchk.equalsIgnoreCase("yes")))
	{
		servprov.add(serviceprovider);
	}
	if(serviceprovider.equalsIgnoreCase("Airtel") && (mailchk!=null) && (mailchk.equalsIgnoreCase("yes")))
			{
				AirtelMob=AirtelMob+","+mobno;
				airtelreason=airtelreason+"#"+reason;
				AirtelSim=AirtelSim+"#"+simno;
			}
	else if(serviceprovider.equalsIgnoreCase("Idea") && (mailchk!=null) && (mailchk.equalsIgnoreCase("yes")))	
	{
		IdeaMob=IdeaMob+","+mobno;
		ideareason=ideareason+"#"+reason;
		IdeaSim=IdeaSim+"#"+simno;
	}
	else if(serviceprovider.equalsIgnoreCase("Vodafone") && (mailchk!=null) && (mailchk.equalsIgnoreCase("yes")))
	{
		VodafoneMob=VodafoneMob+","+mobno;
		vodafonereason=vodafonereason+"#"+reason;
		VodafoneSim=VodafoneSim+"#"+simno;
	}
	
	else if(serviceprovider.equalsIgnoreCase("Reliance") && (mailchk!=null) && (mailchk.equalsIgnoreCase("yes")))
	{
		RelianceMob=RelianceMob+","+mobno;
		reliancereason=reliancereason+"#"+reason;
		RelianceSim=RelianceSim+"#"+simno;
	}
	
	
	
	
	
	}
	else
	{
	notinserted=notinserted+","+mobno;
	//response.sendRedirect("mobiledeactivation.jsp?Service_provider=no&mobileno="+mobno);
	//return;
	}
	if(flag==true)
	{
		submitted="sucessfull";
	String str="insert into t_deactivatednosnew(MobNo,DecaDate,InsertDate,InsertTime,Reason,SProvider,EntBy) values('"+mobno+"','"+decdate+"','"+insertdate+"','"+inserttime+"','"+reason+"','"+serviceprovider+"','"+username+"')";
	//Query for t_sqlquery
		String abcd=str.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	
	cnt=stmt2.executeUpdate(str);
	
	System.out.println("str ****"+str); 
//	//System.out.println("updated");
	insertedmob=insertedmob+","+mobno;
	
	String que="Update t_simmaster set DeactiveDate='"+decdate+"',Status='Deactivated' where Simno='"+simno+"'";
	//Query for t_sqlquery
	String abcd1=que.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
	System.out.println(que);
	stmt6.executeUpdate(que);
System.out.println("t_simmaster updated");
	System.out.println("que ****"+que); 
	}
	
}// if
    	
    }// for
	
	//------------ send mail to service provider----------------------------------------------
	Boolean flag=false;
	String email="";
	Data="Hello Sir/Mam,\n\n\t  Please Deactivate the below Mobile No/s" +
		" \n Details of Mobile:";
	
	//cnt =1;
	System.out.println("iNSDIE CNTTTTTTTTTTTTTTTTTTTTTTTTTTT****"+cnt); 
	if(cnt!=0)
	{
		
		
		System.out.println("iNSDIE CNTTTTTTTTTTTTTT2222222222TTTTTTTTTTTT****"); 
		String ser_prov="",mailid="";
		String str1="Select Distinct(ServiceProvider) from t_serviceprovidermailID";
		ResultSet rst=stmt5.executeQuery(str1);
		while(rst.next())
		{
			ser_prov=rst.getString("ServiceProvider");
			String str2="Select Mail_Id from t_serviceprovidermailID where ServiceProvider='"+ser_prov+"'";
			ResultSet rsget=stmt6.executeQuery(str2);
			rsget.last();
			
			int j=0;
			int rowcount=rsget.getRow();
	//		//System.out.println("last"+rsget.last()+"rowcount"+rowcount);
			Address recipientAddrs1[] = new InternetAddress[rowcount];
			rsget.beforeFirst();
			String mailto="",mailidnew="-";
			while(rsget.next())
			{
			   
				mailidnew=rsget.getString("Mail_Id");
				System.out.println("mailidnew>>>>>>>"+mailidnew);
				//mailidnew="a_thakur@transworld-compressor.com";
				
				
					recipientAddrs1[j] = new InternetAddress(mailidnew);
				
				
				//recipientAddrs1[j] = new InternetAddress(rsget.getString("Mail_Id"));
			    mailto=mailto+rsget.getString("Mail_Id")+",";
			    j++;
				
			}
		
			//
        	
			Data="Hello Sir/Mam,<br>  Please Deactivate the below Sim Nos. Use SIM no as primary checking for Deactivation." +
			" <br>Details of Mobile:"+"<br><br><b>Company Name:-&nbsp;&nbsp;"+ser_prov+"</b> <br><html><body><table border='1'><tr>"+
       		"<th>Sr. No</th><th>Mobile No.</th><th>Sim No</th><th>Reason To Deactivate</th></tr>";
		
		String Data1="";
		String art[]=null;
		Boolean innerflag=false;
		// email="p_ghotkule@transworld-compressor.com";
		if(servprov.contains(ser_prov))
		{
			innerflag=true;
			
		 if(ser_prov.equalsIgnoreCase("airtel"))
		 {
			 
	   		 art=AirtelMob.split(",");
	   		String artreason[]=airtelreason.split("#");
	   		String simno[]=AirtelSim.split("#");
	//   		//System.out.println(art.length);
			 for(int i=1;i<art.length;i++)
			 {
				Data1=Data1+"<tr><td>"+i+"</td><td>"+art[i]+"</td><td>"+simno[i]+"</td><td>"+artreason[i]+"</td></tr>";
			 }
		 }
			 if(ser_prov.equalsIgnoreCase("idea"))
			 {
				  art=IdeaMob.split(",");
			   		String artreason[]=ideareason.split("#");
			   		String simno[]=IdeaSim.split("#");
					 for(int i=1;i<art.length;i++)
					 {
						Data1=Data1+"<tr><td>"+i+"</td><td>"+art[i]+"</td><td>"+simno[i]+"</td><td>"+artreason[i]+"</td></tr>";
						
					 }
			 }
			 if(ser_prov.equalsIgnoreCase("vodafone"))
			 {
				  art=VodafoneMob.split(",");
			   		String artreason[]=vodafonereason.split("#");
			   		String simno[]=VodafoneSim.split("#");
					 for(int i=1;i<art.length;i++)
					 {
						Data1=Data1+"<tr><td>"+i+"</td><td>"+art[i]+"</td><td>"+simno[i]+"</td><td>"+artreason[i]+"</td></tr>";
					 }
			 }
			 
			 if(ser_prov.equalsIgnoreCase("reliance"))
			 {
				  art=RelianceMob.split(",");
			   		String artreason[]=reliancereason.split("#");
			   		String simno[]=RelianceSim.split("#");
					 for(int i=1;i<art.length;i++)
					 {
						Data1=Data1+"<tr><td>"+i+"</td><td>"+art[i]+"</td><td>"+simno[i]+"</td><td>"+artreason[i]+"</td></tr>";
					 }
			 }
			 
			 
		}// if
				
		
		 Data=Data+Data1+"</table></body></html>";
		 
		 
			/*String Data2="Hello Sir/Mam,\n\n\t The below Mobile No/s has been send for deactivation to: "+mailid+" \n By: "+username+
							"<br><br><html><body><table border='1'><tr>"+
							"<th>Sr. No</th><th>Mobile No.</th><th>Reason To Deactivate</th></tr>";
			Data2=Data2+Data1+"</table></body></html>";*/
	   		
		// String mailedmobile=mailedmobile
		
	 try
	{
		 flag=false;
		 if(innerflag==true)
		 {
			
			 System.out.println("CONTROL INSIDE MAIL LOOPPPPPPPPPPPPPPPPPPPP>>*****************>>"+innerflag);
				
	  			
			 System.out.println("CONTROL @@@@********>>"+recipientAddrs1.length);
			 for(int j1=0;j1< recipientAddrs1.length;j1++)
             {
          	   
          	   System.out.println("recipientAddrs1>>**************88>>>>>"+recipientAddrs1[j1]);
          	   
             }
		  			 String email2="v_george@transworld-compressor.com";
					 // String email2="k_manoj@transworld-compressor.com";
					 // String email3="r_maner@transworld-compressor.com";
					 // String email4="a_laddha@mydiary.com";
		              Properties props = new Properties();
		              //String host="host.transworld.com";
		              //String host="smtp.transworld-compressor.com";
		              String host = "a.mobileeye.in";
		              
		              
		              String protocol="smtp";
		             // String user="jd@mobile-eye.in"; 
		              //String pass="transworld";
		              
		            final   String user="9100"; 
		              final String pass="transworld";
		              
		              /*
		              props.put("mail.smtp.starttls.enable","true");
		              props.put("mail.smtp.auth", "true");
		              props.put("mail.smtp.user", "user");
		              props.put("mail.smtp.password", "pass");  
		              props.put("mail.store.protocol", protocol);
		              props.put("mail.smtps.host", host);
		              */
		             
		              
		              /*
		              props.put("mail.smtp.starttls.enable","true");
		              props.put("mail.smtp.auth", "true");
		              props.put("mail.smtp.user", "user");
		              props.put("mail.smtp.password", "pass");  
		              props.put("mail.store.protocol", protocol);
		              props.put("mail.smtps.host", host);
		              props.put("mail.smtp.port", "25");
		             */
		              
		              props.put("mail.smtp.starttls.enable", "true");
				      props.put("mail.smtp.auth", "true");
				      props.put("mail.smtp.user", user);
				      props.put("mail.smtp.password", pass);
				      props.put("mail.store.protocol", protocol);
				     // props.put("mail.smtp.host", "a.mobileeye.in");
				      props.put("mail.smtp.host", host);
				      
				      props.put("mail.smtp.port", "25");
		              
		              
		              
		              /*
		              props.put("mail.smtp.starttls.enable","true");
		              props.put("mail.smtp.auth", "true");
		              props.put("mail.smtp.user", user);
		              props.put("mail.smtp.password", pass);  
		              props.put("mail.store.protocol", protocol);
		              props.put("mail.smtp.host", "a.mobileeye.in");
		              props.put("mail.smtp.port", "25");
		              */
		              
		              java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		              Session session1 = Session.getDefaultInstance(props, null);
		              
		              session1 = Session.getInstance(props,
				                new javax.mail.Authenticator() {

				                    protected PasswordAuthentication getPasswordAuthentication() {
				                        return new PasswordAuthentication(user, pass);
				                    }
				                });

				      session1.setDebug(true);
		              
		              
		               // Construct the message
		               Message msg = new MimeMessage(session1);
		               //msg.setSubject("Mobile Deactivation. This is a autogenerated mail please do not reply to it.");
		               msg.setSubject("Sim deactivation request for "+ser_prov+" "+decdate12+" ");
		               msg.setSentDate(new java.util.Date());
		              // Address add1=new InternetAddress(email,email2);
		              
		            			  //  mail id-------------
		            
		            			  
		            			  
		            			  Address recipientAddrs[] = new InternetAddress[4];
		               
		            			  
		            			  recipientAddrs[0] = new InternetAddress("purchase@transworld-compressor.com");
		               recipientAddrs[1] = new InternetAddress("r_maner@transworld-compressor.com"); 
		             
		               recipientAddrs[2] = new InternetAddress("r_sherkar@transworld-compressor.com"); 
		               recipientAddrs[3] = new InternetAddress("simdeactivation@twphd.in"); 
		              
		            
		               //recipientAddrs[5] = new InternetAddress("Shamli.Naik@vodafone.com");
		               
		              // recipientAddrs[0] = new InternetAddress("a_thakur@transworld-compressor.com");
		                
		               String tocc = "purchase@transworld-compressor.com,r_maner@transworld-compressor.com,r_sherkar@transworld-compressor.com,simdeactivation@twphd.in";
		 			   tocc = tocc + ",h_kulkarni@transworld-compressor.com";			              
		               
		               /*  Address recipientAddrs[] = new InternetAddress[1];
			               recipientAddrs[0] = new InternetAddress("p_ghotkule@transworld-compressor.com");*/
			         
		             //  Address add1=new InternetAddress(mailid);
		               msg.addRecipients(Message.RecipientType.TO,recipientAddrs1);
		               msg.addRecipients(Message.RecipientType.CC,recipientAddrs);
		               Address fromAddress=new InternetAddress("noreply@transworld-compressor.com","Transworld"); // in second "", it is short name
		          
		               msg.setFrom(fromAddress);
		               msg.setContent(Data+"<br> Thanks and Regards, <br> Transworld Team" ,"text/html; charset=ISO-8859-1"); 
		               // Send the message
		               Transport t = session1.getTransport("smtps");
		               msg.saveChanges(); // don't forget this
		               
		               
		               /*Message msg1 = new MimeMessage(session1);
		               msg1.setSubject("Mobile Deactivation Confirmation Mail. This is a autogenerated mail please do not reply to it.");
		               msg1.setSentDate(new java.util.Date());
		               
		            
		              msg1.addRecipients(Message.RecipientType.CC,recipientAddrs);
		                
		               msg1.setFrom(fromAddress);
		               msg1.setContent(Data2+"<br>Thanks and Regards, <br>Transworld Team" ,"text/html; charset=ISO-8859-1"); 
		               // Send the message
		             
		               msg1.saveChanges(); // don't forget this*/
		               
		               
		               
		               
		               try
		               {
		            	    String subject ="Sim deactivation request for "+ser_prov+" "+decdate12+" ";
							//String subject = "Mobile Deactivation. This is a autogenerated mail please do not reply to it.";
		            	   
		            	   
		                    //t.connect(host, user, pass);
		                    //t.sendMessage(msg, msg.getAllRecipients());
		                   // t.sendMessage(msg1, msg1.getAllRecipients());
		                   
		                   Data = Data.replaceAll("'","^");
		                   String DateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date());
		                   String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint attended Email','"+Data+"','"+subject+"','"+mailto+"','"+tocc+"','"+DateTime+"','Pending','Transworld')";
		                   System.out.println("the query is "+q);
		                   int num = stmt66.executeUpdate(q);
		                   
		                   if(num>0)
		                   {
		                   	  flag=true;
		                   } 
		                //  //System.out.println("Your message has been sent");
		               }/*catch(SMTPSendFailedException smp)
		               {
		            	   System.out.print("Error:--"+smp.getCommand()+smp.getReturnCode());
		               }*/
		               catch(Exception e)
		               {
		                   System.out.print("Exception----#####->"+e);
		                  
		               } 
		               finally 
		               {
		                   t.close();
		               } 
		          		
		               //Transport.send(msg);
		          				               
		              // Transport.send(msg1);

		              
		 }//if innerflag
		       }// end of inner try
		        catch(Exception e)
		        {
		        	
		        	////System.out.println("Sorry, your mail cannot be sent due to Congestion");
		        	
		 
		        }
		       
		       //---------- if mail send then flag=true---------------
		       
		       if(flag==true)
		       {
		    	   mailto=mailto.substring(0, mailto.length()-1);
		    	   for(int i=1;i<art.length;i++)
					 {
						////System.out.println("art--->>"+art[i]);
		    	   String query="Update t_deactivatednosnew set Mail='Yes',Mail_to='"+mailto+"' where MobNo='"+art[i]+"'";
		    		//Query for t_sqlquery
		   		String abcd3=query.replace("'","#");	
		   		abcd3=abcd3.replace(",","$");								
		   		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
		   		stmt7.executeUpdate(query);
		   		System.out.println("query--->>"+query);
		   		
					 }
		       }
				} // while
			}		// if
	
	
	//------------------------------------------------------------------------------------------
	
	out.println("<script type=\"text/javascript\">");  
    	out.println("alert('Data Submitted Sucessfully');");  

    	out.println("</script>");
	response.sendRedirect("mobiledeactive_multiple.jsp?inserted="+submitted+"&flag="+flag);
	return;


} catch(Exception e) {out.println(e);
e.printStackTrace();

}

finally
{
con1.close();
}

%>
