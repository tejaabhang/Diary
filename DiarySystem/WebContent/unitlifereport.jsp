<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
Connection con2;
String refno=null;

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
		{MimeMessage msg=new MimeMessage(session);
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
	Statement stmt3 = con1.createStatement();
	Statement stmt4 = con2.createStatement();
	Statement stmt5 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	
	
	ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String data="",data1="",vendor="",Statustype="",technician="";
	String user=session.getAttribute("username").toString();
	
	String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	%>
	  	<form action="" method="get" onsubmit="return validate();">
				<table border="2"  width="750px" align="center">
				
				<tr bgcolor="">
				<td align="center">
				  <table ><tr style="border: none;">
				  <td >
				  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="10" readonly/>
				  </td>
				  <td>
					<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data",         // ID of the input field
	      			ifFormat    : "%Y-%m-%d",     // the date format
	      			button      : "trigger"       // ID of the button
	    			}
	  				);	
					</script>
				  </td>
				  </tr></table>
				</td>
				<td align="center">
				<table><tr><td>
				<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
				</td>
				<td>
				 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data1",         // ID of the input field
	      			ifFormat    : "%Y-%m-%d",    // the date format
	      			button      : "trigger1"       // ID of the button
	    			}
	  				);
					</script>
				</td>
				</tr></table>
				  	
				  	
	  			 </td >
				
				<td align="center">
					<input type="submit" name="submit" id="submit" value="submit" class="formElement">
				</td>
			</tr>
			
			</table>
			</form>
			</td></tr>
		<%	String dd=request.getParameter("data");
		if(dd==null)
	{
	%>

	<table class="stats">
	<tr><td>
	<center class='bodyText'><font size="3"><b>Please select option to display the Dispatch Report</b></font></center>
	</td></tr>
	</table>

	<%
	}
	else
	{
	data=request.getParameter("data");
	data1=request.getParameter("data1");
	Statustype=request.getParameter("Statustype");
	vendor=request.getParameter("vendor");
	%>
		<table border="1" width="750px">	<tr><td>
	<center class='bodyText'><font size="3"><b>Received Details for <%
	                        java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
	                        Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
	                        String showdate = formatter2.format(ShowDate);
	                        out.print(showdate);
	                        %> to <%
	                        java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
	                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
	                       String showdate1 = formatter1.format(ShowDate1);
	                        out.print(showdate1); %>
	                        </b>
		<div align="right">
					<a href="viewreceived_export.jsp?data=<%= data %>&data1=<%=data1 %>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
					</div>
				</td>
				</tr>
				
			</table>	
				<table width="100%" border="1" align="center" class="sortable">
				<tr>
				<td class="hed"> Sr.</td>
				<td class="hed"> Unit ID</td>
				<td class="hed"> Received Date</td>
				<td class="hed"> Dispatch Date</td>
				<td class="hed"> Receive From Location </td>
				<td class="hed"> Receive From Tech/Cust</td>
				<td class="hed"> Installation Date</td>
				<td class="hed"> Dispatch From</td>
				<td class="hed"> Type Of Failure</td>
				<td class="hed"> WMSN Status</td>
				<td class="hed"> Sim Status</td>
				<td class="hed"> Service Provider</td>
				<td class="hed"> Last Data Date</td>
				<td class="hed"> PowerSupply Version</td>
				<td class="hed"> PCB Version</td>
				<td class="hed"> Code Version</td>
				<td class="hed"> Life Of Unit</td>
				</tr>		
				<%
				
				sql2="Select * from t_unitreceived where Rdate between'"+data+"' and '"+data1+"' and Status <> 'Deleted' and InTransit <> 'Yes' and TypeValue='2' and ReceiveFrom <> 'Vendor' order by Rdate desc";
				session.setAttribute("sql",sql2);
				int i=1;
				rs2=stmt2.executeQuery(sql2);
				while(rs2.next())
				{	
					String dispdate=null,dispby=null,typeoffail=null,wmsn=null,simno=null,simcompany=null,pcbversion=null,powersupplyversion=null,codeversion=null;
					String installeddate=null,vehconf=null,current_status=null,replace_date=null,replaced=null,life=null,vehcode=null,lastdatadate=null;

					//Recived Details
					 String unitid,recdate,recloc,recby;
					
					 unitid=rs2.getString("UnitID");
					 recdate=rs2.getString("Rdate");
					 recloc=rs2.getString("Lname");
					 recby=rs2.getString("TechName");
					 if(recby.equals('-'))
					 {
						 recby=rs2.getString("Transporter");
					 }
						 
					sql3="select * from t_unitmasterhistory where UnitID = '"+unitid+"' and DispDate < '"+recdate+"' order by DispDate Desc limit 1";
					rs3=stmt1.executeQuery(sql3);
					if(rs3.next())
					{
						dispdate=rs3.getString("DispDate");
						dispby=rs3.getString("user");
					}
					 
					sql4="select * from hwunittest where UnitID = '"+unitid+"' and TheDate >= '"+recdate+"' order by TheDate Asc limit 1";
					rs4=stmt3.executeQuery(sql4);
					if(rs4.next())
					{
						typeoffail=rs4.getString("SWComment");
						pcbversion=rs4.getString("AVLPcbVer");
						powersupplyversion=rs4.getString("PowerSupply");
						codeversion=rs4.getString("SWswver");
					}
					else
					{
						typeoffail="-";
					}
					sql5="select * from t_ftpdump where UnitID = '"+unitid+"' and StoredDateTime between '"+dispdate+"' and '"+recdate+"' limit 1";
					rs5=stmt4.executeQuery(sql5);
					if(rs5.next())
					{
						wmsn="YES";
						simno="YES";
					}
					else
					{
						wmsn="NO";
						simno="NO";
					}
					sql6="select SimCompany from t_unitmasterhistory where UnitId = '"+unitid+"' and EntDate <= '"+dispdate+"' order by EntDate Desc limit 1";
					rs6=stmt5.executeQuery(sql6);
					if(rs6.next())
					{
						simcompany=rs6.getString("SimCompany");
					}
					
				//*****************************
				 sql7="select InstDate,VehCode from t_unitreplacement where NewUnitID= '"+unitid+"' and InstDate between '"+dispdate+"' and '"+recdate+"' order by InstDate asc limit 1";
				 rs7=stmt6.executeQuery(sql7);
				 if(rs7.next())
				 {
					 // installation date after dispatch
					 installeddate=rs7.getString("InstDate");
					 vehconf="Yes";
					 current_status="Yes";
					 vehcode=rs7.getString("VehCode");
					
					 //replacement date after istallation
					 sql8="select * from t_unitreplacement where OldUnitID= '"+unitid+"' and InstDate >= '"+installeddate+"' order by InstDate asc limit 1";
					rs8=stmt7.executeQuery(sql8);
					 if(rs8.next())
					 {
						 replace_date=rs8.getString("InstDate");
						 replaced="yes";
						 current_status="No";
					 }
						sql10="select * from t_veh"+vehcode+" where TheFieldDataDate between '"+installeddate+"' and '"+replace_date+"' and TheFiledTextFileName = 'SI'  order by TheFieldDataDate Desc limit 1";
						rs10=stmt9.executeQuery(sql10);
						if(rs10.next())
						{
							lastdatadate=rs10.getString("TheFieldDataDate");
						}
							sql9="Select To_days('"+lastdatadate+"')- To_days('"+installeddate+"')";
							rs9=stmt8.executeQuery(sql9);
							if(rs9.next())
							{
								life=rs9.getString(1);
							}
							if(life==null||life.length()==0|| Integer.parseInt(life)<0  )
							{
								life="0";
							}
				 }
				 else
				 {
					 life="NOT DATA ON FIELD";
					 lastdatadate="-";
				 }
					//*****************************
					
				%>
					<tr>
						<td> <%=i%></td>
						<td><%=unitid%></td>
						<td><%=recdate%></td>
						<td><%=dispdate%></td>
						<td><%=recloc%></td>
						<td><%=recby%></td>
						<td><%=installeddate%></td>							
						<td><%=dispby %></td>
						<td><%=typeoffail%></td>
						<td><%=wmsn%></td>
						<td><%=simno%></td>
						<td><%=simcompany%></td>
						<td><%=lastdatadate %></td>
						<td><%=pcbversion%></td>
						<td><%=powersupplyversion%></td>
						<td><%=codeversion%></td>
						<td><%=life%></td>
						
					</tr>	
				<% i++;
				   } %>
				   
				</table>
				<!-- body part come here -->
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
