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
	//	alert(id);
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
		//alert(document.form1.dataFilter[0].checked);
		//alert(document.form1.dataFilter[1].checked);
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
			//alert(date1);
			var date2=document.getElementById("toDateForFromTransworld").value;
			//alert(date2);
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
<%@ include file="header1.jsp" %>
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
Statement stmt3=con1.createStatement();
Statement stmt4=con1.createStatement();
Statement stmt5=con1.createStatement();
java.util.Date defoultdate = new java.util.Date();
String transporterlist=session.getAttribute("TransporterList").toString();
System.out.println(transporterlist);
transporterlist=transporterlist.substring(3,transporterlist.length()-1);
System.out.println(transporterlist);
transporterlist=transporterlist.replace(",","','");
System.out.println(transporterlist);
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
	<table border="0" width="750px"  align="center"  bgcolor="#E6E6E6">
		<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>IN TRANSIT UNITS REPORT.</b> </font></td></tr>
		
		<tr>
			<td><div align="center">
				
					<input type="radio" name="dataFilter" value="fromfield" <%if(option.equals("fromfield")){out.print("CHECKED");} %> onClick="ShowHide(0);"><b>Dispatch From Field</b>
					<input type="radio" name="dataFilter" value="fromtransworld" <% if(option.equals("fromtransworld")){ out.print("CHECKED");} %> onClick="ShowHide(1);"><b>Dispatch From Transwold</b>
		 	</div></td>	
		 </tr>
		 <tr id="fromFieldOption">
		 	<td align="center"><b>From Date :</b>
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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>To Date :</b>
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
			<td align="center"><b>From Date :</b>
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
		           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>To Date :</b>
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
           			<input type="submit" name="Submit" value="Submit" class="formElement" >
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
			<tr bgcolor="#BDBDBD">
				<td><b><font color="black">Sr. No</font></b></td>
				<td><b><font color="black">Unit ID</font></b></td>
				<td><b><font color="black">Unit Type</font></b></td>
				<td><b><font color="black">Transporter</font></b></td>
				<td><b><font color="black">Sent Date</font></b></td>
				<td><b><font color="black">Technician Name</font></b></td>
				<td><b><font color="black">Courier Name</font></b></td>
				<td><b><font color="black">Courier Docket No</font></b></td>
				<td><b><font color="black">Location</font></b></td>
				<td><b><font color="black">Status of Unit</font></b></td>
				<td><b><font color="black">DC NO</font></b></td>
				<td><b><font color="black">Comment</font></b></td>
				<td><b><font color="black">EntBy</font></b></td>
			</tr>
<%
			String	sql="select * FROM "+ 
		    " db_CustomerComplaints.t_unitreceived "+ 
			" where Intransit='Yes' "+
			" and Transporter in ('"+transporterlist+"')"+ 
			" and Rdate between '"+fromDateForFromField+ "' and '"+toDateForFromField+"'";
			System.out.println("from field intransit-->"+sql);
			ResultSet rs=stmt1.executeQuery(sql);
	
			int i=1;
			while(rs.next()){
%>	
			<tr>
				<td><%=i %></td>
				<td><%=rs.getString("UnitID")%></td>
				<%
				String sql2="select InstType from db_gps.t_unitmaster where UnitID='"+rs.getString("UnitID")+"'";
				ResultSet rs1=stmt3.executeQuery(sql2);
				if(rs1.next())
				{%>
					<td><%=rs1.getString("InstType") %></td>
			<% 	}else
			
			{ %>
				        <td><b>----</b></td>
		    <% 		        				
		        }
			%>
				<td><%=rs.getString("Transporter")%></td>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("Rdate")))%></td>
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
			<tr bgcolor="#BDBDBD">
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
/*	String sql1="SELECT   "+
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
	*/
	String sql3="SELECT * FROM db_CustomerComplaints.t_unitorder WHERE Cust IN ('"+transporterlist+"')";                      
	//System.out.println("QUery===>"+sql3);
	ResultSet rs1=stmt2.executeQuery(sql3);
	while(rs1.next()){
		String sql5="Select orderno,ChalanNo,UnitID,InstType,"+
		"Peripherals,DisName,CourierDate,EntBy,DispDate "+  
        "FROM db_gps.t_unitmaster "+  
        "WHERE Status='Dispatched'   AND DispDate>='"+fromDateForFromTransworld +"' AND DispDate<='"+toDateForFromTransworld+"' AND RecByCust='No'"+  
       " AND RecByTech='No' AND orderno='"+rs1.getString("reqno")+"'";
	//	System.out.println("QUery===>"+sql5);
		ResultSet rs2=stmt4.executeQuery(sql5);
		if(rs2.next()){
%>
	
			<tr>
				<td><font color="black"><%=j%></font></td>
				<td><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("DispDate")))%></font></td>
				
				<td><div align="left"><font color="black"><%=rs2.getString("orderno")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("ChalanNo")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Tech")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("UnitID")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("InstType")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("Peripherals")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs1.getString("Cust")%></font></div></td>
<%
	String sql6="select location from db_CustomerComplaints.t_dispatchaddress where"+
				" location='"+rs1.getString("DispatchAdd")+"'";
	ResultSet rs4=stmt5.executeQuery(sql6);
	if(rs4.next())
		{
%>
				<td><div align="left"><font color="black"><%=rs4.getString("location") %></font></div></td>
<% 
		}
%>
				<td><div align="left"><font color="black"><%=rs2.getString("DisName")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("CourierDate")%></font></div></td>
				<td><div align="left"><font color="black"><%=rs2.getString("EntBy")%></font></div></td>
			</tr>
<%}
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
