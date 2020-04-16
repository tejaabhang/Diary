<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>


<%@ include file="header.jsp" %>
<%!
Connection con1;
%>
<%
try { 
Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
Statement stmt1=con1.createStatement();
Statement stmtinsert=con1.createStatement();
Statement stmtinsert2=con1.createStatement();
Statement stmt11=con1.createStatement();
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql8="", sql9="", sql10="";
	String sql11="",sql12="";
ResultSet rs2=null, rs4=null,rs5=null,rs6=null;


String ownname="", vehreg="", unid="", instby="", entby="", techname="", comment="", oldunitwith="",reason="";
String newvehno="";



int i1=0, i2=0, i3=0, i4=0;

   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

entby=session.getValue("username").toString();
ownname=request.getParameter("owner");
vehreg=request.getParameter("vehreg");
newvehno=request.getParameter("newvehno");
unid=request.getParameter("unid");
techname=request.getParameter("techname");
comment=request.getParameter("cmnt");
//reason=request.getParameter("reasn");
System.out.println("Reason===>"+reason);
int pos=0;
pos=comment.indexOf("'");
if(pos>0)
{
	comment=comment.replace("'","");
}
String ownerchange=ownname+" "+"del";
String vehregchange=vehreg+" "+"del_"+nwfrmtdte;

/* String sqldel2="select * from db_gps.t_vehicledetails where VehicleRegNumber='"+vehregchange+"' ";
//System.out.println(sqldel2);
ResultSet rsdel2=stmt1.executeQuery(sqldel2);
if(rsdel2.next()){
 //System.out.println("vehiclereg number is already exist");	
}else{
	vehregchange=vehreg+" "+"del1";
} */


reason=request.getParameter("reasn");
/* ===================================== */
if(reason.equalsIgnoreCase("removal"))
{
	String mobno="",serviceprovider="",simno="";
	
	java.util.Date datefrmdb1=new java.util.Date();
	Format formatter1=new SimpleDateFormat("yyyy-MM-dd");
	String decdate=formatter1.format(datefrmdb1);
	
	
	java.util.Date datefrmdb2=new java.util.Date();
	Format formatter2=new SimpleDateFormat("yyyy-MM-dd");
	String insertdate=formatter2.format(datefrmdb2);
     
	String inserttime=new SimpleDateFormat("HH:mm:ss").format(datefrmdb2);
 String unitiddetails="select * from  t_unitmaster where Unitid='"+unid+"' ";
 
 String username=session.getAttribute("DisplayName").toString();
	System.out.println("unitidsetAILs===>"+unitiddetails);
 rs2=stmt1.executeQuery(unitiddetails);
 
 while(rs2.next())
 {
   mobno=rs2.getString("Mobno");
   serviceprovider=rs2.getString("SimCompany");
   simno=rs2.getString("Simno");
 }
		System.out.println("Mobno==>"+mobno);
		System.out.println("Serviceprovider=>"+serviceprovider);
		System.out.println("Simno==>"+simno);
	String deact="insert into t_deactivatednosnew(MobNo,DecaDate,InsertDate,InsertTime,Reason,SProvider,EntBy) values('"+mobno+"','"+decdate+"','"+insertdate+"','"+inserttime+"','"+reason+"','"+serviceprovider+"','"+username+"')";
	System.out.println("Deactivationsim===>"+deact);
	stmt1.executeUpdate(deact);
	
	System.out.println("Deactivationsim===>"+deact);
	
	String que="Update t_simmaster set DeactiveDate='"+decdate+"',Status='Deactivated' where Mobno='"+mobno+"'";
	System.out.println("t_simmaster===>"+que);
	stmt1.executeUpdate(que);
	
	/* ================================================= */
			String getEmailDetails="select * from t_EmailReportSettings	where System='myfleetview' ";
            
    		ResultSet rs=stmt1.executeQuery(getEmailDetails);
    		String SystemName="",Website="",Logo1="",Logo2="",Signature="",fromLabel="",replyToMailid="",Disclaimer="";
    		while(rs.next())
    		{
    			SystemName=rs.getString("System");
    			  Website=rs.getString("Website");
    			  Logo1=rs.getString("Logo1");
    			 Logo2=rs.getString("Logo2");
    			 Signature=rs.getString("Signature");
    			 fromLabel=rs.getString("fromLabel");
    			 replyToMailid=rs.getString("replyToMailid");
    			 Disclaimer=rs.getString("Disclaimer");
    			
    		}
    		
    		
			/* String header="<html><head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style> </head>"+
			"<body><table    border=^18^  bordercolor=^#E6E6FA^ align=^center^ width=^60%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^>"+
			"<table  style=^margin-left: 1em;margin-right: 1em;width: 100%;height: 100%;^><tr><td width=^100%^><table width = ^97%^ ><tr><td><a href=^http://www.mobile-eye.in^ target=^_blank^>"+
			"<img src="+Logo1+" style=^height: 80px; width: 100px;^  title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a></td><td  align = ^right^ >"+
			"<img src="+Logo2+"  style=^height: 80px; width: 100px;^ /></td></tr></table> <font style=^color: #D8D8D8^>"+
			"________________________________________________________________________________________________________________________________________________</font><br><div width = ^100%^><font size = ^3^ face = ^Arial^>"+
			" <u><a href=http://"+Website+"></u>"+Website+"</a>    <br>"+ "</font><br><table><tr><td align = center style = ^margin-left:20px;^>"; */
			
	String header = "<html><head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style> </head>"+
				"<body><table    border=^18^  bordercolor=^#E6E6FA^ align=^center^ width=^60%^><tr align=^center^><td align=^left^ style=^border: 0px;^ width=^100%^>"+
				"<table  style=^margin-left: 1em;margin-right: 1em;width: 100%;height: 100%;^><tr><td width=^100%^><table width = ^97%^ ><tr><td><a href=^http://www.mobile-eye.in^ target=^_blank^>"+
				"<img src="+Logo1+" style=^height: 80px; width: 100px;^  title=^Mobile-eye^ id=^logo^ alt=^Logo^ /></a></td><td  align = ^right^ >"+
				"<img src="+Logo2+"  style=^height: 80px; width: 400px;^ /></td></tr></table> <font style=^color: #D8D8D8^>"+
				"________________________________________________________________________________________________________________________________________________</font><br><div width = ^100%^><font size = ^3^ face = ^Arial^>"+
				" <u><a href=http://"+Website+"></u>"+Website+"</a>    <br>"+"\n Mobile Deactivation   </font><br><table><tr><td align = center style = ^margin-left:20px;^>";
	/* =============================== */
			String subject="Mobile Deactivation. This is a autogenerated mail please do not reply to it.";
			
			//String Data="";
		 	String Data=header +"Hello Sir/Mam,\n\n\t  Please Deactivate the below Mobile No/s" +
					" \n Details of Mobile:";
		String Mailid="",mailto="";
		
	    String str2="Select Mail_Id from t_serviceprovidermailID where ServiceProvider='"+serviceprovider+"'";
		
	    rs2=stmt1.executeQuery(str2);
	    
	    System.out.println("str2"+str2);
	    while(rs2.next())
		 {
		 Mailid=rs2.getString("Mail_ID");
		 mailto=mailto+rs2.getString("Mail_Id")+",";
		 System.out.println("toMAilid=>"+Mailid); 
		 }      
	    System.out.println("toMAilid=>"+mailto);
	    
	    
	    
	   // String Data1=header + Data;
	    
	   String Data1="";
	    
	   
	    
	    
	    
		Data1="<br>  Please Deactivate the below Sim Nos. Use SIM no as primary checking for Deactivation." +
				" <br>Details of Mobile:"+"<br><br>Company Name:-&nbsp;&nbsp;"+serviceprovider+" <br><html><body>";
				
				 Data1+="<table align=left  cellpadding=10 cellspacing=5 width=90% border=1 style=^border-collapse: collapse^>"
					+"<tr bgcolor=^#ADDFFF^>"+"<td align=right style=^width: 1%;^><font size=^2^ face=^arial^><b>SrNo</b></font></td>"
				
						+"<td align=center style=^width: 5%;^><font size=^2^ face=^arial^><b> MobileNo </b></font></td>"
					+"<td align=center style=^width: 10%;^><font size=^2^ face=^arial^><b> Sim No </b></font></td>"
					+"<td align=center style=^width: 5%;^><font size=^2^ face=^arial^><b> Reason  </b></font></td>";
					
					
					  Data1=Data1+"<tr> <td align=right><font size=^2^ face=^arial^>1</font></td>"
				              + "<td align=right><font size=^2^ face=^arial^>"+mobno+"</font></td>"
						      +"<td align=right><font size=^2^ face=^arial^>"+simno+"</font>	</td>"
						      +"<td align=left><font size=^2^ face=^arial^>"+comment+"</font></td> </tr>";
						      
						      Data1 =Data1 + "</table><table align= left><br></br><tr><td><font size=^2^ face=^Arial^>"+Signature+"</font></td></tr></table></td></tr></table></div></td></tr></table></td></tr></body></html>";
								
			/* Data1+=	"<table border=^0^><tr bgcolor=^#ADDFFF^><th>Sr. No</th><th>Mobile No.</th><th>Sim No</th><th>Reason To Deactivate </th></tr>";
			
	
	       	Data1+="<tr><td>1</td><td>"+mobno+"</td><td>"+simno+"</td><td>"+reason+"</td></tr></table></body></html>";
	       	Data1+="<br> Thanks and Regards, <br> Transworld Team"; */
	
	       	String Data3=header+Data1;
	       	String mailbody= String.valueOf(Data3);	
	       		
	System.out.println("Data==>"+Data1);
	       //	String Mailto=Mailid;
	        String tocc = "purchase@transworld-compressor.com,r_maner@transworld-compressor.com,r_sherkar@transworld-compressor.com,simdeactivation@twphd.in";
			   tocc = tocc + ",h_kulkarni@transworld-compressor.com";	
			   
			   String DateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date());
			   
			  String q12 = "insert into db_gps.t_allpendingmailtable(MailName,Description,MailBody,subjectline,Toid,Tocc,EntryDateTime,MailStatus,SenderName)values('Transworld','New Complaint attended Email','"+mailbody+"','"+subject+"','"+mailto+"','"+tocc+"','"+DateTime+"','Pending','Transworld')";
            
			  System.out.println("ALLpending Mail"+q12);
			  stmt1.executeUpdate(q12);
			  String query="Update t_deactivatednosnew set Mail='Yes',Mail_to='"+mailto+"' where MobNo='"+mobno+"'";
			  stmt1.executeUpdate(query);
/* 	================================ */
}

	


