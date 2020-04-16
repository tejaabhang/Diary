<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp" %>		
	 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;}</style>
<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">
function calculate()
{

try{
	//var onetimechrg = document.editamt.OneTimeCharge.value;
	

validate7();

	                                
 //alert("inside calcultae function>>>>");
 var onetimechrg = document.getElementById("OneTimeCharge").value;
 var MonthlyCharge = document.getElementById("MonthlyCharge").value;
 var CallCharges = document.getElementById("CallCharges").value;
 var MobileInternet = document.getElementById("MobileInternet").value;
 var VAS = document.getElementById("VAS").value;
 var RoamingCharge = document.getElementById("RoamingCharge").value;
 var MiscCharge = document.getElementById("MiscCharge").value;
 var Discount = document.getElementById("Discount").value;
var total=0.0;
tax=document.getElementById("Tax").value;
total=document.getElementById("TotalAmount").value;


// alert("onetimechrg==>"+onetimechrg+"MonthlyCharge==>"+MonthlyCharge+"CallCharges==>"+CallCharges+"MobileInternet==>"+MobileInternet+"VAS==>"+VAS+"RoamingCharge==>"+RoamingCharge+"MiscCharge==>"+MiscCharge+"Discount==>"+Discount);

 onetimechrg++;

 onetimechrg--;

 MonthlyCharge++;
 MonthlyCharge--;
 CallCharges++;
 CallCharges--;
 MobileInternet++;
 MobileInternet--;
 VAS++;
 VAS--;
 RoamingCharge++;
 RoamingCharge--;
 MiscCharge++;
 MiscCharge--;


 
 Discount++;
 Discount--;


 //alert("tax==>"+tax);
 //alert("onetimechrg==>"+onetimechrg);
 //alert("Discount==>"+Discount);

 
 tax=((onetimechrg+Discount+MonthlyCharge+CallCharges+MobileInternet+VAS+RoamingCharge+MiscCharge) * 12.36 ) /100;


 //alert("tax=11111=>"+tax);
//tax=tax.toFixed(2);
//alert("onetimechrg==>"+onetimechrg+"MonthlyCharge==>"+MonthlyCharge+"CallCharges==>"+CallCharges+"MobileInternet==>"+MobileInternet+"VAS==>"+VAS+"RoamingCharge==>"+RoamingCharge+"MiscCharge==>"+MiscCharge+"Discount==>"+Discount+"tax=>>"+tax);

//tax="02.79";
//total=onetimechrg+tax;
total=onetimechrg+MonthlyCharge+CallCharges+MobileInternet+VAS+RoamingCharge+MiscCharge+Discount+tax;



//+MobileInternet+VAS+RoamingCharge+MiscCharge+Discount+tax;

//alert("total amount==>"+total);
tax=tax.toFixed(2);
total=total.toFixed(2);


//alert("total tax=final=>"+tax);

document.getElementById("Tax").value=tax;
document.getElementById("TotalAmount").value=total;
 
 //alert("tax=fianlllllll=1111>"+tax);


}catch(e)
{
alert(e);
}

	
	
}

