<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.util.Date" import=" java.text.*" import=" java.util.*" errorPage="" %>
<jsp:useBean id="diary" class="com.diary.beans.classes" scope="page">

<%@ include file="header.jsp" %>
<%
diary.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
diary.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

%>

<%!
//Connection conn,conn1;
Connection conn=null,conn1=null,conn2=null;
Statement st, st1, st2, st3, st4,st5,st6,st7,st8;
String sql1,sql2, sql3;

Statement sterp = null, sterp1 = null, sterp2=null, sterp3=null, sterp4=null, sterp5=null, stqr=null, stsql1=null,stsql2=null;
int currentmonthcount=0,currentyearcount=0;
String fpreviousmonth="";
int previousmonth=0, ppreviousmonth=0;
int previousyear=0, ppreviousyear=0;



String transporter,today,Svehlist,olddate,username,vehno,insdate,newunit,installplace,installby,vehcode;
String MailDate="",MailTime="",Body="",MailDate1="",MailTime1="",MailDate12="",MailDate14="",MailTime14="",MailTime12="";
String finalmonth="";
String currentyear="";
String fppreviousmonth = "";
String sql=null;
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

</head>
<body>
 <!--- code start here ------>
<%
vehcode=request.getParameter("vid");
String DB_NAME1="jdbc:mysql://103.241.181.36:3306/db_GlobalERP";
String DB_USERNAME="fleetview";
String DB_PASSWORD="1@flv";
Class.forName("com.mysql.jdbc.Driver");
conn1=DriverManager.getConnection(DB_NAME1,DB_USERNAME,DB_PASSWORD);
//stsql1= conn1.createStatement();
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
String newunit="",LastData="",LastNGData="",LastNGData11="",LastNGRSData14="",LastNGSMData12="",LastNGPRSData14="";
String wrnty="",instdt="";
//stsql1= conn1.createStatement();
Date tdy = new java.util.Date();
String todaysDate = new SimpleDateFormat("yyyy-MM-dd").format(tdy);
System.out.println("todaysdate is"+todaysDate);
String UnitID=request.getParameter("unitid");
String s=todaysDate;
String yy=s.substring(0, 4);
String mm=s.substring(6,7);
String mm1;
String VehCode="",startcode="",endcode="",RID="",RouteName="",Status="",startplace="",UnitType="",endplace="",gpname="",owner="",tripid="",VehRegNo="",JS="";
String dd=s.substring(8,10);

todaysDate=yy+"_0"+mm+"_"+dd;
System.out.println("todaysDate====formated-------->"+todaysDate);


%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td  align="center">
			<font size="3" color="#2A0A12">
				<b>Device Health For UnitID :- <font color="red"><%=UnitID%> </font> </b>
			</font>
		</td>
	</tr>
	
		
</table>
<br></br>



<%
int days=0;
int i=1;
username=session.getAttribute("username").toString();

