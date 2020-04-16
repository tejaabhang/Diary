<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st,st1;
String sql,sql1;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Exception Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
		function validate()
		{
		alert("hi");
			if(document.getElementById("data").value=="")
			{
		  		alert("Please select the from date");
				return false;
			}
			if(document.getElementById("data1").value=="")
			{
	  		alert("Please select the to date");
				return false;
			}
			return datevalidate();
	  }
	function datevalidate()
	 {
		 
	 	var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
		dd11=date1.substring(0,2);
		dd22=date2.substring(0,2);
		mm1=date1.substring(3,5);
		mm2=date2.substring(3,5);
		yy11=date1.substring(6,10);
		yy22=date2.substring(6,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(yy11>year || yy22>year)
		{
			alert("selected date should not be greater than todays date");
			return false;
		}
		else if(year==yy11 && year==yy22)
		{
 			if(mm1>month || mm2>month)
			{
				alert("selected date should not be greater than todays date");
				return false;
			}
		}
		if(mm1==month && mm2==month)
		{
			if(dd11>day || dd22>day)
			{
				alert("selected date should not be greater than todays date");
				return false;
			}
		}

		if(yy11 > yy22)
		{
			alert("From date year should not be greater than to date year");
			return false;
		}
		else if(year==yy11 && year==yy22)
		{
			 if(mm1>mm2)
		{
			alert("From date month should not be greater than to date month");
			return false;
		}
		}
		if(mm1==month && mm2==month) 
		{
			if(yy11==yy22)
			{
			if(dd11 > dd22)
			{
				alert("From date should not be greater than to date");
				return false;
			}
			}
		}
		else
			if(yy11<yy22)
			{
				return true;
			}
		else
			if(dd11 > dd22)
		{
				if(mm1<mm2)
				{
					return true;
				}
				
			alert("From date should not be greater than to date");
			return false;
		}
		
		return true;
	}	
</script>
<script type="text/javascript">
function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.ExceptionSummary.action ="excel.jsp";
          document.forms["ExceptionSummary"].submit();
}
</script>
</head>


<body>
<div id="wrapper">
<div id="body-bot">
<div id="body-top">
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
String fromDate = request.getParameter("from_date1");
String toDate = request.getParameter("to_date1");

try{
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    
    //System.out.println("Connection Created");
    
    }catch(Exception E){
    	//System.out.println(""+E);
    }
    
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Exception Summary</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<%

String datenew1="";
String datenew2="";

if(request.getParameter("data")!=null)
{
  datenew1=request.getParameter("data");
  datenew2=request.getParameter("data1");
  }

else {
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
}

%>

<% 
		DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		String dataDate1=df1234.format(df123.parse(datenew1));
		String dataDate2=df1234.format(df123.parse(datenew2));
		int counter=0;
		
%>
<form name="unit" method="post" onsubmit="" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">      
			 <tr id="daterange"  style=""  bgcolor="#BDBDBD"> 
			 	<td align="center"><font size="2"><b>From Date</b></font>
			 	</td>
			     <td align ="center">
			     		<font size="2">
						<input type="text" id="data" name="from_date1" size="12" value="<%if(fromDate==null){ %><%=datenew1%><%}else{%><%=fromDate%> <%}%>" 
						style="width: 90px; height: 10px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
					<script type="text/javascript">
							  Calendar.setup(
							    {
							      inputField  : "data",         // ID of the input field
							      ifFormat    : "%d-%b-%Y",    // the date format
							      button      : "data"       // ID of the button
							    }
							  );
						</script>

				</font>
				</td>
				<td align="center"><font size="2"><b>To Date</b></font>
				</td>
				<td align ="center">
					<font size="2">		
					<input type="text" id="data1" name="to_date1" size="12" value="<%if(toDate==null){ %><%=datenew2%><%}else{%><%=toDate%> <%}%>"
					style="width: 90px; height: 10px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
					<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "data1",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format
						      button      : "trigger1"       // ID of the button
						    }
						  );
					</script>
		
			</font>
			</td>
	        <td align ="center">	        
	        	<input type="submit" name="submit" id="submit" value="submit" style="background: #E6E6E6;"/>
	        </td>
		</tr>
	</table>
</form>
<br />			
<%
	
	//System.out.println("The from Date is :"+fromDate);
	//System.out.println("The to Date is :"+toDate);
	
if(fromDate !=null && toDate !=null) {
	
	fromDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(fromDate));
	toDate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(toDate));
	
	//System.out.println("The from Date is :"+fromDate);
	//System.out.println("The to Date is :"+toDate);
	
%>

<form id="ExceptionSummary" name="ExceptionSummary" action="" method="post">
	
		<%
		 String  exportFileName="exception_summary.xls";
		%>
		
		<table width="750px" border="0" align="center">
		<tr>
			
			<%
				try{
				
						String sql ="select count(*) as count from db_gps.t_exceptionsummary where TheDate BETWEEN '"+fromDate+"' and '"+toDate+"'";
						ResultSet rs1=st.executeQuery(sql);
						//System.out.println("The query is ==>>"+sql);
						if(rs1.next())
						{
							String count=rs1.getString("count");
							
							%>
								
								<td  align="left"><b>Total Records :</b>&nbsp;&nbsp;&nbsp;<%= count%></td>
								
								<%
								
						}
					}catch(Exception e) {
						//System.out.println("The Exception is ==>>"+e);
				}
				%>
			<td  align="left"><b>From Date :</b>&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate))%></td>
			<td  align="left"><b>To Date :</b>&nbsp;&nbsp;&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(toDate))%></td>
			<td>
			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
							<div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></div>
        	</td>
		</tr>		
		</table>
	
