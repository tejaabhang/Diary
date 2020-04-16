<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmtinsert=con2.createStatement();
	
	String sql1="";
	
	String tech="",para="", comment="", extracomment="",unitextracmmnt="",techextracmmnt="",techcomment="",unitcomment="",unitid="", radbutton="", redlight="", greenlight="", gpslight="", ringing="", commentfor="", veh="", acttobtakby="" ,billable="";	
	
	radbutton=request.getParameter("type");
	tech=request.getParameter("tech");
	comment=request.getParameter("spcomment");	
	para=request.getParameter("parameter");
	techcomment=request.getParameter("techcomment");
	unitcomment=request.getParameter("unitcomment");
	extracomment=request.getParameter("extracomment");
	
	
	String  tid=request.getParameter("tid"); 
	String  vid=request.getParameter("vid"); 
	
	String  transp1=request.getParameter("transporter"); 
	
	System.out.println(">>>tid<<<"+tid);
	
	System.out.println(">>>transp1<<<"+transp1);
	
	
	if(extracomment==null || extracomment=="")
		extracomment="NA";
unitextracmmnt=request.getParameter("unitextracomment");
	techextracmmnt=request.getParameter("techextracomment");
	if(unitextracmmnt==null || unitextracmmnt=="")
		unitextracmmnt="NA";
	if(techextracmmnt==null || techextracmmnt=="")
		techextracmmnt="NA";
	
	unitid=request.getParameter("unitid");
	redlight=request.getParameter("redlight");
	greenlight=request.getParameter("greenlight");
	gpslight=request.getParameter("gpslight");
	ringing=request.getParameter("ringing");
	veh=request.getParameter("veh");
	commentfor=request.getParameter("commentfor");
	acttobtakby=request.getParameter("replist");
	
	
	
	
	String locname="",calender="",rtime="";
	locname=request.getParameter("locname");
	calender=request.getParameter("calender");
	rtime=request.getParameter("rtime");
	
	String transp="",vhid="";	
	String visible=request.getParameter("visible");
System.out.println("visible===>"+visible);
if(visible==null){
visible="No";	
}
	String user=session.getAttribute("DisplayName").toString();	

	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);