try
{
	//Class.forName(MM_dbConn_DRIVER);
	
	conn = diary.ReturnConnection();
	conn1 = diary.ReturnConnection1();
	
	
	
	//conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st3=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn.createStatement();
	st6=conn1.createStatement();
	st7=conn1.createStatement();
	st8=conn1.createStatement();
	//out.print(vehno);
	//out.println(vehcode);
	//sql="select * from t_vehicledetails where VehicleCode ='"+vehcode+"'";
	
	String sql6="select * from db_gps.t_ftplastdump where UnitID='"+UnitID+"'";
        ResultSet rs6=st1.executeQuery(sql6);
		
		System.out.println("JRM DATA Status---------->"+sql6);
		if(rs6.next())
		{
			UnitType=rs6.getString("UnitType");
			System.out.println("Unit Tyep ---------->"+UnitType);
			
			
			
			RID=rs6.getString("routeid");
			JS=rs6.getString("JS");
			
			if(UnitType.equals("SMTP") || UnitType=="SMTP")
			{
				
				
				sql="select a.maildate,a.mailtime,a.unitid from db_avlalldata.t_mails"+todaysDate+"  a inner join db_avlalldata.t_mails"+todaysDate+"Processed b ON a.unitid=b.unitid where a.unitid ="+UnitID+" order by maildate desc, mailtime desc limit 1 offset 9";
				
				 
				ResultSet rst2=st1.executeQuery(sql);
				System.out.println("sql==>sql--"+sql);
				
				
				if(rst2.next())
				{
					MailDate=rst2.getString("MailDate").toString();
					MailTime=rst2.getString("MailTime").toString();
					LastData=MailDate +" "+ MailTime;
					//LastData=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(LastData);
					
					
					/* LastData = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss") 
							.parse(LastData)); */
					
					LastData=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LastData));
				}
				else
				{
				
					LastData="NO Data Received Today";
				}
				
				//----------------------NG DAta--------------------------
				
				
				String sql1="select maildate,mailtime,body from db_avlalldata.t_mails"+todaysDate+" where unitid ="+UnitID+" and  BODY like '%NG,%'  and maildate>='"+MailDate+"' and mailtime >='"+MailTime+"' order by maildate desc, mailtime desc limit 2 ";
				ResultSet rst3=st2.executeQuery(sql1);
				
				System.out.println("sql==>NG---------->"+sql1);
				StringBuilder sb=new StringBuilder();
				
				if(!rst3.next())
				{
				
					LastNGData11="NA";
				}
				rst3.previous();
				while(rst3.next())
				{
					System.out.println("sql body inside----------LastNGData11--------------");
					MailDate1=rst3.getString("MailDate").toString();
					MailTime1=rst3.getString("MailTime").toString();
					
					Body=rst3.getString("body");
					Body=Body+" "+Body;
					//sb.append(Body+",");
					LastNGData11=MailDate1 +" "+ MailTime1;
					
					LastNGData11=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LastNGData11));
					System.out.println("BODY--------->"+Body);
						
				}
				
				String [] Body1=new String [50];
				
				Body=Body.split(" ").toString();
				
				if(Body1[0]==Body1[1])
				{
					//System.out.println("BODY-1233-------->"+Body);
					
					LastNGData11=LastNGData11;
				}
				
				//System.out.println("BOdy-------->"+Body);
				//System.out.println("BOdy-------->"+Body1[1]);
				
				/* if(Body1[0]==Body1[1])
				{
					LastNGData11=MailDate1 +" "+ MailTime1;
				}
				else{
					LastNGData11="NA";
				} */
				
				
				
				
				//-----------------------GSM Code----------------------------------------
				
				String sql13="select maildate,mailtime,body from db_avlalldata.t_mails"+todaysDate+" where unitid ="+UnitID+" and BODY like '%NGSM,%' and maildate>='"+MailDate+"' and mailtime >='"+MailTime+"' order by maildate desc, mailtime desc limit 1";
				ResultSet rst13=st3.executeQuery(sql13);
				
				System.out.println("sql==>GSM---------->"+sql13);
				
				
				if(!rst13.next())
				{
				
					LastNGSMData12="NA";
				}
				
				rst13.previous();
				
				if(rst13.next())
				{

					MailDate12=rst13.getString("MailDate").toString();
					MailTime12=rst13.getString("MailTime").toString();
					LastNGSMData12=MailDate12 +" "+ MailTime12;
					
					LastNGSMData12=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LastNGSMData12));
				}

				
				
				
				//-------------------------GPRS DATA---------------------------------------
				
				
				String sql221="select maildate,mailtime,body from db_avlalldata.t_mails"+todaysDate+" where unitid ="+UnitID+" and BODY like '%NGPRS,%'  and maildate>='"+MailDate+"' and mailtime >='"+MailTime+"'order by maildate desc, mailtime desc limit 1";
				ResultSet rst223=st4.executeQuery(sql221);
				
				System.out.println("sql==>GPRS---------->"+sql221);
				
				
				if(!rst223.next())
				{
				
					LastNGPRSData14="NA";
				}
				
				rst223.previous();
				if(rst223.next())
				{
					MailDate14=rst223.getString("MailDate").toString();
					MailTime14=rst223.getString("MailTime").toString();
					
					//Body=rst223.getString("body");
					LastNGPRSData14=MailDate14 +" "+ MailTime14;
					
					LastNGPRSData14=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LastNGPRSData14));
						
				}
				
				
				
			}
			else
			{
				
				try{
					
					System.out.println("<-----------------In Unit Type IP---------->");
					String DB_NAME12="jdbc:mysql://203.199.134.130:3306/db_GlobalERP";
					String DB_USERNAME1="fleetview";
					String DB_PASSWORD1="1@flv";
					Class.forName("com.mysql.jdbc.Driver");
					conn2=DriverManager.getConnection(DB_NAME12,DB_USERNAME1,DB_PASSWORD1);
					
					Statement st134=conn2.createStatement();
					Statement st234=conn2.createStatement();
					
					sql="select a.maildate,a.mailtime from db_avlalldata.t_ip"+todaysDate+"  a inner join db_avlalldata.t_ip"+todaysDate+"Processed b ON a.unitid=b.unitid where a.unitid ="+UnitID+" order by maildate desc, mailtime desc limit 1";
					
					 
					ResultSet rst2=st234.executeQuery(sql);
					System.out.println("sql==>sql--"+sql);
					
					
					if(rst2.next())
					{
						MailDate=rst2.getString("MailDate").toString();
						MailTime=rst2.getString("MailTime").toString();
						LastData=MailDate +" "+ MailTime;
					}
					else{
					
						LastData="NO Data Received Today";
					}
					
					
					String sql1="select maildate,mailtime from db_avlalldata.t_ip"+todaysDate+" where unitid ="+UnitID+" and BODY like '%NG,%' order by maildate desc, mailtime desc limit 1";
					ResultSet rst3=st134.executeQuery(sql1);
					
					System.out.println("sql==>sql1---------->"+sql1);
					
					
					if(rst3.next())
					{
						MailDate=rst3.getString("MailDate").toString();
						MailTime=rst3.getString("MailTime").toString();
						LastNGData=MailDate +" "+ MailTime;
					}
					else{
					
						LastNGData="NA";
					}
					
					/* String sql="select * from db_gps.t_ftplastdump where unitid ='"+UnitID+"'";
					ResultSet rs=st134.executeQuery(sql);
					
					if(rs.next())
					{
						RID=rs.getString("routeid");
						JS=rs.getString("JS");
						System.out.println("IP Roite Id"+RID+" IP JRM Status"+JS);
						
					} */
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
					
			}
			
		}
	
	
	
	
	
	
	
	
	
	
	String vehid=request.getParameter("vid");
	
	System.out.println("VehicleCode vehid---------->"+vehid);
	
	String sql5="Select VehRegNo,TripID,StartCode,EndCode,StartPlace,EndPlace,GPName,OwnerName from db_gps.t_startedjourney where Vehid='"+vehid+"' order by StartDate desc,StartTime desc limit 1";
		
		ResultSet rs5=st1.executeQuery(sql5);
		
		System.out.println("JRM DATA---------->"+sql5);
		
		if(rs5.next())
		{
			VehRegNo=rs5.getString("VehRegNo");
			tripid=rs5.getString("TripID");
			startcode=rs5.getString("StartCode");
			endcode=rs5.getString("EndCode");
			startplace=rs5.getString("StartPlace");
			endplace=rs5.getString("EndPlace");
			gpname=rs5.getString("GPName");
			owner=rs5.getString("OwnerName");
		}
		
		String sql7="select * from db_gps.t_DeviceRouteMaster where RouteID='"+RID+"'";
		ResultSet rs7=st1.executeQuery(sql7);
		
		if(rs7.next())
		{
			RouteName=rs7.getString("RouteName");
			
			Status=rs7.getString("Status");
			
		}
			
		
	
	%>
	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td  align="center">
			<font size="3" color="#2A0A12">
				<b>GPS Data </b>
			</font>
		</td>
	</tr>
	
		
