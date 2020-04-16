<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Total_Installed.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);

%>

<%@ include file="header.jsp" %>
<%!

Connection conn,conn1;
Statement st, st1, st2, st3,st4,st5,st6, st9, st11, st12;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8;
String today,Svehlist,username,simno,mobno,vehiclecode;
String instdate,warranty, expdate;
%>

<!--- code start here ------>
<%
//transporter=request.getParameter("transporter");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st9=conn1.createStatement();
	st11=conn1.createStatement();
	st12=conn1.createStatement();
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>

<table border="0" width="750px" >
<tr><td><center><font size="3"><b>List of all Installed Vehicles .</font></center></td></tr>
</table>
<p></p>
<p></p>

<table border="1" width="750px" align="center" bgcolor="white">

<tr>
<th>Sr.</th>
<th>Owner Name</th>
<th>Vehicle No</th>
<th>Updated</th>
<th>Location</th>
<th>UnitID</th>
<th>MobileNo</th>
<th>SimNo</th>
<th>Sim Company</th>
<th>GPName</th>
<th>Inst On</th>
<th>Warranty</th>


</tr>

<%
try
{
		String userrole=session.getAttribute("userrole").toString();
		String us=username.toUpperCase();
		if(session.getAttribute("userrole").toString().equals("Group"))
		{
		if(us.equals("CASTROL"))
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"'and Active='Yes'";
		}
		else
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"'";
		}
		}
		else
		{
		sql="select *  from t_vehicledetails order by OwnerName Asc";
		
		}
		
	ResultSet rst=st1.executeQuery(sql);
	
	while(rst.next())
	{
	
	Svehlist=Svehlist+","+rst.getString("VehicleCode");
	
	
	}
	Svehlist=Svehlist+")"; 
	//out.print(Svehlist);
	
	
	sql="select * from t_onlinedata where VehicleCode in "+Svehlist+" order by TheDate desc, TheTime desc";

	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	String Vehcode="",unitid="",group1="", vehregno="";
	while(rst1.next())
	{
		String bg="", msg="";
		int delaydays=0;
		String simno="-", mobno="-", simcomp="-" ;
		String upddate=rst1.getString("TheDate");
		String loc=rst1.getString("Location");
		
		sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+upddate+"') as days";
		ResultSet rsdate=st11.executeQuery(sql8);
		if(rsdate.next())
		{
				delaydays=rsdate.getInt("days");
				if(delaydays>7)
				{
					msg="Device Disconnected";					
				}
		}
		
		String nogpschk="";
		try{
			nogpschk=loc.substring(0,11);
		} catch(Exception e)
		{
			nogpschk=loc;
		}
		if(nogpschk.equals("No GPS Data"))
		{
			msg=msg+" No GPS Data";
		}
		
	 sql8="select status from t_vehicledetails where vehiclecode='"+rst1.getString("VehicleCode")+"'";
	 ResultSet rstrem=st2.executeQuery(sql8);
	 if(rstrem.next())
	 {
	 	if(rstrem.getString("Status").equals("Removed"))
	 	{
	 		bg="red";
	 	}
	 	if(rstrem.getString("Status").equals("Missing"))
	 	{
	 		bg="yellow";
	 	}
	 }

		Vehcode=rst1.getString("VehicleCode");
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"' ";
		ResultSet rs4=st4.executeQuery(sql4);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
			vehregno=rs4.getString("VehicleRegNumber");
			String instdte=rs4.getString("InstalledDate");

			try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rs4.getDate("InstalledDate"));
			sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+rs4.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st5.executeQuery(sql4);
			if(rstwar.next())
			{
				if(rstwar.getInt("days") <= 365)
				{
					warranty="Yes";

					/*String sql12="select ADDDATE('"+instdte+"', INTERVAL 365 DAY)";
					ResultSet rs12=st2.executeQuery(sql12);
					if(rs12.next())
					{
						//expdate=rs12.getString(1);
						Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
						expdate=formatter2.format(rs12.getDate(1));
					
					} */
					
				}
				else
				{
					warranty="No";
					//expdate="NA";
				}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
			
		}
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			simcomp=rs5.getString("SimCompany");
		} 
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		//out.print(sql6);
		ResultSet rs6=st6.executeQuery(sql6);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="None";
		}
	%>
	<tr >
	<td><%=i%></td>
	<td><%=rst1.getString("Transporter") %></td>
	<td><%=rst1.getString("VehicleRegNo")%>
	
	</td>
	<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td><%=rst1.getString("Location")%>  <font color="red"> <%=msg %> </font>
