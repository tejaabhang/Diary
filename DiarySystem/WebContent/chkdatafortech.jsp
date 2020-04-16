<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
Statement stmt1,st,st3,stmt2, stmt4, stmtsp , stmtsp1, stmtuid , stmtrem;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null, rs5=null, rssp=null,rssp1=null;

Statement stwar1,stwar2,stwar3,stwar4;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>

<script language="javascript">
function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}


</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

</style>

	
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
<%@ include file="headertech.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	stmt2=con1.createStatement();	
	st=con1.createStatement();
	st3=con1.createStatement();
	stmt4=con1.createStatement();
	stmtsp=con2.createStatement();
	stmtsp1=con2.createStatement();
	stmtuid=con1.createStatement();
	stmtrem=con1.createStatement();
	
	stwar1=con1.createStatement();
	stwar2=con1.createStatement();
	stwar3=con1.createStatement();
	stwar4=con1.createStatement();
	String sql1="",sql="",sql2="",sql3="", sql4="", sql5="",sqlsp="";
	String getunit="",vehiclecode="",  simcompany="-",priphe="-";
	String transporter="",instdate="",instloc="",instby="",simcomp="",peripherals="";
	String sqlwar1="",sqlwar2="",sqlwar3="",sqlwar4="";
	int spcnt=0;
	int spcnt1=0;
	String rad=request.getParameter("VehUnit");
		
	String unitwarranty="", warranty="";	
	String instdte="-";
	String instdte1="", vhno="";
	Double lat=0.0, lon=0.0;
	Double lat2=0.0, lon2=0.0; 
	String direction="";
	String loc11="";
	String bg2="", msg1="";
	String grp="", insdt="", insdt1="";

%>		
		
		<table border="5" width="750px" align="center" class="sortable">
		<tr>
		<td width="68px"> <div align="center"><b> Flag</b></div></td>
		<td width="68px"> <div align="center"><b> Sr. No.</b></div></td>
		
		<td width="68px"><div align="center"><b>Vehicle No.</b></div></td>
		<td width="68px"><div align="center"><b>Last Date</b></div></td>
		<td width="68px"> <div align="center"><b>Last Location</b></div></td>
		<td width="68px"> <div align="center"><b> Unit Id</b></div></td>
		<td width="68px"><div align="center"><b>Trans -porter</b></div></td>
		<td width="68px"><div align="center"><b>Mobile No</b></div></td>
		<td width="68px"><div align="center"><b>Sim No</b></div></td>
		<td width="68px"><div align="center"><b>Peripherals</b></div></td>
		<td width="68px"><div align="center"><b>Sim Company</b></div></td>
		<td width="68px"><div align="center"><b>Group</b></div></td>
		<td width="68px"><div align="center"><b>First Inst. Date</b></div></td>
		<td width="68px"><div align="center"><b>Inst. By</b></div></td>
		<td width="68px"><div align="center"><b>Inst. Place</b></div></td>
		<td width="68px"><div align="center"><b>Last Rep. Date</b></div></td>
		<td width="68px"><div align="center"><b>In Warranty</b></div></td>
		
		</tr>
