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
					<b>Maintenance History of vehicle <%=vehno%> Transporter <%=transporter%></b>
				</font>
			</td>
		</tr>
		<tr>
	<td align="center"><p></p><font color="DarkCyan" size="2">Present Unit ID :<font color="red"><%=newunit%></font>, Installed Date : <font color="red"><%=insdate%></font>, Installed Place : <font color="red"><%=installplace%></font>, Installed By :<font color="red"><%=installby%></font>.</font><p></p></td>
	</tr>	
	</table>
<br></br>
	<table border="0" width="500px" align="center">
	
	
	<tr>
	<td>
	<p></p>
	<table border="1" width="750px" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
	<td> <b> Sr. No. </b> </td>
	<td> <b> Rep-Date </b> </td>
	<td> <b> Old-Unit </b> </td>
	<td> <b> New-Unit </b> </td>
	<td> <b> Peripheral </b> </td>
	<td> <b> Rep-Place </b> </td>
	<td> <b> Rep-By </b> </td>
	<td> <b> Unit Life </b> </td>
	<td> <b> Warranty </b> </td>
	</tr>	
<%


	sql="select * from t_unitreplacement where VehRegNo='"+vehno+"' and InstType='Rep' order by InstDate";	
	//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	System.out.println("sql==>Before--"+sql);
	//out.println(sql);
	int i=1;
	while(rst1.next())
	{
		String periph="";
		sql3="select * from t_unitmasterhistory where UnitId='"+rst1.getString("NewUnitId")+"' and EntDate <= '"+rst1.getDate("InstDate")+"' order by EntDate desc limit 1";
		ResultSet rs3=st4.executeQuery(sql3);
		System.out.println("sql3==>Before--"+sql3);

		if(rs3.next())
		{
			periph=rs3.getString("Peripherals");
		}
		
		
		
		if(rst1.getString("WasWarranty").equalsIgnoreCase("-"))
		{
			
			sql2="select (TO_DAYS('"+rst1.getString("EntDate")+"')-TO_DAYS('"+instdt+"'))";
			
			
			System.out.println("sql2==>Before--"+sql2);
			ResultSet rst4=st4.executeQuery(sql2);
			System.out.println("sql2==>Afetr--"+sql2);
			if(rst4.next())
			{
				
				days=rst4.getInt(1);
				System.out.println("days==>wrnty--"+days);
	        	if(days > 365){
	        		wrnty="No";
	        		
	        	}else{
	        		
	        		wrnty="Yes";
	        		
	        	}
				
			}
		}else{
			
			wrnty=rst1.getString("WasWarranty");
			
		}
		
		
		
		System.out.println("wrnty==>wrnty--"+wrnty);
		System.out.println("days==>wrnty--"+days);
	%>
	<tr>
	<td><%=i%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate"))%></td>
	<td><div align="right"><%=rst1.getString("OldUnitId")%></div></td>
	<td><div align="right"><%=rst1.getString("NewUnitId")%></div></td>
	<td><div align="right"><%=periph%></div></td>
	<td><%=rst1.getString("InstPlace")%></td>
	<td><%=rst1.getString("InstBy")%></td>
	<td><%=rst1.getString("UnitLife")%></td>
<!--	<td>< %=rst1.getString("WasWarranty")%></td>-->
	<td><%=wrnty%></td>
	</tr>
	
	<%
	i++;
	}
	%>
	</table>
	<br></br>	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Solved Complaints </b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
	<table border="1" width="750px" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			<td> <div align="center"> <B> Sr.<br> No </B> </div> </td>
			<td> <div align="center"> <B> Tick No. </B> </div> </td>
			<td> <div align="center"> <B> Veh. No </B> </div> </td>
			<td> <div align="center"> <B> Lodged Date </B> </div> </td>	
			<td> <div align="center"> <B> Complaint </B> </div> </td>
			<td> <div align="center"> <B> Alloc.<br> To </B> </div> </td>
			<td> <div align="center"> <B> Alloc. Date </B> </div> </td>
			
			<td> <div align="center"> <B> Solved Date </B> </div> </td>
			<td> <div align="center"> <B> Reg. By </B> </div> </td>
		</tr>
<%
	int k=1;

	sql1="select * from t_complaints1 where VehicleNo='"+vehno+"' and Status='Solved' order by Tno desc";
	ResultSet rs1=st.executeQuery(sql1);
	while(rs1.next())
	{ 
		String allocto="", allocdate="", soldate="";
	
		String tickno=rs1.getString("Tno");
		soldate=rs1.getString("PSolDate");
		
		sql2="select * from t_callocation1 where Tno='"+tickno+"' ";
		ResultSet rs2=st3.executeQuery(sql2);
		if(rs2.next())
		{
			allocto=rs2.getString("Technicion");
			allocdate=rs2.getString("DofAllocation");

		}			
%>
		<tr>
			<td> <%=k%> </td>
			<td> <%=rs1.getString("Tno")%> </td>
			<td> <%=rs1.getString("VehicleNo")%> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TdyDate")))%> </td>		
			<td> <%=rs1.getString("Complaint")%> </td>
			<td> <%=allocto%> </td>	
			<td>
<%	
			try { %>
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate))%> 
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
				</td>	  	
				
				<td> 
<%	
			try { %>	
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(soldate))%>
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
 				</td>	
				<td> <%=rs1.getString("RegBy")%> </td>	
		</tr>
<%	
		k++;
	}
%>
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
