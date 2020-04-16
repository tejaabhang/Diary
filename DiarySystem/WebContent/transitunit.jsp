<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.InTransitUnitsForFromField"
		import="com.transworld.diary.framework.UnitDetailsDao"
		import="com.transworld.diary.framework.InTransitUnitsForFromTransworld"
%>
	
<%! 
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>	
		
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>

<%@page import="com.transworld.diary.framework.InTransitUnitsForFromTransworld"%><html>
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
	<script language="JavaScript">
	
function fun2()
{
	document.form1.submit();
}
	
	function ShowHide(id)
		{
			if(id==0)
			{
				document.getElementById("fromFieldOption").style.display="";
				document.getElementById("fromTransworldOption").style.display='none';
			}
			else if(id==1)
			{
				document.getElementById("fromFieldOption").style.display='none';
				document.getElementById("fromTransworldOption").style.display="";
			}
			else
			{
				document.getElementById("fromFieldOption").style.display="";
				document.getElementById("fromTransworldOption").style.display='none';
			}
		}
	function datevalidate()
	{
		if(document.form1.dataFilter[0].checked==true)
		{
			var date1=document.getElementById("fromDateForFromField").value;
			var date2=document.getElementById("toDateForFromField").value;
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
				return false;
			}
			else if(year==dy1 && year==dy2) 
			{
				if(dm1>month || dm2>month)
				{
					alert("Selected date should not be greater than Todays date (Month)");
					return false;
				}
			}

			if(dm1==month)
			{
				if(dd1>day || dd2>day)
				{
					alert("Selected date should not be greater than Todays date (Day)");	
					return false;
				}
			}

			if(dy1>dy2)
			{
					alert("From date year should not be greater than To date year");
					return false;
			}
			else if(year==dy1 && year==dy2) 
			{
				if(dm1>dm2)
				{
					alert("From date month should not be greater than To date month");
					return false;
				}
			}
	
			if(dm1==dm2)
			{
				if(dd1 > dd2)
				{
					alert("From date should not be greater than To date");
					return false;
				}
			}
			return true;		
		 }

		if(document.form1.dataFilter[1].checked==true)
		{
			var date1=document.getElementById("fromDateForFromTransworld").value;
			var date2=document.getElementById("toDateForFromTransworld").value;
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
				return false;
			}
			else if(year==dy1 && year==dy2) 
			{
				if(dm1>month || dm2>month)
				{
					alert("Selected date should not be greater than Todays date (Month)");
					return false;
				}
			}

			if(dm1==month)
			{
				if(dd1>day || dd2>day)
				{
					alert("Selected date should not be greater than Todays date (Day)");	
					return false;
				}
			}

			if(dy1>dy2)
			{
				alert("From date year should not be greater than To date year");
				return false;
			}
			else if(year==dy1 && year==dy2) 
			{
				if(dm1>dm2)
				{
					return false;
				}
			}
	
			if(dm1==dm2)
	 		{
				if(dd1 > dd2)
				{
					alert("From date should not be greater than To date");
					return false;
				}
			}
			return true;		
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
<%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
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
<!--- code start here ------>
<%
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	final String today = formatter.format(defoultdate);
	long miliseconds=defoultdate.getTime() - 7000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	final String olddate=formatter.format(defoultdate);
	final String FROMFIELD="fromfield";
	final String FROMTRANSWORLD="fromtransworld";
	final String dataFilterRequest=request.getParameter("dataFilter");
	final String option = (null == dataFilterRequest) ? FROMFIELD : dataFilterRequest;
	final String fromDateForFromFieldRequest=request.getParameter("fromDateForFromField");
	final String toDateForFromFieldRequest=request.getParameter("toDateForFromField");
	final String fromDateForFromField = (fromDateForFromFieldRequest == null) ? "" : fromDateForFromFieldRequest.toString();
	final String toDateForFromField = (toDateForFromFieldRequest == null) ? "" : toDateForFromFieldRequest.toString();
	final String fromDateForFromTransworldRequest=request.getParameter("fromDateForFromTransworld");
	final String toDateForFromTransworldRequest=request.getParameter("toDateForFromTransworld");
	final String fromDateForFromTransworld = (fromDateForFromTransworldRequest == null) ? olddate : fromDateForFromTransworldRequest.toString();
	final String toDateForFromTransworld = (toDateForFromTransworldRequest == null) ? today : toDateForFromTransworldRequest.toString();
	int numberOfInTransitFromField = 0;
	int numberOfInTransitFromTransworld = 0;
	List<InTransitUnitsForFromField> inTransitUnitsForFromField= null;
	List<InTransitUnitsForFromTransworld> inTransitUnitsForFromTransworld = null;
    try{
    	if(FROMFIELD.equalsIgnoreCase(option)){
    		inTransitUnitsForFromField = unitDetailsDao.getInTransitUnitsForFromField( 
    			fromDateForFromField, toDateForFromField);    		
    		numberOfInTransitFromField = inTransitUnitsForFromField.size();
    	} else if(FROMTRANSWORLD.equalsIgnoreCase(option)) {
    		inTransitUnitsForFromTransworld = unitDetailsDao.getInTransitUnitsForFromTransworld(
    				fromDateForFromTransworld, toDateForFromTransworld);
    		numberOfInTransitFromTransworld = inTransitUnitsForFromTransworld.size();
    	} 
	} catch(Exception e){
		e.printStackTrace();
	}
