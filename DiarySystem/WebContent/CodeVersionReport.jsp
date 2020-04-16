
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con, con2;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7,stmt8,stmt9,stmt10,stmt11,stmt12;
Statement stmt13,stmt14,stmt15,stmt16,stmt17,stmt18,stmt19,stmt20,stmt21,stmt22,stmt23,stmt24,stmt25;
Statement stmt26,stmt27,stmt28,stmt29;
String exportFileName="";
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
	
	
<script type="text/javascript">  

function gotoExcel(elemId, frmFldId)
{  
          try
          {

				//alert("A");
               var obj = document.getElementById(elemId);
           	  var oFld = document.getElementById(frmFldId);
           	//alert("b");  
           		var filename = document.getElementById(fileName);
           		//alert(filename);
           		oFld.value = obj.innerHTML; 
           		//alert("c");
           		filename = "CodeVersionReport.xls";
           	document.codeverfrm.action ="excel.jsp?fileName="+filename;
           	document.forms["codeverfrm"].submit();

           	document.codeverfrm.action ="";
		  }
		  catch(e)
		  {
			//alert("exception :- "+e);          
		  }	

}

</script>





<title>Seven Day Diary System</title>
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
 
   <form name="codeverfrm" method="post" action="" onSubmit="return validate();">
   <table border="0" width="700px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Code Version Report</b>  </font></td>
		</tr>
	</table>
	
