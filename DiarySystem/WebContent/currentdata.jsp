<%-- 
    Document   : Current data
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: this page show the vehicles having current delay
    last updated : Aug 31, 2009
    Modified by: Azhar
    Modified by: Ayaz A. ON::-12-10-2009
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%!
Connection conn,conn1;
Statement st, st1, st2,st22, st3, st01,stwar1,stwar2,stwar3,stwar4;
String sql,sql1,sql2;
String transporter,today,Svehlist,username,warranty;
String Vehcode="",unitid="",instdate="";


%>

<%
String  userrole1=session.getAttribute("userrole").toString();
%>

<%@ include file="header.jsp" %>

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
transporter=request.getParameter("transporter");

java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
////today = formatter.format(defoultdate);



//java.util.Date defoultdate = new java.util.Date();
//Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String tdydate=formatter.format(defoultdate);

//out.print(tdydate);

long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-4000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
//out.print(today);

miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today3 = formatter.format(defoultdate);
//out.print(today3);
miliseconds=miliseconds-4000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today4 = formatter.format(defoultdate);
//out.print(today4);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String sdays = formatter.format(defoultdate);
//out.print(sdays);
Svehlist="(0";
username=session.getAttribute("username").toString();
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st22=conn1.createStatement();

	stwar1=conn1.createStatement();
	stwar2=conn1.createStatement();
	stwar3=conn1.createStatement();
	stwar4=conn1.createStatement();
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<table border="0" width="750px" class="">
<tr><td align="center" colspan="2"><center><font color="black" size="2">Vehicle List of <%=transporter %> Showing Current Data.</font></center></td></tr>
<tr><td><a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"><b>Last 10 Outgoing Calls </font></a></td>
<td align="right"> <a href="#" onClick="window.open ('last3disp.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Dispatches </b> </font> </a> 
&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('last5recfrmcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Last 5 Receivals </b> </font> </a>
 
&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('mydiary.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Veh Avail </b> </font> </a>
&nbsp;&nbsp;&nbsp;
<a href="#" onClick="window.open ('unitswithcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="Red" size="2"><b> Unit/s Pending </b> </font> </a> 
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
String userrole=session.getAttribute("userrole").toString();
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ %>
	<th> Edit</th>
<%	
}
%>
</tr>
<%
sql1="select * from t_recieverinfo where Transporter='"+transporter+"'";
ResultSet rst2=st.executeQuery(sql1);
int a=1;
while(rst2.next())
{
String rname=rst2.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td>
<a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst2.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst2.getString("RecieverName")%></a>
</td>
<td><%=rst2.getString("Phone")%></td>
<td><%=rst2.getString("Mobile")%></td>
<td><a href="mailto:<%=rst2.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst2.getString("Email")%></a></td>
<td><%=rst2.getString("PlaceName")%></td>
<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rname%>&trans=<%=transporter%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Click</a></td>
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ %>
	<td>  <a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst2.getString("Rid") %>', 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Edit</a></td>
<%	
} %>

</tr>
<%
a++;
}
%>
</table>

<p></p>
<hr width="750px"></hr>

<marquee> <font color="brown"><B><I>Note:</I></B>Move your mouse to Complaint Date to check more details</font> </marquee>

		<table border="1" width="750px" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Vehicle No</td>
<td>Updated</td>
<td>Location</td>
<td>UnitID</td>
<td>MobileNO</td>
<td>SimNo</td>
<td>Peripheral</td>
<td>Sim Company</td>
<td>GPName</td>
<td> Complaint Date</td>
<td>Inst On</td>

<td>Warranty</td>
</tr>

