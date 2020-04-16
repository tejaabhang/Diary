<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement();

%>
	<table border="1" width="100%">
		<tr>
			<th> Sr no</th>
			<th> Veh</th>
			<th> Unit id</th>
			<th> SIM</th>
			<th> Mobile</th>
			<th> Last Date</th>
			<th> Last Location</th>
			<th> Data Delay</th>
			<th> Desc</th>
			
		</tr>
<%
	java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter1.format(d);

int i=1;
String sql1="select * from t_vehicledetails where OwnerName='Om' order by VehicleRegNumber";
ResultSet rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{ 
	String vehno="", unitid="", mobno="", simno="", lastdate="", loc="", diff="", desc="";
	//int diff=0;	
	vehno=rs1.getString("VehicleRegNumber");
	unitid=rs1.getString("UnitId");

	String sql2="select * from t_unitmaster where unitid='"+unitid+"' ";
	ResultSet rs2=stmt2.executeQuery(sql2);
	if(rs2.next())
	{
		mobno=rs2.getString("MobNo");
		simno=rs2.getString("SIMNo");
	}

	String sql3="select * from t_onlinedata where VehicleRegNo='"+vehno+"' ";
	ResultSet rs3=stmt3.executeQuery(sql3);
	if(rs3.next())
	{
		lastdate=rs3.getString("TheDate");
		loc=rs3.getString("Location");
	}	

	int diff1=0;
	String sql4="select (TO_DAYS('"+s+"')-TO_DAYS('"+lastdate+"'))";
        ResultSet rs4=stmt4.executeQuery(sql4);
	if(rs4.next())
	{
		diff=rs4.getString(1);
	}
	if(null==diff)
	{
		desc="Device Installed but not Active";
	}
	else
	{
		diff1=Integer.parseInt(diff);
	
		if(diff1>7)
		{
			desc="Device Disconnected";
		}
		else if(diff1==0)
		{
			desc="Current Data";
		}
		else if(diff1<7 && diff1>0)
		{
			desc="Data Delay";
		}
	}

		
%>
	<tr>
		<td> <%=i%> </td>
		<td> <%=vehno%> </td>
		<td> <%=unitid%> </td>
		<td> <%=simno%> </td>
		<td> <%=mobno%> </td>
		<td> <%=lastdate%> </td>
		<td> <%=loc%> </td>
		<td> <%=diff%> </td>
		<td> <%=desc%> </td>
		
		
	</tr>
<%
	i++;
 }	


con1.close();
} catch(Exception e) { out.println("Exception----->" +e); }
/*finally
{
con1.close();
} */

  
%>