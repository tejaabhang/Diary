<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.Date.*" errorPage="" %>
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
	System.out.println("in the QuickTestReport jsp page ");
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt = con1.createStatement();
	Statement st = con2.createStatement();
	Statement st2 = con2.createStatement();
	Statement st1 = con2.createStatement();

	Statement stmt1 = con2.createStatement();
	Statement stmt2 = con1.createStatement();
	Statement stmt3 = con1.createStatement();
	Statement stmt4 = con1.createStatement();
	Statement stmt19 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	Statement stmt11 = con1.createStatement();
	Statement stmt13 = con1.createStatement();
	Statement stmt14 = con1.createStatement();
	Statement stmt12 = con1.createStatement();
	Statement stmt51 = con1.createStatement();
	Statement stmt81 = con1.createStatement();

	String d ="";
    System.out.println("Date---->" + d);
	   String dt1="";
	   int i=1;
	   ResultSet res8=null;
	   ResultSet res81=null;

String dt111="";
	   ResultSet res=null;
	   ResultSet res2=null;
	   String unitid="",OwnerName="",GPName="",UnitID="",version="",VehicleCode="",dt5="",WMSN="",VehicleRegNumber="",InsertDate="",OTP="",imei="",MailDate="",MailTime="";
String CompanyCode="",imeiNo="",UserName="",MobileNo="",Address="",EmailId="";
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null,rs99=null;
	String data="",data1="",vendor="",Statustype="",technician="";
	String user=session.getAttribute("username").toString();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String day=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String today=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	%>
	  	&nbsp;&nbsp;<form action="" method="get" onsubmit="return validate();">
				<table border="0" width="1000px" bgcolor="#77D7D4">
				<tr bgcolor="">
				<td align="center">
				  <table >
				  
				  <tr style="border: none;">
				  <td >
				  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="15" readonly/>
				  </td>
				  <td>
					<input type="button" name="From Date" value="From Date" id="trigger" />
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
				  </tr></table>
				</td>
					<td align="center">
						<table>
							<tr>
								<td>
									<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="15" readonly />
								</td>
								<td>
									 	<input type="button" name="To Date" value="To Date" id="trigger1" "/>
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
							</tr>
						</table>
	  				 </td >
	  			 	
<td>
</td>
				<td align="center">
					<input type="submit" name="submit" id="submit" value="submit" />
				</td>
			</tr>
			</table>
			</form>
	
		<%	
		String dd=request.getParameter("data");
		if(dd==null)
	{}
	else
	{
	data=request.getParameter("data");
	data1=request.getParameter("data1");
	String owner=request.getParameter("owner");

	System.out.println(">>>>>>>owner>>>>>>"+owner);
	//Statustype=request.getParameter("Statustype");
	//vendor=request.getParameter("vendor");
	%>
		<table border="0" width="1000px"  align="center" bgcolor="#D1F4F3">	<tr><td>
	<center class='bodyText'><font size="3"><b>Dragondroid Installations Details for <%=data%> to <%=data1%></b></font></center>
		<div align="right">
		<%
		//java.util.Date dataa= new SimpleDateFormat("yyyy-MMM-dd").f
		data=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));	
		data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));	
		%>
					</div>
				</td>
				</tr>
			</table>
			<br>	
				<table width="100%" border="1" align="center" class="sortable">
				<thead>


<tr>
<th style="font-size:11px ; color:red;face:san-serif;">Sr No</th>
<th style="font-size:11px ; color:red;face:san-serif;">User Name</th>
<th style="font-size:11px ; color:red;face:san-serif;">Owner Name</th>
<th style="font-size:11px ; color:red;face:san-serif;"> Vehicle Reg Number</th>
<th style="font-size:11px ; color:red;face:san-serif;">Vehicle Code</th>
<th style="font-size:11px ; color:red;face:san-serif;">Unit ID</th>
<th style="font-size:11px ; color:red;face:san-serif;">Email ID</th>
<th style="font-size:11px ; color:red;face:san-serif;">Mobile Number</th>
<th style="font-size:11px ; color:red;face:san-serif;">Address</th>
<th style="font-size:11px ; color:red;face:san-serif;">Company Code</th>
<th style="font-size:11px ; color:red;face:san-serif;">imei No</th>
<th style="font-size:11px ; color:red;face:san-serif;"> OTP</th>
<th style="font-size:11px ; color:red;face:san-serif;">Registration Date</th>
<th style="font-size:11px ; color:red;face:san-serif;">Date Time</th>
<th style="font-size:11px ; color:red;face:san-serif;"> Location</th>


			
				<!-- <td class="hed"><font color="RED">User Name</font></td>
								<td class="hed"><font color="RED"> Owner Name</font></td>
								<td class="hed"><font color="RED"> Vehicle Reg Number</font></td>
								<td class="hed"><font color="RED"> Vehicle Code</font></td>
				
									<td class="hed"><font color="RED">Unit ID</font></td>
				
					<td class="hed"><font color="RED">Email ID</font></td>
				<td class="hed"><font color="RED"> Mobile Number</font></td>
				<td class="hed"><font color="RED"> Address</font></td>
				<td class="hed"><font color="RED"> Company Code</font></td>
				<td class="hed"><font color="RED"> imei No</font></td>
				
				<td class="hed"><font color="RED"> OTP</font></td>
				<td class="hed"><font color="RED"> Registration Date</font></td>
				 -->
				

