<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
function ShowHide(id)
		{
       // alert(id)
		if(id==0)
			{
		//	alert(id+"dispaly complaint id")
				document.getElementById("compid").style.display="";
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';
			}
			else if(id==1)
			{
		         // alert(id+"dispaly status")
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display="";
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';
			}
			else if(id==2)
			{
		//		alert(id+"dispaly daterange")
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display="";
				document.getElementById("trans").style.display='none';
				document.getElementById("website1").style.display='none';
			}
			else if(id==3){
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display="";
				//document.getElementById("website1").style.display='none';
			}
			else if(id==5){
				//document.getElementById("website1").style.display="";
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display="none";
				
			}
			else{
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';
			}
		}
function addStatus(RId) 
{
	//alert(type);
	window.open('UpdateFleetComplaintStatus.jsp?RId='+RId ,'mywindow','width=400, height=100, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no,left=50, top=50 ');
}

function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}

</script>
<script type="text/javascript">
	function getstatus()
	{
		var CompID=document.getElementById("complaintid").value;
		if(document.getElementById("compid").style.display == "")
		{
		  if(CompID=="")
		   {
		  	 alert("Please Enter The Complaint ID To Show The Complaint.");
		  	 return false;
		   }
		}
		return true;
	}
	function Validate()
	{ 
	    
		if(document.getElementById("data").value=="") 
		{
			alert("Please Select The from date.");
			return false;
		}
		if(document.getElementById("data1").value =="")
	  	{
			alert("please select To Date");
			return false;
	  	}  		
			return datevalidate();
		return true;
	}
	function datevalidate()
	{
		var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;

			return false;
		}
		else if(year==dy1 && year==dy2) if(dm1>month || dm2>month)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}

		if(dm1==month){
			if(dd1>day || dd2>day)
			{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year is should not be greater than to date year");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		
		else if(year==dy1 && year==dy2) if(dm1>dm2)
		{
			alert("From date month is should not be greater than to date month");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		if(dm1==dm2) {
		if(dd1 > dd2)
		{
			alert("From date is should not be greater than to date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		}
		return true;
	}
</script>

<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
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
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 

<%
try{
	//System.out.println("Creating Connection");
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
    Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
    String sdt = fmt.format(td);
    data1=request.getParameter("data");
    String complaintid=request.getParameter("complaintid");
    String inputtype=request.getParameter("dataFilter");
    //System.out.println("----------------------------------------------------------------------???<_>"+inputtype);
    String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
    String staus=request.getParameter("status1");
    String web=request.getParameter("website");
    String owner=request.getParameter("owner");
    String  exportFileName="FV_ComplaintsReport.xls";
    //System.out.println("Connection Created");
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Complaint Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<form name="unit" method="get" action="" onsubmit="datevalidate()" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
		   <td> 
				<input type="radio" name="dataFilter" value="All"
				   onClick="ShowHide(4);" CHECKED> <font color="black" size="2" >All</font>	
				<input type="radio" name="dataFilter" value="compid1" 
				 onClick="ShowHide(0);"><font color="black" size="2">Complaint ID</font>	
				<input type="radio" name="dataFilter" value="status1" 
				 onClick="ShowHide(1);"> <font color="black" size="2">Website</font>	
				 <input type="radio" name="dataFilter" value="daterange1" 
				 onClick="ShowHide(2);"> <font color="black" size="2">Date Range</font>
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="submit" id="submit" value="submit" onclick="return getstatus();"/>
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
	    <tr id="compid" style="display:none" bgcolor="#BDBDBD"> 
	        <td><font color="black" size="2"><b>Complaint ID: &nbsp;&nbsp;</b></font>
	             <input type="text" name="complaintid" id="complaintid">
	             &nbsp; &nbsp; &nbsp;<b>Enter Multiple Complaint ID's With Comma Seperation</b>
	             <!--  <select name="complaintid" id="complaintid" onchange="formsubmitt();">
						<option value="Select">Select</option>
						<%
						String que1="select Distinct(ComplaintID) as ComplaintID from t_ComplaintDetail order by ComplaintID";
						//System.out.println(que1);
						ResultSet rst11=st.executeQuery(que1);
						//System.out.println(que1);
						while(rst11.next()){
						%>   
						       <option value="<%=rst11.getString("ComplaintID") %>"><%=rst11.getString("ComplaintID") %></option>  
						<%
						}
						%>
	        	</select>
	        	 -->
	        </td>
	    </tr>
	    <tr id="status" style="display:none" bgcolor="#BDBDBD"> 
	        <td><font color="black" size="2"><b>Status: &nbsp;&nbsp;</b></font>
	             <select name="status1" id="status1" onchange="formsubmitt();">
						<option value="pending">Pending</option>
						<option value="solved">Solved</option> 
	        	</select>
	        <font color="black" size="2"><b>Website: &nbsp;&nbsp;</b></font>
	             <select name="website" id="website" onchange="formsubmitt();">
						<option value="FleetView">FleetView</option>
						<option value="ERP">ERP</option> 
						<option value="Transworld">Transworld</option> 
						<option value="Diary">Diary System</option> 
	        	</select>
	        </td>
	    </tr>
	    
	    <!-- 
	    <tr>
			<td align="center" colspan="2">
			        <input type="submit" name="submit" id="submit" value="submit" />
			</td>
			 -->
		
	</table>
</form>
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
                        if(inputtype.equalsIgnoreCase("compid1"))
                        {
                          //System.out.println("--------------------equal Egnor case-----");
                        	   	   
                        	   	    if(complaintid != null)
                        	   	    {
                        			 sql="select * from t_ComplaintDetail where ComplaintID in ("+complaintid+") order by ComplaintDateTime Desc";
                        	   	    }
                        	   	 //System.out.println("**************Compalint ID-->"+complaintid);
                        }else if(inputtype.equalsIgnoreCase("status1")){
							sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website='"+web+"' order by ComplaintDateTime asc";
						}else if(inputtype.equalsIgnoreCase("daterange1")){
							sql="select * from t_ComplaintDetail where ComplaintDateTime>='"+fromdate+" 00:00:00' and ComplaintDateTime<= '"+todate+" 23:59:59' order by UpdatedDateTime asc";
						}else{
							sql="select * from t_ComplaintDetail order by ComplaintDateTime Desc";
						}
                        ResultSet rst1=stQuickTest.executeQuery(sql);
                        //System.out.println("----------------------------------------------sb------>"+sql);
                        int i=1;
%>

<form id="ComplaintsReport" name="ComplaintsReport" action="" method="post">
<table border="0" bgcolor="white" width="100%">
	<tr>
		<td>
		<table width=100%>
			<tr>
					<td id="excel"><div align="right">
                    <a href="excelFleetViewComplaintReport.jsp?dataFilter=<%=inputtype%>&calender=<%=fromdate%>&calender1=<%=todate%>&Status=<%=staus%>&complaintid=<%=complaintid%>&website=<%=web%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>&nbsp;&nbsp;&nbsp;Date : <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
                    </div></td>
			</tr>
		</table>
		<div id="mytable">

			<table border="1" align="center" class="sortable">
				<tr  bgcolor="#BDBDBD">
					<td><b> Sr.</b></td>
					<td><b>ComplaintID</b></td>
					<td><b>Complaint Date & time</b></td>
           			<td><b>Catagory</b></td>
           			<td><b>Website</b> </td>
           			<td><b>Report Name</b> </td>
           			<td><b>Priority</b></td>
           			<td><b>Description</b></td>
					<td><b>Name</b> </td>
					<td style="width: 10px"><b>EmailID</b></td>
					<td><b>Contact</b></td>
					<td><b>Closed Date</b></td>
					<td><b>ClosedBy</b></td>
					<td><b>Closing Comment</b></td>
					<td><b>Status</b></td>
					</tr>
                      <% while(rst1.next())
                         {
                        String File=rst1.getString("filename");
                        //File=File.substring(27,File.length());
                       %>	
				<tr>
                    <td colspan="1"><div align="right"><%=i%></div></td>
                    <td colspan="1"><div align="right">
                    <%
				                     	if(rst1.getString("Status").contains("Pending"))
					                       {
					                 %>
                    <a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("ComplaintID")%>
                    <div class="popup" id="popup<%=i%>">
						<table border="0" >
							<tr>
								<td>
								    <%
				                     	if(rst1.getString("Status").contains("Pending"))
					                       {
					                 %>
					                     <a href="#" onclick="addStatus('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Close</a>
					                     <%} 
					                     else
					                       {
                                           %>
                                           
                                          <%} %>
								</td>
							</tr>
						</table>
				    </div>
				    </a>
				    </div>
				    <%}else{ %>
				    <%=rst1.getString("ComplaintID")%>
				    <%} %>
				    </td>
				    <td colspan="1" sorttable_customkey="20080211131900"><div align="left"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("ComplaintDateTime")))%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("Category")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("Website")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("ReportName")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("Priority")%></div></td>
					<td colspan="1"><div align="left" style="overflow: auto; width: 120px;"><%=rst1.getString("Description")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("Name")%></div></td>
					<td colspan="1"><div align="left" style="overflow: auto; width: 120px;"><%=rst1.getString("Email1")%></div></td>
					<td colspan="1"><div align="right"><%=rst1.getString("ContactNumber")%></div></td>
					<%
					String dt =rst1.getString("Closeddatetime");
					//System.out.println("---------------------------->"+dt);
					if(dt == null)
					{
				    %>
				    <td colspan="1"><div align="left">-</div></td>
				    <%
					}
					else
					{
					%>
					<td colspan="1"><div align="left"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("Closeddatetime")))%></div></td>
					<%
					}
					%>
					<td colspan="1"><div align="left"><%=rst1.getString("ClosedBy")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("ClosingComment")%></div></td>
					<%
			   	   if(rst1.getString("Status").contains("Pending"))
			         {
					  %>
					<td colspan="1"><div align="left"><%=rst1.getString("Status") %></div></td>
                    <%} 
					else
					{
                    %>
                    <td colspan="1"><div align="left"><%=rst1.getString("Status") %></div></td> 
                    <%} %>
                                 
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
</td></tr></table></form>
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