</table>
	
	<table border="0" width="500px" align="center">


<tr>

<td align="left"><b><font color="Black" size="2">Unit ID : <font color="red"><%=UnitID%></font></b></font><p></p></td>
<td align="left"><b><font color="Black" size="2">Last Data Received : <font color="red"><%=LastData%></font></b></font><p></p></td>
</tr>




</table>


<table border="0" width="500px" align="center">
<tr>
<td align="left"><b><font color="Black" size="2">Last NG (No GPS) Data Received : <font color="red"><%=LastNGData11%></font></b></font><p></p></td>
</tr>

<tr>
<td align="left"><b><font color="Black" size="2">Last NGSM (No GSM) Data Received : <font color="red"><%=LastNGSMData12%></font></b></font><p></p></td>
</tr>

<tr>
<td align="left"><b><font color="Black" size="2">Last NGPRS (No GPRS) Data Received : <font color="red"><%=LastNGPRSData14%></font></b></font><p></p></td>
</tr>


</table>	
<br><br>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td  align="center">
			<font size="3" color="#2A0A12">
				<b>JRM Status </b>
			</font>
		</td>
	</tr>
	
		
</table>
<br>
<table border="1" width="750px" align="center" class="sortable">
		
		
	<td> <div align="center"><b> VehicleNo</b> </div></td>
	<td> <div align="center"><b> TripID</b> </div></td>
	<td> <div align="center"><b> StartPlace </b></div> </td>
	<td> <div align="center"><b> StartCode </b> </div></td>
	<td> <div align="center"><b> EndPlace </b> </div></td>
	<td> <div align="center"><b> EndCode </b> </div></td>
	<td> <div align="center"><b> OwnerName </b> </div></td>
	<td> <div align="center"><b> GroupName </b> </div></td>
	<td> <div align="center"><b> RouteID</b> </div></td>
	<td> <div align="center"><b> RouteName</b> </div></td>
	<td> <div align="center"><b> RouteStatus</b> </div></td>
	<td> <div align="center"><b> JStatus </b> </div></td>
	
	</tr>	
	
	<tr>
	<td><div align="left"><%=VehRegNo%></div></td>
	<td><div align="left"><%=tripid%></div></td>
	<td><div align="left"><%=startplace%></div></td>
	<td><div align="left"><%=startcode%></div></td>
	<td><div align="left"><%=endplace%></div></td>
	<td><div align="left"><%=endcode%></div></td>
	<td><div align="left"><%=owner%></div></td>
	<td><div align="left"><%=gpname%></div></td>
	<td><div align="Right"><%=RID%></div></td>
	<td><div align="left"><%=RouteName%></div></td>
	<td><div align="left"><%=Status%></div></td>
	<td><div align="left"><%=JS%></div></td>
	
	</tr>
	
	
	</table>
	<% 
		
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	//conn.close();
	//conn1.close();
	
	try
	{
		st.close();
		st3.close();
		conn.close();
	}catch(Exception e)
	{}
	try{

	diary.closeConnection();
	}catch(Exception e)
	{


	}

	try
	{
	
		st1.close();
		st2.close();
		st4.close();
		conn1.close();
	}catch(Exception e)
	{}
	try{

	diary.closeConnection1();
	}catch(Exception e)
	{


	}
	
	
	

}

%>
	
<!-- code end here --->
</body>
</html>

</jsp:useBean>

