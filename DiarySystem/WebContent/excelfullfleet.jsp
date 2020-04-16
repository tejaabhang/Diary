<%@ page contentType="application/vnd.ms-excel;" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="fullfleetexcel.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);

%>

<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, stmtsp1,stmtsp11,stmtsp111,stmt1,stmt2,stmtsp, st1,st23, st2, st3,st4,st5,st6, st9, st11, st01, st12,stamc,stamc1 ,stwar1,stwar2,stwar3,stwar4;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8;
String transporter,InstalledPlace,InstPlace="N.A.",today,Svehlist,username,simno="-",mobno="-",vehiclecode,typeunit;
String instdate,warranty, expdate,simcomp="-",peripherals="-",Empname="",Instruction="",psno="",pcbno="",boxno="",batteryno="",WMSN="NA",CodeVersion="NA",UnitType="NA",battrystatus ="NA",battrystatustime="NA";
String sqlamc,sqlamc1,sqlamc2,sqlamc3,sqlamc4;
String instby="-";
%>


<html>

<body>
 
<!--- code start here ------>
<form name="fullfleet" method="post" action="" onSubmit="return validate();">
<%
final String SUPER_USER = "Superuser";
final String MANAGER = "Manager";
final String MIDDLE_WARE = "MiddleWare";
final String SERVICE = "service";
final String GROUP = "Group";
final String SALES = "sales";
final String DISPATCH = "dispatch";
final String SUPERADMIN = "SuperAdmin";
final String userRole = session.getAttribute("userrole").toString();	
final String typevalue = session.getAttribute("typevalue").toString();
	transporter=request.getParameter("transporter");
	transporter=transporter.replace("...","&");
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
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
		stmtsp1=conn.createStatement();
		stmtsp111=conn.createStatement();
		stmtsp11=conn.createStatement();
		stmtsp=conn.createStatement();
		st01=conn.createStatement();
		st1=conn1.createStatement();
		st2=conn1.createStatement();
		st4=conn1.createStatement();
		st5=conn1.createStatement();
		st6=conn1.createStatement();
		st23=conn1.createStatement();
		st9=conn1.createStatement();
		st11=conn1.createStatement();
		st12=conn1.createStatement();
		stamc=conn1.createStatement();
		stamc1=conn1.createStatement();
 		stwar1=conn1.createStatement();
 		stwar2=conn1.createStatement();
		stwar3=conn1.createStatement();
 		stwar4=conn1.createStatement();
 		stmt1=conn1.createStatement();
 		stmt2=conn1.createStatement();
	}catch(Exception e)
		{
			out.print("Exception --->"+e);
		}
		// check transporter unit limit---------------
		int limit=0;
		Boolean flag=false;
		sql1="select Unitlimit from t_transporter where TypeValue='"+transporter+"' ";
		ResultSet rs1=stmt1.executeQuery(sql1);
		System.out.println("Unit :- "+sql1);
		if(rs1.next())
		{
			limit=rs1.getInt(1);
			//out.println("limit--"+limit);
		}
		else
		{
			flag=true;
		}
		int count=0,rem_unit=0;
		String str="select count(*) as count from t_vehicledetails where status <> 'Deleted' and OwnerName='"+transporter+"'";
		ResultSet rs2=stmt2.executeQuery(str);
		System.out.println("Unit 1:- "+str);
		if(rs2.next())
		{
			count=rs2.getInt("count");
			//System.out.println("count--"+count);
		}
		String alert="";
		rem_unit=limit-count;
	System.out.println("rem_unit--"+rem_unit);
		//-----------------------------------------------------------------------------------------------
		String userrole=session.getAttribute("userrole").toString();
		String inserted=request.getParameter("inserted");

%>
			<table border="0" width="750px" class="">
<%
			if(rem_unit!=0 && flag==false && count<limit)
			{
%>
				<tr>
					<td align="center" colspan="2"> 
						<center><font color="red" size="2.8"><b><blink><%=rem_unit %> Pending Installation</blink></b></font></center>
					</td>
				</tr>
<%
			} 
%>
				<tr>
					<td align="center" colspan="2"> 
						<center><font color="black" size="3"><b>Vehicle List of <%=transporter %> .</b></font></center>
					</td>
				</tr>
				
		</table>
		<p></p>
		<hr width="750px"></hr>

	<p></p>
	<hr width="750px"></hr>
	
	
	<table border="1" align="center" width="750px" class="sortable">
		
					
			<%
			   if(typevalue.equals("transporter")){
			%>
			<tr>
			<td><b>Sr.</b></td>
			<td><b>JRM</b></td>
			<td><b>Vehicle No</b></td>
			<td><b>Employee Name</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Veh Available Date</b> </td>
			<td><b>UnitID</b></td>
			<td><b>MobileNo</b></td>
			<td><b>SimNo</b></td>
			<td><b>Peripheral</b></td>
			<td><b>Sim Comp</b></td>
			<td><b>Inst On</b></td>
			<td><b>Inst Location</b></td>
			<td><b>Warranty</b></td>
			<td><b>Last Rep. Date</b></td>    
			<td><b>Replacement Location</b></td>    
			<td><b>Sp. Comments</b></td>
			<td><b>Sp. Comment Desc.</b></td>
			<td><b>Extra Comment</b></td>
			<td><b>Date of Entry</b></td>
			<td><b>Entered By</b></td>
			<td><b>Mains Status</b></td>
			<td><b>Mains StatusTime</b></td>
			
		</tr>
			<%	
			}else{
		%>
		<tr  bgcolor="#BDBDBD">
		<%
				if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ 
			%><td><div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"/></div> </td><%
		}
