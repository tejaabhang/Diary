<%@page import="beanpack.*"%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.net.*" import="java.util.*" import="java.text.*" import="java.io.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();
Statement stmt3=con1.createStatement();
Statement stmt4=con1.createStatement();
Statement stmt5=con1.createStatement();

ResultSet rs1=null, rs2=null;
String sql1="", sql2="";
String Message="#ACCD";
String getunid=request.getParameter("unitid");
String transporter=request.getParameter("transporter");
String vehno=request.getParameter("vehno");
String GPName=request.getParameter("GPName");
String mobno="-",simno="-", holdby="", recby="",recbycust="",recbytech="",InstType="",swver="";
sql1="select * from t_unitmaster where UnitID='"+getunid+"' ";
rs1=stmt1.executeQuery(sql1);
String userrole=session.getAttribute("userrole").toString();
String username=session.getAttribute("username").toString();
//System.out.println(sql1);

if(rs1.next())
{
	mobno=rs1.getString("MobNo");
	/*	//System.out.println(mobno);
	if("-".equalsIgnoreCase(mobno)){
		//System.out.println(mobno);
	}else{
	String sms="#ACCD";
		//SendMsgToUnit msg = new SendMsgToUnit();	
		//msg.Send("#ACCD",mobno.trim());
		sms=sms.replace("-", " ");
		sms=sms.replace("'", " ");
		sms=sms.replace(";", " ");
		sms=sms.replace("&", " ");
		sms=sms.replace("@", " ");
		sms=sms.replace("<>", " ");
		sms=URLEncoder.encode(sms);
		//String smsurl="http://india.timessms.com/receiverCommon.asp?outLogin=Transworld&outPWD=vikram&outMSG="+sms+"&outNumber="+numbers+"&sign=FleetView";
		String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=FleetView&to="+mobno.trim()+"&message="+sms+"&gateway=regular";
		//System.out.println(smsurl);
		URL url=new URL(smsurl);
		URLConnection connection = url.openConnection();
		connection.connect();
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String line;
		
	    while ((line = in.readLine()) != null ) 
	    {
	    	//System.out.println(line);
	    		
	    }
		
}
	*/	
}

//sql="insert into db_gps.t_incidentreport(Transporter,VehicleRegNo,UnitID) values ('"+transporter+"','"+vehno+"','"+getunid+"')";
//System.out.println("update is " +sql);
  //st2.executeUpdate(sql);

String sqlinsrt="insert into db_gps.t_incidentreport(Transporter,VehicleRegNo,UnitID) values ('"+transporter+"','"+vehno+"','"+getunid+"')";
System.out.println("update is " +sqlinsrt);
int cnt=stmt4.executeUpdate(sqlinsrt);


String IncidentID="",sql11="";
sql11="select * from db_gps.t_incidentreport where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+getunid+"' order by IncidentID DESC limit 1";
rs2=stmt1.executeQuery(sql11);
if(rs2.next()){
	IncidentID=rs2.getString("IncidentID");
  } 

/* Stri ng IncidentID="";
sql1="select * from db_gps.t_incidentreport where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by IncidentDate DESC limit 1  ";
ResultSet rs1=stmt1.executeQuery(sql1);
if(rs1.next()){
	IncidentID=rs1.getString("IncidentID");
  } */
  
String sql="insert into t_incidentsms (VehicleRegNo,Transporter,UnitID,mobno,EntBy,GPName,IncidentID) values ('"+vehno+"','"+transporter+"','"+getunid+"','"+mobno.trim()+"','"+username+"','"+GPName+"','"+IncidentID+"')";
//System.out.println(sql);
stmt2.executeUpdate(sql);
String sqlinc="insert into db_gps.t_serveralerts(Message,MobNo,EntryBy,UnitId,MsgType,VehicleRegNo,Transporter,SMSStatus) values('"+Message+"','"+mobno.trim()+"','"+username+"','"+getunid+"','Incident Data download Msg','"+vehno+"','"+transporter+"','SMS')";
stmt3.executeUpdate(sqlinc);
response.sendRedirect("detailsOfIncident.jsp?transp="+transporter+"&vehno="+vehno+"&unitid="+getunid+"");
return;
} catch(Exception e) {out.println(e);}

finally
{
	
	con1.close();
}

%>



