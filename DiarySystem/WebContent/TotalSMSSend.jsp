<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st33,st12,st14,st13,st2,st3,st34,st15;
String sql,sql1,sql2,today,olddate,username,userrole,thename,sql3,sql33,sql4,sql5,sql6,sql7,sql8,sql9,sql10;
String fromdate,todate;
int Ocount,Icount,CAcount,CAvcount=0,CScount,CPcount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
%>	
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />

	</head>
	
	<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <p></p>
         <%@ include file="header1.jsp" %>
         </div> 
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
	
<%
String type = request.getParameter("Type");
String total_sms_send = request.getParameter("total_sms_send");
////System.out.println("total_sms_send---->" + total_sms_send);
String fromdate = request.getParameter("date1");
String todate = request.getParameter("date2");

Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
if(type.equals("Representative"))
{
	if (total_sms_send.equals("total_sms_send"))
	{
	%>
	<table border="1" width="100%" class="sortable">
	<tr>
	<td>Sr.</td>
	<td>Vehicle number</td>
	<td>Transporter</td>
	<td>Technician name</td>
	<td>Vehicle availability date</td>
	<td>Contact details</td>
	<td>SMS Date and Time sent</td>
	<td>Representative Name</td>
	<td>Reallocation/Allocation</td>
	</tr>


	<%
	try
	{
		// <%= request.getContextPath() +"./DiarySystem/
		
	////System.out.println("i am in representative detail");
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st14=conn.createStatement();
	String techsql = "select Distinct(Name) as name from t_admin where URole='service'";
	////System.out.println("techsql...............!!!!" + techsql);
	ResultSet rs_tech = st14.executeQuery(techsql);
	int i = 1;
	while(rs_tech.next())
	{
	sql="SELECT * FROM t_ComplaintAllocationSMS where Trim(AllotedBy) like Trim('"+ rs_tech.getString("name") +"') and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";
	////System.out.println("sql...............!!!!" + sql);
	ResultSet rst=st.executeQuery(sql);

	while (rst.next())
	{
	%>

	<tr>
	<td><%= i++ %></td>
	<td><%= rst.getString ("VehicleNo") %></td>
	<td><%= rst.getString ("Transporter") %></td>
	<td><%= rst.getString ("TechName") %></td>
	<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString ("VehAvaildate")));
	%>
	<td><%= available_dt %></td>
	<td><%= rst.getString ("ContDets") %></td>
	<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString ("Complaint_date")));
	%>
	<td><%= complaint_dt %></td>
	<td><%= rst.getString ("AllotedBy")%></td>
	<td><%= rst.getString ("data_type")%></td>
	</tr>

	<%
	}
	}
	}

	catch(Exception e){} %>

	</table>
	
