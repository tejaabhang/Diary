<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.UnitLimitForTransporter"
		import="com.transworld.diary.framework.FullFleetReport"
		import="com.transworld.diary.framework.ReceiverInformation"
%>
				
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application"></jsp:useBean>

<%@page import="com.transworld.diary.framework.RecieverInformation"%><html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css">
	<script language="javascript">
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
		function showtextarea(a,b,c)
		{
			document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
		}
		function canceldiv(A)
		{
		document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
		}
		
		function selectAll()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			if(document.fullfleet.maincb.checked==true)
			{
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=true;
				}
			}
			else
			{
				
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=false;
				}
			}
		}
		
		function validate()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			var flag="False";
		
			for(var j=0;j<cntr;j++)
			{	
				if(document.getElementById("cb"+j).checked==true)
				{
					flag="True";
				}		
			}
		
			if(flag=="False")
			{
				alert("Please select check-box to change Warranty");
				return false;	
			}		
			return true;
		}
		function changeAction()
		{ //alert("hi");
			var transporter=document.fullfleet.transporter.value;
			var cntr=document.fullfleet.cntr.value;
			//alert("hi"+cntr);
			cntr=cntr-1;
			//alert("hi"+cntr);
			var url="changewarranty.jsp?transporter="+transporter;
		      	var i=0;
		   	for(var j=0;j<cntr;j++)
		    	{	//alert("j loop");
		    		if(document.getElementById("cb"+j).checked==true)
		    		{
		            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
						 i++;
						// alert("map"+url);
		    		}		
		    	}
		        //write function to check no of check boxes get value
		        document.fullfleet.action=url+"&cntr="+i;
		      	//document.fullfleet.action="Changewarranty1.jsp";
		        //alert(document.fullfleet.action);
		        document.fullfleet.submit();
		}
	</script>
	<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
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
<form name="fullfleet" method="post" action="" onSubmit="return validate();">
<%
final String transporter=request.getParameter("transporter");
final String username=session.getAttribute("username").toString();
final String userrole=session.getAttribute("userrole").toString();
final String inserted=request.getParameter("inserted");
final String activeStatus="Yes";
String vehno=request.getParameter("vehno");
String nocbselected=request.getParameter("nocbselected");
String amcdone=request.getParameter("amcdone");
int numRecordsForUnitLimit = 0;
int numRecordsForReceiverInformation=0;
int numRecordsForFullFleetReport=0;
List<UnitLimitForTransporter> unitLimitForTransporter=null;
List<RecieverInformation> recieverInformation=null;
List<FullFleetReport> fullFleetReport=null;
try{
	unitLimitForTransporter = unitDetailsDao.getUnitLimitForTransporter(transporter);       	
	numRecordsForUnitLimit = unitLimitForTransporter.size();	 
	recieverInformation=unitDetailsDao.getRecieverInformation(transporter,activeStatus);
	numRecordsForReceiverInformation=recieverInformation.size();
	fullFleetReport=unitDetailsDao.getFullFleetReport(transporter);
	numRecordsForFullFleetReport=fullFleetReport.size();
} catch(Exception e){
	e.printStackTrace();
}

