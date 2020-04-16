<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%!
	Connection con;
	
	%>

<head>


<title>Attend form</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="css/chrome.js"></script>


	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>
<script type="text/javascript">

function confirmSubmit()
{
	if(document.getElementById("attendingComment").value == "") {
		alert("Enter Closing Comments!");
		return false;
		}
	
var agree=confirm("Are you sure you wish to attend this complaint?");
if (agree)
	return true ;
else
	return false ;
}

</script>
</head>

<body>
<%
Statement st=null;
Statement st1=null;
Statement st2=null;
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
<%
//Statement st=conn.createStatement();

String RId=request.getParameter("RId");
System.out.println("************"+RId+"***********");
String ConfComments="";

try
{
	con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = con.createStatement();
		st1 = con.createStatement();
		st2 = con.createStatement();
} catch (Exception e) {
}
%>
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Attend Form</a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<form id="attendComplaints"  name="attendComplaints" class="appnitro" enctype="multipart/form-data" action="AttendFVComplaintStatus.jsp" method="get" onsubmit = "return confirmSubmit()">
								
  <ul >
	<div align="center" style="width:100%; ">
	<table border="0" width="100%" align="center" CELLPADDING=10 style="background: #f8fcff">
			
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Complaint ID </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%= RId%> 		
	  </td>
   </tr>
	
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Complaint Resolution Time: </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<div>
		<label for="element_2_1"><font size="2">Date</font></label>
			<input type="text" id="data" name="resTime" size="12" value="<%=datenew1%>" 
			style="width: 70px; height: 20px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;"readonly />
			<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "data",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "data"       // ID of the button
					    }
					  );
				</script>
			<label><font size="2">HH</font></label>
			<select class="element select medium" id="hr" name="hr" style="width: 50px; height: 25px;" > 
			<option value="00" >00</option>                 
			<option value="01" >01</option>		
			<option value="02" >02</option>
			<option value="03" >03</option>
			<option value="04" >04</option>
			<option value="05" >05</option>
			<option value="06" >06</option>
			<option value="07" >07</option>
			<option value="08" >08</option>
			<option value="09" >09</option>
			<option value="10" >10</option>
			<option value="11" >11</option>
			<option value="12" >12</option>
			<option value="13" >13</option>
			<option value="14" >14</option>
			<option value="15" >15</option>
			<option value="16" >16</option>
			<option value="17" >17</option>
			<option value="18" >18</option>
			<option value="19" >19</option>
			<option value="20" >20</option>
			<option value="21" >21</option>
			<option value="22" >22</option>
			<option value="23" >23</option>			
		</select>
		<label for="element_2_1"><font size="2">MM</font></label>
		<select class="element select medium" id="min" name="min" style="width: 50px; height: 25px;" > 
			<option value="00" >00</option>                 
			<option value="01" >01</option>		
			<option value="02" >02</option>
			<option value="03" >03</option>
			<option value="04" >04</option>
			<option value="05" >05</option>
			<option value="06" >06</option>
			<option value="07" >07</option>
			<option value="08" >08</option>
			<option value="09" >09</option>
			<option value="10" >10</option>
			<option value="11" >11</option>
			<option value="12" >12</option>
			<option value="13" >13</option>
			<option value="14" >14</option>
			<option value="15" >15</option>
			<option value="16" >16</option>
			<option value="17" >17</option>
			<option value="18" >18</option>
			<option value="19" >19</option>
			<option value="20" >20</option>
			<option value="21" >21</option>
			<option value="22" >22</option>
			<option value="23" >23</option>
			<option value="24" >24</option>
			<option value="25" >25</option>
			<option value="26" >26</option>
			<option value="27" >27</option>
			<option value="28" >28</option>
			<option value="29" >29</option>
			<option value="30" >30</option>
			<option value="31" >31</option>
			<option value="32" >32</option>
			<option value="33" >33</option>
			<option value="34" >34</option>
			<option value="35" >35</option>
			<option value="36" >36</option>
			<option value="37" >37</option>
			<option value="38" >38</option>
			<option value="39" >39</option>
			<option value="40" >40</option>
			<option value="41" >41</option>
			<option value="42" >42</option>
			<option value="43" >43</option>
			<option value="44" >44</option>
			<option value="45" >45</option>
			<option value="46" >46</option>
			<option value="47" >47</option>
			<option value="48" >48</option>
			<option value="49" >49</option>
			<option value="50" >50</option>
			<option value="51" >51</option>
			<option value="52" >52</option>
			<option value="53" >53</option>
			<option value="54" >54</option>
			<option value="55" >55</option>
			<option value="56" >56</option>
			<option value="57" >57</option>
			<option value="58" >58</option>
			<option value="59" >59</option>		
		</select>
		
		</div> 
	</td>
	</tr>
	
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Comments </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<textarea name ="attendingComment" id = "attendingComment"  class="element textarea small" style="width: 250px;"></textarea>		
	 </td>
	</tr>
	<tr>
		<td>
		</td>	
		<td align="left">
				<input type="hidden" name="RId" id="RId" value="<%= RId%>">
		</td>
	</tr>
	
	
