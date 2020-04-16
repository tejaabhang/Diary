<%@page import="org.apache.commons.beanutils.converters.IntegerArrayConverter"%>
<%-- <%@page import="com.transworld.diary.framework.TechnicianAttendanceData"
		import="com.transworld.diary.framework.Technician"
		import="com.transworld.diary.framework.TechnicianAttendanceDataForSpecificTechs"
		import="com.transworld.diary.framework.TechnicianAttendanceDataForMonthly"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>
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

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet" type="text/css">
 <jsp:useBean id="date" class="java.util.Date" />
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        
 buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Technician Report of '+$("#selectedtechnician").val(),
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Technician Report of '+$("#selectedtechnician").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Technician Report of '+$("#selectedtechnician").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Technician Report of '+$("#selectedtechnician").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Technician Report '+$("#selectedtechnician").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[25, 50, 100, -1], [25, 50, 100, "All"]]
	    	
	    } );
	} );

</script>

	<script language="javascript">
		function validate()
		{
			if(document.techattendrep.dataFilter[0].checked==true)
			{
				var tech=document.techattendrep.selectedTechnician.value;
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
			if(document.techattendrep.dataFilter[0].checked==true)
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

			if(document.techattendrep.dataFilter[1].checked==true)
			{
				var date1=document.getElementById("selectedDate").value;
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
					return false;
				}
				else if(year==dy1) 
				{
					if(dm1>month)
					{
						alert("Selected date should not be greater than Todays date (Month)");
						return false;
					}
				}
	
				if(dm1==month)
				{
					if(dd1>day)
					{
						alert("Selected date should not be greater than Todays date (Day)");	
						return false;
					}
				}
				return true;		
			 }

			if(document.techattendrep.dataFilter[2].checked==true)
			{
				var date1=document.getElementById("fromDateForMonthly").value;
				var date2=document.getElementById("toDateForMonthly").value;
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

		function ShowHide(id)
		{
			if(id==0)
			{
				document.getElementById("sptechopts").style.display="";
				document.getElementById("alltechopts").style.display='none';
				document.getElementById("mnthlyalltechrepopts").style.display='none';
			}
			else if(id==1)
			{
				document.getElementById("sptechopts").style.display='none';
				document.getElementById("alltechopts").style.display="";
				document.getElementById("mnthlyalltechrepopts").style.display='none';
			}
			else
			{
				document.getElementById("mnthlyalltechrepopts").style.display="";
				document.getElementById("sptechopts").style.display='none';
				document.getElementById("alltechopts").style.display='none';
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

		function initializeRadioButtons(){
			var currentSelection=0;
			for(var i=0; i<3; i++){
				if(true== document.techattendrep.dataFilter[i].checked){
					currentSelection = i;
					break;
				}
			}
			ShowHide(currentSelection);
		}
	</script>
	
	<script type="text/javascript">
function fun()
{

	//alert("Hi");
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("calender").value;
	//alert(objFromDate);
	var fdate=objFromDate.split("-");
	if(fdate[1]=="Jan")
	{
		chkf="01";
	}
	if(fdate[1]=="Feb")
	{
		chkf="02";
	}
	if(fdate[1]=="Mar")
	{
		chkf="03";
	}
	if(fdate[1]=="Apr")
	{
		chkf="04";
	}
	if(fdate[1]=="May")
	{
		chkf="05";
	}
	if(fdate[1]=="Jun")
	{
		chkf="06";
	}
	if(fdate[1]=="Jul")
	{
		chkf="07";
	}
	if(fdate[1]=="Aug")
	{
		chkf="08";
	}
	if(fdate[1]=="Sep")
	{
		chkf="09";
	}
	if(fdate[1]=="Oct")
	{
		chkf="10";
	}
	if(fdate[1]=="Nov")
	{
		chkf="11";
	}
	if(fdate[1]=="Dec")
	{
		chkf="12";
	}
	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
    var objToDate = document.getElementById("calender1").value;
    var tdate=objToDate.split("-");
    if(tdate[1]=="Jan")
	{
    	chkt="01";
	}
	if(tdate[1]=="Feb")
	{
		chkt="02";
	}
	if(tdate[1]=="Mar")
	{
		chkt="03";
	}
	if(tdate[1]=="Apr")
	{
		chkt="04";
	}
	if(tdate[1]=="May")
	{
		chkt="05";
	}
	if(tdate[1]=="Jun")
	{
		chkt="06";
	}
	if(tdate[1]=="Jul")
	{
		chkt="07";
	}
	if(tdate[1]=="Aug")
	{
		chkt="08";
	}
	if(tdate[1]=="Sep")
	{
		chkt="09";
	}
	if(tdate[1]=="Oct")
	{
		chkt="10";
	}
	if(tdate[1]=="Nov")
	{
		chkt="11";
	}
	if(tdate[1]=="Dec")
	{
		chkt="12";
	}
    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
     
    var date1 = new Date(objFromDate1);
    var date2 = new Date(objToDate1);
    
    //alert("from > "+date1+" Todate > "+date2);
    
    var date3 = new Date();
    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
    var currentDate = new Date(date4);
     
        if(date1 > date2)
        {
            alert("From Date Should be Less Than To Date");
            return false; 
        }
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }


	return true;
}
</script>
<script type="text/javascript">
$(document).ready(function() {
	 $("#checkAll").click(function () {
	     $('input:checkbox').not(this).prop('checked', this.checked);
	 });
});
</script>
<style type="text/css">
#example {
    
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid ;
    padding: 8px;
}

#example tr:nth-child(even){}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
   
    color: white;
}
</style>
</head>

<body onload='javascript:initializeRadioButtons();'>
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
ResultSet rs;
Statement st1,st2,st3,st4,st5;
String query1,query2,query3,query4,query5;

%>
<%-- 
<%!
	final String ALLTECHS = "All Techs";
	final String SPECIFICTECHS ="Specific Tech";
	final String MONTHLYREPORT= "Monthly report";
	final String YES="yes";
	final String CHECKED = "checked";
%> --%>	
<%
final SimpleDateFormat americanDateFormat = new SimpleDateFormat("yyyy-MM-dd");

final String fromDateRequest=request.getParameter("calender");
final String toDateRequest=request.getParameter("calender1");

String fromDate= "";
String toDate="";
final String technicianName=request.getParameter("selectedtechnician");



System.out.println("Creating Connection");
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st1=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st4=conn.createStatement();
st5=conn.createStatement();

/* List<TechnicianAttendanceData> technicianAttendanceData= null;
List<TechnicianAttendanceDataForSpecificTechs> technicianAttendanceDataForSpecificTechs= null;
List<TechnicianAttendanceDataForMonthly> technicianAttendanceDataForMonthly= null;
List<Technician> technicians = null; */

String selectedtechnician="";

selectedtechnician = request.getParameter("selectedtechnician");
String Date1 = request.getParameter("calender");
String Date2 = request.getParameter("calender1");
System.out.println("Technician Name : "+selectedtechnician);
System.out.println("Date1 : "+Date1);
System.out.println("Date2 : "+Date2);

if(Date1==null && Date2==null){
	Date1=Date2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}



String dt1 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(Date1));
String dt2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(Date2));