if(commentfor.equals("veh"))
{
	String lastdate1="";
	String sql2="select * from t_vehicledetails where VehicleRegNumber='"+veh+"' ";
	ResultSet rs2=stmt2.executeQuery(sql2);
	if(rs2.next())
	{
		transp=rs2.getString("OwnerName");
		vhid=rs2.getString("VehicleCode");
	}

	String lastdate="select concat(TheDate,' ',TheTime) as Date from  db_gps.t_onlinedata where VehicleRegNo='"+veh+"' order by TheDate,TheTime desc limit 1";
	
	ResultSet rs9=stmt2.executeQuery(lastdate);
	if(rs9.next())
	{
		lastdate1=rs9.getString("Date");
		//vhid=rs2.getString("VehicleCode");
	}
	
	String commt="Select billable from db_CustomerComplaints.t_commentlist where comment='"+comment+"'";
	ResultSet rs11=stmt2.executeQuery(commt);
	if(rs11.next())
	{
		billable=rs11.getString("billable");
	}
	
	if(tid==null || tid.equals("null") || tid.equals("-")){
	
	sql1="insert into t_techspecialrep (EntDateTime,UnitId, RedLight, GreenLight, GPSLight, Ringing, VehRegNo, Transp, SpComment, ActionToBeTakenBy, EntBy,cmmt_type, Extra_comment,visibleInFleetview,lastupdate,Billable,VehId) values ('"+s+"','NA', 'NA', 'NA','NA', 'NA', '"+veh+"', '"+transp+"', '"+comment+"', '"+acttobtakby+"', '"+user+"','Vehicle','"+extracomment+"','"+visible+"','"+lastdate1+"','"+billable+"','"+vhid+"')";
	}else{
		
		sql1="insert into t_techspecialrep (TicketID,EntDateTime,UnitId, RedLight, GreenLight, GPSLight, Ringing, VehRegNo, Transp, SpComment, ActionToBeTakenBy, EntBy,cmmt_type, Extra_comment,visibleInFleetview,lastupdate,Billable,VehId) values ('"+tid+"','"+s+"','NA', 'NA', 'NA','NA', 'NA', '"+veh+"', '"+transp+"', '"+comment+"', '"+acttobtakby+"', '"+user+"','Vehicle','"+extracomment+"','"+visible+"','"+lastdate1+"','"+billable+"','"+vhid+"')";	
		
		
	}
}
else
{
	if(radbutton.equals("Tech"))
	{

		if(tid==null || tid.equals("null") || tid.equals("-")){
		sql1="insert into t_techspecialrep (EntDateTime, TechName, UnitId, RedLight,  GreenLight, GPSLight, Ringing, SpComment, ActionToBeTakenBy, EntBy, cmmt_type, Extra_comment) values ('"+s+"', '"+tech+"', 'NA', 'NA', 'NA', 'NA','NA', '"+techcomment+"', '"+acttobtakby+"', '"+user+"','Technician','"+techextracmmnt+"')";
	
		}else{
			
			sql1="insert into t_techspecialrep (TicketID,EntDateTime, TechName, UnitId, RedLight,  GreenLight, GPSLight, Ringing, SpComment, ActionToBeTakenBy, EntBy, cmmt_type, Extra_comment) values ('"+tid+"','"+s+"', '"+tech+"', 'NA', 'NA', 'NA', 'NA','NA', '"+techcomment+"', '"+acttobtakby+"', '"+user+"','Technician','"+techextracmmnt+"')";	
			
		}
	
	}
	else
	{
		
		if(tid==null || tid.equals("null") || tid.equals("-")){
		sql1="insert into t_techspecialrep (EntDateTime, UnitId, RedLight,  GreenLight, GPSLight, Ringing, SpComment, ActionToBeTakenBy, EntBy, cmmt_type, Extra_comment,TechName,TestingDateTime,Location) values ('"+s+"','"+unitid+"', '"+redlight+"', '"+greenlight+"','"+gpslight+"', '"+ringing+"', '"+unitcomment+"', '"+acttobtakby+"', '"+user+"','Unit','"+unitextracmmnt+"','"+tech+"','"+calender+" "+rtime+"','"+locname+"')";
		}else{
			
			sql1="insert into t_techspecialrep (TicketID,EntDateTime, UnitId, RedLight,  GreenLight, GPSLight, Ringing, SpComment, ActionToBeTakenBy, EntBy, cmmt_type, Extra_comment,TechName,TestingDateTime,Location) values ('"+tid+"','"+s+"','"+unitid+"', '"+redlight+"', '"+greenlight+"','"+gpslight+"', '"+ringing+"', '"+unitcomment+"', '"+acttobtakby+"', '"+user+"','Unit','"+unitextracmmnt+"','"+tech+"','"+calender+" "+rtime+"','"+locname+"')";
			
		}
		
		
	}
}
//Query for t_sqlquery
	String abcd=sql1.replace("'","#");	
	abcd=abcd.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	//out.print(sql1);
	stmt1.executeUpdate(sql1);
	System.out.println(">>>sql1<<<"+sql1);
	
	System.out.println(">>>tid<<<"+tid);
	
	if(tid==null || tid.equals("null") || tid.equals("-")){
		
		
	}else{
	
	String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Special Comment','"+extracomment+"','"+user+"','"+vhid+"','"+veh+"','"+transp+"') ";
	System.out.println(">>>sqlths<<<"+sqlths);
	stmt1.executeUpdate(sqlths);
	System.out.println(">>>sqlths<<<"+sqlths);

	
	}
if(commentfor.equals("veh"))
{
	response.sendRedirect("techspcomment.jsp?inserted=yes&comment="+commentfor+"&vehno="+veh+"&parameter="+para);
	return;
}


else
{
	response.sendRedirect("techspcomment.jsp?inserted=yes&comment="+commentfor+"&parameter="+para);
	return;
}

	

}catch(Exception e)
{
	out.print("Exception -->"+e);
     e.printStackTrace();
}
finally
{
	con1.close();
	con2.close();
}
%>