%>
			<td><b>Sr.</b></td>
			<td><b>JRM</b></td>
			<td><b>Vehicle No</b></td>
			<td><b>Employee Name</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Veh Available Date</b> </td>
			<td><b>UnitID</b></td>
			<td><b>MobileNo</b></td>
			<td><b>SimNo</b></td>
			<td><b>Tx.Intrval<br>(Min)</b></td>
			<td><b>St.Intrval<br>(Min)</b></td>
			<td><b>CodeVersion</b></td>
			<td><b>WMSN</b></td>
			<td><b>Tx.Type</b></td>
			<td><b>Peripheral</b></td>
			<td><b>Unit Type</b></td>
			<td><b>Sim Comp</b></td>
			<td><b>PS No</b></td>
			<td><b>PCB No</b></td>
			<td><b>Box No</b></td>
			<td><b>Battery No</b></td>
			<td><b>GPName</b></td>                                                                    
			<td><b>Inst On</b></td>
			<td><b>Inst Location</b></td>
			<td><b>Installed By</b></td>
			<td><b>Warranty</b></td>
			<td><b>Last Rep. Date</b></td>    
			<td><b>Replacement Location</b></td>    
			<td><b>Sp. Comments</b></td>
			<td><b>Sp. Comment Desc.</b></td>
			<td><b>Extra Comment</b></td>
			<td><b>Date of Entry</b></td>
			<td><b>Entered By</b></td>
			<td><b>Mains Status</b></td>
			<td><b>Mains StatusTime</b></td>
			
		</tr>
		<%
			}
		try
		{
			int i=1, j=0;
			String instdte="-";
			String instdte1="", vhno;
			Double lat, lon;
			Double lat2, lon2; 
			String direction;
			String loc11;
			String msg1="";
			String grp,insLocation, insdt, insdt1;
			String us=username.toUpperCase();
			System.out.println("transporter--->"+transporter);
			if(transporter.equalsIgnoreCase("Topsline") || transporter.equalsIgnoreCase("HPCL") || transporter.equalsIgnoreCase("Ujjain") )
			{
				System.out.println("in other options");
				int l=0;
				String simno1="-", mobno1="-", peripherals1="-", simcomp1="-",psno1="-",pcbno1="-",boxno1="-",batteryno1="-";
				String drivername="";
				int delaydays1=0;
				int amc1=0;
				String sqltuh="select * from t_onlinedataotherservers where Transporter like '"+transporter+"' order by TheDate desc";
				System.out.println(sqltuh);
				ResultSet rsttuh=st4.executeQuery(sqltuh);
				while(rsttuh.next())
				{
					
					String sqlbt="select * from t_onlinedata where Transporter like '"+transporter+"' order by TheDate desc";
					ResultSet battr=stmtsp.executeQuery(sql1);
					System.out.println(">>>sqlbt>>>>*******"+sqlbt);
				
					if(battr.next())
					{
						
						battrystatus =battr.getString("bcharging");
						battrystatustime =battr.getString("bdatetime");	
						
					}
					
					
					vhno=rsttuh.getString("VehicleRegNo");
					String upddate1=rsttuh.getString("TheDate");
					String bg2="";
					insdt=rsttuh.getString("InstDate");
				//	insLocation=rsttuh.getString("insLocation");
					String war;			
//******************************************For Getting Location******************************************				
//********************************************************************************************************				
				lat=rsttuh.getDouble("LatitudePosition");
				lon=rsttuh.getDouble("LongitudePosition");
				String sqlloc="SELECT city,lat,lon,((ACOS(SIN('"+lat+"' * PI() / 180) * SIN(lat * PI() / 180) + COS('"+lat+"' * PI() / 180) * COS(lat * PI() / 180) * COS(('"+lon+"' - lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_citylatlong order by  distance ASC limit 1";
				ResultSet rsloc=st2.executeQuery(sqlloc);
				if(rsloc.next())
				{ 
					String dst=""+rsloc.getDouble("distance");
					lat2=rsloc.getDouble("lat");
					lon2=rsloc.getDouble("lon");
					if(dst.length() >5)
					{
						dst=dst.substring(0,4);
					}
					double dist1=Double.parseDouble(dst);
					if(lat2 >lat)
					{
						direction="S";
					}
					else
					{
						direction="N";
					}
					if(lon2 > lon)
					{
						direction=direction+"E of";
					}
					else
					{
						direction=direction+"W of";
					}
					loc11=""+dist1+" kms "+direction+" "+rsloc.getString("city");
				}
				else
				{
					loc11="-";
				}

//******************************************End of Getting Location******************************************

//*************************************For Printing MSG With Location******************************************

			sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+rsttuh.getString("TheDate")+"') as days";
			ResultSet rsdate=st11.executeQuery(sql8);
			if(rsdate.next())
			{
					delaydays1=rsdate.getInt("days");
					if(delaydays1>7)
					{
						msg1="Device Disconnected";					
					}
			}

			String nogpschk="";
			try{
				nogpschk=loc11.substring(0,11);
			} catch(Exception e)
			{
				nogpschk=loc11;
			}
			if(nogpschk.equals("No GPS Data"))
			{
				msg1=msg1+" No GPS Data";
			}
	/*		String VehicleCode=rsttuh.getString("VehicleCode");
			if(VehicleCode!=null||VehicleCode!=""){
			String driver="SELECT  "+ 
			"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
		    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
		    "		( " +
		    "			SELECT vehid, startdate" +
		    "			FROM t_startedjourney " +
		    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
		    "			" +
		    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
			System.out.println(driver);
			
			ResultSet driver1=st11.executeQuery(driver);
			if(driver1.next()){
				drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
			}
			}*/
			sql8="select status,Empname,Instruction from t_vehicledetails where vehiclecode='"+rsttuh.getString("VehicleCode")+"'";
			System.out.println("sql8------>"+sql8);
			ResultSet rstrem=st2.executeQuery(sql8);
			if(rstrem.next())
			{
				Empname=rstrem.getString("Empname");
				Instruction=rstrem.getString("Instruction");
				// System.out.println("status--->"+rstrem.getString("Status"));
				 if(rstrem.getString("Status").equals("Removed"))
				{
					bg2="red";
				}
				if(rstrem.getString("Status").equals("Missing"))
				{
					bg2="yellow";
				}
				if(rstrem.getString("Status").equals("DeActivated"))
				{
					bg2="lightgreen";
				}
				
			}
 
%>

<% //---------------------------------------------%>
			<tr>
<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ 
%>
				<td> 
					<div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> 
				</td>
<%	
		}
%>
				<td align="right"><div align="right"><%=i%></div><input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=rsttuh.getString("VehicleRegNo")%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=rsttuh.getString("UnitID")%>" /></td> 
				<td align="left"><%=Instruction%></td>
				<td width="100px" align="left">><b><%=vhno%></b>
				</td>
		<!-- ----------------------------------------------------------------------------------------- -->		
				 <td align="left"><%=Empname %></td>
				<td align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttuh.getString("TheDate"))) %><br><%=rsttuh.getString("TheTime") %></br></td>
				<td><%=loc11 %><font color="red"><%=msg1 %></font></td>
					 
