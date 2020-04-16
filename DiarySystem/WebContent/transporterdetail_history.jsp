<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"	href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 -->
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>
 <style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid #ddd;
    padding: 8px;
}

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
 	<script type="text/javascript">
 	
 	function confirmSubmit()
 	{
 		var x= document.getElementById("fromDate").value.trim();
 		//alert(x);
 		var y= document.getElementById("toDate").value.trim();
 		//alert(y);
 		if(x>y)
 			{
 			alert("From Date should be less than To Date");
 			return false;
 			}
 		
 	}
 	</script>

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
	                        title: "Transporter Details Report for " +" " + $("#radio1").val() +" " + "from  "+ $("#radio2").val()+" " + "to  "+ " "+ $("#radio4").val(),
	                        
	                        	                        
	                    },
	                    {
	                        	extend : 'pdfHtml5',
	                        title : function() {
	                            return "Transporter Details Report for " +" " + $("#radio1").val() +" " + "from  "+ $("#radio2").val()+" " + "to  "+ " "+ $("#radio4").val();
	                        },
	                        orientation : 'landscape',
	                        pageSize : 'A0',
	                        text : '<i class="fa fa-file-pdf-o"> PDF</i>',
	                        titleAttr : 'PDF'
	                    },
	                    
	                    {
	                        extend: 'csv',
	                        title: "Transporter Details Report for " +" " + $("#radio1").val()+" "  + "from  "+ $("#radio2").val()+" " + "to  "+ " "+ $("#radio4").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title:  "Transporter Details Report for " +" " + $("#radio1").val() +" " + "from  "+ $("#radio2").val()+" " + "to  "+ " "+ $("#radio4").val(),
		                      
	                    },
	                    {
	                        extend: 'copy',
	                        title:  "Transporter Details Report for " +" " + $("#radio1").val()+" "  + "from  "+ $("#radio2").val()+" " + "to  "+ " "+ $("#radio4").val(),
		                      
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All",10, 25, 50, 100 ]],
	        
	    	
	    	
	    	
	    } );
	} );


</script>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script>
		function toggleDetails(id, show)
		{
			var popup = document.getElementById("popup"+id);
			if (show) {
				popup.style.visibility = "visible";
				popup.setfocus();
				
			} else {
				popup.style.visibility = "hidden";
			}
		}
	</script>
	<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
	</style>
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
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<%
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st3=conn.createStatement();

st2=conn1.createStatement();

    final SimpleDateFormat americanDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    final String today = americanDateFormat.format(new java.util.Date());
    final String fromDateRequest = request.getParameter("fromDate");
    final String ALL="All";
    //final String transporter;
    final String toDateRequest = request.getParameter("toDate");
    final String fromDate = (fromDateRequest == null) ? today : fromDateRequest.toString();
    final String toDate = (toDateRequest == null) ? today : toDateRequest.toString();
    String transporter= request.getParameter("transporter");
    /* fromDate=request.getParameter("fromDate");
    toDate=request.getParameter("toDate");
   */  if(transporter==null)
    {
    	transporter="All";
    }
         
            	 
%>
<input type="hidden" id="radio1" name="radio1" value=<%=transporter %>>
<input type="hidden" id="radio2" name="radio2" value=<%=fromDate%>>
<input type="hidden" id="radio4" name="radio4" value=<%=toDate %>>


<table border="0" width="960px" align="center">
	<tr>
		<td align="center"><font color="brown" size="3"><B>Transporter Details History</B></font></td>
	</tr>
</table>	
<form action="" method="get"  onsubmit="return confirmSubmit();">
	<table border="1" width="960px" align="left">
		<tr>
			<td>
				<input type="text" style="height:18px; width:80px; text-align: center;font-size : 12px;" id="fromDate" name="fromDate" size="10" class="formElement" value="<%=fromDate %>" readonly/>
           		<input type="button" style="height:22px; width:80px; font-size : 12px;"name="trigger" id="trigger" value="From Date" class="formElement"></input>
           			<script type="text/javascript">
           				Calendar.setup(
           				{
              				inputField  : "fromDate",         // ID of the input field
               				ifFormat    : "%Y-%m-%d",     // the date format
               				button      : "trigger"       // ID of the button
           	 			}
                       );
           	 		</script>  
      	 	</td>
			<td>
				<input type="text" style="height:18px; width:80px; text-align: center;font-size : 12px;" id="toDate" name="toDate" size="10" class="formElement" value="<%=toDate %>" readonly/>
             	<input type="button" style="height:22px; width:80px; font-size : 12px;" name="trigger1" id="trigger1" value="To Date" class="formElement"/>
         			<script type="text/javascript">
          				Calendar.setup(
           				{
               				inputField  : "toDate",     // ID of the input field
               				ifFormat    : "%Y-%m-%d",     // the date format
               				button      : "trigger1"      // ID of the button
       		  			}
             			);
          	 		</script>
       	 	</td>
       	  	<td>
       	 		  <select name="transporter" id="transporter"> 
						<option value="All">All</option>
<%
String sql1="";
		 sql1="select distinct(TypeValue) as TypeValue from db_gps.t_transporter order by TypeValue";
System.out.println("sql1 is-->>" + sql1);
ResultSet rs2=st2.executeQuery(sql1);
while(rs2.next())
	
{
	String tvalue=rs2.getString("TypeValue");
%>
						<option value="<%=tvalue%>" > <%=tvalue%></option>
<%
						}
%>
					</select>
            </td>
            <td>
           			<input type="submit" name="Submit" style="height:22px; width:80px; font-size : 12px;" value="Submit" class="formElement" ></input>
            </td>
         </tr>
	</table>	