</table>
</div>
		

		<br /><br />
		
			<div align = "center">
			<input type="submit" id="Attend" name="Attend" value="Attend" style="background: #E8EEF7"/> 
			</div>
</form>

<h3 align="center">
		<table width="100%"  style="background: #E8EEF7">
		<tr>
		
		<br></br>
		<td><div style="text-align: center;"><a>Complaint History</a></div></td>
		</tr>
		
		</table></h3>
		<br />
<%
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat sdf1=new SimpleDateFormat("dd-MMM-yyyy HH:mm");


String issue="-",date="-",report="-",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",priority="-",status="-",EmailID="-",Email1="-",udate="",escalatedDept="-",ExpectedResolutionTime="";
String sql="select * from db_gps.t_ComplaintDetail where ComplaintID='"+RId+"'";
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
	issue=rs.getString("Description");
	date=rs.getString("ComplaintDateTime");
	udate=rs.getString("UpdatedDateTime");
	report=rs.getString("ReportName");
	Website=rs.getString("Website");
	EntBy=rs.getString("Name");
//	EmailID=rs.getString("EmailID");
	Email1=rs.getString("Email1");
	Category=rs.getString("Category");
	priority=rs.getString("Priority");
	ContactNumber=rs.getString("ContactNumber");
	status=rs.getString("Status");
	escalatedDept=rs.getString("EscalatedDept");
}

String sql1="SELECT ExpectedResolutionTime FROM db_gps.t_ComplaintDetailHistory WHERE ComplaintID = '"+RId+"' AND ExpectedResolutionTime <> '' ";
ResultSet rs1=st2.executeQuery(sql1);
while(rs1.next()){
	ExpectedResolutionTime=rs1.getString("ExpectedResolutionTime");
}
System.out.println("The ExpectedResolutionTime :"+ExpectedResolutionTime);
if(ExpectedResolutionTime=="" || ExpectedResolutionTime==null || ExpectedResolutionTime.equals(null)) {
	ExpectedResolutionTime = "-";
}else{
	ExpectedResolutionTime=sdf1.format(sdf.parse(ExpectedResolutionTime));
}
%>

	<div style="width:100%; align="center"">
	<table border="0" width="100%" CELLPADDING=2 style="background: #f8fcff;">
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Complaint ID </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=RId %>	 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Complaint Date & Time </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=sdf1.format(sdf.parse(date)) %>	 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Exp Resolution Time </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=ExpectedResolutionTime %>	 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Last Updated Date & Time </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=sdf1.format(sdf.parse(udate)) %>	 		
	  </td>
   </tr>		
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Complaint Description </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=issue %>	 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Report Name </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=report %>	
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Category </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<%=Category %>	 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Priority </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%=priority %> 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Recipients Email IDs </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%=Email1 %> 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Contact No </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%=ContactNumber %> 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Status </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%=status %> 		
	  </td>
   </tr>
   <tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>EscalatedDept </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<%=escalatedDept %> 		
	  </td>
   </tr>
</table><br>
<table style="background: #f8fcff;" width="100%">
	<tr style="background-color: #E8EEF7">
	<th style="width: 30%;">Action</th><th align="left" style="width: 37%;">ActionDateAndTime</th> <th style="width: 33%;">ActionBy</th> 
   </tr>
</table>
   <%
   String query1 = "select Status,UpdatedDateTime,Name,updateComment,Description from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' order by SrNo ASC";
   ResultSet rs2 = st1.executeQuery(query1);
   while(rs2.next())
    {
	%>
	<table style="background: #f8fcff;" width="100%">
	<tr><td style="width: 30%;"><%=rs2.getString("Status") %></td><td style="width: 37%;"><%=sdf1.format(sdf.parse(rs2.getString("UpdatedDateTime"))) %></td><td style="width: 33%;"><%=rs2.getString("Name") %></td></tr>
	<tr>
	</table>
	<table style="background: #f8fcff;" width="100%">
	<tr>
		<td width="100%">
			<%if(rs2.getString("Status").equals("Pending")) { %>
			<b>Description :</b><%=rs2.getString("Description")%>
			<%}else{ %>
			<b>Comments : </b><%=rs2.getString("updateComment")%>
			<%} %>
		</td>
	</tr>
	</table><br/>
	<%} %>
<br>
</div>		
</ul>
</div>
</body>
</html>