if(inserted!=null)
	{
 %>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon"> <U> Special Report for <%=vehno%> has been added successfully </U> </font> </td>
			</tr>
		</table>
<%	}
if(nocbselected!=null)
	{
%>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
			</tr>
		</table>
<%	}
if(amcdone!=null)
	{
%>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > Successfully changed AMC of selected Vehicles.</font> </div> </td>
			</tr>
		</table>
<%	
}
%>
<table border="0" width="750px" class="">
<%
for (final UnitLimitForTransporter unitLimit : unitLimitForTransporter) 
{
	if(unitLimit.getRemainingUnit()!=0 && unitLimit.getCountAsStatusNotDeletedForTransporter()<unitLimit.getUnitLimitForTransporter())
	{
%>
	<tr>
		<td align="center" colspan="2"> 
			<center><font color="red" size="2.8"><b><blink><%=unitLimit.getRemainingUnit()%> Pending Installation</blink></b></font>
			</center>
		</td>
	</tr>
<%
	} 
}
%>
	<tr><td align="center" colspan="2"> <center><font color="black" size="3"><b>Vehicle List of <%=transporter %> .</b></font></center></td></tr>
	
	<tr> 
    	<td>
	    	<a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"><b>Last 10 Outgoing Calls</b></font></a> &nbsp;&nbsp;
	    	<a href="#" onClick="window.open ('last3disp.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Dispatches </b> </font> </a> &nbsp;&nbsp;
			<a href="#" onClick="window.open ('last5recfrmcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Receivals </b> </font> </a> &nbsp;&nbsp;
			<a href="#" onClick="window.open ('mydiary.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Veh Avail </b> </font> </a>&nbsp;&nbsp;
			<a href="#" onClick="window.open ('PendingUnits.jsp?holdername=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Unit/s Pending </b> </font> </a>&nbsp; &nbsp;
			<a href="#" onClick="window.open ('addcontact.jsp?transporter=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Transporter Contact</b> </font> </a>&nbsp; &nbsp;
			<a href="#" onClick="window.open ('addunit.jsp?transporter=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Add Unit</b> </font> </a>
		</td>
	</tr>
</table>
<p></p>
<hr width="750px"></hr>
<table border="1" width="750px" class="sortable">
	<tr>
		<th>Sr.</th>
		<th>Contact Name</th>
		<th>Phone</th>
		<th>Mobile</th>
		<th>Email</th>
		<th>Location</th>
		<th>Comment</th>
<%
	if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
	{ 
%>
	<th>Edit</th>
<%	
	}
%>
	</tr>
<%
for (int counter = 0; counter < numRecordsForReceiverInformation; counter++) 
{
	final RecieverInformation recieverinfo = recieverInformation.get(counter);
	int i = counter+1;
%>
	<tr>
		<td><%=i%></td>
		<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=recieverinfo.getContactName()%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=recieverinfo.getContactName()%></a></td>
		<td><%=recieverinfo.getPhoneNumber()%></td>
		<td><%=recieverinfo.getMobileNumber()%></td>
		<td><a href="mailto:<%=recieverinfo.getEmailId()%>?subject=Vehicle%20Complaints%20"><%=recieverinfo.getEmailId()%></a></td>
		<td><%=recieverinfo.getPlaceName()%></td>
		<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=recieverinfo.getContactName()%>&trans=<%=transporter%>', 'win1', 'width=400, height=250, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Click</a></td>
	<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
		{ 
	%>
			<td>  <a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=recieverinfo.getContactName()%>&trans=<%=transporter%>&rid=<%=recieverinfo.getRowId()%>', 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Edit</a></td>
	<%	
		} 
}
	%>
	</tr>
</table>
<p></p>
<hr width="750px"></hr>
	
<table border="1" width="750px">
	<tr>
		<td colspan="10"> <font color="Black"> <b> Yellow marking means UNIT MISSING</b></font><div align="right"><marquee><font color="Black"><b><i>Note:</i></b>Move your mouse to Complaint Date to check more details</font></marquee>
		<a href="excelfullfleet.jsp?transporter=<%=transporter%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
	</tr>
</table>
	
<table border="1" align="center" width="750px" class="sortable">
	<tr>
<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ 
%>
			<td> <div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();">  </div> </td>
<% 
		}
%>
			<th>Sr.</th>
			<th>Vehicle No</th>
			<th>Updated</th>
			<th>Location</th>
			<th>Veh Available Date </th>
			<th>UnitID</th>
			<th>MobileNo</th>
			<th>SimNo</th>
			<th>Peripheral</th>
			<th>Sim Comp</th>
			<th>GPName</th>                                                                    
			<th>Inst On</th>
			<th>Inst Location</th>
			<th>Warranty</th>
			<th>Latest Rep. Date</th>    
			<th>Replacement Location</th>    
			<th>Sp. Comments</th>
			<th>Sp. Comment Desc.</th>
			<th>Extra Comment</th>
			<th>Date of Entry</th>
			<th>Entered By</th>
			
		</tr>
