<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<jsp:useBean id="diary1" class="com.diary.beans.classes" scope="page">



<%! 
Connection con1,con2;
Statement stmt1,st,st3,stmt2, stmt4, stmtsp , stmtsp1, stmtuid , stmtrem,stmt_tct;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null, rs5=null, rssp=null,rssp1=null,latrst=null;

Statement stwar1,stwar2,stwar3,stwar4;
%>

<%@page import="java.util.zip.DataFormatException"%><html>
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
<%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">

<%@ include file="header.jsp" %>

<%
diary1.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
diary1.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>


<%		
try
{
   
	
	System.out.println("><><><><>starting......");
	//Class.forName(MM_dbConn_DRIVER);
	
	con2 = diary1.ReturnConnection();
	con1 = diary1.ReturnConnection1();
	
	
	//con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	stmt2=con1.createStatement();	
	st=con1.createStatement();
	st3=con1.createStatement();
	stmt4=con1.createStatement();
	stmtsp=con2.createStatement();
	stmtsp1=con2.createStatement();
	stmtuid=con1.createStatement();
	stmtrem=con1.createStatement();
	stmt_tct=con1.createStatement();
	
	String userrole=session.getAttribute("userrole").toString();
	
	stwar1=con1.createStatement();
	stwar2=con1.createStatement();
	stwar3=con1.createStatement();
	stwar4=con1.createStatement();
	String sql1="",sql="",sql2="",sql3="", sql4="", sql5="",sqlsp="",sqllt="";
	String getunit="",vehiclecode="",  simcompany="-",priphe="-";
	String transporter="",instdate="",instloc="",instby="",simcomp="",peripherals="",Instruction="",battrystatus ="NA",battrystatustime ="NA";
	String sqlwar1="",sqlwar2="",sqlwar3="",sqlwar4="";
	int spcnt=0;
	int spcnt1=0;
	int spcnt111=0;
	String rad=request.getParameter("VehUnit");
	//System.out.println("Rad -"+rad);
		
	String unitwarranty="", warranty="";	
	String instdte="-";
	String instdte1="", vhno="";
	Double lat=0.0, lon=0.0;
	Double lat2=0.0, lon2=0.0; 
	String direction="";
	String loc11="";
	String bg2="", msg1="";
	String grp="", insdt="", insdt1="";
	String transporterlist=session.getAttribute("TransporterList").toString();
	final String typevalue = session.getAttribute("typevalue").toString();	

%>		
		
		<table border="5" width="750px" align="center" class="sortable">
		<tr>
		<td width="68px"> <div align="center"><b> Flag</b></div></td>
		<td width="68px"> <div align="center"><b> Sr. No.</b></div></td>
		<td width="68px"> <div align="center"><b>JRM Vehicle</b></div></td>
		<td width="68px"> <div align="center"><b>Ticket Category</b></div></td>
		
		
		
		<td width="68px"><div align="center"><b>Mains Status</b></div></td>
		<td width="68px"><div align="center"><b>Mains StatusTime</b></div></td>
		
		<td width="68px"><div align="center"><b>Vehicle No.</b></div></td>
		<td width="68px"><div align="center"><b>Last Date</b></div></td>
		<td width="68px"> <div align="center"><b>Last Location</b></div></td>
		<td width="68px"> <div align="center"><b> Unit Id</b></div></td>
		<td width="68px"><div align="center"><b>TypeUnit</b></div></td>
		<td width="68px"><div align="center"><b>Trans -porter</b></div></td>
		<td width="68px"><div align="center"><b>Mobile No</b></div></td>
		<td width="68px"><div align="center"><b>Sim No</b></div></td>
		<td width="68px"><div align="center"><b>Peripherals</b></div></td>
		<td width="68px"><div align="center"><b>Unit Type</b></div></td>
		<td width="68px"><div align="center"><b>Sim Company</b></div></td>
		<td width="68px"><div align="center"><b>PS No</b></div></td>
		<td width="68px"><div align="center"><b>PCB No</b></div></td>
		<td width="68px"><div align="center"><b>Box No</b></div></td>
		<td width="68px"><div align="center"><b>Battery No</b></div></td>
		<td width="68px"><div align="center"><b>Group</b></div></td>
		<td width="68px"><div align="center"><b>First Inst. Date</b></div></td>
		<td width="68px"><div align="center"><b>Inst.By</b></div></td>
		<td width="68px"><div align="center"><b>Inst.Location</b></div></td>
		<td width="68px"><div align="center"><b>Last Rep. Date</b></div></td>
		<td width="68px"><div align="center"><b>In Warranty</b></div></td>
		
		
		</tr>
<% 	
   getunit=request.getParameter("srchbx");
  getunit=getunit.replaceAll("\\s+","");
   int i=1;
   Double lat1=0.00,lon1=0.00;
   String vehcode="",tcategory="-",tid="-",tctmsg="No Ticket", unitid="",  vehno = "";
   
   
   
   if(rad.equals("Vehicle"))	
   {	
	   transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
	  
		   sql1="select LatitudePosition,LongitudePosition,VehicleRegNo,VehicleCode,UnitID,Transporter,bcharging,bdatetime,TheDate,TheTime,Location from t_onlinedata where replace(VehicleRegNo,' ','') like '%"+getunit+"%' order by concat(TheDate,TheTime) desc";   
	   
    rs1=stmt1.executeQuery(sql1);
    
    System.out.println("Online : -"+sql);
    
    while(rs1.next())
    { 
    	unitid = "";
    	vehno="";
    	String bg="", msg="";
    	String groupname="", vehid="", warrantydate="";
    	lat1=rs1.getDouble("LatitudePosition");
		lon1=rs1.getDouble("LongitudePosition");
        vehno=rs1.getString("VehicleRegNo");
		 vehcode=rs1.getString("VehicleCode");
		//String unitid=rs1.getString("UnitID");
		transporter=rs1.getString("Transporter");
		battrystatus =rs1.getString("bcharging");
		battrystatustime =rs1.getString("bdatetime");
		
		
		if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
		{
			
			bg="#FFA500";
		}
		
		
		
		String  newsql="select tcategory,tid from db_gps.t_livetickettest where vehid='"+vehcode+"' ";
		ResultSet rst_tct =stmt_tct.executeQuery(newsql);
		if(rst_tct.next())
		{
			tcategory=rst_tct.getString("tcategory");
			tid=rst_tct.getString("tid");
			
		}
		
		
		
		String tpunit="", mobno="-", simno="-",InstType="",psno="",pcbno="",boxno="",batteryno="";
		instdate="-";
		instloc="-";
		instby="-";
		
		
		sql4="select VehicleCode,Instruction,InstalledPlace,InstalledDate,Status,UnitID,InstalledBy from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		rs4=stmt4.executeQuery(sql4);
		
		if(rs4.next())
		{
			vehid=rs4.getString("VehicleCode");
			Instruction=rs4.getString("Instruction");
			//instdte=rs4.getString("InstalledDate");
			String Status=rs4.getString("Status");
			
			instdate=rs4.getString("InstalledDate");
			instloc=rs4.getString("InstalledPlace");
			instby=rs4.getString("InstalledBy");

			//unit id from vehicledetils or replacement
		if(Status.equalsIgnoreCase("Missing") || Status.equalsIgnoreCase("-")) 
		{
		 unitid=rs4.getString("UnitID");
			
		}
		else 
		{
			String sqluid="select OldUnitId from t_unitreplacement where VehRegNo='"+vehno+"' or VehCode='"+vehid+"' order by EntDate desc limit 1";	
			ResultSet rsuid=stmtuid.executeQuery(sqluid);	
			if(rsuid.next())
			{
				unitid=rsuid.getString("OldUnitId");
					
			}
		}
			
			sql2="select TypeUnit, MobNo,SimNo,SimCompany,Peripherals,PSNo,PCBNo,BoxNo,BatteryNo,InstType from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
			ResultSet unitmob=stmt2.executeQuery(sql2);
			
			if(unitmob.next())
			{
				mobno=unitmob.getString("MobNo");
				tpunit=unitmob.getString("TypeUnit");
				simno=unitmob.getString("SimNo");
				simcompany=unitmob.getString("SimCompany");
				priphe=unitmob.getString("Peripherals");
				psno=unitmob.getString("PSNo");
				pcbno=unitmob.getString("PCBNo");
				boxno=unitmob.getString("BoxNo");
				batteryno=unitmob.getString("BatteryNo");
				InstType=unitmob.getString("InstType");
			}	
			else
			{
				mobno="-";
				tpunit="-";
				simno="-";
			}
			
			//Comment 1
			if(rs4.getString("Status").equals("Removed"))
		 	{
		 		bg="red";
		 		
		
		  //****************************************************************************
		 	}
		 	if(rs4.getString("Status").equals("Missing"))
		 	{
		 		bg="yellow";
		 	}
		 	if(rs4.getString("Status").equals("DeActivated"))
		 	{
		 		bg="lightgreen";
			
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
			
			
	/* 		System.out.println("tctegory^^**********^"+tcategory);
			if(tcategory.equalsIgnoreCase("ToCheck"))
			{
				tcategory="0";
				
			}else if(tcategory.equalsIgnoreCase("stage1ticket"))
			{
				tcategory="1";
				
				
			}else if(tcategory.equalsIgnoreCase("stage2ticket"))
			{
				
				tcategory="2";
				
			}
			else if(tcategory.equalsIgnoreCase("stage3ticket"))
			{
				
				tcategory="3";
				
			}
			else if(tcategory.equalsIgnoreCase("stage4ticket"))
			{
				
				tcategory="4";
				
			}else{
				
				
				
			} */

			
			
			
			
			String sqlsp111="select count(*) as cnt from t_techspecialrep where VehRegNo = '"+vehno+"' and Closed='No' and cmmt_type='Vehicle' and SpComment='System disconnection detected'";
		 	ResultSet rssp111=stmtsp1.executeQuery(sqlsp111);
			if(rssp111.next())
			{
				spcnt111=0;
				spcnt111=rssp111.getInt("cnt");
			}
			
			if(spcnt111 > 0)
			{
				if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
				{
					
					bg="#FFA500";
				}else{
				
				
				bg="#E2A9F3";
				
				}
				
				
			}
			spcnt=spcnt+spcnt1;
			
			%><tr bgcolor='<%=bg%>'>
			<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehno%>&unitid=<%=unitid%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=spcnt%>)</font></b></a>  </td>
		<%
		}
		else
		{
			if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg="#FFA500";
			}else{
				
				bg="";
			}
			
			
			
		
		%></tr><tr  bgcolor='<%=bg%>'  >
		<td> </td>
	<%
		}
       %>
      <td><div align="right"><font color="maroon"> <%=i %> </font></div></td>
      <td><div align="left"><font color="maroon"> <%=Instruction%> </font></div></td>
      
      <%
      
      try{
	  	%>
	  <td> <div align="left"><font color=""><%if( tcategory.equalsIgnoreCase("-") ||  tcategory=="-") { %> <%=tctmsg %><%}else{ %> <%=tcategory %><%} %>	</font> </div> </td>
		
	<% }catch (Exception e)
	
	{
		   e.printStackTrace();
		} %>
      
      
      <td> <div align="left"><font color="maroon"> <%=battrystatus%>	</font> </div> </td>
		
		<td> <div align="left"><font color="maroon"><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
      
      
      
<%
			//sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehicleRegNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by concat(InstDate,InstTime) desc limit 1";
			
		/* 	
			if(tcategory.equalsIgnoreCase("0"))
			{
				tcategory="ToCheck";
				
			}else if(tcategory.equalsIgnoreCase("1"))
			{
				tcategory="stage1ticket";
				
				
			}else if(tcategory.equalsIgnoreCase("2"))
			{
				
				tcategory="stage2ticket";
				
			}
			else if(tcategory.equalsIgnoreCase("3"))
			{
				
				tcategory="stage3ticket";
				
			}
			else if(tcategory.equalsIgnoreCase("4"))
			{
				
				tcategory="stage4ticket";
				
			}else{
				
				
				
			} */

			
			
			
			
			
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
			<tr><td><a href="addcomplaint.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
			<tr><td><a href="inspection.jsp?vid=<%=vehid%>&warranty=<%=warranty%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
			<tr><td><a href="repunit.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
			<%-- <tr><td><a href="devicehealth.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Device Health</a></td></tr> --%>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('devicehealth.jsp?unitid=<%=getunit%>&vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Device Health</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('WebComplaint.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Web Complaints</a></td></tr>
			<tr>
				<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&tpunit=<%=tpunit%>&simno=<%=mobno%>&mobno=<%=simno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
			</tr>	
			<tr>
				<td> <a href="techspcomment.jsp?tid=<%=tid %>&category=<%=tcategory %>&vehno=<%=rs1.getString("VehicleRegNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
			</tr>
			<tr>
				<td> <a href="sendmail.jsp?vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
			</tr>
			<%
			if(SUPERADMIN.equalsIgnoreCase(userrole)){
			%>
			<tr>
				<td> <a href="reportincident.jsp?vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
			</tr>
			<%
			}
			%>
			<tr><td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
		</table>
	
	</div>		
		</div> </td>
<% 		} 
		
		/* sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
	//	System.out.println(sql3);
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			vehiclecode=rs3.getString("VehicleCode");
		} */
		sql2="select * from t_group where VehCode='"+vehcode+"' ";
	//	System.out.println(sql2);
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
		 <%=rs1.getString("TheTime") %></font></div></td>
      
		 <td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rs1.getDouble("LatitudePosition") %>&long=<%=rs1.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rs1.getString("Location") %> </font>  </a></td>
	 <td><div align="right"> <font color="maroon">
		<%=unitid %> </font></div></td>	
		<td><div align="right"><font color="maroon"><%=tpunit %></font></div> </td>
		<td><div align="left"><font color="maroon">
		<%=transporter%> </font></div> </td>
		<td><div align="right"><font color="maroon"><%=mobno %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=simno %></font></div> </td>	
		
		<td><div align="left"><font color="maroon"> <%=priphe%></font></div> </td>
		<td><div align="left"><font color="maroon"> <%=InstType%></font></div> </td>
		<td><div align="left"><font color="maroon"> <%=simcompany %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=psno%></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=pcbno%></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=boxno%></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=batteryno%></font></div> </td>
		
		<td><div align="left"><font color="maroon">
			<%=groupname%></font></div></td>
   
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
	  </font></div> </td>
              <td><div align="left"><font color="maroon">
		 <%=instby%> </font></div>  </td>
              <td><div align="left"> <font color="maroon">
			<%=instloc%> </font></div>  </td>
              <td><div align="center"><font color="maroon">
 <%  sql="select InstDate from t_unitreplacement where VehRegNo='"+rs1.getString("VehicleRegNo")+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc limit 1";
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
		/* sqlwar1="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
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
			 */
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
					sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdate+"') as days";
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
			{/* 
					try{
						instdte1=rswar1.getString("InstalledDate");
						}
						catch(Exception X)
						{
							instdte1="-";
						}	 */
				sqlwar1="select TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdate+"') as days";
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
	
		
				
/*****************************************************************************/			
		%> 
	    </font> </div> </td>
		<td> <div align="left"><font color="maroon"> <%=warranty%>	</font> </div> </td>
		
		
	
			
	
			
		

				
         </tr>
<%  i++;
    }
   }
 
   /***************************	For Unit Id	*****************************/
   
   else
   {
	   System.out.println(">>>>>>>>>>Else LOPP>>>>@@@@@******");
	   sql1="select * from allconnectedunits where UnitID like '%"+getunit+"%' group by UnitID order by concat(TheDate,TheTime) desc";
  
	rs1=stmt1.executeQuery(sql1);
	System.out.println(">>>>>>>>>>sql1>>>>"+sql1);
    while(rs1.next())
    { 
    	
		  
    	
		
    	vehno="";
    	unitid="";
    	String bg="", msg="";
    	String groupname="", vehid="", warrantydate="";
		 vehno=rs1.getString("VehNo");
		unitid=rs1.getString("UnitID");
		
		sqllt ="select * from t_onlinedata where UnitID = '"+unitid+"' group by UnitID order by concat(TheDate,TheTime) desc ";
		ResultSet latrst = stmt4.executeQuery(sqllt);
		System.out.println("online :- "+sqllt);
		  if(latrst.next())
		  {
			  lat1=latrst.getDouble("LatitudePosition");
				lon1=latrst.getDouble("LongitudePosition");
				
				
				battrystatus =latrst.getString("bcharging");
				
				battrystatustime =latrst.getString("bdatetime");
				
				
			  
		  }	  
		
		  if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg="#FFA500";
			}
		  
		  
		  if(lat1==0.0)
			{
				lat1=rs1.getDouble("Latindec");
				
			}
			
			if(lon1==0.0)
			{
				lon1=rs1.getDouble("LonginDec");
			}
			
			System.out.println("lat :-"+lat1);
			System.out.println("lon :-"+lon1);
		
		String sqlInsttype="select * from db_gps.t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rsInsttype=stmt4.executeQuery(sqlInsttype);
	String InstType="";
		if(rsInsttype.next()){
			InstType=rsInsttype.getString("InstType");
			//System.out.println("InstType---->"+InstType);
		}
		sql4="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		rs4=stmt4.executeQuery(sql4);
		System.out.println(">>>>>>>>>>sql4>>>>"+sql4);
		if(rs4.next())
		{
			vehid=rs4.getString("VehicleCode");
			Instruction=rs4.getString("Instruction");
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
		 	System.out.println(">>>>>>>>>>sqlsp1>>>>"+sqlsp1);
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
		 	System.out.println(">>>>>>>>>>sqllsp>>>>"+sqlsp);
			if(rssp.next())
			{
				spcnt=0;
				spcnt=rssp.getInt("cnt");
			}
			
			if(spcnt > 0)
			{
				bg="#F6FDD0";
			}
			String sqlsp111="select count(*) as cnt from t_techspecialrep where VehRegNo = '"+vehno+"' and Closed='No' and cmmt_type='Vehicle' and SpComment='System disconnection detected'";
		 	ResultSet rssp111=stmtsp1.executeQuery(sqlsp111);
		 	System.out.println(">>>>>>>>>>sqlsp111>>>>"+sqlsp111);
			if(rssp111.next())
			{
				spcnt111=0;
				spcnt111=rssp111.getInt("cnt");
			}
			
			if(spcnt111 > 0)
			{
				
				if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
				{
					
					bg="#FFA500";
				}else{
				bg="#E2A9F3";
				
				}
			}
			
			spcnt=spcnt+spcnt1;
		}
		if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
		{
			
			bg="#FFA500";
		}
		
		
		System.out.println("tctegory^^**********^"+tcategory);
		if(tcategory.equalsIgnoreCase("ToCheck"))
		{
			tcategory="0";
			
		}else if(tcategory.equalsIgnoreCase("stage1ticket"))
		{
			tcategory="1";
			
			
		}else if(tcategory.equalsIgnoreCase("stage2ticket"))
		{
			
			tcategory="2";
			
		}
		else if(tcategory.equalsIgnoreCase("stage3ticket"))
		{
			
			tcategory="3";
			
		}
		else if(tcategory.equalsIgnoreCase("stage4ticket"))
		{
			
			tcategory="4";
			
		}else{
			
			
			
		}

		
		
		System.out.println(">>>>>HIIIIII UP to Here 2222>>>>>>>>>");  
		if("transporter".equalsIgnoreCase(typevalue)){
			if(transporterlist.contains(transporter)){
				System.out.println(">>>>>HIIIIII UP to Here 444444>>>>>>>>>");  
			       %>
			      <tr bgcolor='<%=bg%>'>
			      	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehno%>&unitid=<%=unitid%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=spcnt%>)</font></b></a>  </td>
			      
			      <td><div align="right"><font color="maroon"> <%=i %> </font></div></td>
			      <td><div align="left"><font color="maroon"> <%=Instruction%> </font></div></td>
<!--			      <td><div align="left"><font color="maroon"> <%=tcategory%> </font></div></td>-->
			     
			     <%
			      try{
	  	%>
	  <td> <div align="left"><font color=""><%if( tcategory.equalsIgnoreCase("-") ||  tcategory=="-") { %> <%=tctmsg %><%}else{ %> <%=tcategory %><%} %>	</font> </div> </td>
		
	<% }catch (Exception e)
	
	{
		   e.printStackTrace();
		}
			
						
			System.out.println(">>>>>HIIIIII UP to Here 111111>>>>>>>>>");    
			String tpunit="", mobno="-", simno="-",psno="-",pcbno="-",boxno="-",batteryno="-";
						sql2="select *  from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
						ResultSet unitmob=stmt2.executeQuery(sql2);
						//System.out.println(">>>>>>>>>>sql2>>>>"+sql2);
						if(unitmob.next())
						{
							mobno=unitmob.getString("MobNo"); 
							tpunit=unitmob.getString("TypeUnit");
							simno=unitmob.getString("SimNo"); 
							 simcompany=unitmob.getString("SimCompany");
							 priphe=unitmob.getString("Peripherals");
						}	
						else
						{
							mobno="-";
							tpunit="-";
							simno="-";
						}

					//	sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by concat(InstDate,InstTime) desc limit 1";
						sql="select * from t_vehicledetails where VehicleRegNumber='"+rs1.getString("VehNo")+"'";
						ResultSet rst=st.executeQuery(sql);
						System.out.println(">>>>>>>>>>sql>>>>"+sql);
						if(rst.next())
						{
							
							instdate=rst.getString("InstalledDate");
							instloc=rst.getString("InstalledPlace");
							instby=rst.getString("InstalledBy");
						}	
						else
						{
							//transporter=transporter;
							instdate="-";
							instloc="-";
							instby="-";
						}	
					
						System.out.println(">>>>>HIIIIII UP to Here >>>>>>>>>");
						
						
						
						if(tcategory.equalsIgnoreCase("0"))
						{
							tcategory="ToCheck";
							
						}else if(tcategory.equalsIgnoreCase("1"))
						{
							tcategory="stage1ticket";
							
							
						}else if(tcategory.equalsIgnoreCase("2"))
						{
							
							tcategory="stage2ticket";
							
						}
						else if(tcategory.equalsIgnoreCase("3"))
						{
							
							tcategory="stage3ticket";
							
						}
						else if(tcategory.equalsIgnoreCase("4"))
						{
							
							tcategory="stage4ticket";
							
						}else{
							
							
							
						}
						
						
						if(vehno.equals("-") || null==vehno)
					{ %>
						 <td><div align="left"> <font color="maroon">
							<%=rs1.getString("VehNo") %> </font></div> </td>
			<%		}
					else
					{
			%>
			              <td><div align="left"> <font color="maroon">
					<a href="javascript:toggleDetails1(<%=i%>,true);" title="Click Here">
						<%=rs1.getString("VehNo") %> </a>

						<br/>	
				<div class="popup" id="popupx<%=i%>">
					<table border="0" >
						<tr><td><a href="addcomplaint.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
						<tr><td><a href="inspection.jsp?tid=<%=tid %>&category=<%=tcategory %>&vid=<%=vehid%>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
						<tr><td><a href="repunit.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
						<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('devicehealth.jsp?unitid=<%=getunit%>&vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Device Health</a></td></tr>
						<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
						<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('WebComplaint.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Web Complaints</a></td></tr>
						<tr>
							<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&tpunit=<%=tpunit%>&simno=<%=mobno%>&mobno=<%=simno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
						</tr>	
						<tr>
							<td> <a href="techspcomment.jsp?tid=<%=tid %>&category=<%=tcategory %>&vehno=<%=rs1.getString("VehNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
						</tr>
						<tr>
							<td> <a href="sendmail.jsp?tid=<%=tid %>&category=<%=tcategory %>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
						</tr>
						<%
						System.out.println("*******************************"+userrole);
						if(SUPERADMIN.equalsIgnoreCase(userrole)){
						%>
						<tr>
							<td> <a href="reportincident.jsp?vehno=<%=rs1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
						</tr>
						<%
						}
						%>
						<tr><td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
					</table>
				
				</div>		
					</font></div> </td>
			<% 		} %>
				
				  
				<%
				
								
				
				  System.out.println(">>>>>>>>>>battrystatus>>>>"+battrystatus);
				  
				
					sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
					ResultSet rs3=st3.executeQuery(sql3);
					System.out.println(">>>>>>>>>>sql3>>>>"+sql3);
					if(rs3.next())
					{
						vehiclecode=rs3.getString("VehicleCode");
					}
					sql2="select * from t_group where VehCode='"+vehid+"' ";
					ResultSet rs2=stmt2.executeQuery(sql2);
					System.out.println(">>>>>>>>>>sql2>>>>"+sql2);
					if(rs2.next())
					{
						groupname=rs2.getString("GPName");
					}
					else
					{
						groupname="-";
					}	
					System.out.println(">>>>>>akshay>>>>");
				%>  
					 <td sorttable_customkey="dd-MMM-yyyy" > <div align="right"><font color="maroon">
					<%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %>
					 <%=rs1.getString("TheTime") %></font></div></td>
			          
			       
			       
					 <td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=lon1%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rs1.getString("Location") %> </font> </b> </a></td> 
				 <td><div align="right"> <font color="maroon">
					<%=unitid %> </font></div></td>	
									<td><div align="right"><font color="maroon"><%=tpunit %></font></div> </td>
					<td><div align="left"><font color="maroon">
					<%=transporter%> </font></div> </td>
					<td><div align="right"><font color="maroon"><%=mobno %></font></div> </td>
					<td><div align="right"><font color="maroon"> <%=simno %></font></div> </td>	
					
					<td><div align="left"><font color="maroon"> <%=priphe%></font></div> </td>
					<td><div align="left"><font color="maroon"> <%=InstType%></font></div> </td>
					<td><div align="left"><font color="maroon"> <%=simcompany %></font></div> </td>
					<td><div align="left"><font color="maroon">
						<%=groupname%></font></div></td>
			   
			              <td width="68px"><div align="right"> <font color="maroon">
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
				  </font></div> </td>
			              <td><div align="left"><font color="maroon">
					 <%=instby%> </font></div>  </td>
			              <td><div align="left"> <font color="maroon">
						<%=instloc%></font> </div>  </td>
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
				    </font> </div> </td>
					<td> <div align="left"><font color="maroon"> <%=warranty%>
					
					</font> </div> </td>
			 
			         </tr>
			<%  i++;
			    
			}
		}else{
       %>
      <tr bgcolor='<%=bg%>'>
      	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehno%>&unitid=<%=unitid%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=spcnt%>)</font></b></a>  </td>
      
      <td><div align="right"><font color="maroon"> <%=i %> </font></div></td>
      <td><div align="left"><font color="maroon"> <%=Instruction%> </font></div></td>
<!--      <td><div align="left"><font color="maroon"> <%=tcategory%> </font></div></td>-->
<%
try{
	  	%>
	  <td> <div align="left"><font color=""><%if( tcategory.equalsIgnoreCase("-") ||  tcategory=="-") { %> <%=tctmsg %><%}else{ %> <%=tcategory %><%} %>	</font> </div> </td>
		
	<% }catch (Exception e)
	
	{
		   e.printStackTrace();
		}
%>
	
      <td> <div align="left"><font color="maroon"> <%=battrystatus%>	</font> </div> </td>
	   <%try{
		  	%>
		   <td> <div align="left"><font color="maroon"><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
      
<%
  

/**
sqllt ="select * from t_onlinedata where UnitID = '"+unitid+"' group by UnitID order by concat(TheDate,TheTime) desc ";
ResultSet latrst1 = stmt4.executeQuery(sqllt);
System.out.println(">>>>>>>>>>sqllt>>>>"+sqllt);
  if(latrst.next())
  {
	  lat1=latrst1.getDouble("LatitudePosition");
		lon1=latrst1.getDouble("LongitudePosition");
		battrystatus =latrst1.getString("bcharging");
		
		battrystatustime =latrst1.getString("bdatetime");
		
		
	  
  }	  				

  System.out.println(">>>>>>>>>>battrystatus>>>>"+battrystatus);			

**/
             



          

          String tpunit="", mobno="-", simno="-",psno="-",pcbno="-",boxno="-",batteryno="-";
			sql2="select * from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
			System.out.println(sql2);
			ResultSet unitmob=stmt2.executeQuery(sql2);
			if(unitmob.next())
			{
				mobno=unitmob.getString("MobNo");
				tpunit=unitmob.getString("TypeUnit");
				simno=unitmob.getString("SimNo"); 
				 simcompany=unitmob.getString("SimCompany");
				 priphe=unitmob.getString("Peripherals");
				 psno=unitmob.getString("PSNo");
				 pcbno=unitmob.getString("PCBNo");
				 boxno=unitmob.getString("BoxNo");	 
				 batteryno=unitmob.getString("BatteryNo");
			}	
			else
			{
				mobno="-";
				tpunit="-";
				simno="-";
			}

		//	sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by concat(InstDate,InstTime) desc limit 1";
			sql="select * from t_vehicledetails where VehicleRegNumber='"+rs1.getString("VehNo")+"'";
			ResultSet rst=st.executeQuery(sql);
			if(rst.next())
			{
				
				instdate=rst.getString("InstalledDate");
				instloc=rst.getString("InstalledPlace");
				instby=rst.getString("InstalledBy");
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
			 <td><div align="left"> <font color="maroon">
				<%=rs1.getString("VehNo") %> </font></div> </td>
<%		}
		else
		{
%>
              <td><div align="left"> <font color="maroon">
		<a href="javascript:toggleDetails1(<%=i%>,true);" title="Click Here">
			<%=rs1.getString("VehNo") %> </a>

			<br/>	
	<div class="popup" id="popupx<%=i%>">
		<table border="0" >
			<tr><td><a href="addcomplaint.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
			<tr><td><a href="inspection.jsp?vid=<%=vehid%>&warranty=<%=warranty%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
			<tr><td><a href="repunit.jsp?vid=<%=vehid%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('devicehealth.jsp?unitid=<%=getunit%>&vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Device Health</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
			<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('WebComplaint.jsp?vid=<%=vehid%> ','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Web Complaints</a></td></tr>
			
				<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&tpunit=<%=tpunit%>&simno=<%=mobno%>&mobno=<%=simno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
			</tr>	
			<tr>
				<td> <a href="techspcomment.jsp?tid=<%=tid %>&category=<%=tcategory %>&vehno=<%=rs1.getString("VehNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
			</tr>
			<tr>
				<td> <a href="sendmail.jsp?vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>&tid=<%=tid %>&category=<%=tcategory %>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
			</tr>
			<%//System.out.println("**********************************************"+userrole);
			if(SUPERADMIN.equalsIgnoreCase(userrole)){
				//System.out.println("*****************in superadmin loop*****************************");
			%>
			<tr>
				<td> <a href="reportincident.jsp?vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
			</tr>
			<%
			}else{
				//System.out.println("*****************doesnt match*************************");
			}
			//System.out.println("*****************superadmin*****************************");
			%>
			<tr><td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
		</table>
	
	</div>		
		</font></div> </td>
<% 		} %>
	
	  
	<%
		sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			vehiclecode=rs3.getString("VehicleCode");
		}
		sql2="select * from t_group where VehCode='"+vehid+"' ";
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
		 <td sorttable_customkey="dd-MMM-yyyy" > <div align="right"><font color="maroon">
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %>
		 <%=rs1.getString("TheTime") %></font></div></td>
       
		   <td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=lon1%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rs1.getString("Location") %> </font> </b> </a></td> 
		
		 
	 <td><div align="right"> <font color="maroon">
		<%=unitid %> </font></div></td>	

		<td><div align="left"><font color="maroon">
		<%=transporter%> </font></div> </td>
				<td><div align="right"><font color="maroon"><%=tpunit %></font></div> </td>
		<td><div align="right"><font color="maroon"><%=mobno %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=simno %></font></div> </td>	
		
		<td><div align="left"><font color="maroon"> <%=priphe%></font></div> </td>
		<td><div align="left"><font color="maroon"> <%=InstType%></font></div> </td>
		<td><div align="left"><font color="maroon"> <%=simcompany %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=psno%></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=pcbno %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=boxno %></font></div> </td>
		<td><div align="right"><font color="maroon"> <%=batteryno %></font></div> </td>
		<td><div align="left"><font color="maroon">
			<%=groupname%></font></div></td>
   
              <td width="68px"><div align="right"> <font color="maroon">
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
	  </font></div> </td>
              <td><div align="left"><font color="maroon">
		 <%=instby%> </font></div>  </td>
              <td><div align="left"> <font color="maroon">
			<%=instloc%></font> </div>  </td>
              <td><div align="right"><font color="maroon">
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
	    </font> </div> </td>
		<td> <div align="left"><font color="maroon"> <%=warranty%>
		
	   
	    
		</font> </div> </td>
 
         </tr>
<%  i++;
    }
    
    }	  
   
   }
    
    %>
      </table>
	
      <%}catch(Exception e)
{
	out.print("Exception -->"+e);
	e.printStackTrace();

}
finally
{
	//con1.close();
	
	try
	{
		con1.close();
	}catch(Exception e)
	{}
	try{

	diary1.closeConnection1();
	}catch(Exception e)
	{


	}

	try
	{
		con2.close();
	}catch(Exception e)
	{}
	try{

	diary1.closeConnection();
	}catch(Exception e)
	{


	}
	
	
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
</jsp:useBean>
  
  