System.out.println("Date1 : "+dt1);
System.out.println("Date2 : "+dt2);

if(request.getParameter("calender")!=null)
{
  fromDate=request.getParameter("calender");
  toDate=request.getParameter("calender1");
}
else
	fromDate=toDate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

%>

<form name="techattendrep" method="get"  onSubmit="return validate();">
	<table border="0" width="750px">
		<%--  <tr>
			<td> 
				<input type="radio" name="dataFilter" value="Monthly report" 
				<%=monthlyReportRadioChecked%> onClick="ShowHide(2);"> <font color="maroon"> Monthly Report (All Tech's)</font>			
			</td>
		</tr> --%>
		<tr id="sptechopts"  bgcolor="#BDBDBD"> 
			<td><font color="maroon"> Tech </font>
				<%-- <select name="selectedtechnician" class="formElement" onChange="TechSelect()">
					<option value="Select">Select</option> 
<%

%>
				
				</select> --%>
				<select class="element select medium" id="selectedtechnician" name="selectedtechnician" style="width: 125px; height: 25px;" > 								
								<%
									if(selectedtechnician==null)
									{
									%><option value="select" selected="selected" >select</option>
									<option value="All" >All</option>
									<option value="All Monthly" >All Monthly Attendance</option>
									<%
									query1="SELECT DISTINCT(TechName) " +
											"  FROM db_CustomerComplaints.t_techlist" +
											" where Available='Yes' ORDER BY 1 ASC";
					            	//query1 = "select DISTiNCT(Service_provider) as selectedtechnician  from db_gps.t_simmaster where Service_provider <> '-' AND Service_provider <> '' order by Service_provider asc";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("TechName") %>" ><%=rs1.getString("TechName")%></option>
									<%} 
									}else if(selectedtechnician.equalsIgnoreCase("All")){
										%><option value="select" >select</option>
										<option value="All" selected="selected" >All</option>
										<option value="All Monthly" >All Monthly Attendance</option><%
										query1 = "SELECT DISTINCT(TechName) " +
												"  FROM db_CustomerComplaints.t_techlist" +
												" where Available='Yes' ORDER BY 1 ASC";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("TechName").equals(selectedtechnician))
											{
												%><option value="<%=rs1.getString("TechName") %>" selected><%=rs1.getString("TechName")%></option><%
											}else{
												%><option value="<%=rs1.getString("TechName") %>" ><%=rs1.getString("TechName")%></option><%
											}
									    } 
									}
									else if(selectedtechnician.equalsIgnoreCase("All Monthly")){
										%><option value="select" >select</option>
										<option value="All"  >All</option>
										<option value="All Monthly" selected="selected">All Monthly Attendance</option><%
										query1 = "SELECT DISTINCT(TechName) " +
												"  FROM db_CustomerComplaints.t_techlist" +
												" where Available='Yes' ORDER BY 1 ASC";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("TechName").equals(selectedtechnician))
											{
												%><option value="<%=rs1.getString("TechName") %>" selected><%=rs1.getString("TechName")%></option><%
											}else{
												%><option value="<%=rs1.getString("TechName") %>" ><%=rs1.getString("TechName")%></option><%
											}
									    } 
									}
									else{
										%><option value="select" >select</option>
										<option value="All"  >All</option>
										<option value="All Monthly">All Monthly Attendance</option><%
										query1 = "SELECT DISTINCT(TechName) " +
												"  FROM db_CustomerComplaints.t_techlist" +
												" where Available='Yes' ORDER BY 1 ASC";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("TechName").equals(selectedtechnician))
											{
												%><option value="<%=rs1.getString("TechName") %>" selected><%=rs1.getString("TechName")%></option><%
											}else{
												%><option value="<%=rs1.getString("TechName") %>" ><%=rs1.getString("TechName")%></option><%
											}
									    } 
									}
									%>
							</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				<font color="maroon">From Date: </font>
					<input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromDate%>" readonly style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" />
               	   <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%d-%b-%Y",     // the date format
		                    button      : "calender"       // ID of the button
		               }
		                             );
	          	    </script>	 
               	  
					&nbsp;&nbsp;&nbsp;
					
				<font color="maroon">To Date: </font>
					<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=toDate%>" readonly style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" />
             	     <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender1",         // ID of the input field
		                    ifFormat    : "%d-%b-%Y",     // the date format
		                    button      : "calender1"       // ID of the button
		               }
		                             );
	          	    </script>	 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit" id="submit" value="Submit" onclick="return fun()" style="background: #E6E6E6;"/>				
						</td>
		</tr>

	</table>