/* ====================================== */
 
String unitholdby="";
if(techname.equals("Customer"))
{
   unitholdby=ownname;
}
else if(techname.equals("Company"))
{
   unitholdby="Transworld"; 
}
else
{
   unitholdby=techname;	
}
int vehcode=0;
String installdate="";
 sql4="select * from t_vehicledetails where UnitID='"+unid+"' ";

   rs4=stmt1.executeQuery(sql4);
   while(rs4.next())
   {
     vehcode=rs4.getInt("VehicleCode");
     
   }


sql1="update t_vehicledetails set OwnerName='"+ownerchange+"', MobilePhNo='0', TheFieldFromEmailAddress='-', UnitID='-', Status='Deleted', VehicleRegNumber='"+vehregchange+"' where VehicleRegNumber='"+vehreg+"' ";
//Query for t_sqlquery
System.out.println(sql1);
	String abcd1=sql1.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
i1=stmt1.executeUpdate(sql1); 
//System.out.println(sql1);
int rid=0;

sql2="select max(RID) from t_unitreplacement";
rs2=stmt1.executeQuery(sql2);
while(rs2.next())
{
  rid=rs2.getInt(1);
}
rid=rid+1;
sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate) values ('"+rid+"', '"+vehcode+"', '"+vehreg+"', '"+ownerchange+"', '"+unid+"', '-', '"+techname+"', 'Del', '"+comment+"', '"+entby+"', '"+unitholdby+"', '"+nwfrmtdte+"')" ;
//Query for t_sqlquery
System.out.println("sql3"+sql3);
String abcd2=sql3.replace("'","#");	
abcd2=abcd2.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
System.out.print(sql3);
i2=stmt1.executeUpdate(sql3);

