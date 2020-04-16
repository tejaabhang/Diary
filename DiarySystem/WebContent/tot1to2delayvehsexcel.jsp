<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="1_to_2_days_Delay_Vehicles.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st, st1, st2, st3, st01,st4,st5,st7;
String sql,sql1,sql2;
String transporter,today,Svehlist,username,warranty;
String Vehcode="",unitid="",instdate="";
%>

<!--- code start here ------>
<%
transporter="All Transporter";
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String tdydate=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-4000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today3 = formatter.format(defoultdate);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=miliseconds-5000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today4 = formatter.format(defoultdate);

miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String sdays = formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
String  userrole2=session.getAttribute("userrole").toString();



try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st3=conn1.createStatement();
	
	
	
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<table border="0" width="750px" class="">
<tr><td align="center" colspan="2"><center><font color="black" size="3">List of All Vehicles Showing 1 To 2 Days Data Delay.</font></center></td></tr>
</table>

<%
String userrole=session.getAttribute("userrole").toString();


%>
		<table border="1" width="750px" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Transporter</td>
<td>Vehicle No</td>
<td>Updated</td>
<td>Location</td>
<td>UnitID</td>
<td>MobileNO</td>
<td>SimNo</td>
<td>Sim Company</td>
<td>GPName</td>
<td>Inst On</td>
<td> Complaint Date</td>
<td>Warranty</td>
</tr>

<%
try
{
		
	
	if(userrole2.equalsIgnoreCase("supertech")){
	
		 String sqlas="",trns="",rep="";
		
		String us=username.toUpperCase();
	sql="select a.*,b.UnitID,b.installeddate,b.OwnerName from t_onlinedata a, t_vehicledetails b where a.TheDate < '"+tdydate+"' and a.TheDate > '"+today3+"' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.TheDate Desc";
//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	
		
		trns=rst1.getString("OwnerName");
		unitid=rst1.getString("b.UnitID");
		
		
		
		sqlas="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+trns+"'";
		ResultSet agnt=st3.executeQuery(sqlas);
		//System.out.println(">>>>>>sql 3>>sqlas>>"+sqlas);
		
		if(agnt.next())
		{
			rep=agnt.getString("Representative");		
			
			
			if(rep=="Kamal Dixit" || rep.equalsIgnoreCase("Kamal Dixit"))
			{
		
		
	String simno="-", mobno="-", group1="", simcomp="-";
	try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			sql="select TO_DAYS('"+tdydate+"')-TO_DAYS('"+rst1.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st2.executeQuery(sql);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
			sql="select * from t_group where VehCode='"+rst1.getString("VehicleCode")+"' ";
		ResultSet rs6=st2.executeQuery(sql);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="NA";
 		}
	%>
	<tr>
	<td align="right"><%=i%></td>
	<td align="left"><%=rst1.getString("OwnerName")%></td>
	<td align="left"><%=rst1.getString("VehicleRegNo")%></td>
	<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td align="left"><%=rst1.getString("Location")%></td>
	<td align="right"><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			simcomp=rs5.getString("SimCompany");
		}
	%>
	<td align="right"><%=simno%></td>
	<td align="right"><%=mobno%></td>
	<td align="left"><%=simcomp%></td>
	<td align="left"><%=group1%></td>
	<td align="right"><%=instdate%></td>
	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNo")+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
		%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </B>
				   
	<%		
		}
		else
		{ %>
			<td align="left"> No Complaint</td>		
	<%	}
	%>
	<td align="left"><%=warranty%></td>
	</tr>

        <%
	i++;
	
	
	}
	}
	}
	
		
		
		
	}else{
	
		String us=username.toUpperCase();
	sql="select a.*,b.UnitID,b.installeddate,b.OwnerName from t_onlinedata a, t_vehicledetails b where a.TheDate < '"+tdydate+"' and a.TheDate > '"+today3+"' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.TheDate Desc";
//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	unitid=rst1.getString("b.UnitID");
	String simno="-", mobno="-", group1="", simcomp="-";
	try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			sql="select TO_DAYS('"+tdydate+"')-TO_DAYS('"+rst1.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st2.executeQuery(sql);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
			sql="select * from t_group where VehCode='"+rst1.getString("VehicleCode")+"' ";
		ResultSet rs6=st2.executeQuery(sql);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="NA";
 		}
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst1.getString("OwnerName")%></td>
	<td><%=rst1.getString("VehicleRegNo")%></td>
	<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td><%=rst1.getString("Location")%></td>
	<td><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			simcomp=rs5.getString("SimCompany");
		}
	%>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=simcomp%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNo")+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
		%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </B>
				   
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	<td><%=warranty%></td>
	</tr>

        <%
	i++;
	
	}
	}
	
	
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
conn.close();
conn1.close();
}
%>
	</table>
  
  <div id="copyright">
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