%>
	<form name="form1" id="form1" method="get" onSubmit="return datevalidate();">	
	<table border="0" width="750px" >
		<tr><td align="center"><font color="brown" size="3">IN TRANSIT UNITS REPORT. </font></td></tr>
		
		<tr>
			<td><div align="left">
				
					<input type="radio" name="dataFilter" value="fromfield" <%if(option.equals("fromfield")){out.print("CHECKED");} %> onClick="ShowHide(0);">Dispatch From Field
					<input type="radio" name="dataFilter" value="fromtransworld" <% if(option.equals("fromtransworld")){ out.print("CHECKED");} %> onClick="ShowHide(1);">Dispatch From Transwold
		 	</div></td>	
		 </tr>
		 <tr id="fromFieldOption">
		 	<td>
		 			<input type="text" id="fromDateForFromField" name="fromDateForFromField" size="13" class="formElement" value="<%=fromDateForFromField%>" readonly/>
	            	<input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
		             	<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "fromDateForFromField",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger"       // ID of the button
				             }
				                           );
		           		</script>
					<input type="text" id="toDateForFromField" name="toDateForFromField" size="13" class="formElement" value="<%=toDateForFromField%>" readonly/>
	           	    <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
			             <script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "toDateForFromField",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger1"       // ID of the button
				             }
				                           );
			             </script>
			             <input type="submit" name="Submit" value="Submit" class="formElement">
			 	</td>
		</tr>
		<tr id="fromTransworldOption" style="display:none">		
			<td>
			         <input type="text" id="fromDateForFromTransworld" name="fromDateForFromTransworld" size="13" class="formElement" value="<%=fromDateForFromTransworld%>" readonly/>
	            	 <input type="button" name="trigger2" id="trigger2" value="From Date" class="formElement">
		             	<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "fromDateForFromTransworld",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger2"       // ID of the button
				             }
				                           );
		           		</script>
					<input type="text" id="toDateForFromTransworld" name="toDateForFromTransworld" size="13" class="formElement" value="<%=toDateForFromTransworld%>" readonly/>
	           	    <input type="button" name="trigger3" id="trigger3" value="To Date" class="formElement">
			             <script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "toDateForFromTransworld",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger3"       // ID of the button
				             }
				                           );
			             </script>
           			<input type="submit" name="Submit" value="Submit" class="formElement">
			</td>
		</tr>
	</table>
	</form>
	<table class="sortable">
