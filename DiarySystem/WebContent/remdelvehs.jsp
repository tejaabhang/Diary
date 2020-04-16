<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
String fromdate,todate,thename,today;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
	                        title:  $("#radio2").val() +" " + "Units From"+ " "+$("#calender").val()+" "+"To"+" "+$("#calender1").val(),
	                        
	                        	                        
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: $("#radio2").val() +" " + "Units From"+ " "+$("#calender").val()+" "+"To"+" "+$("#calender1").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: $("#radio2").val() +" " + "Units From"+ " "+$("#calender").val()+" "+"To"+" "+$("#calender1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: $("#radio2").val() +" " + "Units From"+ " "+$("#calender").val()+" "+"To"+" "+$("#calender1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: $("#radio2").val() +" " + "Units From"+ " "+$("#calender").val()+" "+"To"+" "+$("#calender1").val(),
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script language="javascript">
function validate()
{
}
</script>
<script>
function chk()
{
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("calender").value;
	
	
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
   //alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
     
    /* var date1 = new Date(objFromDate1);
    var date2 = new Date(objToDate1);
    
    alert("from > "+date1+" Todate > "+date2);
     */
   /*  var date3 = new Date();
    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
    var currentDate = new Date(date4); */
     
        if(objFromDate1 > objToDate1)
        {
            swal("From Date Should be Less Than To Date");
            return false; 
        }
//         

        return true;
	
}

</script>
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
<form name="remdelvehs" method="get" action="" onSubmit="return validate();">
<body style="background-color: #FFFFFF;">

<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(),stmt5=con2.createStatement();
	Statement stmtrec=con1.createStatement(),stmt4=con2.createStatement(),stmt6=con1.createStatement();
	
	ResultSet rs1=null, rs2=null, rs3=null,rs4=null,rs5=null,rs6=null;
	ResultSet rstrec=null;
	
	String sql1="", sql2="", sql3="",sql4="",sql5="",sql6="";
	String sqlrec="";
	
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	today = formatter.format(defoultdate);

	String transp=request.getParameter("transp"); 
	String msg="", radsel="", date1="", date2="";
	
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	thename=request.getParameter("radio1");
	if(null==fromdate)
	{
	fromdate=today;
	todate=today;
	thename="TempRemove";
	}
	
	sql1="select distinct(OwnerName) as transp from t_vehicledetails where Ownername not like '% del' order by OwnerName asc";
	rs1=stmt1.executeQuery(sql1);
%>
<center>
		<table border="0" width="1090px" style="background-color:#cfcfcf;">
			<tr>
				<td> <font color="maroon">Transp: </font> <select name="transp" id="transp">
						<option value="All">All</option>
						<%
							while(rs1.next())
							{ %>
								<option value="<%=rs1.getString("transp") %>"><%=rs1.getString("transp") %></option>	
						<%	}
						%>
						<option value="All">All</option>  
             
					</select>
				</td>
				
				<td align="center"> <font color="blue" size="2"> <%=msg %> </font>
				<div align="left">
				<%-- <a href="excelremdelvehs.jsp?transp=<%=transp%>&delrem=<%=thename %>&calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> 
				 --%></td>
				</tr>
				
				<tr>
				<td>
				<form name="form1" id="form1" action="" method="post">
				<table width="70%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" id="radio1"  align="left" value="TempRemove" <% if(thename.equals("TempRemove")) { out.print("CHECKED"); } %> onclick="fun2();" >Temporary Removed
				<input type="radio" name="radio1" id="radio1"  align="left" value="PerRemove" <% if(thename.equals("PerRemove")) { out.print("CHECKED"); } %> onclick="fun2();">Permanent Removed				
				</td>
				<td><input type="text" id="calender" name="calender" size="13" class="formElement"  style="height:18px; width:80px; text-align: center;font-size : 12px;" value="<%=fromdate%>" readonly/>
             <input type="button" name="trigger" id="trigger"  style="height:22px; width:80px; font-size : 12px;" value="From Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="text" id="calender1" name="calender1" size="13" class="formElement" style="height:18px; width:80px; text-align:center;font-size : 12px;"value="<%=todate%>" readonly/>
             <input type="button" name="trigger1" id="trigger1"style="height:22px; width:80px; font-size : 12px;"  value="To Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script></td> &nbsp;&nbsp;
				<td><input type="submit" name="button"  value="Submit" style="height:22px; width:80px; font-size : 12px;" onclick="return chk();"  class="formElement"></td>
				</tr>
								
				</table>	
				</form>	
						
				</td>
				</tr>
	</table>
	<%
	
	if(!(null==thename))
	{
	if(thename.equals("TempRemove"))
	{
	
		%>
		
		<table  width="1099px">
		<input type="hidden" name="radio2" id="radio2"  value="Temporary Removed ">
		<tr><td align="center" ><font color="brown" size="2">Temporary Removed Units from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></td></tr>
		</table>
		<div class="form" style="width:1091px;color: black;">
		<table id="example" class="display" a style="width: 100%"
				cellspacing="0" border="1" >
				<thead  >
				
		    <tr >
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Sr No</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Transp</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Vehicle No </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Unit Id </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Temp Rem Date</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Removal Comment</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Unit With </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Received Status </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Removed By</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> QT Status </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> QT Date </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> QT Comment </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> QT Done By</th>
		</tr>
		</thead>
		<tbody>
		<%	
		int i=1;
		String status;
		String qtd="-",qtcmnt="-",qtby="-",qtstatus=null,dispdate="";
		if(transp ==null)
		{
		transp="All";
		}
		%>
		 <script>
		    document.getElementById("transp").value='<%out.print(transp); %>';
		    
		    </script>
<%
		 if(transp.equals("All"))
			 {
		    	 transp="%%";
			 }



		if(transp==null || transp.equals("All"))
		{	
			sql2="select * from t_unitreplacement where InstType='Rem' and EntDate between '"+fromdate+"' and '"+todate+"' order by EntDate asc,Ownername asc";
		}
		else
		{
			sql2="select * from t_unitreplacement where InstType='Rem' and Ownername like '"+transp+"%' and EntDate between '"+fromdate+"' and '"+todate+"' order by  EntDate asc,OwnerName asc";
		} 
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next())
		{ 
			String owner=rs2.getString("OwnerName");
			owner=owner.substring(0,owner.length()-3);
		%>
			<tr>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=i %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=owner %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=rs2.getString("VehRegNo") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=rs2.getString("OldUnitId") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate"))) %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=rs2.getString("Comment") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%=rs2.getString("OldUnitWith") %></td>
				<%
				sql4="select * from t_unitreceived where UnitId = '"+rs2.getString("OldUnitId")+"' and Rdate >= '"+rs2.getString("EntDate")+"' ";
				rs4 = stmt4.executeQuery(sql4);
				if(rs4.next())
				{
					status = "YES";
				}
				else
				{
					status = "NO";
				}
				
				
				sql6="select DispDate from t_unitmasterhistory where UnitId = '"+rs2.getString("OldUnitId")+"' and Status = 'Dispatched' and DispDate >= '"+rs2.getString("EntDate")+"'";
				rs6 = stmt6.executeQuery(sql6);
				if(rs6.next())
				{
					dispdate=rs6.getString("DispDate"); 
					status="YES";
				}
				
				sql5="select * from hwunittest where UnitID = '"+rs2.getString("OldUnitId")+"' and (TheDate between '"+rs2.getString("EntDate")+"' and '"+dispdate+"' or TheDate > '"+rs2.getString("EntDate")+"')";
				rs5 = stmt5.executeQuery(sql5);
				if(rs5.next())
				{
					qtstatus="YES";
					status="YES";
					qtd=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs5.getString("TheDate")));
					qtcmnt=rs5.getString("SWComment");
					qtby=rs5.getString("User");
					
				}
				else
				{
					qtstatus="NO";
					qtd="-";
					qtcmnt="-";
					qtby="-";
				}
				%>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=status %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=rs2.getString("EntBy") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtstatus %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=qtd %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtcmnt %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtby %></td>
				
				
				
				
			</tr>	
			
		<%
			i++;	}
			%>
			
		
			
		</tbody>
			</table>
	</div>
	<%	
	}
		
	
	else
	{
		%>
		<table width="1100px">
		<input type="hidden" name="radio2" id="radio2"  value="Permanent Removed ">
		<tr><td align="center"><font color="brown" size="2">Permanent Removed Units from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></td></tr>
		</table>
		<div class="form" style="width:1091px; color: black;">
		<table id="example" class="display" a style="width: 100%"
				cellspacing="0" border="1" >
				<thead >
		
		<tr >
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Sr No</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Transp</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Vehicle No </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Unit Id </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Permanent Rem Date</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Temp Removal Date</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Removal Comment</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Unit With </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Received Status </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> Removed By</th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> QT Status </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> QT Date </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> QT Comment </th>
				<th style="font-size: 14px; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left;color: black;  background-color: #e6e6e6 ;"> QT Done By</th>
		</tr>
		</thead>
		<tbody>
		<%	
		int i=1;
		String status1;
		String trd=null,unid=null,unid1=null,unitid=null;
		String qtd1="-",qtcmnt1="-",qtby1="-",qtstatus1=null,dispdate1="";
		if(transp==null || transp.equals("All"))
		{	
			sql2="select * from t_unitreplacement where InstType='Del' and EntDate between '"+fromdate+"' and '"+todate+"' order by Ownername asc";
		}
		else
		{
			sql2="select * from t_unitreplacement where InstType='Del' and Ownername like '"+transp+"%' and EntDate between '"+fromdate+"' and '"+todate+"' order by OwnerName asc ";
		} 
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next())
		{ 
			String owner=rs2.getString("OwnerName");
			owner=owner.substring(0,owner.length()-3);
			unid=rs2.getString("OldUnitId");
		%>
			<tr>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=i %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=owner %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=rs2.getString("VehRegNo") %></td>
				<%
				sql3="select * from t_unitreplacement where VehRegNo = '"+rs2.getString("VehRegNo")+"' and EntDate < '"+rs2.getString("EntDate")+"' order by EntDate Desc limit 1";
				rs3 = stmt3.executeQuery(sql3);
				if(rs3.next())
				{
					trd= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs3.getString("EntDate")));
					unid1=rs3.getString("OldUnitId");
				}
				else
				{
					trd ="-";
				}
				if(unid.equals("-") || null==unid)
				{
					unitid = unid1;
				}
				else
				{
					unitid = unid;
				}
				%>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%=unitid %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate"))) %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%=trd %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=rs2.getString("Comment") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%=rs2.getString("OldUnitWith") %></td>
				<%
				sql4="select * from t_unitreceived where UnitId = '"+unitid+"' and Rdate >= '"+rs2.getString("EntDate")+"' ";
				rs4 = stmt4.executeQuery(sql4);
				if(rs4.next())
				{
					status1 = "YES";
				}
				else
				{
					status1 = "NO";
				}
				
				sql6="select DispDate from t_unitmasterhistory where UnitId = '"+rs2.getString("OldUnitId")+"' and Status = 'Dispatched' and DispDate >= '"+rs2.getString("EntDate")+"'";
				rs6 = stmt6.executeQuery(sql6);
				if(rs6.next())
				{
					dispdate1=rs6.getString("DispDate"); 
					status1="YES";
				}
				
				sql5="select * from hwunittest where UnitID = '"+rs2.getString("OldUnitId")+"' and (TheDate between '"+rs2.getString("EntDate")+"' and '"+dispdate1+"' or TheDate > '"+rs2.getString("EntDate")+"')";
				rs5 = stmt5.executeQuery(sql5);
				if(rs5.next())
				{
					qtstatus1="YES";
					status1="YES";
					qtd1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs5.getString("TheDate")));
					qtcmnt1=rs5.getString("SWComment");
					qtby1=rs5.getString("User");
					
				}
				else
				{
					qtstatus1="NO";
					qtd1="-";
					qtcmnt1="-";
					qtby1="-";
				}
				
				
				
				%>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=status1 %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=rs2.getString("EntBy") %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtstatus1 %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"> <%=qtd1 %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtcmnt1 %></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="left"> <%=qtby1 %></td>
			</tr>	
		<%
			i++;	
		}	
	
	}
	}
	%>
	</tbody>
	</table>
	</div>
	<%	
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
</body>

<!-- code end here --->

 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</body>
</html>
