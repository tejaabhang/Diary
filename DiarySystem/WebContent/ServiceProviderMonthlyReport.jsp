<%@ page language="java"  import="java.sql.*" %>
    <%@ page import="java.sql.PreparedStatement"  %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    
    
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>-->

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import ="java.text.DecimalFormat" errorPage="" %>
<script language="javascript">
function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);

// alert("id==>"+id);
// alert("show==>"+show);

	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

</script>

<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
		.popupx {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
		
		
		</style>


<%!
	Connection conn;
	
	%>
<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>


<!--<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;}</style>-->

<title>ServicProviderMonthlyReport</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>

<!--<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />-->

<script type="text/javascript">
function validateForm() {

	var Dept= document.getElementById("esclateDept").options[document.getElementById("esclateDept").selectedIndex].value;
	if(Dept=="select") {
	alert("Please Select a Department for Escalation!");
	return false;
}
return true;
}




function displayBody() {

document.getElementById("monthlyreport").style.display="block";
}
function gotoExcel(ipageno, iShowRows,sp,date,mtsr)  
{  


window.location.href="serviceproviderexcel.jsp?ipageno="+ipageno+"&iShowRows="+iShowRows+"&sp="+sp+"&TheDate="+date+"&month="+mtsr;	


var obj = document.getElementById(elemId);
      var oFld = document.getElementById(frmFldId);
      oFld.value = obj.innerHTML;
      document.sp.action ="excel.jsp";
      document.forms["sp"].submit();
} 
function Reload()
{
//alert("Hej");  
window.location.reload(); 
}

function confirmSubmit()
{


//alert("inside validate function ");
var month= document.getElementById("mnth").options[document.getElementById("mnth").selectedIndex].value;
var year= document.getElementById("yr").options[document.getElementById("yr").selectedIndex].value;
var srvice_provider= document.getElementById("serPro").options[document.getElementById("serPro").selectedIndex].value;

//alert("month been selected==>"+month);
//alert("year been selected==>"+year);
//alert("srvice_provider been selected==>"+srvice_provider);



if(month=="select") {
alert("Please Select a Month from drop-down");

return false;


}
if(year=="select") {
alert("Please Select a Year from drop-down");

	return false;
	
}

if(srvice_provider=="select") {
alert("Please Select a Service Provider from drop-down");

	return false;

	
}

//return false;
}
//for Full Excel
function goToFullExcel(sp,date,mtsr) {
//alert(">>>>"+sp+">>>>>>>>"+date+">>>>>>");

	window.location.href="serviceProviderMonthlyReportExcel.jsp?sp="+sp+"&TheDate="+date+"&month="+mtsr;	
}
</script>


</head>


<%
String month="";
String year="";
String serviceProvider="";

month = request.getParameter("mnth");
year = request.getParameter("yr");
serviceProvider = request.getParameter("serPro");

System.out.println("The month is :"+month);
System.out.println("The year is :"+year);
System.out.println("The service provider is :"+serviceProvider);


Statement st1=null;
Statement st2=null;


System.out.println("**********ServicProviderMonthlyReport*************");

String MM_dbConn_DRIVER2 = "org.gjt.mm.mysql.Driver";
  //String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/airtelnew";
String MM_dbConn_GPS = "jdbc:mysql://192.168.2.35/airtelnew";

String MM_dbConn_USERNAME2 = "fleetview";
String MM_dbConn_PASSWORD2 = "1@flv";


		Class.forName(MM_dbConn_DRIVER2);
		conn = DriverManager.getConnection(MM_dbConn_GPS,MM_dbConn_USERNAME2, MM_dbConn_PASSWORD2);
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		ResultSet rsPagination = null;
	    ResultSet rsRowCnt = null;
	    
	    PreparedStatement psPagination=null;
	    PreparedStatement psRowCnt=null;
	    
	    int iShowRows=20;  // Number of records show on per page
	    int iTotalSearchRecords=10;  // Number of pages index shown
	    
	    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
	    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
	    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
	    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
	    
	    int iStartResultNo=0;
	    int iEndResultNo=0;

	    if(iPageNo==0)
	    {
	        iPageNo=0;
	    }
	    else{
	        iPageNo=Math.abs((iPageNo-1)*iShowRows);
	    }

System.out.println("This is Ashutosh Bhardwaj");



 
 
 
 
 
 
 
 
%>



