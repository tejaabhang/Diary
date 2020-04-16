<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Rep_history_Without_Warranty.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,strec;
String sql,sql1,sql2,sql3,sql4,today,olddate,username,userrole,today1;
String fromdate,todate,veh1,code1,dt1;
int Ocount;
int days=0;
%>

<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
String s=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Ocount=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	strec=conn.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	if(null==fromdate)
	{
		
		fromdate=today;
		todate=today;
	}
	
	%>
	
			<table border="0" width="750px" align="center">
				<tr>
				<td>
				<div align="center"><font color="brown" size="3">Unit Replacement Report For No Warranty Vehicles</font></div>
				</td>
				</tr>
			</table>	
			
				<table border="1" width="100%" class="sortable">
					<td>Sr.</td>
					<td>Veh Reg. No.</td>
					<td>Transporter</td>
					<td>Replace Date</td>
					<td>Old Unit</td>
					<td>New Unit</td>
					<td>Peripheral</td>
					<td>Replace Place</td>
					<td>Replace By</td>
					<td>First Inst. Date</td>
					<td>Old Unit Damaged</td>
					<td>Recieved Status</td>
					<td>Quick Test</td>
					
			<!-- Change 30 -->
					<td>Test Date</td>
					<td>SW Comment</td>
					<td>SW DebitNote</td>
					<td>Physical Damage</td>
					<td>Correction Done</td>
					<td>GPS Antenna OK</td>
					<td>Power Supply Fail</td>
			
					</tr>		
				<!-- till here -->	
					<%

					sql = "select * from t_unitreplacement where InstDate between '"+fromdate+"' and '"+todate+"' and 103.241.181.36 = 'rep'";
					int i=1;
					ResultSet rst=st2.executeQuery(sql);
					while(rst.next())
					{ 
						veh1 = rst.getString("VehRegNo");
						java.util.Date repdate=rst.getDate("EntDate");
						sql1 = "select * from t_vehicledetails where VehicleRegNumber='"+rst.getString("VehRegNo")+"'";
						ResultSet rst1=st3.executeQuery(sql1);
							while (rst1.next())
							{
								java.util.Date instdate=rst1.getDate("InstalledDate");
								sql2="select (TO_DAYS('"+repdate+"')-TO_DAYS('"+instdate+"'))";
								ResultSet rst2=st4.executeQuery(sql2);
								if(rst2.next())
								{
									days=rst2.getInt(1);
									
									
							        //int dysrem=365-days;
							        	if(days > 365)
											{
							        			
							        		//sql4="select EntDate from t_unitmasterhistory where EntDate >=  ";
							        			sql3="select * from hwunittest where UnitID='"+rst.getString("OldUnitID")+"' and Custdb='"+rst1.getString("OwnerName")+"' and TheDate >= '"+rst.getString("EntDate")+ "' ";
							        			ResultSet rst11=st.executeQuery(sql3);
							        		if(rst11.next())
							        		{
							        			
							        														
					%>
						<tr>
						
							<td> <%=i %> </td>
							<td> <%=rst1.getString("VehicleRegNumber")%></td>
							<td> <%=rst1.getString("OwnerName") %></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("EntDate"))) %></td>
							<td> <%=rst.getString("OldUnitID") %></td>
							<td> <%=rst.getString("NewUnitID") %></td>
							<td> <%=rst.getString("TypeUnit") %></td>
							<td> <%=rst.getString("InstPlace") %></td>
							<td> <%=rst.getString("InstBy") %></td>
							<td><%=rst1.getString("InstalledDate") %></td>
							<td> <%=rst.getString("OldUnitDamaged") %></td>
							
								<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							<td><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"><font color="Red" size="2"> Done</font></a> </td>	

						<!-- change 30 -->
						
						<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheDate"))) %></td>
							<td><%=rst11.getString("SWComment") %></td>	
							<td><%=rst11.getString("SWDebitNote") %></td>		
							<td><%=rst11.getString("Physicaldamage") %></td>
							<td><%=rst11.getString("Correctiondone") %></td>
							<td> <%=rst11.getString("GPSAnt") %></td>
							<td> <%=rst11.getString("PowerSuppFail") %></td>
							
						<!-- till here -->	
							
						</tr>
					<%	i++;
														}
														else
													{
														%>
														<tr>
						
							<td> <%=i %> </td>
							<td> <%=rst1.getString("VehicleRegNumber")%></td>
							<td> <%=rst1.getString("OwnerName") %></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("EntDate"))) %></td>
							<td> <%=rst.getString("OldUnitID") %></td>
							<td> <%=rst.getString("NewUnitID") %></td>
							<td> <%=rst.getString("TypeUnit") %></td>
							<td> <%=rst.getString("InstPlace") %></td>
							<td> <%=rst.getString("InstBy") %></td>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst1.getString("InstalledDate"))) %></td>
							
							<td> <%=rst.getString("OldUnitDamaged") %></td>
							
							<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							<td><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"> Not Done</a>  </td>	

				
							<!-- change 30 -->
						
							<td>-</td>
							<td>-</td>	
							<td>-</td>		
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							
						<!-- till here -->
						
						</tr>
													<%	i++;
													}
													
													
							        		
													}	
											}
								}
							
					}
					%>
									
						
					</table>
					
					<table border="2" width="750px" align="center" class="sortable">
										
					<tr>
					<td><font color="red"><b>Total Replacement</b></font></td>
					<td><font color="red"><b><% --i; %> <%=i%></b></font></td>
					
					
					</tr>					
					</table>	
					
	<%
	
//
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
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

</body>
</html>
