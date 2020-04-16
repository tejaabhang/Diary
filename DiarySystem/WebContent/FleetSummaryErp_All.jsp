  <%@ include file="headernew.jsp"%> 
  <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
  <%@page import="java.util.Date"%>
  
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
              
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

  


 <style type="text/css">

#hello{
	
  max-width:0;
 
 
  overflow: scroll;
  text-overflow: ellipsis;
  white-space: nowrap;
  
  
  
 
 
}

#hello:hover {
	
  
    overflow-x: hidden; /* Hide horizontal scrollbar */
    overflow-y: scroll;
    
    
}
</style> 

<style type="text/css">
table.dataTable tbody td {
    word-break: break-word;
    vertical-align: top;
    word-break: break-all;
     white-space: normal;
}
</style>


<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>

 
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	
	    	    	    		    	
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        responsive:true,
	        scrollY:	"500px",
	        scrollX:true,
	        scrollCollapse:true,
	          
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Fleet Summary Report ',
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Fleet Summary Report ',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Fleet Summary Report  ',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Fleet Summary Report  ',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Fleet Summary Report ',
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100 ]],
	        
	    	
	        
	        	   	
	         
	    	
	    	
	    } );
	} );


</script>

<%
fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>

<script type="text/javascript">
 function chk()
 {

 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	
 	
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
     var objToDate = document.getElementById("data1").value;
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
//          else if(date1 > currentDate)
//          {
//              alert("From Date should be less than current date");
//              return false; 
//          }
//          else if(date2 > currentDate) 
//          {
//              alert("To Date should be less than current date");
//              return false; 
//          }

         return true;
 	
 }
 </script>
 
