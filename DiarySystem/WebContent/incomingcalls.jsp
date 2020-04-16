<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.OutgoingIncomingCalls"
		import="com.transworld.diary.framework.UnitDetailsDao"
		import="com.transworld.diary.framework.Representative"
%>
		
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>
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
		function fun1()
		{
			document.form1.submit();
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
          <p></p>
<%@ include file="header1.jsp" %>
          </div>
			<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%!
final String TRANSWORLD="Transporter";

%>
<%
try
{
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
final String today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime() - 7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
final String oldDate=formatter.format(defoultdate);
final String userName=session.getAttribute("username").toString();
final String userrole=session.getAttribute("userrole").toString();
final String fromDateRequest=request.getParameter("fromDate");
final String toDateRequest=request.getParameter("toDate");
final String fromDate = (fromDateRequest == null) ? oldDate : fromDateRequest.toString();
final String toDate = (toDateRequest == null) ? today : toDateRequest.toString();
final String callerNameRequest=request.getParameter("callername");
final String caller = (null == callerNameRequest) ? userName : callerNameRequest;
final String callerTypeRequest=request.getParameter("recievertype");
final String callerType = (null == callerTypeRequest) ? TRANSWORLD : callerTypeRequest;
final String callTypeForOutgoing="";
final String callTypeForIncoming="InComing";
int number= 0;
int representativeRecords= 0;
List<OutgoingIncomingCalls> outgoingIncomingCalls=null;
List<Representative> representative=null;
try{
	outgoingIncomingCalls = unitDetailsDao.getOutgoingIncomingCalls(fromDate,toDate,caller,callerType,callTypeForOutgoing,callTypeForIncoming);       	
   	number = outgoingIncomingCalls.size();
   	representative = unitDetailsDao.getRepresentative();       	
   	representativeRecords = representative.size();
} catch(Exception e){
	e.printStackTrace();
}

%>
		<hr width="750px"/>
		<table border="0" width="750px" align="center">
			<tr>
				<td >
					<center><b>Incoming call to <%=callerType%>, by <%=caller%> since <%=fromDate %> till <%=toDate %></b></center>
				</td>
			</tr>
			<tr>
				<td><div align="right">
					<form action="" name="form1" id="form1" method="get">
						<select name="recievertype" class="formElement">
							<option value="Transporter">Transporter</option>		
							<option value="Technician">Technician</option>
						</select>
						
					<input type="text" id="fromDate" name="fromDate" size="13" class="formElement" value="<%=fromDate%>" readonly/>
					<input type="button" name="trigger" id="trigger" value="From Date" class="formElement"/>
            	    <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			        </script>
             
          		    <input type="text" id="toDate" name="toDate" size="13" class="formElement" value="<%=toDate%>" readonly/>
					<input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement"/>
            	    <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "toDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger1"       // ID of the button
			             }
			                           );
            		 </script>
            		 <select name="callername" class="formElement">
<%
for (int counter = 0; counter < representativeRecords; counter++) 
	{
		final Representative currentRecord = representative.get(counter);
		int i = counter+1;
%>
				<option value='<%=currentRecord.getName()%>' <% if(currentRecord.getName().equals(caller)) { out.print("Selected"); }%>><%=currentRecord.getName()%></option>				
<%
	}		
%>		
						</select>
            		 <input type="Submit" name="Submit" Value="Submit" class="formElement">
            	 </form>
				</div></td>
			</tr>
		</table>
		<hr width="750px"/>
		<table border="1" width="750px" align="center" class="sortable">
			<tr>
				<td><font color="black" size="2">Sr.</font></td>
				<td><font color="black" size="2">Contact Name.</font></td>
				<td><font color="black" size="2">Date</font></td>
				<td><font color="black" size="2">Time</font></td>
				<td><font color="black" size="2">Caller</font></td>
				<td><font color="black" size="2">Comment</font></td>
				<td><font color="black" size="2"><%=callerType%></font></td>
			</tr>
<%
for (int counter = 0; counter < number; counter++) 
	{
		final OutgoingIncomingCalls currentRecord = outgoingIncomingCalls.get(counter);
		int i = counter+1;
%>
			<tr>
				<td><%=i%></td>
				<td><%=currentRecord.getContactName()%></td>
				<td><%=currentRecord.getDate()%></td>
				<td><%=currentRecord.getTime()%></td>
				<td><%=currentRecord.getCaller()%></td>
				<td><%=currentRecord.getComment()%></td>
				<td><%=currentRecord.getTransporter()%></td>
			</tr>
<%
	}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
	
</table>

<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
<table border="1" width="100%" align="center">
	<tr>
		<td bgcolor="#98AFC7" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</body>
</html>