</form>	            	
	
		<table border="0" width="960px">
		<tr>
			<td align="center"> 
				<font color="maroon" size="2"><B>
				 	Transporter Details Report for <%=transporter%> 
					from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate))%> 
					to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(toDate)) %>
				</B></font>
			</td>
		</tr>
		</table>
		<div class="form" style="width:960px;color: black;">
	<table id="example" class="display" a style="width: 100%"
				cellspacing="0" border="1" >
				<thead  >
				
		<tr>	
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Sr.</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Transporter</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Added By</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Date-Time</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Old User Limit</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Old Unit Limit</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Old Status</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Old Comment</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> <B>Edited By</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Updated Date-Time</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> <B>User Limit</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Unit Limit</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">  <B>Status</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> <B>Changed Comment</B></th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> <B>Operational Status</B></th>
		</tr>	
		</thead>
			<tbody>
<%
int i=1;
				 			transporter= request.getParameter("transporter");
				 		    if(transporter==null)
				 		    {
				 		    	transporter="All";
				 		    }
				 		    %>
				 		   <script>
				 		    document.getElementById("transporter").value='<%out.print(transporter); %>';
				 		    
				 		    </script>
				 		    <%
				 		   if(transporter.equals("All"))
				 			 {
				 		    	 transporter="%%";
				 			 }
String sql2="SELECT Typevalue,Entered_By,DateTime,Userlimit,Unitlimit,ActiveStatus,comment,New_EnteredBy,New_DateTime,New_UserLimit,New_UnitLimit,New_ActiveStatus,New_Comment,OperationalStatus FROM db_gps.t_oldtransporterdetails WHERE     1=1   AND TypeValue like '"+transporter+"' AND ( ( CAST( DateTime AS DATETIME ) >='"+fromDate+" 00:00:00 AM' AND CAST( DateTime AS DATETIME ) <='"+toDate+" 23:59:59 PM' ) OR ( CAST( New_DateTime AS DATETIME ) >='"+fromDate+" 00:00:00 AM' AND CAST( New_DateTime AS DATETIME ) <='"+toDate+" 23:59:59 PM') ); ";

System.out.println("sql2 is-->>" + sql2);
ResultSet rs4=st2.executeQuery(sql2);
while(rs4.next())
	

{
	
	 String Typevalue= rs4.getString("Typevalue");
	 String Entered_By= rs4.getString("Entered_By");
	 String DateTime= rs4.getString("DateTime");
	 System.out.println("DateTime is:- " + DateTime);
	 
	 String datetimefinal[]=DateTime.split("\\s");
	 String datefinal= datetimefinal[0];
	 datefinal=  new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
						.parse(datefinal));
	 
	 System.out.println("Date is:- " + datefinal);
	 String timefinal=datetimefinal[1] ;
	 System.out.println("timefinal:- " + timefinal);
		
		DateTime=datefinal + " " + timefinal;
		System.out.println("Final DateTime is:- " + DateTime);
		 	
	 String Userlimit= rs4.getString("Userlimit");
	 String Unitlimit= rs4.getString("Unitlimit");
	 String ActiveStatus= rs4.getString("ActiveStatus");
	 String comment= rs4.getString("comment");
	 String New_EnteredBy= rs4.getString("New_EnteredBy");
	 String New_DateTime= rs4.getString("New_DateTime");
	 New_DateTime=New_DateTime.trim();
	 if(!(New_DateTime.equals("-"))){
	 String datetimefinal1[]=New_DateTime.split("\\s");
	 System.out.println("first element is:" + datetimefinal1[0]);
	 String datefinal11= datetimefinal1[0];
	String datefinal12=  new SimpleDateFormat("dd-MMM-yyyy")
				.format(new SimpleDateFormat("yyyy-MM-dd")
						.parse(datefinal11));
	 
	 System.out.println(" Upadted Date is:- " + datefinal12);
	 String timefinal1=datetimefinal1[1] ;
	 System.out.println("timefinal:- " + timefinal1);
		
	 New_DateTime=datefinal12 + " " + timefinal1;
		System.out.println("Final updated DateTime is:- " + New_DateTime);
	 }
	 System.out.println("Updated Date Time is:- " + New_DateTime);
	 String New_UserLimit= rs4.getString("New_UserLimit");
	 String New_UnitLimit= rs4.getString("New_UnitLimit");
	 String New_ActiveStatus= rs4.getString("New_ActiveStatus");
	 String New_Comment= rs4.getString("New_Comment");
	 String OperationalStatus= rs4.getString("OperationalStatus");
%>					
		<tr>
			<td align="right"><%=i%></td>
			<td align="left"><%=Typevalue%></td>
			<td align="left"><%=Entered_By %></td>
			<td align="right"><%=DateTime%></td>
			<td align="right"><%=Userlimit %></td>	
			<td align="right"><%=Unitlimit%></td>
			<td align="left"><%=ActiveStatus%></td>
			<td align="left"><%=comment%></td>
			<td align="left"><%=New_EnteredBy%></td>
			<td align="right"><%=New_DateTime%></td>
			<td align="right"><%=New_UserLimit %></td>
			<td align="right"><%=New_UnitLimit%></td>
			<td align="left"><%=New_ActiveStatus%></td>
			<td align="left"><%=New_Comment%></td>
				<td align="left"><%=OperationalStatus%></td>
			
		</tr>
<%
i++;
}
%>
</tbody>
	</table>
	</div>
</div>
   				 </div>
			<div id="gbox-bot1"> </div>
		</div>
      </div>
    </div>
  </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2019 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
 </body>
</html>