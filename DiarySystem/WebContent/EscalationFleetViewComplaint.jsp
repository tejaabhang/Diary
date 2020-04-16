<%@ page language="java"  import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<!--< %@ include file="header.jsp"%>-->
<%@ include file="headerpopdiary.jsp"%>


<%!
	Connection con;
	
	%>

<head>


<title>Escalation form</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

<script type="text/javascript">
function validateForm() {

		var Dept= document.getElementById("esclateDept").options[document.getElementById("esclateDept").selectedIndex].value;
		if(Dept=="select") {
		alert("Please Select a Department for Escalation!");
		return false;
	}
return true;
}

function confirmSubmit()
{
	var Dept= document.getElementById("esclateDept").options[document.getElementById("esclateDept").selectedIndex].value;
	if(Dept=="select") {
	alert("Please Select a Department for Escalation!");
	return false;
	}
	if(document.getElementById("escComment").value =="") {
		alert("Enter Comments for Escalation!");
		return false;
		}
	
var agree=confirm("Are you sure you wish to Escalate complaint?");
if (agree)
	return true ;
else
	return false ;
}

function openpopup(PageName)
{
	 try{
		 //alert(e);
	 testwindow=window.open("RegisterComplaint_diary.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes");
	 testwindow.moveTo(200,200);
	 }catch(e)
	 {
		 alert(e);
	 }
}



</script>
</head>


<body>
<%
Statement st1=null;
Statement st=null;
Statement st2=null;




String RId=request.getParameter("RId");
//System.out.println("************"+RId+"***********");

try
{
	con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st1 = con.createStatement();
		st = con.createStatement();
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
		</td>
		
		<td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Escalation Form</a></div></td>
		
		
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td>
		
		
		
		</tr>
		</table></h1>
		<br />
<form id="escalation"  name="escalation" class="appnitro" enctype="multipart/form-data" action="EscalationFVComplaint.jsp" method="get" onsubmit="return confirmSubmit()">
								
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
			<b>Escalation in Dept:</b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
		<div>
		<select class="element select medium" id="esclateDept" name="esclateDept" style="width: 150px; height: 25px;" >
			<option value="select" >select</option>
			<%
            String query5 = "select distinct(DeptName) from db_leaveapplication.t_department order by RId";
             ResultSet rs5 = st1.executeQuery(query5);
             while(rs5.next())
              {
			%>
			<option value="<%=rs5.getString("DeptName") %>" ><%=rs5.getString("DeptName")%></option>
			<%} %>
			
		</select>
	  </div> 
		
				
	 </td>
	</tr>
	
	<tr>
		<td align="left" colspan="4" style="width: 30%;">			
			<b>Comments </b> 		
	  </td>
	  <td align="left" colspan="4" style="width: 70%;">			
			<textarea name ="escComment" id = "escComment"  class="element textarea small" style="width: 250px;"></textarea>		
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
			<input type="submit" id="Escalate" name="Escalate" value="Escalate" style="background: #E8EEF7"/> 
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


String issue="-",date="-",report="-",Website="-",mailto="-",EntBy="-",Category="-",ContactNumber="-",priority="-",status="-",EmailID="-",Email1="-",udate="",ExpectedResolutionTime="";
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
	//ExpectedResolutionTime=rs.getString("ExpectedResolutionTime");
}

String sql1="SELECT ExpectedResolutionTime FROM db_gps.t_ComplaintDetailHistory WHERE ComplaintID = '"+RId+"' AND ExpectedResolutionTime <> '' ";
ResultSet rs1=st2.executeQuery(sql1);
while(rs1.next()){
	ExpectedResolutionTime=rs1.getString("ExpectedResolutionTime");
}
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
<br></br><br></br>
</div>		
</ul><br/>
</div>

</body>

<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</html>