<div id="form_container" style="width:75%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		
<!--		<td><a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a></td>-->
<!--		<td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Service Provider Monthly Report</a></div></td>-->
		
<!--		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>-->
		</table></h1>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Service Provider Monthly Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>


<form id="serviceProviderMonthlyReport"  name="serviceProviderMonthlyReport" class="appnitro" enctype="multipart/form-data" action="" method="get" onsubmit="return confirmSubmit()">
								
  <ul>
	<div align="center" style="width:100%; ">
	<table border="0" bgcolor="#E6E6E6" width="100%" align="center" >
			
	<tr style="background: #E6E6E6">
		<td align="right" colspan="2">			
			<b>Month</b> 		
	  </td>
	  <td align="left" colspan="2">			
			<div>
		<select class="element select medium" id="mnth" name="mnth" style="width: 100px; height: 25px;" >
		
		
			<%
					if((month==null)) {
						System.out.println(">>");
						month="-";
						%>
						<option value="select" selected>-->select<--</option>
						<%
					}else{
						%>
						<option value="select">-->select<--</option>
						<%
					}
			%>
			<%
					if(month.equals("01")) {
						%>
						<option value="01" selected>JAN</option>
						<%
					}else{
						%>
						<option value="01">JAN</option>
						<%
					}
			%>
			<%
					if(month.equals("02")) {
						%>
						<option value="02" selected>FEB</option>
						<%
					}else{
						%>
						<option value="02">FEB</option>
						<%
					}
			%>
			<%
					if(month.equals("03")) {
						%>
						<option value="03" selected>MAR</option>
						<%
					}else{
						%>
						<option value="03">MAR</option>
						<%
					}
			%>
			<%
					if(month.equals("04")) {
						%>
						<option value="04" selected>APR</option>
						<%
					}else{
						%>
						<option value="04">APR</option>
						<%
					}
			%>
			<%
					if(month.equals("05")) {
						%>
						<option value="05" selected>MAY</option>
						<%
					}else{
						%>
						<option value="05">MAY</option>
						<%
					}
			%>
			<%
					if(month.equals("06")) {
						%>
						<option value="06" selected>JUNE</option>
						<%
					}else{
						%>
						<option value="06">JUNE</option>
						<%
					}
			%>
			<%
					if(month.equals("07")) {
						%>
						<option value="07" selected>JULY</option>
						<%
					}else{
						%>
						<option value="07">JULY</option>
						<%
					}
			%>
			<%
					if(month.equals("08")) {
						%>
						<option value="08" selected>AUG</option>
						<%
					}else{
						%>
						<option value="08">AUG</option>
						<%
					}
			%>
			<%
					if(month.equals("09")) {
						%>
						<option value="09" selected>SEPT</option>
						<%
					}else{
						%>
						<option value="09">SEPT</option>
						<%
					}
			%>
			<%
					if(month.equals("10")) {
						%>
						<option value="10" selected>OCT</option>
						<%
					}else{
						%>
						<option value="10">OCT</option>
						<%
					}
			%>
			<%
					if(month.equals("11")) {
						%>
						<option value="11" selected>NOV</option>
						<%
					}else{
						%>
						<option value="11">NOV</option>
						<%
					}
			%>
			<%
					if(month.equals("12")) {
						%>
						<option value="12" selected>DEC</option>
						<%
					}else{
						%>
						<option value="12">DEC</option>
						<%
					}
			%>		
		</select>
	</td>
	<td align="right" colspan="2">			
			<b>Year</b> 		
	  </td>
	<td>
	<div>		  
		<select class="element select medium" id="yr" name="yr" style="width: 100px; height: 25px;" >
			
			<%
					if((year==null)) {
						year="-";
						System.out.println(">>>>");
						%>
						<option value="select" selected>-->select<--</option>
						<%
					}else{
						%>
						<option value="select">-->select<--</option>
						<%
					}
			%>
			<%
					if(year.equals("2006")) {
						%>
						<option value="2006" selected>2006</option>
						<%
					}else{
						%>
						<option value="2006">2006</option>
						<%
					}
			%>	
			<%
					if(year.equals("2007")) {
						%>
						<option value="2007" selected>2007</option>
						<%
					}else{
						%>
						<option value="2007">2007</option>
						<%
					}
			%>
			<%
					if(year.equals("2008")) {
						%>
						<option value="2008" selected>2008</option>
						<%
					}else{
						%>
						<option value="2008">2008</option>
						<%
					}
			%>
			
			<%
					if(year.equals("2009")) {
						%>
						<option value="2009" selected>2009</option>
						<%
					}else{
						%>
						<option value="2009">2009</option>
						<%
					}
			%>
			<%
					if(year.equals("2010")) {
						%>
						<option value="2010" selected>2010</option>
						<%
					}else{
						%>
						<option value="2010">2010</option>
						<%
					}
			%>
			<%
					if(year.equals("2011")) {
						%>
						<option value="2011" selected>2011</option>
						<%
					}else{
						%>
						<option value="2011">2011</option>
						<%
					}
			%>	
			<%
					if(year.equals("2012")) {
						%>
						<option value="2012" selected>2012</option>
						<%
					}else{
						%>
						<option value="2012">2012</option>
						<%
					}
			%>
			<%
					if(year.equals("2013")) {
						%>
						<option value="2013" selected>2013</option>
						<%
					}else{
						%>
						<option value="2013">2013</option>
						<%
					}
			%>
			<%
					if(year.equals("2014")) {
						%>
						<option value="2014" selected>2014</option>
						<%
					}else{
						%>
						<option value="2014">2014</option>
						<%
					}
			%>
			<%
					if(year.equals("2015")) {
						%>
						<option value="2015" selected>2015</option>
						<%
					}else{
						%>
						<option value="2015">2015</option>
						<%
					}
			%>
			<%
					if(year.equals("2016")) {
						%>
						<option value="2016" selected>2016</option>
						<%
					}else{
						%>
						<option value="2016">2016</option>
						<%
					}
			%>
			<%
					if(year.equals("2017")) {
						%>
						<option value="2017" selected>2017</option>
						<%
					}else{
						%>
						<option value="2017">2017</option>
						<%
					}
			%>
			<%
					if(year.equals("2018")) {
						%>
						<option value="2018" selected>2018</option>
						<%
					}else{
						%>
						<option value="2018">2018</option>
						<%
					}
			%>
			<%
					if(year.equals("2019")) {
						%>
						<option value="2019" selected>2019</option>
						<%
					}else{
						%>
						<option value="2019">2019</option>
						<%
					}
			%>
			<%
					if(year.equals("2020")) {
						%>
						<option value="2020" selected>2020</option>
						<%
					}else{
						%>
						<option value="2020">2020</option>
						<%
					}
			%>				
		
			
		</select>
	  </div> 		
	  </td>
	  <td align="right" colspan="2">			
			<b>Service Provider</b> 		
	  </td>
	  <td align="left" colspan="2">			
			<div>
		<select class="element select medium" id="serPro" name="serPro" style="width: 150px; height: 25px;" >
		
		<%
					if((serviceProvider==null)) {
						serviceProvider="-";
						System.out.println(">>>>>>");
						%>
						<option value="select" selected>------->select<-------</option>
						<%
					}else{
						%>
						<option value="select">------->select<-------</option>
						<%
					}
		%>	
			
			<%
            //String query1 = "select distinct(Service_Provider) from db_simbillstest.t_subsummarydet order by RID";
             
			
			
			 String query1 = "select distinct(Service_Provider) from t_subsummarydet where Service_Provider <> '' order by Service_Provider";
			ResultSet rs1 = st1.executeQuery(query1);
             while(rs1.next())
              {
            	 
            	 
					if(serviceProvider.equals(rs1.getString("Service_Provider"))) {
						%>
						<option value="<%=rs1.getString("Service_Provider") %>" selected><%=rs1.getString("Service_Provider")%></option>
						<%
					}else{
						%>
						<option value="<%=rs1.getString("Service_Provider") %>"><%=rs1.getString("Service_Provider")%></option>
						<%
					}
				
			} %>			
		</select>
	  </div>  		
	  </td>
	  <td align="right" colspan="4">			
			<b><input type="submit" id="sub" name="Submit" value="Submit" style="background: " onclick=""/></b> 		
	  </td>
	</tr>
