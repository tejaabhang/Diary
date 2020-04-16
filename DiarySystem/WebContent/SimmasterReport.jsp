<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
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
<title>Sim Master Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<!-- <script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
 -->
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
	                        title: 'Sim Master Report',
	                        
	                        	                        
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Sim Master Report',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Sim Master Report',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Sim Master Report',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Sim Master Report',
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All",10, 25, 50, 100 ]],
	        
	    	
	    	
	    	
	    } );
	} );


</script>

<script type="text/javascript">

function confirmSubmit()
{
	//alert("hi");
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	var plan= document.getElementById("plan").options[document.getElementById("plan").selectedIndex].value;
	if(operator=="select") 
		{			
			alert("Please select Service Provider!");
		return false;
		}
	if(status=="select") 
	{			
		alert("Please select Status!");
	return false;
	}
	if(plan=="select") 
	{			
		alert("Please select Plan!");
	return false;
	}
	
return true;	
}
</script>
<!-- <script type="text/javascript">
function goToFullExcel(operator,status,plan) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>"+plan+">>>>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?operator="+operator+"&status="+status"&plan="+plan;	
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
</script> -->
<style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid #ddd;
    padding: 16px;
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


<body style="background-color: #FFFFFF;">
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
String operator = request.getParameter("operator");
String status = request.getParameter("status");
String plan = request.getParameter("plan");

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
    //String zeroDateTimeBehavior=convertToNull;
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
				<tr><td align="center"><font color="black" size="3">Sim Master Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br />
<form name="unit" id ="unit" method="post" onsubmit="return confirmSubmit();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">          	
			<tr  bgcolor="#BDBDBD"> 
			 	<td align="center"><font size="2"><b>Operator</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 								
								<%
									if(operator==null)
									{
									%><option value="select" >select</option>
									<option value="All">All</option>
									<%
					            	query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-' AND Service_provider <> ''";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option>
									<%} 
									}else{
										%><option value="select" >select</option>
											<option value="All">All</option><%
										query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-'  AND Service_provider <> ''";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("operator").equals(operator))
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
				<td align="center"><font size="2"><b>Status</b></font>
				</td>
				<td align ="center">
					<div>
							<select class="element select medium" id="status" name="status" style="width: 125px; height: 25px;" > 							
								<%
									if(status==null)
									{
									%><option value="select" >select</option>
									<option value="All">All</option>
									<%
					            	query2 = "select DISTiNCT(Status) as Status  from db_gps.t_simmaster where Status <> '-' AND Status <> ''";
									System.out.println("The query is :"+query2);
					             	ResultSet rs2 = st2.executeQuery(query2);
					             	while(rs2.next())
					              	{
								%>
									<option value="<%=rs2.getString("Status") %>" ><%=rs2.getString("Status")%></option>
								<%} 
									}else{
										%><option value="select" >select</option>
										<option value="All">All</option><%
										query1 = "select DISTiNCT(Status) as Status  from db_gps.t_simmaster where Status <> '-'  AND Status <> ''";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("status").equals(status))
											{
												%><option value="<%=rs1.getString("status") %>" selected><%=rs1.getString("status")%></option><%
											}else{
												%><option value="<%=rs1.getString("status") %>" ><%=rs1.getString("status")%></option><%
											}
									    }
									}
								%>
								
							</select>
					</div>
				</td>
				<td align="center"><font size="2"><b>Plan</b></font>
				</td>
				<td align ="center">
					<div>
							<select class="element select medium" id="plan" name="plan" style="width: 210px; height: 25px;" > 
								<%
									if(plan==null)
									{
									%><option value="select" >select</option>
									<option value="All">All</option>
									<%
					            	query3 = "select DISTiNCT(Plan) as Plan  from db_gps.t_simmaster where Plan <> '-' AND Plan <> ''";
									System.out.println("The query is :"+query3);
					             	ResultSet rs3 = st3.executeQuery(query3);
					             	while(rs3.next())
					              	{
								%>
									<option value="<%=rs3.getString("Plan") %>" ><%=rs3.getString("Plan")%></option>
								<%}
									}else{
										%><option value="select" >select</option>
										<option value="All">All</option><%
										query1 = "select DISTiNCT(Plan) as Plan  from db_gps.t_simmaster where Plan <> '-'";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("plan").equals(plan))
											{
												%><option value="<%=rs1.getString("plan") %>" selected><%=rs1.getString("plan")%></option><%
											}else{
												%><option value="<%=rs1.getString("plan") %>" ><%=rs1.getString("plan")%></option><%
											}
									    }
									}
								%>
								
							</select>
					</div>
				</td>
	        <td align ="center">	        
	        	<input type="submit" name="sub" id="sub" value="submit" style="background: #E6E6E6;"/>
	        </td>
		</tr>
	</table>
</form>
<br />			
<%
	
	System.out.println("The operator is  :"+operator);
	System.out.println("The status is :"+status);
	System.out.println("The plan is :"+plan);
	
