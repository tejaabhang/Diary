<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<script language="javascript">
function validate()
{ 
	var v1=document.callrec.comment.value;

	if(v1.length<=2)
	{
		alert("Please enter Comment");
		return false;
	}
	var calltype = document.getElementById("calltype").value;
	if(calltype=='Select'){
		alert("Please select Call Type");
		return false;
	}
	var row7 = document.getElementById("reason").value;
//	alert(row7)
	if(row7=='Select'){
		alert("Please select Reason of call");
		return false;
	}
	var VehicleTracking=document.getElementById("VehicleTracking").value;
//	alert(VehicleTracking);
	var FleetView=document.getElementById("FleetView").value;
//	alert(FleetView);
	var SalesFollowup=document.getElementById("SalesFollowup").value;
//	alert(SalesFollowup);
	if(row7=='Vehicle Tracking' && VehicleTracking=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='FleetView' && FleetView=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='Sales Followup' && SalesFollowup=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	
}
function call(){
	var row7 = document.getElementById("reason").value;
//	alert(row7);
	if(row7=='Vehicle Tracking'){
		document.getElementById("1").style.display="";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
		
		}else if(row7=='FleetView'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="";
			document.getElementById("3").style.display="none";
		
		}else if(row7=='Sales Followup'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="";
		
		}else{
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="none";
				}
	
		
}
</script>
<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
} 
.popupnew { 
	background-color : #98AFC7;
	position: absolute;
	visibility: visible;
} 
.popupx { 
	background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>

<%@ include file="header.jsp" %>
<%!
String reciever,caller,calltype,thedate,thetime,transporter,comment,username,sql;
Connection conn,conn1;
Statement st,stmtinsert,st1;
%>
<%
transporter=request.getParameter("trans");
reciever=request.getParameter("reciever");
thedate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
thetime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
username=session.getAttribute("username").toString();
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
stmtinsert=conn1.createStatement();
if(!(null==request.getParameter("Submit")))
{
	calltype=request.getParameter("calltype");
	comment=request.getParameter("comment");
	String reason=request.getParameter("reason");
	String VehicleTracking=request.getParameter("VehicleTracking");
	String FleetView=request.getParameter("FleetView");
	String SalesFollowup=request.getParameter("SalesFollowup");
	if(FleetView.equalsIgnoreCase("Select")){
		FleetView="-";
	}
	if(VehicleTracking.equalsIgnoreCase("Select")){
		VehicleTracking="-";
	}
	if(SalesFollowup.equalsIgnoreCase("Select")){
		SalesFollowup="-";
	}
	
	int pos=0;
	pos=comment.indexOf("'");
	if(pos>0)
	{
		comment=comment.replace("'","");
	}

	try{
		
		//out.print(transporter+"  "+reciever+" "+thedate+"  "+thetime+"  "+username+"  "+calltype+" "+comment);
		sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType,reasonOfCall,vehicleTracking,FleetView,salesFollowup) values('"+thedate+"','"+thetime+"','"+reciever+"','"+username+"','"+comment+"','"+transporter+"','"+calltype+"','Transporter','"+reason+"','"+VehicleTracking+"','"+FleetView+"','"+SalesFollowup+"')";
		//Query for t_sqlquery
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");

		//out.print(sql);
		int a=st.executeUpdate(sql);
	if(a >0)
		{
			out.print("<div align='center'><font color='red' size='2'>Call Recorder Successfully.</font></div>");
		}
	}catch(Exception e)
	{
		out.print("Exception -->");
	}
	finally
	{
		//conn.close();
		conn1.close();
		
	}
	
}

%>
<body background="images/green_grad_bot.jpg" onload="focusChild();">

<form name="callrec" action="" method="post"  onSubmit="return validate();">

<table border="0" width="100%">
<tr><td>Transporter :</td><td><%=transporter%><input type="hidden" name="trans" value="<%=transporter%>"/></td></tr>
<tr><td>Reciever /Caller :</td><td><%=reciever%><input type="hidden" name="reciever" value="<%=reciever%>"/></td></tr>
<tr><td>Call Type :</td>
		<td><select name="calltype" id="calltype">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment="select * from db_CustomerComplaints.t_dropdown where dropdown='CallType'"; 
		ResultSet rstDepartment=st1.executeQuery(sqlDepartment);
		while(rstDepartment.next())
		{
			
			String value=rstDepartment.getString("value");
			////System.out.println(value);
		%><option value="<%=rstDepartment.getString("value")%>"><%=rstDepartment.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		<tr><td>Reason For Call :</td>
		<td><select name="reason" id="reason" onchange="call();">
		<option value="Select">Select</option>
		<%
		
		String sqlReason="select * from db_CustomerComplaints.t_dropdown where dropdown='ReasonforCall'"; 
		ResultSet rstsqlReason=st1.executeQuery(sqlReason);
		while(rstsqlReason.next())
		{
			
			String value=rstsqlReason.getString("value");
			////System.out.println(value);
		%><option value="<%=rstsqlReason.getString("value")%>"><%=rstsqlReason.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
		<tr style="display: none" id="1"><td>Vehicle Tracking:</td>
		<td><select name="VehicleTracking" id="VehicleTracking">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment1="select * from db_CustomerComplaints.t_dropdown where dropdown='VehicleTracking'"; 
		ResultSet rstDepartment1=st1.executeQuery(sqlDepartment1);
		while(rstDepartment1.next())
		{
			
			String value=rstDepartment1.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment1.getString("value")%>"><%=rstDepartment1.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
			<tr style="display: none" id="2"><td>FleetView :</td>
		<td><select name="FleetView" id="FleetView">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment2="select * from db_CustomerComplaints.t_dropdown where dropdown='FleetView'"; 
		ResultSet rstDepartment2=st1.executeQuery(sqlDepartment2);
		while(rstDepartment2.next())
		{
			
			String value=rstDepartment2.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment2.getString("value")%>"><%=rstDepartment2.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
			<tr style="display: none" id="3"><td>SalesFollowup :</td>
		<td><select name="SalesFollowup" id="SalesFollowup">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment3="select * from db_CustomerComplaints.t_dropdown where dropdown='SalesFollowup'"; 
		ResultSet rstDepartment3=st1.executeQuery(sqlDepartment3);
		while(rstDepartment3.next())
		{
			
			String value=rstDepartment3.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment3.getString("value")%>"><%=rstDepartment3.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
		
<tr><td>Comment :</td><td><TEXTAREA name="comment" id="comment"></TEXTAREA></td></tr>
<tr><td colspan="2"  align="center"><input type="submit" name="Submit" Value="Submit"/></td></tr>
<tr><td colspan="2" align="center"><a href="javascript:window.close();">Close</a></td></tr>
</table>
</form>
</body>
</html>
