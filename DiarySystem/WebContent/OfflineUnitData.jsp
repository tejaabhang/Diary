<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
    <%@ page import="java.sql.PreparedStatement"  %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
	<%@ include file="header.jsp"%>
	
<%@page import="java.sql.ResultSet"%>
<%!
Connection conn;
Statement st1,st2,st3,st4,st5;
String query1,query2,query3,query4,query5;
%>

<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Vehicle Offline Unit Data Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<link href="css/select2.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/select2.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">

<script type="text/javascript">
$(document).ready(function(){
    // Initialize select2	
    $("#operator").select2();
});
</script>

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
	                        title: 'Offline Unit Data'
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Offline Unit Data'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Offline Unit Data'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Offline Unit Data'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Offline Unit Data'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
	    	
	    } );
	} );

</script>
<script type="text/javascript">

function confirmSubmit()
{
	
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	//var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	
	if(operator=="select") 
		{			
			alert("Please select Owner!");
		return false;
		}
	
	
	
return true;	
}
</script>
<script type="text/javascript">
function goToFullExcel(operator,calender,calender1) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?date1="+date1+"&date2="+date2+"Operator="+owner;	
}

function gotoExcel(elemId,frmFldId)  
{  
	   alert(">>>>");   
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.SimmasterReport.action ="excel.jsp";
          document.forms["SimmasterReport"].submit();
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
</head>


<body>
<div id="wrapper">
<div id="logo">
<h1><img src="images/Transworld.gif"></h1>
<p>We care about your Vehicles</p>
</div>
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 

<%

java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("dd-MM-yyyy");
Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

////System.out.println("----------------------------------------------------------------------???<_>"+inputtype);


java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("dd-MM-yyyy");
String today=formatter.format(dte);

java.util.Date dte1 = new java.util.Date();
Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
String today1=formatter.format(dte);


String owner = request.getParameter("operator");
String datenew1="";
String datenew2="";
String dataDate11="";


//datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
/* String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
dt=dt;

String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));

dt1=dt1; */

String fromdate=request.getParameter("calender");

String todate=request.getParameter("calender1");

if(request.getParameter("calender")!=null)
{
  datenew1=request.getParameter("calender");
  datenew2=request.getParameter("calender1");
}
else
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());


try{
	System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st1=conn.createStatement();
    st2=conn.createStatement();
    st3=conn.createStatement();
    st4=conn.createStatement();
    st5=conn.createStatement();
    
	}catch(Exception E){
	System.out.println(""+E);
	}	
	ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=10;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;

    if(iPageNo==0)
    {
        iPageNo=0;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    
    System.out.println("Connection Created");
    
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3"><b>Vehicle Offline Unit Data Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br />
<form name="unit" id ="unit" method="post" onsubmit="return confirmSubmit();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">          	
			<tr  bgcolor="#BDBDBD"> 
			 	<td align="center"><font size="2"><b>FromDate</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<input type="text" id="calender" name="calender" size="07" value="<%=datenew1%>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%d-%b-%Y",     // the date format
		                    button      : "calender"       // ID of the button
		               }
		                             );
	          	    </script>	 
					</div> 
				</td>
				<td align="center"><font size="2"><b>ToDate</b></font>
				</td>
				<td align ="center">
					<div>
					<input type="text" id="calender1" name="calender1" size="07" value="<%=datenew2 %>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "calender1",         // ID of the input field
			                    ifFormat    : "%d-%b-%Y",     // the date format
			                    button      : "calender1"       // ID of the button
			               }
			                             );
              		 </script>	
					</div>
				</td>
					<td align="center"><font size="2"><b>Owner</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 								
								<%
									if(owner==null)
									{
									%>
									<option value="All" selected="selected" >All</option>
									<%
					            	query1 = "select DISTINCT(OwnerName) as operator  from db_gps.t_vehicledetails where status= '-' order by OwnerName asc";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option>
									<%} 
									}else{
										%>
										<option value="All" >All</option><%
										query1 = "select DISTINCT(OwnerName) as operator  from db_gps.t_vehicledetails where status= '-' order by OwnerName asc";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("operator").equals(owner))
											{
												%><option value="<%=rs1.getString("operator") %>" selected><%=rs1.getString("operator")%></option><%
											}else{
												%><option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option><%
											}
									    } 
									}
									%>
							</select>
					</div> 
				</td>
	        <td align ="center">	        
	        	<input type="submit" name="sub" id="sub" value="submit" onclick="return fun()" style="background: #E6E6E6;"/>
	        </td>
		</tr>
	</table>
