<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!Connection conn, conn1;
	Statement st, st1, st2, st3, st33, st4, st5, st6, st7, st8, st9, st10,
			st11, st51, stInspection,st111;
	String sql, sql1, sql2, today, olddate, username, userrole, thename, sql3,
			sql33, sql4, sql5, sql6, sql7, sql8, sql9, sql10;
	String fromdate, todate,totalas="",tto="";
	int Ocount, Icount, CAcount, CAvcount = 0, CScount,CSrepcount, CPcount, URcount,
			NIcount, OCcount, ICcount, NCcount, RCAcount, SPcount, inspcount,
			realtcount, cstcount, cstcmpcount,URrepcount,IStrcstcount,IStrrepcount,CSrealctncount,CSpendtrcount,SPrepcount,CSreptrcount,NIrepcount,CAvehcount,RCAvehcount,CSrep1count,CSrep2count,CPndcount,realtrepcount,ISrepcount,ISrep1count;
	double avgdurtn;
	float SPcptpercount =0.0f,SPcptbillcount = 0.0f;
	double avg,aks;
	String ak= "";
	%>
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
	<script language="javascript">
	function fun2()
	{	
		document.form1.submit();
	}	
	</script>
	
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet" type="text/css">
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
	                        title: 'Daily Report of Technician',
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Daily Report of Technician',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Daily Report of Technician',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Daily Report of Technician',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Daily Report of Technician',
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]]
	    	
	    } );
	} );

</script>
	
	<script type="text/javascript">
 $(document).ready(function() {
	    $('#example1').DataTable( {

	    	"pagingType": "full_numbers",
	        dom: 'Blfrtip',

	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Daily Report of Representative',
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Daily Report of Representative',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Daily Report of Representative',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Daily Report of Representative',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Daily Report of Representative',
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]]
	    	
	    } );
	} );

</script>

