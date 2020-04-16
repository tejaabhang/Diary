<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ include file="header.jsp" %>
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
<%@ include file="headertech.jsp" %>
    		 </div> 
			<div id="gbox1">
 	       <div id="gbox-top1"> </div>
      	  <div id="gbox-bg1">
          <div id="gbox-grd1">
<!--- code start here ------>
<%!
Connection con1=null;
%>
<%
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);	
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();
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
	System.out.println("fromDateForFromField==>"+fromDateForFromFieldRequest);
	final String toDateForFromFieldRequest=request.getParameter("toDateForFromField");
	System.out.println("fromDateForFromField==>"+toDateForFromFieldRequest);
	final String fromDateForFromField = (fromDateForFromFieldRequest == null) ? olddate : fromDateForFromFieldRequest.toString();
	System.out.println("fromDateForFromField==>"+fromDateForFromField);
	final String toDateForFromField = (toDateForFromFieldRequest == null) ? today : toDateForFromFieldRequest.toString();
	System.out.println("toDateForFromField==>"+toDateForFromField);
	final String fromDateForFromTransworldRequest=request.getParameter("fromDateForFromTransworld");
	final String toDateForFromTransworldRequest=request.getParameter("toDateForFromTransworld");
	final String fromDateForFromTransworld = (fromDateForFromTransworldRequest == null) ? olddate : fromDateForFromTransworldRequest.toString();
	final String toDateForFromTransworld = (toDateForFromTransworldRequest == null) ? today : toDateForFromTransworldRequest.toString();
	int numberOfInTransitFromField = 0;
	int numberOfInTransitFromTransworld = 0;

    
%>
	<form name="form1" id="form1" method="get" onSubmit="return datevalidate();">	
	<table border="0" width="750px"  align="center"  bgcolor="#A9D0F5">
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
	<br></br>
	<table class="sortable">
<%
		if(FROMFIELD.equalsIgnoreCase(option))
		{
			//System.out.println("fromfield");
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
			
			//	System.out.println(i);
			//	System.out.println(currentRecord.getUnitType());
			String sql="SELECT"+            
			"	a.UnitID,b.InstType,a.Transporter,a.Rdate,a.TechName,"+
			"	a.Courier,a.CourierDCNo,a.Location,a.Utype,"+
			"	a.DC_NO,a.Comment,a.EntBy"+               
			" FROM"+            
			"   db_CustomerComplaints.t_unitreceived a"+
			"   INNER JOIN db_gps.t_unitmaster b ON(a.UnitID=b.UnitID"+ 
			"		and a.InTransit='Yes' and TechName='"+session.getAttribute("username").toString()+"' AND Rdate>='"+
			fromDateForFromField+ "' AND Rdate<='"+
			toDateForFromField+    
			"') group by b.UnitID ORDER BY Rdate DESC";
			System.out.println("from field intransit-->"+sql);
			ResultSet rs=stmt1.executeQuery(sql);
		
			int i=1;
			while(rs.next()){
%>	
			<tr>
				<td><%=i %></td>
				<td><%=rs.getString("UnitID")%></td>
				<td><%=rs.getString("InstType")%></td>
				<td><%=rs.getString("Transporter")%></td>
				<td><%=rs.getString("Rdate")%></td>
				<td><%=rs.getString("TechName")%></td>
				<td><%=rs.getString("Courier")%></td>
				<td><%=rs.getString("CourierDCNo")%></td>
				<td><%=rs.getString("Location")%></td>
				<td><%=rs.getString("Utype")%></td>
				<td><%=rs.getString("DC_NO")%></td>
				<td><%=rs.getString("Comment")%></td>
				<td><%=rs.getString("EntBy")%></td>
			</tr>
<%
			i++;}
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
	int j=1;
	String sql1="SELECT   "+
	"		a.DispDate,a.orderno,a.ChalanNo,b.Tech,a.UnitID, "+
	"		a.InstType,a.Peripherals,b.Cust,c.Address,a.DisName,a.CourierDate,a.EntBy  "+
	"	FROM db_CustomerComplaints.t_unitorder b  "+ 
	"	INNER JOIN (   "+
	"		SELECT orderno,ChalanNo,UnitID,  "+
	"			InstType,  "+
	"			Peripherals,DisName,CourierDate,EntBy,DispDate  "+
	"		FROM db_gps.t_unitmaster  "+
	"		WHERE Status='Dispatched'   AND DispDate>='"+
	fromDateForFromTransworld +"' AND DispDate<='"+
	toDateForFromTransworld + 
	"'		  AND RecByCust='No'  "+
	"		  AND RecByTech='No'  "+
	"	) a ON (b.Reqno=a.orderno and b.Tech='"+session.getAttribute("username").toString()+"') "+ 
	" 	LEFT OUTER JOIN db_CustomerComplaints.t_dispatchaddress c ON(b.DispatchAdd=c.location) "+
	"	ORDER BY a.DispDate,b.ReqDate Desc";
	
	ResultSet rs1=stmt2.executeQuery(sql1);
	while(rs1.next()){
	%>
			<tr>
				<td><font color="black"><%=j%></font></td>
				<td><font color="Red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("DispDate")))%></font></td>
				<td><div align="left"><font color="black"><%=rs1.getString("orderno")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("ChalanNo")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Tech")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("UnitID")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("InstType")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Peripherals")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Cust")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Address")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("DisName")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("CourierDate")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("EntBy")%></font></div></td>
			</tr>
<%
	j++;}
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
