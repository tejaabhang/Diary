<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
              Connection conn1;
              Statement st;
              %>
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
	<script type="text/javascript">
	function validate()
	{
		var reconnect=document.getElementById("calender2").value;
	//	alert(reconnect);
		if(reconnect==""){
				alert("Please select 'Reconnect device on' date ");
				return false;
			}
		var mailreceiveddate=document.getElementById("calender").value;
	//	alert(mailreceiveddate);
		if(mailreceiveddate==""){
			alert("Please select 'Incident received through mail on' date ");
			return false;
		}
		var mailreceivedhr=document.getElementById("hourmail").value;
	//	alert(mailreceivedhr);
		if(mailreceivedhr=="Select"){
			alert("Please select Hour ");
			return false;
		}
		
		var incidentdate=document.getElementById("calender1").value;
	//	alert(incidentdate);
		if(incidentdate==""){
			alert("Please select 'Incident took place at' date ");
			return false;
		}
		var incidenthr=document.getElementById("hourincident").value;
	//	alert(incidenthr);
		if(incidenthr=="Select"){
			alert("Please select Hour ");
			return false;
		}
		
		var recby=document.getElementById("recby").value;
	//	alert(recby);
		if(recby==""){
			alert("Please select received by");
			return false;
		}
		var recfrom=document.getElementById("recfrom").value;
	//	alert(recfrom);
		if(recfrom==""){
			alert("Please select received from");
			return false;
		}
		
	}
	
	</script>