</form>


<%
if(selectedtechnician==null){
	System.out.println("Technician Name : "+selectedtechnician);
	
}




else if(technicianName.equalsIgnoreCase("All")  )
{
	
	String sqlAll="SELECT  "+
			"	TechName,AttendDateTime,Present,Location,OkayUnitsToday,FaultyUnitsToday,Comment,User "+
			"	FROM   "+
			"	db_CustomerComplaints.t_techattendance   "+
			"	WHERE  AttendDateTime >='" + dt1 + "' " +
					"   AND AttendDateTime <= DATE_ADD('" + dt2+"',INTERVAL 1 DAY) ORDER BY TechName ASC";


	  System.out.println("Query is : "+sqlAll);
	 
%>
	
	<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Tech Attendance as on <%=Date2%> </B> </font> </td>
		</tr>
	</table>
	<table class="sortable" id="example">
		<tr>	
			<td> <div align="center"> <B> Sr. No.</B> </div> </td>
			<td> <div align="center"> <B> Tech</B> </div> </td>
			<td> <div align="center"> <B> Entry Time </B> </div> </td>
			<td> <div align="center"> <B> Present</B> </div> </td>
			<td> <div align="center"> <B> Location</B> </div> </td>
			<td> <div align="center"> <B> Okay Units</B> </div> </td>
			<td> <div align="center"> <B> Faulty Units</B> </div> </td>
			<td> <div align="center"> <B> Comment</B> </div> </td>
			<td> <div align="center"> <B> Ent. By</B> </div> </td>
			
		</tr>
		
		
<%

rs = st1.executeQuery(sqlAll);

int i=1;
while(rs.next()){
	 String TechName=rs.getString("TechName");
	 String AttendDateTime=rs.getString("AttendDateTime");
	 String Present=rs.getString("Present");
	 String Location=rs.getString("Location");
	 String OkayUnitsToday=rs.getString("OkayUnitsToday");
	 String FaultyUnitsToday=rs.getString("FaultyUnitsToday");
	 String Comment=rs.getString("Comment");
	 String EntBy=rs.getString("User");
%>	
			<tr>
				<td>  <%=i%> </td>
				<td><%=TechName %> </td>
				<td><%=AttendDateTime %></td>
				<td> <%=Present %></td>
				<td> <%=Location %> </td>
				<td><%=OkayUnitsToday %>  </td>
				<td> <%=FaultyUnitsToday %> </td>
				<td> <%=Comment %> </td>
				<td> <%=EntBy %></td>				
			</tr>
<%
i++;  
		}
%>
	</table>
	
<%
}
else if(!technicianName.equalsIgnoreCase("All") && !technicianName.equalsIgnoreCase("All Monthly") && !technicianName.equalsIgnoreCase("Select")){

	
    SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");

	selectedtechnician=request.getParameter("selectedtechnician");
	fromDate=request.getParameter("calender");
	toDate=request.getParameter("calender1");
%>
<form name="techattendrep1" method="post" action="techreprece.jsp" >
	
	<input type="hidden" name="tech" value="<%=selectedtechnician%>" />
	<input type="hidden" name="fromdate" value="<%=fromDate%>" />
	<input type="hidden" name="todate" value="<%=toDate%>" />
<%
	String sqlAll="SELECT 	"+
			" AttendDateTime,Present,Location,OkayUnitsToday,FaultyUnitsToday,Comment,User,RepReceived,SrNo ,TechName " +
			"   FROM 	"+ 
			"   db_CustomerComplaints.t_techattendance 	"+
			"   WHERE	1=1 and TechName='"+technicianName+"' AND AttendDateTime >='" + dt1 + " 00:00:00'"+
			" AND AttendDateTime <='" + dt2 + " 23:59:59'";


	  System.out.println("Query is : "+sqlAll);
	 
%>
	
	<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Specific Tech's Attendance between <%=fromDate %> and <%=toDate %> </B> </font> </td>
		</tr>
	</table>
	<table class="sortable" id="example">
		<tr>	
		
	<!-- 	<td>
		 <div align="center"> <input type="checkbox"  name="maincb" value="maincb" id="checkAll"> </div> </td> -->
			<td> <div align="center"> <B> Sr. No.</B> </div> </td>
			<td> <div align="center"> <B> Date</B> </div> </td>
			<td> <div align="center"> <B> Name</B> </div> </td>
			<td> <div align="center"> <B> Present</B> </div> </td>
			<td> <div align="center"> <B> Location</B> </div> </td>
			<td> <div align="center"> <B> Okay Units</B> </div> </td>
			<td> <div align="center"> <B> Faulty Units</B> </div> </td>
			<td> <div align="center"> <B> Comment</B> </div> </td>
			<td> <div align="center"> <B> Ent. By</B> </div> </td>
			<td> <div align="center"> <B> Edit</B> </div> </td>
			
		</tr>
		
		
<%

rs = st1.executeQuery(sqlAll);

int i=1;
while(rs.next()){

	 String ID = rs.getString("SrNo");
	 String TechName = rs.getString("TechName");
	 String AttendDateTime=rs.getString("AttendDateTime");
	 String Present=rs.getString("Present");
	 String Location=rs.getString("Location");
	 String OkayUnitsToday=rs.getString("OkayUnitsToday");
	 String FaultyUnitsToday=rs.getString("FaultyUnitsToday");
	 String Comment=rs.getString("Comment");
	 String EntBy=rs.getString("User");
	 
	 String dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
				.format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
						.parse(AttendDateTime));
	 System.out.println("Date After Format:-"+dt);
%>	

			<tr>
			<%-- <td>  <input type="checkbox" id="cntr" name="cntr" value="<%=ID%>"></td> --%>
				<td>  <%=i%> <input type="hidden" name="cntr" id="cntr" value="<%=ID%>" /> </td>
				<td><%=dt %></td>
				<td><%=TechName %></td>
				<td> <%=Present %></td>
				<td> <%=Location %> </td>
				<td><%=OkayUnitsToday %>  </td>
				<td> <%=FaultyUnitsToday %> </td>
				<td> <%=Comment %> </td>
				<td> <%=EntBy %></td>	
				<td><a href="#" onClick="window.open ('edittechatt.jsp?srid=<%=ID%>&tech=<%=technicianName%>&dte=<%=AttendDateTime%>','win1', 'width=800, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0')"> <font color="Red" size="2"> Edit </font></a></td>
					
			</tr>
<%
i++;  
		}