</table>	
</div>
</form><br>

<%
DecimalFormat df = new DecimalFormat("0.00");
String mStr = "";
try{
	if(month==null || month.equals("-")) {
		System.out.println(">>");
		month="-";
		mStr="-";
	}
	if(year==null || year.equals("-")) {
		System.out.println(">>>");
		year="-";
	}
	if(serviceProvider==null || serviceProvider.equals("-")) {
		System.out.println(">>>>");
		serviceProvider="-";
	}
	}catch(Exception e) {
		System.out.println("Exception >>>"+e);
		e.printStackTrace();
	} 

	System.out.println("The month is :"+month);
	System.out.println("The mStr is :"+mStr);
	System.out.println("The year is :"+year);
	System.out.println("The service provider is :"+serviceProvider);

	String theDate = "";	
	if(year.equals("-") || month.equals("-")) {
		System.out.println("in if");
		serviceProvider="-";
		theDate = "-";
	}else{
		System.out.println("in else");
		theDate = year +"-"+month+"-01";
	}
	System.out.println("The date is%%%%%%%%%%%%%%%% :"+theDate);
	
	if(month.equals("01")) {mStr="JAN";}
	if(month.equals("02")) {mStr="FEB";}
	if(month.equals("03")) {mStr="MAR";}
	if(month.equals("04")) {mStr="APR";}
	if(month.equals("05")) {mStr="MAY";}
	if(month.equals("06")) {mStr="JUNE";}
	if(month.equals("07")) {mStr="JULY";}
	if(month.equals("08")) {mStr="AUG";}
	if(month.equals("09")) {mStr="SEPT";}
	if(month.equals("10")) {mStr="OCT";}
	if(month.equals("11")) {mStr="NOV";}
	if(month.equals("12")) {mStr="DEC";}