<% 
	if(bg.equals("yellow"))
	{ %>
		<font color="red" >UNIT MISSING </font>
<%	}

	if(bg.equals("red"))
	{
		String remdate="", oldunitwith="", withtech="";
		 out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
		//String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and InstType='Rem' order by EntDate desc";
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
			remdate=rs9.getString("EntDate");
			oldunitwith=rs9.getString("OldUnitWith");
			withtech=rs9.getString("InstBy");
		}
		else
		{
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' order by InstDate desc limit 1";
			
			ResultSet rs11 = st11.executeQuery(sql11);
			
			if(rs11.next())
			{
				unitid=rs11.getString("NewUnitId");
				oldunitwith="Not Avail";
				//remdate=rs11.getString("EntDate");
			}
		}
		
		try{
			out.print(" <font color='yellow' size='2'> on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+" Unit with:"+oldunitwith+"</font>");
			} catch(Exception e)
			{
				out.print(" <font color='yellow' size='2'> on (date not available)</font>");			
			}

	 } %> </td>
	
	<td><%=unitid%></td>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=simcomp%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<td><%=warranty%></td>


	</tr>

        <%
	i++;
	}
	sql="select * from t_vehicledetails where VehicleCode not in (select VehicleCode from t_onlinedata)";
	ResultSet rst3=st1.executeQuery(sql);
	while(rst3.next())
	{
String bg1="";
	 sql7="select status from t_vehicledetails where vehiclecode='"+rst3.getString("VehicleCode")+"'";
	 ResultSet rstrem1=st2.executeQuery(sql7);
	 if(rstrem1.next())
	 {
	 	if(rstrem1.getString("Status").equals("Removed"))
	 	{
	 		bg1="red";
	 	}
	 	
	 }
	
		Vehcode=rst3.getString("VehicleCode");
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"' ";
		ResultSet rs4=st4.executeQuery(sql4);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
			try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rs4.getDate("InstalledDate"));
			sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+rs4.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st5.executeQuery(sql4);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";

				/*String sql11="select ADDDATE('"+rs4.getDate("InstalledDate")+"', INTERVAL 365 DAY)";
				out.print(sql11);
				ResultSet rs11=st1.executeQuery(sql11);
				if(rs11.next())
				{
					//expdate=rs11.getString(1);
		
					Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
					expdate=formatter1.format(rs11.getString(1));
				} */
				
			}
			else
			{
				warranty="No";
				//expdate="NA";
			}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
		}
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
		}
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		//out.print(sql6);
		ResultSet rs6=st6.executeQuery(sql6);
		if(rs6.next())
		{
			
			group1=rs6.getString("GPName");
		}
		else
		{
			
			group1="None";
		}
		%>
	<tr>
	<td><%=i%></td>
	<td><%=rst3.getString("VehicleRegNumber")%></a>
	
	</td>
	<td><% try{
	out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(rst3.getDate("InstalledDate")));
	}catch(Exception e)
	{
		out.print("-");
	}	
	%></td>
	
	</td>
	
	<td><%=rst3.getString("InstalledPlace")%> <font color="red"> In Active
	<% if(bg1.equals("red"))
	  { 
		//String remdate="";
		String remdate="", oldunitwith="", withtech="";
		String sql9="";
		
		     sql9="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and InstType='Rem' order by EntDate desc";
		     ResultSet rs9=st9.executeQuery(sql9);	
				if(rs9.next())
				{
					unitid=rs9.getString("OldUnitId");
					remdate=rs9.getString("EntDate");
					oldunitwith=rs9.getString("OldUnitWith");
					withtech=rs9.getString("InstBy");
				}
				else
				{
					String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' order by InstDate desc limit 1";
						
					ResultSet rs11 = st11.executeQuery(sql11);
					
					if(rs11.next())
					{
						unitid=rs11.getString("NewUnitId");
						oldunitwith="Not Avail";
						//remdate=rs11.getString("EntDate");
					}
				}
				if(oldunitwith.equals("Tech"))
				{
					oldunitwith=withtech;			
				}
				try{
				out.print(" <font color='yellow' size='2'> In-Active Unit Removed on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+ " Unit with:"+oldunitwith+"</font>");
				} catch(Exception e)
				{
					out.print(" <font color='yellow' size='2'>In-Active UNIT REMOVED on (date not available)</font>");			
				}
		
			
			
	  
	 }%>
	  </font></td>
	<td><%=unitid%></td>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<td><%=warranty%></td>
	
	
		
	</tr>		
		<%
		i++;
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
	
</table>
		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>

