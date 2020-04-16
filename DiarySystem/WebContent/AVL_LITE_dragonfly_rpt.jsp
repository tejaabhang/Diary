
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, stmtsp1,stmtsp11,stmtsp111,stmt1,stmt2,stmtsp, st1,st23,st24, st2, st3,st4,st5,st6, st9, st11, st01, st12,stamc,stamc1 ,stwar1,stwar2,stwar3,stwar4;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8,sql9;
String transporter,InstalledPlace,InstPlace="N.A.",today,Svehlist,username,simno="-",mobno="-",vehiclecode,typeunit;
String instdate,warranty, expdate,simcomp="-",peripherals="-",Empname="",Transporter="";
String sqlamc,sqlamc1,sqlamc2,sqlamc3,sqlamc4;
Format fmt = new SimpleDateFormat("yyyy-MM-dd");
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
	
	<script language="javascript">
	function addgroup()
	{
		//alert("in add group function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="AddEditGroup.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function deletegroup()
	{
		//alert("in delete group function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="DeleteGroup.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function addeditemp()
	{
		//alert("in add edit employee function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
	//	alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="AddEditMultipleEmp.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function unitmissing()
	{
		//alert("in unitmissing function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="unitmissingmultiple.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    			//alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value+"&unitid"+i+"="+document.getElementById("unitid"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	
	function deactive()
	{
		//alert("in deactivation function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="multipleDeactivation.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function permremoval()
	{
		//alert("in perm removal function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="perremoval.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}

	function tempremoval()
	{
		//alert("in temp removal function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="remuittempmultiple.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	
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
		function showtextarea(a,b,c)
		{
			document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
		}mouse;
		function canceldiv(A)
		{
		document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
		}

		function selectAll()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			if(document.fullfleet.maincb.checked==true)
			{
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=true;
				}
			}
			else
			{
				
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=false;
				}
			}
		}

		function validate()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			var flag="False";
		
			for(var j=0;j<cntr;j++)
			{	
				if(document.getElementById("cb"+j).checked==true)
				{
					flag="True";
				}		
			}
		
			if(flag=="False")
			{
				alert("Please select check-box");
				return false;	
			}		
			return true;
		}
		function changeAction()
		{ //alert("hi");
			var transporter=document.fullfleet.transporter.value;
			var cntr=document.fullfleet.cntr.value;
			//alert("hi"+cntr);
			cntr=cntr-1;
			//alert("hi"+cntr);
			var url="changewarranty.jsp?transporter="+transporter;
		      	var i=0;
		   	for(var j=0;j<cntr;j++)
		    	{	//alert("j loop");
		    		if(document.getElementById("cb"+j).checked==true)
		    		{
		            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
						 i++;
						// alert("map"+url);
		    		}		
		    	}
		        //write function to check no of check boxes get value
		        document.fullfleet.action=url+"&cntr="+i;
		      	//document.fullfleet.action="Changewarranty1.jsp";
		        //alert(document.fullfleet.action);
		        document.fullfleet.submit();
		}
</script>

<!-- Export to Excel By shoaib -->

<script type="text/javascript">  

function gotoExcel(elemId, frmFldId)
{  
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);  
          oFld.value = obj.innerHTML; 
           
          document.fullfleet.action ="excel.jsp";
          document.forms["fullfleet"].submit();
 }  

</script>

<% String  exportFileName="FV_AVL_LITE_REPORT.xls"; %>
<!-- Excel Exportation End -->


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
<!--- code start here ------>
<form id="fullfleet" name="fullfleet" method="post" action="" onSubmit="return validate();">
    <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	  <tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>Dragon Fly Report</b></font></td></tr>
	</table>
	
 <table border="0" bgcolor="white" width="100%">
	<tr> 
		<td>
		<table width=100%>
			<tr>
				<td align="right"><input type="hidden" id="tableHTML" name="tableHTML" value="" />
				 <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
				 <a href="#" style="font-weight: bold; color: black;" onclick="gotoPrint('mytable');"> 
				 <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> </a> 
				 <a	href="#" style="font-weight: bold; color: black;" onclick="gotoExcel('mytable', 'tableHTML');"> 
				 <img src="images/excel.jpg" width="15px" height="15px"	style="border-style: none"></img> </a></td>
			</tr>
		</table>
		<div id="mytable">
		
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
		st24=conn1.createStatement();
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
		e.printStackTrace();
		}
		// check transporter unit limit---------------
		int limit=0;
		Boolean flag=false;
		sql1="select Unitlimit from t_transporter where TypeValue='"+transporter+"' ";
		ResultSet rs1=stmt1.executeQuery(sql1);
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
		if(rs2.next())
		{
			count=rs2.getInt("count");
			//System.out.println("count--"+count);
		}
		String alert="";
		rem_unit=limit-count;
//	System.out.println("rem_unit--"+rem_unit);
		//-----------------------------------------------------------------------------------------------
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
<%		}
		String nocbselected=request.getParameter("nocbselected");
		if(nocbselected==null)
		{
		}
		else
		{
%>
			<table border="0" width="750px">
				<tr>
					<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
				</tr>
			</table>
<%	
		}
		String amcdone=request.getParameter("amcdone");
		if(amcdone==null)
		{
		}
		else
		{ 
%>
			<table border="0" width="750px">
				<tr>
					<td> <div align="center"> <font color="maroon" > Successfully changed AMC of selected Vehicles.</font> </div> </td>
				</tr>
			</table>
<%	
		}
