<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<%@ include file="header.jsp" %>

<script>


function Redirect()
{
	alert("Inserted Succesfully");
	window.location="addvehtogrp.jsp?inserted="+yes
			
	//response.sendRedirect("addvehtogrp.jsp?inserted="+yes);
}
</script>
<script>
function Redirect1()
{
	alert("Please Check Vehicle Status Is Active Or Not ");
	window.location="addvehtogrp.jsp";
	
}
</script>

<script>
function Redirect2()
{
	alert("Error While Inserting Data");
	window.location="addvehtogrp.jsp";
	
}
</script>

<%! 
Connection con1, con2;
%>

<%
try
{//1 gps 
	//System.out.println(">>>>>insertgrp.....>>>>");
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	  String username=session.getAttribute("username").toString();
	Statement stmt=con2.createStatement(),stmt1=con2.createStatement(), stmt2=con2.createStatement();
	Statement stmtinsert=con2.createStatement();
	Statement strepre=con2.createStatement();
	Statement stadmin=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql="", sql1="", sql2="", sql3="";
	String tm="",vcode=null,yes="";
	yes="abc";

	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);
	//out.print(sdt);
	 String OwnerName=request.getParameter("owner").trim();
	 String vehcles=request.getParameter("vehcles").trim();
	 String grp=request.getParameter("grp").trim();
	 
	// String insert=request.getParameter("inserted");
	// //System.out.println(">>>>insert value>>>.>"+insert);
	
	//if(insert==null){

		//}else{
		
		//}
	System.out.print(vehcles);
	String Status="";
	 sql="select VehicleCode,Status from t_vehicledetails where VehicleRegNumber='"+vehcles+"' ";
	// out.print(sql);
		//System.out.println(sql);
	 rs1=stmt.executeQuery(sql);
	 if(rs1.next())
	 {
		vcode=rs1.getString("VehicleCode");
		Status=rs1.getString("Status");
	 }
	 
	 if(Status.equals("-"))
	 {
	 
	 sql1="select * from t_group where GPName='"+grp+"' and transporter='"+vehcles+"' and VehCode='"+vcode+"' and active='Yes' and SepReport='Yes' ";
	 rs2=stmt1.executeQuery(sql1);
	 //System.out.println(sql1);
	 if(rs2.next())
	 {
		 
	 }
	 else
	 {
		 sql2="insert into t_group (GPName,VehRegno,transporter,VehCode,SepReport,Active)values('"+grp+"','"+OwnerName+"','"+vehcles+"','"+vcode+"','Yes','Yes')";
		//System.out.println(grp+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+sql2);
		//System.out.println(sql2);
		 //Query for t_sqlquery
			String abcd=sql2.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
		 stmt2.executeUpdate(sql2);
		  if("Castrol".equalsIgnoreCase(grp)||grp.equalsIgnoreCase("Castrol")){
			  String RepresentativeMailID="-",MailID="-";
			  try{
			  String sqlrepre="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+OwnerName+"'";
			  //System.out.println(sqlrepre);
			  
		  		ResultSet rsrepre=strepre.executeQuery(sqlrepre);
				if(rsrepre.next()){
					String representative=rsrepre.getString("Representative");
					String sqladmin="select * from db_CustomerComplaints.t_admin where Name='"+representative+"'";
					ResultSet rsadmin=stadmin.executeQuery(sqladmin);
					if(rsadmin.next()){
						RepresentativeMailID=rsadmin.getString("Email");
					}
				}
			  }catch(Exception e){
				  
			  }
				String sqladmin="select * from db_CustomerComplaints.t_admin where Name='"+username+"'";
				ResultSet rsadmin=stadmin.executeQuery(sqladmin);
				if(rsadmin.next()){
					MailID=rsadmin.getString("Email");
				}
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
		             msg.setSubject("Vehicle:"+vehcles+" is added to Castrol group and Transporter is "+OwnerName);
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
		       String body="Sir, <br>Vehicle:"+vehcles+" is added to Castrol group<br>"+
		       "<html><body><table align=center  cellpadding=0 cellspacing=0 width=100% border=1><tr BGCOLOR=#99CCFF>"+
		       "<td>Vehicle Reg No:</td><td>Transporter"+
		       "</td><td>Added By</td></tr><tr><td>"+vehcles+"</td><td>"+OwnerName+"</td><td>"+username+"</td></tr><br></table></body></html>";
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
		        			 Transport.send(msg);
		        		}catch(Exception e){
		        			
		        		}
		    }catch(Exception e){
		    e.printStackTrace();
		    }

		  }
	 }
	 
	 
		
	 out.println("<script>  Redirect();</script>");
	 
	  
	    
}
	 else
	 {
		 out.println("<script>  Redirect1();</script>");
	 }
}

catch(Exception e)
{
	out.println("<script>  Redirect2();</script>");
	out.print("Exception --->"+e);
	e.printStackTrace();
}
finally
{
	con1.close();
	con2.close();
	
}
%>