<script type="text/javascript">
var renderStart = new Date().getTime();
window.onload=function() { 
var renderEnd=new Date().getTime();
var elapsed = new Date().getTime()-renderStart;   
var PageName = document.getElementById("PageName").value;
	try{var ajaxRequest;
	try{ajaxRequest = new XMLHttpRequest();	}
		catch (e)
		{
		try
		{ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");}
		catch (e)
		{try
		{ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");}
		catch (e)
		{alert("Your browser broke!");
		return false;
		}}}
		ajaxRequest.onreadystatechange = function()
		{if(ajaxRequest.readyState == 4)
		{try
		{var reslt=ajaxRequest.responseText;
		var result1;
		result1=reslt;
		result1=result1.replace(/^\s+|\s+$/g,'');
		if(result1=="Updated")
		{}
		}catch(e)
		{alert(e);
		}}};		 
		var queryString = "?PageName="+PageName+"&renderStart="+renderStart+"&renderEnd="+renderEnd+"&elapsed="+elapsed+"";
		ajaxRequest.open("GET","Ajax_PageLoadingTime.jsp" + queryString, true);
		ajaxRequest.send(null); 
		}
		   catch(e)
		{
			alert(e);
		}  
};

function datevalidate()
{
	 //alert(">>>>");
	var date1=document.getElementById("data").value;
	var date2=document.getElementById("data1").value;
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
	dd11=date1.substring(0,2);
	dd22=date2.substring(0,2);
	mm1=date1.substring(3,5);
	mm2=date2.substring(3,5);
	yy11=date1.substring(6,10);
	yy22=date2.substring(6,10);
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	if(yy11>year || yy22>year)
	{
		alert("selected date should not be greater than yesterday date");
		return false;
	}
	else if(year==yy11 && year==yy22)
	{
		if(mm1>month || mm2>month)
		{
			alert("selected date should not be greater than yesterday date");
			return false;
		}
	}
	if(mm1==month && mm2==month)
	{
		if(dd11>day || dd22>day)
		{
			alert("selected date should not be greater than yesterday date");
			return false;
		}
	}

	if(yy11 > yy22)
	{
		alert("From date year should not be greater than to date year");
		return false;
	}
	else if(year==yy11 && year==yy22)
	{
		 if(mm1>mm2)
	{
		alert("From date month should not be greater than to date month");
		return false;
	}
	}
	if(mm1==month && mm2==month) 
	{
		if(yy11==yy22)
		{
		if(dd11 > dd22)
		{
			alert("From date should not be greater than to date");
			return false;
		}
		}
	}
	else
		if(yy11<yy22)
		{
			return true;
		}
	else
		if(dd11 > dd22)
	{
			if(mm1<mm2)
			{
				return true;
			}
			
		alert("From date should not be greater than to date");
		return false;
	}
	
	return true;
}
</script>

</head>
<style type="text/css">
td.details-control {
    background: url('images/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('images/details_close.png') no-repeat center center;
}
</style>
<body style="background-color: #FFFFFF;">

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null; 	
	Statement st3 = null;
	String date1 = "";
	String date2 = "";%>	
	
<%
String defaultDate = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
System.out.println("The default date is ==>"+defaultDate);

//setting for the to date
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar c1 = Calendar.getInstance();
c1.setTime(new Date());
c1.add(Calendar.DATE, -1);  
String default_date_2 = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
%>	
<%
try{
	
	 date1 = request.getParameter("data");
	 date2 = request.getParameter("data1");
	
	// Class.forName(MM_dbConn_DRIVER);
	//conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	conn=fleetview.ReturnConnection();
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 String 	username="";

	 username=(String)session.getAttribute("usertypevalue");


	 System.out.println("Customer NAme:"+username);

	 String selected=request.getParameter("status");

	 System.out.println("--------"+selected);
	  

%>	


<form id="fleet_summart_all" name="fleet_summart_all" onsubmit="return chk();" action="" method="post">
<%@page import="org.apache.poi.hssf.record.formula.functions.Datedif"%>
<div  class="form" align="center" style="font-size: 13px;  ">
<font face="san-serif" color="#036" size="3"><b>Fleet Summary Report</b></font><br></br>
	<table border="0" width="80%" align="center">
				
		<tr align="center">
	<td>
	</td>
		<td align="center"><font size="2" face="Arial"><b>From&nbsp;&nbsp;</b></font>
		<input type="text" id="data" name="data" size="12" value="<%if(date1==null){ %><%=defaultDate%><%}else{%><%=date1%><%}%>"style="width: 90px; height: 15px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
		<script type="text/javascript">
		  Calendar.setup(
		    {
		      inputField  : "data",         // ID of the input field
		      ifFormat    : "%d-%b-%Y",     // the date format
		      button      : "data"       // ID of the button
		    }
		  );
		</script>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font size="2" face="Arial"><b>To &nbsp;&nbsp;</b></font>
		<input type="text" id="data1" name="data1" value="<%if(date2==null){ %><%=default_date_2%><%}else{%><%=date2%><%}%>"  size="12" style="width: 90px; height: 15px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
		<script type="text/javascript">
		  Calendar.setup(
		    {
		      inputField  : "data1",         // ID of the input field
		      ifFormat    : "%d-%b-%Y",    // the date format
		      button      : "trigger1"       // ID of the button
		    }
		  );
		</script>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type ="submit" name ="submit" id ="submit" value="submit"></input>		
		</td>
	

<%
int no_of_column = 0;
String date_3 = "";
String date_4 = "";
	
//	System.out.println("Date1 = "+date1+"Date2 ="+date2);
	if(date1==null || date2==null){
		//System.out.println("in if");
		
	//	System.out.println("The default date is :"+defaultDate);
	//	System.out.println("The default date_2 is :"+default_date_2);
		
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(defaultDate));
		date2 =new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(default_date_2)) ;
	/*	date1 = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		int index = date1.lastIndexOf("-");
		String date_Sub = date1.substring(index);
		date1 = date1.replace(date_Sub,"");
		date1.trim();
		date1 = date1+"-01";
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); */
		
	//	System.out.println("If Date1 = "+date1+"Date2 ="+date2);
		date_3 = date1;
		date_4 = date1;
	//	System.out.println("The date3 is "+date_3);
		
		String datediff = "Select datediff('"+date2+"','"+date1+"') as deteDif";
		ResultSet rs1 = st1.executeQuery(datediff);
		if(rs1.next()){
			no_of_column = rs1.getInt("deteDif");
		}
//		System.out.println("The number of columns in the table :"+no_of_column);
		
	}else{
		//System.out.println("in else");
		
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date1));
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date2));
		
	System.out.println("else Date1 = "+date1+"Date2 ="+date2);
		
		date_3 = date1;
		date_4 = date1;
	//	System.out.println("The date3 is "+date_3);
		
		String datediff = "Select datediff('"+date2+"','"+date1+"') as deteDif";
		ResultSet rs1 = st1.executeQuery(datediff);
		if(rs1.next()){
			no_of_column = rs1.getInt("deteDif");
		}
		
	//	System.out.println("The number of columns in the table :"+no_of_column);
	}
	System.out.println(">>>");
	String vehlist = session.getAttribute("VehList").toString();
	
	System.out.println("The vehicle list is>>>"+vehlist);