<% 	
if(!(null==request.getParameter("srchbx")))
{
   getunit=request.getParameter("srchbx");

	//System.out.println(getunit);
   int i=1;
	String bg="", msg="";

   if(rad.equals("Vehicle"))	
   {	
   	sql1="select * from t_onlinedata where VehicleRegNo like '%"+getunit+"%' order by concat(TheDate,TheTime) desc";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
		String groupname="", vehid="", warrantydate="";
		String vehno=rs1.getString("VehicleRegNo");
		String unitid=rs1.getString("UnitID");
		transporter=rs1.getString("Transporter");
		String mobno="-", simno="-";
		sql4="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		rs4=stmt4.executeQuery(sql4);
		if(rs4.next())
		{
			vehid=rs4.getString("VehicleCode");
			warrantydate=rs4.getString("InstalledDate");
			sql2="select * from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
			ResultSet unitmob=stmt2.executeQuery(sql2);
			if(unitmob.next())
			{
				mobno=unitmob.getString("MobNo"); 
				simno=unitmob.getString("SimNo");
				simcompany=unitmob.getString("SimCompany");
				priphe=unitmob.getString("Peripherals");
			}	
			else
			{
				mobno="-";
				simno="-";
			}
			if(rs4.getString("Status").equals("Removed"))
		 	{
		 		bg="red";
		 		
		  //****************************************************************************
		 
       	String sqluid="select * from t_unitreplacement where VehRegNo='"+rs4.getString("VehicleRegNumber")+"' or VehCode='"+rs4.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
		ResultSet rsuid=stmtuid.executeQuery(sqluid);	
		if(rsuid.next())
		{
			unitid=rsuid.getString("OldUnitId");
			
			String sqlrem="select * from t_unitreplacement where VehRegNo='"+rs4.getString("VehicleRegNumber")+"' and NewUnitID='"+unitid.trim()+"'";
			ResultSet rsrem = stmtrem.executeQuery(sqlrem);
			if(rsrem.next())
			{
				simno=rsrem.getString("MobNo");
				mobno=rsrem.getString("SimNo");
			}
			
		} 
		  //****************************************************************************
		 	}
		 	if(rs4.getString("Status").equals("Missing"))
		 	{
		 		bg="yellow";
		 	}
		 	if(rs4.getString("Status").equals("DeActivated"))
		 	{
		 		bg="lightgreen";
		 //************************************************************************
		 		String sqluid="select * from t_unitreplacement where VehRegNo='"+rs4.getString("VehicleRegNumber")+"' or VehCode='"+rs4.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";	
				ResultSet rsuid=stmtuid.executeQuery(sqluid);	
				if(rsuid.next())
				{
					unitid=rsuid.getString("OldUnitId");
				
					String sqlrem="select * from t_unitreplacement where VehRegNo='"+rs4.getString("VehicleRegNumber")+"' and NewUnitID='"+unitid.trim()+"' and EntDate <= '"+rsuid.getString("EntDate")+"'";
					ResultSet rsrem = stmtrem.executeQuery(sqlrem);
					if(rsrem.next())
					{
						mobno=rsrem.getString("MobNo");
						simno=rsrem.getString("SimNo");
					}
				}
		 		
		 //*************************************************************************		
		 	}
			
		 	String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' and cmmt_type='Unit' ";
		 	rssp1=stmtsp1.executeQuery(sqlsp1);
			if(rssp1.next())
			{
				spcnt1=0;
				spcnt1=rssp1.getInt("cnt");
			}
			
			if(spcnt1 > 0)
			{
				bg="#F6FDD0";
			}
			
			sqlsp="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehno+"' and Closed='No' and cmmt_type='Vehicle' ";
			rssp=stmtsp.executeQuery(sqlsp);
			if(rssp.next())
			{
				spcnt=0;
				spcnt=rssp.getInt("cnt");
			}
			
			if(spcnt > 0)
			{
				bg="lightBlue";
			}
			spcnt=spcnt+spcnt1;
			%><tr bgcolor='<%=bg%>'>
			<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehno%>&unitid=<%=unitid%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=spcnt%>)</b></a>  </td>
		<%
		}
		else
		{
		%><tr>
		<td> </td>
	<%
		}
       %>
      <td><div align="center"><font color="maroon"> <%=i %> </font></div></td>
<%
			sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehicleRegNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by concat(InstDate,InstTime) desc limit 1";
			ResultSet rst=st.executeQuery(sql);
			if(rst.next())
			{
				
				instdate=rst.getString("InstDate");
				instloc=rst.getString("InstPlace");
				instby=rst.getString("InstBy");
			}	
			else
			{
				//transporter="-";
				instdate="-";
				instloc="-";
				instby="-";
			}	
		if(vehno.equals("-") || null==vehno)
		{ %>
			 <td><div align="center"> <font color="maroon">
				<%=rs1.getString("VehicleRegNo") %> </font></div> </td>
<%		}
		else
		{
%>
              <td><div align="center"> <font color="maroon">
		<a href="javascript:toggleDetails1(<%=i%>,true);" title="Click Here">
			<%=rs1.getString("VehicleRegNo") %> </a></font>

			<br/>	
	<div class="popup" id="popupx<%=i%>">
		<table border="0" >
			<tr><td><a href="addcomplaint.jsp?vid=<%=vehid%>&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
			<tr><td><a href="inspection.jsp?vid=<%=vehid%>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
			<tr><td><a href="repunit.jsp?vid=<%=vehid%>&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
			<tr>
				<td> <a href="techspcomment.jsp?vehno=<%=rs1.getString("VehicleRegNo")%>&comment=veh&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
			</tr>
			<tr>
		<td> <a href="sendmail.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>
			<tr>
		<td> <a href="reportincident.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=groupname %>" onclick="toggleDetails(<%=i%>,false);">Incident Details Report</a> </td>
</tr>
			
			<tr><td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
		</table>
	
	</div>		
		</div> </td>
<% 		} 
		
		sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			vehiclecode=rs3.getString("VehicleCode");
		}
		sql2="select * from t_group where VehCode='"+vehiclecode+"' ";
		ResultSet rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			groupname=rs2.getString("GPName");
		}
		else
		{
			groupname="-";
		}				
	%>  
		 <td sorttable_customkey="dd-MMM-yyyy" > <div align="center"><font color="maroon">
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %>
		 <%=rs1.getString("TheTime") %></div></td>
         <td ><div align="center"><font color="maroon">
		 <%=rs1.getString("Location") %> </div></td>
	 <td><div align="center"> <font color="maroon">
		<%=unitid %> </div></td>	

		<td><div align="center"><font color="maroon">
		<%=transporter%> </div> </td>
		<td><div align="center"><font color="maroon"><%=mobno %></div> </td>
		<td><div align="center"><font color="maroon"> <%=simno %><div> </td>	
		
		<td><div align="center"><font color="maroon"> <%=priphe%><div> </td>
		
		<td><div align="center"><font color="maroon"> <%=simcompany %><div> </td>
		<td><div align="center"><font color="maroon">
			<%=groupname%></div></td>
   
              <td width="68px"><div align="center"> <font color="maroon">
	<%
	if(instdate=="0000-00-00"||instdate=="-")
	{
		String d3="-";
		out.print(d3);
	}		
	else
	{
		String d3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdate));
	out.print(d3);
	}
	%>
	  </div> </td>
              <td><div align="center"><font color="maroon">
		 <%=instby%> </div>  </td>
              <td><div align="center"> <font color="maroon">
			<%=instloc%> </div>  </td>
              <td><div align="center"><font color="maroon">
 <%  sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehicleRegNo")+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
			ResultSet rst2=st.executeQuery(sql);
			if(rst2.next())
			{
			String d1=rst2.getString("InstDate");
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
				java.util.Date d = new java.util.Date();
				Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				String tdydte=formatter1.format(d);

	/**************************** To Check Warranty *********************************************************/
		sqlwar1="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		ResultSet rswar1=stwar1.executeQuery(sqlwar1);
		if(rswar1.next())
		{
			unitid=rswar1.getString("UnitID");
			//vehregno=rswar1.getString("VehicleRegNumber");
			try{
			instdte=rswar1.getString("InstalledDate");
			}
			catch(Exception X)
			{
				instdte="-";
			}
			
			sqlwar2="select * from t_amchistory where VehNo = '"+vehno+"' order by NewDate desc limit 1";
			ResultSet rswar2=stwar2.executeQuery(sqlwar2);
			if(rswar2.next())
			{
				if(!(null==rswar2.getDate("WarrantyTill")))
				{
				try{	
				sqlwar3="select TO_DAYS('"+rswar2.getDate("WarrantyTill")+"')-TO_DAYS('"+tdydte+"') as days";
				ResultSet rswar3=stwar3.executeQuery(sqlwar3);
				if(rswar3.next())
				{
					if(rswar3.getInt("days") > 0)
					{
						warranty="YES";
					}
					else
					{
						warranty="NO";
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
					sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdte+"') as days";
					ResultSet rswar4=stwar1.executeQuery(sqlwar1);
					if(rswar4.next())
					{
						
						if(rswar4.getInt("days") > 365)
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
						instdte1=rswar1.getString("InstalledDate");
						}
						catch(Exception X)
						{
							instdte1="-";
						}	
				sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdte1+"') as days";
				ResultSet rswar4=stwar1.executeQuery(sqlwar1);
				if(rswar4.next())
				{
					if(rswar4.getInt("days") > 365)
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
				
/*****************************************************************************/			
		%> 
	     </div> </td>
		<td> <div align="center"><font color="maroon"> <%=warranty%>	</font> </div> </td>
         </tr>
<%  i++;
    }
   }
 
   /***************************	For Unit Id	*****************************/
   
   else
   {
	sql1="select * from allconnectedunits where UnitID like '%"+getunit+"%' group by UnitID order by concat(TheDate,TheTime) desc";
  
	rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
		String groupname="", vehid="", warrantydate="";
		String vehno=rs1.getString("VehNo");
		String unitid=rs1.getString("UnitID");

		sql4="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		rs4=stmt4.executeQuery(sql4);
		if(rs4.next())
		{
			vehid=rs4.getString("VehicleCode");
			warrantydate=rs4.getString("InstalledDate");
			transporter=rs4.getString("OwnerName");
			if(rs4.getString("Status").equals("Removed"))
		 	{
		 		bg="red";
		 	}
		 	if(rs4.getString("Status").equals("Missing"))
		 	{
		 		bg="yellow";
		 	}
		 	if(rs4.getString("Status").equals("DeActivated"))
		 	{
		 		bg="lightgreen";
		 	}
			
		 	String sqlsp1="select count(*) as cnt from t_techspecialrep where VehRegNo = '"+vehno+"' and Closed='No' and cmmt_type='Vehicle' ";
		 	rssp1=stmtsp1.executeQuery(sqlsp1);
			if(rssp1.next())
			{
				spcnt1=0;
				spcnt1=rssp1.getInt("cnt");
			}
			
			if(spcnt1 > 0)
			{
				bg="lightBlue";
			}
			
			sqlsp="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' and cmmt_type='Unit' ";
		 	rssp=stmtsp.executeQuery(sqlsp);
			if(rssp.next())
			{
				spcnt=0;
				spcnt=rssp.getInt("cnt");
			}
			
			if(spcnt > 0)
			{
				bg="#F6FDD0";
			}
			spcnt=spcnt+spcnt1;
		}
       %>
      <tr bgcolor='<%=bg%>'>
      	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehno%>&unitid=<%=unitid%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=spcnt%>)</b></a>  </td>
      
      <td><div align="center"><font color="maroon"> <%=i %> </div></td>
<%
			String mobno="", simno="";
			sql2="select * from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
			ResultSet unitmob=stmt2.executeQuery(sql2);
			if(unitmob.next())
			{
				mobno=unitmob.getString("MobNo"); 
				simno=unitmob.getString("SimNo"); 
				 simcompany=unitmob.getString("SimCompany");
				 priphe=unitmob.getString("Peripherals");
			}	
			else
			{
				mobno="-";
				simno="-";
			}

			sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by concat(InstDate,InstTime) desc limit 1";
			ResultSet rst=st.executeQuery(sql);
			if(rst.next())
			{
				
				instdate=rst.getString("InstDate");
				instloc=rst.getString("InstPlace");
				instby=rst.getString("InstBy");
			}	
			else
			{
				//transporter=transporter;
				instdate="-";
				instloc="-";
				instby="-";
			}	
		if(vehno.equals("-") || null==vehno)
		{ %>
			 <td><div align="center"> <font color="maroon">
				<%=rs1.getString("VehNo") %> </div> </td>
<%		}
		else
		{
%>
              <td><div align="center"> <font color="maroon">
		<a href="javascript:toggleDetails1(<%=i%>,true);" title="Click Here">
			<%=rs1.getString("VehNo") %> </a>

			<br/>	
	<div class="popup" id="popupx<%=i%>">
		<table border="0" >
			<tr><td><a href="addcomplaint.jsp?vid=<%=vehid%>&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
			<tr><td><a href="repunit.jsp?vid=<%=vehid%>&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
			
			<tr>
				<td> <a href="techspcomment.jsp?vehno=<%=rs1.getString("VehNo")%>&comment=veh&parameter=tech" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
			</tr>
			<tr>
		<td> <a href="sendmail.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>
			<tr>
		<td> <a href="reportincident.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=groupname %>" onclick="toggleDetails(<%=i%>,false);">Incident Details Report</a> </td>
</tr>
			
			
			<tr><td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
		</table>
	
	</div>		
		</div> </td>
<% 		} %>
	
	  
	<%
		sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			vehiclecode=rs3.getString("VehicleCode");
		}
		sql2="select * from t_group where VehCode='"+vehiclecode+"' ";
		ResultSet rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			groupname=rs2.getString("GPName");
		}
		else
		{
			groupname="-";
		}				
	%>  
		 <td sorttable_customkey="dd-MMM-yyyy" > <div align="center"><font color="maroon">
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %>
		 <%=rs1.getString("TheTime") %></div></td>
         <td ><div align="center"><font color="maroon">
		 <%=rs1.getString("Location") %> </div></td>
	 <td><div align="center"> <font color="maroon">
		<%=unitid %> </div></td>	

		<td><div align="center"><font color="maroon">
		<%=transporter%> </div> </td>
		<td><div align="center"><font color="maroon"><%=mobno %></div> </td>
		<td><div align="center"><font color="maroon"> <%=simno %><div> </td>	
		
		<td><div align="center"><font color="maroon"> <%=priphe%><div> </td>
		
		<td><div align="center"><font color="maroon"> <%=simcompany %><div> </td>
		<td><div align="center"><font color="maroon">
			<%=groupname%></div></td>
   
              <td width="68px"><div align="center"> <font color="maroon">
	<%
	if(instdate=="0000-00-00"||instdate=="-")
	{
		String d3="-";
		out.print(d3);
	}		
	else
	{
		String d3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdate));
	out.print(d3);
	}
	%>
	  </div> </td>
              <td><div align="center"><font color="maroon">
		 <%=instby%> </div>  </td>
              <td><div align="center"> <font color="maroon">
			<%=instloc%> </div>  </td>
              <td><div align="center"><font color="maroon">
 <%  sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
			ResultSet rst2=st.executeQuery(sql);
			if(rst2.next())
			{
			String d1=rst2.getString("InstDate");
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
				java.util.Date d = new java.util.Date();
				Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				String tdydte=formatter1.format(d);
				sqlwar1="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
				ResultSet rswar1=stwar1.executeQuery(sqlwar1);
				if(rswar1.next())
				{
					unitid=rswar1.getString("UnitID");
					try{
					instdte=rswar1.getString("InstalledDate");
					}
					catch(Exception X)
					{
						instdte="-";
					}
					sqlwar2="select * from t_amchistory where VehNo = '"+vehno+"' order by NewDate desc limit 1";
					ResultSet rswar2=stwar2.executeQuery(sqlwar2);
					if(rswar2.next())
					{
						if(!(null==rswar2.getDate("WarrantyTill")))
						{
						try{	
						sqlwar3="select TO_DAYS('"+rswar2.getDate("WarrantyTill")+"')-TO_DAYS('"+tdydte+"') as days";
						ResultSet rswar3=stwar3.executeQuery(sqlwar3);
						if(rswar3.next())
						{
							if(rswar3.getInt("days") > 0)
							{
								warranty="YES";
							}
							else
							{
								warranty="NO";
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
							sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdte+"') as days";
							ResultSet rswar4=stwar1.executeQuery(sqlwar1);
							if(rswar4.next())
							{
								
								if(rswar4.getInt("days") > 365)
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
								instdte1=rswar1.getString("InstalledDate");
								}
								catch(Exception X)
								{
									instdte1="-";
								}	
						sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdte1+"') as days";
						ResultSet rswar4=stwar1.executeQuery(sqlwar1);
						if(rswar4.next())
						{
							if(rswar4.getInt("days") > 365)
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
	     </div> </td>
		<td> <div align="center"><font color="maroon"> <%=warranty%>
		</font> </div> </td>
 
         </tr>
<%  i++;
    }
   
   
   }
    
    %>
      </table>
	
      <%
}
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
}
%>
		
<table width="750px" height="350px">
<tr><td></td></tr>
</table>

<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  

</body>
</html>
<div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