<div style="width:100%;" align="center" id="table1" >
	<table border="0" width="750px" align="center" class = "sortable">
	<tr>
	<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">The Date</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Veh ID</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Veh Reg No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Transporter</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Group</font></th>
	<th bgcolor="#E6E6E6"><font size="2">RA Limit</font></th>
	<th bgcolor="#E6E6E6"><font size="2">RD Limit</font></th>
	<th bgcolor="#E6E6E6"><font size="2">OS Limit</font></th>
	<th bgcolor="#E6E6E6"><font size="2">RA Count</font></th>
	<th bgcolor="#E6E6E6"><font size="2">RD Count</font></th>
	<th bgcolor="#E6E6E6"><font size="2">OS Count</font></th>
	<th bgcolor="#E6E6E6"><font size="2">ND</font></th>
	<th bgcolor="#E6E6E6"><font size="2">CD</font></th>
	<th bgcolor="#E6E6E6"><font size="2">DS</font></th>
	</tr>
	<%
	try{
	int count =0;
		//System.out.println("The dat");
			sql1 ="select * from db_gps.t_exceptionsummary where TheDate BETWEEN '"+fromDate+"' and '"+toDate+"' order by SrNo";
			//System.out.println("The query is ==>>"+sql1);
			ResultSet rs=st.executeQuery(sql1); 
			//System.out.println("The query is ==>>"+sql1);
			while(rs.next())
			{
				String TheDate=rs.getString("TheDate");
				String VehID=rs.getString("VehID");
				String VehRegNo = rs.getString("VehRegNo");
				String Transporter = rs.getString("Transporter");
				String Group = rs.getString("gpname");
				int RALimit = rs.getInt("RALimit");
				int RDLimit = rs.getInt("RDLimit");
				int OSLimit = rs.getInt("OSLimit");
				int RACount = rs.getInt("RACount");
				int RDCount = rs.getInt("RDCount");
				int OSCount = rs.getInt("OSCount");
				int ND = rs.getInt("ND");
				int CD = rs.getInt("CD");
				int DS = rs.getInt("DS");
				
				%>
					<tr>
					<td bgcolor="#f5f5f5" align="right"><%= ++count%> </td>
					<td bgcolor="#f5f5f5" align="left"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate))%></td>
					<td bgcolor="#f5f5f5" align="right"><%= VehID%></td>
					<td bgcolor="#f5f5f5" align="left"><%= VehRegNo%></td>
					<td bgcolor="#f5f5f5" align="left"><%= Transporter%></td>
					<td bgcolor="#f5f5f5" align="left"><%= Group%></td>
					
					<%if(RALimit!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryRALimit.jsp?lim=<%= RALimit %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%=toDate %>" target="_blank"><%= RALimit %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= RALimit %></td>
					<%} %>
					<%if(RDLimit!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryRDLimit.jsp?lim=<%= RDLimit %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%=toDate %>" target="_blank"> <%= RDLimit %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= RDLimit %></td>
					<%} %>
					<%if(OSLimit!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryOSLimit.jsp?lim=<%= OSLimit %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%=toDate %>" target="_blank"> <%= OSLimit %></a></td>
					<%} else { %>
					<td bgcolor="#f5f5f5" align="right"><%= OSLimit %></td>
					<%} %>
					<%if(RACount!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryRACount.jsp?cnt=<%= RACount %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%=toDate %>" target="_blank"> <%= RACount %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= RACount %></td>
					<%} %>
					<%if(RDCount!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryRDCount.jsp?cnt=<%= RDCount %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%=toDate %>" target="_blank"> <%= RDCount %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= RDCount %></td>
					<%} %>
					<%if(OSCount!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryOSCount.jsp?cnt=<%= OSCount %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%= toDate%>" target="_blank"> <%= OSCount %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= OSCount %></td>
					<%} %>
					<%if(ND!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryNDCount.jsp?vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%= toDate%>" target="_blank"> <%= ND %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= ND %></td>
					<%} %>
					<%if(CD!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryCDCount.jsp?CD=<%= CD %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%= toDate%>" target="_blank"> <%= CD %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= CD %></td>
					<%} %>
					<%if(DS!=0) {%>
					<td bgcolor="#f5f5f5" align="right"><a href="ExceptionSummaryDSCount.jsp?DS=<%= DS %>&vehID=<%= VehID %>&fDate=<%= fromDate %>&tDate=<%= toDate%>" target="_blank"> <%= DS %></a></td>
					<%}else { %>
					<td bgcolor="#f5f5f5" align="right"><%= DS %></td>
					<%} %>
					</tr>
					<%
	}//end while
	}catch(Exception e) {
		//System.out.println("The Exception is =>>>"+e);
	}
	%>
	</table><br>
</div>
</form>
<%}%>

</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright Â© 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>