<script type="text/javascript">
 $(document).ready(function() {
	    $('#example2').DataTable( {

	    	"pagingType": "full_numbers",
	        dom: 'Blfrtip',

	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Daily Report of Transporter',
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Daily Report of Transporter',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Daily Report of Transporter',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Daily Report of Transporter',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Daily Report of Transporter',
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
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
Ocount=0;
Icount=0;
CAcount=0;
int CINcount=0;
CAvcount=0;
CScount=0;
CSrepcount=0;
CPcount=0;
URcount=0;
CSreptrcount =0;
CAvehcount =0;
CSpendtrcount= 0;
CSrealctncount =0;
IStrrepcount = 0;
NIcount=0;
NIrepcount=0;
IStrcstcount = 0;
OCcount=0;
ICcount=0;
SPrepcount=0;
URrepcount=0;
NCcount=0;
CSrep1count=0;
CSrep2count=0;
CPndcount=0;
RCAcount=0;
realtrepcount=0;
ISrepcount=0;
ISrep1count=0;
inspcount=0;
RCAvehcount=0;
realtcount=0;
cstcount=0;
cstcmpcount=0;
avgdurtn=0.00;
avg=0.00;
aks = 0.00;
int IScount=0,totalsec =0;
SPcount=0;
int CTCcount=0;
int CTcount=0;
String loop="";
float  monthdays=0.0f;
float  monthdays1=0.0f;
  try
   {
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	stInspection = conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st33=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn.createStatement();
	st6=conn.createStatement();
	st7=conn.createStatement();
	st111=conn.createStatement();
	st8=conn.createStatement();
	st9=conn1.createStatement();
	st10=conn1.createStatement();
	st11=conn.createStatement();
	st51=conn.createStatement();
	//st51=conn.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	thename=request.getParameter("radio1");
	
	String tech="";
	if(null==fromdate)
	{
	fromdate=today;
	todate=today;
	thename="Technician";
	}
	%>
			<table border="0" width="750px" align="center">
				<tr>
				<td>
				<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" id="technician" value="Technician" <% if(thename.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun2();" />Technician
				<input type="radio" name="radio1" id="Reprsentative" value="Representative" <% if(thename.equals("Representative")) { out.print("CHECKED"); } %> onclick="fun2();"/>Representative
				<input type="radio" name="radio1" id="Transporter" value="Transporter" <% if(thename.equals("Transporter")) { out.print("CHECKED"); } %> onclick="fun2();"/>Transporter				
				<input type="hidden" value="Technician" id="technician">	
				<input type="hidden" value="Reprsentative" id="Reprsentative">
				<input type="hidden" value="Transporter" id="Transporter">			
				</td>
				<td name="trigger" id="trigger" value="From Date" class="formElement"> From Date:&nbsp; 
             <input type="text" width="20" style="min-width:05em; " id="calender" name="calender" size="08" class="formElement" value="<%=fromdate%>" readonly/>
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></td>
				<td name="trigger1" id="trigger1" value="To Date" class="formElement"> ToDate:&nbsp;
				<input type="text" style="min-width:07em; " id="calender1" name="calender1" size="08" class="formElement" value="<%=todate%>" readonly/>
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script></td>
             
            
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
				<%-- <td colspan="" bgcolor="">  
					<div align="right">  <a href="dailyreport1excel.jsp?thename=<%=thename%>&loop=<%=loop %>&calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
			 --%>	
				</tr>
								
				</table>	
				</form>	
						
				</td>
				</tr>
				<tr>
				<td>
				<%
						
					if(!(null==thename))
					{
					if(thename.equals("Technician"))
					{
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table id="example" border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Solved without Replacement </td>
					<td>Comp. Pending</td>
					<td>Inspection</td>
					<td>Reallocation</td>
					<td>Cost of Complaint</td>
					<td>Cost of Inspection</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					<td>Special Report</td>
				 <td>Avg Closure Duration</td> 
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'" ;	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					
					while(rst.next())
					{
						tech=rst.getString("TechName");
					%>
					<tr>
					<td><div align="right"><%=i%></div></td>
					<td><%=rst.getString("TechName")%></td>
					<td><div align="right"><%=rst.getString("MobNo")%></div></td>
					
					<%
					sql="Select (select count(*) from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing') as count,(select count(*)  from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing') as count1 from t_callinformation limit 1";
					ResultSet rst1=st1.executeQuery(sql);	
					
					%>
					
					<%
					if(rst1.next())
					{
						%>
						<td><div align="right">
				    <%	
				    if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					%>
					</div>			
					</td>
					
					
					<td><div align="right">
				    <%	
				    if(rst1.getInt("count1") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count1")+"</a>");
					Icount=Icount+rst1.getInt("count1");
					}
					else
					{
					out.print(rst1.getString("count1"));
					}
					%>
					</div>			
					</td>
					
					
					
					<%
					}				
					%>		
					
			<%-- 		<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst2=st1.executeQuery(sql);	
					System.out.println("sql 2nd querry:-"+sql);
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>	
					</div>					
					</td> --%>
				
					<%
					//sql="Select (select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"'   and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'  and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as count,(select count(*) from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as count1,(select count(*)  from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  )) as count2,(SELECT count( * ) FROM ( SELECT DISTINCT (Tno), DofAllocation, Technicion, VehRegNo,STATUS , ActualProb FROM db_CustomerComplaints.t_callocation1 WHERE Technicion = '"+rst.getString("TechName")+"' AND ActualProb <> 'Unit Replace, Okay' AND VehAvailDate >= '"+fromdate+"' AND VehAvailDate <= '"+todate+"' AND STATUS = 'Solved' 	AND tno IN (SELECT tno FROM db_CustomerComplaints.t_complaints1  WHERE TdyDate 	BETWEEN '"+fromdate+"' AND '"+todate+"' 	AND inspection = 'No'  )GROUP BY Tno )a ) as count3,(select count(*) from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ) as count4  from t_callocation1 limit 1  ";
					
					//sql="Select (select count(distinct tno) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"'   and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'  and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as count,(select count(distinct tno) from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as count1,(select count(distinct tno)  from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  )) as count2,(SELECT count( * ) FROM ( SELECT DISTINCT (Tno), DofAllocation, Technicion, VehRegNo,STATUS , ActualProb FROM db_CustomerComplaints.t_callocation1 WHERE Technicion = '"+rst.getString("TechName")+"' AND ActualProb <> 'Unit Replace, Okay' AND VehAvailDate >= '"+fromdate+"' AND VehAvailDate <= '"+todate+"' AND STATUS = 'Solved' 	AND tno IN (SELECT distinct(tno) FROM db_CustomerComplaints.t_complaints1  WHERE TdyDate 	BETWEEN '"+fromdate+"' AND '"+todate+"' 	AND inspection = 'No'  )GROUP BY Tno )a ) as count3,(select count(distinct tno) from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and tno in (select distinct (tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ) as count4  from t_callocation1 limit 1  ";
					
					sql="Select "

+"(select count(distinct tno) as CompAllocated from db_CustomerComplaints.t_callocation1 where Technicion='"+rst.getString("TechName")+"'   and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'  and tno in "

+"(select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as  CompAllocated,"

+"(select count(distinct tno) from db_CustomerComplaints.t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No')) as VehicleAvailable,"

+"(select count(distinct tno)  from db_CustomerComplaints.t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  )) as CompSolved ,"

+"(SELECT count( * ) FROM ( SELECT DISTINCT (Tno), DofAllocation, Technicion, VehRegNo,STATUS , ActualProb FROM db_CustomerComplaints.t_callocation1 WHERE Technicion = '"+rst.getString("TechName")+"' AND ActualProb not like '%Replace%' AND VehAvailDate >= '"+fromdate+"' AND VehAvailDate <= '"+todate+"' AND STATUS = 'Solved' 	AND tno IN (SELECT distinct(tno) FROM db_CustomerComplaints.t_complaints1  WHERE TdyDate 	BETWEEN '"+fromdate+"' AND '"+todate+"' 	AND inspection = 'No'  )GROUP BY Tno )a ) as SolvedwithoutReplacement,"

+"(select count(distinct tno) from db_CustomerComplaints.t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and tno in (select distinct (tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ) as CompPending   "

+"from db_CustomerComplaints.t_callocation1 limit 1  ";
					
					ResultSet rst3=st1.executeQuery(sql);	
					System.out.println("sql---->" +  sql);
					int cntcomp=0;
					int vhavail=0;
					int csol=0;
					int csolrep=0;
					int cpend=0;
				
		         	while(rst3.next())
					{
						cntcomp=cntcomp+rst3.getInt("CompAllocated");
						vhavail=vhavail+rst3.getInt("VehicleAvailable");
						csol=csol+rst3.getInt("CompSolved");
						csolrep=csolrep+rst3.getInt("SolvedwithoutReplacement");
						cpend=cpend+rst3.getInt("CompPending");
					}
					
					System.out.println("cntcomp ---->"+cntcomp);
					System.out.println("vhavail ---->"+vhavail);
					System.out.println("csol ---->"+csol);
					System.out.println("csolrep ---->"+csolrep);
					System.out.println("cpend ---->"+cpend);
					
					%>
					<td>
					<div align="right">
					<%
					if(cntcomp >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cntcomp+"</a>");
					CAcount=CAcount+cntcomp;
					}
					else
					{
					out.print("0");
				    }
					%>
					</div>				
					</td>
						<td>
					<div align="right">
					<% 
					if(vhavail >0)
					{
					out.print("<a href='vehavail.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+vhavail+"</a>");
					CAvcount=CAvcount+vhavail;
					}
					else
					{
					out.print("0");
					}
					%>
						</div>				
					</td>
					<td>
					<div align="right">
				<% 
				    if(csol >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+csol+"</a>");
					CScount=CScount+csol;
					}
					else
					{
					out.print("0");
					}
				%>
					</div>
					</td>
					
					<td>
					<div align="right">
					<%if(csolrep >0)
					{
						loop="lp6";	
					out.print("<a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+csolrep+"</a>");
					CSrepcount=CSrepcount+csolrep;
					}
					else
					{
					out.print("0");
					}
					%>
					</div>
					</td>
					<td>
					<div align="right">
		   		<%
					if(cpend >0)
					{
					out.print("<a href='cpending.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cpend+"</a>");
					CPcount=CPcount+cpend;
					}
					else
					{
					out.print("0");
					}
				 %>
					</div>
					</td>
					
					
									
						
			
					<td>
					<div align="right">
					<%					
					sql="select distinct(Tno) from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion='"+rst.getString("TechName")+"'  order by DofAllocation  ";
					ResultSet Insp=st1.executeQuery(sql);
					String tk ="";
					String tech11="";
					System.out.println("sql---->" +  sql);
					int cnt=0;
					int count=0;
					while(Insp.next()){
						tk=Insp.getString("Tno");
				
					
					sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno ='"+tk+"'  ";
					ResultSet rstInsp=stInspection.executeQuery(sql);
					//System.out.println("token---->" +token11[a]);
					
					//System.out.println("aaaaaaa---->" +a);
					
					System.out.println("sql---->" +  sql);
					if(rstInsp.next()){
						cnt++;
						
					}
					}
				
				if(cnt >0)
					{System.out.println("cnt--->>>>->" +cnt);
						loop="lp1";	
						out.print("<a href='reinspection.jsp?loop="+loop+"&tech11="+tech11+"&tk="+tk+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+cnt+"</a>");
							inspcount=inspcount+cnt;
							System.out.println("loop---->" +  loop);
					}else
					{
							out.print("0");
					}
					
				
						%>
					</div>		
					</td>
					<td>
					<div align="right">
					<%					
					sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  NewTechnician='"+rst.getString("TechName")+"'  ";
					ResultSet realctn=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(realctn.next())
					{System.out.println("inside if of lp2---->");
					if(realctn.getInt("count") >0)
					{System.out.println("inside if of count  lp2---->");
						loop="lp2";	
						System.out.println("loop---->" +  loop);
						out.print("<a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+realctn.getString("count")+"</a>");
						System.out.println("loop-22--->" +  loop);	
						realtcount=realtcount+realctn.getInt("count");	
							System.out.println("loop---->" +  loop);
							
					}
					else
					{
							out.print(realctn.getString("count"));
					}
					}
					%>
					</div>		
					</td>
					<td>
					<div align="right">
					<%					
					sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion='"+rst.getString("TechName")+"' order by DofAllocation  ";
					ResultSet Inspct=st1.executeQuery(sql);
					String tk1 =""; 
					System.out.println("sql---->" +  sql);
					int cmpct=0;
					while(Inspct.next())
					{
						tk1=Inspct.getString("Tno");

						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  and Tno = '"+tk1+"' ";
					ResultSet rstInsp1=stInspection.executeQuery(sql);
		
					System.out.println("sql---->" +  sql);
					if(rstInsp1.next()){
					
						cmpct=cmpct+rstInsp1.getInt("count");
						
						
						
						
					}
					
					}
					
					
					
					//System.out.println("cnt---4444444->"+cnt1);
				//System.out.println("token---->" +token);
				if(cmpct >0)
					{//System.out.println("cnt--->>>>->" +cnt1);
						loop="lp3";	
						out.print("<a href='reinspection.jsp?loop="+loop+"&tk1="+tk1+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+cmpct+"</a>");
						cstcmpcount=cstcmpcount+cmpct;
							System.out.println("loop---->" +  loop);
					}else
					{
							out.print("0");
					}
								
					
				
					%>
					</div>		
					</td>
					<td>
					<div align="right">
					<%					
					sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ";
					ResultSet Inspcst=st1.executeQuery(sql);
					String token2 =""; 
					int	ct=0;
					int cnt2=0;
					System.out.println("sql---->" +  sql);
					while(Inspcst.next()){
						
						token2 =Inspcst.getString("Tno");
				
					
						System.out.println("token2-outside--->"+token2);
						token2=token2.replace(" ","");
						
	
								
					sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno = '"+token2+"' ";
					ResultSet cstinsp=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					int a4;
					if(cstinsp.next())
					{ //  for(a4=0;a4<token22.length;a4++) 
					
						System.out.println("sql-WWWWWWWWWWWWWWW--->");
						
							ct=ct+cstinsp.getInt("count");
							System.out.println("ct--inside-->" +ct);
					
							//ct++;
					}		
					}
						
		
						System.out.println("ct->>>>>>>>@@@@$$$$$$$$$$-->"+ct);
			
					if(ct >0)
					{
						loop="lp4";		
						out.print("<a href='reinspection.jsp?loop="+loop+"&token2="+token2+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+ct+"</a>");
							cstcount=cstcount+ct;
							System.out.println("loop---->" +  loop);
					}
					else
					{
						out.print("0");
					}
					
						%>
					</div>		
					</td>
					
					<td>
					<div align="right">
					
					
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
					ResultSet rst5=st2.executeQuery(sql);	
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
					
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
					ResultSet rst6=st2.executeQuery(sql);	
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>		
					</div>				
					</td>	
					
					<td>
					<div align="right">
					<%					
					sql="select count(*) as count from t_specialreports where Technician='"+rst.getString("TechName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
					ResultSet rst7=st1.executeQuery(sql);
					if(rst7.next())
					{
						if(rst7.getInt("count")>0)
						{
						out.print("<div align='right'><a href='viewspecialreport.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst7.getInt("count")+"</a></div>");
						SPcount=SPcount+rst7.getInt("count");
						}
						else
						{
							out.print("<div align='right'>0</div>");
						}
					}
					%>
					</div>
					</td>	
					
			  		
					<td>
					<div align="right">  
					<%					
					//sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ";
					//ResultSet Inspavg=st1.executeQuery(sql);
					
					
					//String tk13 =""; 
					//System.out.println("sql--og AVGGGGGGGGG-->" +  sql);
					
					
					
					
					
					
					
					//System.out.println("sql---->" +  sql);
					//String token3 =""; 
					double ab1=0.00;
					double abc=0.00;
					double ab=0.00;
					double ak=0.00;
						//ab1=Inspavg.getDouble("count");
						//tk13=Inspavg.getString("Tno");
						
						//if(tk13==""){
							//tk13=Inspavg.getString("Tno");
							
						//}else{
							//tk13=tk13+","+Inspavg.getString("Tno");
							
										
						
						//}
							
										
					
							
					String xz="",xz1="";	
							
					System.out.println("UP TO HEREEEEEEEEEE---->" );	
							
															
					sql="select avg( time_to_sec( DurationOfClosure ) )  as count from db_CustomerComplaints.t_complaints1 where TdyDate >= '"+fromdate+"' and PSolDate <= '"+todate+"'  and  inspection='No'  and DurationOfClosure <> '0:0' and DurationOfClosure <> '-'  and tno in (select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ) ";
					ResultSet avgdur=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					String s="",s1="",chk ="";
					int cntt =0;
					int sec =0;
					int hrs=0;
					int min =0;
					while(avgdur.next())
					{
						
						
						System.out.println("INSIDE RESULT SETTTTTT---->" );
						totalsec= totalsec +avgdur.getInt("count");
						sec=sec+avgdur.getInt("count");
						//abc=abc+avgdur.getDouble("count");
						
						xz=avgdur.getString("count");
						
					}	
						// xz=avgdur.getString("count");
						
						System.out.println("xz--11111-->"+xz);
						System.out.println("sec--11111-->"+sec);
						
						
						if(xz==null)
						{
							chk="00:00";
							
						}else{
							
							sec =sec/60;
						
						if(sec > 60)
						{
							hrs=sec/60 ;
							min = sec % 60;
							if(hrs < 10 || min < 10 )
							{
						chk = "0"+""+hrs+""+":"+"0"+""+min+"";	
							}else {
								
								chk = ""+hrs+""+":"+""+min+"";
							}
						
						}else
						{
							
							//min = sec % 60;
							chk ="00"+":"+" "+sec+" ";		
							
						}
						
						}	
					
						System.out.println("xz >>>>>"+xz); 
						NumberFormat nfrating=NumberFormat.getInstance();
						nfrating.setMaximumFractionDigits(4);
						nfrating.setMinimumFractionDigits(2);                   
				
							 System.out.println("inside else loop >>>>>"); 
			
						 System.out.println("chk >>>>>"+chk);
				
						 String chk2="";
	
						System.out.println("inside if of avg>>>>>");
						//}else{
						
						//ab1= Double.parseDouble(xz);
						System.out.println("ab1. >>>>>"+ab1);
						//}
							 NumberFormat nfrating1=NumberFormat.getInstance();
								nfrating1.setMaximumFractionDigits(2);
								nfrating1.setMinimumFractionDigits(2);  
								
							       //ab= ab+Double.parseDouble(nfrating.format(ab1));
					
					
					
					
						
					
					
					
						
					
					sql="select count(TechName) as tech from t_techlist where Available='Yes' ";
					ResultSet total=st1.executeQuery(sql);
					System.out.println("sql--total count-->" +  sql);
					String tot="",tl="";
					int ctl =0;
					while(total.next()){
						ctl= ctl+total.getInt("tech");
						
						
					}
					//tl=tot.split(",");
					System.out.println("ctl>*******8>1111>>"+ctl);
					try
                    {
                            StringTokenizer str=new StringTokenizer(xz,":");
         while(str.hasMoreTokens())
         {
             String test=str.nextToken();
             String test1=str.nextToken();
             xz=test+"."+test1;
             String test2=str.nextToken();
         }
        // ak=ak+Double.valueOf(xz.trim()).doubleValue();


                    }
                    catch(Exception e)
                    {
                            System.out.println(">>>>>>>exception:"+e);
                    }



					
					System.out.println("OUTSIDE OF ALL >>>>>"+ab1);
					
					ak=totalsec/ctl;
					//ak =ak/(60 * 60);
					
					sql5="select sec_to_time('"+ak+"')  ";
					ResultSet tot1=stInspection.executeQuery(sql5);
					System.out.println("sql--conversion -->" +  sql5);
					if(tot1.next())
					{
						
						totalas=tot1.getString(1);
						
					}
					
					
					//if(totalas==null){
						//totalas ="00:00";
						
					System.out.println("totalas &&&$$$$$$$$$$$$ >>>>>"+totalas); 
				//}else{ 
					 //System.out.println("HIIIIII>>>>>>>>>>-->"+xz.length() ); 
					
					if(totalas.length()>4){
						tto=totalas.substring(0,5);
				 
				      // cntt++;
				 
					}
				//}
					
					
					System.out.println("abc >>>>>>>>>>>>>"+abc);
					System.out.println("TOtal SEC--11111-->"+ totalsec);
					
							
					if(xz !=null )
					{System.out.println("inside ab1 of count if loop avg>>>>>");
						loop="lp5";
						cntt++;
						System.out.println("cntt>>>2222>>"+cntt);
						System.out.println("inside if of count loop avg>>>>>");
						 System.out.println("chk >>>>>"+chk);	
						out.print("<div align='right'><a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+chk+"</a></div>");
							avgdurtn=avgdurtn+aks;
							//avgdurtn=avgdurtn/ctl;
							NumberFormat nfrating2=NumberFormat.getInstance();
							nfrating2.setMaximumFractionDigits(3);
							nfrating2.setMinimumFractionDigits(2); 
							avg= Double.parseDouble(nfrating2.format(avgdurtn));
							
							//DecimalFormat df = new DecimalFormat("##.##");
							//avg= Double.parseDouble(df.format(avgdurtn));
							System.out.println("loop---->" +  loop);
					}
					else
					{System.out.println("inside ab1 of count else loop avg>>>>>");
							out.print("00:00");
					}
					
					
					
						%>
					</div>		
					</td> 					
					</tr>
					<%	
					i++;		
					
					
					}	
					String a="",b="",c="",d="",e="",f="";
					a="ab1";
					b="ab2";
				c="ab3";
					d="ab4";
					e="ab5";
					f="ab6";
					%>		
				<!-- 	</table>
					<table border="1" width="750px" align="center" class="sortable">
				 -->
					
					<tr>
					<td><div align="right"><font color="red"><%=i %></font></div></td>
					<td><div align="center">-</div></td>
					<td><font color="red"><b>Total</b></font></td>
					
					<td><div align="right"><a href="techoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=Ocount%></font></a></div></td>
					<td><div align="right"><a href="techincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=Icount%></b></font></a></div></td>
					<td><div align="right"><a href="techcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAcount%></b></font></a></div></td>
					<td><div align="right"><a href="techvehavail.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAvcount%></b></font></a></div></td>
					<td><div align="right"><a href="techcompsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CScount%></b></font></a></div></td>
					<td><div align="right"><a href="reinspection.jsp?loop=<%=f%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CSrepcount%></b></font></a></div></td>
					<td><div align="right"><a href="techcomppending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CPcount%></b></font></a></div></td>
					<td><div align="right"><a href="reinspection.jsp?loop=<%=a%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=inspcount%></b></font></a></div></td>
					<td><div align="right"><a href="reinspection.jsp?loop=<%=b%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=realtcount%></b></font></a></div></td>					
					<td><div align="right"><a href="reinspection.jsp?loop=<%=d%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=cstcmpcount%></b></font></a></div></td>					
					<td><div align="right"><a href="reinspection.jsp?loop=<%=c%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=cstcount%></b></font></a></div></td>					
					<td><div align="right"><a href="techunitrep.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=URcount%></b></font></a></div></td>
					<td><div align="right"><a href="technewinstall.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=NIcount%></b></font></a></div></td>
					<td><div align="right"><a href="techspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=SPcount%></b></font></a></div></td>
				  <td><div align="right"><a href="reinspection.jsp?loop=<%=e%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=tto%></b></font></a></div></td> 										
					</tr>					
					</table>	
					<%		
					
					}else if(thename.equals("Representative"))
					{
					%>
					<div align="center"><font color="brown" size="2">Representative Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table id="example1" border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Name</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Not Called</td>
					<td>Call Transfer</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Solved without Replace </td>
					<td>Comp. Pending</td>
					<td>Inspection</td>
					<td>Reallocation</td>
					<td>Cost of Complaint</td>
					<td>Cost of Inspection</td>
				  	<td>Unit Replaced</td>  
					<td>New Installation</td>
					<td>Special Report</td>  
					<td>Avg Closure Duration</td> 
					</tr>				
					<%
					sql="select distinct(Name) from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes'  ";
					ResultSet rst7=st.executeQuery(sql);
					int i=1;
					while(rst7.next())
					{
					%>
					<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td width="20%"><%=rst7.getString("Name")%></td>
						
						<%
						sql="select (select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing') as count,(select count(*) from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing') as count1,(select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='NotCalled') as count2,(select count(*) from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='Call Transfer') as count3 from t_callinformation";
						ResultSet rst8=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst8.next())
						{
						%>
							
							<td width="25%">
							<div align="right">
				<% 	if(rst8.getInt("count") >0)
						{
								out.print("<a href='repoutgoing.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count")+"</a>");
								OCcount=OCcount+rst8.getInt("count");						
						}
						else
						{
								out.print(rst8.getString("count"));
						}
					%>
						</div>						
						</td>
						<td width="25%">
							<div align="right">
					<% 	if(rst8.getInt("count1") >0)
						{
								out.print("<a href='repincoming.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count1")+"</a>");
								ICcount=ICcount+rst8.getInt("count1");						
						}
						else
						{
								out.print(rst8.getString("count1"));
						}
						
						%>
						</div>						
						</td>
						<td width="25%">
							<div align="right">
						<%

						if(rst8.getInt("count2") >0)
						{
								out.print("<a href='repnotcalled.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count2")+"</a>");
								NCcount=NCcount+rst8.getInt("count2");						
						}
						else
						{
								out.print(rst8.getString("count2"));
						}
						
						%>
						</div>						
						</td>
						
						<td width="25%">
							<div align="right">
						<%
						if(rst8.getInt("count3") >0)
						{
								out.print("<a href='repcalltransfer.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count3")+"</a>");
								CTcount=CTcount+rst8.getInt("count3");						
						}
						else
						{
								out.print(rst8.getString("count3"));
						}
						%>
							</div>						
						</td>
						
						
						
						<%}				
						%>	
						
				


						
						
						
						
						
						<%
						sql="Select (select count(*)  from t_callocation1 where  DOfAllocation >='"+fromdate+"' and DOfAllocation <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No' )) as count,(select count(*) from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No' )) as count1,(select count(*)  from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'   and RegBy='"+rst7.getString("Name")+"' and inspection='No')) as count2,(select count(*) from t_callocation1 where  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No') ) as count3 from t_callocation1 limit 1";
						ResultSet rst10=st111.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						int call =0;
						int veh =0;
						int csol=0;
						int csolrep=0;
						
					
						
						while(rst10.next())
						{
							call=call+rst10.getInt("count");
							veh=veh+rst10.getInt("count1");
							csol=csol+rst10.getInt("count2");
							csolrep=csolrep+rst10.getInt("count3");
						}
						System.out.println("call--Rep-->" +  call);
						System.out.println("veh--Rep-->" +veh);
						System.out.println("csol ---->"+csol);
						System.out.println("csolrep ---->"+csolrep);
						%>
						<td width="25%"><div align="right">
					<% 
						if(call >0)
						{
								out.print("<a href='repcallocated.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+call+"</a>");
								RCAcount=RCAcount+call;						
						}
						else
						{
								out.print("0");
						}
										
						%>
						</div>							
						</td>
						<td width="25%"><div align="right">
						<%
						
						if(veh  >0)
						{
								out.print("<a href='repvehavail.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+veh+"</a>");
								RCAvehcount=RCAvehcount+veh;						
						}
						else
						{
								out.print("0");
						}
						
						%>
						</div>							
						</td>
						
						<td width="25%"><div align="right">
						<%
						if(csol >0)
						{
						out.print("<a href='repsolved.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+csol+"</a>");
						CSrep1count=CSrep1count+csol;
						}
						else
						{
						out.print("0");
						}
			
						%>
						</div>							
						</td>
					<td>
					<div align="right">
				<%
				if(csolrep >0)
				{
					loop="lp7";	
				out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&repname="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+csolrep+"</a>");
				CSrep2count=CSrep2count+csolrep;
				}
				else
				{
				out.print("0");
				}
				
				%>	
			</div>
			</td>
			
				
						
						
						
						<td>
					<div align="right">
					
					<%
					sql="select count(*) as count from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No') ";
					ResultSet rst44=st1.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(rst44.next())
					{
					if(rst44.getInt("count") >0)
					{
					out.print("<a href='rep_pending.jsp?regby="+rst7.getString("Name")+"&repndg="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst44.getString("count")+"</a>");
					CPndcount=CPndcount+rst44.getInt("count");
					}
					else
					{
					out.print(rst44.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
						
						
						
						
						
						<td width="25%"><div align="right">
						
						
						
						
						<%
						sql="select count(*) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rst110=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst110.next())
						{
						if(rst110.getInt("count") >0)
						{
								out.print("<a href='repinsection.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst110.getString("count")+"</a>");
								IScount=IScount+rst110.getInt("count");						
						}
						else
						{
								out.print(rst110.getString("count"));
						}
						}				
						%>
						</div>							
						</td>
						<td>
					<div align="right">
					<%					
					sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	AllocatedBy ='"+rst7.getString("Name")+"'  ";
					ResultSet realctn=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(realctn.next())
					{System.out.println("inside if of lp2---->");
					if(realctn.getInt("count") >0)
					{System.out.println("inside if of count  lp2---->");
						loop="lp8";	
						System.out.println("loop---->" +  loop);
						out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+realctn.getString("count")+"</a>");
						System.out.println("loop-22--->" +  loop);	
						realtrepcount=realtrepcount+realctn.getInt("count");	
							System.out.println("loop---->" +  loop);
							
					}
					else
					{
							out.print(realctn.getString("count"));
					}
					}
					%>
					</div>		
					</td>
					<td width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rstcst=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rstcst.next())
						{
						if(rstcst.getInt("count") >0)
						{
							loop="lp9";	
								out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst.getString("count")+"</a>");
								ISrepcount=ISrepcount+rstcst.getInt("count");						
						}
						else
						{
								out.print("0");
						}
						}				
						%>
						</div>							
						</td>
					
						<td width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rstinsp=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rstinsp.next())
						{
						if(rstinsp.getInt("count") >0)
						{
							loop="lp10";	
								out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstinsp.getString("count")+"</a>");
								ISrep1count=ISrep1count+rstinsp.getInt("count");						
						}
						else
						{
								out.print("0");
						}
						}				
						%>
						</div>							
						</td>
					
				  
					
					
					<%
					
					sql="Select (select count(*) as count from t_unitreplacement where EntBy='"+rst7.getString("Name")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep') as count,(select count(*) from t_unitreplacement where EntBy='"+rst7.getString("Name")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New') as count1 from t_unitreplacement limit 1";
					ResultSet rst5=st2.executeQuery(sql);
					System.out.println("sql--last1-->" +  sql);
					if(rst5.next())
					{
					%>
						
						
						<td>
					<div align="right"> 	
					<%	
				    if(rst5.getInt("count") >0)
					{
					out.print("<a href='rep_utreplaced.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URrepcount=URrepcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					%>
					
					</div>
					</td> 
					<td>
					<div align="right">
				<% 
					if(rst5.getInt("count1") >0)
					{
					out.print("<a href='rep_nwinsttltn.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count1")+"</a>");
					NIrepcount=NIrepcount+rst5.getInt("count1");
					}
					else
					{
					out.print(rst5.getString("count1"));
					}
				%>
					</div>
					</td>
					
					
					
			<%		
				}				
				%>	
				  	
					
					
					
					<td>
					<div align="right">
					<%					
					sql="select count(*) as count from t_specialreports where  FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"' and TickNo in (select tno  from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy = '"+rst7.getString("Name")+"') ";	
					ResultSet rstsp=st1.executeQuery(sql);
					System.out.println("sql--last 3-->" +  sql);
					int cntp=0;
					while(rstsp.next())
					{
						cntp=cntp+rstsp.getInt("count");
						
						
						
					}
					System.out.println("cntp-spcl of rep->" +  cntp);
						if(cntp >0)
						{
						out.print("<div align='right'><a href='rep_vwspclrport.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cntp+"</a></div>");
						SPrepcount=SPrepcount+cntp;
						}
						else
						{
							out.print("<div align='right'>0</div>");
						}
					
					%>
					</div>
					</td>	
					<td>
					<div align="right">  
					<%					
	
					double ab1=0.00;
					double abc=0.00;
					double ab=0.00;
					double ak=0.00;
					
										
					
							
					String xz="",xz1="";	
							
					System.out.println("UP TO HEREEEEEEEEEE---->" );	
							
															
					sql="select avg( time_to_sec( DurationOfClosure ) )  as count from db_CustomerComplaints.t_complaints1 where CDate >= '"+fromdate+"' and PSolDate <= '"+todate+"'  and  inspection='No' and DurationOfClosure <> '0:0' and DurationOfClosure <> '-'  and tno in (select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"'  order by DofAllocation ) ";
					ResultSet avgdur=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					String s="",s1="",chk ="";
					int cntt =0;
					int sec =0;
					int hrs=0;
					int min =0;
					while(avgdur.next())
					{
						
						
						System.out.println("INSIDE RESULT SETTTTTT---->" );
						totalsec= totalsec +avgdur.getInt("count");
						sec=sec+avgdur.getInt("count");
						//abc=abc+avgdur.getDouble("count");
						
						xz=avgdur.getString("count");
						
					}	
						// xz=avgdur.getString("count");
						
						System.out.println("xz--11111-->"+xz);
						System.out.println("sec--11111-->"+sec);
						
						
						if(xz==null)
						{
							chk="00:00";
							
						}else{
							
							sec =sec/60;
						
						if(sec > 60)
						{
							hrs=sec/60 ;
							min =sec%60;
							if( min < 10 )
							{
						chk = ""+hrs+""+":"+"0"+""+min+"";	
							}else {
								
								chk = ""+hrs+""+":"+""+min+"";
							}
						
						}else
						{
							
							//min = sec % 60;
							if( sec < 10 )
							{
						chk = "00"+":"+"0"+""+sec+"";	
							}else {
								
								chk ="00"+":"+""+sec+"";		
							}
							
							
						}
						
						}	
	
						System.out.println("xz >>>>>"+xz); 
						NumberFormat nfrating=NumberFormat.getInstance();
						nfrating.setMaximumFractionDigits(4);
						nfrating.setMinimumFractionDigits(2);                   
	
						
							 
							 System.out.println("inside else loop >>>>>"); 
					
					
						 System.out.println("chk >>>>>"+chk);

						 String chk2="";
				
						System.out.println("inside if of avg>>>>>");
		
						System.out.println("ab1. >>>>>"+ab1);
						//}
							 NumberFormat nfrating1=NumberFormat.getInstance();
								nfrating1.setMaximumFractionDigits(2);
								nfrating1.setMinimumFractionDigits(2);  
								
					
					sql="select count(Name) as tech from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes' ";
					ResultSet total=st1.executeQuery(sql);
					System.out.println("sql--total count-->" +  sql);
					String tot="",tl="";
					int ctl =0;
					while(total.next()){
						ctl= ctl+total.getInt("tech");
						
						
					}
					//tl=tot.split(",");
					System.out.println("ctl>*******8>1111>>"+ctl);
					/**
					try
                    {
                            StringTokenizer str=new StringTokenizer(xz,":");
         while(str.hasMoreTokens())
         {
             String test=str.nextToken();
             String test1=str.nextToken();
             xz=test+"."+test1;
             String test2=str.nextToken();
         }
        // ak=ak+Double.valueOf(xz.trim()).doubleValue();


                    }
                    catch(Exception e)
                    {
                            System.out.println(">>>>>>>exception:"+e);
                    }

**/

					
					System.out.println("OUTSIDE OF ALL >>>>>"+ab1);
					
					ak=totalsec/ctl;
					//ak =ak/(60 * 60);
					
					sql5="select sec_to_time('"+ak+"')  ";
					ResultSet tot1=stInspection.executeQuery(sql5);
					System.out.println("sql--conversion -->" +  sql5);
					if(tot1.next())
					{
						
						totalas=tot1.getString(1);
						
					}
					
					
					//if(totalas==null){
						//totalas ="00:00";
						
					System.out.println("totalas &&&$$$$$$$$$$$$ >>>>>"+totalas); 
				//}else{ 
					 //System.out.println("HIIIIII>>>>>>>>>>-->"+xz.length() ); 
					
					if(totalas.length()>4){
						tto=totalas.substring(0,5);
				 
				      // cntt++;
				 
					}
				//}
					
					
					System.out.println("abc >>>>>>>>>>>>>"+abc);
					System.out.println("TOtal SEC--11111-->"+ totalsec);
					
							
					if(xz !=null )
					{System.out.println("inside ab1 of count if loop avg>>>>>");
						loop="rep";
						cntt++;
						System.out.println("cntt>>>2222>>"+cntt);
						System.out.println("inside if of count loop avg>>>>>");
						 System.out.println("chk >>>>>"+chk);	
						out.print("<div align='right'><a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"'>"+chk+"</a></div>");
							avgdurtn=avgdurtn+aks;
							//avgdurtn=avgdurtn/ctl;
							NumberFormat nfrating2=NumberFormat.getInstance();
							nfrating2.setMaximumFractionDigits(3);
							nfrating2.setMinimumFractionDigits(2); 
							avg= Double.parseDouble(nfrating2.format(avgdurtn));
							
							//DecimalFormat df = new DecimalFormat("##.##");
							//avg= Double.parseDouble(df.format(avgdurtn));
							System.out.println("loop---->" +  loop);
					}
					else
					{System.out.println("inside ab1 of count else loop avg>>>>>");
							out.print("00:00");
					}
					
					
					
						%>
					</div>		
					</td> 					
					
					
					</tr>				
					<%
					i++;
					}			
					String p="",q="",r="",s="", t="";
					p="pp1";
					q="pp2";
					r="pp3";
					s="pp4";
					t ="reptot";
					
					%>
					<tr>
					
					<td width="22%"><div align="right"><font color="red"><b><%=i %></b></font></div></td>
									
					<td width="25%"><font color="red"><b>Total</b></font></td>
					<td width="22%"><div align="right"><b><a href="viewoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=OCcount%></font></a></b></div></td>
					<td width="22%"><div align="right"><b><a href="viewincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=ICcount%></font></a></b></div></td>
					<td width="22%"><div align="right"><b><a href="viewnotcalled.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=NCcount%></font></a></b></div></td>
					<td width="22%"><div align="right"><b><a href="viewcalltransfer.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CTcount%></font></a></b></div></td>
					<td width="22%"><div align="right"><b><a href="viewcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=RCAcount%></font></a></b></div></td>
					<td width="22%"><b><div align="right"><a href="totvehavail.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=RCAvehcount%></font></a></div></b></td>				
					
					<td width="22%"><b><div align="right"><a href="totrepsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CSrep1count%></font></a></div></b></td>				
					<td width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=p%>&todate=<%=todate%>"><font color="red"> <%=CSrep2count%></font></a></div></b></td>
									
					
					<td width="22%"><b><div align="right"><a href="tot_pending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CPndcount%></font></a></div></b></td>				
												
					<td width="22%"><b><div align="right"><a href="viewinspection.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=IScount%></font></a></div></b></td>				
					<td width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=q%>&todate=<%=todate%>"><font color="red"> <%=realtrepcount%></font></a></div></b></td>				
					<td width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=r%>&todate=<%=todate%>"><font color="red"> <%=ISrepcount%></font></a></div></b></td>
					<td width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=s%>&todate=<%=todate%>"><font color="red"> <%=ISrep1count%></font></a></div></b></td>	
					<td width="22%"><b><div align="right"><a href="tot_utrplaced.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=URrepcount%></font></a></div></b></td>				
					<td width="22%"><b><div align="right"><a href="totrep_nwinstt.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=NIrepcount%></font></a></div></b></td>				
					<td width="22%"><b><div align="right"><a href="totrp_vwspcl.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=SPrepcount%></font></a></div></b></td>							
					<td><div align="right"><a href="reinspection.jsp?loop=<%=t%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=tto%></b></font></a></div></td> 										
					</tr>					
					</table>
					<%
					}else if(thename.equals("Transporter"))
						{
						
						System.out.println("--------------------------Inside Transporter");
						
							%>
							<div align="center"><font color="brown" size="2">Transporter Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
							<div align ="right"><font color="red" size="" style =size:1em; >Note:The last two columns will show the monthly SLA data only  for first date of any month.   </font> </div>
							<table id="example2" border="1" width="100%" class="sortable">
							<tr>
							<td>Sr.</td>
							<td>Transporter</td>
							<td>OutGoing Call</td>
							<td>Incoming Call</td>
							<td>Call Transfer</td>
							<td>Comp. Allocated</td>
							<td>Vehicle Available</td>
							<td>Inspection</td>
							<td>Comp. Solved</td>
							<td>Solved without Replace </td>
							<td>Comp. Pending</td>
							<td>Reallocation</td>
					        <td>Cost of Complaint</td>
					        <td>Cost of Inspection</td>
							<td>Unit Replaced</td>
							<td>New Installation</td>
							<td>Special Report</td>
						  	 <td>% Captured Days</td>
							<td>% Billed Days</td>  
							
							</tr>
							
							<%
							
							//
								if (fromdate !=null)
								{
								String datenew = new SimpleDateFormat("MMM ").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
								String datenew1 = new SimpleDateFormat(" yyyy ").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
								System.out.println("datenew---->"+datenew);
								System.out.println("datenew1---->"+datenew1);
								
								int year =0;
								try{
									
								 String fromdate=datenew1+"-"+datenew+"-01";
								  String data2="20"+datenew1;
								   year=Integer.parseInt(data2);
								  System.out.println("fromdate"+fromdate);
								  
								
								  if(datenew.equalsIgnoreCase("01")||datenew.equalsIgnoreCase("03")||datenew.equalsIgnoreCase("05")||datenew.equalsIgnoreCase("07")||datenew.equalsIgnoreCase("08")||datenew.equalsIgnoreCase("10")||datenew.equalsIgnoreCase("12"))
								  {
								  monthdays=31;
								  }
								  else if(datenew.equalsIgnoreCase("04")||datenew.equalsIgnoreCase("06")||datenew.equalsIgnoreCase("09")||datenew.equalsIgnoreCase("11"))
								  {
								  	monthdays=30;
								  }
								  else
								  {
									  if(year%4==0)
										{
											monthdays=29;
										
										}
										else
										{
											monthdays=28;
											
										}
								  }
								
								
								}catch(Exception e)
								{
									//out.print("Exception -->"+e);
									e.printStackTrace();

								}
								
								  System.out.println("monthdays-->>>>>>>>>-->"+monthdays);
								
								
								  System.out.println("datenew---->"+datenew);
								
								
								
								
								
								
								
								
								
								}
								
																										
								
									
								 System.out.println("monthdays-->>>>>>>>>-->"+monthdays);
							
							/* sql2="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '% del'  order by OwnerName Asc limit 5"; */// where Available='Yes'";
							
							//sql2="select distinct(OwnerName)as OwnerName from t_vehicledetails where Status='-' order by OwnerName Asc";
							
							sql2="select distinct(OwnerName) as OwnerName from db_gps.t_vehicledetails where ownername in (select distinct(Typevalue) from db_gps.t_transporter where OperationalStatus='Active') ";
							
							
							ResultSet rst11=st4.executeQuery(sql2);
							System.out.println("sql--tr-->" +  sql);
							int i=1;
							while(rst11.next())
							{
							%>
								<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td width="20%"><font color='red'><%=rst11.getString("OwnerName")%></font></td>
						<td width="25%"><div align="right">
								<%//i++;
							
							
							%>
							
							
								<%
					sql="Select (select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing') as count from t_callinformation limit 1";
					ResultSet rst22=st51.executeQuery(sql);	
					System.out.println("sql--tr-->" +  sql);
					if(rst22.next())
					{
						
						
					if(rst22.getInt("count") >0)
					{
					out.print("<a href='incoming1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst22.getString("count")+"</a>");
					Icount=Icount+rst22.getInt("count");
					}
					else
					{
					out.print(rst22.getString("count"));
					}
					
					
					
					
					}				
					%>	
					</div>					
					</td>
					<td> 
					<div align="right">

					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst21=st51.executeQuery(sql);
					System.out.println("sql--tr-->" +  sql);
					if(rst21.next())
					{
					if(rst21.getInt("count") >0)
					{
					out.print("<a href='outgoing1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst21.getString("count")+"</a>");
					Ocount=Ocount+rst21.getInt("count");
					}
					else
					{
					out.print(rst21.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td>
					<div align="right">
						<%
					
					sql="select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='Call Transfer'";
					ResultSet rst211=st51.executeQuery(sql);
					System.out.println("sql--tr-->" +  sql);
					if(rst211.next())
					{
					if(rst211.getInt("count") >0)
					{
					out.print("<a href='calltransfer1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst211.getString("count")+"</a>");
					CTCcount=CTCcount+rst211.getInt("count");
					}
					else
					{
					out.print(rst211.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td>
					<div align="right">
<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' ) ";
								ResultSet rst12=st5.executeQuery(sql);
								System.out.println("sql-tr--->" +  sql);
								int call =0;
								while(rst12.next())
								{
									call=call+rst12.getInt("count");
									
								}
								System.out.println("call-- trns-->" +call);
								
								if(call >0)
								{
								out.print("<a href='callocated1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+call+"</a>");
								CAcount=CAcount+call;
								}
								else
								{
								out.print("0");
								}
												
								%>	
								</div>				
								</td>
								
								<td>
					<div align="right">
<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and inspection='No' ) ";
								ResultSet rst111=st51.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								int veh =0;
								while(rst111.next())
								{
									veh=veh+rst111.getInt("count");
								}	
								System.out.println("veh-- trns-->" +veh);	
								
								if(veh >0)
								{
								out.print("<a href='trnsvehavail.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+veh+"</a>");
								CAvehcount=CAvehcount+veh;
								}
								else
								{
								out.print("0");
								}
												
								%>	
								</div>				
								</td>
								<td>
					<div align="right">
<%
								sql="select count(*) as count from db_CustomerComplaints.t_complaints1 where Customer='"+rst11.getString("OwnerName")+"' and TdyDate between'"+fromdate+"' and '"+todate+"' and inspection='Yes'";
								ResultSet rst122=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst122.next())
								{
								if(rst122.getInt("count") >0)
								{
								out.print("<a href='inspection1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst122.getString("count")+"</a>");
								CINcount=CINcount+rst122.getInt("count");
								}
								else
								{
								out.print(rst122.getString("count"));
								}
								}				
								%>	
								</div>				
								</td>
								<td>
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' )  ";
								ResultSet rst13=st6.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst13.next())
								{
								if(rst13.getInt("count") >0)
								{
								out.print("<a href='csolved1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst13.getString("count")+"</a>");
								CScount=CScount+rst13.getInt("count");
								}
								else
								{
								out.print(rst13.getString("count"));
								}
								}				
								%>	
								</div>
								</td>
								
								<td>
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and Customer='"+rst11.getString("OwnerName")+"' and inspection='No' ) ";
								ResultSet rst112=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								int repsol= 0;
								while(rst112.next())
								{
									repsol=repsol+rst112.getInt("count");
								}
								System.out.println("repsol-- trns-->" +repsol);	
									
								if(repsol >0)
								{
									loop ="lp12";
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"'>"+repsol+"</a>");
								CSreptrcount=CSreptrcount+repsol;
								}
								else
								{
								out.print("0");
								}
											
								%>	
								</div>
								</td>
								
								
								<td>
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and inspection='No' ) ";
								ResultSet rst113=st6.executeQuery(sql);
								System.out.println("sql-tr--->" +  sql);
								int repend= 0;
								while(rst113.next())
								{
									repend=repend+rst113.getInt("count");
								}
								System.out.println("repend-- trns-->" +repend);	
									
								if(repend >0)
								{
								out.print("<a href='trncmpnd.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+repend+"</a>");
								CSpendtrcount=CSpendtrcount+repend;
								}
								else
								{
								out.print("0");
								}
											
								%>	
								</div>
								</td>
								
								
								<td>
								<div align="right">
								<%
								//sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and Customer='"+rst11.getString("OwnerName")+"' and inspection='No' ) ";
								sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	Transporter ='"+rst11.getString("OwnerName")+"'  ";
								ResultSet rst114=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								
								if(rst114.next())
								{
															
									
								if(rst114.getInt("count") >0)
								{
									loop ="lp13";
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst114.getInt("count")+"</a>");
								CSrealctncount=CSrealctncount+rst114.getInt("count");
								}
								else
								{
								out.print(rst114.getInt("count"));
								}
								}			
								%>	
								</div>
								</td>
								
								
								
								<td width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and Customer='"+rst11.getString("OwnerName")+"'";
						ResultSet rstcst=st6.executeQuery(sql);
						System.out.println("sql--tr-->" +  sql);
						if(rstcst.next())
						{
						if(rstcst.getInt("count") >0)
						{
							loop="lp14";	
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst.getString("count")+"</a>");
								IStrrepcount=IStrrepcount+rstcst.getInt("count");						
						}
						else
						{
								out.print(rstcst.getInt("count"));
						}
						}				
						%>
						</div>							
						</td>
								
							
							<td width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Customer='"+rst11.getString("OwnerName")+"'";
						ResultSet rstcst1=st5.executeQuery(sql);
						System.out.println("sql---tr->" +  sql);
						if(rstcst1.next())
						{
						if(rstcst1.getInt("count") >0)
						{
							loop="lp15";	
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst1.getString("count")+"</a>");
								IStrcstcount=IStrcstcount+rstcst1.getInt("count");						
						}
						else
						{
								out.print(rstcst1.getInt("count"));
						}
						}				
						%>
						</div>							
						</td>
							
							
							
							
								
								
								
								
								<td>
								<div align="right">
								<%
								sql="select count(*) as count from db_gps.t_unitreplacement where OwnerName='"+rst11.getString("OwnerName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
								ResultSet rst14=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst14.next())
								{
								if(rst14.getInt("count") >0)
								{
								out.print("<a href='ureplaced1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst14.getString("count")+"</a>");
								URcount=URcount+rst14.getInt("count");					
								}
								else
								{
								out.print(rst14.getString("count"));
								}
								}				
								%>	
								</div>
								</td>
								<td>
								<div align="right">
								<%
								sql="select count(*) as count from db_gps.t_unitreplacement where OwnerName='"+rst11.getString("OwnerName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
								ResultSet rst15=st6.executeQuery(sql);	
								System.out.println("sql--tr-->" +  sql);
								if(rst15.next())
								{
								if(rst15.getInt("count") >0)
								{
								out.print("<a href='newinstallation1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst15.getString("count")+"</a>");
								NIcount=NIcount+rst15.getInt("count");
								}
								else
								{
								out.print(rst15.getString("count"));
								}
								}				
								%>		
								</div>				
								</td>	
								<td>
								<div align="right">
								<%					
								sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								ResultSet rst16=st7.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst16.next())
								{
									if(rst16.getInt("count")>0)
									{
									out.print("<div align='right'><a href='viewspecialreport1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst16.getInt("count")+"</a></div>");
									SPcount=SPcount+rst16.getInt("count");
									}
									else
									{
										out.print("<div align='right'>0</div>");
									}
								}
								%>
								</div>
								</td>
								
								  
								<td>
								<div align="right"> 
								<%					
								//sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								sql="SELECT sum( totalyes ) AS captured_days, sum(TotalDays) as TotalDays FROM db_gps.t_billingdetails WHERE Month1 = '"+fromdate+"' and Transporter ='"+rst11.getString("OwnerName")+"' ";
								ResultSet rst125=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								String cptdays ="",totaldys="",totalbilleddys="";
								 NumberFormat nf = NumberFormat.getNumberInstance();
								    NumberFormat nf1 = NumberFormat.getNumberInstance();
									nf.setMaximumFractionDigits(2) ;
									nf1.setMaximumFractionDigits(2) ;
									String SLAPer ="",BillType= "",CustomerCode ="";
								float cptdays1 =0.0f,totaldys1=0.0f,totalbilleddys1=0.0f,PerOfCapturedDays=0.0f,PerOfBILL=0.0f;
								
								while(rst125.next())
								{
									sql="SELECT SLAPer,BillType,ERPCode as CustomerCode  FROM db_gps.t_fv_erp_relation  WHERE  Transporter ='"+rst11.getString("OwnerName")+"' ";
									ResultSet rst1295=st6.executeQuery(sql);
									System.out.println("sql--tr-->" +  sql);
									if(rst1295.next())
									{
									
									cptdays=rst125.getString("captured_days");
									SLAPer=rst1295.getString("SLAPer");
									BillType =rst1295.getString("BillType");
									CustomerCode= rst1295.getString("CustomerCode");
									totaldys=rst125.getString("TotalDays");
									//totalbilleddys=rst125.getString("Total_billed_days");
									if(cptdays ==null  || totaldys ==null || SLAPer ==null || BillType ==null)
									{
										PerOfCapturedDays =0;
										
									}else{
									
									cptdays1=Float.parseFloat(cptdays);
									totaldys1=Float.parseFloat(totaldys);
									//totalbilleddys1 =Float.parseFloat(totalbilleddys);
									
									
									 PerOfCapturedDays=(cptdays1 * 100)/totaldys1;
									//PerOfBILL=(totalbilleddys1*100)/totaldys1;
									}
									}	
								}	
									
									
									
									if(PerOfCapturedDays >0)
									{
									out.print("<div align='right'><a href='SLAForTransporter1.jsp?transporter="+rst11.getString("OwnerName")+"&GroupName="+rst11.getString("OwnerName")+"&monthdays = "+monthdays+"&date="+fromdate+"&CustomerCode="+CustomerCode+"&SLAPer="+SLAPer+"&BillType="+BillType+"'>"+nf.format(PerOfCapturedDays)+"</a></div>");
									
									SPcptpercount=SPcptpercount+PerOfCapturedDays;
									}
									else
									{
										out.print("0");
									}
								
								%>
								</div>
								</td>
									
								
							  	<td>
								<div align="right"> 
								<%					
								//sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								sql="SELECT  sum( totalyes ) AS captured_days, sum( totalyes ) + sum( TotalYesStar ) AS Total_billed_days ,sum(TotalDays) as TotalDays FROM db_gps.t_billingdetails WHERE Month1 = '"+fromdate+"' and Transporter ='"+rst11.getString("OwnerName")+"' ";
								ResultSet rst127=st6.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								//String cptdays ="",totaldys="",totalbilleddys="";
								// NumberFormat nf = NumberFormat.getNumberInstance();
								  //  NumberFormat nf1 = NumberFormat.getNumberInstance();
									//nf.setMaximumFractionDigits(2) ;
									//nf1.setMaximumFractionDigits(2) ;
								//float cptdays1 =0.0f,totaldys1=0.0f,totalbilleddys1=0.0f,PerOfCapturedDays=0.0f,PerOfBILL=0.0f;
								
								while(rst127.next())
								{
									sql="SELECT SLAPer,BillType,ERPCode as CustomerCode  FROM db_gps.t_fv_erp_relation  WHERE  Transporter ='"+rst11.getString("OwnerName")+"' ";
									ResultSet rst1221=st5.executeQuery(sql);
									System.out.println("sql--tr-->" +  sql);
									if(rst1221.next())
									{
									//cptdays=rst125.getString("captured_days");
									totaldys=rst127.getString("TotalDays");
									totalbilleddys=rst127.getString("Total_billed_days");
									cptdays=rst127.getString("captured_days");
									SLAPer=rst1221.getString("SLAPer");
									BillType =rst1221.getString("BillType");
									CustomerCode= rst1221.getString("CustomerCode");
									
									if(totaldys ==null ||  totalbilleddys ==null)
									{
										PerOfBILL =0;
										
									}else{
									
									//cptdays1=Float.parseFloat(cptdays);
									totaldys1=Float.parseFloat(totaldys);
									totalbilleddys1 =Float.parseFloat(totalbilleddys);
									
									
									 //PerOfCapturedDays=(cptdays1 * 100)/totaldys1;
									 PerOfBILL=(totalbilleddys1*100)/totaldys1;
									
									}
								}
								}	
								
								
									if(PerOfBILL >0)
									{
									out.print("<div align='right'><a href='SLAForTransporter1.jsp?transporter="+rst11.getString("OwnerName")+"&GroupName="+rst11.getString("OwnerName")+"&monthdays = "+monthdays+"&date="+fromdate+"&CustomerCode="+CustomerCode+"&SLAPer="+SLAPer+"&BillType="+BillType+"'>"+nf1.format(PerOfBILL)+"</a></div>");
									SPcptbillcount=SPcptbillcount+PerOfCapturedDays;
									}
									else
									{
										out.print("0");
									}
								
								%>
							  	 </div>
								</td>	
									
								</tr>	
								
												
								
								<%	
								i++;		
							}			
								String a ="",b ="", c="", d="",e="",f="";
								a="q1" ;
								b= "q2";
								c= "q3";
								d= "q4";
								e="-";
								f ="-";
								%>		
								
								<tr>
								<td width="22%"><div align="right"><font color="red"><b><%=i %></b></font></div></td>
								<td><font color="red"><b>Total</b></font></td>
								<td>-</td>
								
					<td><div align="right"><a href="custhoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=Ocount%></b></font></a></div></td>
					<td><div align="right"><a href="custhincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=Icount%></b></font></a></div></td>
					<td><div align="right"><a href="custhcalltransfer.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CTCcount%></b></font></a></div></td>
					<td><div align="right"><a href="custcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAcount%></b></font></a></div></td>
					<td><div align="right"><a href="trvehavailtot.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAvehcount%></b></font></a></div></td>
															
					<td><b><div align="right"><a href="custinspection.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=CINcount%></a></div></b></font></td>
					<td><div align="right"><a href="custcompsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CScount%></b></font></a></div></td>
					<td><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=a%>&todate=<%=todate%>"><font color="red"><%=CSreptrcount%></a></div></b></font></td>
					<td><b><div align="right"><a href="trpending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=CSpendtrcount%></a></div></b></font></td>
					<td><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=b%>&todate=<%=todate%>"><font color="red"><%=CSrealctncount%></a></div></b></font></td>
					<td><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=c%>&todate=<%=todate%>"><font color="red"><%=IStrrepcount%></a></div></b></font></td>
					<td><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=d%>&todate=<%=todate%>"><font color="red"><%=IStrcstcount%></a></div></b></font></td>
														
					
					
					<td><div align="right"><a href="custunitrep.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=URcount%></b></font></a></div></td>
					<td><div align="right"><a href="custnewinstall.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=NIcount%></b></font></a></div></td>
					<td><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=SPcount%></b></font></a></div></td>
				 <td><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=e %></b></font></a></div></td>
					<td><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=f %></b></font></a></div></td>    
								</tr>					
								</table>

					<%
					
					}else
					{
						
						
						System.out.println("----------------------->Inside Else Block");
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MM-yyyy").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("dd-MM-yyyy").parse(todate))%></font></div>
					<table id="example1" border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					while(rst.next())
					{
					%>
					<tr>
					<td><%=i%></td>
					<td><%=rst.getString("TechName")%></td>
					<td><%=rst.getString("MobNo")%></td>
					<td>
					<%
					sql="Select (select count(*)  from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing') as count,(select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing') as count1 from t_callinformation limit 1";
					ResultSet rst1=st1.executeQuery(sql);	
					if(rst1.next())
					{%>
					<td>
					<%
					if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					%>
					</td>
					<td>
					
					<%
					
					if(rst1.getInt("count1") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count1")+"</a>");
					Icount=Icount+rst1.getInt("count1");
					}
					else
					{
					out.print(rst1.getString("count1"));
					}
					
					%>
					</td>
					
					
					<td>
					<%
					
					
					
					%>
					</td>
					
					
					
					
					<%
					}				
					%>					
					
					<td>
					<%-- <%
					sql="";
					ResultSet rst2=st1.executeQuery(sql);	
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>		 --%>				
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
					ResultSet rst3=st1.executeQuery(sql);	
					if(rst3.next())
					{
					if(rst3.getInt("count") >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst3.getString("count")+"</a>");
					CAcount=CAcount+rst3.getInt("count");
					}
					else
					{
					out.print(rst3.getString("count"));
					}
					}				
					%>					
					</td>
					<td>
					
					
		<!-- change -->	
					<%
					sql33="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"'";
					ResultSet rst33=st1.executeQuery(sql);	
					if(rst33.next())
					{
					if(rst33.getInt("count") >0)
					{
					out.print("<a href='vehavail.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst33.getString("count")+"</a>");
					CAvcount=CAvcount+rst33.getInt("count");
					}
					else
					{
					out.print(rst33.getString("count"));
					}
					}				
					%>	
						
					</td>
					<td>
					
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Solved'";
					ResultSet rst4=st1.executeQuery(sql);	
					if(rst4.next())
					{
					if(rst4.getInt("count") >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst4.getString("count")+"</a>");
					CScount=CScount+rst4.getInt("count");
					}
					else
					{
					out.print(rst4.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Unsolved'";
					ResultSet rst44=st1.executeQuery(sql);	
					if(rst44.next())
					{
					if(rst44.getInt("count") >0)
					{
					out.print("<a href='cpending.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst44.getString("count")+"</a>");
					CPcount=CPcount+rst44.getInt("count");
					}
					else
					{
					out.print(rst44.getString("count"));
					}
					}				
					%>	
					
					</td>
					<td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
					ResultSet rst5=st2.executeQuery(sql);	
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
					ResultSet rst6=st2.executeQuery(sql);	
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>						
					</td>	
									
					</tr>
					<%	
					i++;		
					}				
					%>		
					</table>
					<table border="1" width="750px" align="center" class="sortable">
					<tr>
					<td><font color="red"><b>Total</b></font></td>
					<td><font color="red"><b><%=Ocount%></b></font></td>
					<td><font color="red"><b><%=Icount%></b></font></td>
					<td><font color="red"><b><%=CAcount%></b></font></td>
					<td><font color="red"><b><%=CAvcount%></b></font></td>
					<td><font color="red"><b><%=CScount%></b></font></td>
					<td><font color="red"><b><%=CPcount%></b></font></td>
					<td><font color="red"><b><%=URcount%></b></font></td>
					<td><font color="red"><b><%=NIcount%></b></font></td>
					<td><font color="red"><b><%=inspcount%></b></font></td>
					
					</tr>					
					</table>	
					<%
					}
				%>
					<input type="hidden" name="loop" id="loop" value="<%=loop %>"	></input>
				</td>
				</tr>
			</table>	
	<%
	
					}				
}
	catch(Exception e)
{
	out.print("Exception -->"+e);
	e.printStackTrace();

}
finally
{
	conn.close();
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>

<!-- code end here --->

 		</div>
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