String sqlgroup="select GPName from db_gps.t_group where transporter='"+vehreg+"'";
ResultSet rsgroup=stmtinsert2.executeQuery(sqlgroup);
System.out.println("sqlgroup===>"+sqlgroup);
while(rsgroup.next()){
		sql9="update t_group set GPName='"+rsgroup.getString("GPName")+" del', VehRegno='"+ownerchange+"', SepReport='No',Active ='No',transporter='"+vehreg+" del'   where transporter='"+vehreg+"' and GPName='"+rsgroup.getString("GPName")+"' ";
		//Query for t_sqlquery
		System.out.println(sql9);
		String abcd3=sql9.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
		stmt1.executeUpdate(sql9); 
		
		//System.out.println("sql9===>"+sql9);
		String sqlgrp="insert into db_gps.t_grouphistory (GPName,VehRegno,transporter,VehCode,Status,EntBy,UpdatedDate,InsertedFrom) values ('"+rsgroup.getString("GPName")+"','"+vehreg+"','"+ownname+"','"+vehcode+"','Deleted','"+entby+"','"+formatter.format(d)+"','PermanentRemovalOfVehicle')";
		System.out.println(sqlgrp);
		stmt1.executeUpdate(sqlgrp);
		String abcd44=sqlgrp.replace("'","#");	
		abcd44=abcd44.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd44+"')");
}