%>

<div id ="monthlyreport" style="width:100%; ">
<div align="center" style="width:100%; ">
	<table border="0" bgcolor="#E6E6E6" width="100%" align="center" CELLPADDING=4 >
			
	<tr style="background: #E6E6E6">
	
	  <td align="left" colspan="2" style="width: 20%;">			
			<b>Selected Filters :</b> 		
	  </td>
	  <td align="left" colspan="2">			
			<b>Month :</b>&nbsp;&nbsp;<%=mStr %>		
	  </td>
	  <td align="left" colspan="2">			
			<b>Year :</b>&nbsp;&nbsp;<%=year %>		
	  </td>
	  <td align="left" colspan="2">			
			<b>Service Provider :</b>&nbsp;&nbsp;<%=serviceProvider %>	
	  </td>		
	</tr>
</table>
<%if(!year.equals("-") || !month.equals("-")) { %>
<br>
<table border="0"  width="100%" align="center"  style="background: #f8fcff">
	<tr style="background: #BDBDBD">
	  <th align="center">MNo </th>
	  <th align="center">AccNo </th>
	  <th align="center">One Time Charges </th>	
	  <th align="center">Monthly Charges </th>	
	  <th align="center">Call Charges </th>	
	  <th align="center">Mobile Internet </th>	
	  <th align="center">VAS </th>	
	  <th align="center">Roaming Charges </th>	
	  <th align="center">Misc Charges </th>	
	  <th align="center">Discount </th>	
	  <th align="center">Tax </th>	
	  <th align="center">Total</th>	
	  <th align="center">Payable Amt</th>	
	</tr>	      
	  
<%



String mobno="-",accno="-",onetimecharge="-",monthlycharge="-",callcharge="-",mInternet="-",vas="-",roamcharge="-",misc="-",discount="-",tax="-",total="-",TwAmt="-";




 //String query = "SELECT count(Mobno) as mobno,count(AccNo) as accno,sum(OneTimeCharge) as onetimecharge,sum(MonthlyCharge) as monthlycharge,sum(UsageCharge) as callcharge,sum(MessagingCharges) as mInternet,sum(ValueASCharge) as vas,sum(RoamingCharge) as roamcharge,sum(MiscCharge) as misc,sum(Discounts) as discount,sum(Tax) as tax,sum(Total) as total,sum(TWAmt) as Twamt from db_simbillstest.t_subsummarydet WHERE Service_Provider = '"+serviceProvider+"' AND DateTime1='"+theDate+" 00:00:00'";
String query="";

	
	query = "SELECT count(Mobno) as mobno,count(AccNo) as accno,sum(OneTimeCharge) as onetimecharge,sum(MonthlyCharge) as monthlycharge,sum(UsageCharge) as callcharge,sum(MessagingCharges) as mInternet,sum(ValueASCharge) as vas,sum(RoamingCharge) as roamcharge,sum(MiscCharge) as misc,sum(Discounts) as discount,sum(Tax) as tax,sum(Total) as total,sum(TWAmt) as Twamt from t_subsummarydet WHERE Service_Provider = '"+serviceProvider+"' AND DateTime1='"+theDate+" 00:00:00'";	

 

ResultSet rs2 = st2.executeQuery(query);
System.out.println("The query is :"+query);
if(rs2.next())
 {
	System.out.println("Inside the if ");
	
	System.out.println("Twamt==>"+rs2.getString("Twamt"));
	if(rs2.getString("Twamt")!=null)
	{
	mobno = rs2.getString("mobno");
	accno = rs2.getString("accno");
	onetimecharge = rs2.getString("onetimecharge");
	monthlycharge = rs2.getString("monthlycharge");
	callcharge = rs2.getString("callcharge");
	mInternet = rs2.getString("mInternet");
	vas = rs2.getString("vas");
	roamcharge = rs2.getString("roamcharge");
	misc = rs2.getString("misc");
	discount = rs2.getString("discount");
	tax = rs2.getString("tax");
	total = rs2.getString("total");
	TwAmt = rs2.getString("Twamt");
 
	
	System.out.println("tax===================> "+tax);
	
	
	monthlycharge=df.format(Double.parseDouble(monthlycharge));
	callcharge=df.format(Double.parseDouble(callcharge));
	mInternet=df.format(Double.parseDouble(mInternet));
	discount=df.format(Double.parseDouble(discount));
	roamcharge=df.format(Double.parseDouble(roamcharge));
	total=df.format(Double.parseDouble(total));
	tax=df.format(Double.parseDouble(tax));
	TwAmt=df.format(Double.parseDouble(TwAmt));
%>	  						
	<tr style="background: #E8EEF7">
	  <td align="right"><div align="right" style="overflow: auto;"><%= mobno%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= accno%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= onetimecharge%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= monthlycharge%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= callcharge%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= mInternet%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= vas%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= roamcharge%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= misc%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= discount%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= tax%></div></td>
	  <td align="right"><div align="right" style="overflow: auto;"><%= total%></div></td>
	   <td align="right"><div align="right" style="overflow: auto;"><%= TwAmt%></div></td>
	</tr>  
	<%
 }	
 }

System.out.println("Afetre if loop");

%>  
	  		
</table>	
</div>
<%} %>		
<form id="sp" name="sp" method="post" >		
<div  style="width:100%;" id="table1">	
<%
 

