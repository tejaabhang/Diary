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
	
	String Status=request.getParameter("status");
	
	System.out.println("in connection created");	
%>



<form>
<br></br>
<table width="750px" align="center">
<tr>
	<td align="center"> 
	   <div align="center" >  <font size="2"><b>
	   <label>Customer</label></b></font> </div>
	 </td>
	<td>
	
	
	<select id="status" name="status" style="width: 200px; height: 25px;" >    
	<option selected="selected" value="All"  >All</option>                            
                                <%
                                String sql1="";
                                    if(Status==null)
                                    {
                                    	Status="Active";
                                    	System.out.println("in null value loop");	
                                    %>
                                   
                                    <%
                                    sql1="select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue";
                                    System.out.println("The query is :"+sql1);
                                     ResultSet rs1 = st1.executeQuery(sql1);
                                     while(rs1.next())
                                      {
                                    %>
                                    <option value="<%=rs1.getString("TypeValue") %>"  ><%=rs1.getString("TypeValue")%></option>
                                    <%}
                                    }else{
                                        %>
                                       <%
                                        		sql1 = "select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue";
                                        System.out.println("The query is :"+sql1);
                                         ResultSet rs1 = st1.executeQuery(sql1);
                                         while(rs1.next())
                                          {
                                       
                                            if(rs1.getString("TypeValue").equals(Status))
                                            {
                                                %><option value="<%=rs1.getString("TypeValue") %>" selected><%=rs1.getString("TypeValue")%></option><%
                                            }else{
                                                %><option value="<%=rs1.getString("TypeValue") %>" ><%=rs1.getString("TypeValue")%></option><%
                                            }
                                        }
                                    }
                                    %>
                            </select>
	
	<button type="submit" value="Submit">Submit</button>
   
	  
	<td>
	</td>
	</tr>
	</table>
</form>

<%

String Status1=request.getParameter("status");


System.out.println("Status:"+Status1);

//String sql="select Count(*) as  Online,b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-' union select Count(*) as Within3days, b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' union select Count(*) as Offline, b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-'";



String sql="";


if(Status1==null)
{
	System.out.println("Inside Null block");
	
 sql="select Count(*) as Count,'Online' as 'Status',b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-' union select Count(*) as Count,'Within3days', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' union select Count(*) as Count,'Offline', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-' ";
	
	
	
}
else
{
	if(Status1.equals("All"))
	{
 sql="select Count(*) as Count,'Online' as 'Status',b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-' union select Count(*) as Count,'Within3days', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' union select Count(*) as Count,'Offline', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-' ";
		System.out.println("Hello Inside All");
	}
	else
	{
		 sql="select Count(*) as Count,'Online' as 'Status',b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where b.thedate >=date_sub(curdate(),interval 1 day) and a.status='-' and a.ownername='"+Status1+"' union select Count(*) as Count,'Within3days', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where  thedate < date_sub(curdate(), interval 1 Day) and thedate >= date_sub(curdate(),interval 4 day) and  a.Status='-' and a.ownername='"+Status1+"' union select Count(*) as Count,'Offline', b.TheDate,b.TheTime from db_gps.t_vehicledetails a join db_gps.t_onlinedata b on a.VehicleCode=b.VehicleCode where (b.TheDate < date_sub(curdate(),interval 4 day)) and a.Status='-' and a.ownername='"+Status1+"'";
	System.out.println("Insdie Status Vlaus"+Status1);
	}		
}










System.out.println("Query is:------>"+sql);











ResultSet rs12=st3.executeQuery(sql);

String status121="",count="";

String online="",offline="",Threedays="";
while(rs12.next())
{
	status121=rs12.getString("Status");
	count=rs12.getString("Count");
	
	
	System.out.println("Status:"+status121);
	System.out.println("Count is:"+count);
	
	
	if(status121.equals("Online"))
	{
		online=count;
	}
	else if(status121.equals("Offline"))
	{
		offline=count;
	}
	else
	{
		Threedays=count;
	}
	
	/* online=rs12.getString("Online");
	offline=rs12.getString("Offline");
	Threedays=rs12.getString("Within3days"); */
}



System.out.println(online);
System.out.println(offline);
System.out.println(Threedays);


String datetdy=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());



%>


		
		<div class="row">
  <div class="col-sm-4" align="center">
  <div class="form" style="width: 333px; height: 380px" >

			
		
<div style="height: 27px;align:center"> <font color="#2A0A12"><b> VEHICLE STATUS </b></font>  </b></font></div>
  <div align="right"><font size="2">
			<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			</font></div>
  <div align="right"><input id="save-pdfUtilizationTime" type="image" src="images/pdf.png" width="24" height="24" class="button button-block" value="Export" disabled /></div>


			
 
  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', 'TravelPerDay'],
          ['Online', <%=online%>],
          ['Check',<%=Threedays%>],
          ['Offline', <%=offline%>]
          
         

        	
        ]);

        var options = {
          title: '',
          curveType: 'function',
          legend: { position: 'bottom' },
          pieHole: 0.4,
          pieStartAngle: 270,
          colors: ['Green', 'yellow', 'red'],
          chartArea: {
      	      bottom: 24,
      	      left: 12,
      	      right: 12,
      	      top: 12,
      	      width: '50%',
      	      height: '50%'
      	    },
          /*  legend: {
  	    	position: 'labeled',
  	    	labeledValueText:'both',
  	    	textStyle: {
  	            color: 'black'
  	        }
  	    	} */
        };

        var container = document.getElementById('UtilizationTime_chart');
  	  var chart = new google.visualization.PieChart(container);
  	  var btnSave = document.getElementById('save-pdfUtilizationTime');


  	google.visualization.events.addListener(chart, 'select', selectHandler);
  	
/*   	function selectHandler()
  	{
  		var selection = chart.getSelection();
  		alert("Shubham here");
  		
  		for (var i = 0; i < selection.length; i++) {
  			var item = selection[i];
  		}
  		
  		alert(item);
  	} */
  	  
  	
  	function selectHandler() {
  		var typeofselection=data.getValue(chart.getSelection()[0].row, 0);
  		
  		/* alert(typeofselection); */
  		
  		var customer=document.getElementById("status").value;
  		/* alert(customer); */
  		
  		location.assign("FleetStatus.jsp?selection="+typeofselection+"&cust="+customer+"");
  		
  		
  		}
  	
  	
  	
  	  google.visualization.events.addListener(chart, 'ready', function () {
  	    btnSave.disabled = false;
  	  });

  	  
  	  btnSave.addEventListener('click', function () {
  	    var doc = new jsPDF();
  	    doc.addImage(chart.getImageURI(), 0, 0);
  	    var cname=document.getElementById("status").value;
  	    cname=cname+'<%=datetdy%>';
  	    
  	    doc.save(''+cname+'VehicleStatus.pdf');
  	  }, false);
  	  
        chart.draw(data, options);
        
        
        
      }
    </script>
 <div id="UtilizationTime_chart" style="width: 290px; height: 260px" align="left"></div>
 
</div></div>





  




</div>
		





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