<%
for (int counter = 0; counter < numRecordsForFullFleetReport; counter++) 
{
	final FullFleetReport fullfleet = fullFleetReport.get(counter);
	int i = counter+1;
	int j=0;
%>	
			
	<tr bgcolor='<%=fullfleet.getbgcolor%>'>
	<%
		if(userrole.equals("Manager")  || userrole.equals("sales"))
		{ %>
		
				<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
	<%	}
	%>
	<td><%=i%> </td>
	
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst3.getString("VehicleRegNumber")%></a>
	<br/>	
	<div class="popup" id="popup<%=i%>">

	<table border="0" >
			<tr><td><a href="addcomplaint.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<!-- <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
		<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr> -->		
	
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=rst3.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
<tr>
	<td> <a href="editrecs.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit Records </a> </td>
</tr>

	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<!-- <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
		<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr> -->		
	
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr><td><a href="repunit1.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
<%
}else
{ %>
	<tr><td><a href="repunit.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
<%
} %>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=rst3.getString("VehicleCode")%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
  	<tr>
		<td> <a href="remuittemp.jsp?veh=<%=rst3.getString("VehicleRegNumber")%>"> Temp Removal </a> </td>
	</tr>
	<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
{  %>	 
	<tr>
		<td><a href="editrecs.jsp?vid=<%=rst3.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
	</tr>
	
	<tr>
		<td> <a href="DeactiveReq.jsp?veh=<%=vehregno%>&unitid=<%=unitid %>"> Deactivation Req </a> </td>
	</tr>
<%
}  
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr>
		<td><a href="removeunit.jsp?veh=<%=rst3.getString("VehicleRegNumber")%>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a></td>
	</tr>
	<tr>
		<td>  <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=rst3.getString("VehicleCode")%>&vehregno=<%=rst3.getString("VehicleRegNumber") %>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> </td>
	</tr>
<%
}
%>  
<tr>
	<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=rst3.getString("VehicleCode")%>&vehno=<%=rst3.getString("VehicleRegNumber")%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>

	<tr>
	<td> <a href="vehexchange.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange </a> </td>
	</tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
	
	</div>	
	</td>
			<td><%=fullfleet.getInstallationDate()%></td>
			<td><%=fullfleet.getInstallationLocation()%></td>
			<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc1 %>&availdate=<%=availdate1 %>&allocatedto=<%=allocatedto1 %>&desc=<%=desc1 %>&contpers=<%=contpers1 %>&entby=<%=entby1 %>&DetDesc=<%=DetDesc1 %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fullfleet.getVehicleAvailableDate()))%> </B></td>
			<td><%=fullfleet.getUnitId()%></td>
			<td><%=fullfleet.getMobileNumber()%></td>
			<td><%=fullfleet.getSimNumber()%></td>
			<td><%=fullfleet.getPeriferal()%></td>
			<td><%=fullfleet.getServiceProvider()%></td>
			<td><%=fullfleet.getGroupName()%></td>
			<td><%=fullfleet.getInstallationDate()%></td>
			<td><%=fullfleet.getInstallationLocation()%></td>
			<td><%=fullfleet.getWarranty()%></td>
			<td><%=fullfleet.getLatestReplacementDate() %></td>
			<td><%=fullfleet.getReplacementLocation()%></td>
			<td><a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=fullfleet.getVehicleRegistrationNumber()%>&unitid=<%=fullfleet.getUnitId() %>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=fullfleet.getSpecialComment()%>)</font></a>  </td>
		    <td><%=fullfleet.getSpecialCommentDescription()%></td>
			<td><%=fullfleet.getExtraCommment()%></td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(fullfleet.getDateOfEntry()))%> </td>
			<td><%=fullfleet.getEnteredBy()%>
			<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=fullfleet.getVehicleRegistrationNumber()%>" />
		</tr>
<%
}
%>
</table>
</form>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright Â© 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>