%>
	</table>
	<!-- <div align="center">
		<input type="button" value="Report Received" name="reportsubmit" class="btn btn-outline btn-primary">
	</div> -->
	</form>
	
<%

}

else if(technicianName.equalsIgnoreCase("All Monthly"))
{ 
	
	String sqlmonthly="SELECT a.TechName, CASE WHEN b.Present IS NULL  THEN 0 ELSE b.Present END AS Present, "+
	"CASE WHEN b.HolidayPresent IS NULL THEN 0 ELSE b.HolidayPresent END AS HolidayPresent FROM "+
			"db_CustomerComplaints.t_techlist a LEFT OUTER JOIN (SELECT TechName, SUM(CASE WHEN Holiday='No' THEN"+
	"(CASE WHEN Present = 'Yes' THEN 1 WHEN Present = 'Half Day' THEN '0.5' END) ELSE 0 END) AS Present,"+
			"SUM(CASE WHEN Holiday='Yes' THEN (CASE WHEN Present = 'Yes' THEN 1 WHEN Present = 'Half Day' THEN '0.5' END)"+
	"ELSE 0 END)  AS HolidayPresent FROM db_CustomerComplaints.t_techattendance WHERE Present in ('Yes', 'Half Day') "+
			"AND AttendDateTime >='" + dt1 + " 00:00:00' AND AttendDateTime <='" + dt2 + " 23:59:59' GROUP BY TechName)  b ON (a.TechName=b.TechName) where a.Available='Yes' ORDER BY a.TechName ASC";			
	  
	System.out.println("Query is : "+sqlmonthly);
		 
	
%>
	<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Tech Attendance Report from <%=fromDate%> to <%=toDate%> </B> </font> </td>
		</tr>
	</table>
	<table class="sortable" id="example"	>
		<tr>	
		<td> <div align="center"> <B> Sr. No.</B> </div> </td>
		<td> <div align="center"> <B> Tech</B> </div> </td>
		<td> <div align="center"> <B> Present</B> </div> </td>
		<td> <div align="center"> <B> Holiday Present</B> </div> </td>
		<td> <div align="center"> <B> Total</B> </div> </td>
		</tr>
<%

rs = st1.executeQuery(sqlmonthly);

int i=1;
while(rs.next()){

/* 	String ID = rs.getString("SrNo"); */
	 String TechName=rs.getString("TechName");
	 String Present=rs.getString("Present");
	 System.out.println("Tech Name : "+TechName+" "+Present);
	 String HolidayPresent=rs.getString("HolidayPresent");
	 
	
	 float PresentInt = Float.parseFloat(Present);
	 float PresentHolidayInt = Float.parseFloat(HolidayPresent);
	
	 
	float total=PresentInt+PresentHolidayInt;

%>	
		
		<tr>
			<td><%=i%> </td>
			<td><%=TechName %> </td>
			<td> <%=Present %></td>
			<td> <%=HolidayPresent %> </td>
			<td><%=total %>  </td>	
		</tr>
		<%
		i++;  		
}	
%>

<%
%>
<!-- code end here --->

  </table>
  <%} %>
  
  							</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
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