function validate()
{

	var onetimechrg = document.getElementById("OneTimeCharge").value;
	var MonthlyCharge = document.getElementById("MonthlyCharge").value;
	 var CallCharges = document.getElementById("CallCharges").value;
	 var MobileInternet = document.getElementById("MobileInternet").value;
	 var VAS = document.getElementById("VAS").value;
	 var RoamingCharge = document.getElementById("RoamingCharge").value;
	 var MiscCharge = document.getElementById("MiscCharge").value;
	 var Discount = document.getElementById("Discount").value;
	 var comment1 = document.getElementById("comment1").value;


	 
	//alert("inside valide function");
var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
	//alert("onetimechrg==>"+onetimechrg+"MonthlyCharge==>"+MonthlyCharge+"CallCharges==>"+CallCharges+"MobileInternet==>"+MobileInternet+"VAS==>"+VAS+"RoamingCharge==>"+RoamingCharge+"MiscCharge==>"+MiscCharge+"Discount==>"+Discount);

	
	if((isNaN(onetimechrg)))
	{

		alert ("Please enter only Numeric values");
	  	return false;

	}
	if(onetimechrg.trim().length==0)
		
	{

		alert ("Space can not be entered as a value");
	  	return false;

	}


	for (var i = 0; i < onetimechrg.length; i++) 
	{
			if (iChars.indexOf(onetimechrg.charAt(i)) != -1) 
		{
		  	//alert ("Special Characters are not allowed");
		  	return false;
			}
		}

	
	
}
function validate1()
{
	var MonthlyCharge = document.getElementById("MonthlyCharge").value;

	if( (isNaN(MonthlyCharge)) )
	{

		alert ("Please enter only Numeric values");
	  	return false;

	}


	if(MonthlyCharge.trim().length==0)
		
	{

		alert ("Space can not be entered as a value");
	  	return false;

	}
	
}
function validate2()
{

	 var CallCharges = document.getElementById("CallCharges").value;

	 if((isNaN(CallCharges)))
		{

			alert ("Please enter only Numeric values");
		  	return false;

		}



	 if(CallCharges.trim().length==0 )
			
	 {

	 	alert ("Space can not be entered as a value");
	   	return false;

	 }
	
	
}
function validate3()
{
	 var MobileInternet = document.getElementById("MobileInternet").value;

	 if((isNaN(MobileInternet)))
		{

			alert ("Please enter only Numeric values");
		  	return false;

		}

		 if(MobileInternet.trim().length==0 )
			
	 {

	 	alert ("Space can not be entered as a value");
	   	return false;

	 }
}
function validate4()
{
	 var VAS = document.getElementById("VAS").value;


	 if((isNaN(VAS)))
		{

			alert ("Please enter only Numeric values");
		  	return false;

		}


		 if(VAS.trim().length==0 )
			
	 {

	 	alert ("Space can not be entered as a value");
	   	return false;

	 }
	
}
function validate5()
{
	 var RoamingCharge = document.getElementById("RoamingCharge").value;


	 if((isNaN(RoamingCharge)))
		{

			alert ("Please enter only Numeric values");
		  	return false;

		}

	 if(RoamingCharge.trim().length==0 )
			
	 {

	 	alert ("Space can not be entered as a value");
	   	return false;

	 }
	
}

function validate6()
{
	 var MiscCharge = document.getElementById("MiscCharge").value;


	 if((isNaN(MiscCharge)))
		{

			alert ("Please enter only Numeric values");
		  	return false;

		}


		 if(MiscCharge.trim().length==0)
			
	 {

	 	alert ("Space can not be entered as a value");
	   	return false;

	 }
}
function validate7()
{

	var Discount = document.getElementById("Discount").value;
	var onetimechrg = document.getElementById("OneTimeCharge").value;
	var MonthlyCharge = document.getElementById("MonthlyCharge").value;
	 var CallCharges = document.getElementById("CallCharges").value;
	 var MobileInternet = document.getElementById("MobileInternet").value;
	 var VAS = document.getElementById("VAS").value;
	 var RoamingCharge = document.getElementById("RoamingCharge").value;
	 var MiscCharge = document.getElementById("MiscCharge").value;


	 if((isNaN(Discount)))
		{

			alert ("Please enter only Numeric values for Discount field");
		  	return false;

		}
	 if(Discount.trim().length==0 ||  onetimechrg.trim().length==0 || MonthlyCharge.trim().length==0 ||  CallCharges.trim().length==0 ||  MobileInternet.trim().length==0 ||  VAS.trim().length==0 ||  RoamingCharge.trim().length==0 ||  MiscCharge.trim().length==0 )
		{

			alert ("Space can not be entered as a value ");
		  	return false;

		}

	if(Discount.trim().length==0)
		
	{

		alert ("Space can not be entered as a value for Discount Field");
	  	return false;

	}

	if((isNaN(onetimechrg)) )
	{

		alert ("Please enter only Numeric values for onetimechrg field");
	  	return false;

	}

	if((isNaN(MonthlyCharge)))
	{

		alert ("Please enter only Numeric values for MonthlyCharge field");
	  	return false;

	}
	if((isNaN(CallCharges)))
	{

		alert ("Please enter only Numeric values for CallCharges field");
	  	return false;

	}
	if((isNaN(MobileInternet)))
	{

		alert ("Please enter only Numeric values for MobileInternet field");
	  	return false;

	}
	if((isNaN(VAS)) || (isNaN(MiscCharge)) || (isNaN(RoamingCharge)) )
	{

		alert ("Please enter only Numeric values for VAS field");
	  	return false;

	}
	if((isNaN(MiscCharge)))
	{

		alert ("Please enter only Numeric values for MiscCharge field");
	  	return false;

	}
	if((isNaN(MiscCharge)) || (isNaN(RoamingCharge)) )
	{

		alert ("Please enter only Numeric values for MiscCharge field");
	  	return false;

	}
	
}