String exportFileName=""+serviceProvider+"_monthly_report_of_"+mStr+"_"+year+".xls";  

System.out.println("Inside the if %%%%%%%%%%%%%5"+exportFileName);

%>	
		<table  style="width:705px ">
		<tr>
			<td>
					
			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
				<div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="goToFullExcel('<%=serviceProvider%>','<%=theDate %>','<%=mStr %>')">Get Full Excel</a><a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('<%=iPageNo%>','<%=iShowRows %>','<%=serviceProvider%>','<%=theDate %>','<%=mStr %>');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></div>
        	</td>
		</tr>
		
		</table>		



  <%
   
System.out.println("IF LOOP**************"+month);
System.out.println("IF LOOP**************"+year );
System.out.println("IF LOOP**************"+serviceProvider);
if(!(month.equalsIgnoreCase("-")) || !(year.equalsIgnoreCase("-")) || !(serviceProvider.equalsIgnoreCase("-")))
{
	System.out.println("IF LOOP**************" );
%>
<!--	<table border="1"    CELLPADDING="2" style="background: #f8fcff;width:1450px " class="mytable">-->
<!--  -->
<!--  -->
<!--  </table>-->
	
	
<%}else{
	
	System.out.println("ELSE LOOP*****************" );
	
}

%>


	<table border="1" width="100%"   style="background: #f8fcff;" class="sortable">
	<%
	if(!(month.equalsIgnoreCase("-")) || !(year.equalsIgnoreCase("-")) || !(serviceProvider.equalsIgnoreCase("-")))
{
	System.out.println("IF LOOP**************" );
%>
<tr  >
  <td    bgcolor="#BDBDBD" colspan="13" align="center"><div align="center" ><font color="black" size="2"> <b>Billed Amount </b></font> </div> </td>
  <td colspan="11"  bgcolor="#C6DEFF" align="center"><div align="center" > <font color="black" size="2"> <b>Payable Amount</b> </font> </div> </td>
  </tr>
	
	
<%}else{
	
	System.out.println("ELSE LOOP*****************" );
	
}