<%
				sql5="select * from t_unitmaster where UnitID='"+rsttuh.getString("UnitID")+"'";
				ResultSet rs5=st5.executeQuery(sql5);
				if(rs5.next())
				{	
					try{
							mobno1=rs5.getString("MobNo");
							simno1=rs5.getString("SimNo");
							typeunit=rs5.getString("InstType");
							simcomp1=rs5.getString("SimCompany");
							peripherals1=rs5.getString("Peripherals");
							psno1=rs5.getString("PSNo");
							pcbno1=rs5.getString("PCBNo");
							boxno1=rs5.getString("BoxNo");
							batteryno1=rs5.getString("BatteryNo");
						}catch(Exception e)
						{
							mobno1="-";
							simno1="-";
							simcomp1="-";
							typeunit="-";
							peripherals1="-";
						}
				}
				else
				{
					mobno1="-";
					simno1="-";
					simcomp1="-";
					typeunit="-";
					peripherals1="-";
				}
				String b="NA",stmin="NA";
				String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+rsttuh.getString("UnitID")+"'";
			
				System.out.println(sqlFTP);
				System.out.println("============After Query===============================");
				ResultSet rsFTP=st5.executeQuery(sqlFTP);
				System.out.println("===============After ResultSet=====================");
				if(rsFTP.next()){System.out.println("===============In If block===========");
					WMSN=rsFTP.getString("WMSN");
					int TXInterval=0,StInterval=0;
					if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
						
					}else{
					TXInterval=rsFTP.getInt("TXInterval");
					}
					if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
						
					}else{
					StInterval=rsFTP.getInt("StInterval");
					}
					CodeVersion=rsFTP.getString("CodeVersion");
					UnitType=rsFTP.getString("UnitType");
					if(CodeVersion.contains("AVL_LITE")){
						int aa=(TXInterval*500)/1000;
						int aSX=(StInterval*500)/1000;
						int bTemp=aa/60;
						int stminTemp=aSX/60;
						b=bTemp+"";
						stmin=stminTemp+"";
						System.out.println("b====>"+b);
					}else{
						int aa=(TXInterval*100)/1000;
						int aSX=(StInterval*100)/1000;
						int bTemp=aa/60;
						int stminTemp=aSX/60;
						b=bTemp+"";
						stmin=stminTemp+"";
						System.out.println("b====>"+b);
					}
				}
				String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
				sql="select * from t_complaints1 where VehicleNo='"+vhno+"' and Status <> 'Solved' ";
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
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </b></td>
			   				
<%		
				}
				else
				{ 
%>
				<td> No Complaint</td>		
<%	
				}
%>
				<td align="right"><%=rsttuh.getString("UnitID") %></td>
				<td align="right"><%=mobno1%></td>
				<td align="right"><%=simno1%></td>
				<td align="right"><%=b%></td>
				<td align="right"><%=stmin%></td>
				<td align="left"><%=CodeVersion%></td>
				<td align="right"><%=WMSN%></td>
				<td align="left"><%=UnitType%></td>
				<td align="left"><%=peripherals1%></td>
				<%
				 if(typevalue.equals("transporter")){
					 
				 }else{
				%>
				<td align="left"><%=typeunit %></td>
				<%
				 }
				%>
				<td align="left"><%=simcomp1%></td>
				<%
				 if(typevalue.equals("transporter")){
					 
				 }else{
				%>
				<td align="right"><%=psno1%></td>
				<td align="right"><%=pcbno1%></td>
				<td align="right"><%=boxno1%></td>
				<td align="right"><%=batteryno1%></td>
<%		
				 }	//********************************************For Getting Group***********************************
				String sqlgrp="select * from t_group where VehRegno='"+vhno+"'";
				//out.print(sql6);
				ResultSet rsgrp=st6.executeQuery(sqlgrp);
				if(rsgrp.next())
				{
					try{
							grp=rsgrp.getString("GPName");
						}
						catch(Exception X)
						{
							grp="None";
						}
				}
				else
				{
					grp="None";
				}
/******************column added for inst location by sujata***************************/
				String unitid1=rsttuh.getString("UnitID");
				//System.out.println("unitid1-----?>>"+unitid1);
				String sql23="select * from t_vehicledetails where UnitID='"+unitid1+"'";
				ResultSet rs23=st23.executeQuery(sql23);
				if(rs23.next())
				{
					InstalledPlace=rs23.getString("InstalledPlace");
				}else
				{
					InstalledPlace="N.A";
				}
//end of changes
//*******************************************Fro POPUP Menus************************************
				if(typevalue.equals("transporter")){
					 
				 }else{
%>
				<td align="left"><%=grp %></td>
				<%
				 }
				%>
				<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(insdt))%></td>
				<td align="left"><%=InstalledPlace%></td>