<%
	}
	else{

		%>
		<table border="1" width="100%" class="sortable">
		<tr>
		<td>Sr.</td>
		<td>Vehicle number</td>
		<td>Transporter</td>
		<td>Technician name</td>
		<td>Vehicle availability date</td>
		<td>Contact details</td>
		<td>SMS Date and Time sent</td>
		<td>Representative Name</td>
		<td>Reallocation/Allocation</td>
		</tr>


		<%
		try
		{
			// <%= request.getContextPath() +"./DiarySystem/
			
		////System.out.println("i am in representative detail");
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		
		st12=conn.createStatement();
		st33=conn.createStatement();
		st13=conn.createStatement();
		String techsql = "select Distinct(Name) as name from t_admin where URole='service'";
	
		ResultSet rs_tech = st12.executeQuery(techsql);
		int i = 1;
		int j=0;
		while(rs_tech.next())
		{
			sql="SELECT * FROM t_ComplaintAllocationSMS where Trim(AllotedBy) like Trim('"+ rs_tech.getString("name") +"') and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";	
			////System.out.println("sql--->" + sql);
			ResultSet rst=st33.executeQuery(sql);	

			while (rst.next())
			{
				
				int tno = rst.getInt("Tno");
				
				String sql3 =  "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
				////System.out.println("sql3---->" + sql3);
				ResultSet rst3=st13.executeQuery(sql3);

				if (rst3.next())
				{
				%>

				<tr>
				<td><%= i++ %></td>
				<td><%= rst.getString ("VehicleNo") %></td>
				<td><%= rst.getString ("Transporter") %></td>
				<td><%= rst.getString ("TechName") %></td>

				<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString ("VehAvaildate")));%>
				<td><%= available_dt %></td>
				<td><%= rst.getString ("ContDets") %></td>

				<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString ("Complaint_date")));%>
				<td><%= complaint_dt %></td>
				<td><%= rst.getString ("AllotedBy")%></td>

				<%
				}
}}}catch(Exception e){}
%>
</table>
</body>
<% }
}else if(type.equals("Transporter"))
{
	if (total_sms_send.equals("total_sms_send"))
	{
	%>
	<table border="1" width="100%" class="sortable">
	<tr>
	<td>Sr.</td>
	<td>Vehicle number</td>
	<td>Transporter</td>
	<td>Technician name</td>
	<td>Vehicle availability date</td>
	<td>Contact details</td>
	<td>SMS Date and Time sent</td>
	<td>Representative Name</td>
	<td>Reallocation/Allocation</td>
	</tr>


	<%
	try
	{
		// <%= request.getContextPath() +"./DiarySystem/
		
	////System.out.println("i am in representative detail");
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st14=conn.createStatement();
	String techsql =  "SELECT DISTINCT (Ownername) as Ownername FROM db_gps.t_vehicledetails WHERE Ownername NOT LIKE '% del' order by Ownername";
	////System.out.println("techsql...............!!!!" + techsql);
	ResultSet rs_tech = st14.executeQuery(techsql);
	int i = 1;
	while(rs_tech.next())
	{
		sql="SELECT * FROM `t_ComplaintAllocationSMS` where Transporter like '"+rs_tech.getString("Ownername") + "' and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";
	////System.out.println("sql...............!!!!" + sql);
	ResultSet rst=st.executeQuery(sql);

	while (rst.next())
	{
	%>

	<tr>
	<td><%= i++ %></td>
	<td><%= rst.getString ("VehicleNo") %></td>
	<td><%= rst.getString ("Transporter") %></td>
	<td><%= rst.getString ("TechName") %></td>
	<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString ("VehAvaildate")));
	%>
	<td><%= available_dt %></td>
	<td><%= rst.getString ("ContDets") %></td>
	<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString ("Complaint_date")));
	%>
	<td><%= complaint_dt %></td>
	<td><%= rst.getString ("AllotedBy")%></td>
	<td><%= rst.getString ("data_type")%></td>
	</tr>

	<%
	}
	}
	}

	catch(Exception e){} %>

	</table>
	
