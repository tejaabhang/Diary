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
 <jsp:useBean id="date" class="java.util.Date" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 

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
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'ASC Detail Report',
	                        exportOptions: {
	                            modifier: {
	                                page: 'current'
	                            }
	                        }
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'ASC Detail Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'ASC Detail Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'ASC Detail Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'ASC Detail Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[25, 50, 100, -1], [25, 50, 100, "All"]]
	    	
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
 <div id="row">
        <div id=""> </div>
        <div id="">
          <div id=""> 
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
	Statement stwar1=conn.createStatement();
	Statement stwar2=conn.createStatement();
	Statement stwar3=conn.createStatement();
	Statement stwar4=conn.createStatement();
	Statement stamc1=conn.createStatement();
	String sql4="",sqlamc1="";
	
	//String selectedvalue="";
	
	String Status=request.getParameter("status");
	
	System.out.println("in connection created");	
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>Annual Service Contract Report</b></font></td></tr>
	
	</table>
	
	
	<br></br> 

	<!-- Finished with Adding code -->
	
	<br></br>
			
			
	<!-- 		<table>
			<tr>
			<td> <a href="fullfleet.jsp?transporter=Vehall " >Export All Vehicles </a> </td>
			</tr>
			</table> -->
<table id="example" class="sortable " style="border: 1px solid black; width: 797px;" cellspacing="0">
			<tr bgcolor="#BDBDBD">
				<td><b>SrNo</b></td>
				<td><b>Vehicle</b></td>
				<td><b>Unit ID</b></td>
				<td><b>Owner Name</b></td>
				<td><b>Installed Date</b></td>
				<td><b>Warranty Till</b></td>
				<td><b>Warranty Status</b></td>
			</tr>
<%
	try
	{
		int i=1;
		//String Status=request.getParameter("status");
		/* transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
		String sql="select Distinct(OwnerName) from db_gps.t_vehicledetails where Status='-' and OwnerName in ('"+transporterlist+"') order by OwnerName";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){ */
		/* String sql2="select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue"; */
		System.out.println("selected value >>>>>>>>"+Status);
		String sql2="select * from db_gps.t_vehicledetails where Status = '-' order by OwnerName,VehicleRegNumber";
		
		ResultSet rs2=st2.executeQuery(sql2);
		while(rs2.next())
		{

%>			
	<tr>					
	    	<td width="5%"><div align="right"><%=i%></div></td>
	    	<%
	    			String VehicleCode=rs2.getString("VehicleCode");
					String VehicleRegNumber=rs2.getString("VehicleRegNumber");
					String unitid=rs2.getString("unitid");
					String InstalledDate=rs2.getString("InstalledDate");
					String OwnerName=rs2.getString("OwnerName");
					
					
					
					String sqlamc="select max(WarrantyTill) as WarrantyTill from db_gps.t_amchistory where VehCode = '"+VehicleCode+"' order by WarrantyTill desc limit 1";
					ResultSet rsamcc=stwar2.executeQuery(sqlamc);
					String Warranty="",warranty="";
					if(rsamcc.next())
					{
						
						
						Warranty=rsamcc.getString("WarrantyTill");
						if(!(null==rsamcc.getDate("WarrantyTill")))
						{
						try{	
							sqlamc1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS(NOW()) as days";
							ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
							if(rsamcc1.next())
							{
								if(rsamcc1.getInt("days") > 0)
								{
									warranty="Yes";
								}
								else
								{
									warranty="No";
								}
							}
							}
							catch(Exception X)
							{
								warranty="-";
							}
						}
						else
						{
							sql4="select TO_DAYS(NOW())-TO_DAYS('"+rs2.getString("InstalledDate")+"') as days";
							ResultSet rst222=stwar3.executeQuery(sql4);
							if(rst222.next())
							{
								if(rst222.getInt("days") > 365)
									{
										warranty="NO";
									}
								else
								{
									warranty="YES";
								}
							}
						}
					}
					else
					{
					//out.println("Hiiiiiiiiiiiiiiii");
						//insdt1=rs4.getString("InstDate");
						sql4="select TO_DAYS(NOW())-TO_DAYS('"+rs2.getString("InstalledDate")+"') as days";
						ResultSet rst222=stwar4.executeQuery(sql4);
						if(rst222.next())
						{
							if(rst222.getInt("days") > 365)
							{
								warranty="NO";
							}
							else
							{
								warranty="YES";
							}
						}
					}     
					
					/*  DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
					 InstalledDate = df1.format(date); */
					 
				if(InstalledDate==null) {
						
					InstalledDate="-";
					
					}
				else if(Warranty==null){
					Warranty="-";
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					date = df.parse(InstalledDate);
		    	    DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
		    	    InstalledDate = df1.format(date);
				}
					 
				else{
					 
					  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				    	
			    	    date = df.parse(InstalledDate);
			    	    DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
			    	    InstalledDate = df1.format(date);
			    	    
			    	    date = df.parse(Warranty);
			      	    df1 = new SimpleDateFormat("dd-MMM-yyyy");
			      	  Warranty = df1.format(date);
			      	  
				} 
			      	    
					%>
					
    	    <td><%=VehicleRegNumber %></td>
    	     <td><div align="right"><%=unitid %></div></td>
    	      <td><%=OwnerName %></td>
    	       <td><div align="right"><%=InstalledDate %></div></td>
    	        <td><div align="right"><%=Warranty %></div></td>
    	         <td><%=warranty %></td>
    	    
	</tr>
<%
		i++;}
	}catch (Exception e) {
			out.println("<tr><td colspan=2>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
	</table>
<%

try
{
	conn.close();
}catch(Exception e)
{}
	
	}	
%>
		
		
		



<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2017 by Transworld Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>