</form>
<br />		
</div>

<div id="gbox-bot1"></div>
</div>
</div>	
<%
	
	System.out.println("The Date 1 is  :"+fromdate);
	System.out.println("The Date 2 is :"+todate);
	System.out.println("operator is :"+owner);
	
	DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
	String dataDate1=df1234.format(df123.parse(datenew1));
	String dataDate2=df1234.format(df123.parse(datenew2));
	
	String dt = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(datenew1));
			dt=dt;
			
			String dt1 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(datenew2));

			dt1=dt1;
			
			System.out.println("Date1 After Format : "+dt);
			System.out.println("Date2 After Format : "+dt1);
%>



<% 
String Bt = request.getParameter("sub");

if(Bt==null || Bt=="null" || Bt.equals("null") || (owner=="All" || owner.equalsIgnoreCase("All")))
//if(operator.equals("null") || status.equals("null") || operator==null || status==null )
{
owner ="All";

String sqlData="select a.UnitId as UnitId,concat(date_format(b.TheDate,'%d-%b-%Y'),' ',"
		 +"time_format(b.TheTime, '%H:%i:%s')) as LastUpdate,"
			+"b.Location  as Location,c.SimCompany as ServiceProvider,c.MobNo as MobileNo,c.typeunit as UnitType," 
			+"c.QCBy as QCBy, c.EntBy as EntBy, concat(date_format(c.DispDate,'%d-%b-%Y'),' ',"
			+"time_format(c.DispTime, '%H:%i:%s')) as Dispatched ,a.VehicleRegNumber as Vehicle,"
			+"a.OwnerName as OwnerName "
			+"from db_gps.t_vehicledetails a ,"
			+"db_gps.t_onlinedata b,db_gps.t_unitmaster c  "
			+"where a.status='-' and a.OwnerName like '%%' and "
			+"a.vehiclecode=b.vehiclecode and c.unitid=a.unitid  and b.TheDate >='"+dt+"' "
			+"and b.TheDate <='"+dt1+"'";
ResultSet rs4 = st1.executeQuery(sqlData);
	
System.out.println("Query is : "+sqlData);
%>

<div class="row">
<table id="example" class="display " style="border: 1px solid black; width: 100px;" cellspacing="0">
        <thead>
            <tr>
                <th>Sr.No</th>
                <th>Vehicle</th>
                <th>Owner</th>
                <th>UnitId</th>
                <th>Updated</th>
                <th>Location</th>
                <th>Service Provider</th>
                <th>MobNo</th>
                <th>UnitType</th>
                <th>Dispatched</th>
                <th>QCBy</th>
                <th>EntBy</th>
            </tr>
        </thead>
      
        <tbody>
        
        <%
        int i=1;
        while(rs4.next())
    	{
        	String Vehicle = rs4.getString("Vehicle");
        	String OwnerName = rs4.getString("OwnerName");
        	String UnitId = rs4.getString("UnitId");
        	String LastUpdate = rs4.getString("LastUpdate");
        	String Location = rs4.getString("Location");	
        	String ServiceProvider = rs4.getString("ServiceProvider");
        	String MobileNo= rs4.getString("MobileNo");
        	//String CodeVersion= rs4.getString("CodeVersion");
        	String UnitType= rs4.getString("UnitType");
        	String Dispatched= rs4.getString("Dispatched");
        	String QCBy= rs4.getString("QCBy");
        	String EntBy= rs4.getString("EntBy");
        	
        %>
            <tr>
                <td><%=i %></td>
                <td><%=Vehicle %></td>
                <td><%=OwnerName%></td>
                <td><%=UnitId%></td>
                <td><%=LastUpdate%></td>
                <td><%=Location%></td>
                <td><%=ServiceProvider %></td>
                <td><%=MobileNo %></td>
                
                 <td><%=UnitType %></td>
                 <td><%=Dispatched %></td>
                <td><%=QCBy %></td>
                 <td><%=EntBy %></td>
            </tr>
            
        <%
        i++;
    	} %>    
           
           
            
        </tbody>
    </table>
</div>
 <% }else{
	
	 String sqlData="select a.UnitId as UnitId,concat(date_format(b.TheDate,'%d-%b-%Y'),' ',"
			 +"time_format(b.TheTime, '%H:%i:%s')) as LastUpdate,"
				+"b.Location  as Location,c.SimCompany as ServiceProvider,c.MobNo as MobileNo,c.typeunit as UnitType," 
				+"c.QCBy as QCBy, c.EntBy as EntBy, concat(date_format(c.DispDate,'%d-%b-%Y'),' ',"
				+"time_format(c.DispTime, '%H:%i:%s')) as Dispatched ,a.VehicleRegNumber as Vehicle,"
				+"a.OwnerName as OwnerName "
				+"from db_gps.t_vehicledetails a ,"
				+"db_gps.t_onlinedata b,db_gps.t_unitmaster c  "
				+"where a.status='-' and a.OwnerName = '"+owner+"' and "
				+"a.vehiclecode=b.vehiclecode and c.unitid=a.unitid  and b.TheDate >='"+dt+"' "
				+"and b.TheDate <='"+dt1+"'";
	


	 ResultSet rs4 = st1.executeQuery(sqlData);
	 	
	 System.out.println("Query is : "+sqlData);
	 %>


	 <table id="example" class="display " width="100%" cellspacing="0">
	         <thead>
	             <tr>
	            <th>Sr.No</th>
                <th>Vehicle</th>
                <th>Owner</th>
                <th>UnitId</th>
                <th>Updated</th>
                <th>Location</th>
                <th>Service Provider</th>
                <th>MobNo</th>
                <th>UnitType</th>
                <th>Dispatched</th>
                <th>QCBy</th>
                <th>EntBy</th>
	             </tr>
	         </thead>
	       
	         <tbody>
	         
	         <%
	         int i=1;
	         while(rs4.next())
	     	{
	         	String Vehicle = rs4.getString("Vehicle");
	        	String OwnerName = rs4.getString("OwnerName");
	        	String UnitId = rs4.getString("UnitId");
	        	String LastUpdate = rs4.getString("LastUpdate");
	        	String Location = rs4.getString("Location");	
	        	String ServiceProvider = rs4.getString("ServiceProvider");
	        	String MobileNo= rs4.getString("MobileNo");
	        	//String CodeVersion= rs4.getString("CodeVersion");
	        	String UnitType= rs4.getString("UnitType");
	        	String Dispatched= rs4.getString("Dispatched");
	        	String QCBy= rs4.getString("QCBy");
	        	String EntBy= rs4.getString("EntBy");
	        	
	        %>
	            <tr>
	                <td><%=i %></td>
	                <td><%=Vehicle %></td>
	                <td><%=OwnerName%></td>
	                <td><%=UnitId%></td>
	                <td><%=LastUpdate%></td>
	                <td><%=Location%></td>
	                <td><%=ServiceProvider %></td>
	                <td><%=MobileNo %></td>
	                
	                 <td><%=UnitType %></td>
	                 <td><%=Dispatched %></td>
	                <td><%=QCBy %></td>
	                 <td><%=EntBy %></td>
	            </tr>
	            
	             
	         <%
	         i++;
	     	} %>    
	            
	             
	         </tbody>
	     </table>

<%} %>





<div id="copyright">Copyright &copy; 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>
<%
    try{
         if(psPagination!=null){
             psPagination.close();
         }
         if(rsPagination!=null){
             rsPagination.close();
         }
         
         if(psRowCnt!=null){
             psRowCnt.close();
         }
         if(rsRowCnt!=null){
             rsRowCnt.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>