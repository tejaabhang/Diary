<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Currentdataexcel.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);

%>

<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8,sql9,sql10;
String group,today,Svehlist,username;

%>

<!--- code start here ------>
<%
group=request.getParameter("transporter");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	st=conn1.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn1.createStatement();
	st8=conn.createStatement();
	st9=conn.createStatement();
	st10=conn.createStatement();
	
	

	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<%
	String userrole=session.getAttribute("userrole").toString();

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{
		String vehno=request.getParameter("vehno");
 %>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon"> <U> Special Report for <%=vehno%> has been added successfully </U> </font> </td>
			</tr>
		</table>
	
<%	}
%>

<table border="0" width="750px">
<tr>
	<td colspan="10" align="center"> <font color="maroon" size="3"> <B> VEHICLE LIST OF <%=group %> Showing Current Data.</B> </font> 
</td>
</tr>
</table>
<table border="1" width="750px">

</table>

			<table border="1" width="750px" align="center" class="sortable">

			<tr>
				<td>Sr.</td>
				<td>Transporter</td>
				<td>Vehicle No</td>
				<td>Updated</td>
				<td>Location</td>
				<td>Veh Available Date </td>
				<td>UnitID</td>
				<td>MobileNo</td>
				<td>SimNo</td>
				<td>Peripheral</td>
				<td>Sim Comp</td>
				<td>Inst On</td>
				<td>Warranty</td>
				<td>Sp. Comments</td>
		</tr>

<%
try
{
int i=1;
String transname = "-";
String vehicleno = "-";
String unitid = "-";
String grpname = "-";
String update = "-";
String uptime = "-";
String uplocation = "-";
String mobno = "-";
String simno = "-";
String peripheral = "-";
String simcompany= "-";
String instdate = "-";
String warranty = "";
String wardate = "";

		sql="select Distinct(a.transporter),b.UnitID,b.OwnerName,b.InstalledDate from t_group a, t_vehicledetails b where a.GPName = '"+group+"' and a.transporter = b.VehicleRegNumber ";
		ResultSet rst = st.executeQuery(sql);
		while(rst.next())
			{
				vehicleno = rst.getString("a.transporter");
				unitid = rst.getString("b.UnitID");
				transname = rst.getString("b.OwnerName");
				try
				{
				instdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("b.InstalledDate")));
				}catch(Exception e)
				{
					instdate = "-";
				}
				
				sql1="select * from t_onlinedata where VehicleRegNo = '"+vehicleno+"' and TheDate = '"+today+"' order by TheDate";
				ResultSet rst1 = st1.executeQuery(sql1);
				if(rst1.next())
				{
					update = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst1.getString("TheDate")));	
					uptime = rst1.getString("TheTime");
					uplocation = rst1.getString("Location");
				

				%>
				
				<tr>
					<td><%=i%></td>
					<td><%=transname%></td>
					<td><%=vehicleno%></td>
					<td><font color="RED"><%=update%><%=uptime%></font></td>
					<td><font color="RED"><%=uplocation%></font></td>
			
				<%
				
				String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
				sql9="select * from t_complaints1 where VehicleNo='"+vehicleno+"' and Status <> 'Solved' ";
				ResultSet rst9 = st9.executeQuery(sql9);
				if(rst9.next())
				{
					
					attloc=rst9.getString("VehAttLoc");
					availdate=rst9.getString("VehAvailDate");
					allocatedto=rst9.getString("Status");
					desc=rst9.getString("Complaint");
					contpers=rst9.getString("ContDets");
					entby=rst9.getString("RegBy");
					DetDesc=rst9.getString("CDescription");
					compdate=rst9.getString("TdyDate");
					
					if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
					{
						sql10="select * from t_callocation1 where Tno='"+rst9.getString("Tno")+"' order by DofAllocation Desc";
						ResultSet rst10=st10.executeQuery(sql10);
						if(rst10.next())
						{
							allocatedto=rst10.getString("Technicion");
							//compdate=rs10.getString("DofAllocation");
						}
						else
						{
							allocatedto="Unallocated";
						}
							
					}
					
					if(availdate.equals(""))
					{
						availdate="No Information";
						
						%>
						<td><%=availdate %> </td>
						<%
					}
					
					else
					{
					
					try
					{
					%>
						<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?compdate=<%=compdate %>&attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>&DetDesc=<%=DetDesc %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate))%> </B>
						   
					<%	
					}catch(Exception e){
						
					out.println("-");
					}
					}
				}
				else
				{ 
				%>
				<td> No Complaint</td>		
				<%
				}
				
				
				sql2="select * from t_unitmaster where unitid = '"+unitid+"' ";
				ResultSet rst2 = st2.executeQuery(sql2);
				if(rst2.next())
				{
					mobno = rst2.getString("MobNo");
					simno = rst2.getString("SimNo");
					peripheral = rst2.getString("Peripherals");
					simcompany = rst2.getString("SimCompany");
				}

//*************************FOR WARRANTY *************************************
				
				sql3="select InstalledDate from t_vehicledetails where VehicleRegNumber = '"+vehicleno+"' ";
				ResultSet rst3 = st3.executeQuery(sql3);
				if(rst3.next())
				{
					wardate = rst3.getString("InstalledDate");
					sql4="select * from t_amchistory where VehNo = '"+vehicleno+"' order by NewDate desc limit 1";
					ResultSet rst4 = st4.executeQuery(sql4);
					if(rst4.next())
					{
						if(!(null==rst4.getDate("WarrantyTill")))
						{
							try
							{
								sql5="select TO_DAYS('"+rst4.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
								ResultSet rst5 = st5.executeQuery(sql5);
								if(rst5.next())
								{
									if(rst5.getInt("days") > 0)
									{
										warranty = "YES";
									}
									else
									{
										warranty = "NO";
									}
								}
							}catch(Exception e)
							{
								warranty="-";
							}
						}
						else
						{
							sql6="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
							ResultSet rst6= st6.executeQuery(sql6);
							if(rst6.next())
							{
								if(rst6.getInt("days") > 365)
								{
									warranty = "NO";
								}
								else
								{
									warranty = "YES";
								}
							}
						}
					}
					else
					{
						sql7="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
						ResultSet rst7 = st7.executeQuery(sql7);
						if(rst7.next())
						{
							if(rst7.getInt("days") > 365)
							{
								warranty = "NO";
							}
							else
							{
								warranty = "YES";
							}
						}
					}
					
				}
				
						
//***************************************************************************

			int spcnt=0;
			
			sql8="select count(*) as cnt from t_techspecialrep where VehRegNo = '"+vehicleno+"' and Closed='No' ";
			ResultSet rst8 = st8.executeQuery(sql8);
			while(rst8.next())
			{
				spcnt = rst8.getInt("cnt");
			}
			
			%>
			
		
			<td><%=unitid%></td>
			<td><%=mobno%></td>
			<td><%=simno%></td>
			<td><%=peripheral%></td>
			<td><%=simcompany%></td>
			<td><%=instdate%></td>
			<td><%=warranty%></td>
			<td><%=spcnt %></td>
		
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
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</form>
</body>
</html>
