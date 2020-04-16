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
<title>Simmaster Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<script type="text/javascript">

function confirmSubmit()
{
	
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	//var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	
	if(operator=="select") 
		{			
			alert("Please select Service Provider!");
		return false;
		}
	
	
	
return true;	
}
</script>
<script type="text/javascript">
function goToFullExcel(operator,calender,calender1) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?date1="+date1+"&date2="+date2+"Operator="+operator;	
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


String operator = request.getParameter("operator");
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
				<tr><td align="center"><font color="black" size="3"><b>Sim Master Billable Report</font></td></tr>
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
					<td align="center"><font size="2"><b>Operator</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 								
								<%
									if(operator==null)
									{
									%><option value="select" >select</option>
									<option value="All" >All</option>
									<%
					            	query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-' AND Service_provider <> '' order by Service_provider asc";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("operator") %>" ><%=rs1.getString("operator")%></option>
									<%} 
									}else{
										%><option value="select" >select</option>
										<option value="All" >All</option><%
										query1 = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-'  AND Service_provider <> '' order by Service_provider asc";
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
	System.out.println("operator is :"+operator);
	
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
if(Bt==null || Bt=="null" || Bt.equals("null"))
//if(operator.equals("null") || status.equals("null") || operator==null || status==null )
{

String Action ="Sim Master Billable Report ";
%>
 
<div align="left" id="reportData" >
<iframe align="left" id="myIframe" width="100%" height="600px" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=ServiceProvider_FromDate_ToDate_Report.rptdesign&Date1=<%=dt %>&Date2=<%=dt1 %>&Action=<%=Action %>&Operator=<%=operator %>&__showtitle=false";> 
</iframe>
</div>	
 
 <% }else{
	 //String Action1 ="Sim Master Billable Report From "+fromdate+" To "+todate+ " For " +operator;
	 String Action1 =""+operator+" Sim Billable Report From "+fromdate+" To "+todate ;
 %>

<div  id="reportData" align="left">
<iframe align="left" id="myIframe" width="100%" height="600px" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=ServiceProvider_FromDate_ToDate_Report.rptdesign&Date1=<%=dt %>&Date2=<%=dt1 %>&Action=<%=Action1 %>&Operator=<%=operator %>&__showtitle=false";> 
</iframe>
</div>	


<%} %>

<%-- <form name="SimmasterReport" id="SimmasterReport" action="" method="post">
		
		<%
		 String  exportFileName="SimNumberStatus_report.xls";
		%>
		<table width="750px" border="0" align="center">
		<tr>
			
			<%
				try{
				
						query5 ="select count(*) as count from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' ";
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
		
			<td>

			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
							<div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{goToFullExcel();}catch(e){alert(e);}">Full Excel</a>
							<a href="#" style="font-weight: bold; color: black; " onclick="javascript: try{gotoExcel('table1','tableHTML');}catch(e){alert(e);}">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"/></a></div>
        	</td>
		</tr>		
		</table>
	<div id=table1>
	<table border="0" width="750px" align="center" class="sortable">
	<tr>
	<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Sim No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Mob No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Date Of Purchase</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Purchase No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Status</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Service Provider</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Plan</font></th>
	</tr>
	<%
	try{
	int count =0;
	count = iPageNo;
		System.out.println("The dat");
		String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * from db_gps.t_simmaster where Service_provider = '"+operator+"' AND Status = '"+status+"' limit "+iPageNo+","+iShowRows+"";
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
				String DateOfPurchase = rsPagination.getString("DateOfPurchase");
				String PurchaseNo = rsPagination.getString("PurchaseNo");
				String Status = rsPagination.getString("Status");
				String Service_provider = rsPagination.getString("Service_provider"); 
				String Plan = rsPagination.getString("Plan");				
				%>
					<tr>
					<td align =right><%=++count %></td>
					<td align =right><%=Simno %></td>
					<td align =right><%=Mobno %></td>
					<%if(DateOfPurchase.equals(null) || DateOfPurchase==null || DateOfPurchase =="")
						{
							%><td align =center>-</td><%
						}else{
							%><td align =center><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DateOfPurchase)) %></td><%
						}
					%>
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
	</table><br>
</div>
</form>
<table width="750"  style="background: #E6E6E6">
		<tr>
		<td colspan="3" align ="left"><a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit">First Page</a></td>
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
          <a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit&iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit&iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit&iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit&iPageNo=<%=i%>&cPageNo=<%=i%>"> Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
</div>
</td>
  <td colspan="3" align ="right"><a href="SimNumberStatusReport.jsp?operator=<%=operator%>&status=<%=status%>&Submit=Submit&iPageNo=<%=iTotalPages%>">Last Page</a></td> 
   </tr>
		
		</table> --%>


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