<%
				sql4="select * from t_onlinedataotherservers where VehicleRegNo='"+vhno+"' ";
				ResultSet rs4=stwar1.executeQuery(sql4);
				if(rs4.next())
				{
					//unitid=rs4.getString("UnitID");
					//vehregno=rs4.getString("VehicleRegNo");
					try{
						instdte=rs4.getString("InstDate");
						}
					catch(Exception X)
					{
						instdte="-";
					}
				sqlamc="select * from t_amchistory where VehNo = '"+vhno+"' order by NewDate desc limit 1";
				ResultSet rsamcc=stwar2.executeQuery(sqlamc);
				if(rsamcc.next())
				{
					if(!(null==rsamcc.getDate("WarrantyTill")))
					{
					try{	
						sqlamc1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
						ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
						if(rsamcc1.next())
						{
							if(rsamcc1.getInt("days") > 0)
							{
								warranty="Yes";
							}
							else
							{
								warranty="No";
							}
						}
						}
						catch(Exception X)
						{
							warranty="-";
						}
					}
					else
					{
						sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt+"') as days";
						ResultSet rst222=stwar3.executeQuery(sql4);
						if(rst222.next())
						{
							if(rst222.getInt("days") > 365)
								{
									warranty="NO";
								}
							else
							{
								warranty="YES";
							}
						}
					}
				}
				else
				{
				//out.println("Hiiiiiiiiiiiiiiii");
					insdt1=rs4.getString("InstDate");
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt1+"') as days";
					ResultSet rst222=stwar4.executeQuery(sql4);
					if(rst222.next())
					{
						if(rst222.getInt("days") > 365)
						{
							warranty="NO";
						}
						else
						{
							warranty="YES";
						}
					}
				}
			}
%>
				<td align="left"><%=warranty%></td>
				<td>
<%			//---------- Last replacement date
					//column added for replacement place
					String d1="N.A";
					InstPlace="N.A";
				  	sql="select * from t_unitreplacement where VehRegNo='"+vhno+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
					ResultSet rsgett=st6.executeQuery(sql);
					if(rsgett.next())
					{
						
						InstPlace=rsgett.getString("InstPlace");
						 d1=rsgett.getString("InstDate");
						if(d1=="0000-00-00"||d1=="-")
						{
							out.print(d1);
						}
						else
						{
							String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
							out.print(d2);
						}
					}
					else
					{
						out.print(d1);
					}
%>
				</td>
				<td align="left"><%=InstPlace %></td>
<%
					int spcnt=0,spcnt1=0,k=0;
					String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
					String unitid=rsttuh.getString("UnitID");
					String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+vhno+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc";
					//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
					ResultSet rssp1=stmtsp1.executeQuery(sqlsp1);
					while(rssp1.next())
					{
						spcnt++;
						//System.out.println(spcnt);
						// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
						String cmntype=rssp1.getString("cmmt_type");
						if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
						{
							spcmmnt=rssp1.getString("SpComment");
							extracmnt=rssp1.getString("Extra_comment");
							Entrydt=rssp1.getString("EntDateTime");
							Enteredby=rssp1.getString("EntBy");
							k++;
						}
				//---------------------------------------
					}
						/*if(rssp1.next())
						{
							spcnt1=0;
							spcnt1=rssp1.getInt("cnt");
						}
							
					String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vhno+"' and cmmt_type='Vehicle' and Closed='No' ";
					//out.print(sql10);
					ResultSet rs10=st.executeQuery(sql10);
					while(rs10.next())
					{
						spcnt=rs10.getInt("cnt");	
					}
					spcnt=spcnt+spcnt1;*/
%>
    
				<td align="left"> 
					<a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID") %>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  
				</td>
		  	    <td align="left"><%=spcmmnt %></td>
				<td align="left"><%=extracmnt %></td>
<%				if(!Entrydt.equals("N.A"))
				{
%>
				<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
<%
				}else{
%>
				<td align="right"><%=Entrydt %></td>
<%
				} 