<%
try
{
	String us=username.toUpperCase();
	
	String instdte="-";
	String instdte1="", vhno;
	Double lat, lon;
	Double lat2, lon2; 
	String direction;
	String loc11="";
	String bg2="", msg1="";
	String grp, insdt, insdt1;
	String peripherals1="", simcomp1="" ;


	
	if(transporter.equals("Topsline") || transporter.equals("HPCL") || transporter.equals("Ujjain") )
	{

	sql="select *  from t_onlinedataotherservers where Transporter='"+transporter+"'";
	
	ResultSet rst=st1.executeQuery(sql);
	while(rst.next())
	{
		Svehlist=Svehlist+","+rst.getString("VehicleCode");
	}
Svehlist=Svehlist+")"; 
sql="select * from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate = '"+tdydate+"' and Location not like 'No GPS %' and VehicleCode in "+Svehlist+" order by TheDate Desc";

ResultSet rst1=st1.executeQuery(sql);
int i=1;
while(rst1.next())
{
unitid=rst1.getString("UnitID");
String simno="-", mobno="-", group1="";

	

	
	//***************************************
	
	lat=rst1.getDouble("LatitudePosition");
	lon=rst1.getDouble("LongitudePosition");

String sqlloc="SELECT city,lat,lon,((ACOS(SIN('"+lat+"' * PI() / 180) * SIN(lat * PI() / 180) + COS('"+lat+"' * PI() / 180) * COS(lat * PI() / 180) * COS(('"+lon+"' - lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_citylatlong order by  distance ASC limit 1";
ResultSet rsloc=st2.executeQuery(sqlloc);
if(rsloc.next())
{ 
String dst=""+rsloc.getDouble("distance");
lat2=rsloc.getDouble("lat");
lon2=rsloc.getDouble("lon");
if(dst.length() >5)
{
dst=dst.substring(0,4);
}
double dist1=Double.parseDouble(dst);

if(lat2 >lat)
{
direction="S";
}
else
{
direction="N";
}
if(lon2 > lon)
{
direction=direction+"E of";
}
else
{
direction=direction+"W of";
}
loc11=""+dist1+" kms "+direction+" "+rsloc.getString("city");

//String sqlupdate="Update t_onlinedataotherservers ";


}
else
{
	loc11="-";
}
	
	
	//***************************************
	String war1="select * from t_onlinedataotherservers where VehicleRegNo='"+rst1.getString("VehicleRegNo")+"' ";
		ResultSet rs4=stwar1.executeQuery(war1);
		if(rs4.next())
		{
			//unitid=rs4.getString("UnitID");
			//vehregno=rs4.getString("VehicleRegNo");
			try{
			instdte=rs4.getString("InstDate");
			}
			catch(Exception X)
			{
				instdte="-";
			}
		
		
		
		String war2="select * from t_amchistory where VehNo = '"+rst1.getString("VehicleRegNo")+"' order by NewDate desc limit 1";
		ResultSet rsamcc=stwar2.executeQuery(war2);
		if(rsamcc.next())
		{
			if(!(null==rsamcc.getDate("WarrantyTill")))
			{
			try{	
			String war3="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
			ResultSet rsamcc1=st2.executeQuery(war3);
			if(rsamcc1.next())
			{
				if(rsamcc1.getInt("days") > 0)
				{
					warranty="Yes";
				}
				else
				{
					warranty="No";
				}
			}
			}
			catch(Exception X)
			{
				warranty="-";

			}
			}
			
			
			else
			{
				
				
				String war3="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
				ResultSet rst222=stwar3.executeQuery(war3);
				if(rst222.next())
				{
					
					if(rst222.getInt("days") > 365)
							{
						warranty="NO";
							}
					else
					{
						warranty="YES";
					}
				}
			}
		}
		else
		{
				//out.println("Hiiiiiiiiiiiiiiii");
					insdt1=rs4.getString("InstDate");
					
						
			String war4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt1+"') as days";
			ResultSet rst222=stwar4.executeQuery(war4);
			if(rst222.next())
			{
				if(rst222.getInt("days") > 365)
						{
					warranty="NO";
						}
				else
				{
					warranty="YES";
				}
			}
			
			
		}
		
	}
		
		sql="select * from t_group where VehRegno='"+rst1.getString("VehicleRegNo")+"' ";
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
<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNo")%>
</a>
<br/>	
<div class="popup" id="popup<%=i%>">
<table border="0" >
<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>

<%
if(userrole.equals("Manager") || userrole.equals("MiddleWare"))
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
<td><font color="red"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></font></td>
<td><font color="red"><%=loc11%></font></td>
<td><%=unitid%></td>
<%
	sql="select * from t_unitmaster where UnitID='"+unitid+"'";
	ResultSet rs5=st2.executeQuery(sql);
	if(rs5.next())
	{
		simno=rs5.getString("MobNo");
		mobno=rs5.getString("SimNo");
	}
	
	
	String sqlsim1="select SimCompany,Peripherals from t_unitmasterhistory where MobNo='"+simno.trim()+"' order by EntDate desc";
	//out.println(sqlsim);
	ResultSet rssim=st2.executeQuery(sqlsim1);
	if(rssim.next())
	{
			try{				
			simcomp1=rssim.getString("SimCompany");
			peripherals1=rssim.getString("Peripherals");
			}catch(Exception X)
			{
				simcomp1="-";
				peripherals1="-";
			}
	}
	else
	{
		simcomp1="-";
		peripherals1="-";
	}
	
	
%>
<td><%=simno%></td>
<td><%=mobno%></td>
<td><%=peripherals1 %></td>
<td><%=simcomp1 %></td>
<td><%=group1%></td>

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
<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
<td><b><%=warranty%></b></td>
</tr>

    <%
i++;
}
	
	
	
	}
	else
	{
	
	
		
		if(session.getAttribute("userrole").toString().equals("Group"))
		{
		if(us.equals("CASTROL"))
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
		}
		else
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
		}
		}
		else
		{
		sql="select *  from t_vehicledetails where OwnerName='"+transporter+"' and Status='-'";
		}
		ResultSet rst=st1.executeQuery(sql);
		while(rst.next())
		{
			Svehlist=Svehlist+","+rst.getString("VehicleCode");
		}
	Svehlist=Svehlist+")"; 
	sql="select a.*,b.UnitID,b.installeddate,b.VehicleCode from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate = '"+tdydate+"' and a.VehicleCode=b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' and a.VehicleCode in "+Svehlist+" order by a.TheDate Desc";
