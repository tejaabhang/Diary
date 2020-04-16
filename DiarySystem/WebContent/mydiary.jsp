<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@page import="com.transworld.diary.framework.VehicleAvailableData"
		import="com.transworld.diary.framework.TechnicianVehicleAvailableData"
		import="com.transworld.diary.framework.RepresentativeVehicleAvailableData"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>


<jsp:useBean id="diary" class="com.diary.beans.classes" scope="page">
<%@ include file="header.jsp" %>
<%
diary.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
diary.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>

<html>
<head>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script language="javascript">
		function onFormSubmit()
		{
			document.form1.submit();
		}
		function toggleDetails(id, show)
		{
			var popup = document.getElementById("popup"+id);
			if (show) 
			{
				popup.style.visibility = "visible";
				popup.setfocus();				
			} 
			else 
			{
				popup.style.visibility = "hidden";
			}
		}

		function showhide1()
		{
			alert("show hide function");
			var cnt=document.getElementById("cnt").value;
			alert(cnt)
			var td10,td20,td30,td40,td50,td60,td70,td80,td90,td100;
			var tdx=document.getElementById("tdx").value;
			var condition="";
			if(tdx=="Hide")
			{
				alert("hide is pressed");
				document.getElementById("tdx").value="Show";
				for(i=0;i<=cnt;i++)
				{	
					td10=document.getElementById("td10"+i);
					td10.style.display='none';
					td20=document.getElementById("td20"+i);
					td20.style.display='none';
					td30=document.getElementById("td30"+i);
					td30.style.display='none';
					td40=document.getElementById("td40"+i);
					td40.style.display='none';
					td50=document.getElementById("td50"+i);
					td50.style.display='none';
					td60=document.getElementById("td60"+i);
					td60.style.display='none';
					td70=document.getElementById("td70"+i);
					td70.style.display='none';
					td80=document.getElementById("td80"+i);
					td80.style.display='none';
					td90=document.getElementById("td90"+i);
					td90.style.display='none';
					td100=document.getElementById("td100"+i);
					td100.style.display='none';
					
				} 
			}
			else
			{
				alert("Show");
				document.getElementById("tdx").value="Hide";
						for(i=0;i<=cnt;i++)
				{	
							td10=document.getElementById("td10"+i);
							td10.style.display='';
							td20=document.getElementById("td20"+i);
							td20.style.display='';
							td30=document.getElementById("td30"+i);
							td30.style.display='';
							td40=document.getElementById("td40"+i);
							td40.style.display='';
							td50=document.getElementById("td50"+i);
							td50.style.display='';
							td60=document.getElementById("td60"+i);
							td60.style.display='';
							td70=document.getElementById("td70"+i);
							td70.style.display='';
							td80=document.getElementById("td80"+i);
							td80.style.display='';
							td90=document.getElementById("td90"+i);
							td90.style.display='';
							td100=document.getElementById("td100"+i);
							td100.style.display='';
					
				} 
			}
		}
	</script>
	<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
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
<%!
	final String ALL = "All";
	final String REPRESENTATIVE = "Representative";
	final String TECHNICIAN = "Technician";
%>

<%
	final SimpleDateFormat americanDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	final String today = americanDateFormat.format(new java.util.Date());
	final Format indianDateFormat = new SimpleDateFormat("dd-MMM-yyyy");
	final String tech=request.getParameter("tech");
	final String para=request.getParameter("parameter");
	if((para!=null && para.equalsIgnoreCase("tech")) || tech !=null)
	{
%>
		<%@ include file="headertech.jsp" %>
<%
	} 
	else
	{
%>
		<%@ include file="header1.jsp" %>
<%
	}
%>
      </div>  
		<div id="gbox1">
            <div id="gbox-top1"> </div>
            	<div id="gbox-bg1">
              		<div id="gbox-grd1">
