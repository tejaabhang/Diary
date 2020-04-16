<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.MobileDeactivationReport"
	import="com.transworld.diary.framework.UnitDetailsDao"%>

<jsp:useBean id="unitDetailsDao"
	type="com.transworld.diary.framework.UnitDetailsDao"
	scope="application"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">
		function validate()
		{
			if(document.techattendrep.reptype[0].checked==true)
			{
				var tech=document.techattendrep.tech.value;
				if(tech=="Select")
				{
					alert("Please select Technician from the list");
					return false;
				}	
			}
				
			return datevalidate();
		}

	function datevalidate()
	{
		if(document.techattendrep.reptype[0].checked==true)
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

			if(document.techattendrep.reptype[1].checked==true)
			{
				var date1=document.getElementById("calender2").value;
		
				var dm1,dd1,dy1,dm2,dd2,dy2;
				
				dy1=date1.substring(0,4);
				dm1=date1.substring(5,7);
				dd1=date1.substring(8,10);
				
			
				var date=new Date();
				var month=date.getMonth()+1;
				var day=date.getDate();
				var year=date.getFullYear();
				
				if(dy1>year)
				{
					alert("Selected date should not be greater than Todays date (Year)");
					//document.getElementById("calender").value="";
					//document.getElementById("calender1").value="";
					//document.getElementById("calender").focus;
			
					return false;
				
				}
				else if(year==dy1) 
				{
					if(dm1>month)
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
					if(dd1>day)
					{
						alert("Selected date should not be greater than Todays date (Day)");	
						//document.getElementById("calender").value="";
						//document.getElementById("calender1").value="";
						//document.getElementById("calender").focus;
				
						return false;
				
					}
				}
					
				return true;		
			}
		
			if(document.techattendrep.reptype[2].checked==true)
			{
				var date1=document.getElementById("frmdte").value;
				var date2=document.getElementById("todte").value;
		
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
		}
		
		function selectAll()
		{
			var cntr=document.techattendrep1.cntr.value;
			cntr=cntr-1;
		
			if(document.techattendrep1.maincb.checked==true)
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
<%@ include file="header1.jsp"%></div>
<div id="gbox1">
<div id="gbox-top1"></div>
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------>

<form name="techattendrep" method="get" action=""
	onSubmit="return validate();">
<%
final String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
final String fromDateRequest=request.getParameter("fromDate");
final String toDateRequest=request.getParameter("toDate");
final String fromDate= (null==fromDateRequest) ? today : fromDateRequest;
final String toDate=(null==toDateRequest) ? today : toDateRequest;
int numRecords = 0;
List<MobileDeactivationReport> mobileDeactivationReport=null;
try{
	mobileDeactivationReport = unitDetailsDao.getMobileDeactivationReport(fromDate,toDate);      	
   	numRecords = mobileDeactivationReport.size();	 
} catch(Exception e){
	e.printStackTrace();
}
%>
<table border="0" width="750px">
	<tr id="mnthlyalltechrepopts">
		<td><font color="maroon">From Date: </font> 
			<input type="text"id="fromDate" name="fromDate" size="13" class="formElement" value="<%=fromDate%>" readonly class="formElement" /> 
			<input type="button" name="trigger22" id="trigger22" value="From Date" class="formElement" /> 
			<script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "fromDate",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger22"       // ID of the button
		               }
		                             );
	       </script> &nbsp;&nbsp;&nbsp;&nbsp; 
	       <input type="text" id="toDate" name="toDate" size="13" class="formElement" value="<%=toDate%>" readonly class="formElement" /> 
		   <input type="button" name="trigger3" id="trigger3" value="To Date" class="formElement" /> 
				<script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "toDate",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger3"       // ID of the button
		               }
		                             );
	            </script> &nbsp;&nbsp;&nbsp;&nbsp; 
	      <input type="submit" name="submit" value="Submit" class="formElement" />
      </td>
	</tr>
</table>
</form>

<table border="0" width="750px">
	<tr>
		<td align="center"><font color="maroon" size="2"> <B>
		Mobile Deactivation Report from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate))%>
		to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(toDate))%></B>
		</font></td>
	</tr>
</table>
<table class="sortable">
	<tr>
		<td><div align="center"><B> Sr.No</B></div></td>
		<td><div align="center"><B> Mobile No</B></div></td>
		<td><div align="center"><B> Deactivation Date</B></div></td>
		<td><div align="center"><B> Reason</B></div></td>
		<td><div align="center"><B> Service Provider</B></div></td>
		<td><div align="center"><B> Entered By</B></div></td>
		<td><div align="center"><B> Send Mail</B></div></td>
		<td><div align="center"><B> Mail Send To</B></div></td>

	</tr>
<%
for (int counter = 0; counter < numRecords; counter++) 
	{
		final MobileDeactivationReport currentRecord = mobileDeactivationReport.get(counter);
		int i = counter+1;
%>
	
	<tr>
		<td><%=i%></td>
		<td><%=currentRecord.getMobileNumber()%></td>
		<td><%=currentRecord.getDeactivationDate()%></td>
		<td><%=currentRecord.getReason()%></td>
		<td><%=currentRecord.getServiceProvider()%></td>
		<td><%=currentRecord.getEnteredBy()%></td>
		<td><%=currentRecord.getSendMail()%></td>
		<td><%=currentRecord.getMailSendTo()%></td>

	</tr>
	<%
	}
	%>
</table>

<!-- code end here --->

<table width="750px" height="350px" border="0">
	<tr>
		<td></td>
	</tr>
</table>
</div>
</div>

<div id="gbox-bot1"></div>
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

