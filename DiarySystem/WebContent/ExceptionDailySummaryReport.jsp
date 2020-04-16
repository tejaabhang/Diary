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
<title>Exception Summary Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
</script>
<script type="text/javascript">

function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.ExceptionSummaryDailyReport.action ="excel.jsp";
          document.forms["ExceptionSummaryDailyReport"].submit();
}
function checkStatus(count) {
	//validate fields
for(var q=1;q<=count;q++)
{
	var SuggestedAction = document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
	//alert(">>"+SuggestedAction+q);
	if(SuggestedAction=="Select")
	{
		alert("Please select a suggested action!");
		return false;
	}
}
   try{

 
var a="",b="",d="",c="",vtt="",thedate="",vehreg="",trans="";	   
for(var q=1;q<=count;q++)
{
//alert("hi>>>");


//alert("a>>>>"+document.getElementById("vt"+q).innerHTML);   
if(q==1){
	
a= document.getElementById("vt"+q).innerHTML;
b =document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
c= document.getElementById("veh"+q).innerHTML;
d= document.getElementById("vd"+q).innerHTML;
vtt= document.getElementById("vtt"+q).innerHTML;
vtt= document.getElementById("vtt"+q).innerHTML;
thedate= document.getElementById("thedate"+q).innerHTML;
vehreg= document.getElementById("vehreg"+q).innerHTML;
trans= document.getElementById("trans"+q).innerHTML;

}else{
	
 a =a+","+ document.getElementById("vt"+q).innerHTML;
 b =b+","+ document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
 c =c+","+ document.getElementById("veh"+q).innerHTML
 d =d+","+ document.getElementById("vd"+q).innerHTML;
 vtt =vtt+","+ document.getElementById("vtt"+q).innerHTML;
 thedate =thedate+","+ document.getElementById("thedate"+q).innerHTML;
 vehreg =vehreg+","+ document.getElementById("vehreg"+q).innerHTML;
 trans =trans+","+ document.getElementById("trans"+q).innerHTML;
}

}
//alert("a>>"+a);
//alert("b>>"+b);
//alert("d>>"+d);
//alert("c>>"+c);
//alert("vtt>>"+vtt);
//alert("thedate>>"+thedate);
//alert("vehreg>>"+vehreg);
//alert("trans>>"+trans);

window.location="ExceptionCheckDailyStatusUpdate.jsp?vehCode='"+c+"'&status='"+b+"'&violationDate='"+d+"'&violationTime='"+a+"'&vt='"+vtt+"'&cnt='"+count+"'&thedate='"+thedate+"'&trans='"+trans+"'&vehreg='"+vehreg+"'";

   }catch(e)
   {
alert(e);
   }
	

	//var status = document.getElementById("status"+count).options[document.getElementById("status"+count).selectedIndex].value;
	//alert(status);
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
final String userName=session.getAttribute("username").toString();

try{
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    st1=conn.createStatement();
    
    //System.out.println("Connection Created");
    
    }catch(Exception E){
    	//System.out.println(""+E);
    }
 
    Calendar cal = Calendar.getInstance();
    DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
    //System.out.println("Today's date is "+dateFormat.format(cal.getTime()));

    cal.add(Calendar.DATE, -1);
    //System.out.println("Yesterday's date was "+dateFormat.format(cal.getTime()));  
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Exception Summary Report of <%=dateFormat.format(cal.getTime()) %></font></td></tr>
			</table>
		</td>
	</tr>
</table>

<form id="ExceptionSummaryDailyReport" name="ExceptionSummaryDailyReport" action="" method="post" onsubmit="">
	
		<%
		 String  exportFileName="exception_daily_summary_of "+dateFormat.format(cal.getTime())+".xls";
		%>
		
		<table width="750px" border="0" align="center">
		<tr>
			<td>
			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
							<div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></div>
        	</td>
		</tr>		
		</table>
	
<div style="width:100%;" align="center" id="table1" >
	<table border="0" width="750px" align="center" class ="sortable">
	<tr>
	<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">The Date</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Veh Code</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Veh Reg No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Transporter</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Type</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Date</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Time</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Suggested Action</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Action By</font></th>
	
	</tr>
	<%
	int count =0;
	String q="";
	try{
			sql ="select * from db_gps.t_exceptiondetails where TheDate ='"+dateFormat1.format(cal.getTime())+"' AND (ViolationType='RAlimit' OR ViolationType='RDlimit' OR ViolationType='OSlimit' OR ViolationType='ND' OR ViolationType='CD' OR ViolationType='Distance') and CheckingStatus='invalid'";
			ResultSet rs=st.executeQuery(sql); 
			//System.out.println("The query is ==>>"+sql);
			while(rs.next())
			{
				String TheDate=rs.getString("TheDate");
				String VehID=rs.getString("VehID");
				String VehRegNo = rs.getString("VehRegNo");
				String Transporter = rs.getString("Transporter");
				String 	ViolationType = rs.getString("ViolationType");
				String ViolationDate = rs.getString("ViolationDate");
				String ViolationTime = rs.getString("ViolationTime");
			
				%>
					<tr>
					<td bgcolor="#f5f5f5" align="right"><%= ++count%> </td>
					<td bgcolor="#f5f5f5" align="left" id ="thedate<%=count %>"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate))%></td>
					<td bgcolor="#f5f5f5" align="right" id = "veh<%=count %>"><%= VehID%></td>
					<td bgcolor="#f5f5f5" align="left" id="vehreg<%=count %>"><%= VehRegNo%></td>
					<td bgcolor="#f5f5f5" align="left" id="trans<%=count %>"><%= Transporter%></td>
					<td bgcolor="#f5f5f5" align="left" id="vtt<%=count %>"><%= ViolationType%></td>
					<%if(ViolationDate !=null) {%>
					<td bgcolor="#f5f5f5" align="left" id="vd<%=count %>"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(ViolationDate))%></td>
					<%}else{
						ViolationDate = "-";
					%>
					<td bgcolor="#f5f5f5" align="left" id="vd<%=count %>"><%= ViolationDate%></td>
					<%}%>
					<td bgcolor="#f5f5f5" align="right" id="vt<%=count %>"><%= ViolationTime%></td>
					<%
					sql1 ="select SuggestedAction,ActionBy from db_gps.t_exceptioncheckingaction where TheDate ='"+dateFormat1.format(cal.getTime())+"' AND vehcode = '"+VehID+"' AND ViolationType='"+ViolationType+"' AND ViolationDate ='"+ViolationDate+"' and ViolationTime='"+ViolationTime+"'";
					ResultSet rs1=st1.executeQuery(sql1); 
					//System.out.println("The query1 is ==>>"+sql1);
					if(rs1.next())
					{
						String SuggestedAction=rs1.getString("SuggestedAction");
						String ActionBy=rs1.getString("ActionBy");
						q = q+","+SuggestedAction;
						%>
						<td bgcolor="#f5f5f5" align="left"><%= SuggestedAction%></td>
						<td bgcolor="#f5f5f5" align="left"><%= ActionBy%></td>
						<%
					}else{
						%>
					<td bgcolor="#f5f5f5" align="center">
					<div>
						<select class="element select medium" id="status<%=count %>" name="status<%=count %>" style="width: 100px; height: 25px;" > 
							<option value="select" selected>Select</option>	
							<option value="unit replcement" >Unit Replacement</option>	
							<option value="Parameter Updatation in Device" >Parameter Updation in Device</option>
							<option value="Server Setting Changed" >Server Setting Changed</option>	
						</select>		
					</div> 
					</td>
					<td bgcolor="#f5f5f5" align="left"><%=userName %></td>
						<%
					}
						
					%>
					
					
					</tr>
			    <%
			}//end of while				
				%>
			</table><br>
			<%
			//System.out.println("The q is :"+q);
			if(q.contains("-") || q.equals("")) { %>
			<table width="750px">
			<tr>
			<td bgcolor="" align="center"><input type ="button" name="upt" id ="upt" value="Submit" onclick="checkStatus('<%=count %>');"></input></td>
			</tr>
			</table>
			<%} %>
			<%
	}catch(Exception e) {
		//System.out.println("The Exception is =>>>"+e);
	}
	%>
	
</div>
</form>

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