//out.print(sql);
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	unitid=rst1.getString("b.UnitID");
	String simno="-", mobno="-", group1="";
	Vehcode =rst1.getString("b.VehicleCode");
	String stwar11="select * from t_vehicledetails where VehicleCode='"+Vehcode+"' ";
	ResultSet rs4=stwar1.executeQuery(stwar11);
	if(rs4.next())
	{
		unitid=rs4.getString("UnitID");
		//vehregno=rs4.getString("VehicleRegNumber");
		try{
		instdte=rs4.getString("InstalledDate");
		}
		catch(Exception X)
		{
			instdte="-";
		}
	String war2="select * from t_amchistory where VehNo = '"+rst1.getString("VehicleRegNo")+"' order by NewDate desc limit 1";
	ResultSet rsamcc=stwar2.executeQuery(war2);
	if(rsamcc.next())
	{
		if(!(null==rsamcc.getDate("WarrantyTill")))
		{
		try{	
		String war3="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
		ResultSet rsamcc1=st2.executeQuery(war3);
		if(rsamcc1.next())
		{
			if(rsamcc1.getInt("days") > 0)
			{
				warranty="Yes";
			}
			else
			{
				warranty="No";
			}
		}
		}
		catch(Exception X)
		{
			warranty="-";

		}
		}
		
		
		else
		{
			
			
			String war3="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
			ResultSet rst222=stwar3.executeQuery(war3);
			if(rst222.next())
			{
				
				if(rst222.getInt("days") > 365)
						{
					warranty="NO";
						}
				else
				{
					warranty="YES";
				}
			}
		}
	}
	else
	{
			//out.println("Hiiiiiiiiiiiiiiii");
				insdt1=rs4.getString("InstalledDate");
				
					
		String war4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt1+"') as days";
		ResultSet rst222=stwar4.executeQuery(war4);
		if(rst222.next())
		{
			if(rst222.getInt("days") > 365)
					{
				warranty="NO";
					}
			else
			{
				warranty="YES";
			}
		}
		
		
	}
	
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
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNo")%>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>

<%
if(userrole.equals("Manager") || userrole.equals("MiddleWare"))
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
	<td><font color="red"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></font></td>
	<td><font color="red"><%=rst1.getString("Location")%></font></td>
	<td><%=unitid%></td>
	<%
		sql="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st2.executeQuery(sql);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
		}
		
		String sqlsim1="select SimCompany,Peripherals from t_unitmasterhistory where MobNo='"+simno.trim()+"' order by EntDate desc";
		//out.println(sqlsim);
		ResultSet rssim=st22.executeQuery(sqlsim1);
		if(rssim.next())
		{
				try{				
				simcomp1=rssim.getString("SimCompany");
				peripherals1=rssim.getString("Peripherals");
				}catch(Exception X)
				{
					simcomp1="-";
					peripherals1="-";
				}
		}
		else
		{
			simcomp1="-";
			peripherals1="-";
		}
		
		
	%>
	<td><%=simno%></td>
	<td><%=mobno%></td>
	<td><%=peripherals1 %></td>
	<td><%=simcomp1 %></td>
	<td><%=group1%></td>
	
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
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
	<td><b><%=warranty%></b></td>
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


