<%
		if(FROMFIELD.equalsIgnoreCase(option))
		{
			////System.out.println("fromfield");
%>
			<tr>
				<td><b><font color="red">Sr. No</font></b></td>
				<td><b><font color="red">Unit ID</font></b></td>
				<td><b><font color="red">Unit Type</font></b></td>
				<td><b><font color="red">Transporter</font></b></td>
				<td><b><font color="red">Sent Date</font></b></td>
				<td><b><font color="red">Technician Name</font></b></td>
				<td><b><font color="red">Courier Name</font></b></td>
				<td><b><font color="red">Courier Docket No</font></b></td>
				<td><b><font color="red">Location</font></b></td>
				<td><b><font color="red">Status of Unit</font></b></td>
				<td><b><font color="red">DC NO</font></b></td>
				<td><b><font color="red">Comment</font></b></td>
				<td><b><font color="red">EntBy</font></b></td>
			</tr>
<%
			for (int counter = 0; counter < numberOfInTransitFromField; counter++) 
			{
				final InTransitUnitsForFromField currentRecord = inTransitUnitsForFromField.get(counter);
				int i = counter+1;
			//	//System.out.println(i);
			//	//System.out.println(currentRecord.getUnitType());
%>	
			<tr>
				<td><%=i %></td>
				<td><%=currentRecord.getUnitId()%></td>
				<td><%=currentRecord.getUnitType()%></td>
				<td><%=currentRecord.getTransporter()%></td>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(currentRecord.getSentDate()))%></td>
				<td><%=currentRecord.getTechnicianName()%></td>
				<td><%=currentRecord.getCourier()%></td>
				<td><%=currentRecord.getCourierDocketNo()%></td>
				<td><%=currentRecord.getLocation()%></td>
				<td><%=currentRecord.getStatusOfUnit()%></td>
				<td><%=currentRecord.getDcNo()%></td>
				<td><%=currentRecord.getComment()%></td>
				<td><%=currentRecord.getEnteredBy()%></td>
			</tr>
<%
			}	
		}
		else if(FROMTRANSWORLD.equalsIgnoreCase(option))
		{
%>
			<tr>
				<td><font color="black"> Sr.</font></td>
				<td><font color="black"> Date</font></td>
				<td><font color="black">Order No</font></td>
				<td><font color="black">ChalanNo</font></td>
				<td><font color="black">Dispatch To</font></td>
	            <td><font color="black"> Unit ID</font></td>
				<td><font color="black"> InstallationType</font></td>
				<td><font color="black"> Peripherals</font></td>
				<td><font color="black"> Customer Name</font></td>
				<td><font color="black"> Customer Location</font></td>
				<td><font color="black"> Name/Courier No</font></td>
				<td><font color="black"> Courier Date</font></td>
				<td><font color="black"> EntBy</font></td>
			</tr>
	<%
			for (int counter = 0; counter < numberOfInTransitFromTransworld; counter++) 
			{
				final InTransitUnitsForFromTransworld currentRecord = inTransitUnitsForFromTransworld.get(counter);
				int i = counter+1;
%>		
			<tr>
				<td><font color="black"><%=i %></font></td>
				<td><font color="Red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(currentRecord.getDispachDate()))%></font></td>
				<td><div align="left"><font color="black"><%=currentRecord.getOrderNumber()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getChalanNo()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getTechnician()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getUnitId()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getUnitType()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getPeripherals()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getCustomer()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getCustomerAddress()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getDisplayName()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getCourierDate()%></font></div></td>
				<td><div align="left"><font color="black"><%=currentRecord.getEnteredBy()%></font></div></td>
			</tr>
<%
				}
		}
%>
	
		
</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
<table border="1" width="100%" align="center">
	<tr>
		<td bgcolor="#98AFC7" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</body>
</html>
