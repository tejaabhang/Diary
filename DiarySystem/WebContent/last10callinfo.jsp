<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.transworld.diary.framework.Last10CallingInformationOfReciever"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
				
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application"></jsp:useBean>

<%@page import="java.util.List"%><html>	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link href="css/css.css" rel="StyleSheet" type="text/css">
	
</head>		 

<body background="white" onload="focusChild();">
<%
final String transporter=request.getParameter("trans");
final String reciever=request.getParameter("reciever");
final String limit=request.getParameter("limit");
final String username=session.getAttribute("username").toString();

int numRecords = 0;
List<Last10CallingInformationOfReciever> last10CallingInformationOfReciever= null;
try{
	last10CallingInformationOfReciever = unitDetailsDao.getLast10CallingInformationOfReciever(
			transporter,reciever,limit);       	
   	numRecords = last10CallingInformationOfReciever.size();	 
} catch(Exception e){
	e.printStackTrace();
}
%>
<form action="" method="post" >
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Last 10 Call Inforamation of <%=transporter%></b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
	<table border="1" width="750px" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			<td><b>Sr.</b></td>
			<td><b>Date AND time</b></td>
			<td><b>Caller Name</b></td>
			<td><b>Reciever Name</b></td>
			<td><b>Call Description</b></td>
			<td><b>Transporter Name</b></td>
			<td><b>Call Type</b></td>
			<td><b>Caller Type</b></td>
			<td><b>Reason Of Call</b></td>
			<td><b>Vehicle Tracking</b></td>
			<td><b>FleetView</b></td>
			<td><b>Sales Followup</b></td>
		</tr>
<%
	try
	{
		for (int counter = 0; counter < numRecords; counter++) 
		{
			final Last10CallingInformationOfReciever record = last10CallingInformationOfReciever.get(counter);
			int i = counter+1;
%>	
		<tr>
			<td align="center"><%=i%></td>
			<td align="center"><%=record.getDateOfCall()%> <%=record.getTimeOfCall()%></td>
			<td align="center"><%=record.getCallername()%></td>
			<td align="center"><%=record.getRecieverName()%></td>
			<td align="center"><%=record.getCallDescription()%></td>
			<td align="center"><%=record.getTransporterName()%></td>
			<td align="center"><%=record.getCallType()%></td>	
			<td align="center"><%=record.getCallerType()%></td>
			<td align="center"><%=record.getReasonOfCall()%></td>
			<td align="center"><%=record.getVehicleTracking()%></td>
			<td align="center"><%=record.getFleetView()%></td>
			<td align="center"><%=record.getSalesFollowup()%></td>
		</tr>
		
<%
		}
	}catch (Exception e) {
			out.println("<tr><td colspan=12>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
<tr><td colspan="12"><div align="center"><a href="javascript:window.close();"><b>Close</b></a></div></td></tr>
</table>
<%
	}
%>
</form>
</body>
</html>