%>	

</tr>
</table>
</div>
</form>



<br>

<div class="form"   >	
<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1">  
<thead style="background-color: #8596FA;" align="center">
	<tr>
			<th style="font-size: 12px; color: black;">Sr No</th>
			<th style="font-size: 12px; color: black;">VehRegNo</th>
			<th style="font-size: 12px; color: black;">Transporter</th>
			<th style="font-size: 12px; color: black;">VehicleType</th>
			<%if(date2==null) {
				%><th style="font-size: 12px; color: black;">Update on <%= default_date_2%> before 10:00:00</th><%
				%><th style="font-size: 12px; color: black;">Location on <%= default_date_2%> before 10:00:00</th><%
			}else{
				%><th style="font-size: 12px; color: black;">Update on <%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%> before 10:00:00 AM</th><%
				%><th style="font-size: 12px; color: black;">Location on <%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%> before 10:00:00 AM</th><%
				}
			%>
			<%
			for(int i=0;i<= no_of_column;i++){
				
				if(i>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar c = Calendar.getInstance();
				c.setTime(sdf.parse(date1));
				c.add(Calendar.DATE, 1);  
				date1 = sdf.format(c.getTime());
				}
				
				System.out.println("The date1 is=====================> :"+date1);
				
				%><th style="font-size: 12px; color: black;">Distance <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1)) %></th><%
				%><th style="font-size: 12px; color: black;">RunHrs <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1)) %></th><%
			}
			%>
			<th style="font-size: 12px; color: black;">Total Distance</th>
			<th style="font-size: 12px; color: black;">Total RunHrs</th>
			</tr>
	</thead>
	<tbody>		
	<%
	String vehicletype1=request.getParameter("vehicle");
    
    System.out.println("-------------------------------->"+vehicletype1);
    if(vehicletype1==null)
    {
    	vehicletype1="All";
    }
    %>
    
    <script>
    document.getElementById("vehicle").value='<%out.print(vehicletype1); %>';
    
    </script>
    
    <% 
    /* String fromdate= request.getParameter("data");
    System.out.println("-------------------------------->"+fromdate);
    
    String todate= request.getParameter("data1");
    System.out.println("-------------------------------->"+todate);
     */
	
     if(vehicletype1.equals("All"))
	 {
    	 vehicletype1="%%";
	 }
	
	try{
		DecimalFormat df2 = new DecimalFormat("0.00");
        
		
	int cnt = 0;
		String sql = "Select VehicleCode,VehicleRegNumber,OwnerName,vehtype from db_gps.t_vehicledetails where VehicleCode  IN "+vehlist+"  and  vehtype like '"+vehicletype1+"'";
		ResultSet rs = st.executeQuery(sql);
		System.out.println("The sql is ==>"+sql);
		while(rs.next()){
			String  vehcode = rs.getString("VehicleCode");
			String  vehregno = rs.getString("VehicleRegNumber");
			String  trans = rs.getString("OwnerName");
			String vehicletype = rs.getString("vehtype");
//			System.out.println("The srno is :"+cnt+"The vehicle code is :"+vehcode+"The vehicle reg no is :"+vehregno);
			if(vehicletype=="null" || vehicletype.equalsIgnoreCase("null"))
			{
				vehicletype="-";
			}
			else
			{
				vehicletype=vehicletype;
			}
						//add the data into the table
			
			%>
				
				<tr>
				<td><div align="right"><%= ++cnt %></div></td>
				<td><div align="left"><%=  vehregno%></div></td>
				<td><div align="left"><%=  trans%></div></td>
				<td><div align="left"><%=  vehicletype%></div></td>
				
				<%
				
			
				double total_distance = 0;
				double total_runhrs = 0;
				String last_loc = "",date_loc="";
				
					
				//find the last location
				String sql3 = "Select TheFieldSubject,Thefielddatadatetime from db_gps.t_veh"+vehcode+" where Thefielddatadatetime >= '"+date_3+" 00:00:00' and Thefielddatadatetime <= '"+date2+" 10:00:00' order by Thefielddatadatetime DESC limit 1";
				System.out.println("The sql2 is==>"+sql3);

				ResultSet rs3 = st3.executeQuery(sql3);
				if(rs3.next()) {					
					last_loc = rs3.getString("TheFieldSubject");
					date_loc = rs3.getString("Thefielddatadatetime");
				}else{
					last_loc = "-";
					date_loc = "-";
				}
			%>
			<%
				if(date_loc=="-" || date_loc.equals("-")){
					
					date_loc = "-";
				}else{
					date_loc = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_loc));
				}
			%>
			<td><div align="left"><%= date_loc %></div></td>
			<td><div align="left"><%=  last_loc%></div></td>
			
		<%
				date_3 = date_4;
				for(int i=0;i<= no_of_column;i++)
				{
					String distance = "",runHrs =""; 
					
					if(i>0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Calendar c = Calendar.getInstance();
					c.setTime(sdf.parse(date_3));
					c.add(Calendar.DATE, 1);  
					date_3 = sdf.format(c.getTime());
					}
					
			//		System.out.println("The date1 is=====================> :"+date_3);
					String sql2 = "Select Distance,RDurationinHrs from db_gpsExceptions.t_veh"+vehcode+"_ds where TheDate = '"+date_3+"'";
					ResultSet rs2 = st2.executeQuery(sql2);
					System.out.println("The sql2 is==>"+sql2);
					if(rs2.next()) {
						
						distance = rs2.getString("Distance");
						runHrs = rs2.getString("RDurationinHrs");
						
						total_distance = total_distance + Double.parseDouble(distance);
						total_runhrs = total_runhrs + Double.parseDouble(runHrs);
						
					}else{
						
						distance = "-";
						runHrs = "-";
					}
					
					//add data into table
					%>
					<td><div align="right"><%= distance %></div></td>
					<%if(runHrs == "-" || runHrs.equals("-")) {
						%><td><div align="right"><%= runHrs %></div></td><%
					}else{
						%><td><div align="right"><%=  df2.format(Double.parseDouble(runHrs))%></div></td><%
					}
					
				}
				
				%>
					<td><div align="right"><%=  Double.valueOf(df2.format(total_distance)) %></div></td>
					<td><div align="right"><%= Double.valueOf(df2.format(total_runhrs))%></div></td>
				
				<%
			%>
			
			
			</tr>
			
			<%
			
		}
	}catch(Exception e1){
		System.out.println(e1.getMessage());
		e1.printStackTrace();
	}
}catch(Exception e){
	System.out.println("Exception "+e);
}
finally
{
	try
	{conn.close();
	}catch(Exception e)
	{e.printStackTrace();}

try
{
fleetview.closeConnection();
}catch(Exception e)
{
}	
}
	%>
</tbody>
</table>
</div>


</body>
</html>
</jsp:useBean>
 <%@ include file="footernew.jsp" %>