<title>Mail API</title>
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
              
 <%
 try{
 String vid=request.getParameter("vid");
 String vehno=request.getParameter("vehno");
 String unitid=request.getParameter("unitid");
 String incidentID=request.getParameter("incidentID");
 String transp=request.getParameter("transp");
 Class.forName(MM_dbConn_DRIVER);
 
 conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 st=conn1.createStatement();
 
 %>
  <form method="POST" name="POST" action="insertEditDetailsOfIncident.jsp" onsubmit="return validate();">
 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
  <tr align="center">
  	<td>
		<font color="maroon" size="3"><b>Incident Report</b></font>  	
  	</td>
  	</tr>
  	
  	<tr>
  		<td>
  		<%
  		String sql="select * from t_incidentreport where IncidentID='"+incidentID+"' order by UpdatedDateTime DESC ";
  		 ResultSet rs=st.executeQuery(sql);
  		 if(rs.next()){
  		%>
  			<table border="1" width="750px" align="center" class="sortable" bgcolor="white">
  				<tr>
  					<td>
  						<font color="black" size="2"><b>Transporter :</b></font>
  					</td><td>
  						<font color="black" size="2"><%=rs.getString("Transporter")%></font>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<font color="black" size="2"><b>Vehicle Registration Number:</b></font>
  					</td><td>
  						<font color="black" size="2"><%=rs.getString("VehicleRegNo")%></font>
  							<input type="hidden" name="transporter" id="transporter" value="<%=rs.getString("Transporter")%>" />	
 							<input type="hidden" name="vehno" id="vehno" value="<%=rs.getString("VehicleRegNo")%>" />	
   							<input type="hidden" name="unitid" id="unitid" value="<%=rs.getString("UnitID")%>" />
   							<input type="hidden" name="incidentid" id="incidentid" value="<%=rs.getString("incidentID")%>" />
   							<input type="hidden" name="MyFileSat1" id="MyFileSat1" value="<%=rs.getString("IncidentLocationSatelite")%>" />
   							<input type="hidden" name="MyFileMap1" id="MyFileMap1" value="<%=rs.getString("IncidentLocationMap")%>" />
   							<input type="hidden" name="MyFile4lasttrip1" id="MyFile4lasttrip1" value="<%=rs.getString("LastTripJourneyMap")%>" />
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<font color="black" size="2"><b>UnitID :</b></font>
  						</td><td>
						<font color="black" size="2"><%=rs.getString("UnitID")%></font>
  					</td>
  					</tr>
  					<tr>
  					<td>
  					<font color="black" size="2"><b>Reconnect device on : </b></font>
  					</td><td>
  					<input type="text" id="calender2" name="calender2" size="13" value="<%=rs.getString("ReconnectDeviceDate")%>" readonly/>
            			<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "calender2",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger2"       // ID of the button
				             }
				                           );
            			 </script>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<font color="black" size="2"><b>Incident received through mail on:</b></font>
  			</td><td>
  						<input type="text" id="calender" name="calender" size="13" value="<%=rs.getString("IncidentRecievedByMailDate")%>" readonly/>
            			<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "calender",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger"       // ID of the button
				             }
				                           );
            			 </script>
            			<input type="text" name="mailtime" id="mailtime" value="<%=rs.getString("IncidentRecievedByMailTime")%>">
  					</td>
  				</tr>
  				<tr>
  					<td> 
  						<font color="black" size="2"><b>Received By :</b></font>
  					</td><td>
  						<input type="text" name="recby" id="recby" value="<%=rs.getString("ReceivedBy")%>">
  						</td>
  						</tr><tr>
  						<td>
  						<font color="black" size="2"><b>Received From :</b></font>
  					</td><td>
  						<input type="text" name="recfrom" id="recfrom" value="<%=rs.getString("ReceivedFrom")%>">
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<font color="black" size="2"><b>Incident took place at :</b></font>
  			</td><td>    
  						<input type="text" id="calender1" name="calender1" size="13" value="<%=rs.getString("IncidentDate")%>" readonly/>
            			<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "calender1",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger1"       // ID of the button
				             }
				                           );
            			 </script>
             	<input type="text" name="incidenttime" id="incidenttime" value="<%=rs.getString("IncidentTime")%>">
  					</td>
  				</tr>
  				<tr>
  				<td>
  					<font color="black" size="2"><b>Incident Location(Satelite view)</b></font>
  				</td>
  				<td>
  					<input type="file" name="MyFileSat" id="MyFileSat" value="<%=rs.getString("IncidentLocationSatelite")%>"/>
  				</td>
  				</tr>
  				<tr>
  				<td>
  					<font color="black" size="2"><b>Incident Location(Map view)</b></font>
  				</td>
  				<td>
  					<input type="file" name="MyFileMap" id="MyFileMap" value="<%=rs.getString("IncidentLocationMap")%>" />
  				</td>
  				</tr>
  				<tr>
  				<td>
  					<font color="black" size="2"><b>Last Trip Journey on map</b></font>
  				</td>
  				<td>
  					<input type="file" name="MyFile4lasttrip" id="MyFile4lasttrip"  value="<%=rs.getString("LastTripJourneyMap")%>" />
  				</td>
  				</tr>
  				<tr>
  				<td>
  					<font color="black" size="2"><b>Driver Training Details</b></font>
  				</td>
  				<td>
  					<textarea name="training" id="training" cols="60" rows="2"><%=rs.getString("DriverTrainingDetails")%></textarea>
  				</td>
  				</tr>
  				<tr>
  				<td>
  					<font color="black" size="2"><b>Observations from Incident Data</b></font>
  				</td>
  				<td>
  					<table>
  						<tr>
  						<td>
  							<b>1.</b><textarea name="observation1" id="observation1" cols="60" rows="1"><%=rs.getString("ObservationOFIncident1")%></textarea>
  						</td>
  						</tr>
  						<tr>
  						<td>
  							<b>2.</b><textarea name="observation2" id="observation2" cols="60" rows="1"><%=rs.getString("ObservationOFIncident2")%></textarea>
  						</td>
  						</tr>
  						<tr>
  						<td>
  							<b>3.</b><textarea name="observation3" id="observation3" cols="60" rows="1"><%=rs.getString("ObservationOFIncident3")%></textarea>
  						</td>
  						</tr>
  						<tr>
  						<td>
  							<b>4.</b><textarea name="observation4" id="observation4" cols="60" rows="1"><%=rs.getString("ObservationOFIncident4")%></textarea>
  						</td>
  						</tr>
  					</table>
  					
  				</td>
  				</tr>
  				<tr>
  					<td colspan="2"  align="center">
  							<input type="submit" value="submit" name="submit">
  					</td>
  				</tr>
  			</table>
  		</td>
  		<%
  		 }
  		%>
  	</tr>
  </table>
  <br></br>

 
  </form>
 <%
 }catch(Exception e){
 }
 %>
  
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>