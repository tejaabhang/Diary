<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.sql.*" %>

  	<%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = " java.io.IOException"%>
  	<%@ page import="javax.activation.*" %>
  	 <%@ include file="headerpopdiary.jsp"%>
  	<%
  	//String fname=(String)session.getAttribute("fname");
  //	String lname=(String)session.getAttribute("lname");
  	String username=(String)session.getAttribute("mainuser");
  	String email=(String)session.getAttribute("email");
  	%> 
  
<%!

Connection conn,con;
static int html=1;
static int saveflag=1;
 int count=1;
%>
<%!

String  MM_dbConn_STRING12,MM_dbConn_DRIVER2, MM_dbConn_USERNAME2, MM_dbConn_PASSWORD2 ;

%>



<html><head></head>

<script type="text/javascript">

function closewindow()
{
	window.close();
}

</script>
<body style="background-color: #F5F5F5">

<%
int Msg=1;
String ReportName="-",Description="-",Entby="-",Name="-",EmailID="-",Email1="-",FileName="-",Category="-";
String Priority="-",ClosingComments="-",ClosedBy="-",Status="-",PageName2="-",Email2="-";
email="-";
String ComplaintDateTime,UpadteDateTime;
String ContactNumber="-";
Boolean innerflag=false;
Boolean flag=false;
Writer output = null;
String issue = "", report = "";
String randomnumber="";
File savedFile;
int count1 = 0, count2 = 0, filecount = 0, count4 = 0, count5 = 0,complaintID=0;
String tiger="";
String savefilestring="";
String[] filepath =new String[10];
String[] filename =new String[10];



System.out.println("\n\n on complaint insert page");
PageName2=request.getParameter("PageName");
System.out.println("@@@@@@@@@@ "+PageName2);
ReportName=request.getParameter("ReportName");
Description=request.getParameter("desc");
Entby="-";
 // Name=fname+" "+lname;
EmailID="avlsupport@mobile-eye.in";
Email1=request.getParameter("EmailID");

ContactNumber=request.getParameter("Number");

String uname=session.getAttribute("userid").toString();
String userrole=session.getAttribute("userrole").toString();
String name=session.getAttribute("username").toString();
//String password=session.getAttribute("password").toString();
String emailnew=session.getAttribute("email").toString();
//String Firstname=session.getAttribute("FirstName").toString();
FileName=request.getParameter("Filename");

//Entby=session.getAttribute("userid").toString();
//String usertypevalue=session.getAttribute("usertypevalue").toString();
String user=session.getAttribute("DisplayName").toString();
Category=request.getParameter("Category");
Priority=request.getParameter("Priority");
System.out.println("in entby><>>>.."+Entby);
//System.out.println("\n\nin usertypeval.."+usertypevalue);
System.out.println("nin Category.."+Category);
System.out.println("in Priority.."+Priority);
 ComplaintDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
 UpadteDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
