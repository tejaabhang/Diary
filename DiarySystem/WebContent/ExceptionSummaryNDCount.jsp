<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st;
String sql;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Exception Details of ND</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
		
<script type="text/javascript">
function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.ExceptionSummaryNDCount.action ="excel.jsp";
          document.forms["ExceptionSummaryNDCount"].submit();
}
function registercom(cnt,fdate,tdate){
	try{
 		 //alert(">>"+cnt+">>");
 		//var  fdate= document.getElementById("fdate").value;
	 	//var  tdate= document.getElementById("tdate").value;
 		var theDate = document.getElementById("thedate"+cnt).innerHTML;
 		var vehCode = document.getElementById("veh").innerHTML;
 		var vehRegNo = document.getElementById("vehReg").innerHTML;
 		var trans = document.getElementById("trans").innerHTML;
 		var violationType = document.getElementById("vtt").innerHTML;
 		var violationDate = document.getElementById("vd"+cnt).innerHTML;
 		var violationTime = document.getElementById("vt"+cnt).innerHTML;
 		var violationValue = document.getElementById("vioval"+cnt).innerHTML;
 		//var violationValue2 = document.getElementById("vioval2"+cnt).innerHTML;

 		//alert(">thedate>"+theDate+">>");
 		//alert(">vehCode>"+vehCode+">>");
 		//alert(">vehRegNo>"+vehRegNo+">>");
 		//alert(">trans>"+trans+">>");
 		//alert(">violationType>"+violationType+">>");
 		//alert(">violationDate>"+violationDate+">>");
 		//alert(">violationTime>"+violationTime+">>");
 		//alert(">violationValue>"+violationValue+">>");
 		//alert(">violationValue2>"+violationValue2+">>");
 		 
 	 	window.location.href = "ExceptionRegisterComplaintDiary.jsp?TheDate='"+theDate+"'&VehCode='"+vehCode+"'&VehRegNo='"+vehRegNo+"'&Trans='"+trans+"'&ViolationType='"+violationType+"'&ViolationDate='"+violationDate+"'&ViolationTime='"+violationTime+"'&ViolationValue='"+violationValue+"'&fDate='"+fdate+"'&tDate='"+tdate+"' ";
		//alert(">>>hihih");
 	 }catch(e)
 	 {
 		 alert(e);
 	 }
}
function checkStatus(count) {
	//alert(">>"+count);
	
for(var q=1;q<=count;q++)
{
	var stat = document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
	//alert(">>"+SuggestedAction+q);
	if(stat=="Select")
	{
		alert("Please select a check status!");
		return false;
	}
}

   try{

	 var  c= document.getElementById("veh").innerHTML;
	 var  fdate= document.getElementById("fdate").value;
	 var  tdate= document.getElementById("tdate").value;
	 var  vtt= document.getElementById("vtt").innerHTML;
var a="",b="",d="";	   
for(var q=1;q<=count;q++)
{
//alert("hi>>>");


//alert("a>>>>"+document.getElementById("vt"+q).innerHTML);   
if(q==1){
	
a= document.getElementById("vt"+q).innerHTML;
b =document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
d= document.getElementById("vd"+q).innerHTML;

}else{
	
 a =a+","+ document.getElementById("vt"+q).innerHTML;
 b =b+","+ document.getElementById("status"+q).options[document.getElementById("status"+q).selectedIndex].innerHTML;
 d =d+","+ document.getElementById("vd"+q).innerHTML;
}

}
//alert("a>>"+a);
//alert("b>>"+b);
//alert("d>>"+d);
//alert("c>>"+c);
//alert("fdate>>"+fdate);
//alert("tdate>>"+tdate);
//alert("vtt>>"+vtt);


window.location="ExceptionCheckStatusUpdate.jsp?vehCode='"+c+"'&status='"+b+"'&violationDate='"+d+"'&violationTime='"+a+"'&fDate='"+fdate+"'&tDate='"+tdate+"'&vt='"+vtt+"'&cnt='"+count+"'";

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
String fDate = request.getParameter("fDate");
String tDate = request.getParameter("tDate");
//String ND = request.getParameter("ND");
String vehID = request.getParameter("vehID");
//String q = request.getParameter("q");

	if(tDate.contains("\'")) 
	{
		tDate =tDate.replaceAll("\'","");
	}
	if(fDate.contains("\'")) 
	{
		fDate =fDate.replaceAll("\'","");
	}
	if(vehID.contains("\'")) 
	{
		vehID =vehID.replaceAll("\'","");
	}
	

	//System.out.println("The  fDate is :"+fDate);
	//System.out.println("The  tDate is :"+tDate);
	////System.out.println("The limit is :"+ND);
	//System.out.println("The vehID is :"+vehID);
	////System.out.println("The trans is :"+trans);

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
				<tr><td align="center"><font color="black" size="3">Exception Details of ND</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br />			

<form id="ExceptionSummaryNDCount" name="ExceptionSummaryNDCount" action="" method="post" onsubmit="">
	
		<%
		 String  exportFileName="exception_summary_count_ND.xls";
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
	<table border="0" width="750px" align="center" class = "sortable">
	<tr>
	<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">The Date</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Vehicle ID</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Vehicle Reg No</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Transporter</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Type</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Date</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Time</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Value1</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Value2</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Value3</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Violation Value4</font></th>
	<th bgcolor="#E6E6E6"><font size="2">Check Status</font></th>
	</tr>
	<%
	try{
	int count =0;
	String q="";
			sql ="select * from db_gps.t_exceptiondetails where TheDate BETWEEN '"+fDate+"' and '"+tDate+"' and VehID = '"+vehID+"' and ViolationType = 'ND' order by SrNo";
			//System.out.println("The query is ==>>"+sql);
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
				String ViolationValue1 = rs.getString("ViolationValue1");
				String ViolationValue2 = rs.getString("ViolationValue2");
				String ViolationValue3 = rs.getString("ViolationValue3");
				String ViolationValue4 = rs.getString("ViolationValue4");
				String chkstatus = rs.getString("CheckingStatus");
				String CompStatus = rs.getString("CompStatus");
				//System.out.println("The status is >>"+chkstatus);
				q=q+","+chkstatus;
				//System.out.println("The q is >>"+q);
				
				%>
					<tr>
					<td bgcolor="#f5f5f5" align="right"><%= ++count%> </td>				
					<td bgcolor="#f5f5f5" align="left" id="thedate<%=count %>"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate))%></td>				
					<td bgcolor="#f5f5f5" align="right" id = "veh"><%= VehID%></td>
					<td bgcolor="#f5f5f5" align="left" id = "vehReg"><%= VehRegNo%></td>
					<td bgcolor="#f5f5f5" align="left" id="trans"><%= Transporter%></td>
					<td bgcolor="#f5f5f5" align="left" id="vtt"><%= ViolationType%></td>
					<%if(ViolationDate !=null) {%>
					<td bgcolor="#f5f5f5" align="left" id="vd<%=count %>"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(ViolationDate))%></td>
					<%}else{
						ViolationDate = "-";
					%>
					<td bgcolor="#f5f5f5" align="left" id="vd<%=count %>"><%= ViolationDate%></td>
					<%}%>
					<td bgcolor="#f5f5f5" align="right" id="vt<%=count %>"><%= ViolationTime%></td>
					<td bgcolor="#f5f5f5" align="right" id = "vioval<%=count %>"><%= ViolationValue1%></td>
					<td bgcolor="#f5f5f5" align="right"><%= ViolationValue2%></td>
					<td bgcolor="#f5f5f5" align="right"><%= ViolationValue3%></td>
					<td bgcolor="#f5f5f5" align="right"><%= ViolationValue4%></td>
					
					<%if ((chkstatus.equals("-") || chkstatus=="-") || chkstatus.equalsIgnoreCase("-")) { %>
					<td bgcolor="#f5f5f5" align="right">
					<div>
						<select class="element select medium" id="status<%=count %>" name="status<%=count %>" style="width: 70px; height: 22px;" > 
							<option value="select" >Select</option>	
							<option value="valid" >valid</option>
							<option value="invalid" >invalid</option>	
						</select>		
					</div> 
					</td>
					<%} else{
					if(chkstatus.equals("valid")) {						
					%>					
					<td bgcolor="#f5f5f5" align="left"><%=chkstatus %></td>
					<%}else{
						if(CompStatus=="-" || CompStatus.equals("-")) {
					%>
					<td bgcolor="#f5f5f5" align="left"><%=chkstatus %></td>
					<td  align="left"><a href="#" onclick="registercom('<%= count %>','<%=fDate %>','<%= tDate%>');">Register Complaint</a></td>
					<%
						}else{
							%>
							<td bgcolor="#f5f5f5" align="left"><%=chkstatus %></td>
							<td  align="left">Complaint Registered</td>
							<%
						}
						}
					} %>
					</tr>
					<%
			
	}//end while
	%>
	</table><br>	
	
		<%if (q.contains("-")) { %>
		<input type ="hidden" name="fdate" id ="fdate" value="<%=fDate %>"></input>
		<input type ="hidden" name="tdate" id ="tdate" value="<%=tDate %>"></input>
		<table width="750px">
		<tr>
		<td bgcolor="" align="center"><input type ="button" name="upt" id ="upt" value="Submit" onclick="checkStatus('<%=count %>');"></input></td>
		</tr>
		</table>
		<%} else{}%>
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