function validateForm() 
{	
	var name = document.editamt.reason1.value;



	//alert("name====>"+name);
	if(name=="") {
		alert("Enter the reason for update!!!");
		return false;
		}
return 0;
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
<%!
Connection conn;
%>
<%

String MiscCharge1="",UsageCharge1="",MessagingCharges1="";
String mno=request.getParameter("mno");
String totalAmt=request.getParameter("total");
String payableAmt=request.getParameter("TWAmt");
String accNo=request.getParameter("accNo");
String sp=request.getParameter("sp");
String thedate=request.getParameter("thedate");
String OneTimeCharge=request.getParameter("OneTimeCharge");
String MonthlyCharge=request.getParameter("MonthlyCharge");
String ValueASCharge=request.getParameter("ValueASCharge");
String RoamingCharge=request.getParameter("RoamingCharge");
String Discounts=request.getParameter("Discounts");
String Tax=request.getParameter("Tax");
String MiscCharge=request.getParameter("MiscCharge");
String UsageCharge=request.getParameter("UsageCharge");
String MessagingCharges=request.getParameter("MessagingCharges");
String reason1 =request.getParameter("reason1");

String month =request.getParameter("month");
String year =request.getParameter("year");
String serviceProvider =request.getParameter("serviceProvider");



String OneTimeCharge1=request.getParameter("OneTimeCharge1");
String MonthlyCharge1=request.getParameter("MonthlyCharge1");
String ValueASCharge1=request.getParameter("ValueASCharge1");
String RoamingCharge1=request.getParameter("RoamingCharge1");
String Discounts1=request.getParameter("Discounts1");
String Tax1=request.getParameter("Tax1");
//String reason1 =request.getParameter("reason1");
String twamt1 =request.getParameter("twamt1");

 MiscCharge1=request.getParameter("MiscCharge1");
 UsageCharge1=request.getParameter("UsageCharge1");
 MessagingCharges1=request.getParameter("MessagingCharges1");


   

System.out.println("======year==>"+year);
System.out.println("======month==>"+month);
System.out.println("======serviceProvider==>"+serviceProvider);
System.out.println("======reason==>"+reason1);

 

%>
<%
System.out.println("The mobile number is :"+mno);
System.out.println("The accont no is :"+accNo);
System.out.println("The Total amount is :"+totalAmt);
System.out.println("The Payable amount is :"+payableAmt);
System.out.println("The service provider is  :"+sp);
System.out.println("The date is  :"+thedate);

%>
<%
System.out.println("======service Provider report 2========");


String Msg = request.getParameter("Msg");

System.out.println("======Message====in srviceprovidermonthlyrepor2 page ===="+Msg);

if(Msg!=null && Msg.equalsIgnoreCase("1"))
{System.out.println("======control inside if loop====");
	%>
		<script>
		alert("Records Saved Successfully")
		</script>
	<%
}




if(Msg!=null && Msg.equalsIgnoreCase("1"))
{System.out.println("======control inside if loop====");
	%>
		<script>
		opener.Reload();
		window.close();
		</script>
	<%
}

%>

<form id="editamt"  name="editamt" class="appnitro" enctype="multipart/form-data" action="serviceProviderMonthlyReport3.jsp" method="get" onsubmit="return validateForm();">
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
<!--		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>-->
<!--		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2.0em;"><div style="text-align: center;"><a><font style="font-size: 1.0em;">Cellular Company Billing</font></a></div></td>-->
<!--		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>-->
		</table></h1>
	
	<div align="center" style="width:750px; ">
		<table border="0" width="600px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Cellular Company Billing</font></td></tr>
			</table>
		</td>
	</tr>
	</table>
		<br />

								
  <ul >
	
	<table border="1" width="" align="center" CELLPADDING=10 style="background: #f8fcff;width:500px " class=mytable>
	
	<tr>
	  <td style="text-align: left"><font size="2">Mobile No </font></td>
	  <td ><font size="2"><%=mno%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Account No </font></td>
	  <td ><font size="2"><%=accNo%></font></td>
	</tr>		
	
	<tr>
	  <td style="text-align: left"><font size="2">One Time Charge </font></td>
	 <td ><font size="2"><%=OneTimeCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Monthly Charge </font></td>
	 <td ><font size="2"><%=MonthlyCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Call Charges </font></td>
	 <td ><font size="2"><%=UsageCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Mobile Internet </font></td>
	 <td ><font size="2"><%=MessagingCharges%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">VAS </font></td>
	 <td ><font size="2"><%=ValueASCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Roaming Charge </font></td>
	 <td ><font size="2"><%=RoamingCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Misc Charge </font></td>
	 <td ><font size="2"><%=MiscCharge%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Discount </font></td>
	 <td ><font size="2"><%=Discounts%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2"> 	Tax </font></td>
	 <td ><font size="2"><%=Tax%></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Total Amount </font></td>
	 <td ><font size="2"><%=totalAmt%></font></td>
	</tr>
	
	<tr>
	  <td style="text-align: left"><font size="2"> 	Payable Amt </font></td>
	 <td ><font size="2"><%=payableAmt%></font></td>
	</tr>
		
	
	
<!--	<tr>
	  <td style="text-align: left"><font size="2">Payable Amount </font></td>
	  <td ><font size="2"><input type="text" id="payableAmt" name="payableAmt" value="< %=payableAmt%>" style="width: 50%;background: white;"></input></font></td>
	</tr> -->
	
<!--	<tr>-->
<!--	  <td style="text-align: left"><font size="2">Previous Reason </font></td>-->
<!--	  <td ><div><font size="2">-->
<!--			<textarea name ="reason" id = "reason"  class="element textarea small"  value="< %=reason%> style="width:300px;"></textarea>-->
<!--		 </font></div></td>-->
<!--	-->
<!--	</tr>-->
	
	
	
	
	<tr>
	  <td style="text-align: left"><font size="2">One Time Charge </font></td>
	 <td ><font size="2"><input type="text" id="OneTimeCharge" name="OneTimeCharge" align="right" value="<%=OneTimeCharge1%>" style="width: 30%;background: white;" onchange="validate();" ></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Monthly Charge </font></td>
	 <td ><font size="2"><input type="text" id="MonthlyCharge" name="MonthlyCharge" value="<%=MonthlyCharge1%>" style="width: 30%;background: white;" onchange="validate1();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Call Charges </font></td>
	 <td ><font size="2"><input type="text" id="CallCharges" name="CallCharges" value="<%=UsageCharge1%>" style="width: 30%;background: white;" onchange="validate2();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Mobile Internet </font></td>
	 <td ><font size="2"> <input type="text" id="MobileInternet" name="MobileInternet" value="<%=MessagingCharges1%>" style="width: 30%;background: white;" onchange="validate3();"> </font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">VAS </font></td>
	 <td ><font size="2"> <input type="text" id="VAS" name="VAS" value="<%=ValueASCharge1%>" style="width: 30%;background: white;" onchange="validate4();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Roaming Charge </font></td>
	 <td ><font size="2"> <input type="text" id="RoamingCharge" name="RoamingCharge" value="<%=RoamingCharge1%>" style="width: 30%;background: white;" onchange="validate5();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Misc Charge </font></td>
	 <td ><font size="2"> <input type="text" id="MiscCharge" name="MiscCharge" value="<%=MiscCharge1%>" style="width: 30%;background: white;" onchange="validate6();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2">Discount </font></td>
	 <td ><font size="2"> <input type="text" id="Discount" name="Discount" value="<%=Discounts1%>" style="width: 30%;background: white;" onchange="validate7();"></font></td>
	</tr>
	<tr>
	  <td style="text-align: left"><font size="2"> 	Tax </font></td>
	 <td ><font size="2"> <input type="text" id="Tax" name="Tax" value="<%=Tax1%>" style="width: 30%;background: white;" readonly="readonly"></font></td>
	</tr>
	
		
	<tr>
	  <td style="text-align: left"><font size="2">Reason </font></td>
	  <td ><div><font size="2">
			<textarea name ="reason1" id = "reason1"       class="element textarea small" style="width: 300px;v"  > <%=reason1 %></textarea>
		 </font></div></td>
	
	</tr>
	
<!--	<tr>
	  <td style="text-align: left"><font size="2">Total Amount </font></td>
	 <td ><font size="2"> <input type="text" id="TotalAmount" name="TotalAmount1" value="" style="width: 30%;background: white;" readonly="readonly"></font></td>
	</tr> -->
	
	<tr>
	  <td style="text-align: left"><font size="2"> 	Payable Amt </font></td>
	 <td  align=""><font size="2"><input type="text" id="TotalAmount" name="PayableAmt1" value="<%=twamt1%>" style="width: 30%;background: white;align:right" onclick="calculate();" readonly="readonly" ></font></td>
	</tr>
	
	
	
		<input type="hidden" id="mno" name="mno" value="<%=mno%>"></input>
		<input type="hidden" id="accno" name="accno" value="<%=accNo%>"></input>
		<input type="hidden" id="totalID" name="totalID" value="<%=mno%>"></input>
		<input type="hidden" id="sp" name="sp" value="<%=sp%>"></input>
		<input type="hidden" id="thedate" name="thedate" value="<%=thedate%>"></input>
<!--		<input type="hidden" id="PayableAmt" name="PayableAmt" value="< %=thedate%>"></input>-->
		
	<tr><td></td><td align="left"><input type="submit" name="sersubmit" id ="sersubmit" value="Submit"></input></td>
	</tr>

</table>
</div>



</ul>

</form>
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