%>
<form name="SimmasterReport" id="SimmasterReport" action="" method="post">
		
		<%
		 String  exportFileName="simmaster_report.xls";
		%>
		<table width="750px" border="0" align="center">
		<tr>
			
			<%
				try{
				

					if(operator.equals("All") && status.equals("All") && plan.equals("All")){
						
						query5 ="select count(*) as count from db_gps.t_simmaster where  Service_provider like '%%' AND Status like '%%' AND Plan  like '%%'";
							
					}
						else if(operator.equals("All") && status.equals("All") && !(plan.equals("All"))){
							
							query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider like '%%' AND Status like '%%' AND Plan   = '"+plan+"'  ";
								
						}
						else if(operator.equals("All") && !(status.equals("All")) && plan.equals("All")){
							
							query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan  like '%%'  ";
								
						}
						else if(operator.equals("All") && !(status.equals("All")) && !(plan.equals("All"))){
							
							query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan  = '"+plan+"' ";
								
						}
						else if(!(operator.equals("All"))&& status.equals("All") && plan.equals("All")){
					 
							query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan  like '%%' ";
										
						}
						else if(!(operator.equals("All"))&& status.equals("All") && !(plan.equals("All"))){
							
							query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan  = '"+plan+"' ";
									
								}
						else if(!(operator.equals("All"))&& !(status.equals("All")) && plan.equals("All")){
							
							query5 ="select count(*) as count from db_gps.t_simmaster   where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan  like '%%' ";
										
								}
						else {
						query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan = '"+plan+"' ";
						}
					
						ResultSet rs5=st5.executeQuery(query5);
						System.out.println("The query is ==>>"+query5);
						if(rs5.next())
						{
							String count=rs5.getString("count");
							
							%>								
				 <td  align="left"><b>Total Records :</b>&nbsp;&nbsp;&nbsp;<%= count%></td>								
				 	<%
								
						}
					}catch(Exception e) {
						System.out.println("The Exception is ==>>"+e);
				}
				%>
											
						
			<td  align="left"><b>Operator :</b>&nbsp;&nbsp;&nbsp;<%= operator %></td>
			<td  align="left"><b>Status :</b>&nbsp;&nbsp;&nbsp;<%= status %></td>
			<td  align="left"><b>Plan :</b>&nbsp;&nbsp;&nbsp;<%= plan %></td>
			<td>

			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
							<!-- <div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{goToFullExcel();}catch(e){alert(e);}">Full Excel</a>
							<a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{gotoExcel('table1','tableHTML');}catch(e){alert(e);}">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"/></a></div>
    -->     	</td>
		</tr>		
		</table>
		<div class="form" style="width:750px;color: black;">
		<table id="example" width="750px" border="0" align="center">
 <!-- <table id="example"  class="display" a style="width:100%" cellspacing="0" border="0.8" >
 -->				<thead  >
	  <tr>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">Sr No</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #e6e6e6 ; color: black;">Sim No</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #e6e6e6 ; color: black;">Mob No</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #e6e6e6 ; color: black;">Date Of Purchase</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #e6e6e6 ; color: black;">Purchase No</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #e6e6e6 ; color: black;">Status</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">Service Provider</th>
	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;">Plan</th>
	</tr>
	</thead>
	<tbody>
	<%
	try{
	int count =0;
	count = iPageNo;String sqlPagination="";
		System.out.println("The dat");
		if((operator.equals(null)))
		{
		operator="select";
		}
		if((status.equals(null)))
		{
		status="select";
		}
		if((plan.equals(null)))
		{
		plan="All";
		}  
		
		/* if((operator.equals(null))&& !(operator.equals("select")))
		{
		operator="All";
		}
		if((status.equals(null))&& !(status.equals("select")))
		{
		status="All";
		}
		if((plan.equals(null))&& !(plan.equals("select")))
		{
		plan="All";
		}  */
		%>
		 <script>
		    document.getElementById("operator").value='<%out.print(operator); %>';
		    
		    </script>
		     <script>
		    document.getElementById("status").value='<%out.print(status); %>';
		    
		    </script>
		     <script>
		    document.getElementById("plan").value='<%out.print(plan); %>';
		    
		    </script>
		<%
		 		 
		if(operator.equals("All") && status.equals("All") && plan.equals("All")){
		 //sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider like '%%' AND Status like '%%' AND Plan  like '%%' ";
			sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider like '%%' AND Status like '%%' AND Plan like '%%' ";
			
		
		}
		else if(operator.equals("All") && status.equals("All") && !(plan.equals("All"))){
			// sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider like '%%' AND Status like '%%' AND Plan   = '"+plan+"' ";
			 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider like '%%' AND Status like '%%' AND Plan = '"+plan+"'   ";
					
		
		}
		else if(operator.equals("All") && !(status.equals("All")) && plan.equals("All")){
			// sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan  like '%%' ";
			 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan  like '%%'   ";
					
		}
		else if(operator.equals("All") && !(status.equals("All")) && !(plan.equals("All"))){
			// sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan  = '"+plan+"' ";
			 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider like '%%' AND Status = '"+status+"' AND Plan = '"+plan+"'   ";
						
		}
		else if(!(operator.equals("All"))&& status.equals("All") && plan.equals("All")){
	// sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan  like '%%' ";
	 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan like '%%'  ";
				
		}
		else if(!(operator.equals("All"))&& status.equals("All") && !(plan.equals("All"))){
			// sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan  = '"+plan+"'  ";
			 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status like '%%' AND Plan = '"+plan+"'   ";
							
				}
		/* else if(!(operator.equals("All"))&& !(status.equals("All")) && plan.equals("All")){
			 sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan  like '%%' ";
						
				} */
		else if(!(operator.equals("All"))&& !(status.equals("All")) && plan.equals("All")){
			 sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan  like '%%'   ";
						
				}
		else
		{
			//sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan  = '"+plan+"' ";
			sqlPagination="SELECT  Simno,Mobno,CASE WHEN DateOfPurchase='0000-00-00' THEN '-' WHEN DateOfPurchase is NULL THEN '-' ELSE DateOfPurchase END as DateOfPurchase ,PurchaseNo,Status,Service_provider,Plan from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' AND Plan = '"+plan+"'   ";
			
		}
		psPagination=conn.prepareStatement(sqlPagination);
		rsPagination=psPagination.executeQuery();

		System.out.println("The query is :"+sqlPagination);

	////this will count total number of rows
		String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
		psRowCnt=conn.prepareStatement(sqlRowCnt);
		rsRowCnt=psRowCnt.executeQuery();

		if(rsRowCnt.next())
		 {
		    iTotalRows=rsRowCnt.getInt("cnt");
		 }
		%>
		
				<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
		<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
		<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
		
		<%
			while(rsPagination.next())
			{
				String Simno=rsPagination.getString("Simno");
				String Mobno=rsPagination.getString("Mobno");
				/* prvPaymentDate = (rs.getDate(1) != null) ? rs.getDate(1).toLocalDate() : null;    // Checks if it comes as a Null or a Real java.sql.Date object.
				if (prvPaymentDate != null)
			        System.out.println("date "+prvPaymentDate.toString());
			 */	
			 
			 
			 String DateOfPurchase = rsPagination.getString("DateOfPurchase");
				if(DateOfPurchase.equals(null) || DateOfPurchase==null || DateOfPurchase =="" || DateOfPurchase.equals("NULL")|| DateOfPurchase=="NULL" || DateOfPurchase.equals("null")||DateOfPurchase.equals("-"))
				{
					DateOfPurchase="-";
				}
				/* DateOfPurchase=(rsPagination.getString("DateOfPurchase") != null) ? rsPagination.getString("DateOfPurchase") : null; 
				
				if (DateOfPurchase != null){
					DateOfPurchase=DateOfPurchase.toString();
				}
				else{Simno,Mobno,DateOfPurchase,PurchaseNo,Status,Service_provider,Plan
					DateOfPurchase=null;
				}
					 */	
				
				System.out.println("Date of Purchase is:" + DateOfPurchase);
				String PurchaseNo = rsPagination.getString("PurchaseNo");
				String Status = rsPagination.getString("Status");
				String Service_provider = rsPagination.getString("Service_provider"); 
				String Plan = rsPagination.getString("Plan");				
				%>
					<tr>
					<td align =right><%=++count %></td>
					<td align =right><%=Simno %></td>
					<td align =right><%=Mobno %></td>
					<%if(DateOfPurchase.equals("-")||DateOfPurchase.equals(null) || DateOfPurchase==null || DateOfPurchase ==""||DateOfPurchase.equals("NULL")||DateOfPurchase=="-")
						{
						%>
						<td align =center>-</td><%
								
						}
					else
					{
						%>
				<td align =center><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DateOfPurchase)) %></td>
					
					<%} %>
					<td align =right><%=PurchaseNo %></td>
					<td align =left><%=Status %></td>
					<td align =left><%=Service_provider %></td>
					<td align =left><%=Plan %></td>
				
				<%				
	}//end while  */

		  //// calculate next record start record  and end record 
		        try{
		            if(iTotalRows<(iPageNo+iShowRows))
		            {
		                iEndResultNo=iTotalRows;
		            }
		            else
		            {
		                iEndResultNo=(iPageNo+iShowRows);
		            }
		           
		            iStartResultNo=(iPageNo+1);
		            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
		        
		        }
		        catch(Exception e)
		        {
		            e.printStackTrace();
		        }	
		
	}catch(Exception e) {
		System.out.println("The Exception is =>>>"+e);
	}
	%>
	</tbody>
	</table><br>
</div>
</form>
<%-- <table width="750"  style="background: #E6E6E6">
		<tr>
		<td colspan="3" align ="left"><a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit">First Page</a></td>
   <td colspan="3" align ="center">
<div>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit&iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit&iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit&iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit&iPageNo=<%=i%>&cPageNo=<%=i%>"> Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
</div>
</td>
  <td colspan="3" align ="right"><a href="SimmasterReport.jsp?operator=<%=operator%>&status=<%=status%>&plan=<%=plan%>&Submit=Submit&iPageNo=<%=iTotalPages%>">Last Page</a></td> 
   </tr>
		
		</table> --%>

</div>

<div id="gbox-bot1"></div>
</div>
</div>
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
