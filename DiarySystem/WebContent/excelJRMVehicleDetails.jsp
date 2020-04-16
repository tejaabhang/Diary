<%@ page contentType="application/vnd.ms-excel;" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="fullfleetexcel.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp" %>
<%!
final String SUPER_USER = "Superuser";
final String MANAGER = "Manager";
final String MIDDLE_WARE = "MiddleWare";
final String SERVICE = "service";
final String GROUP = "Group";
final String SALES = "sales";
final String DISPATCH = "dispatch";
final String SUPERADMIN = "SuperAdmin";
Connection conn,conn1;
Statement st,stmt3, stmtsp1,stmtsp11,stmtsp111,stmt1,stmt2,stmtsp, st1,st23, st2, st3,st4,st5,st6, st9, st11, st01, st12,stamc,stamc1 ,stwar1,stwar2,stwar3,stwar4;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8;
String transporter,InstalledPlace,InstPlace="N.A.",today,Svehlist,username,simno="-",mobno="-",vehiclecode,typeunit;
String instdate,warranty, expdate,simcomp="-",peripherals="-",Empname="",Instruction="",psno="",pcbno="",boxno="",batteryno="",WMSN="NA",CodeVersion="NA",UnitType="NA";
String sqlamc,sqlamc1,sqlamc2,sqlamc3,sqlamc4;
%>


<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css"/>
		<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		</style>
</head>
<body>
 