%>
	
	
	
	
	<tr >
	<th bgcolor="#BDBDBD" align="center"><font color="black" size="2">Sr No</font> </th>
	<th bgcolor="#BDBDBD"  align="center"><font color="black" size="2"> Mobile NO</font></th>
	<th bgcolor="#BDBDBD" align="center"><font color="black" size="2"> Account NO</font> </th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">One Time Charge </font></th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">Monthly Charge </font></th>
	<th bgcolor="#BDBDBD" align="center"><font color="black" size="2">Call Charges</font> </th>
	<th bgcolor="#BDBDBD"  align="center"><font color="black" size="2">Mobile Internet </font></th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2"> VAS </font></th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">Roaming Charge </font></th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">Misc Charge</font> </th>
	<th bgcolor="#BDBDBD" align="center"><font color="black" size="2">Discount</font> </th>
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">Tax</font> </th>
<!--	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">SubTotal</font> </th>-->
	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">Total</font> </th>
	
	 
	 <th  bgcolor="#C6DEFF" align="center"><font color="black" size="2"> One Time Charge</font> </th>
	<th  bgcolor="#C6DEFF" align="center"><font color="black" size="2">Monthly Charge</font> </th>
	<th bgcolor="#C6DEFF" align="center"><font color="black" size="2">Call Charges </font></th>
	<th bgcolor="#C6DEFF" align="center"><font color="black" size="2">Mobile Internet</font></th>
	<th  bgcolor="#C6DEFF" align="center"><font color="black" size="2"> VAS</font></th>
	<th  bgcolor="#C6DEFF" align="center"><font color="black" size="2"> Roaming Charge</font> </th>
	<th  bgcolor="#C6DEFF" align="center"><font color="black" size="2"> Misc Charge </font></th>
	<th bgcolor="#C6DEFF" align="center"><font color="black" size="2"> Discount </font></th>
	<th  bgcolor="#C6DEFF" align="center"><font color="black" size="2"> Tax</font> </th>
	
	
<!--	<th  bgcolor="#BDBDBD" align="center"><font color="black" size="2">SubTotal</font> </th>-->
	<th bgcolor="#C6DEFF" align="center"><font color="black" size="2"> Payable Amt</font> </th>
	<th  bgcolor="#C6DEFF" align="center"> <font color="black" size="2" >Reason </font></th>
	 
	
	
	
	</tr>
			
		
<%
String Mobno="-",AccNo="-",OneTimeCharge="-",MonthlyCharge="-",ValueASCharge="-",RoamingCharge="-",Discounts="-",Tax="-",Total="-",BillMonth="-",UsageCharge="";
String MessagingCharges="-",MiscCharge="-",SubTotal="-",twamt="-",reason="-";
String subtotal="",OneTimeCharge1="-",MonthlyCharge1="-",ValueASCharge1="-",RoamingCharge1="-",Discounts1="-",Tax1="-",Total1="-",BillMonth1="-",UsageCharge1="",MessagingCharges1="-",MiscCharge1="-",SubTotal1="-",twamt1="-",reason1="-" ;
int srno=0;
srno = iPageNo;

//String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM db_simbillstest.t_subsummarydet WHERE Service_Provider = '"+serviceProvider+"' AND DateTime1='"+theDate+" 00:00:00'  order by total desc limit "+iPageNo+","+iShowRows+"";

String sqlPagination="";

	
	sqlPagination="SELECT SQL_CALC_FOUND_ROWS distinct(mobno),comment1,TWAmt1,MiscCharge1,MobileInternet,Total1,UsageCharge1,Tax1,Discounts1,RoamingCharge1,ValueASCharge1,MonthlyCharge1,OneTimeCharge1,comment,TWAmt,MiscCharge,MobileInternet1,UsageCharge,Total,SubTotal,AccNo,Tax,OneTimeCharge,MonthlyCharge,ValueASCharge,RoamingCharge,Discounts FROM t_subsummarydet WHERE Service_Provider = '"+serviceProvider+"' AND DateTime1='"+theDate+" 00:00:00'  order by total desc limit "+iPageNo+","+iShowRows+"";	



 

psPagination=conn.prepareStatement(sqlPagination);
rsPagination=psPagination.executeQuery();

System.out.println("The query is ****************:"+sqlPagination);

////this will count total number of rows
String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
psRowCnt=conn.prepareStatement(sqlRowCnt);
rsRowCnt=psRowCnt.executeQuery();