</tr>
</thead>
<tbody>				<%
				
				//sql2="Select * from db_CustomerComplaints.hwunittest where TheDate between '"+data+"' and '"+data1+"' and TypeValue='2' order by TheDate desc";
				int VehCode=0,RD=0,OS=0,cnt1=0,RA=0,cnt=0,cnt3=0,cnt2=0,cnt5=0,cnt9=0,cnt8=0;
		    	int todaykm=0,cumulative=0;
			    int TotalImgCam2=0,TotalImgCam3=0,TotalVidCam1=0,TotalVidCam2=0,cnt4=0,TotalAdCount5=0,TotalAdCounthr=0;
		        int c1=0,c2=0,c3=0,c4=0,c5=0;
			   data=data+" 00:00:00";
			   data1=data1+" 23:59:59";
			   String ddd="";
String TheDate="",TheTime="",Location="",concat="";
			   String sql ="select * from db_gps.t_dragondroiduserreg where InsertDate>='"+data+"' and InsertDate <='"+data1+"' ";
			    System.out.println("Running: " + sql);
			      res2 = stmt.executeQuery(sql);
				    while (res2.next())
				{
				    	UnitID="";
ddd="";
				    	TheDate="";
				    	TheTime="";Location="";
				    	concat="";
				    	UserName = res2.getString("UserName");
				          System.out.println("UserName"+UserName);
				          
				          EmailId = res2.getString("EmailId");
				          //System.out.println("EmailId"+EmailId);
				          
				          MobileNo = res2.getString("MobileNo");
				 		// System.out.println("MobileNo"+MobileNo); 
				 		
				 		Address = res2.getString("Address");
				 		// System.out.println("Address"+Address);
				 		
				 		CompanyCode = res2.getString("CompanyCode");
				 		System.out.println("CompanyCode"+CompanyCode); 
				 		
				 		if(CompanyCode=="" || CompanyCode.equals(""))
				 		{
				 			CompanyCode="-";
				 		}
				 		
				 		imeiNo = res2.getString("imeiNo");
				 		// System.out.println("imeiNo"+imeiNo); 
				 		
				 		OTP = res2.getString("OTP");
				 		// System.out.println("OTP"+OTP); 
				 		
				 		InsertDate = res2.getString("InsertDate");
				 		// System.out.println("InsertDate"+InsertDate); 
				 		
				 		
				 		 dt111= new SimpleDateFormat("dd-MMM-yyyy")
	        .format(new SimpleDateFormat("yyyy-MM-dd")
	                .parse(InsertDate));
				 		
				 		 String sql12 ="select UnitID from db_gps.t_unitmaster where WMSN='"+imeiNo+"'";
			 System.out.println("sql12: " + sql12);
			 ResultSet res12 =stmt12.executeQuery(sql12); 
			 if (res12.next()) 
			 {
				 UnitID = res12.getString("UnitID");
			 System.out.println("UnitID"+UnitID); 
			 
			 
			 }
			
			 
			 
			 else
			 {
				 String sql13 ="select unitid from db_gps.t_imeidetails where imei='"+imeiNo+"' order by sr desc limit 1";
				 System.out.println("sql13: " + sql13);
				 ResultSet res13 =stmt13.executeQuery(sql13); 
				 if (res13.next()) 
				 {
					 UnitID = res13.getString("unitid");
				 System.out.println("UnitID"+UnitID); 
				 
				 
				 }
			 }
			 
			  if(UnitID==null)
				 {
					 String sql13 ="select unitid from db_gps.t_imeidetails where imei='"+imeiNo+"' order by sr desc limit 1";
					 System.out.println("sql13: " + sql13);
					 ResultSet res13 =stmt13.executeQuery(sql13); 
					 if (res13.next()) 
					 {
						 UnitID = res13.getString("unitid");
					 System.out.println("UnitID"+UnitID); 
					 
					 
					 }
				 }
			  if(UnitID=="")
			  {
				  UnitID="-";
			  }
			  else
			  {

			  String sql2 = "Select * from db_gps.t_vehicledetails where unitid="+UnitID+"";
			    System.out.println("Running: " + sql2);
			     res8 = st.executeQuery(sql2);
			    if (res8.next())
			    {
			    	 
			          
			          OwnerName = res8.getString("OwnerName");
			          //System.out.println("OwnerName"+OwnerName);
			          
			          VehicleRegNumber = res8.getString("VehicleRegNumber");
			 		// System.out.println("VehicleRegNumber"+VehicleRegNumber); 
			 		
			          VehicleCode = res8.getString("VehicleCode");
			          
			        
			 		
			    }
			    
			    
			    String sql10 ="select (LastDayKm-TheDistance) as todaykm,TheDistance as cumulative from  db_gps.t_onlinedata where VehicleCode='"+VehicleCode+"'";
				 System.out.println("sql10: " + sql10);
				 ResultSet res10 =stmt10.executeQuery(sql10); 
				 if (res10.next()) 
				 {
					 todaykm = res10.getInt("todaykm");
				 System.out.println("todaykm"+todaykm); 

				 cumulative = res10.getInt("cumulative");
			     System.out.println("cumulative"+cumulative); 
				 
				 
				 }
				 
				 
				 
				 String sql22 = "select * from  db_gps.t_onlinedata where VehicleCode="+VehicleCode+"";

				    System.out.println("sql22: " + sql22);
				     res81 = stmt81.executeQuery(sql22);
				    if (res81.next())
				    {
				    	 
				          
				    	TheDate = res81.getString("TheDate");
				          //System.out.println("OwnerName"+OwnerName);
				          
				          Location = res81.getString("Location");
				 		// System.out.println("VehicleRegNumber"+VehicleRegNumber); 
				 		
				 		if(Location=="" || Location.equals(""))
				 		{
				 			Location="-";
				 			
				 		}
				 		
				          TheTime = res81.getString("TheTime");

				         if(TheDate=="" || TheDate.equals(""))
				         {
				        	 concat="-";
				         }
				         else
				         {
				        	 
				        
				         ddd= new SimpleDateFormat("dd-MMM-yyyy")
				     	        .format(new SimpleDateFormat("yyyy-MM-dd")
				     	                .parse(TheDate));
				         
				         concat=ddd+" "+TheTime;
				         }

				 		
				    }
				    
			  }
			  
			  
			    
				 		
				 		
				 		%> 
				 		
				 		 <tr> 
					      <td align=right><font face=Arial><%= i %></font></td> 
					     <td align=left><font face=Arial><%= UserName %></font></td>
					     					     <td align=right><font face=Arial><%= OwnerName %></font></td> 
					     					     <td align=right><font face=Arial><%= VehicleRegNumber %></font></td> 
					     					     <td align=right><font face=Arial><%= VehicleCode %></font></td> 
					     
					     					      					     <td align=left><font face=Arial><%= UnitID %></font></td> 
					     
					     <td align=left><font face=Arial><%= EmailId %></font></td> 
					     <td align=right><font face=Arial><%= MobileNo %></font></td> 
					     <td align=left><font face=Arial><%= Address %></font></td> 
					      					     <td align=left><font face=Arial><%= CompanyCode %></font></td> 
					      					     <td align=left><font face=Arial><%= imeiNo %></font></td> 
					      					     <td align=left><font face=Arial><%= OTP %></font></td> 
					      					     <td align=left><font face=Arial><%= dt111 %></font></td> 
					      					     					      					     <td align=left><font face=Arial><%= concat %></font></td> 
					      					     					      					     <td align=left><font face=Arial><%= Location %></font></td> 
					      					     
					      
				    	
				<%i++;} %>
				   </tr>
				   </tbody>
				</table>
						<%
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