%>
				<td align="left"><%=Enteredby %>
				
				<td align="left"><%=battrystatus %>
				<td> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=vhno%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" /></td>
			</tr>

				<%
				i++;
		        j++;

			}

		}
		
		else
		{
		System.out.println("in else statement");
		String drivername="";
		if(session.getAttribute("userrole").toString().equals("Group"))
		{
			System.out.println("in Group");
			if(us.equals("CASTROL"))
			{
				sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
			}
			else
			{
				sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
			}
		}else
		{
			System.out.println("in Transporter ");
			
			if(transporter.equalsIgnoreCase("Vehall"))
			 {
					sql="select *  from t_vehicledetails order by ownername "; 
				 
			 }else{
				 
					sql="select *  from t_vehicledetails where OwnerName='"+transporter+"'"; 
				 
			 }
		}
		
			ResultSet rst=st1.executeQuery(sql);
			
			System.out.println("Sql  :- "+sql);
			while(rst.next())
			{
				Svehlist=Svehlist+","+rst.getString("VehicleCode");
			}
			Svehlist=Svehlist+")"; 
	//out.print(Svehlist);
	
	
			sql="select * from t_onlinedata where Transporter='"+transporter+"' and VehicleCode in "+Svehlist+" order by TheDate desc, TheTime desc";
			ResultSet rst1=st1.executeQuery(sql);
	//int i=1, j=0;
		
			String Vehcode="",unitid="",group1="", vehregno="";
			while(rst1.next())
			{
				String bg="", msg="";
				int delaydays=0;
				int amc=0;
				
				String upddate=rst1.getString("TheDate");
				String loc=rst1.getString("Location");
				battrystatus =rst1.getString("bcharging");
				battrystatustime =rst1.getString("bdatetime");
				
		/*		String VehicleCode=rst1.getString("VehicleCode");
				if(VehicleCode!=null||VehicleCode!=""){
				String driver="SELECT  "+ 
				"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
			    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
			    "		( " +
			    "			SELECT vehid, startdate" +
			    "			FROM t_startedjourney " +
			    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
			    "			" +
			    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
				System.out.println(driver);
				
				ResultSet driver1=st11.executeQuery(driver);
				if(driver1.next()){
					drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
				}
				} */
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
		
	 sql8="select status,Empname,Instruction from t_vehicledetails where vehiclecode='"+rst1.getString("VehicleCode")+"'";
 //System.out.println("sql8------>"+sql8);
	 ResultSet rstrem=st2.executeQuery(sql8);
	 if(rstrem.next())
	 {
	 	
		 Empname=rstrem.getString("Empname");
		 Instruction=rstrem.getString("Instruction");
		 if(rstrem.getString("Status").equals("Removed"))
	 	{
	 		bg="red";
	 	}
	 	if(rstrem.getString("Status").equals("Missing"))
	 	{
	 		bg="yellow";
	 	}
	 	if(rstrem.getString("Status").equals("DeActivated"))
	 	{
	 		bg="lightgreen";
	 	}
	 	
	 }
	 
	
	 
	 //--------------------------------------- special comment color for row--------------------
	/* int spcnt1=0;
	 	String sqlsp="select count(*) as cnt from t_techspecialrep where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle' and Closed='No' ";
		ResultSet rssp=stmtsp.executeQuery(sqlsp);
		if(rssp.next())
		{
			spcnt1=rssp.getInt("cnt");
			
		}
		if(spcnt1 > 0)
		{
			System.out.println("inside vehicle");
		
			bg="lightBlue";
		}
		else
		{
			
		System.out.println("unit id--"+rst1.getString("UnitID"));
		
		int spcnt=0;
		sqlsp="select count(*) as cnt from t_techspecialrep where UnitId = '"+rst1.getString("UnitID")+"' and Closed='No' and cmmt_type='Unit' ";
	 	ResultSet rssp1=stmtsp.executeQuery(sqlsp);
		if(rssp1.next())
		{
			
			spcnt=rssp1.getInt("cnt");
		}
		
		if(spcnt > 0)
		{System.out.println("inside unit");
			bg="#F6FDD0";
		}
		}*/
	//-------------------------------------------------------------------------------------------------------------
		Vehcode=rst1.getString("VehicleCode");
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"'";
		
		ResultSet rs4=st4.executeQuery(sql4);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
		//	System.out.println("unitid-->"+unitid);
			vehregno=rs4.getString("VehicleRegNumber");
			try{
			instdte=rs4.getString("InstalledDate");
		//	System.out.println("InstalledDate---->"+instdte);
			InstalledPlace=rs4.getString("InstalledPlace");
			instby=rs4.getString("InstalledBy");//Added By Veena for installed by 
		//	System.out.println("InstalledPlace---->"+InstalledPlace);
			}
			catch(Exception X)
			{
				instdte="-";
				InstalledPlace="-";
				instby="-";
			}
			
			sqlamc="select * from t_amchistory where VehCode = '"+Vehcode+"' order by NewDate desc limit 1";
			ResultSet rsamc=stamc.executeQuery(sqlamc);
			if(rsamc.next())
			{
				if(!(null==rsamc.getDate("WarrantyTill")))
				{
				try{	
				sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
				ResultSet rsamc1=stamc1.executeQuery(sqlamc1);
				if(rsamc1.next())
				{
					if(rsamc1.getInt("days") > 0)
					{
						warranty="Yes";
					}
					else
					{
						warranty="No";
					}
				}
				}
				catch(Exception X)
				{
					warranty="-";

				}
				}
				
				
				else
				{
					
					
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
					ResultSet rst222=st4.executeQuery(sql4);
					if(rst222.next())
					{
						
						if(rst222.getInt("days") > 365)
								{
							warranty="NO";
								}
						else
						{
							warranty="YES";
						}
					}
				}
			}
			else
			{
					try{
						instdte1=rs4.getString("InstalledDate");
						}
						catch(Exception X)
						{
							instdte1="-";
						}	
				sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte1+"') as days";
				ResultSet rst222=st4.executeQuery(sql4);
				if(rst222.next())
				{
					if(rst222.getInt("days") > 365)
							{
						warranty="NO";
							}
					else
					{
						warranty="YES";
					}
				}
				
				
				
			}	
	
		}
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			typeunit=rs5.getString("InstType");
			simcomp=rs5.getString("SimCompany");
			peripherals=rs5.getString("Peripherals");
			psno=rs5.getString("PSNo");
			pcbno=rs5.getString("PCBNo");
			boxno=rs5.getString("BoxNo");
			batteryno=rs5.getString("BatteryNo");
			
		} 
		String b="NA",stmin="NA";
		String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+unitid+"'";
		System.out.println(sqlFTP);
		System.out.println("Hi....line no 1017");
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
			    try{
				TXInterval=rsFTP.getInt("TXInterval");}
			    catch(Exception e){TXInterval=0;}
			}
			if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
				
			}else{
			try{	
			StInterval=rsFTP.getInt("StInterval");}
			catch(Exception e){StInterval=0;}
				
			
			
			}
			CodeVersion=rsFTP.getString("CodeVersion");
			UnitType=rsFTP.getString("UnitType");
			if(CodeVersion.contains("AVL_LITE")){
				int aa=(TXInterval*500)/1000;
				int aSX=(StInterval*500)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}else{
				int aa=(TXInterval*100)/1000;
				int aSX=(StInterval*100)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}
		}
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		//System.out.println(sql6);
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
		
		
		 //---------------------------------------------------------------------------------------------------------
		 String  spcnmttype="";
		 String sqlsp="select * from t_techspecialrep where ((VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc Limit 1";
		//String sqlsp="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
	//	System.out.println(sqlsp);
		ResultSet rssp=stmtsp.executeQuery(sqlsp);
		if(rssp.next())
		{
			spcnmttype=rssp.getString("cmmt_type");
			
		}
		if(spcnmttype.equalsIgnoreCase("Vehicle"))
		{
		//	System.out.println("inside vehicle");
		
			bg="lightBlue";
		}
		else if(spcnmttype.equalsIgnoreCase("Unit"))
		{
			bg="#F6FDD0";
		}
			
		
	%>
	<tr>
	<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ %>
				<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
	<%	}
	%>
	<td align="right"><%=i%>  	 </td> 
	<td><%=Instruction%></td>
	<td width="100px"><b><%=rst1.getString("VehicleRegNo")%></b>
	
	
	<%