<!--- code start here ------>
<form name="fullfleet" method="post" action="" onSubmit="return validate();">
<%
	
	transporter=request.getParameter("transporter");
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
	miliseconds=miliseconds-1000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	today = formatter.format(defoultdate);
	Svehlist="(0";
	username=session.getAttribute("username").toString();
	String userrole=session.getAttribute("userrole").toString();
	 String typevalue=session.getAttribute("typevalue").toString();
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
 		stmt3=conn1.createStatement();
	}catch(Exception e)
		{
			out.print("Exception --->"+e);
		}
		
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td align="center">
				<font color="#2A0A12" size="3"><b>JRM Vehicles details</b></font>
			</td>
		</tr>
	</table>
	<br></br>
	<table border="1" align="center" width="750px" class="sortable">
		<tr  bgcolor="#BDBDBD">
			<td><b>Sr.</b></td>
			<td><b>JRM</b></td>
			<td><b>Vehicle No</b></td>
			<td><b>Transporter</b></td>
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
			<td><b>Warranty</b></td>
			<td><b>Last Rep. Date</b></td>    
			<td><b>Replacement Location</b></td>    
			<td><b>Sp. Comments</b></td>
			<td><b>Sp. Comment Desc.</b></td>
			<td><b>Extra Comment</b></td>
			<td><b>Date of Entry</b></td>
			<td><b>Entered By</b></td>
			
		</tr>
		<%
			
		try
		{
			int i=1, j=0;
			
			String us=username.toUpperCase();
			//System.out.println("transporter--->"+transporter);
			String sqlJRMVehicles="select * from db_gps.t_vehicledetails where Instruction='JRM' order by OwnerName";
			ResultSet rsJRMVehicles=stmt3.executeQuery(sqlJRMVehicles);
			while(rsJRMVehicles.next()){
				String bg="white",transp="";
				String instdte="-";
				String instdte1="", vhno;
				Double lat, lon;
				Double lat2, lon2; 
				String direction;
				String loc11;
				String msg1="";
				String grp="",insLocation, insdt, insdt1;
				String Vehcode=rsJRMVehicles.getString("VehicleCode");
				 Empname=rsJRMVehicles.getString("Empname");
				 Instruction=rsJRMVehicles.getString("Instruction");
				 if(rsJRMVehicles.getString("Status").equals("Removed"))
			 	{
			 		bg="red";
			 	}
			 	if(rsJRMVehicles.getString("Status").equals("Missing"))
			 	{
			 		bg="yellow";
			 	}
			 	if(rsJRMVehicles.getString("Status").equals("DeActivated"))
			 	{
			 		bg="lightgreen";
			 	}
			 	String unitid="",group1="", vehregno="";
				unitid=rsJRMVehicles.getString("UnitID");
				vehregno=rsJRMVehicles.getString("VehicleRegNumber");
				transp=rsJRMVehicles.getString("OwnerName");
				try{
				instdte=rsJRMVehicles.getString("InstalledDate");
				InstalledPlace=rsJRMVehicles.getString("InstalledPlace");
				}
				catch(Exception X)
				{
					instdte="-";
					InstalledPlace="-";
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
							instdte1=rsJRMVehicles.getString("InstalledDate");
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
		
				String msg="";
				int delaydays=0;
				int amc=0;
				String upddate=
			
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
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
				TXInterval=rsFTP.getInt("TXInterval");
			}
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
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
		 String sqlsp="select * from t_techspecialrep where ((VehRegNo='"+vehregno+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc Limit 1";
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
	<tr bgcolor='<%=bg%>'>
	<td align="right"><%=i%>  	 </td> 
	<td align="left"><%=Instruction%></td>
	<td width="100px" align="left"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=vehregno%></b>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	
	<%

if(bg.equals("red"))
{
		
	String remdate="", oldunitwith="", withtech="";
	 out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
	String sql9="select * from t_unitreplacement where VehRegNo='"+vehregno+"' or VehCode='"+vehregno+"' and InstType='Rem' order by EntDate desc";	
	ResultSet rs9=st9.executeQuery(sql9);	
	if(rs9.next())
	{
		unitid=rs9.getString("OldUnitId");
		remdate=rs9.getString("EntDate");
		oldunitwith=rs9.getString("OldUnitWith");
		withtech=rs9.getString("InstBy");
		//out.println("unitid");
		String sql11="select * from t_unitreplacement where VehRegNo='"+vehregno+"' and NewUnitID='"+unitid.trim()+"' ";
		
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
		String sql11="select * from t_unitreplacement where VehRegNo='"+vehregno+"' or VehCode='"+vehregno+"' order by InstDate desc limit 1";
		
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
		
		String sql9="select * from t_unitreplacement where VehRegNo='"+vehregno+"' or VehCode='"+vehregno+"' and InstType='DeActive' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
							
			String sql11="select * from t_unitreplacement where VehRegNo='"+vehregno+"' and NewUnitID='"+unitid.trim()+"' ";
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
	
	
	
	<tr><td><a href="addcomplaint.jsp?vid=<%=Vehcode%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="inspection.jsp?vid=<%=Vehcode%>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
	<!--  <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>

	<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr>-->

	
<%

if(typevalue.equals("transporter")){
	 %>
	     <tr>
			<td>
				<a href="repunit.jsp?vid=<%=Vehcode%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a>
			</td>
		</tr>
		<tr>
			<td> 
				<a href="techspcomment.jsp?vehno=<%=vehregno%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
			</td>
		</tr>
		
	 <%
 }else{

if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr><td><a href="repunit1.jsp?vid=<%=Vehcode%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
<%
}else
{ %>
	<tr><td><a href="repunit.jsp?vid=<%=Vehcode%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	
<%
} %>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
	 <tr>
		<td> <a href="remuittemp.jsp?veh=<%=vehregno%>"> Temp Removal </a> </td>
	</tr>
	 
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
{  %>	 
	<tr>
		<td><a href="editrecs.jsp?vid=<%=Vehcode%>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
	</tr>
	
	<tr>
		<td> <a href="DeactiveReq.jsp?veh=<%=vehregno%>"> Deactivation Req </a> </td>
	</tr>
<%
}  
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr>
		<td><a href="removeunit.jsp?veh=<%=vehregno%>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a></td>
	</tr>
<!-- 	<tr>
		<td>  <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=Vehcode%>&vehregno=<%=vehregno %>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> </td>
	</tr>
 -->
<%
}
%>  
<tr>
	<td> <a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('reprovisionnos.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>

<tr>
		<td> <a href="techspcomment.jsp?vehno=<%=vehregno%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
</tr>
<tr>
		<td> <a href="sendmail.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>


<tr>
		<td> <a href="vehexchange.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange </a> </td>
</tr>

<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr>
		<td> <a href="unitmissing.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Unit Missing</a> </td>
</tr>
<%
}%>
<%
								if(SUPERADMIN.equalsIgnoreCase(userrole)){
								%>
								<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								<%
								}}
							%>

	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	<td align="left"><%=transp %></td>
		<td align="left"><%=Empname %></td>
		<%
		sql="select * from t_onlinedata where VehicleCode='"+Vehcode+"' order by TheDate desc, TheTime desc";
		ResultSet rst1=st1.executeQuery(sql);
		
		if(rst1.next())
		{
			
			upddate=rst1.getString("TheDate");
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
%>
	<td align="right"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td align="left"><%=rst1.getString("Location")%>  <font color="red"> <%=msg %> </font>
<% 
		}else{
			%>
			<td align="right"><% try{
	out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(rsJRMVehicles.getDate("InstalledDate")));
	}catch(Exception e)
	{
		out.print("-");
	}	
	%></td>
	<td align="left"><%=rsJRMVehicles.getString("InstalledPlace")%> <font color="red"> In Active
			<%
			msg="In Active";
			 
			 if(bg.equals("red"))
			  { 
				//String remdate="";
				String remdate="", oldunitwith="", withtech="";
				String sql9="";
				
				     sql9="select * from t_unitreplacement where VehRegNo='"+rsJRMVehicles.getString("VehicleRegNumber")+"' and InstType='Rem' order by EntDate desc";
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
							String sql11="select * from t_unitreplacement where VehRegNo='"+rsJRMVehicles.getString("VehicleRegNumber")+"' order by InstDate desc limit 1";
								
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
			// System.out.println("display of colr");
		}
		%>
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
				
				<td align="left"><%=availdate %> </td>
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
	<td align="left"><%=CodeVersion%></td>
	<td align="right"><%=WMSN%></td>
	<td align="left"><%=UnitType%></td>
	<td align="left"><%=peripherals %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="left"><%=typeunit %></td>
	<%
	 }
	%>
	<td align="left"><%=simcomp %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="right"><%=psno %></td>
	<td align="right"><%=pcbno %></td>
	<td align="right"><%=boxno %></td>
	<td align="right"><%=batteryno %></td>
	<td align="left"><%=group1%></td>
	<%
	 }
	%>
	<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
	<td align="left"><%=InstalledPlace%></td>

	
	
	<td align="left"><%=warranty%></td>
	
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
	<td align="left"><%=InstPlace%></td>
<%

System.out.println("query-----");
int spcnt=0,spcnt2=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+vehregno+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and  `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";
//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp2=stmtsp111.executeQuery(sqlsp1);
	while(rssp2.next())
	{
		System.out.println("INside while");
	
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
	System.out.println("OUTside while");
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

	<td align="left"> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  </td>
	<td align="left"><%=spcmmnt %></td>
		<td align="left"><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td align="left"><%=Enteredby %></td>
	</tr>
				<input type="hidden" id="id<%=j%>" name="id<%=j%>" value="<%=Vehcode%>" />
				<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=vehregno%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" />
        <%
	i++;
        j++;
	
	
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

