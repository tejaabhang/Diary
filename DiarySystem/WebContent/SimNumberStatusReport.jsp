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

function birt()
{
	alert("HI");
	
	//alert(Customer)
	
	
	//var a=chk();
	//alert(a);
	if(a==true)
	{
	
		
		
		
		var status= document.getElementById("status").value;
		//alert(date1);
		
		
		var operator= document.getElementById("operator").value;
		//alert(date2);
		
		
		var action=document.getElementById("action").value;
		
		var date = date1.split("-");
		var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		for(var j=0;j<months.length;j++)
		{
		    if(date[1]==months[j])
		    {
		         date[1]=months.indexOf(months[j])+1;
		    }                      
		} 
		if(date[1]<10)
		{
		    date[1]='0'+date[1];
		}                        
		var formattedDate1 = date[2]+'-'+date[1]+'-'+date[0];
		
		
		
		
		var dat = date2.split("-");
		var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		for(var j=0;j<months.length;j++){
		    if(dat[1]==months[j]){
		         dat[1]=months.indexOf(months[j])+1;
		     }                      
		} 
		if(dat[1]<10){
		    dat[1]='0'+dat[1];
		}                        
		var formattedDate2 = dat[2]+'-'+dat[1]+'-'+dat[0];
		
		
		
		formattedDate1=formattedDate1+" 00:00:00";
		formattedDate2=formattedDate2+" 23:59:59";
		//alert("status---"+status);
		
	
		//alert(formattedDate1);
		//alert(formattedDate2);
		
		
		//alert(user);
		
		
		document.getElementById("myIframe").src="http://103.241.181.36:8080/birt/frameset?__report=ServiceProviderStatusReport.rptdesign&Status="+status+"&Operator="+operator+"&Action="+action+"&__showtitle=false";
//		document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
		document.getElementById("reportData2").style.display="";
		document.getElementById("footer").style.display="none";
		
		return true;
		
	}

else
	{
		return false;
	}
		
	}

function confirmSubmit()
{
	
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	
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
	
	
return true;	
}
</script>
<script type="text/javascript">
function goToFullExcel(operator,status) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?operator="+operator+"&status="+status;	
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
String operator = request.getParameter("operator");
String status = request.getParameter("status");


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
				<tr><td align="center"><font  color="black" size="3"><b>Sim Master Report</font></td></tr>
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
										<option value="All" >All</option>
										<%
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
				
	        <td align ="center">	   
	             <input type="hidden" id="action" name="action" value="Sim Master Report">
	        	<input type="submit" name="sub" id="sub" value="submit" style="background: #E6E6E6;"/>
	        </td>
		</tr>
	</table>
</form>
<br />			

<% 
	System.out.println("The operator is  :"+operator);
	System.out.println("The status is :"+status);
	
	
	
%>
</div>

<div id="gbox-bot1"></div>
</div>

</div>

<% 
String Bt = request.getParameter("sub");
if(Bt==null || Bt=="null" || Bt.equals("null"))
//if(operator.equals("null") || status.equals("null") || operator==null || status==null )
{

String Action ="Sim Master Report ";
%>
 
 <div id="reportData">		
			<%-- <iframe id="myIframe" width="100%" height="850px" src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=<%= new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")))%>&date2=<%= new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")))%>&drivername=<%= request.getParameter("trNm1")%>";> --%>
				<iframe align="left" id="myIframe" width="100%" height="600px" src="http://twtech.in:8080/birt/frameset?__report=ServiceProviderStatusReport.rptdesign&Operator=<%=operator %>&Status=<%=status %>&Action=<%=Action %>&__showtitle=false"> 
</iframe>
			</div>
 
 <% }else{
	 String Action1 ="Sim Master Report of "+operator;
 %>
 
 <div id="reportData">		
			<%-- <iframe id="myIframe" width="100%" height="850px" src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=<%= new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data")))%>&date2=<%= new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("data1")))%>&drivername=<%= request.getParameter("trNm1")%>";> --%>
				<iframe align="left" id="myIframe" width="100%" height="600px" src="http://twtech.in:8080/birt/frameset?__report=ServiceProviderStatusReport.rptdesign&Operator=<%=operator %>&Status=<%=status %>&Action=<%=Action1 %>&__showtitle=false"> 
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
		
		</table>
 --%>


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