<%
try
{
	    Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    exportFileName = "CodeVersionReport.xls";
	    
	    System.out.println("con2 in the code Ver page MM_dbConn_STRING :- "+MM_dbConn_STRING);
	    System.out.println("con in the code version page MM_dbConn_STRING1 :- "+MM_dbConn_STRING1);
	    
	    
	    
	    stmt1=con.createStatement();
        stmt2=con.createStatement();
        stmt3=con.createStatement();
        stmt4=con.createStatement();
        stmt5=con.createStatement();
        stmt6=con.createStatement();
        stmt7=con.createStatement();
        stmt8=con.createStatement();
        stmt9=con.createStatement();
        stmt10=con.createStatement();
        stmt11=con.createStatement();
        stmt12=con.createStatement();
        stmt13=con.createStatement();
        stmt14=con.createStatement();
        stmt15=con2.createStatement();
        stmt16=con.createStatement();
        stmt17=con.createStatement();
        stmt18=con.createStatement();
        stmt19=con2.createStatement();
        stmt20=con2.createStatement();
        stmt21=con.createStatement();
        stmt21=con.createStatement();
        stmt22=con2.createStatement();
        stmt23=con.createStatement();
        stmt24=con.createStatement();
        stmt25=con.createStatement();
        stmt26=con.createStatement();
        stmt27=con.createStatement();
        stmt28=con.createStatement();
        stmt29=con.createStatement();
        
        
	    String sql,sql1; 
	    ResultSet rs1,rs2;
        String codeVersion = request.getParameter("CodeVersion");
        
        System.out.println("code version is :- "+codeVersion);  


%>
	<table border="0" width="700px" bgcolor="#E6E6E6" align="center">
	   <tr>
       		<td align="center" colspan="2">
       			<b></b>
       		</td>
       </tr>
       <tr bgcolor="#BDBDBD">
       		<td> <font color="black"> <b>Code Version</b> </font> </td>
      		<td colspan="1">
		      	 <select name="CodeVersion" id="CodeVersion">  
         			<option value="Select">Select</option>
<%
 					if(!(codeVersion == null))
 					{
%>
 						<option value="<%=codeVersion %>" selected="selected"><%=codeVersion %></option>
<%
 					}
%>
<%
        sql="select CodeVersion from db_gps.t_codeversionmaster ";
        rs1=stmt2.executeQuery(sql);
        while(rs1.next())
   	   { 
   	   			
   	   		if(!(codeVersion == null) && (codeVersion.equalsIgnoreCase(rs1.getString("CodeVersion")) ))
   	   		{
   	   		
   	   		}
   	   		else
   	   		{
   	   		%>
      		<option value="<%=rs1.getString("CodeVersion") %> "> <%=rs1.getString("CodeVersion") %> </option>
	<% 
   	   		}
   	   		
   	   } %>
		</select> 
		
   	   </td>
   	   
   	   
   	   
   	   <td> <input type="submit" name="SUBMIT" id="SUBMIT" value="Submit"></input></td>
 </tr>	

	
	
</table>
	

<%
  if(!(codeVersion == null) && !(codeVersion.equalsIgnoreCase("select")))
  {
			
	System.out.println("inside of if block and the codeversion is :- "+codeVersion);	
		
	%>
	
	
    
    
    </div>
	</div>
	</div>
    
    
	<br></br>
	<br></br>
		
		
<!--	<div align="right">-->
		
<!--		<table width=100%>-->
		<div width="100%" align="right">
<!--		<table width="100%" border="2">-->
<!--			<tr>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--			    <td></td>-->
<!--				<td>-->
				 <input type="hidden" id="tableHTML" name="tableHTML" value="" >
				 <%System.out.println("exportFileName HHHHHHHKKKKKK:- "+exportFileName); %>
				<input type="hidden" id="fileName" name="fileName" value="<%=exportFileName%>" />
				 <a href="#" style="font-weight: bold; color: black;" onclick="gotoPrint('mytable');"> 
				 <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> </a> 
				 <a	href="#" style="font-weight: bold; color: black;" onclick="gotoExcel('mytable','tableHTML');"> 
				 <img src="images/excel.jpg" width="15px" height="15px"	style="border-style: none"></img> 
				 </a>
				 <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
				 
				 
				 
<!--				 </td>-->
<!--			</tr>-->
<!--		</table>	-->
<!--		</div>	-->
<!--		</table>-->
 	
	</div>
	<div>
	
<!--	<table width="100%" class="sortable" align="right">-->
<!--	  <tr >-->
<!--	-->
<!--	 <td>-->
<!--	 <input type="hidden" id="tableHTML" name="tableHTML" value="" >-->
<!--				 <input type="hidden" id="fileName" name="fileName" value="" /> -->
<!--				 <a href="#" style="font-weight: bold; color: black;" onclick="gotoPrint('mytable');"> -->
<!--				 <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> </a> -->
<!--				 <a	href="#" style="font-weight: bold; color: black;" onclick="gotoExcel('mytable','tableHTML');"> -->
<!--		<img src="images/excel.jpg" width="15px" height="15px"	style="border-style: none"></img> </a>-->
<!--				 -->
<!--	 -->
<!--	 -->
<!--	 </td>-->
<!--	-->
<!--	-->
<!--	</tr>-->
<!--	-->
<!--	-->
<!--	</table>-->
<!--	-->
	
	
	
	
	
		
	<div id="mytable">
	<table class="sortable" border="1" align="center" width="750px" >
			
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
		
			int i=1, j=0;
			String instdte="-";
			String Instdte="-";
			String instdte1="", vhno;
			Double lat, lon;
			Double lat2, lon2; 
			String direction="",Empname="",InstalledPlace="",sqlamc1="",InstPlace="";
			String loc11="",sql8="",today="",sql9="",Transporter="",sql4="",sqlamc="",sql5="",sql6="";
			String simno="",mobno="",typeunit="",simcomp="",peripherals="";
			String msg1="";
			String grp,insLocation, insdt, insdt1,warranty="";
			String username=session.getAttribute("username").toString();
			String us=username.toUpperCase();
			codeVersion = codeVersion.trim();
			String unitidWithOnlineData = "";
			String bg="", msg="";
			int delaydays=0;
			int amc=0;
			
			
			
			java.util.Date defoultdate = new java.util.Date();
			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			long miliseconds=defoultdate.getTime();
				//System.out.println("miliseconds"+miliseconds);
			miliseconds=miliseconds-1000 * 60 * 60 *24;
			defoultdate.setTime(miliseconds);
			today = formatter.format(defoultdate);
			
			System.out.println("today :- "+today);
			
			
			String sql_unit = "select * from db_gps.t_unitmaster where SwVer like '"+codeVersion+"%' ";
			System.out.println("sql_unit is :- "+sql_unit);
			ResultSet rst = stmt3.executeQuery(sql_unit);
			
			String unitid_list="(";
			while(rst.next())
			{
				unitid_list = unitid_list + rst.getString("UnitID") + ",";	
			
			}
			
			unitid_list = unitid_list.substring(0,(unitid_list.lastIndexOf(",")));
			
			unitid_list = unitid_list +")";
		
			System.out.println("unit id list :- "+unitid_list);	
		
			String sql_veh = "select *  from db_gps.t_vehicledetails where UnitID IN"+unitid_list+" order by UnitID ASC";		
			System.out.println("the sql_veh is "+sql_veh);
			ResultSet rst1 = stmt4.executeQuery(sql_veh);
			String vehCodeList = "(";  
			
			while(rst1.next())
			{
				vehCodeList = vehCodeList + rst1.getString("VehicleCode") + ",";	
			
			}
			
			vehCodeList = vehCodeList.substring(0,vehCodeList.lastIndexOf(","));
			
			vehCodeList = vehCodeList + ")";
			
			System.out.println("vehCodeList :- "+vehCodeList);
			
			
			sql="select * from db_gps.t_onlinedata where VehicleCode in "+vehCodeList+" order by TheDate desc, TheTime desc";
			
			System.out.println("sql :- "+sql);
			
			ResultSet rst3=stmt24.executeQuery(sql);
	//int i=1, j=0;
		
			String Vehcode="",unitid="",group1="", vehregno="";
			
			
			while(rst3.next())
			{
				
				unitidWithOnlineData = unitidWithOnlineData + rst3.getString("UnitId") + ",";
				String upddate=rst3.getString("TheDate");
				String loc=rst3.getString("Location");
				lat=rst3.getDouble("LatitudePosition");
				lon=rst3.getDouble("LongitudePosition");
			
				
				sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+upddate+"') as days";
				System.out.println("sql8 :- "+sql8);
				ResultSet rsdate=stmt5.executeQuery(sql8);
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
				} 
				catch(Exception e)
				{
					nogpschk=loc;
				}
				if(nogpschk.equals("No GPS Data"))
				{
					msg=msg+" No GPS Data";
				}
				
				
				sql9 = "select Transporter from t_onlinedata where vehiclecode='"+rst3.getString("VehicleCode")+"'";
			    System.out.println(""+sql9);
				ResultSet rstTransporter=stmt6.executeQuery(sql9);
				while(rstTransporter.next())
				{
				    Transporter=rstTransporter.getString("Transporter");
				}	
			
				
				sql8="select status,Empname from t_vehicledetails where vehiclecode='"+rst3.getString("VehicleCode")+"'";
			    //System.out.println("sql8------>"+sql8);
				 ResultSet rstrem=stmt7.executeQuery(sql8);
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
				
				 	Vehcode=rst3.getString("VehicleCode");
					
				 	sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"'";
					
					ResultSet rs4=stmt8.executeQuery(sql4);
					if(rs4.next())
					{
						unitid=rs4.getString("UnitID");
						System.out.println("unitid-->"+unitid);
						vehregno=rs4.getString("VehicleRegNumber");
						try
						{
						instdte=rs4.getString("InstalledDate");
						Instdte=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte));
					    System.out.println("InstalledDate---->"+Instdte);
						InstalledPlace=rs4.getString("InstalledPlace");
						System.out.println("InstalledPlace---->"+InstalledPlace);
						}
						catch(Exception X)
						{
							instdte="-";
							InstalledPlace="-";
						}
							
						
						sqlamc="select * from t_amchistory where VehCode = '"+Vehcode+"' order by NewDate desc limit 1";
						ResultSet rsamc=stmt9.executeQuery(sqlamc);
						if(rsamc.next())
						{
							if(!(null==rsamc.getDate("WarrantyTill")))
							{
							try{	
							sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
							ResultSet rsamc1=stmt10.executeQuery(sqlamc1);
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
								ResultSet rst222=stmt11.executeQuery(sql4);
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
							ResultSet rst222=stmt12.executeQuery(sql4);
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
						ResultSet rs5=stmt13.executeQuery(sql5);
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
						
						ResultSet rs6=stmt14.executeQuery(sql6);
						if(rs6.next())
						{
							group1=rs6.getString("GPName");
						}
						else
						{
							group1="None";
						}

						String  spcnmttype="";
						 String sqlsp="select * from t_techspecialrep where ((VehRegNo='"+rst3.getString("VehicleRegNo")+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc Limit 1";
						//String sqlsp="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
						System.out.println("sqlsp:- "+sqlsp);
						ResultSet rssp=stmt15.executeQuery(sqlsp);
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
						
						<td><div align="right"> <%=i%></div></td> 
						<td width="100px"><div align="left"><%=rst3.getString("VehicleRegNo")%></div></td><%//onlinedata table %>
						<td><div align="left"><%=Transporter %></div></td>
					    <td><div align="left"><%=Empname %></div></td>
						<td><div align="left"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("TheDate"))%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(rst3.getString("TheTime")))%></div></td>
					<!--	<td><div align="right">< %=rst1.getString("Location")%><font color="red"> < %=msg %> </font></div> -->
						<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst3.getDouble("LatitudePosition") %>&long=<%=rst3.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst3.getString("Location")%> </font> </b> </a> <font color="red"> <%=msg %> </font></td>  
						<% 
						
						if(bg.equals("yellow"))
						{ %>
							<font color="red" >UNIT MISSING </font>
					<%	}
						
						
						if(bg.equals("red"))
						{
								
							String remdate="", oldunitwith="", withtech="";
							// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
							String sql12="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNo")+"' or VehCode='"+rst3.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
							ResultSet rs9=stmt16.executeQuery(sql12);	
							if(rs9.next())
							{
								unitid=rs9.getString("OldUnitId");
								remdate=rs9.getString("EntDate");
								oldunitwith=rs9.getString("OldUnitWith");
								withtech=rs9.getString("InstBy");
								//out.println("unitid");
								String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
								
								ResultSet rs11 = stmt17.executeQuery(sql11);
								
								if(rs11.next())
								{
									simno=rs11.getString("MobNo");
									mobno=rs11.getString("SimNo");
									//remdate=rs11.getString("EntDate");
								}
								
							} 
							else
							{
								String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNo")+"' or VehCode='"+rst3.getString("VehicleCode")+"' order by InstDate desc limit 1";
								
								ResultSet rs11 = stmt18.executeQuery(sql11);
								
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
							ResultSet rscomp=stmt19.executeQuery(sql);
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
										ResultSet rsallocto=stmt20.executeQuery(sql);
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
  		ResultSet rsgett=stmt21.executeQuery(sql);
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
	<td><%=InstPlace%></td>
									
	<%

//System.out.println("query-----");
int spcnt=0,spcnt2=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+rst3.getString("VehicleRegNo")+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and  `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";
//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp2=stmt22.executeQuery(sqlsp1);
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
	
%>
	
	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  </td>
	<td><%=spcmmnt %></td>
		<td><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
	</tr>
				
        <%
		i++;
        j++;
	}
			
			
	  unitidWithOnlineData = unitidWithOnlineData.substring(0,unitidWithOnlineData.lastIndexOf(","));		
	
	System.out.println("unitidWithOnlineData data of this is present in the online data :- "+unitidWithOnlineData);
	
	unitidWithOnlineData = "("+unitidWithOnlineData+")";
	
	System.out.println("the unitid with online data is :- "+unitidWithOnlineData);
	
	String sql_units = "select * from db_gps.t_unitmaster where swver like '"+codeVersion+"%'  and unitid NOT IN"+unitidWithOnlineData+" ";
	
	System.out.println("sql_units :- "+sql_units);
	
	ResultSet rst_units = stmt25.executeQuery(sql_units);
	
    
	while(rst_units.next())
    {
       bg = "#99FFCC";	
       
       String unitid1 = rst_units.getString("unitId");
       String vehregno1="";
       String Transporter1="";
       String date1="";
       String time1="";
       String loc = "";
       double latindec = 0.000;
       double longindec = 0.000;
       
       String upddate1 ="";
    
    	String sqlAllconnected = "select * from db_gps.allconnectedunits where Unitid='"+unitid1+"' ";
    
    	System.out.println("AA");
    	
    	ResultSet rstallconnected = stmt26.executeQuery(sqlAllconnected);
    
    	System.out.println("AA2");
    	
    	if(rstallconnected.next())
    	{
    		vehregno1 = rstallconnected.getString("VehNo");
    		upddate1  = rstallconnected.getString("TheDate");
    		date1 = rstallconnected.getString("TheDate");
    		time1 = rstallconnected.getString("TheTime");
    		latindec = rstallconnected.getDouble("Latindec");
    		longindec = rstallconnected.getDouble("LonginDec");
    		loc = rstallconnected.getString("location");
    	
    	}
    	else
    	{
    		vehregno1 = "-";
    		upddate1 = "-";
    		date1 = "-";
    	    time1 = "-";
    	}
    	
    	System.out.println("AA1");
    	String sqlchk = "select * from db_gps.t_onlinedata where Unitid='"+unitid1+"' ";
    	ResultSet rstchk = stmt29.executeQuery(sqlchk);
    
    	if(rstchk.next())
    	{
    		
    		Transporter1 = rstchk.getString("Transporter");
    	
    	}
    	else
    	{
    		Transporter1 = "-";
    	}
    	System.out.println("BB");
    	
    	Empname="-";
    	
    	
    	
    	sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+upddate1+"') as days";
		System.out.println("sql8 :- "+sql8);
		ResultSet rsdate=stmt27.executeQuery(sql8);
		if(rsdate.next())
		{
				delaydays=rsdate.getInt("days");
				if(delaydays>7)
				{
					msg="Device Disconnected";					
				}
				else
				{
					msg="";
				}
		}
    	
		System.out.println("CC");
		String sqlForUnit = "select * from db_gps.t_unitmaster where unitid='"+unitid1+"' ";
    	ResultSet rstsqlForUnit = stmt28.executeQuery(sqlForUnit);
    	
    	System.out.println("sqlForUnit :- "+sqlForUnit);
		if(rstsqlForUnit.next())
		{
			unitid = rstsqlForUnit.getString("UnitID");
			simno = rstsqlForUnit.getString("SimNo");	
			mobno = rstsqlForUnit.getString("MobNo");
			peripherals = rstsqlForUnit.getString("Peripherals");
			typeunit = rstsqlForUnit.getString("typeunit");
			simcomp = rstsqlForUnit.getString("SimCompany");
		
		
		
		
		}
		else
		{
			unitid = "-";
			simno = "-";	
			mobno = "-";
			peripherals = "-";
			typeunit = "-";
			simcomp = "-";
			
			
		}
		
		System.out.println("DD");
    	
		Instdte="-";
		InstalledPlace="-";
		warranty="-";    
		InstPlace="-";
		String spcnt1 = "-";
		String spcmmnt1="-";
		String Entrydt1 = "-";
		String Enteredby1 = "-";
		String extracmnt1 = "-";
		
		System.out.println("ZZZZ");
    %>				
 			<tr bgcolor='<%=bg%>'>
						<td><div align="right"> <%=i%></div></td> 
						<td width="100px"><div align="left"><%=vehregno1%></div></td><%//onlinedata table %>
						<td><div align="left"><%=Transporter1 %></div></td>
					    <td><div align="left"><%=Empname %></div></td>
					    <% if(date1 != null && !(date1.equalsIgnoreCase("-")) &&  time1 != null && (time1.equalsIgnoreCase("-")))
					       {
					    %>
						<td><div align="left"><%= new SimpleDateFormat("dd-MMM-yyyy").parse(date1)%> <%=new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(time1))%></div></td>
						<% }
					       else
					       {
					    %>
						<td><div align="left"><%=date1%> <%=time1%></div></td>
						<% } %>				
					
					<!--	<td><div align="right">< %=rst1.getString("Location")%><font color="red"> < %=msg %> </font></div> -->
						<%System.out.println("AAAAAAQ"); %>
						<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=latindec%>&long=<%=longindec%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=loc%> </font> </b> </a> <font color="red"> <%=msg %> </font></td>
						<%System.out.println("BBBB c"); %>
						<td> No Complaint</td> 
						
						<td><div align="right"><%=unitid%></div></td>
						<td><div align="right"><%=mobno%></div></td>
						<td><div align="right"><%=simno%></div></td>
							
							
						<td><%=peripherals %></td>
						<td><%=typeunit %></td>
						<td><%=simcomp %></td>
						
						
						<td><%=group1%></td>
						<td><%=Instdte%></td>
						<td><%=InstalledPlace%></td>
							
						<td><%=warranty%></td>
						<td>-</td>
						<td><%=InstPlace%></td>

						<td> <%=spcnt1%>  </td>
						<td><%=spcmmnt1 %></td>
						<td><%=extracmnt1 %></td>
						
							
					  	<td align="right"><%=Entrydt1%></td>
					  
						<td><%=Enteredby1%></td>
	</tr>  
       
       
       
    
    
    
    <%   
    System.out.println("YYYY");
       i++;
    }
						
						
  }
  else
  {
	System.out.println("the Code Version has not select ed yet ");   
							
			
  }
		
		
}
catch(Exception e)
{
	System.out.println("the exception is :- "+e.getMessage());
	e.printStackTrace();



} 
finally
{
	
	stmt1.close();
    stmt2.close();
    stmt3.close();
    stmt4.close();
    stmt5.close();
    stmt6.close();
    stmt7.close();
    stmt8.close();
    stmt9.close();
    stmt10.close();
    stmt11.close();
    stmt12.close();
    stmt13.close();
    stmt14.close();
    stmt15.close();
    stmt16.close();
    stmt17.close();
    stmt18.close();
    stmt19.close();
    stmt20.close();
    stmt21.close();
    stmt21.close();
    stmt22.close();
    stmt23.close();
    stmt24.close();
    stmt25.close();
    con.close();
    con2.close();
	
	
}




%>



</table>

</div>

<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  
  
<!--<div id="copyright">-->
<!--   Copyright ? 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.-->
<!--</div>-->


<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>