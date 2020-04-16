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
Statement st, st1, st2, st3, st01,st4,st5,st6,st7;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7;
String transporter,today,Svehlist,username,warranty;
String Vehcode="",unitid="",instdate="";
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
          <%@ include file="header1.jsp" %>
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
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn1.createStatement();
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<table border="0" width="750px" class="">
<tr><td align="center" colspan="2"><center><font color="black" size="3">List of All Vehicles For Deactaved Units.</font></center></td></tr>

<tr><td colspan="" bgcolor="">  
					<div align="right">  <a href="totdeactivexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
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
<td>Unit ID</td>
<td>Mobile No</td>
<td>Sim No</td>
<td>Peripherals</td>
<td>Sim Company</td>
<td>Deactivated Date</td>

</tr>

<%
try
{
	String us=username.toUpperCase();
	String update = "-";
	String uptime = "-";
	String uplocation = "-";
	String mobno = "-";
	String simno = "-";
	String peripheral = "-";
	String simcompany= "-";
	sql="select * from t_vehicledetails where status ='DeActivated' order by OwnerName Asc"; 
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst1.getString("OwnerName") %></td>
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNumber")%>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr>
		<td> <a href="techspcomment.jsp?vehno=<%=rst1.getString("VehicleRegNumber")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
	</tr>

	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	<%
		
	String sqldata="select * from t_onlinedata where VehicleRegNo = '"+rst1.getString("VehicleRegNumber")+"' order by TheDate Desc";
	ResultSet rstdata= st4.executeQuery(sqldata);
	if(rstdata.next())
	{
		update = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rstdata.getString("TheDate")));	
		uptime = rstdata.getString("TheTime");
		uplocation = rstdata.getString("Location");
	}
	
	%>
		<td><%=update %><br><%=uptime %></br></td>
		<td><%=uplocation %></td>
	
	<%
	
		String deactdate="";
		String deactunit="";

		sql2="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";
	    ResultSet rs2=st2.executeQuery(sql2);
	    if(rs2.next())
	    {
	    	deactdate=rs2.getString("EntDate");
	    	deactunit=rs2.getString("OldUnitID");
	    	
	    	
	    	
	    	%>
	    	<td>
		    <%
		    
		    try{%>
		        
	 		<%=deactunit%>		
		
		<%}catch(Exception e)
		{
			out.print("-");
		}
		   
		%>
		</td>
	    	
	    	
	    	<%
	    	
	    	
	    	sql2="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' and NewUnitID='"+deactunit+"'";
		    ResultSet rs22=st2.executeQuery(sql2);
		    if(rs22.next())
		    {
		    	
		    %>	
		    	
		    	<td>
			    <%
			    
			    try{%>
			        
		 		<%=rs22.getString("SimNo")%>		
			
			<%}catch(Exception e)
			{
				out.print("-");
			}
			   
			%>
			</td>
			<td>
			<%    
				try{%>
				
		 		<%=rs22.getString("MobNo")%>		
		 		<%}catch(Exception e)
		 		{
		 			out.print("-");
		 		}
		 		
			%> </td>
		    	
		    	<%
		    	
		    }
		    else
		    {
		    	%>
		    		
		    		<td>-</td>
		    		<td>-</td>
		    	<%
		    }
		    
		    
		    
	    }
	    
	    
	    sql5="select * from t_unitmaster where unitid = '"+unitid+"' ";
		ResultSet rstps = st6.executeQuery(sql5);
		if(rstps.next())
		{
			
			peripheral = rstps.getString("Peripherals");
			simcompany = rstps.getString("SimCompany");
		}
		else
		{
			peripheral = "-";
			simcompany = "-";
		}
		

	    	
	    %>
	    <td><%=peripheral %></td>
	    <td><%=simcompany %></td>
	<td>
	    
	   <% 
		try{%>
		 		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(deactdate))%> 		
 		<%}catch(Exception e)
 		{
 			out.print("-");
 		}
 		
	%> </td>
	
	
	</tr>

        <%
	i++;
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
