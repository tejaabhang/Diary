<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp" %>		
	 

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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<!--Load Script and Stylesheet -->
	<script type="text/javascript" src="css/jquery.simple-dtpicker.js"></script>
	<link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
	<!---->
	
<script src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" type="text/css" href="css/view.css" media="all">

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <link rel="stylesheet" href="css/styleMakePlan.css"> -->

 <link rel="stylesheet" href="css/styleBlackBoxDashboard.css">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <script type="text/javascript" src="js/jspdf.min.js"></script>
<script type="text/javascript" src="js/jspdf.debug.js"></script>



<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>











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
	                        title: 'Vehicle Status Report',
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Vehicle Status Report',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Vehicle Status Report',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Vehicle Status Report',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Vehicle Status Report',
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]]
	    	
	    } );
	} );

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

<!--- code start here ------>
<%!
Connection conn;


%>
<%
System.out.println("in homepage");	
final String userName=session.getAttribute("username").toString();
System.out.println("in connection created");	
	final String userRole=session.getAttribute("userrole").toString();
	System.out.println("in connection created");	
	String transporterlist=session.getAttribute("TransporterList").toString();

	//final String us1=userName.toUpperCase();
	System.out.println("in connection created");	
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	Statement st2=conn.createStatement();
	
	
	Statement st3=conn.createStatement();
	//String selectedvalue="";
	
	
	
	System.out.println("in connection created");	
	
	
	String Status=request.getParameter("selection");
	String cust=request.getParameter("cust");
	
	
	
	System.out.println("selection is:"+Status);
	System.out.println("selection is:"+cust);
	
	
	String sql="";
	
	
if(!cust.equals("All"))
	{
	if(Status.equals("Online"))
	{
		sql="select * from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-' and a.ownername='"+cust+"'";
		
		
		System.out.println("Inside Online query");
	}
	else  if(Status.equals("Offline"))
	{
		
		sql="select *  from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-' and a.ownername='"+cust+"'";
		System.out.println("Inside Offline Query");
	}
	else
	{
		sql="select *  from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' and a.ownername='"+cust+"'";
		
		System.out.println("Inside Check");
	}
	}
else
{
	if(Status.equals("Online"))
	{
		sql="select * from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-'";
		
		
		System.out.println("Inside Online query");
	}
	else  if(Status.equals("Offline"))
	{
		
		sql="select *  from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-'";
		System.out.println("Inside Offline Query");
	}
	else
	{
		sql="select *  from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' ";
		
		System.out.println("Inside Check");
	}
}
	
	
	System.out.println("query is:"+sql);	
%>






<br></br>



<table id="example"  class="display"  a style="width:100%"  cellspacing="0" border="1"> 


<thead>
<tr>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">SrNo</th>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">Transporter</th>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">Unitid</th>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">Vehicle</th>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">Updated</th>
<th style="font-size:11px ; background: #a9aeb0;  color:black;    face:san-serif;">Location</th>

</tr>
</thead>
<%
int i=1;
ResultSet rsd=st3.executeQuery(sql);
while(rsd.next())
{
	
String date=rsd.getString("TheDate");

String dt1 = new SimpleDateFormat("dd-MMM-yyyy")
.format(new SimpleDateFormat("yyyy-MM-dd")
        .parse(date));


System.out.println("date is:"+dt1);


String time=rsd.getString("TheTime");

String thedatetime=dt1+" "+time;
%>
<tr>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=i%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rsd.getString("OwnerName")%></td>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=rsd.getString("unitid") %></td>
<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rsd.getString("VehicleRegNumber") %></td>
<td style="font-size: 11px; face:san-serif; color:black" align="right"><%=thedatetime%></td>

<td style="font-size: 11px; face:san-serif; color:black" align="left"><%=rsd.getString("Location") %></td>


</tr>
<%
i++;
}
%>
</tbody>
		
	</table>	




<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2017 by Transworld Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>