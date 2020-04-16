<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<jsp:useBean id="diary" class="com.diary.beans.classes" scope="page">
<%@ include file="header.jsp" %>
<%
diary.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
diary.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<%!
Connection conn,conn1;
Statement st, st1, st2, st3, st4;
String sql,sql1,sql2, sql3;
String transporter,today,Svehlist,olddate,username,vehno,insdate,newunit,installplace,installby,vehcode;
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
String newunit="";
String wrnty="",instdt="";


int days=0;
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
	//out.print(vehno);
	//out.println(vehcode);
	sql="select * from t_vehicledetails where VehicleCode ='"+vehcode+"'";
	
	ResultSet rst2=st1.executeQuery(sql);
	System.out.println("sql==>sql--"+sql);
	if(rst2.next())
	{
		vehno=rst2.getString("VehicleRegNumber");
		transporter=rst2.getString("OwnerName");
		installplace=rst2.getString("InstalledPlace");
		installby=rst2.getString("InstalledBy");
		instdt=rst2.getString("InstalledDate");
		try
		{
		insdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("InstalledDate"));
		}catch(Exception e)
		{
			insdate=rst2.getString("InstalledDate");
		}
		System.out.println("instdt==>instdt--"+instdt);
		//String unit=rst2.getString("TheFieldFromEmailAddress");
		newunit=rst2.getString("UnitID");
		//newunit=unit.substring(2,unit.indexOf("@"));
		//out.print(newunit);
	}
	%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Outgoing Call Log Data  of Vehicle <%=vehno%> For Transporter <%=transporter%> By , <%=username %></b>
				</font>
			</td>
		</tr>
			
	</table>
<br></br>
	<table border="0" width="500px" align="center">
	
	
	<tr>
	<td>
	<p></p>
	<table border="1" width="750px" align="center" class="sortable">
		<div id="reportData1">
 <iframe id="myIframe" width="100%" height="500px" src="http://103.241.181.36:8080/birt/frameset?__report=vehwisecalllog.rptdesign&VehicleId=<%=vehcode%> &VehRegNo=<%=vehno%>&Transporter=<%=transporter%>&Caller=<%=username%> &__showtitle=false">
<!-- <iframe id="myIframe" width="180%" height="500px" src="http://103.241.181.36:8080/NewBirtTestERP/frameset?__report=CallLog.rptdesign&__showtitle=false"> --> 
<!-- <iframe id="myIframe" width="100%" height="850px" src=""> --> 
</iframe> 

 </div>

	</table>
	<br></br>	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		
	</table>
<br></br>
	<table border="1" width="750px" align="center" class="sortable">
		

	</table>	

    </td>
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
