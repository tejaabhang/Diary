<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
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
	function fun1()
	{
		document.sla.submit();
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
	function validate()
	{
		var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;
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
			alert("Selected date should not be greater than Todays date (Year)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>month || dm2>month)
			{
				alert("Selected date should not be greater than Todays date (Month)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("Selected date should not be greater than Todays date (Day)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year should not be greater than To date year");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>dm2)
			{
				alert("From date month should not be greater than To date month");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		if(dm1==dm2)
		{
			if(dd1 > dd2)
			{
				alert("From date should not be greater than To date");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		return true;	
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
<!-- Checking request from tech type or not, and making headers available accordingly-->


<%@ include file="header1.jsp" %>
   
    </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
			<!--- code start here ------>
<form name="sla" method="get" action="" onSubmit="return validate();">

<table width="750px" border="0" bgcolor="#77D7D4">
<tr><td align="center" colspan="5" ><font size="2" color="maroon"><b>Please Select Date Range To View SLA Report</td></tr>
<tr>
<td align="right">
<select name="data1" style="">
	<option value="01" selected="selected" >JAN</option>
	<option value="02" >FEB</option>
	<option value="03" >MAR</option>
	<option value="04" >APR</option>
	<option value="05" >MAY</option>
	<option value="06" >JUNE</option>
	<option value="07" >JULY</option>
	<option value="08" >AUG</option>
	<option value="09" >SEPT</option>
	<option value="10" >OCT</option>
	<option value="11" >NOV</option>
	<option value="12" >DEC</option>
</select>
</td>
<td>
<select name="data2" style="">
	<option value="2006" selected="selected" >2006</option>
	<option value="2007" >2007</option>
	<option value="2008" >2008</option>
	<option value="2009" >2009</option>
	<option value="2010" >2010</option>
	<option value="2011" >2011</option>
	<option value="2012" >2012</option>
	<option value="2013" >2013</option>
	<option value="2014" >2014</option>
	<option value="2015" >2015</option>
	<option value="2016" >2016</option>
	<option value="2017" >2017</option>
	<option value="2018" >2018</option>
	<option value="2019" >2019</option>
	<option value="2020" >2020</option>
	
</select>
<!-- <input type="text" id="data2" name="data2" value="< %=datenew2%>" size="15" readonly/></td><td align="left">
  <input type="button" name="To Date" value="To Date" id="trigger1">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "data2",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "trigger1"       // ID of the button
    }
  );
</script>-->
</td>
<!--  <td>
<input type="text" id="calender" name="calender" size="10" class="formElement" readonly/></td><td>
<input type="image" src="images/FromDate.bmp" id="trigger">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender",         // ID of the input field
      ifFormat    : "%d-%b-%Y",     // the date format
      button      : "trigger"       // ID of the button
    }
  );
</script>
</td><td>
<input type="text" id="calender1" name="calender1" size="10" class="formElement"  readonly/>
</td><td>
<input type="image" src="images/todate.bmp" id="trigger1">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender1",         // ID of the input field
      ifFormat    : "%d-%b-%Y",    // the date format
      button      : "trigger1"       // ID of the 
    }
  );
</script></td>
-->
<td><input type="submit" name="submit"  value="submit"></td></tr>
</table>
<%!
	 
%>
<%
/*	String calender="",calender1="";

	String data=request.getParameter("calender");
	String data1=request.getParameter("calender1");*/
//	String d1="01-jul-2010";
	String data=request.getParameter("data1");
	String data1=request.getParameter("data2");
	//int data2=Integer.parseInt(data1);
	String cust="",sql2="",customer="",sql11="";
	double Amtperveh=0.0,AmtPerDay=0.0,SLAdiff=0.0,ExpTotalAmt=0.0;	
	double AmtSLADiff=0.0,NetBillAmt=0;
	int totalexpected=0;
	double totalNetBill=0.0;	
	int totalvehcounter=0;    
	//int totdiff=0;
	String Nettotamt="";
	float  monthdays=0.0f;
	float  monthdays1=0.0f;
	String finaldate="";
	String finaldate1="";
	////System.out.println("data---->"+data);
//	 String s = new Integer(str).toString();
//int result = data.compareTo(d1);
if(data==null)
{

}

else
{	
	
	String Customer1,CustomerCode,SLAAttained,Rate,BillType,ChargeperDay,SLAPer,GroupName,NotCaptured,Maintenance,VehcileAdded,VehcileRemoved,TotalDays,NoofVehicles;
	String CapturedDays,DisconnectedDays,TotalBilledDays;
	float BilledAmt1=0.0f;
	String today=new SimpleDateFormat("dd").format(new java.util.Date());
	int today1=Integer.parseInt(today);
	//out.print(today);
	/*java.util.Date showDate6 = new SimpleDateFormat("dd-MMM-yyyy").parse(data1);
    Format formatter6 = new SimpleDateFormat("yyyy-MM-dd");
    String showdate6=formatter6.format(showDate6);
	String Month=showdate6.substring(5,7);
	String Year=showdate6.substring(0,4);
	calender=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
	calender1=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
	String mont=calender.substring(5,7);
	String mont1=calender.substring(5,7);
	String day=calender.substring(8,10);
	String day1=calender1.substring(8,10);
	int year=Integer.parseInt(calender.substring(0,4));
	int year1=Integer.parseInt(calender1.substring(0,4));
	if(mont.equals("01")||mont.equals("03")||mont.equals("05")||mont.equals("07")||mont.equals("08")||mont.equals("10")||mont.equals("12"))
	{
		monthdays=31;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else if(mont.equals("04")||mont.equals("06")||mont.equals("09")||mont.equals("11"))
	{
		monthdays=30;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year%4==0)
		{
			monthdays=29;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays=28;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
	}
	if(mont1.equals("01")||mont1.equals("03")||mont1.equals("05")||mont1.equals("07")||mont1.equals("08")||mont1.equals("10")||mont1.equals("12"))
	{
		monthdays1=31;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else if(mont1.equals("04")||mont1.equals("06")||mont1.equals("09")||mont1.equals("11"))
	{
		monthdays1=30;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year1%4==0)
		{
			monthdays1=29;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays1=28;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
	}
	*/
	%>
	<table width="750px" border="0" align="center" bgcolor="#77D7D4">
	<tr>
	<th><font size="2" color="maroon" >SLA Summary Report for Month-<%=data%> and Year-<%=data1%> </font> </th>
		<th><a href="excel_slasummary.jsp?month=<%=data%>&year=<%=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a></th>
	</tr>	
	</table>
	<br></br>
	<table border="1" width="100%" class="sortable">
<tr>
<td>SrNo</td>
<td>Customer</td>
<!-- <th><font color="White">CusromerCode</font></th>-->
<td>SLAPer</td>
<!--<th><font color="White">Rate</font></th>  -->

<td>No Of<br>Vehicles</td>
<td>Vehcile<br>Added</td>
<td>Vehcile<br>Removed</td>
<td>Captured<br>Days</td>
<td>% Of Captured<br>Days</td>
<td>Disconnected<br>Days</td>
<td>Maintenance<br>Days</td>
<td>NotCaptured</td>
<td>TotalDays</td>
<td>% Of Billed<br>Days</td>
<td>TotalBilled<br>Days</td>
<td>GroupName</td>
<td>BillType</td>
<td>SLAAttained</td>
<!-- <th><font color="White">BilledAmt</font></th> -->
</tr>
	<%
	try
	{
		
		Connection con;
		Statement st=null,st1=null,st2=null,st4=null,st5=null,st6=null,st7=null; 
	
		Class.forName("org.gjt.mm.mysql.Driver");
	      
	     // conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps", "fleetview", "1@flv");
	     con= DriverManager.getConnection("jdbc:mysql://173.234.153.82/db_gps","fleetview","1@flv");
		
		//Class.forName(MM_dbConn_DRIVER);
		//con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st=con.createStatement();
	    st1=con.createStatement();
	    st2=con.createStatement();
	    st4=con.createStatement();
	    st5=con.createStatement();
	    st6=con.createStatement();
	    st7=con.createStatement();
	    
	    NumberFormat nf = NumberFormat.getNumberInstance();
	    NumberFormat nf1 = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2) ;
		nf1.setMaximumFractionDigits(2) ;
		  nf.setGroupingUsed(false); 
			
		  
		  String fromdate=data1+"-"+data+"-01";
		  String data2="20"+data1;
		  int year=Integer.parseInt(data2);
		  //System.out.println("fromdate"+fromdate);
		  if(data.equalsIgnoreCase("01")||data.equalsIgnoreCase("03")||data.equalsIgnoreCase("05")||data.equalsIgnoreCase("07")||data.equalsIgnoreCase("08")||data.equalsIgnoreCase("10")||data.equalsIgnoreCase("12"))
		  {
		  monthdays=31;
		  }
		  else if(data.equalsIgnoreCase("04")||data.equalsIgnoreCase("06")||data.equalsIgnoreCase("09")||data.equalsIgnoreCase("11"))
		  {
		  	monthdays=30;
		  }
		  else
		  {
			  if(year%4==0)
				{
					monthdays=29;
				
				}
				else
				{
					monthdays=28;
					
				}
		  }
		//  //System.out.println("monthdays----->"+monthdays);
		
		String code="select distinct(transporter) from db_gps.t_billingdetails where Month1='"+fromdate+"' and ERPTransporterCode !=0  order by transporter asc";
		ResultSet rst1=st4.executeQuery(code);
		System.out.println("Code  -->"+code);
		
		int j=1;
		while(rst1.next())
		{
				
		System.out.println("In While 1");
		//String code1=rst1.getString("ERPtransportercode");
		String transporter=rst1.getString("transporter");
		//System.out.println("ERPTransporterCode  -->"+code1);
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.ERPtransporterCode='"+code1+"'  limit 1";
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and ERPTransporterCode='"+code1+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.ERPtransporterCode='"+code1+"'  limit 1";
		
		//String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as VehcileAdded,(select sum(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as DisconnectedDays,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.transporter='"+transporter+"'  limit 1";
		
		String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select sum(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as VehcileAdded,(select count(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"' and vehRemovedThisMonth !='No' and vehid not in (select vehiclecode from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' )) as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as DisconnectedDays,(select sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as Maintenance,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes)+sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.transporter='"+transporter+"'  limit 1";

		
		ResultSet rst=st2.executeQuery(sql);
		
	    //String sql="select ERPCustName as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays,GroupName,BillType,t_billingdetails.Transporter as transporter from t_fv_erp_relation,t_billingdetails where month1='"+fromdate+"' and t_billingdetails.vehid = t_fv_erp_relation.vehid group by   ERPCustName,groupcode";
	    
	   
	   // String sql="Select ERPCustName as Customer,ERPCode as CusromerCode,SLAPer,Rate,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,GroupName,BillType from t_fv_erp_relation ,t_billingdetails where month1='" & Year(DTP_fromDate.Value) & "-" & Format(Month(DTP_fromDate.Value), "00") & "-01" & "'" & mCustWhereCondition & " and t_billingdetails.vehid    = t_fv_erp_relation.vehid  and t_fv_erp_relation.BillTransporter='Yes' group by   ERPCustName,groupcode";
	   //System.out.println(sql);	
	   
	  
	   
	   System.out.println("Code 1 -->"+sql);
	   
	   while(rst.next())
	   	{
		   System.out.println("In While 2");   
		   
		   System.out.println("int i value  -->"+j);
	   		String noOfVehicleAdded="";
		   
		   Customer1=rst.getString("Customer");
		  // System.out.println("customer--->"+Customer1);
		  
	   		transporter=rst.getString("transporter");
	   		//System.out.println("Transporter --->"+transporter);
	   		CustomerCode=rst.getString("CustomerCode");
	   		SLAPer=rst.getString("SLAPer");
	   		Rate=rst.getString("Rate");
	   		ChargeperDay=rst.getString("ChargeperDay");
	   		NoofVehicles=rst.getString("NoofVehicles");
	   		System.out.println("NoofVehicles --->"+NoofVehicles);
	   		VehcileAdded=rst.getString("VehcileAdded");
	   		VehcileRemoved=rst.getString("VehcileRemoved");
	   		System.out.println("Removed --->"+VehcileRemoved);
	   		CapturedDays=rst.getString("CapturedDays");
	   		DisconnectedDays=rst.getString("DisconnectedDays");
	   		NotCaptured=rst.getString("NotCaptured");
	   		Maintenance=rst.getString("Maintenance");
	   		TotalDays=rst.getString("TotalDays");
	   		TotalBilledDays=rst.getString("TotalBilledDays");
	   		GroupName=rst.getString("GroupName");
	   		BillType=rst.getString("BillType");
	   		float	CapturedDays1 = Float.parseFloat(CapturedDays);
	   		float	TotalDays1 = Float.parseFloat(TotalDays);
			float	SLAPer1 = Float.parseFloat(SLAPer);
			float	TotalBilledDays1 = Integer.parseInt(TotalBilledDays);
			 float ChargeperDay2 =Float.parseFloat(ChargeperDay);
			 float	NoofVehicles1 = Float.parseFloat(NoofVehicles);
			 float	Rate1 = Float.parseFloat(Rate);
			String SLAAttained1="";
			float PerOfBILL=(TotalBilledDays1*100)/TotalDays1;
	   		float PerOfCapturedDays=(CapturedDays1*100)/TotalDays1;
		//	//System.out.println("PerOfCapturedDays--->"+PerOfCapturedDays);
	//   		int i=1;
	   		int TotalNo=0,TotalYesStar=0;
	   		String Yes="Yes";
	   	//	String s=rst.getString("D"+i);
	   	//	//System.out.println("string s"+s);
	   		//	int	day11 = Integer.parseInt(day);
	   	//		int	day12 = Integer.parseInt(day1);
	   		//	//System.out.println("day"+day11);
		   	//	//System.out.println("day1"+day12);
	   			//int	Yes22 = Integer.parseInt(Yes);
	   			//double	Yes23 = Double.parseDouble("Yes");
	   			//int i=01;
	   		/*    String[] D = new String[31];
	   		 CapturedDays=0;
	   		 DisconnectedDays=0;
	   		for(i=day11;i<=day12;i++)
	   		{
	   			
	   			
	   			//System.out.println("(D[i]---->"+i);
	   			String str="D"+i;
	   			if(s.equals("Yes"))
	   			{
	   				CapturedDays= CapturedDays +1;
	   				//System.out.println("CapturedDays-->"+CapturedDays);
	   			}else
	   			{
	   				CapturedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				DisconnectedDays= DisconnectedDays+1;
	   				//System.out.println("DisconnectedDays"+DisconnectedDays);
	   			}else
	   			{
	   				DisconnectedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				TotalNo=TotalNo+1;
	   				//System.out.println("TotalNo"+TotalNo);
	   			}else
	   			{
	   				
	   			}
	  
	   		}
	   	int TotalBilledDays=CapturedDays+DisconnectedDays;*/
	   		float SLADays=0.0f,SLADayPerveh=0.0f;
	   	
	   		Customer1=rst.getString("Customer");
	   		if(BillType.equals("Combined"))
	   		{	
	   			if(SLAPer.compareTo("0")==0)	
	   			{
	   				SLAAttained1="NO SLA";
	   				BilledAmt1=(Rate1 * NoofVehicles1);
	   			}
	   			else
	   			{
	   				SLADays = (TotalDays1 / 100) * SLAPer1;
   			//	//System.out.println("SLADays"+SLADays);
		   			if(TotalBilledDays1 >= SLADays)
		   			{
		   				SLAAttained1 = "Yes";
		   			    BilledAmt1 = TotalDays1 * ChargeperDay2;
		   				
		   			}
		   			else
		   			{
		   	      		SLAAttained1 = "No";
		   	        	BilledAmt1 =((TotalDays1 - (SLADays - TotalBilledDays1)) * ChargeperDay2);
		   			}
	   			}
	   		}
	   		else
	   		{
	   			
	   			////System.out.println("Sla per from else"+SLAPer1);
	   			////System.out.println("monthdays from else"+monthdays);
	   			SLADayPerveh = ((monthdays / 100) * SLAPer1);
	   		//	//System.out.println("now in SLADayPerveh from else --->"+SLADayPerveh);
	   			String sql4="Select count(t_billingdetails.vehid) as NoofVehicles2  from  t_fv_erp_relation ,t_billingdetails where month1='"+fromdate+"'  and t_billingdetails.vehid= t_fv_erp_relation.vehid  and ERPCode='"+CustomerCode+"' and groupname='"+GroupName+"' and TotalYesStar+TotalYes >='"+SLADayPerveh+"'";
	   	//	System.out.println("sql4---->"+sql4);
	   			ResultSet rst2=st7.executeQuery(sql4);
	   			if(rst2.next())
	   			{
	   				String NoofVehicles2=rst2.getString("NoofVehicles2");
	   				int NoofVehicles3=Integer.parseInt(NoofVehicles2);
	   				SLAAttained1 = NoofVehicles2+ "veh billed";
	   				BilledAmt1 = NoofVehicles3*Rate1;
	   			//	//System.out.println("BilledAmt1 from else --->"+BilledAmt1);
	   			}
	   		}
	   	
			   String sum="select count(*) as noOfVehicleAdded from db_gps.t_billingdetails where month1='"+fromdate+"' and Transporter='"+transporter+"' and VehAddedThisMonth NOT LIKE ('No')";
		  // 		System.out.println("Sum --> "+sum);
			   ResultSet rssum=st6.executeQuery(sum);
		   		if(rssum.next()){
		   			noOfVehicleAdded=rssum.getString("noOfVehicleAdded");
		   			//System.out.println("noOfVehicleAdded--->"+noOfVehicleAdded);
		   		}
		   	String noOfVehicleRemoved="";
		   	 String removed="select count(*) as noOfVehicleRemoved from db_gps.t_billingdetails where month1='"+fromdate+"' and Transporter='"+transporter+"' and vehRemovedThisMonth NOT LIKE ('No')";
		   	//	System.out.println("Removed -- >"+removed);
			   ResultSet rsremoved=st5.executeQuery(removed);
		   		if(rsremoved.next()){
		   			noOfVehicleRemoved=rsremoved.getString("noOfVehicleRemoved");
		   			//System.out.println("noOfVehicleRemoved--->"+noOfVehicleRemoved);
		   		}
	   		%>
	   		<tr>
					<td><%=j %></td>
					<%
					transporter=transporter.replace("&","..."); 
					%>
					<td>
					<div align="center">
					<a href="SLAForTransporter.jsp?transporter=<%=transporter%>&date=<%=fromdate%>&SLAPer=<%=SLAPer%>&BillType=<%=BillType%>&monthdays=<%=monthdays%>&CustomerCode=<%=CustomerCode%>&GroupName=<%=GroupName %>"><%=Customer1%>
					</a></div></td>
			<!--<td><div algn="center"><%=CustomerCode%></div></td> -->		
					<td><div align="center"><%=SLAPer%></div></td>
			<!--<td><div align="center"><%=Rate %></div></td> 
					<td><div align="center"><%=nf.format(ChargeperDay2)%></div></td> -->
					<td><div align="center"><%=NoofVehicles%></div></td>
					<td><div align="center"><%=noOfVehicleAdded%></div></td>
					<td><div align="center"><%=VehcileRemoved%></div></td>
					<td><div align="center"><%=CapturedDays%></div></td>
					<td><div align="center"><%=nf.format(PerOfCapturedDays)%></div></td>
					<td><div align="center"><%=DisconnectedDays%></div></td>
					<td><div align="center"><%=Maintenance%></div></td>
					<td><div align="center"><%=NotCaptured%></div></td>
					<td><div align="center"><%=TotalDays%></div></td>
					<td><div align="center"><%=nf1.format(PerOfBILL)%></div></td>
					<td><div align="center"><%=TotalBilledDays%></div></td>
					<td><div align="center"><%=GroupName%></div></td>
					<td><div align="center"><%=BillType%></div></td>
					<td><div align="center"><%=SLAAttained1%></div></td>
				<!--<td><div align="center"><%=nf1.format(BilledAmt1)%></div></td>  -->	
			</tr>
				   		
	   		
	   		<%
	   		
	   		j++;			 	
	   	}
	   
		}
		
			
	   	}
catch(Exception e)
{
	//System.out.println(""+e);
	e.printStackTrace();
}

}
%>

</body>
</html>
