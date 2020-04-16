<%-- 
    Document   : notactive
    Created on : Aug 12, 2008, 10:19:52 AM
    Author     : Azar
    Discroption: this page show the vehicles which are Deactivated-
    last updated : Aug 12, 2009.
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate;
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
<script type="text/javascript">

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
<script language="javascript">
function showtextarea(a,b,c)
{
	document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'   class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='notactive.jsp'></form>";
}
function canceldiv(A)
{
	document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
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
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
}
catch(Exception e)
{
	out.print("Exception -->"+e);
}
%>
<table border="0" width="750px">
<tr><td align="center" colspan="2">
<center><font color="black" size="2">De-activation requested by <%=transporter %> .</font></center>
</td></tr>
<tr><td><a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"><b>Last 10 Outgoing Calls</font></a></td>
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
<td>Sr.</td>
<td>Contact Name</td>
<td>Phone</td>
<td>Mobile</td>
<td>Email</td>
<td>Location</td>
<td>Comment</td>
<%
String userrole=session.getAttribute("userrole").toString();
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ %>
	<td> Edit</td>
<%	
}
%>
</tr>
<%
sql1="select * from t_recieverinfo where Transporter='"+transporter+"' and ActiveStatus='Yes' ";
ResultSet rst3=st.executeQuery(sql1);
int a=1;
while(rst3.next())
{
String rname=rst3.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td>
<a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst3.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst3.getString("RecieverName")%></a>
</td>
<td><%=rst3.getString("Phone")%></td>
<td><%=rst3.getString("Mobile")%></td>
<td><a href="mailto:<%=rst3.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst3.getString("Email")%></a></td>
<td><%=rst3.getString("PlaceName")%></td>
<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rname%>&trans=<%=transporter%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Edit</a></td>
<%
if(userrole.equals("Manager"))
{ %>
	<td>  <a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst3.getString("Rid") %>', 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Edit</a></td>
<%	
} %>
</tr>
<%
a++;
}
%>
</table>




<p></p>
<p></p>
<p></p>


   
		<table border="1" width="750px" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Vehicle No</td>
<td>Unit ID</td>
<td>Sim No</td>
<td>Mob No</td>
<td>DeActivated Date</td>

<td>In Trip</ht>
</tr>

<%
try
{
	
	/* sql="select *  from t_vehicledetails where OwnerName='"+transporter+"'";
	ResultSet rst=st1.executeQuery(sql);
	while(rst.next())
	{
	Svehlist=Svehlist+","+rst.getString("VehicleCode");
	}
	Svehlist=Svehlist+")";
	*/
	sql="select * from t_vehicledetails where ownername='"+transporter+"' and status ='DeActivated'"; 
	ResultSet rst1=st1.executeQuery(sql);
	int i=1;
	while(rst1.next())
	{
	%>
	<tr>
	<td><%=i%></td>
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
		String deactdate="";
		String deactunit="";
		sql2="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and 103.241.181.36='DeActive' order by EntDate desc";
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
	    	
	    	
	    	
	    	
	    }
	    %>
	    
	    
	<td>
	<%    
		try{%>
		
		 		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(deactdate))%> 		
 		<%}catch(Exception e)
 		{
 			out.print("-");
 		}
 		
	%> </td>
	
	<td><%
	sql="select * from t_startedjourney where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' and StartDate >'"+olddate+"'";
	ResultSet rst2=st2.executeQuery(sql);
	if(rst2.next())
	{
	String startdate=rst2.getString("StartDate");
	String origin =rst2.getString("StartPlace");
	String destination=rst2.getString("EndPlace");
	%>
	
<a href="javascript: flase" onClick="window.open ('tripinfo.jsp?startdate=<%=startdate%>&origin=<%=origin%>&destination=<%=destination%>','win1','width=400,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Yes</a>


	<%	
	}
	else
	{
	out.print("No");
	}
	%>
	</td>
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
