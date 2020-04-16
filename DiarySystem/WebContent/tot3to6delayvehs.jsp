<%-- 
    Document   : Current data
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: this page show the vehicles having current delay
    last updated : Aug 31, 2009
    Modified by: Azhar
    Modified by: Ayaz A. ON::-16-10-2009
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3, st01,st4,st5,st7;
String sql,sql1,sql2;
String transporter,today,Svehlist,username,warranty;
String Vehcode="",unitid="",instdate="";
%>

<%
String  userrole1=session.getAttribute("userrole").toString();
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
	<link rel="stylesheet" href="css/ajax-tooltip-demo.css" media="screen" type="text/css">
	
	
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
         <%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
          </div>
          <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
transporter="All Transporter";
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String tdydate=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-4000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today3 = formatter.format(defoultdate);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=miliseconds-5000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today4 = formatter.format(defoultdate);

miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String sdays = formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();

String  userrole2=session.getAttribute("userrole").toString();


try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st3=conn1.createStatement();
	
	
	
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<table border="0" width="750px" class="">
<tr><td align="center" colspan="2"><center><font color="black" size="3">List of All Vehicles Showing 3 To 5 Days Data Delay.</font></center></td></tr>
<tr><td colspan="" bgcolor="">  
					<div align="right">  <a href="tot3to6delayvehsexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
</tr>

</table>

<%
String userrole=session.getAttribute("userrole").toString();


%>
		<table border="1" width="750px" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Transporter</td>
<td>Vehicle No</td>
<td>Updated</td>
<td>Location</td>
<td>UnitID</td>
<td>MobileNO</td>
<td>SimNo</td>
<td>Sim Company</td>
<td>GPName</td>
<td>Inst On</td>
<td> Complaint Date</td>
<td>Warranty</td>
</tr>

<%
try
{
	if(userrole2.equalsIgnoreCase("supertech")){
	

		
		
		 String sqlas="",trns="",rep="";	
		String us=username.toUpperCase();
		
	sql="select a.*,b.UnitID,b.OwnerName,b.installeddate from t_onlinedata a, t_vehicledetails b where a.TheDate < '"+today+"' and a.TheDate > '"+sdays+"' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.TheDate Desc";
//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	unitid=rst1.getString("b.UnitID");
	
	trns=rst1.getString("OwnerName");
	
	sqlas="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+trns+"'";
	ResultSet agnt=st3.executeQuery(sqlas);
	//System.out.println(">>>>>>sql 3>>sqlas>>"+sqlas);
	if(agnt.next())
	{
		rep=agnt.getString("Representative");		
	
	
	
	if(rep=="Kamal Dixit" || rep.equalsIgnoreCase("Kamal Dixit"))
	{
	
	
	
	String simno="-", mobno="-", group1="", simcomp="-";
	try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			sql="select TO_DAYS('"+tdydate+"')-TO_DAYS('"+rst1.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st2.executeQuery(sql);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
			sql="select * from t_group where VehCode='"+rst1.getString("VehicleCode")+"' ";
		ResultSet rs6=st2.executeQuery(sql);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="NA";
 		}
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst1.getString("OwnerName") %></td>
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNo")%>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>

<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole) || userrole.equals("MiddleWare"))
{  %>	 
	<tr>
		<td><a href="editrecs.jsp?vi<d=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
	</tr>
	<tr>
		<td> <a href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>"> Temp Removal </a> </td>
	</tr>
<%
}  %>
<tr>
	<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=rst1.getString("VehicleCode")%>&vehno=<%=rst1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>
<tr>
	<td> <a href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
</tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td><%=rst1.getString("Location")%></td>
	<td><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			simcomp=rs5.getString("SimCompany");
		}
	%>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=simcomp%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNo")+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
		%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </B>
				   
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	<td><%=warranty%></td>
	</tr>

        <%
	i++;
	
	
	}
	}
	}
	
	
	

		
		
		
	}else{
	
	
	
		String us=username.toUpperCase();
		
	sql="select a.*,b.UnitID,b.OwnerName,b.installeddate from t_onlinedata a, t_vehicledetails b where a.TheDate < '"+today+"' and a.TheDate > '"+sdays+"' and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.TheDate Desc";
//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	unitid=rst1.getString("b.UnitID");
	String simno="-", mobno="-", group1="", simcomp="-";
	try{
			instdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstalledDate"));
			sql="select TO_DAYS('"+tdydate+"')-TO_DAYS('"+rst1.getDate("InstalledDate")+"') as days";
			ResultSet rstwar=st2.executeQuery(sql);
			if(rstwar.next())
			{
			if(rstwar.getInt("days") <= 365)
			{
				
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
			}
			}catch(Exception x)
			{
				instdate="-";
				warranty="-";
			}
			sql="select * from t_group where VehCode='"+rst1.getString("VehicleCode")+"' ";
		ResultSet rs6=st2.executeQuery(sql);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="NA";
 		}
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst1.getString("OwnerName") %></td>
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNo")%>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>

<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole) || userrole.equals("MiddleWare"))
{  %>	 
	<tr>
		<td><a href="editrecs.jsp?vi<d=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
	</tr>
	<tr>
		<td> <a href="remuittemp.jsp?veh=<%=rst1.getString("VehicleRegNo")%>"> Temp Removal </a> </td>
	</tr>
<%
}  %>
<tr>
	<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=rst1.getString("VehicleCode")%>&vehno=<%=rst1.getString("VehicleRegNo")%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>
<tr>
	<td> <a href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
</tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<td><%=rst1.getString("Location")%></td>
	<td><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			simcomp=rs5.getString("SimCompany");
		}
	%>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=simcomp%></td>
	<td><%=group1%></td>
	<td><%=instdate%></td>
	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNo")+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
		%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </B>
				   
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	<td><%=warranty%></td>
	</tr>

        <%
	i++;
	}
	
	
	
}
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
conn.close();
conn1.close();
}
%>
	</table>
	

		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>