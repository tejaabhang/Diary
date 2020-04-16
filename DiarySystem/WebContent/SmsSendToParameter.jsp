<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
%>
<html>
<head>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
function addStatus(RId,ConfStatus) 
{
	//alert(type);
	window.open('SmsStatus.jsp?RId='+RId + '&ConfStatus='+ConfStatus,'mywindow','width=500, height=150, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no,left=50, top=50 ');
}
function ShowHide(id)
		{
//alert(id)
		if(id==0)
			{
		//	alert(id+"dispaly complaint id")
				
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
			}
			else if(id==1)
			{
		//		alert(id+"dispaly status")
				
				document.getElementById("status").style.display="";
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
			}
			else if(id==2)
			{
		//		alert(id+"dispaly daterange")
				
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display="";
				document.getElementById("trans").style.display='none';
			}
			else if(id==3){
				
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display="";
			}
			else{
				
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
			}
		}
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
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 



<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn1.createStatement();
    st3=conn1.createStatement();
    st4=conn1.createStatement();
    stQuickTest=conn1.createStatement();
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("yyyy-MM-dd");
    Format fmt1 = new SimpleDateFormat("dd-MM-yyyy");
    String sdt = fmt.format(td);
    data1=request.getParameter("data");
    String complaintid=request.getParameter("complaintid");
    String inputtype=request.getParameter("dataFilter");
    //System.out.println(inputtype);
    String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
    String staus=request.getParameter("status1");
    String owner=request.getParameter("owner");
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="#2A0A12" size="3">Sms Sent Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
		   <td> 
				<input type="radio" name="dataFilter" value="All"
				   onClick="ShowHide(4);" CHECKED> <font color="black" size="2" >All</font>	
				<input type="radio" name="dataFilter" value="status1" 
				 onClick="ShowHide(1);"> <font color="black" size="2">Status</font>	
				 <input type="radio" name="dataFilter" value="daterange1" 
				 onClick="ShowHide(2);"> <font color="black" size="2">Date Range</font>
			</td>
		</tr>
		<tr id="daterange"  style="display:none"  bgcolor="#BDBDBD"> <td><font color="black" size="2"><b>From Date:</b> </font>
					<input type="text" id="calender" name="calender" size="13" value="<%=sdt%>" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;&nbsp;&nbsp;
					
				<font color="black" size="2"><b>To Date:</b> </font>
					<input type="text" id="calender1" name="calender1" size="13" value="<%=sdt%>" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "calender1",         // ID of the input field
			                    ifFormat    : "%Y-%m-%d",     // the date format
			                    button      : "trigger1"       // ID of the button
			               }
			                             );
              		 </script>
		</td></tr>
		
	    
	    
	    <tr id="status" style="display:none" bgcolor="#BDBDBD"> 
	        <td><font color="black" size="2"><b>Status: &nbsp;&nbsp;</b></font>
	             <select name="status1" id="status1" onchange="formsubmitt();">
						<option value="pending">Pending</option>
						<option value="confirmed">Confirmed</option> 
	        	</select>
	        </td>
	    </tr>
	    <tr>
			<td align="center" colspan="2">
				<input type="submit" name="submit" id="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>
<br></br>

<%
String dd=request.getQueryString();
if(dd==null)
{
%>


<%
}
else
{

%>

<br></br>
			 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<!--  	<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3">Mail History Report for Token &nbsp;<%=data1%></font></div>
						<div align="right">
						<a href="Sendmailreportexcel.jsp?dataFilter=<%=inputtype%>&calender=<%=fromdate%>&calender1=<%=todate%>" title="Export to Excel">
						<img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
						<font color="black" size="2"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
						</font></div>
					</td>
				</tr>
				-->
			</table>
			<br>
<%
                       
                    

                        
%>

			<table border="1" width="100%" align="center" class="sortable">
			<tr bgcolor="#BDBDBD">
<th >Sr.No</th>
<th >VehicleRegNo</th>
<th >Transporter</th>
<th >UnitID</th>
<th >MobNo</th>
<th >ActualMsg</th>
<th >MsgType</th>
<th >SenderID</th>
<th >Date_Time</th>
<th >ConfStatus</th>
</tr>
<%
String SqlDetails=""; 
int i=1;
if(inputtype.equalsIgnoreCase("status1")){
	 SqlDetails="select * from db_gps.t_msgSentDetails where ConfStatus='"+staus+"' and EntBy='Auto'";
}else if(inputtype.equalsIgnoreCase("daterange1")){
	SqlDetails="select * from db_gps.t_msgSentDetails where Date_Time >='"+fmt1.format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))+" 00:00:00' and Date_Time <= '"+fmt1.format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))+" 23:59:59' and EntBy='Auto' ";
}else if(inputtype.equalsIgnoreCase("All")){
	SqlDetails="select * from db_gps.t_msgSentDetails where EntBy='Auto' ";
}else{
	SqlDetails="select * from db_gps.t_msgSentDetails where ConfStatus='Pending'  and EntBy='Auto'";
}
//System.out.println(">>>>>>>SqlDetails:"+SqlDetails);
ResultSet rsSmsDetails=st.executeQuery(SqlDetails);
  while(rsSmsDetails.next())
  {
   ///String Date=sdf.format(new SimpleDateFormat("dd-MMM-yyyy").parse(rsSmsDetails.getString("Date_Time")));
  String ConfDateTime=rsSmsDetails.getString("ConfDateTime");
  String ConfBy=rsSmsDetails.getString("ConfBy");
  String ConfComments=rsSmsDetails.getString("ConfComments");
%>
<tr>
<td ><div align="right" ><%=i %> </div></td>
<td ><div align="left" ><%=rsSmsDetails.getString("VehicleRegNo") %></div></td>
<td ><div align="left" ><%=rsSmsDetails.getString("Transporter") %></div></td>
<td ><div align="right" ><%=rsSmsDetails.getString("UnitID") %></div></td>
<td ><div align="right" ><%=rsSmsDetails.getString("MobNo") %></div></td>
<td ><div align="left" style="width:200px;overflow: auto;"><%=rsSmsDetails.getString("ActualMsg") %></div></td>
<td ><div align="left" ><%=rsSmsDetails.getString("MsgType") %></div></td>
<td ><div align="left" ><%=rsSmsDetails.getString("SenderID") %></div></td>
<td ><div align="right" ><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(rsSmsDetails.getString("Date_Time")))%></div></td>
<%
if(rsSmsDetails.getString("ConfStatus").equalsIgnoreCase("Pending")){
%>
<td ><div align="left" ><a href="#" onclick="addStatus('<%=rsSmsDetails.getString("RId") %>','<%=rsSmsDetails.getString("ConfStatus") %>')"><font color="blue"><%=rsSmsDetails.getString("ConfStatus") %></font></a></div></td>
<%
}else{
%>
<td a href="#" onmouseover="ajax_showTooltip(window.event,'showSmsConfirmationDetails.jsp?ConfDateTime=<%=ConfDateTime%>&ConfBy=<%=ConfBy%>&ConfComments=<%=ConfComments%>',this);return false" onMouseOut="ajax_hideTooltip();"> <b>Confirmed</b></td>
<%
}
%>
</tr>
<% 
  i++;
  } 
%>
</table>
			

                        <br>
                        

						
			

                        <br>

			
		
					
			
<%
}}catch(Exception e)
{
    out.print("Exception -->"+e);

}
finally
{
    conn.close();
    conn1.close();

}
%>
<table width="750px" height="350px">
	<tr>
		<td></td>
	</tr>
</table>

<!-- code end here ---></div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright © 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>
