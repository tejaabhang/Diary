<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
Connection con2;
String refno=null;

%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script language="javascript">
	function validate()
		{
			if(document.getElementById("data").value=="")
			{
		  		alert("Please select the from date");
				return false;
			}
			if(document.getElementById("data1").value=="")
			{
	  		alert("Please select the to date");
				return false;
			}
			
			return datevalidate();
	  }

	function datevalidate()
	 {
	 	var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2)
		{
 			if(dm1>month || dm2>month)
			{
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year is should not be greater than to date year");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) if(dm1>dm2)
		{	
			MimeMessage msg=new MimeMessage(session);
			alert("From date month is should not be greater than to date month 5");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		if(dm1==dm2) 
		{
			if(dd1 > dd2)
			{
				alert("From date should not be greater than to date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		return true;
	}
	</script>
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
<%
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	Statement stmt1 = con2.createStatement();
	Statement stmt2 = con1.createStatement();
	Statement stmtQuick = con1.createStatement();
	Statement stmt3 = con1.createStatement();
	Statement stmt4 = con1.createStatement();
	Statement stmt5 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	Statement stmt11 = con1.createStatement();
	Statement stmt12 = con1.createStatement();
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String data="",data1="",vendor="",Statustype="",technician="";
	String user=session.getAttribute("username").toString();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String day=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String today=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	%>
	  	<form action="" method="get" onsubmit="return validate();">
				<table border="0" bgcolor="#77D7D4">
				<tr bgcolor="">
				  	<td><b>From Date</b></td>
				  <td >
				  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="15" readonly/>
					
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data",         // ID of the input field
	      			ifFormat    : "%d-%b-%Y",     // the date format
	      			button      : "trigger"       // ID of the button
	    			}
	  				);	
					</script>
				  </td>
								<td><b>To Date</b></td>
								<td>
									<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="15" readonly />
										<script type="text/javascript">
						  				Calendar.setup(
						    			{
						      			inputField  : "data1",         // ID of the input field
						      			ifFormat    : "%d-%b-%Y",    // the date format
						      			button      : "trigger1"       // ID of the button
						    			}
						  				);
										</script>
								</td>
	  			 	<td>
	 					<font color="maroon" ><b>Transporter :</b></font>
	 				</td>
	 				<td>
						<select name="owner" id="owner">
        					<option value="All"> All </option>
	<%
	String sql="SELECT DISTINCT(OwnerName) as OwnerName  FROM db_gps.t_unitreplacement  order by OwnerName Asc ";
	ResultSet rs=stmt11.executeQuery(sql);
	System.out.println(sql);
	while(rs.next()){
	%>
			<option value="<%=rs.getString("OwnerName")%>"><%=rs.getString("OwnerName")%></option>
		<%
	}	
		%>
			<option value="Other"> Other </option>
</select>
</td>
				<td align="left">
					<input type="submit" name="submit" id="submit" value="submit"/>
				</td>
			</tr>
			</table>
			</form>
	
		<%	String dd=request.getParameter("data");
		if(dd==null)
	{}
	else
	{
	data=request.getParameter("data");
	data1=request.getParameter("data1");
String owner=request.getParameter("owner");
	//Statustype=request.getParameter("Statustype");
	//vendor=request.getParameter("vendor");
	%>
		<table border="0" width="750px"  align="center" bgcolor="#D1F4F3">	<tr><td>
	<center class='bodyText'><font size="3"><b>QuickTest Details for <%=data%> to <%=data1%> for <%=owner %></b></font></center>
		<div align="right">
		<%
		//java.util.Date dataa= new SimpleDateFormat("yyyy-MMM-dd").f
		data=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));	
		data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));	
		%>
					<a href="ExcelQTwithReplacement.jsp?data=<%=data%>&data1=<%=data1%>&owner=<%=owner%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
					</div>
				</td>
				</tr>
			</table>	
			<br></br>
				<table width="100%" border="1" align="center" class="sortable">
				<tr bgcolor="#D1F4F3">
				<td class="hed"> Sr.</font></td>
			
			<!--  Quick Test Options from table db_CustomerComplaints.t_hwunittest --> 
				<td class="hed"><b>QT Date</b></td>
					<td class="hed"> <b>Veh. Reg. No.</b></td>
				<td class="hed"> <b>Transporter</b></td>
				<td class="hed"><b> First Installation. Date</b></td>
				<td class="hed"><b> QT Unit ID</b></td>
				<td class="hed"><b> Replaced Unit ID</b></td>
				<td class="hed"><b> Replacement Date</b></td>
				<td class="hed"><b> Location of Replacement</b></td>
				<td class="hed"><b> Replacement by </b></td>
				<td class="hed"><b> Replacement Configured By </b></td>
				<td class="hed"><b> Unit Type</b></td>
				<td class="hed"><b> SW Comment</b></td>
				<td class="hed"> <b>Debit Note</b></td>
				<td class="hed"><b> Correction</b></td>
				<td class="hed"><b> AVL Pcb Ver</b></td>
				<td class="hed"><b> Pow Pcb Ver</b></td>
				<td class="hed"><b> RLED</b></td>
				<td class="hed"><b> GLED</b></td>
				<td class="hed"> <b>GLEDBlink</b></td>
				<td class="hed"><b> GPSAnt</b></td>
				<td class="hed"> <b>GPSAntLED</b></td> 
				<td class="hed"> <b>SW ver</b></td> 
				<td class="hed"><b> SWGpsdata</b></td> 
				<td class="hed"> <b>QTby</b></td> 
				
			<!--  Dispatched Options from table db_gps.t_unitmasterhistory --> 
				<td class="hed"><b> Dispatch Date</b></td>
				<td class="hed"><b> Dispatch Add</b></td>
				<td class="hed"><b> Dispatch By</b></td>
				
			<!--  Recieved Options from table db_CustomerComplaints.t_unitrecieved --> 
				<td class="hed"><b> Receive Date</b></td>
				<td class="hed"><b> Receive From Location </b></td>
				
			<!--  Special Comment Options from table db_CustomerComplaints.t_techspecialrep -->	
				<td class="hed"><b> Special Comment </b></td>
				<td class="hed"><b> Sp. Com. Date</b></td>
			
				<td class="hed"><b> RedLight</b></td>
				<td class="hed"><b> GreenLight</b></td>
				<td class="hed"><b> GPSLight</b></td>
				<td class="hed"><b> Ringing</b></td>
				<td class="hed"><b> Comment Ent By </b></td>
				<td class="hed"><b> Unit Life </b></td>
				<td class="hed"> <b>In warranty</b> </td>
				</tr>		
				<%
				if("All".equalsIgnoreCase(owner)){
					sql2="Select * from db_gps.t_unitreplacement where InstDate between'"+data+"' and '"+data1+"' and InstType='Rep' order by InstDate desc";
				}else{
					sql2="Select * from db_gps.t_unitreplacement where InstDate between'"+data+"' and '"+data1+"' and OwnerName like '%"+owner.trim()+"%' and InstType='Rep' order by InstDate desc";
				
				}System.out.print(sql2);
				int i=1;
				ResultSet rsquick=stmt2.executeQuery(sql2);
				while(rsquick.next())
				{	
					
					String sqlquicktest="Select * from hwunittest where UnitID='"+rsquick.getString("OldUnitID")+"' and TheDate>='"+rsquick.getString("InstDate")+"' order by TheDate Asc limit 1";
					System.out.println(sqlquicktest);
					 rs2=stmtQuick.executeQuery(sqlquicktest);
					if(rs2.next()){
					
					String dispdate=null,disptime=null,firstinstdate="-",dispadd=null,qtdate=null,qttime=null,correction=null,dispby="-",QTby=null,typeoffail=null,pcbversion=null,powersupplyversion=null,codeversion=null;
					String spcomment=null,spentby=null,rectime=null,entdate="-",trans="-",vehreg="-",replaceunit="-",replacedate="-",reploc="-",repby="-",repconfigby="-";
					String RedLight="-";
					String GreenLight="-";
					String GPSLight="-";
					String Ringing="-";
					String life="-",Comment="-";
					String phydamage="",debitnote="";

					//Recived Details
					 String unitid,recdate=null,recloc=null;
						 
					 qtdate=rs2.getString("TheDate");
					 System.out.println(qtdate);
					 qttime=rs2.getString("TheTime");
					 unitid=rs2.getString("UnitID");
					 typeoffail=rs2.getString("SWComment");
					 debitnote =rs2.getString("SWDebitNote");
					 phydamage=rs2.getString("Physicaldamage");
					 if(!(phydamage==null||phydamage.equalsIgnoreCase("null")||phydamage.trim().length()<=0))
	                    {
	                       Comment =typeoffail+","+phydamage;
	                    }
				else
				{
					Comment =typeoffail;
	 			}
					 correction=rs2.getString("Correctiondone");
					 QTby=rs2.getString("User");
					 String UnitType=rs2.getString("UnitType");
					 String AVLPcbVer=rs2.getString("AVLPcbVer");
					 String PowPcbVer=rs2.getString("PowPcbVer");
					 String RLED=rs2.getString("RLED");
					 String GLED=rs2.getString("GLED");
					 if(GLED==null || GLED.equalsIgnoreCase("null")) 
						 	GLED="N.A";
					 String GLEDBlink=rs2.getString("GLEDBlink");
					 String GPSAnt=rs2.getString("GPSAnt");
					 if(GPSAnt==null || GPSAnt.equalsIgnoreCase("null"))
						 GPSAnt="N.A";
					 String GPSAntLED=rs2.getString("GPSAntLED");
					 String SWswver=rs2.getString("SWswver");
					 String SWGpsdata=rs2.getString("SWGpsdata");
					 
					
					 
					 						 
					sql3="select * from t_unitmasterhistory where UnitID = '"+unitid+"' and concat(DispDate,DispTime) < '"+qtdate+qttime+"' and ModeofDispatch NOT Like '%Transfer%' order by DispDate Desc limit 1";
					//out.print(sql3);
					rs3=stmt1.executeQuery(sql3);
					if(rs3.next())
					{
						dispdate=rs3.getString("DispDate");
						disptime=rs3.getString("DispTime");
						dispadd=rs3.getString("DisAdd");
						dispby=rs3.getString("user");
						
					}
					else
					{
						dispdate="-";
						dispadd="-";
						dispby="-";
					}
					 
					sql4="Select * from t_unitreceived where UnitID='"+unitid+"' and Rdate >= '"+dispdate+"' and Rdate <= '"+qtdate+"' and Status <> 'Deleted' and InTransit <> 'Yes' and TypeValue='2' and ReceiveFrom <> 'Vendor' order by Rdate desc";
					//out.print(sql4);
					rs4=stmt3.executeQuery(sql4);
					if(rs4.next())
					{
						recdate=rs4.getString("Rdate");
						rectime=rs4.getString("Rtime");
						recloc=rs4.getString("Lname");
					}
					else
					{
						recdate="-";
						recloc="-";
					}
					
					// added by pradnya
				
					// get the unitreplacement details as per ajay sir requirement-------------------
					// unit life count-------------
					String InstDate1="-",ownername="",VehRegNo="",WasWarranty="";
					
					sql6="select * from t_unitreplacement where NewUnitID='"+unitid.trim()+"' and EntDate >= '"+dispdate+"' and EntDate <= '"+recdate+"'";
						rs6=stmt6.executeQuery(sql6);
						if(rs6.next())
						{
							
							String InstDate=rs6.getString("EntDate");
							String InstTime=rs6.getString("InstTime");
							
							sql7="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and EntDate >= '"+InstDate+"' and EntDate <= '"+recdate+"'";
							rs7=stmt7.executeQuery(sql7);
							if(rs7.next())
							{
							//	replacedate=rs7.getString("InstDate");
								repconfigby=rs7.getString("EntBy");
								life=rs7.getString("UnitLife");
								WasWarranty=rs7.getString("WasWarranty");
								
							}
							
							
						}
						else
						{
							life="0";
						}
					
					/*String str="select * from t_unitreplacement where NewUnitID='"+unitid+"' order by InstDate desc limit 1";
					ResultSet rsget=stmt10.executeQuery(str);
					while(rsget.next())
					{
						oldunit=rsget.getString("OldUnitID");
						
						
						
					}*/
					// added by pradnya
					// change in query get the EntDateTime order by desc limit 1 to get the latest record-------------------
					
					sql5="SELECT * FROM t_techspecialrep WHERE UnitID='"+unitid+"' and EntDateTime > '"+dispdate+" "+disptime+"' and EntDateTime < '"+recdate+" "+rectime+"' order by EntDateTime desc limit 1";
					//out.print(sql5);
					rs5=stmt4.executeQuery(sql5);
					if(rs5.next())
					{
						spcomment=rs5.getString("SpComment");
						RedLight=rs5.getString("RedLight");
						GreenLight=rs5.getString("GreenLight");
						GPSLight=rs5.getString("GPSLight");
						Ringing=rs5.getString("Ringing");
						spentby=rs5.getString("EntBy");
						entdate=rs5.getString("EntDateTime");
						
						// if we dont get vehicle reg no and transporter from t_unitreplacement then get it from here-------- By pradnya
						
					}
					else
					{
						spcomment="-";
						spentby="-";
						RedLight="-";
						GreenLight="-";
						GPSLight="-";
						Ringing="-";
						
					}
					
					
					// get the first installation date of vehicle-------------------
					String warranty="",VehicleCode="";
					
						String query="Select InstalledDate,VehicleRegNumber,VehicleCode from t_vehicledetails where VehicleRegNumber Like '%"+vehreg+"%' and Status='-'";
						rs10=stmt9.executeQuery(query);
						if(rs10.next())
						{
							firstinstdate=rs10.getString("InstalledDate");
							VehicleCode=rs10.getString("VehicleCode");
							System.out.println(firstinstdate +"-"+rs10.getString("VehicleRegNumber"));
							
						}
				
					
					//---------------------------------------------------------------------------
					
						%>
				
					<tr>
						<td> <%=i%></td>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(qtdate))%></td>
						<td><%=rsquick.getString("VehRegNo")%></td>
						<td><%=rsquick.getString("OwnerName")%></td>
						<%if(firstinstdate.equals("-")){ %>
						<td><%=firstinstdate %></td>
						<%}else{ %>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(firstinstdate))%></td>
					
						<%} %>
					<td><%=rsquick.getString("OldUnitID") %></td>
						<td><%=rsquick.getString("NewUnitID") %></td>
							
						<td><%=rsquick.getString("InstDate") %></td>
						<td><%=rsquick.getString("InstPlace") %></td>
						<td><%=rsquick.getString("InstBy") %></td>
						<td><%=rsquick.getString("EntBy") %></td>
						
						<td><%=UnitType%></td>
						<td><%=Comment%></td>
						<td><%=debitnote%></td>
						<td><%=correction%></td>
						<td><%=AVLPcbVer%></td>
						<td><%=PowPcbVer%></td>
					 	<td><%=RLED%></td>
					 	<td><%=GLED%></td>
					 	<td><%=GLEDBlink%></td>
					 	<td><%=GPSAnt%></td>
					 	<td><%=GPSAntLED%></td>
					 	<td><%=SWswver%></td>
					 	<td><%=SWGpsdata%></td>
						<td><%=QTby%></td>
						
						<td>
						<%
						try
						{
						%>
						<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate))%>
						<%
						}catch(Exception e)
						{
							%>
							<%=dispdate%>
							<%
						}
						%>
						</td>
						<td><%=dispadd%></td>
						<td><%=dispby %></td>
						<%
						try
						{
						%>
						<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate))%>
						
						<%
						}catch(Exception e)
						{
							%>
							<%=recdate%>
							<%
						}
						%>
						</td>
						<td><%=recloc%></td>
						
						<td><%=spcomment%></td>
						<td><%=entdate%></td>
						
						<td><%=RedLight%></td>
						<td><%=GreenLight%></td>
						<td><%=GPSLight%></td>
						<td><%=Ringing%></td>
						<td><%=spentby%></td>
					
						<td><%=rsquick.getString("UnitLife") %></td>
						<td><%=rsquick.getString("WasWarranty") %></td>
					</tr>	
				
				  
				   
				
				<!-- body part come here -->
						<%
						i++;}else{
							%>
							<tr>
						<td> <%=i%></td>
						<td>-</td>
						<td><%=rsquick.getString("VehRegNo") %></td>
						<td><%=rsquick.getString("OwnerName") %></td>
						<td>-</td>
						<td><%=rsquick.getString("OldUnitID") %></td>
						<td><%=rsquick.getString("NewUnitID") %></td>
						<td><%=rsquick.getString("InstDate") %></td>
						<td><%=rsquick.getString("InstPlace") %></td>
						<td><%=rsquick.getString("InstBy") %></td>
						<td><%=rsquick.getString("EntBy") %></td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
					 	<td>-</td>
						<td>-</td>
						<td>-
						</td>
						<td>-</td>
						<td>-</td>
						
						<td>-
						</td>
						<td>-</td>
						
						<td>-</td>
						<td>-</td>
						
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					
						
						<td><%=rsquick.getString("UnitLife") %></td>
						<td><%=rsquick.getString("WasWarranty") %></td>
					</tr>	
							<%
							i++;}
					
					 
				} %>	</table><%
				}
	} catch(Exception e) { out.println("Exception----->"+e); }

	finally
	{
	con1.close();
	con2.close();
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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>