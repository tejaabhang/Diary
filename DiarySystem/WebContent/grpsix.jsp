
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!

Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8,sql9,sql10;
String group,today,Svehlist,username;


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
}mouse
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
group=request.getParameter("transporter");
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
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	st=conn1.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn1.createStatement();
	st8=conn.createStatement();
	st9=conn.createStatement();
	st10=conn.createStatement();
	
	

	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<%
	String userrole=session.getAttribute("userrole").toString();

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{
		String vehno=request.getParameter("vehno");
 %>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon"> <U> Special Report for <%=vehno%> has been added successfully </U> </font> </td>
			</tr>
		</table>
	
<%	}
%>

<table border="0" width="750px">
<tr>
	<td colspan="10" align="center"> <font color="maroon" size="3"> <B> VEHICLE LIST OF <%=group %> Showing 6th Day Data.</B> </font> 
</td>
</tr>
</table>
<table border="1" width="750px">
<tr>
	<td colspan="10" bgcolor="gray"> <font color="yellow"> <B> Yellow marking means UNIT MISSING </B> </font> 
	<div align="right"> <marquee> <font color="white"><B><I>Note:</I></B>Move your mouse to Complaint Date to check more details</font> </marquee>
	<a href="excelgrpsix.jsp?transporter=<%=group%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
</tr>
</table>

			<table border="1" width="750px" align="center" class="sortable">

			<tr>
				<td>Sr.</td>
				<td>Transporter</td>
				<td>Vehicle No</td>
				<td>Updated</td>
				<td>Location</td>
				<td>Veh Available Date </td>
				<td>UnitID</td>
				<td>MobileNo</td>
				<td>SimNo</td>
				<td>Peripheral</td>
				<td>Sim Comp</td>
				<td>Inst On</td>
				<td>Warranty</td>
				<td>Sp. Comments</td>
		</tr>

<%
try
{
int i=1;
String transname = "-";
String vehicleno = "-";
String unitid = "-";
String grpname = "-";
String update = "-";
String uptime = "-";
String uplocation = "-";
String mobno = "-";
String simno = "-";
String peripheral = "-";
String simcompany= "-";
String instdate = "-";
String warranty = "";
String wardate = "";

		sql="select Distinct(a.transporter),b.UnitID,b.OwnerName,b.InstalledDate from t_group a, t_vehicledetails b where a.GPName = '"+group+"' and a.transporter = b.VehicleRegNumber ";
		ResultSet rst = st.executeQuery(sql);
		while(rst.next())
			{
				vehicleno = rst.getString("a.transporter");
				unitid = rst.getString("b.UnitID");
				transname = rst.getString("b.OwnerName");
				try
				{
				instdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("b.InstalledDate")));
				}catch(Exception e)
				{
					instdate = "-";
				}
				
				sql1="select * from t_onlinedata a,t_vehicledetails b where a.VehicleRegNo = '"+vehicleno+"' and a.TheDate = '"+sdays+"' and b.VehicleRegNumber = '"+vehicleno+"' and b.status not in('Deleted','Removed', 'DeActivated') order by a.TheDate Desc";
				ResultSet rst1 = st1.executeQuery(sql1);
				if(rst1.next())
				{
					update = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst1.getString("a.TheDate")));	
					uptime = rst1.getString("a.TheTime");
					uplocation = rst1.getString("a.Location");
				

				%>
				
				<tr>
					<td><%=i%></td>
					<td><%=transname%></td>
					<td><%=vehicleno%></td>
					<td><font color="RED"><%=update%><br><%=uptime%></br></font></td>
					<td><font color="RED"><%=uplocation%></font></td>
			
				<%
				
				String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
				sql9="select * from t_complaints1 where VehicleNo='"+vehicleno+"' and Status <> 'Solved' ";
				ResultSet rst9 = st9.executeQuery(sql9);
				if(rst9.next())
				{
					
					attloc=rst9.getString("VehAttLoc");
					availdate=rst9.getString("VehAvailDate");
					allocatedto=rst9.getString("Status");
					desc=rst9.getString("Complaint");
					contpers=rst9.getString("ContDets");
					entby=rst9.getString("RegBy");
					DetDesc=rst9.getString("CDescription");
					compdate=rst9.getString("TdyDate");
					
					if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
					{
						sql10="select * from t_callocation1 where Tno='"+rst9.getString("Tno")+"' order by DofAllocation Desc";
						ResultSet rst10=st10.executeQuery(sql10);
						if(rst10.next())
						{
							allocatedto=rst10.getString("Technicion");
							//compdate=rs10.getString("DofAllocation");
						}
						else
						{
							allocatedto="Unallocated";
						}
							
					}
					
					if(availdate.equals(""))
					{
						availdate="No Information";
						
						%>
						<td><%=availdate %> </td>
						<%
					}
					
					else
					{
					
					try
					{
					%>
						<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?compdate=<%=compdate %>&attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>&DetDesc=<%=DetDesc %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate))%> </B>
						   
					<%	
					}catch(Exception e){
						
					out.println("-");
					}
					}
				}
				else
				{ 
				%>
				<td> No Complaint</td>		
				<%
				}
				
				
				sql2="select * from t_unitmaster where unitid = '"+unitid+"' ";
				ResultSet rst2 = st2.executeQuery(sql2);
				if(rst2.next())
				{
					mobno = rst2.getString("MobNo");
					simno = rst2.getString("SimNo");
					peripheral = rst2.getString("Peripherals");
					simcompany = rst2.getString("SimCompany");
				}