<%
Connection conn=null,conn1=null;
Statement st=null, st1=null, st2=null;;
try{
//Class.forName(MM_dbConn_DRIVER);


//conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

conn = diary.ReturnConnection();
	conn1 = diary.ReturnConnection1();


 st=conn.createStatement();
 st1=conn.createStatement();
 st2=conn.createStatement();
String dlt="",insrt="";


final String transporterName=request.getParameter("trans");
	final String representativeName = request.getParameter("repname");
	final String technicianName = request.getParameter("techname");
	final String dataFilterRequest = request.getParameter("dataFilter");
	final String dataFilter = (null == dataFilterRequest) ? ALL : dataFilterRequest;
	final String userName=session.getAttribute("username").toString();
	final String userRole=session.getAttribute("userrole").toString();
	final String fromDateRequest = request.getParameter("fromDate");
	final String toDateRequest = request.getParameter("toDate");
	final String fromDate = (fromDateRequest == null) ? today : fromDateRequest.toString();
	final String toDate = (toDateRequest == null) ? today : toDateRequest.toString();
	int numVehicles = 0;
	int technicianRecordsCount = 0;
	int representativeRecordsCount = 0;
	List<VehicleAvailableData> vehicleAvailableData= null;
	List<TechnicianVehicleAvailableData> technicianVehicleData = null;
	List<RepresentativeVehicleAvailableData> representativeVehicleData = null;
    try{
    	if(ALL.equalsIgnoreCase(dataFilter)){
    		vehicleAvailableData = unitDetailsDao.getVehicleAvailableData( 
    			fromDate, toDate, transporterName,representativeName, technicianName);    		
    		numVehicles = vehicleAvailableData.size();
    	
    		//out.println("numVehicles"+numVehicles);
    	} else if (TECHNICIAN.equalsIgnoreCase(dataFilter)){
    		technicianVehicleData = unitDetailsDao.getVehicleAvailableDataForTechnician(
    				fromDate, toDate);
    		technicianRecordsCount = technicianVehicleData.size();
    	} else if (REPRESENTATIVE.equalsIgnoreCase(dataFilter)){
    		representativeVehicleData = unitDetailsDao.getVehicleAvailableDataForRepresentative(
    				fromDate, toDate);
    		representativeRecordsCount = representativeVehicleData.size();    	
    	}
	} catch(Exception e){
		e.printStackTrace();
	}
%>
  <form action="" name="form1" id="form1" method="get">	
  <div align="center">
   <table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
		
		<td><input type="hidden" name= "cnt" id="cnt" value=<%=numVehicles%>></input><center><b>
		Vehicles Available to check the Units from Date
<%
	out.print(indianDateFormat.format(americanDateFormat.parse(fromDate)));
	out.print("  to Date "+indianDateFormat.format(americanDateFormat.parse(toDate)));
%>.
		</b></center>
		</td>
		</tr>	
		
		
		<tr><td>
			 <div align="center">
			<input type="radio" name="dataFilter" value="<%=ALL%>" <%if(ALL.equalsIgnoreCase(dataFilter)) { out.print("CHECKED"); }%> onclick="onFormSubmit();" ><b><%=ALL%></b>
			<input type="radio" name="dataFilter" value="<%=TECHNICIAN%>" <%if(TECHNICIAN.equalsIgnoreCase(dataFilter)) { out.print("CHECKED"); }%> onclick="onFormSubmit();" ><b><%=TECHNICIAN%></b>
			<input type="radio" name="dataFilter" value="<%=REPRESENTATIVE%>" <%if(REPRESENTATIVE.equalsIgnoreCase(dataFilter)) { out.print("CHECKED"); }%> onclick="onFormSubmit();"><b><%=REPRESENTATIVE%></b>
			</div></td></tr>
			<tr><td> <div align="center"><b>From Date:</b>
			<input type="text" id="fromDate" name="fromDate" size="13" class="formElement" value="<%=fromDate%>" readonly/>
	             <script type="text/javascript">
	             Calendar.setup(
	             {
	                 inputField  : "fromDate",         // ID of the input field
	                 ifFormat    : "%Y-%m-%d",     // the date format
	                 button      : "calendarFromDate"       // ID of the button
	             });
	             </script>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>To Date:</b>
            <input type="text" id="toDate" name="toDate" size="13" class="formElement" value="<%=toDate%>" readonly/>
			
           		  <script type="text/javascript">
		             Calendar.setup(
		             {
		                 inputField  : "toDate",         // ID of the input field
		                 ifFormat    : "%Y-%m-%d",     // the date format
		                 button      : "calendarToDate"       // ID of the button
		             });
           		  </script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="submit" name="Submit" Value="Submit" class="formElement">
       </div></td></tr>
				
		
		<!-- 
		<tr><td><input type="button" value="Hide" onclick="showhide1();" class="formElement" id="tdx" name="tdx" >&nbsp;&nbsp;</td></tr>  -->
		</table>	
		</div>
		</form>
		<br><br>
<%
	if(ALL.equalsIgnoreCase(dataFilter))
	{
%>
	<table border="1" align="center" width="750px" class="sortable">
		<tr  bgcolor="#BDBDBD">
		<td><b>Sr.</b></td>
		<td><b>Flag</b></td>
		<td><b>VehRegNo.</b></td>
		<td><b>Last Date</b></td>
		<td><b>Last Location</b></td>
		<td><b>Available Date</b></td>
		<td><b>Technician</b></td>
		<td><b>Comp. Desc.</b></td>
		<td><b>Contact Person</b></td>
		<td><b>InWarranty</b></td>
		<td><b>Unit Id</b></td>
		<td><b>Mobile No</b></td>
		<td><b>Sim No</b></td>
		<td><b>Peripherals</b></td>
		<td><b>UnitType</b></td>
		<td><b>Sim Company</b></td>
		<td><b>Transporter</b></td>
		<td><b>Comp. Lodged Date</b></td>
		<td><b>Location</b></td>
		<td><b>Status Of Complaint</b></td>
		<td><b>Last Rep. Date</b></td>
		<td><b>Replacement Ent by</b></td>
		<td><b>Ent. By</b></td>	
		</tr>
<%
		try{
			
			dlt="delete from db_gps.t_onlinedatacopy ";
			st1.executeUpdate(dlt);
			System.out.println(">>>dlt<<<"+dlt);
			
			insrt="insert into  db_gps.t_onlinedatacopy(select * from db_gps.t_onlinedata)  ";
			st2.executeUpdate(insrt);
			System.out.println(">>>insrt<<<"+insrt);
			
			
			
			
			
			for (int counter = 0; counter < numVehicles; counter++) 
			{
				//out.println("in for loop");
				final VehicleAvailableData currentRecord = vehicleAvailableData.get(counter);
				int i = counter+1;
				//out.println("counter"+counter);
			int flagCountForUnit=0,flagCountForVehicle=0,WarrantyDayFromVehicle=0,WarrantyDayFromAmc=0;
				
				//out.println("currentRecord.getFlagCountForUnit()"+currentRecord.getFlagCountForUnit());
		/*			if(null==currentRecord.getFlagCountForUnit()||currentRecord.getFlagCountForUnit().equalsIgnoreCase("null")){
					flagCountForUnit=0;
				}else{
					
					flagCountForUnit=Integer.parseInt(currentRecord.getFlagCountForUnit().trim());
				}
				if(null==currentRecord.getFlagCountForVehicle()||currentRecord.getFlagCountForVehicle().equalsIgnoreCase("null")){
					flagCountForVehicle=0;
				}else{
					flagCountForVehicle=Integer.parseInt(currentRecord.getFlagCountForVehicle().trim());
				}
				*/
				if(null==currentRecord.getWarrantyDayFromVehicle()||currentRecord.getWarrantyDayFromVehicle().equalsIgnoreCase("null")){
					WarrantyDayFromVehicle=0;
				}else{
					WarrantyDayFromVehicle=Integer.parseInt(currentRecord.getWarrantyDayFromVehicle().trim());
				}
				if(null==currentRecord.getWarrantyDayFromAmc()||currentRecord.getWarrantyDayFromAmc().equalsIgnoreCase("null")){
					WarrantyDayFromAmc=0;
				}else{
					WarrantyDayFromAmc=Integer.parseInt(currentRecord.getWarrantyDayFromAmc().trim());
				}
				//out.println("flagCountForUnit--->"+flagCountForUnit);
				
			//	out.println("flagCountForUnit--->"+flagCountForUnit);
				
				
			//	System.out.println("flegCountForVehicle--->"+flagCountForVehicle);
				int totalFlagCount=flagCountForUnit+flagCountForVehicle;
			//	out.println("totalFlagCount--->"+totalFlagCount);
				
			//	out.println("WarrantyDayFromVehicle--->"+WarrantyDayFromVehicle);
				
			//	out.println("WarrantyDayFromVehicle"+WarrantyDayFromVehicle+"WarrantyDayFromAmc"+WarrantyDayFromAmc);
		String MobNo="",SimNo="",SimCompany="",Peripherals="",InstType="",InstDate="",EntBy="",TheDate="",TheTime="",Location="",UnitID="";
		int warrantyTill=0;
		String sql5="select TheDate,TheTime,Location,UnitID from db_gps.t_onlinedatacopy where VehicleRegNo='"+currentRecord.getVehicleRegistrationNumber()+"' ";
		ResultSet rs5=st.executeQuery(sql5);
		if(rs5.next()){
			TheDate=rs5.getString("TheDate");
			TheTime=rs5.getString("TheTime");
			Location=rs5.getString("Location");
			UnitID=rs5.getString("UnitID");
		}
		String sql="select MobNo,SimNo,SimCompany,Peripherals from db_gps.t_unitmaster where UnitID='"+UnitID+"'";
		System.out.println("UnitID00000>"+sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next()){
			MobNo=rs.getString("MobNo");
			SimNo=rs.getString("SimNo");
			SimCompany=rs.getString("SimCompany");
			Peripherals=rs.getString("Peripherals");
		}
		
		String sql1="select InstType from db_gps.t_unitmasterhistory where UnitID='"+UnitID+"' order by EntDate DESC limit 1";
		ResultSet rs1=st.executeQuery(sql1);
		if(rs1.next()){
			InstType=rs1.getString("InstType");
		}
		
		String sql2="select count(*) as count from t_techspecialrep where Closed='No' and cmmt_type in ('Unit','Vehicle')  and UnitID='"+UnitID+"'";
		ResultSet rs2=st.executeQuery(sql2);
		if(rs2.next()){
			totalFlagCount=rs2.getInt("count");
		}
		
		String sql3="select InstDate,EntBy from db_gps.t_unitreplacement where InstType='Rep' and VehRegNo='"+currentRecord.getVehicleRegistrationNumber()+"' order by InstDate DESC limit 1 ";
		ResultSet rs3=st.executeQuery(sql3);
		if(rs3.next()){
			InstDate=rs3.getString("InstDate");
			EntBy=rs3.getString("EntBy");
		}
		 
		String sql4="SELECT TO_DAYS(max( WarrantyTill ))-TO_DAYS(CURRENT_DATE()) as warrantyTill	FROM db_gps.t_amchistory where VehNo='"+currentRecord.getVehicleRegistrationNumber()+"'";
		ResultSet rs4=st.executeQuery(sql4);
		if(rs4.next()){
			warrantyTill=rs4.getInt("warrantyTill");
		}
				String warranty="";
				try{if(warrantyTill>0) {
				warranty="Yes";
				}else{ 
				warranty="No";
				}}catch(Exception e){e.printStackTrace();}
				%>
				<tr>
				<td><%=i%></td>
				<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=currentRecord.getVehicleRegistrationNumber()%>&unitid=<%=UnitID%>','win1','width=600,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="Black" size="2"> Flag(<%=totalFlagCount%>)</font></b></a>  </td>
				<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=currentRecord.getVehicleRegistrationNumber()%></b></a>
				<br/>	
					<div class="popup" id="popup<%=i%>">
					<table border="0" >
						<tr><td><a href='action.jsp?tno=<%=currentRecord.getTokenNumber()%>&tech=<%=currentRecord.getTechnician()%>&vehno=<%=currentRecord.getVehicleRegistrationNumber()%>&d1=<%=fromDate%>&d2=<%=toDate%>' onclick="toggleDetails(<%=i%>,false);">Action By Technician</a></td></tr>
						<tr><td><a href="#" onClick="window.open ('rep_history.jsp?vid=<%=currentRecord.getVehicleCode()%>', 'win1', 'width=750, height=400, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')" > View History</a></td></tr>
						<tr><td><a href='reallocate.jsp?tno=<%=currentRecord.getTokenNumber()%>' onclick="toggleDetails(<%=i%>,false);">Re-Allocate</a></td></tr>
						<tr><td><a href="repunit.jsp?vid=<%=currentRecord.getVehicleCode()%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
						<tr><td><a href="inspection.jsp?vid=<%=currentRecord.getVehicleCode()%>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
						<tr><td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=currentRecord.getVehicleCode()%>&vehno=<%=currentRecord.getVehicleRegistrationNumber()%>&unitid=<%=UnitID%>&simno=<%=currentRecord.getSimNumber()%>&mobno=<%=currentRecord.getMobileNumber()%>&transp=<%=currentRecord.getTransporter()%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td></tr>	
						<tr><td> <a href="techspcomment.jsp?vehno=<%=currentRecord.getVehicleRegistrationNumber()%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td></tr>
						<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
					</table>
					</div>
	
				</td>
				<td><%=TheDate%> <%=TheTime%></td>
				<td><%=Location%></td>
				<td><%=currentRecord.getAvailableDate()%></td>
				<td><%=currentRecord.getTechnician()%></td>
				<td><%=currentRecord.getComplaintDescription()%></td>
				<td><%=currentRecord.getContactPerson()%></td>		
				<td  id="td1<%=i%>"><%=warranty%></td>
				<td  id="td2<%=i%>"><%=UnitID%></td>
				<td  id="td3<%=i%>"><%=MobNo%></td>
				<td  id="td4<%=i%>"><%=SimNo%></td>
				<td  id="td5<%=i%>"><%=Peripherals%></td>
				<td id="td6<%=i%>"><%=InstType%></td>
				<td id="td7<%=i%>"><%=SimCompany%></td>
				<td><%=currentRecord.getTransporter()%></td>
				<td><%=currentRecord.getComplaintLodgedDate()%></td>
				<td><%=currentRecord.getLocation()%></td>
				<td><%=currentRecord.getStatusOfComplaint() %></td>	
				<td  id="td8<%=i%>"><%=InstDate%></td>
				<td  id="td9<%=i%>"><%=EntBy%></td>
				
				<%
				if(null==currentRecord.getEnteredBy()||"null".equalsIgnoreCase(currentRecord.getEnteredBy())){
				%>
				<td  id="td10<%=i%>"><%="-"%></td>  
				<%
				}else{
				%>
				<td  id="td10<%=i%>"><%=currentRecord.getEnteredBy()%></td>
				<%} %>
				</tr>
<%
			}
		}catch(Exception e)
		{
			out.println("<tr><td colspan=20>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
		}
%>
			</table>
<%
	}
	else if(TECHNICIAN.equalsIgnoreCase(dataFilter))
	{
%>
				<table border="1" align="center" width="750px" class="sortable">
				<tr  bgcolor="#BDBDBD">
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>Vehicle Available Today</td>
				</tr>
<%
		try{
			for (int counter = 0; counter < technicianRecordsCount; counter++) 
			{
				final TechnicianVehicleAvailableData currentRecord = technicianVehicleData.get(counter);
				int i = counter+1;
%>
						<tr>
							<td><div align="right"><%=i%></div></td>
							<td><%=currentRecord.getTechnicianName()%></td>
							<td><div align="right"><%=currentRecord.getMobileNumber()%></div></td>
							<td><div align="right"><a href='mydiary.jsp?techname=<%=currentRecord.getTechnicianName()%>&fromDate=<%=fromDate%>&toDate=<%=toDate%> '><b><%=currentRecord.getVehicleCount()%></b></a>
							</div></td>						
						</tr>
<%
			}
		}catch(Exception e)
		{
			out.println("<tr><td colspan=4>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();					
		}
%>
				</table>
<%
	}
	else if(REPRESENTATIVE.equalsIgnoreCase(dataFilter))
	{
%>
				<table border="1" align="center" width="750px" class="sortable">
		       <tr bgcolor="#BDBDBD">
				<td>Sr.</td>
				<td>Name</td>
				<td>Vehicle Available Today</td>
				
				</tr>
<%
		try{
			for (int counter = 0; counter < representativeRecordsCount; counter++) 
			{
				final RepresentativeVehicleAvailableData currentRecord = representativeVehicleData.get(counter);
				int i = counter+1;
%>
						<tr>
							<td><div align="right"><%=i%></div></td>
							<td><%=currentRecord.getRepresentativeName()%></td>
							<td><div align="right"><a href='mydiary.jsp?repname=<%=currentRecord.getRepresentativeName()%>&fromDate=<%=fromDate%>&toDate=<%=toDate%> '><b><%=currentRecord.getVehicleCount()%></b></a></div></td>
						</tr>
<%
			}
		}catch(Exception e)
		{
			out.println("<tr><td colspan=3>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();	
		}
%>
				</table>	
<%
	}

}catch(Exception e){
	e.printStackTrace();
	
}finally{
	try
	{
		st.close();
		conn.close();
		
	}catch(Exception e)
	{}
	
	
	try
	{
		conn1.close();
	}catch(Exception e)
	{}
try{
	
	diary.closeConnection();
}catch(Exception e)
{
	
out.println("exp"+e);	
}


try{
	
	//diary.closeConnection1();
}catch(Exception e)
{
	
	
}
	
	//conn.close();	
//conn1.close();	
}
%>
             		 </div>
   				 </div>
			<div id="gbox-bot1"> </div>
		</div>
      </div>
    </div>
  </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
 </body>
</html>
</jsp:useBean>

