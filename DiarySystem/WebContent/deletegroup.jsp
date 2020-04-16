
<%@page import="java.security.acl.Owner"%><%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="java.net.*" import="java.io.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>

<%! 
Connection con;
String sql1,sql2;
ResultSet rs1,rs2;
Statement stmt2,strepre,stadmin;
int vcode=0;
String VehRN,Transport;
%>
<%
try
{
	    Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    Statement stmt1=con.createStatement(),stmtinsert=con.createStatement();
        stmt2=con.createStatement();
        strepre=con.createStatement();
	    stadmin=con.createStatement();
	    String str; 
	   
	    java.util.Date td =new java.util.Date();
		Format fmt = new SimpleDateFormat("yyyy-MM-dd");
		String sdate = fmt.format(td);
	    //ResultSet rs1,rs2;
        String OwnerName=request.getParameter("owner");
        String RegNo=request.getParameter("vehcles"); 
        String group=request.getParameter("group");
        String username=session.getAttribute("username").toString();
        
      
       
        
        //sql1="select * from t_group where transporter like '%"+RegNo.trim()+"%' and GPName='"+group+"' " ;
        
        sql1="select * from t_group where VehCode='"+RegNo.trim()+"' and GPName='"+group+"' " ;
        
      	 rs1=stmt2.executeQuery(sql1);
   	    while(rs1.next())
   	    {
   		  vcode=rs1.getInt("VehCode");
   		  VehRN=rs1.getString("transporter");
   		  Transport=rs1.getString("VehRegno");
       }
        
   	    sql2= "insert into t_grouphistory (GPName,VehRegno,transporter,VehCode,Status,EntBy,UpdatedDate,InsertedFrom)values('"+group+"','"+RegNo+"','"+Transport+"','"+ vcode+"','Deleted','"+username+"','"+sdate+"','DeleteGroup') ";
   	   //Query for t_sqlquery
		String abcd=sql2.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
        stmt2.executeUpdate(sql2);
        
        //str= "delete  from t_group where GPName='"+group+"'and transporter='"+RegNo.trim()+"'";
        str= "delete  from t_group where GPName='"+group+"' and VehCode='"+RegNo.trim()+"'";
        
      //Query for t_sqlquery
		String abcd1=str.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
        stmt1.executeUpdate(str);
        String sqlrepre="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+Transport+"'";
  		String RepresentativeMailID="",MailID="";
  		ResultSet rsrepre=strepre.executeQuery(sqlrepre);
		if(rsrepre.next()){
			String representative=rsrepre.getString("Representative");
			String sqladmin="select * from db_CustomerComplaints.t_admin where Name='"+representative+"'";
			ResultSet rsadmin=stadmin.executeQuery(sqladmin);
			if(rsadmin.next()){
				RepresentativeMailID=rsadmin.getString("Email");
			}
		}
		String sqladmin="select * from db_CustomerComplaints.t_admin where Name='"+username+"'";
		ResultSet rsadmin=stadmin.executeQuery(sqladmin);
		if(rsadmin.next()){
			MailID=rsadmin.getString("Email");
		}
if("Castrol".equalsIgnoreCase(group)||group.equalsIgnoreCase("Castrol")){
    	try{
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
             msg.setSubject("Vehicle:"+RegNo+" is removed from Castrol group and Transporter is "+Transport);
             msg.setSentDate(new java.util.Date());
            // Address add1=new InternetAddress(email,email2);
       //     	//System.out.println("stp1"+chkdcntr1);
          			  //  mail id-------------
             
          	      Address recipientAddrs[] = new InternetAddress[1];
          		  recipientAddrs[0] = new InternetAddress("s_shinde@transworld-compressor.com");
          		
    		      Address recipientAddrs1[] = new InternetAddress[3];
                 recipientAddrs1[0] = new InternetAddress("a_laddha@myfleetview.com");
                 recipientAddrs1[1] = new InternetAddress(RepresentativeMailID);
          		 recipientAddrs1[2] = new InternetAddress(MailID);
             msg.addRecipients(Message.RecipientType.TO,recipientAddrs);
           msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);
             Address fromAddress=new InternetAddress("noreply@transworld-compressor.com","Transworld"); // in second "", it is short name
          	//System.out.println("stp4");
             msg.setFrom(fromAddress);
          	//System.out.println("stp5");
       String body="Sir, <br>Vehicle:"+RegNo+" is removed from Castrol group<br>"+
       "<html><body><table align=center  cellpadding=0 cellspacing=0 width=100% border=1><tr BGCOLOR=#99CCFF>"+
       "<td>Vehicle Reg No:</td><td>Transporter"+
       "</td><td>Removed By</td></tr><tr><td>"+RegNo+"</td><td>"+Transport+"</td><td>"+username+"</td></tr><br></table></body></html>";
       //System.out.println(body);
             msg.setContent(body,"text/html; charset=ISO-8859-1"); 
             // Send the message
             Transport t = session1.getTransport("smtps");
             msg.saveChanges(); // don't forget this
          	//System.out.println("stp6");
           
             try
             {
         	 	//System.out.println("stp7");
                  t.connect(host, user, pass);
             	//System.out.println("stp8");
                  t.sendMessage(msg, msg.getAllRecipients());
                  //System.out.println("stp8");
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
        			// Transport.send(msg);
        		}catch(Exception e){
        			
        		}
    }catch(Exception e){
    e.printStackTrace();
    }
}
response.sendRedirect("vehiclegroupentry.jsp");
return;
   	 }
catch(Exception e)
{
    e.printStackTrace();	
}
finally
{
	 con.close();
	
	 
}

%>
   