if(bg.equals("red"))
{
		
	String remdate="", oldunitwith="", withtech="";
	 out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
	String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
	ResultSet rs9=st9.executeQuery(sql9);	
	if(rs9.next())
	{
		unitid=rs9.getString("OldUnitId");
		remdate=rs9.getString("EntDate");
		oldunitwith=rs9.getString("OldUnitWith");
		withtech=rs9.getString("InstBy");
		//out.println("unitid");
		String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
		
		ResultSet rs11 = st11.executeQuery(sql11);
		
		if(rs11.next())
		{
			simno=rs11.getString("MobNo");
			mobno=rs11.getString("SimNo");
			//remdate=rs11.getString("EntDate");
		}
		
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
}


	if(bg.equals("lightgreen"))
	{
		
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
							
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
			ResultSet rs11 = st11.executeQuery(sql11);
			//out.println(sql11);
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
			}
		}
		
	}

%>
	</td>
		<td><%=Empname %></td>
	<td align="right"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
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
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
			remdate=rs9.getString("EntDate");
			oldunitwith=rs9.getString("OldUnitWith");
			withtech=rs9.getString("InstBy");
			//out.println("unitid");
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
			
			ResultSet rs11 = st11.executeQuery(sql11);
			
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
				//remdate=rs11.getString("EntDate");
			}
			
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
		if(oldunitwith.equals("Tech"))
		{
			oldunitwith=withtech;			
		}
		try{
		out.print(" <font color='yellow' size='2'> on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+" Unit with:"+oldunitwith+"</font>");
		} catch(Exception e)
		{
			out.print(" <font color='yellow' size='2'> on (date not available)</font>");			
		}

	 } %> </td>

	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
		sql="select * from t_complaints1 where VehicleNo='"+vehregno+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			DetDesc=rscomp.getString("CDescription");
			compdate=rscomp.getString("TdyDate");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' order by DofAllocation Desc";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
					//compdate=rsallocto.getString("DofAllocation");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
			
	//--------------------------------------------------------	
			
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
				
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?compdate=<%=compdate %>&attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>&DetDesc=<%=DetDesc %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate))%> </B></td>
				   
			<%	
			}catch(Exception e){
				
			out.println("-");
				
				
			}
			}
	//--------------------------------------------------	
			
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	
	<td align="right"><%=unitid%></td>
	<td align="right"><%=simno%></td>
	<td align="right"><%=mobno%></td>
	<td align="right"><%=b%></td>
	<td align="right"><%=stmin%></td>
	<td><%=CodeVersion%></td>
	<td><%=WMSN%></td>
	<td><%=UnitType%></td>
	<td><%=peripherals %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td><%=typeunit %></td>
	<%
	 }
	%>
	<td><%=simcomp %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="right"><%=psno %></td>
	<td align="right"><%=pcbno %></td>
	<td align="right"><%=boxno %></td>
	<td align="right"><%=batteryno %></td>
	<td><%=group1%></td>
	<%
	 }
	%>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
	<td><%=InstalledPlace%></td>

	<td><%=instby%></td>
	
	<td><%=warranty%></td>
	
<td>
	<%			//---------- Last replacement date
	String d1="N.A";
	InstPlace="N.A";
  	sql="select * from t_unitreplacement where VehRegNo='"+vehregno+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
  //	System.out.println("sql---->"+sql); 
  	ResultSet rsgett=st6.executeQuery(sql);
	if(rsgett.next())
	{
		InstPlace=rsgett.getString("InstPlace");
		d1=rsgett.getString("InstDate");
		//System.out.println("date---->"+d1); 
		//System.out.println("InstPlace----"+InstPlace); 
		if(d1=="0000-00-00"||d1=="-")
		{
			out.print(d1);
		}
		else
		{
			String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
			out.print(d2);
		}
	}
	else
	{
		out.print(d1);
	}

	%>
	</td>

	<%
	//String sql23="select * from t_unitreplacement where VehRegNo='"+vehregno+"'and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
	//ResultSet rst23=st23.executeQuery(sql23);
	//while(rst23.next())
	//{
//		InstPlace=rst23.getString("InstPlace");
		
//	}
//	 %>
	<td><%=InstPlace%></td>
<%