%>

		<p></p>
		
	<table border="1" align="center" width="750px" class="sortable">
		<tr bgcolor="#BDBDBD">
					
		
			<td>Sr.</td>
			<td>Vehicle No</td>
			<td>Transporter</td>
			<td>Employee Name</td>
			<td>Updated</td>
			<td>Location</td>
			<td>Veh Available Date </td>
			<td>UnitID</td>
			<td>MobileNo</td>
			<td>SimNo</td>
			<td>Peripheral</td>
			<td>Unit Type</td>
			<td>Sim Comp</td>
			<td>GPName</td>                                                                    
			<td>Inst On</td>
			<td>Inst Location</td>
			<td>Warranty</td>
			<td>Latest Rep. Date</td>    
			<td>Replacement Location</td>    
			<td>Sp. Comments</td>
			<td>Sp. Comment Desc.</td>
			<td>Extra Comment</td>
			<td>Date of Entry</td>
			<td>Entered By</td>
			
		</tr>
		<%
		try
		{
			int i=1, j=0;
			String instdte="-";
			String Instdte="-";
			String instdte1="", vhno;
			Double lat, lon;
			Double lat2, lon2; 
			String direction;
			String loc11;
			String msg1="";
			String grp,insLocation, insdt, insdt1;
			String us=username.toUpperCase();
			//System.out.println("transporter--->"+transporter);
			
		   //System.out.println("in else statement");
	     	String drivername="";
		
			sql="select *  from t_vehicledetails where UnitID>=8000 and UnitID<9000 order by UnitID ASC";
		    System.out.println("sql>>>"+sql);
		
			ResultSet rst=st1.executeQuery(sql);
			while(rst.next())
			{
				Svehlist=Svehlist+","+rst.getString("VehicleCode");
			//	transporter=rst.getString("OwnerName");
			}
			Svehlist=Svehlist+")"; 
	//out.print(Svehlist);
	
	
			sql="select * from t_onlinedata where VehicleCode in "+Svehlist+" order by TheDate desc, TheTime desc";
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
				lat=rst1.getDouble("LatitudePosition");
				lon=rst1.getDouble("LongitudePosition");
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
		
    
		
    // Changes By shoaib--------------------------------------------------------------------
	 
	sql9 = "select Transporter from t_onlinedata where vehiclecode='"+rst1.getString("VehicleCode")+"'";
    System.out.println(""+sql9);
	ResultSet rstTransporter=st24.executeQuery(sql9);
	while(rstTransporter.next())
	{
	    Transporter=rstTransporter.getString("Transporter");
	}
	
	// Changes By shoaib--------------------------------------------------------------------
	
	
	
	
	sql8="select status,Empname from t_vehicledetails where vehiclecode='"+rst1.getString("VehicleCode")+"'";
    //System.out.println("sql8------>"+sql8);
	 ResultSet rstrem=st2.executeQuery(sql8);
	 if(rstrem.next())
	 {
	 	
		 Empname=rstrem.getString("Empname");
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
			try
			{
			instdte=rs4.getString("InstalledDate");
			Instdte=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte));
		    System.out.println("InstalledDate---->"+Instdte);
			InstalledPlace=rs4.getString("InstalledPlace");
		//	System.out.println("InstalledPlace---->"+InstalledPlace);
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
			
	
		
		
		
	if(!(Vehcode.equalsIgnoreCase("0")))
	{
	%>
	<tr bgcolor='<%=bg%>'>
	
	<td><div align="right"> <%=i%></div></td> 
	<td width="100px"><div align="right"><%=rst1.getString("VehicleRegNo")%></div></td>
	<td><div align="left"><%=Transporter %></div></td>
    <td><div align="left"><%=Empname %></div></td>
	<td><div align="right"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></div></td>
<!--	<td><div align="right">< %=rst1.getString("Location")%><font color="red"> < %=msg %> </font></div> -->
	<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst1.getDouble("LatitudePosition") %>&long=<%=rst1.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst1.getString("Location")%> </font> </b> </a> <font color="red"> <%=msg %> </font></td>  
<% 
	if(bg.equals("yellow"))
	{ %>
		<font color="red" >UNIT MISSING </font>
<%	}
	

	
	
	if(bg.equals("red"))
	{
			
		String remdate="", oldunitwith="", withtech="";
		// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
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
		//out.print(" <font color='yellow' size='2'> on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+" Unit with:"+oldunitwith+"</font>");
		} catch(Exception e)
		{
			//out.print(" <font color='yellow' size='2'> on (date not available)</font>");			
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
				
			//out.println("-");
				
				
			}
			}
	//--------------------------------------------------	
			
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	
	<td><div align="right"><%=unitid%></div></td>
	<td><div align="right"><%=simno%></div></td>
	<td><div align="right"><%=mobno%></div></td>
	
	
	<td><%=peripherals %></td>
	<td><%=typeunit %></td>
	<td><%=simcomp %></td>
	<td><%=group1%></td>
	<td><%=Instdte%></td>
	<td><%=InstalledPlace%></td>

	
	
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
		<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
	</tr>
				
        <%
	i++;
        j++;
	
	
	
	}
	}
	
	
	sql="select * from t_vehicledetails where UnitID>=8000 and UnitID<9000 and VehicleCode not in (select VehicleCode from t_onlinedata where UnitID>=8000)";
	
	ResultSet rst3=st1.executeQuery(sql);
	
	System.out.println(sql);
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
			try{
				instdte=rs4.getString("InstalledDate");
				Instdte=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs4.getString("InstalledDate")));
				}
				catch(Exception X)
				{
					instdte="-";
				}
				//out.println(instdte);
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
							Instdte=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs4.getString("InstalledDate")));
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
	
	<tr bgcolor='<%=bg1%>'>
	
	<td><%=i%> </td>
	
	<td><%=VehicleRegNumber%>
	<br/>	
	


	
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
	</div>	
	</td>
	      <td><%=Transporter %></td>
		  <td><%=Empname %></td>
	<td><% try{
	out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(rst3.getDate("InstalledDate")));
	}catch(Exception e)
	{
		e.printStackTrace();
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
	%> 
	<td><div align="right"><%=unitid%></div></td>
	<td><div align="right"><%=simno%></div></td>
	<td><div align="right"><%=mobno%></div></td>
	<td><%=peripherals %></td>
	<td><%=typeunit%></td>
	<td><%=simcomp %></td>
	
	<td><%=group1%></td>
	<td></td>
	
	<td><%=InstalledPlace%></td>
	
	
	
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
		<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
		</tr>		
		<%
		i++;
		j++;
		
		}
	%>
	
		
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

<!-- code end here --->
</form>
 		</div>
 		</td>
 		</tr>
 		</table>
 		</form>
 		
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