ClosingComments="-";
ClosedBy="-";
Status="Pending";
String query="";
String comID="";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("\n\n ismultipart-->>"+isMultipart);
	if (!isMultipart) {
		System.out.println("\n\nin multipart..");
	} else {
		System.out.println("\n\n in else with  multipart..");
		FileItemFactory factory = new DiskFileItemFactory();
		//System.out.print("\n\nfactory==>"+factory);
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
		//	System.out.print("\n\n items==>"+items);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
	
	while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if(item.isFormField()) 
			{
				String name1 = item.getFieldName();
				System.out.print("\n name==>"+name);
				String value = item.getString();
				System.out.print("\n value==>"+value);
				if(name1.equals("ReportName")) 
				{
					ReportName = value;
					System.out.print("\nReport name==>"+ReportName);
					count1 = 1;
				}
				if(name1.equals("desc")) 
				{
					Description = value;
					System.out.print("\n Description name==>"+Description);
					count1 = 1;
				}
				if(name1.equals("Entby")) 
				{
					Entby = value;
					System.out.print("\n Entby name==>"+Entby);
					count1 = 1;
				}
				if(name1.equals("UserName")) 
				{
					Name = value;
					//System.out.print("\n Name==>"+Name);
					count1 = 1;
				}
				if(name1.equals("EmailID")) 
				{
					Email1 = value;
					//System.out.print("\nEmailID 1==>"+Email1);
					count1 = 1;
				}
				
				if(name1.equals("Number")) 
				{
					ContactNumber = value;
					//System.out.print("\n ContactNumber==>"+ContactNumber);
					count1 = 1;
				}
				if(name1.equals("Category")) 
				{
					Category = value;
					//System.out.print("\n Category==>"+Category);
					count1 = 1;
				}
				if(name1.equals("Priority")) 
				{
					Priority = value;
					//System.out.print("\n ContactNumber==>"+Priority);
					count1 = 1;
				}
				if(name1.equals("PageName"))
				{
					PageName2=value;
					count1=1;
				}
				
				System.out.println("\n $$$$$$$$$$$$$ "+PageName2);

			} else {
						try {

								String itemName = item.getName();
								System.out.print("\n\nitemName==>"+itemName);
								if(itemName.equalsIgnoreCase(""))
								{
								}
								else
								{
								 savedFile = new File(config.getServletContext().getRealPath("/")+"Complaints/"+itemName);
								System.out.print("\n\nsavedFile==>"+savedFile);
								item.write(savedFile);
								filepath[filecount]=""+savedFile;
								
								filename[filecount]=itemName;
								filecount++;
								if(saveflag==1)
								{
								 savefilestring=""+savedFile;
								 saveflag++;
								}
								else
									savefilestring=savefilestring+","+savedFile;
								 //out.print("successfully saved the file");
								//File file = new File(savedFile);
								String screenshot=savedFile.getAbsolutePath();
							System.out.println("\n\nscreenshot--->>>"+screenshot);
								}
						    	
  							
					} catch (Exception e) {
	      					e.printStackTrace();
	      				}
  			}
  		}
	
  	}
	
	System.out.println(count);
	if(null!=Description || null!=Category || null!=Priority)
	{
		
		MM_dbConn_STRING12="jdbc:mysql://103.241.181.36/db_gps";
		MM_dbConn_DRIVER2 ="org.gjt.mm.mysql.Driver";

		 MM_dbConn_USERNAME2="diary";
		 MM_dbConn_PASSWORD2="d@1ry";
		Connection conn1=null;
		Statement strno1=null;
		//Statement st21=null;
		
		
   try {
	  	    System.out.println("Hii");
	  	  
	  	  Class.forName(MM_dbConn_DRIVER2);
	  	    conn1 = DriverManager.getConnection(MM_dbConn_STRING12,MM_dbConn_USERNAME2,MM_dbConn_PASSWORD2);
			Statement stmt=conn1.createStatement();
			Statement st=conn1.createStatement();
			Statement st21=conn1.createStatement();
			Statement st50=conn1.createStatement();
			if(null == ContactNumber || ContactNumber.length()==0)
			{
				System.out.println(ContactNumber);
				ContactNumber="-";
			}
			
			if(null == Email1 || Email1.length()==0)
			{
				System.out.println(Email1);
				Email1="-";
			}
			
			//String sql6="Select Email from db_CustomerComplaints.t_admin where pass ='"+password+"' and   UName like '"+name+"'";
			//System.out.println(sql6);
			//ResultSet rs6=st.executeQuery(sql6);
			//if(rs6.next())
			//{
			//	email=(String)rs6.getString("Email");
			//	System.out.println("email -->>"+email);
			//}
			if(Email1.length()>1)
			{
		         Email2=Email1;
		         Email2=Email2.replace(",",", ");
			}
			else
			{
		  	     Email2=emailnew;
			}

			System.out.println("email -->>"+emailnew);
		    String sqlinsert="insert into t_ComplaintDetail(ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,FileName,Category,Priority,ComplaintDateTime,ClosingComment,ClosedBy,Status,Website,PageName,EscalatedDept) "+
			" values('"+ReportName+"','"+Description+"','"+uname+"','"+name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+savefilestring+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+ClosingComments+"','"+ClosedBy+"','"+Status+"','Diary','"+PageName2+"','Service')";	
			
			System.out.println("\n\nquery sqlinsert-->>"+sqlinsert);
			
			
		  
			int i=stmt.executeUpdate(sqlinsert);
			System.out.println("Successfully inserted in  complaint details");
			System.out.println("\ni=>"+i);
			
			try{
				//System.out.println("ComplaintID q :"+ComplaintID);
			String Q ="select max(ComplaintID) as ak from t_ComplaintDetail";
			ResultSet rs21 = st21.executeQuery(Q);
			System.out.println("query q :"+Q);
			if(rs21.next()) {
				comID = rs21.getString("ak");
			}
			System.out.println("\n\nThe complaint ID is :"+comID);
			}catch(Exception e){
				System.out.println("The exception is :"+e);
			}
			
			String sqlinsert1="insert into t_ComplaintDetailHistory(ComplaintID,ReportName,Description,EntBy,Name,EmailID,Email1,ContactNumber,FileName,Category,Priority,ComplaintDateTime,ClosingComment,ClosedBy,Status,Website,PageName,EscalatedDept) "+
			" values('"+comID+"','"+ReportName+"','"+Description+"','"+uname+"','"+name+"','"+EmailID+"','"+Email2+"','"+ContactNumber+"','"+savefilestring+"','"+Category+"','"+Priority+"','"+ComplaintDateTime+"','"+ClosingComments+"','"+ClosedBy+"','"+Status+"','Diary','"+PageName2+"','Service')";	
			
			System.out.println("\n\nquery sqlinsert-->>"+sqlinsert1);
			System.out.println("\n\nquery sqlinsert history table-->>"+sqlinsert1);
			
			
		  
			int k=stmt.executeUpdate(sqlinsert1);
			System.out.println("Successfully inserted in complaint details history");
			System.out.println("\nk=>"+k);
			
			String datetimemail=new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTime));
			
			if(i>0)
			{
				//System.out.println("\n\n i-->>"+i);
				innerflag=true;
			}
			String compid="select ComplaintID from t_ComplaintDetail where ReportName='"+ReportName+"' AND Description='"+Description+"' AND Name='"+name+"' AND Email1='"+Email2+"' AND ComplaintDateTime='"+ComplaintDateTime+"' AND ContactNumber='"+ContactNumber+"'";
			System.out.println(">>>>>>>>>"+compid);
			ResultSet rss=stmt.executeQuery(compid);
			if(rss.next())
			{
				complaintID=rss.getInt("ComplaintID");
				//System.out.println("\n\n complaintID-->>"+complaintID);
			}
			System.out.println("\n\n Complaint ID-->>"+complaintID);
			
			
			
	
			String comdate=new SimpleDateFormat("dd-MMM-yyyy HH:MM:SS").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTime));
			
			String Data="<html><head><title>Mail Body</title></head><body><table border=^18^ bordercolor=^#E6E6FA^ align=^center^ width=^30%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^><table  style=^margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;^><tr><td width=^100%^><a href=^http://www.mobile-eye.in^ target=^_blank^><img src=^http://192.168.2.55:8080/DiarySystem/images/mobile.jpg^ style=^height: 80px; width: 100px;^ title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a><br/><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><div>"
				 +"Hello "+name+",<br><br>Thank you for contacting us. This is an automated response confirming the receipt of your complaint. One of our team members will get back to you as soon as possible. "
				 +"<br>For your records, the details of the complaint are listed below. While replying, please make sure that the complaint ID is copied in the subject line to ensure that your replies are tracked appropriately."
	 			 +"<br></br><br></br><div style=^width:90%; margin-left: 5%;^><table align=^left^ border=^0^ cellpadding=^0^ cellspacing=^0^ width=^100%^ style=^background: white;^><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Complaint ID: </font></td><td width = ^60%^><font size=^2^ face=^Arial^>"+""
                +complaintID+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Description: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
                +Description+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Report Name: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
                +ReportName+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Category: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
                +Category+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Status: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
                +"Pending </font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Priority: </font></td><td width=^60%^><font size=^2^ face=^Arial^>"+""
                +Priority+"</font></td></tr><tr><td width=^40%^ valign=^top^><font size=^2^ face=^Arial^>Call Me Back: </font></td><td width^60%^><font size=^2^ face=^Arial^>"+""
                +ContactNumber+"</font></td></tr></table></div><br><br></div>"
                +"<div style=^width:100%; float:left;^><br><br>Regards,<br>Transworld Support Team.<br>"
                +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font style=^color: #D8D8D8^>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";
			
			
		
		
		/*	String Data="<html><head><title>Mail Body</title></head><body><table border='18' bordercolor='#E6E6FA' align='center' width='30%'><tr align='center'><td align='left' style='border: 0px;' width='100%'><table  style='margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;'><tr><td width='100%'><a href='http://www.mobile-eye.in' target='_blank'><img src='http://192.168.2.55:8080/DiarySystem/images/mobile.jpg' style='height: 80px; width: 100px;' title='Mobile-eye' id='logo' alt='Logo' /></a><br/><font style='color: #D8D8D8'>___________________________________________________________________________</font><br/><br/><div>"
		 +"Hello "+name+",<br><br>Thank you for contacting us. This is an automated response confirming the receipt of your complaint. One of our team members will get back to you as soon as possible. "
		 +"<br>For your records, the details of the complaint are listed below. When replying, please make sure that the complaint ID is copied in the subject line to ensure that your replies are tracked appropriately."
		 +"<br></br><br></br><div style='width:90%; margin-left: 5%;'><table align='left' border='0' cellpadding='0' cellspacing='0' width='100%' style='background: white;'><tr><td width='40%' valign='top'><font size='2' face='Arial'>Complaint ID: </font></td><td width = '60%'><font size='2' face='Arial'>"+""
       +complaintID+"</font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Description: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +Description+"</font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Report Name: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +ReportName+"</font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Category: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +Category+"</font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Status: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +"Pending </font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Priority: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +Priority+"</font></td></tr><tr><td width='40%' valign='top'><font size='2' face='Arial'>Call Me Back: </font></td><td width='60%'><font size='2' face='Arial'>"+""
       +ContactNumber+"</font></td></tr></table></div><br><br></div>"
       +"<div style='width:100%; float:left;'><br><br>Regards,<br>Transworld Support Team.<br>"
       +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font style='color: #D8D8D8'>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";
	
*/
		
		/*	String Data="<html><head><title>Mail Body</title></head><body><table border=18 bordercolor=#E6E6FA align=center width=30% ><tr align=center><td align=left style=border: 0px; width=100% ><table  style=margin-left: 1em;margin-right: 1em;width: 90%;height: 100%;><tr><td width=100% ><a href=http://www.mobile-eye.in target=_blank><img src=http://192.168.2.55:8080/DiarySystem/images/mobile.jpg width=100px height=80px title=Mobile-eye id=logo alt=Logo /></a><br/><font color=#D8D8D8>___________________________________________________________________________</font><br/><br/><div>"
						 +"Hello "+name+",<br><br>Thank you for contacting us. This is an automated response confirming the receipt of your complaint. One of our team members will get back to you as soon as possible. "
						 +"<br>For your records, the details of the complaint are listed below. When replying, please make sure that the complaint ID is copied in the subject line to ensure that your replies are tracked appropriately."
			 			 +"<br></br><br></br><div width=90% ><table align=left border=0 cellpadding=0 cellspacing=0 width=100% style=background: white;><tr><td width=40% valign=top><font size=2 face=Arial>Complaint ID: </font></td><td width = 60% ><font size=2 face=Arial>"+""
                         +complaintID+"</font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Description: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +Description+"</font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Report Name: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +ReportName+"</font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Category: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +Category+"</font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Status: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +"Pending </font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Priority: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +Priority+"</font></td></tr><tr><td width=40% valign=top><font size=2 face=Arial>Call Me Back: </font></td><td width=60% ><font size=2 face=Arial>"+""
                         +ContactNumber+"</font></td></tr></table></div><br><br></div>"
                         +"<div style=:width=100%; float:left;>Regards,<br>Transworld Support Team.<br>"
                         +"Phone: 9120 41214444 <br>Email:  avlsupport@Mobile-Eye.in </div></div><font color=#D8D8D8>___________________________________________________________________________</font><br/><br/><br/></td></tr></table></td></tr></table></body></html>";
                       // String  Data1 =Data.Substring(2,Data.length);  
            */          
                       System.out.println("the data is :"+Data);
               //inset data into all pending mail table   
               		String Email3=Email2.replace(", ",",");
               		System.out.println("The email3  is  :"+Email3);
               		
               		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               		Calendar cal = Calendar.getInstance();
               		String DateTime = dateFormat.format(cal.getTime());
               		System.out.println(DateTime);
                  try{
                	  
                	  String q = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint Email','"+Data+"','Complaint Confirmation - Transworld Compressor Technologies Ltd,Pune','"+emailnew+"','"+Email3+"','"+DateTime+"','Pending','Transworld')";
                	  st50.executeUpdate(q);
                	  System.out.println("The query is  :"+q);
                 
                  }catch(Exception e10){
                	  System.out.println("The exception in data insertion is :"+e10);
                  }     
                  System.out.println("the record has been successfully insered into table");  
                  
                 /*if(Data.contains("^")) {
              		String Data1=Data.replace("^","'");
              		System.out.println("the data change back"+Data1);  
                 	} */
						
		/*	if(i>0){
				
				try{
					//innerflag=true;
					// flag=false;
					 if(innerflag==true)
					 {
								//System.out.println("in mail =>");
								
								Properties props = new Properties();
								 //String host="host.transworld.com";
				            	 String host="smtp.transworld-compressor.com";
				            	 String protocol = "smtp";
				            	// String user1 = "test";
				             	String user1 = "complaints@mobile-eye.in";
				             	  String pass = "transworld";
				             		props.put("mail.smtp.starttls.enable", "true");
				             		//props.put("mail.smtp.auth", "false");
				     				props.put("mail.smtp.auth", "true");
				     				props.put("mail.smtp.user", user1);
				     				props.put("mail.smtp.password", pass);
				     				props.put("mail.store.protocol", protocol);
				     				props.put("mail.smtps.host", host);
				            		 props.put("mail.smtps.host", host);
						       	       java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
						       	  Session session1 = Session.getDefaultInstance(props, null);
					               // Construct the message
					               Message msg = new MimeMessage(session1);
						              // Construct the message
					              	  String subjectstr="Diary System Complaint ID: "+complaintID+" , Received from  "+name+""; 
						              //String subjectstr="Test mail please Ignore."; 
					               		msg.setSubject(subjectstr);
					               		msg.setSentDate(new java.util.Date());
					               		
					               		System.out.println("the efmail2 is :"+Email2);
					               		System.out.println("the emailnew is :"+emailnew);
					                 	String[] tokens1=Email2.split(", ");
					                 	Address recipientAddrs[] = new InternetAddress[1];
					                 	recipientAddrs[0] = new InternetAddress(emailnew);
					                 	
					                 	Address recipientAddrs1[] = new InternetAddress[1];
					                 	Address recipientAddrs2[] = new InternetAddress[2];
					                 	Address recipientAddrs3[] = new InternetAddress[3];
					                 	Address recipientAddrs4[] = new InternetAddress[4];
					                 	Address recipientAddrs5[] = new InternetAddress[5];
					                 	
					                 	System.out.println("tha token length"+tokens1.length);
					                 	
					                 	if(tokens1.length==1) {
					                 		System.out.println("if 1");
					                 	//Address recipientAddrs1[] = new InternetAddress[1];
					                 	recipientAddrs1[0] = new InternetAddress(Email2);
					                 	}
					                 	
					                 	if(tokens1.length==2) {
						            	   //	Address recipientAddrs2[] = new InternetAddress[2];
						            	   	System.out.println("if 2");
						            	   	for (int a=0;a<tokens1.length;a++)
						                     {
						             			 //System.out.println("Hii");
						             			 try{
						             				
						             			recipientAddrs2[a] = new InternetAddress(tokens1[a]);
						             			System.out.println("the token is :"+tokens1[a]);
						             			System.out.println("the recipientAddrs2 is :"+recipientAddrs2[a]);
						             			 }catch(Exception e)
						             			 {
						             				// System.out.println(e);
						             				 e.printStackTrace();
						             			 }
						                     }
						            	   	
						                 	}
					                 	if(tokens1.length==3) {
						            	   //	Address recipientAddrs3[] = new InternetAddress[3];
						            	   	System.out.println("if 3");
						            	   	for (int a=0;a<tokens1.length;a++)
						                     {
						             			 //System.out.println("Hii");
						             			 try{
						             				
						             			recipientAddrs3[a] = new InternetAddress(tokens1[a]);
						             			System.out.println("the token is :"+tokens1[a]);
						             			System.out.println("the recipientAddrs3 is :"+recipientAddrs3[a]);
						             			 }catch(Exception e)
						             			 {
						             				// System.out.println(e);
						             				 e.printStackTrace();
						             			 }
						                     }
						            	   	
						                 	}
					                 	if(tokens1.length==4) {
						            	   //	Address recipientAddrs4[] = new InternetAddress[4];
						            	   	System.out.println("if 4");
						            	   	for (int a=0;a<tokens1.length;a++)
						                     {
						             			 //System.out.println("Hii");
						             			 try{
						             				
						             			recipientAddrs4[a] = new InternetAddress(tokens1[a]);
						             			System.out.println("the token is :"+tokens1[a]);
						             			System.out.println("the recipientAddrs4 is :"+recipientAddrs4[a]);
						             			 }catch(Exception e)
						             			 {
						             				// System.out.println(e);
						             				 e.printStackTrace();
						             			 }
						                     }
						            	   	
						                 	}
					                 	if(tokens1.length==5) {
						            	   //	Address recipientAddrs5[] = new InternetAddress[5];
						            	   	System.out.println("if 5");
						            	   	for (int a=0;a<tokens1.length;a++)
						                     {
						             			 //System.out.println("Hii");
						             			 try{
						             				
						             			recipientAddrs5[a] = new InternetAddress(tokens1[a]);
						             			System.out.println("the token is :"+tokens1[a]);
						             			System.out.println("the recipientAddrs5 is :"+recipientAddrs5[a]);
						             			 }catch(Exception e)
						             			 {
						             				// System.out.println(e);
						             				 e.printStackTrace();
						             			 }
						                     }
						            	   	
						                 	}
					            	 
					             		System.out.println("tha token length"+tokens1.length);
					             		
					               
					               msg.addRecipients(Message.RecipientType.TO,recipientAddrs);System.out.println("to");
					               if(tokens1.length==1){
					               msg.addRecipients(Message.RecipientType.CC,recipientAddrs1);System.out.println("1");
					               }else if(tokens1.length==2) {
					            	   msg.addRecipients(Message.RecipientType.CC,recipientAddrs2);System.out.println("2");
					               }else if(tokens1.length==3) {
					            	   msg.addRecipients(Message.RecipientType.CC,recipientAddrs3);System.out.println("3");
					               }else if(tokens1.length==4) {
					            	   msg.addRecipients(Message.RecipientType.CC,recipientAddrs4);System.out.println("4");
					               }else if(tokens1.length==5) {
					            	   msg.addRecipients(Message.RecipientType.CC,recipientAddrs5);System.out.println("5");
					               }
					               Address fromAddress=new InternetAddress("avlsupport@mobile-eye.in","Transworld"); // in second "", it is short name
					             
					               msg.setFrom(fromAddress);
					              
					          // Create the message part 
					              BodyPart messageBodyPart = new MimeBodyPart();
					             
					              // Fill the message
					              messageBodyPart.setText(Data); 
					              messageBodyPart.setContent(Data,"text/html");
					             
					              Multipart multipart = new MimeMultipart();
					              multipart.addBodyPart(messageBodyPart);
                                  System.out.println("\n\n html--->>"+Data);
					                if(filecount==0)
					                {
					                		
							              	messageBodyPart.setContent(Data,"text/html");
								        
											msg.setContent(multipart);
											
								//--------------------------- end of logic---------------------------------
								
								
								
						
											msg.saveChanges(); // don't forget this
														    				
					                }
					                else  // file present
					                {
					                	
					               for (int j=0;j<filecount; j++)
					               {
					                 messageBodyPart = new MimeBodyPart();
					                 DataSource source = new FileDataSource(filepath[j]);
					                 messageBodyPart.setDataHandler(new DataHandler(source));
					                 messageBodyPart.setFileName(filename[j]);
					                  multipart.addBodyPart(messageBodyPart);
					                 msg.setContent(multipart);
					                 msg.saveChanges();
					                    
			                          }         
					               
					             //  System.out.println("attached data ");
					           }
					               Transport t = session1.getTransport("smtps");
					           
					      
				               try
				               {
				            	   System.out.println(">>>>>>>>>++++++++++++>>>>>>>>>>>");
				                    t.connect(host, user1, pass);
				                    System.out.println(">>>>>>>++>>>>>>");
				                    t.sendMessage(msg, msg.getAllRecipients());
				                    flag=true;
				                    System.out.println("Your message has been sent");
				                    System.out.println(">>>>>>>>>>>>>");
				               }
				               catch(Exception e)
				               {
				                   System.out.print("Exception----->"+e);
				                  
				               } 
				               finally 
				               {
				                   t.close();
				               } 
				          		
				               Transport.send(msg);
				               System.out.println(">>>>>>finaly>>>>>>>");            
						}
				}
				catch(Exception e){
							
						}        		              
				 }*/
					       
			
				


	

								%>
								<div
		                          style="background: #E6E6E6; font-size: 1.8em; text-align: center; margin-top: 0.5em; margin-bottom: 0.4em; color:red;width: 40%; margin-left: 18%"">
	                              <blink> Thank You for your support request.</blink> </div><br>
	                             <form name="incident" style="background: #F5F5F5;" method="get">
	                             <br></br>
								   <table align="center" border="0" cellpadding=0 cellspacing=0 width="40%" style="background: #F5F5F5; margin-left: 18%;">
								   <tr>
								   <td><div align ="center"><font size="3"><b> Your Complaint ID :<%=complaintID %> </b></font></div></td></tr>
								   <tr></table><br></br>
								    <table align="center" border="1" cellpadding=0 cellspacing=0 width="40%" style="background: #F5F5F5; margin-left: 18%;">
							        <tr>
								   <td width="15%"><font size="2" face="Arial"><b> User Name </b></font></td><td width="25%"><font size="2" face="Arial"><%=name %></font></td></tr><tr>
								   <td width="15%"><font size="2" face="Arial"> <b>Email Id </b></font></td><td width="25%"><font size="2"><%=Email1 %></font></td></tr>
								    
								    <tr>
								   <td width="15%"><font size="2" face="Arial"> <b>Category </b></font></td><td width="25%"><font size="2" face="Arial"><%=Category %></font></td></tr><tr>
								   <td width="15%"><font size="2" face="Arial"> <b>Website</b></font></td><td width="25%"><font size="2" face="Arial"> Diary</font></td></tr><tr>
								   <td width="15%"><font size="2" face="Arial"><b> Priority </b></font></td><td width="25%"><font size="2" face="Arial"><%=Priority %></font></td></tr>  
								   <tr>
								   <td width="15%"><font size="2" face="Arial"> <b>Report Name </b></font></td><td width="25%"><font size="2" face="Arial"><%=ReportName %></font></td></tr><tr>
								    <td width="15%"><font size="2" face="Arial"><b>Call me back</b></font></td><td width="25%"><font size="2" face="Arial"><%=ContactNumber %></font></td></tr><tr>
								    <td width="15%" valign="top"><font size="2" face="Arial"> <b>Description </b></font></td><td width="25%"><font size="2" face="Arial"><%=Description %></font></td></tr>
								  						
								</table><br>
								<table align="center" border="0" cellpadding=0 cellspacing=0 width="40%" style="background: #F5F5F5; margin-left: 18%;">
								<tr>							
								   <td align="center">
								     <div align ="justify"><font size="2" color="green" face="Arial"><br></br><p>We will revert to you within 2 working days.<br>In case you need urgent assistance, <b>please note down your Complaint ID </b>and contact us on 020-41214444 or mail us on avlsupport@mobile-eye.in </p></font></div>
								   </td></tr></table><br>
								   
								   <table align="center" border="0" cellpadding=0 cellspacing=0 width="40%" style="background: #F5F5F5; margin-left: 18%;">
								<tr>		
								   <td valign="bottom" align="center" colspan="2">
			                           <div><input type="submit" id="OK"
				                       name="OK" value="OK"  onclick="window.close();"/></div>
			                      </td>
			                      </tr>
			                      </table>
								   <br>
								</form>
		<%
	//count++;
   }
  
   catch (NullPointerException e)
   {
	   e.printStackTrace();
       response.sendRedirect("RegisterComplaint_diary.jsp?desc="+Description+"&email="+Email1+"&Msg="+Msg+"&PageName1="+PageName2+"&Number="+ContactNumber+"&Category="+Category+"&Priority="+Priority);
	   System.out.println("bar.couldReturnNull() returned null");
   	} 
	}
		%>						
								</body>
								</html>
  							
     
  