if(rsRowCnt.next())
 {
    iTotalRows=rsRowCnt.getInt("cnt");
 }
%>
<tr>
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
</tr>
<%
int i1=0;
while(rsPagination.next()){
	Mobno=rsPagination.getString("Mobno");
	AccNo=rsPagination.getString("AccNo");
	OneTimeCharge=rsPagination.getString("OneTimeCharge");
	MonthlyCharge=rsPagination.getString("MonthlyCharge");
	ValueASCharge=rsPagination.getString("ValueASCharge");
	RoamingCharge=rsPagination.getString("RoamingCharge");
	Discounts=rsPagination.getString("Discounts");
	Tax=rsPagination.getString("Tax");
	subtotal=rsPagination.getString("SubTotal");
	
	System.out.println("tax===================> "+Tax);
	System.out.println("Mobno===================> "+Mobno);
	
	
	Total=rsPagination.getString("Total");
	UsageCharge=rsPagination.getString("UsageCharge");
	MessagingCharges=rsPagination.getString("MobileInternet");	
	MiscCharge=rsPagination.getString("MiscCharge");
	twamt=rsPagination.getString("TWAmt");
	reason=rsPagination.getString("comment");
	
	
	
	OneTimeCharge1=rsPagination.getString("OneTimeCharge1");
	MonthlyCharge1=rsPagination.getString("MonthlyCharge1");
	ValueASCharge1=rsPagination.getString("ValueASCharge1");
	RoamingCharge1=rsPagination.getString("RoamingCharge1");
	Discounts1=rsPagination.getString("Discounts1");
	Tax1=rsPagination.getString("Tax1");
	Total1=rsPagination.getString("Total1");
	UsageCharge1=rsPagination.getString("UsageCharge1");
	MessagingCharges1=rsPagination.getString("MobileInternet1");	
	MiscCharge1=rsPagination.getString("MiscCharge1");
	twamt1=rsPagination.getString("TWAmt1");
	reason1=rsPagination.getString("comment1");
	
	
	
	
//	System.out.println("The reason1 is==>"+reason1);
	//System.out.println("The MonthlyCharge1==>"+MonthlyCharge1);
	
	
	if(MonthlyCharge1.equalsIgnoreCase("0"))
	{
		
		System.out.println("The if loop==>");
		OneTimeCharge1=OneTimeCharge;
		MonthlyCharge1=MonthlyCharge;
		ValueASCharge1=ValueASCharge;
		RoamingCharge1=RoamingCharge;
		Discounts1=Discounts;
		Tax1=Tax;
		twamt1=Total;
		reason1=reason;
		UsageCharge1=UsageCharge;
		MessagingCharges1=MessagingCharges;
		MiscCharge1=MiscCharge;
		
	}else{
		
		//System.out.println("The else loop==>");
		
		
	}
	
	MonthlyCharge=df.format(Double.parseDouble(MonthlyCharge));
	UsageCharge=df.format(Double.parseDouble(UsageCharge));
	MessagingCharges=df.format(Double.parseDouble(MessagingCharges));
	Discounts=df.format(Double.parseDouble(Discounts));
	RoamingCharge=df.format(Double.parseDouble(RoamingCharge));
	Total=df.format(Double.parseDouble(Total));
	Tax=df.format(Double.parseDouble(Tax));
	twamt=df.format(Double.parseDouble(twamt));
	
	
	
	
	MonthlyCharge1=df.format(Double.parseDouble(MonthlyCharge1));
	UsageCharge1=df.format(Double.parseDouble(UsageCharge1));
	MessagingCharges1=df.format(Double.parseDouble(MessagingCharges1));
	Discounts1=df.format(Double.parseDouble(Discounts1));
	RoamingCharge1=df.format(Double.parseDouble(RoamingCharge1));
	Total1=df.format(Double.parseDouble(Total1));
	Tax1=df.format(Double.parseDouble(Tax1));
	twamt1=df.format(Double.parseDouble(twamt1));
	
	if(reason ==null) {
		reason="-";
	}
%>		<tr>
		<td align="right">			
			<div align="right" style="overflow: auto;"><%=++srno %></div>	
	    </td>
	  	<td width="100px"  style="overflow: auto;" align="left"><a href="javascript:toggleDetails(<%=i1%>,true);" title="Click Here"><b><%=Mobno%></b></a>
				<br/>			
			
		<div class="popup" id="popup<%=i1%>">
						<table border="0" >
							<tr>
								<td>
									<a href="serviceProviderMonthlyReport1.jsp?mno=<%=Mobno %>&Service_Provider =<%=serviceProvider%>" target="_blank" onclick="toggleDetails(<%=i1%>,false);">Detail Bill</a>
								</td>
							</tr>
							
							<tr>
			<td>
				<a href="serviceProviderMonthlyReport2.jsp?sp=<%= serviceProvider%>&thedate=<%=theDate %>&mno=<%=Mobno %>&accNo=<%=AccNo %>&total=<%= Total%>&TWAmt=<%= twamt%>&OneTimeCharge=<%= OneTimeCharge%>&MonthlyCharge=<%= MonthlyCharge%>&ValueASCharge=<%= ValueASCharge%>&RoamingCharge=<%= RoamingCharge%>&Discounts=<%= Discounts%>&Tax=<%= Tax%>&MiscCharge=<%= MiscCharge%>&UsageCharge=<%= UsageCharge%>&MessagingCharges=<%= MessagingCharges%>&reason=<%= reason%>&month=<%= month%>&year=<%= year%>&serviceProvider=<%= serviceProvider%>&OneTimeCharge1=<%= OneTimeCharge1%>&MonthlyCharge1=<%= MonthlyCharge1%>&ValueASCharge1=<%= ValueASCharge1%>&RoamingCharge1=<%= RoamingCharge1%>&Tax1=<%= Tax1%>&twamt1=<%= twamt1%>&reason1=<%= reason1%>&UsageCharge1=<%= UsageCharge1%>&MessagingCharges1=<%= MessagingCharges1%>&MiscCharge1=<%= MiscCharge1%>&Discounts1=<%= Discounts1%>&reason1=<%= reason1%>" target="_blank" onclick="toggleDetails(<%=i1%>,false);">Approved Bill</a>
			</td>
		</tr>
	  	<tr>
						<td>
							<a href="javascript:toggleDetails(<%=i1%>,false);">Close</a>
						</td>
					</tr>
	  	</table>
	  	</div>	
	  	</td>
	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=AccNo %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=OneTimeCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MonthlyCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=UsageCharge %></div>
	  	</td>	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MessagingCharges %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=ValueASCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=RoamingCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MiscCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Discounts %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Tax %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Total %></div>
	  	</td>
	  	  	
	  	
	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=OneTimeCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MonthlyCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=UsageCharge1 %></div>
	  	</td>	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MessagingCharges1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=ValueASCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=RoamingCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MiscCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Discounts1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Tax1 %></div>
	  	</td>
<!--	  	<td align="right">			
			<div align="right" style="overflow: auto;">< %=Total1 %></div>
	  	</td> -->
	  	<td align="right">			
			<div align="right"><%=twamt1 %>  </div>
	  	</td>
	  	<td align="right">			
			<div align="left" style="overflow: auto; width: 100px;"><%=reason1 %></div>
	  	</td>	  	
	  	
	  	
	  	
	  	
	  	
	  	
	  	
	</tr> 
	
 <%
 
i1++;
} %>	

	 <%
  //// calculate next record start record  and end record 
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
            iStartResultNo=(iPageNo+1);
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

%>
</table><br>

</div>
</form>
<table  style="background: #E8EEF7;width:1000px ">
		<tr>
		<td colspan="3" align ="left"><a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit">First Page</a></td>
   <td colspan="3" align ="center">
<div>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit&iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit&iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit&iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit&iPageNo=<%=i%>&cPageNo=<%=i%>"> Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Records  <%=iTotalRows%> </b>
</div>
</td>
  <td colspan="3" align ="right"><a href="ServiceProviderMonthlyReport.jsp?mnth=<%=month%>&yr=<%=year%>&serPro=<%=serviceProvider%>&Submit=Submit&iPageNo=<%=iTotalPages%>">Last Page</a></td> 
   </tr>
		
		</table>

</div>		


</ul>


</div>






</div>
</div>
</div>
</div>
</div>
</div>

</body>
<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>
<%
    try{
         if(psPagination!=null){
             psPagination.close();
         }
         if(rsPagination!=null){
             rsPagination.close();
         }
         
         if(psRowCnt!=null){
             psRowCnt.close();
         }
         if(rsRowCnt!=null){
             rsRowCnt.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>