<%
	
	}else
	{
		

		%>
		<table border="1" width="100%" class="sortable">
		<tr>
		<td>Sr.</td>
		<td>Vehicle number</td>
		<td>Transporter</td>
		<td>Technician name</td>
		<td>Vehicle availability date</td>
		<td>Contact details</td>
		<td>SMS Date and Time sent</td>
		<td>Representative Name</td>
		</tr>


		<%
		try
		{
			// <%= request.getContextPath() +"./DiarySystem/
			
		////System.out.println("i am in representative detail");
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st14=conn.createStatement();
		String techsql =  "SELECT DISTINCT (Ownername) as Ownername FROM db_gps.t_vehicledetails WHERE Ownername NOT LIKE '% del' order by Ownername";
		////System.out.println("techsql...............!!!!" + techsql);
		ResultSet rs_tech = st14.executeQuery(techsql);
		int i = 1;
		while(rs_tech.next())
		{
			sql="SELECT * FROM `t_ComplaintAllocationSMS` where Transporter like '"+rs_tech.getString("Ownername") + "' and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";
		////System.out.println("sql...............!!!!" + sql);
		ResultSet rst=st.executeQuery(sql);

		while (rst.next())
		{
			int tno = rst.getInt("Tno");
			////System.out.println("tno---->" + tno);
			String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
			////System.out.println("sql3---->" + sql3);
			ResultSet rst3=st2.executeQuery(sql3);

			if (rst3.next())
			{
				String sql5 = "select * from t_ComplaintAllocationSMS where Tno = "+ tno;
				// and (status like 'Attended' or status like 'Solved')";
				////System.out.println("sql5---->" + sql5);
				ResultSet rst5=st3.executeQuery(sql5);

				if (rst5.next())
				{
					%>
					<tr>
						<td><%= i++ %></td>
						<td><%= rst5.getString ("VehicleNo") %></td>
						<td><%= rst5.getString ("Transporter") %></td>
						<td><%= rst5.getString ("TechName") %></td>
						<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst5.getString ("VehAvaildate"))); %>
						<td><%= available_dt %></td>
						<td><%= rst5.getString ("ContDets") %></td>
						<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst5.getString ("Complaint_date")));%>
						<td><%= complaint_dt %></td>
						<td><%= rst5.getString ("AllotedBy")%></td>
					</tr>
					<%
				}
			  }
			}
		  }
		}
		catch(Exception e){} %>

		</table>
		
	<%
		
		
		
		
	}
	
}else if(type.equals("Technician"))
{
	
	if (total_sms_send.equals("total_sms_send"))
	{

		%>
		<table border="1" width="100%" class="sortable">
		<tr>
		<td>Sr.</td>
		<td>Vehicle number</td>
		<td>Transporter</td>
		<td>Technician name</td>
		<td>Vehicle availability date</td>
		<td>Contact details</td>
		<td>SMS Date and Time sent</td>
		<td>Representative Name</td>
		<td>Reallocation/Allocation</td>
		</tr>


		<%
		try
		{
			// <%= request.getContextPath() +"./DiarySystem/
			
		////System.out.println("i am in representative detail");
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st34=conn.createStatement();
		st15=conn.createStatement();
		String techsql =  "select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";
		////System.out.println("techsql...............!!!!" + techsql);
		ResultSet rs_tech = st15.executeQuery(techsql);
		int i = 1;
		while(rs_tech.next())
		{
			sql="SELECT * FROM `t_ComplaintAllocationSMS` where TechName like '"+rs_tech.getString("TechName") + "' and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";
		////System.out.println("sql...............!!!!" + sql);
		ResultSet rst=st34.executeQuery(sql);

		while (rst.next())
		{
		%>

		<tr>
		<td><%= i++ %></td>
		<td><%= rst.getString ("VehicleNo") %></td>
		<td><%= rst.getString ("Transporter") %></td>
		<td><%= rst.getString ("TechName") %></td>
		<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString ("VehAvaildate")));
		%>
		<td><%= available_dt %></td>
		<td><%= rst.getString ("ContDets") %></td>
		<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst.getString ("Complaint_date")));
		%>
		<td><%= complaint_dt %></td>
		<td><%= rst.getString ("AllotedBy")%></td>
		<td><%= rst.getString ("data_type")%></td>
		</tr>

		<%
		}
		}
		}

		catch(Exception e){} %>

		</table>
		
	<%
		
		
		
		
	}
	else{

		

		%>
		<table border="1" width="100%" class="sortable">
		<tr>
		<td>Sr.</td>
		<td>Vehicle number</td>
		<td>Transporter</td>
		<td>Technician name</td>
		<td>Vehicle availability date</td>
		<td>Contact details</td>
		<td>SMS Date and Time sent</td>
		<td>Representative Name</td>
		</tr>


		<%
		try
		{
			// <%= request.getContextPath() +"./DiarySystem/
			
		////System.out.println("i am in representative detail");
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		st14=conn.createStatement();
		String techsql =   "select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";
		////System.out.println("techsql...............!!!!" + techsql);
		ResultSet rs_tech = st14.executeQuery(techsql);
		int i = 1;
		while(rs_tech.next())
		{
			sql="SELECT * FROM `t_ComplaintAllocationSMS` where TechName like '"+rs_tech.getString("TechName") + "' and Complaint_date BETWEEN ' " + fromdate + "' AND '" + todate+ "'";
		////System.out.println("sql...............!!!!" + sql);
		ResultSet rst=st.executeQuery(sql);

		while (rst.next())
		{
			int tno = rst.getInt("Tno");
			//System.out.println("tno---->" + tno);
			String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
			////System.out.println("sql3---->" + sql3);
			ResultSet rst3=st2.executeQuery(sql3);

			if (rst3.next())
			{
				String sql5 = "select * from t_ComplaintAllocationSMS where Tno = "+ tno;
				// and (status like 'Attended' or status like 'Solved')";
			//	//System.out.println("sql5---->" + sql5);
				ResultSet rst5=st3.executeQuery(sql5);

				if (rst5.next())
				{
					%>
					<tr>
						<td><%= i++ %></td>
						<td><%= rst5.getString ("VehicleNo") %></td>
						<td><%= rst5.getString ("Transporter") %></td>
						<td><%= rst5.getString ("TechName") %></td>
						<% String available_dt = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst5.getString ("VehAvaildate"))); %>
						<td><%= available_dt %></td>
						<td><%= rst5.getString ("ContDets") %></td>
						<% String complaint_dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rst5.getString ("Complaint_date")));%>
						<td><%= complaint_dt %></td>
						<td><%= rst5.getString ("AllotedBy")%></td>
					</tr>
					<%
				}
			  }
			}
		  }
		}
		catch(Exception e){} %>

		</table>
		
	<%
		
		
		
		
	
	}
}

%>
</html>	