//*************************FOR WARRANTY *************************************
				
				sql3="select InstalledDate from t_vehicledetails where VehicleRegNumber = '"+vehicleno+"' ";
				ResultSet rst3 = st3.executeQuery(sql3);
				if(rst3.next())
				{
					wardate = rst3.getString("InstalledDate");
					sql4="select * from t_amchistory where VehNo = '"+vehicleno+"' order by NewDate desc limit 1";
					ResultSet rst4 = st4.executeQuery(sql4);
					if(rst4.next())
					{
						if(!(null==rst4.getDate("WarrantyTill")))
						{
							try
							{
								sql5="select TO_DAYS('"+rst4.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
								ResultSet rst5 = st5.executeQuery(sql5);
								if(rst5.next())
								{
									if(rst5.getInt("days") > 0)
									{
										warranty = "YES";
									}
									else
									{
										warranty = "NO";
									}
								}
							}catch(Exception e)
							{
								warranty="-";
							}
						}
						else
						{
							sql6="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
							ResultSet rst6= st6.executeQuery(sql6);
							if(rst6.next())
							{
								if(rst6.getInt("days") > 365)
								{
									warranty = "NO";
								}
								else
								{
									warranty = "YES";
								}
							}
						}
					}
					else
					{
						sql7="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
						ResultSet rst7 = st7.executeQuery(sql7);
						if(rst7.next())
						{
							if(rst7.getInt("days") > 365)
							{
								warranty = "NO";
							}
							else
							{
								warranty = "YES";
							}
						}
					}
					
				}
				
						
//***************************************************************************

			int spcnt=0;
			
			sql8="select count(*) as cnt from t_techspecialrep where VehRegNo = '"+vehicleno+"' and Closed='No' ";
			ResultSet rst8 = st8.executeQuery(sql8);
			while(rst8.next())
			{
				spcnt = rst8.getInt("cnt");
			}
			
			%>
			
		
			<td><%=unitid%></td>
			<td><%=mobno%></td>
			<td><%=simno%></td>
			<td><%=peripheral%></td>
			<td><%=simcompany%></td>
			<td><%=instdate%></td>
			<td><%=warranty%></td>
			<td><%=spcnt %></td>
		
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
</form>
</body>
</html>