//System.out.println("query-----");
int spcnt=0,spcnt2=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+rst1.getString("VehicleRegNo")+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and  `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";
//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp2=stmtsp111.executeQuery(sqlsp1);
	while(rssp2.next())
	{
		//System.out.println("INside while");
	
		spcnt++;

		// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
	
		String cmntype=rssp2.getString("cmmt_type");
		
		if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
		{
			spcmmnt=rssp2.getString("SpComment");
			extracmnt=rssp2.getString("Extra_comment");
			Entrydt=rssp2.getString("EntDateTime");
			Enteredby=rssp2.getString("EntBy");
			k++;
		}
		//---------------------------------------
		
	}
	//System.out.println("OUTside while");
/*if(rssp1.next())
{
	spcnt2=0;
	spcnt2=rssp1.getInt("cnt");
}
	String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' ";
	//out.print(sql10);
	ResultSet rs10=st.executeQuery(sql10);
	while(rs10.next())
	{
		spcnt=rs10.getInt("cnt");	
	}
	spcnt=spcnt+spcnt2;*/
%>

	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  </td>
	<td><%=spcmmnt %></td>
		<td><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
		<td>  <%=battrystatus%>	  </td>
	   <%try{
		  	%>
		   <td> <%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	 </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
		
		
		
		
	</tr>
				<input type="hidden" id="id<%=j%>" name="id<%=j%>" value="<%=rst1.getString("VehicleCode")%>" />
				<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=rst1.getString("VehicleRegNo")%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" />
        <%
	i++;
        j++;
	}
	
			if(session.getAttribute("userrole").toString().equals("Group"))
			{
				System.out.println("in Group");
				if(us.equals("CASTROL"))
				{
					sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
				}
				else
				{
					sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
				}
			}else
			{
				System.out.println("in Transporter ");
				
				if(transporter.equalsIgnoreCase("Vehall"))
				 {
						sql="select *  from t_vehicledetails order by ownername "; 
					 
				 }else{
					 
					 sql="select * from t_vehicledetails where ownername='"+transporter+"' and VehicleCode not in (select VehicleCode from t_onlinedata where Transporter='"+transporter+"')"; 
					 
				 }
			}
			
	
	
	ResultSet rst3=st1.executeQuery(sql);
	
	System.out.println("New Query :- "+sql);
	while(rst3.next())
	{
	//System.out.println("Inside t_vehicledetails ");	
	
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
		String VehicleRegNumber=rst3.getString("VehicleRegNumber");
		System.out.println(Vehcode);
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"' ";
		ResultSet rs4=st4.executeQuery(sql4);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
			Instruction=rs4.getString("Instruction");
			try{
				instdte=rs4.getString("InstalledDate");
				//instby=rs4.getString("InstalledBy");//Added By veena For installed by
				}
				catch(Exception X)
				{
					instdte="-";
				}
				//out.println(instdte);
				
				if(instdte.equals("-"))
				{
					instdte="-";
				}
				else
				{
					instdte=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte));
				}
				System.out.println(instdte);
				
				
				sqlamc="select * from t_amchistory where VehCode = '"+Vehcode+"' order by NewDate desc limit 1";
				ResultSet rsamc=stamc.executeQuery(sqlamc);
				System.out.println(sqlamc);
				if(rsamc.next())
				{
					if(!(null==rsamc.getDate("WarrantyTill")))
					{
					try{	
					sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
					ResultSet rsamc1=stamc1.executeQuery(sqlamc1);
					if(rsamc1.next())
					{
						//out.print(rsamc1.getInt("days"));
						if(rsamc1.getInt("days") > 0)
						{
							warranty="YES";
						}
						else
						{
							warranty="NO";
							//expdate="NA";
						}
					}
					}
					catch(Exception X)
					{
						warranty="-";
					}
					}
					else
					{
						
						
						sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
						ResultSet rst222=st4.executeQuery(sql4);
						if(rst222.next())
						{
							
							if(rst222.getInt("days") > 365)
									{
								warranty="NO";
									}
							else
							{
								warranty="YES";
							}
						}
					}
					
				}
				else
				{
						try{
							instdte1=rs4.getString("InstalledDate");
							}
							catch(Exception X)
							{
								instdte1="-";
							}	
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte1+"') as days";
					ResultSet rst222=st4.executeQuery(sql4);
					if(rst222.next())
					{
						if(rst222.getInt("days") > 365)
								{
							warranty="NO";
								}
						else
						{
							warranty="YES";
						}
					}
					
					
					
				}
		}
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		System.out.println(sql5);
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			typeunit=rs5.getString("InstType");
			simcomp=rs5.getString("SimCompany");
			peripherals=rs5.getString("Peripherals");
			psno=rs5.getString("PSNo");
			pcbno=rs5.getString("PCBNo");
			boxno=rs5.getString("BoxNo");
			batteryno=rs5.getString("BatteryNo");
		}
		String b="NA",stmin="NA";
		String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+unitid+"'";
		System.out.println(sqlFTP);
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			
			
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-") || rsFTP.getString("TXInterval").equalsIgnoreCase("www")){
				
			}else{
			TXInterval=rsFTP.getInt("TXInterval");
			}
			
			
			if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
				
			}else{
			StInterval=rsFTP.getInt("StInterval");
			}
			CodeVersion=rsFTP.getString("CodeVersion");
			UnitType=rsFTP.getString("UnitType");
			if(CodeVersion.contains("AVL_LITE")){
				int aa=(TXInterval*500)/1000;
				int aSX=(StInterval*500)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}else{
				int aa=(TXInterval*100)/1000;
				int aSX=(StInterval*100)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}
		}
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		System.out.print(sql6);
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
	<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ %>
		
				<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
	<%	}
	%>
	<td align="right"><%=i%> </td>
	<td><%=Instruction%> </td>
	<td><b><%=VehicleRegNumber%></b>
	
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
				System.out.println(sql9);	
			
	 }
 
	if(bg1.equals("lightgreen"))
	{
		
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' or VehCode='"+rst3.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
							
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and NewUnitID='"+unitid.trim()+"' ";
			ResultSet rs11 = st11.executeQuery(sql11);
			//out.println(sql11);
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
				simcomp=rs11.getString("SimCompany");
				peripherals=rs11.getString("Peripherals");
			}
		}
		System.out.println(sql9);
	}
	System.out.println(simno);
	 %>

	
	
	
		  <td><%=Empname %></td>
	<td><% try{
	out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(rst3.getDate("InstalledDate")));
	}catch(Exception e)
	{
		out.print("-");
	}	
	%></td>
	

	
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
		
			
			
	  
	 }
	 System.out.println("display of colr");%>
	  </font></td>

	 <%
	String compdate1="", attloc1="", availdate1="", allocatedto1="", desc1="", contpers1="", entby1="", DetDesc1;
	sql="select * from t_complaints1 where VehicleNo='"+rst3.getString("VehicleRegNumber")+"' and Status <> 'Solved' ";
	ResultSet rscomp1=st.executeQuery(sql);
	 System.out.println("displa--->"+sql);
	if(rscomp1.next())
	{
		compdate1=rscomp1.getString("TdyDate");
		attloc1=rscomp1.getString("VehAttLoc");
		availdate1=rscomp1.getString("VehAvailDate");
		allocatedto1=rscomp1.getString("Status");
		desc1=rscomp1.getString("Complaint");
		contpers1=rscomp1.getString("ContDets");
		entby1=rscomp1.getString("RegBy");
		DetDesc1=rscomp1.getString("CDescription");
		
		if(allocatedto1.equals("Allocated") || allocatedto1.equals("Attended"))
		{
			sql="select * from t_callocation1 where Tno='"+rscomp1.getString("Tno")+"' ";
			ResultSet rsallocto1=st01.executeQuery(sql);
			if(rsallocto1.next())
			{
				allocatedto1=rsallocto1.getString("Technicion");
			}
			else
			{
				allocatedto1="Unallocated";
			}
				
		}
	%>
			<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc1 %>&availdate=<%=availdate1 %>&allocatedto=<%=allocatedto1 %>&desc=<%=desc1 %>&contpers=<%=contpers1 %>&entby=<%=entby1 %>&DetDesc=<%=DetDesc1 %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate1))%> </B></td>
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	 System.out.println("step4");
	 System.out.println("============date ========="+instdte);
	%> 
	<td align="right"><%=unitid%></td>
	<td align="right"><%=simno%></td>
	
	<td align="right"><%=mobno%></td>
	<td align="right"><%=b%></td>
	<td align="right"><%=stmin%></td>
	<td><%=CodeVersion%></td>
	<td align="right"><%=WMSN%></td>
	<td><%=UnitType%></td>
	<td><%=peripherals %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td><%=typeunit%></td>
	<%
	 }
	%>
	<td><%=simcomp %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="right"><%=psno %></td>
	<td align="right"><%=pcbno %></td>
	<td align="right"><%=boxno %></td>
	<td align="right"><%=batteryno %></td>
	<td><%=group1%></td>
	<%
	 }
	%>
	<td align="right">
	<%=instdte%></td>
	<td><%=InstalledPlace%></td>
	<%-- <td><%=instby%></td> --%>
	
	
	<td><%=warranty%></td>
	
		
<td>
	<%			//---------- Last replacement date
	 System.out.println("step5");
	String d1="N.A";
  	sql="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
	ResultSet rsgett=st6.executeQuery(sql);
	if(rsgett.next())
	{
		 d1=rsgett.getString("InstDate");
		 
		if(d1=="0000-00-00"||d1=="-")
		{
			out.print(d1);
		}
		else
		{
			String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
			out.print(d2);
		}
	}
	else
	{
		out.print(d1);
	}
	 System.out.println("step6");

	%>
	</td>
	<td></td>
<%
	int spcnt=0,spcnt1=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";

//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc";
//System.out.println(sqlsp1);
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp11=stmtsp11.executeQuery(sqlsp1);
while(rssp11.next())
{
	
//System.out.println("INside while");
	spcnt++;
	// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
	
	String cmntype=rssp11.getString("cmmt_type");

	if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
	{
		spcmmnt=rssp11.getString("SpComment");
		extracmnt=rssp11.getString("Extra_comment");
		Entrydt=rssp11.getString("EntDateTime");
		Enteredby=rssp11.getString("EntBy");
		k++;
	}
	//---------------------------------------
	
	//spcnt1=rssp1.getInt("cnt");
}
//System.out.println("OUTside while");
	/*String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' ";
	//out.print(sql10);
	ResultSet rs10=st.executeQuery(sql10);
	while(rs10.next())
	{
		spcnt=rs10.getInt("cnt");	
	}
	spcnt=spcnt+spcnt1;*/
%>
		
		<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=rst3.getString("VehicleRegNumber")%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="black" size="2"> Click (<%=spcnt%>)</font></b></a>  </td>
		<td><%=spcmmnt %></td>
		<td><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
		<td>  <%=battrystatus%>	  </td>
	   <%try{
		  	%>
		   <td> <%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	 </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
		
		
		
		
		
		</tr>		
		<%
		i++;
		j++;
	}	
		}
	%>
	
		<input type="hidden" name="cntr" value="<%=i%>" />	
<%	
}catch(Exception e)
{
	e.printStackTrace();
}
finally
{
conn.close();
conn1.close();
}
%>
<%
if(typevalue.equals("transporter")){
	
}else{
	
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
	{ 
	
	%>	
<tr>
		<td align="center" colspan="28"> 
			<div align="center"> 
				<input type="submit" name="submit" value="Change AMC" class="formElement" onclick="changeAction();"/>
				<input type="submit" name="submit" value="Per Removal" class="formElement" onclick="permremoval();"/>
				 <input type="submit" name="submit" value="Temporary Remove" class="formElement" onclick="tempremoval();"/> 
				 <input type="submit" name="submit" value="Deactivation" class="formElement" onclick="deactive();"/>
				 <input type="submit" name="submit" value="UnitMissing" class="formElement" onclick="unitmissing();"/>
				  <input type="submit" name="submit" value="AddEditEmp" class="formElement" onclick="addeditemp();"/>
				   <input type="submit" name="submit" value="AddGroup" class="formElement" onclick="addgroup();"/>
				   <input type="submit" name="submit" value="DeleteGroup" class="formElement" onclick="deletegroup();"/>
			</div> </td>
	</tr>
<%  } }%>	
	</table>
	 
<input type="hidden" name="transporter" value="<%=transporter %>" />	
	
</table>

<!-- code end here --->
</form>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright ? 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>