sql5="update t_unitmaster set HoldBy='"+unitholdby+"' where UnitId='"+unid+"' ";
//Query for t_sqlquery
String abcd4=sql5.replace("'","#");	
abcd4=abcd4.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
stmt1.executeUpdate(sql5);
String send="inserted"; 

/* sql11="Select * from t_unitreplacement where OldUnitID='"+unid+"' order by InstDate desc  limit 1";
String installdate="";
ResultSet rs11=stmt11.executeQuery(sql11);
while(rs11.next())
{
	installdate=rs11.getString("InstDate");
} */

if(reason.equalsIgnoreCase("exchange"))
{
	
	System.out.println("Transporter"+ownname);
	 	
	response.sendRedirect("addexchangeunit.jsp?vehno="+newvehno+"&unitid="+unid+"&oldvehno="+vehreg+"&transporter="+ownname);
}
else 
{
	System.out.println("Transporter"+ownname);
	 out.println("<script>"); 
	out.println("alert('Vehicle Removed Successfully');");
	out.println("window.history.go(-3);");
 	out.println("</script>");
 	
 	response.sendRedirect("fullfleet.jsp?transporter="+ownname+"&inserted=yes");
	System.out.println("Transporter"+ownname);
	
	
	

} 
//return;
} catch(Exception e) {
	
	e.printStackTrace();
	//out.println(e);
	
}
finally
{ /*  String reason1=request.getParameter("reasn");
	String ownername=request.getParameter("owner");
	String unid=request.getParameter("unid");
	String newvehno=request.getParameter("newvehno");
	if(!reason1.equalsIgnoreCase("exchange"))
	{
	response.sendRedirect("fullfleet.jsp?transporter="+ownername);
	}
	else
	{
		response.sendRedirect("addexchangeunit.jsp?vehno="+newvehno+"&unitid="+unid);
	} */
	con1.close();	
}
%>