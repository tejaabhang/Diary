<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<script language="javascript">

</script>

<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1, stmt2,stechname,tveh;
String sql,sql1,sqltech,sqlveh,username,userrole,today,olddate,thedate,technician,thedate1,thename;
int CAvcount=0;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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

<!-- Checking request from tech type or not, and making headers available accordingly-->

<% 

String tech=request.getParameter("tech");
if(tech==null)
{ %>
	<%@ include file="header1.jsp" %>
	
<% }
   
   else
   { %>
   	<%@ include file="headertech.jsp" %>
  <% }
 %>

          
  
                  </div>  
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<form name="mydiary" method="get" action="" onSubmit="return validate();"> 
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
String techn=request.getParameter("techname");


try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	stmt2=conn1.createStatement();
	stechname=conn.createStatement();
	tveh=conn.createStatement();

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon"> <b> Successfully Inserted</b> </font> </td>
			</tr>
		</table>		
<%	}

	String reallocated=request.getParameter("reallocated");
	if(reallocated==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon"> <B> Successfully Re-Allocated</B> </font> </td>
			</tr>
		</table>	
<%	}
	
%>

		
		<hr width="750px"> </hr>
		<table border="0" width="750px" align="center">
		<tr>
		<td ><center><b>
		<font size="3" color="RED">Vehicles Available to <%=techn%> to check the Units from Date <%
 		thedate=request.getParameter("thedate");
 		thedate1=request.getParameter("thedate1");
 		//thename=request.getParameter("radio1");
 		if(null==thedate)
 		{
 			thedate=today;
 			thedate1=today;
 			//thename="All";
 		}		
 		Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
 		out.print(formatter2.format(new SimpleDateFormat("yyyy-MM-dd").parse(thedate)));
 		out.print("  to Date "+formatter2.format(new SimpleDateFormat("yyyy-MM-dd").parse(thedate1)));
		%>.
		</b></center>
		</td>
		</tr>
		
		<hr width="750px"> </hr>
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<td><font color="black" size="2">Sr.</font></td>
		<td><font color="black" size="2">VehRegNo.</font></td>
		<td><font color="black" size="2">Comp. Lodged Date</font></td>
		<td><font color="black" size="2">Transporter</font></td>
		<td><font color="black" size="2">Location</font></td>
		<td><font color="black" size="2">Available Date</font></td>
		<td><font color="black" size="2">Technician</font></td>
		<td><font color="black" size="2">Comp. Desc.</font></td>
		<td><font color="black" size="2">Contact Person</font></td>
		<td><font color="black" size="2">Ent. By</font></td>	
		</tr>
		
<%
	String trans=request.getParameter("trans");
	if(trans==null)
	{
		sql="select * from t_complaints1 where VehAvaildate between '"+thedate+"' and '"+thedate1+"' and Status in ('Allocated', 'Attended') order by VehAvaildate Desc";
	}
	else
	{
		sql="select * from t_complaints1 where VehAvaildate between '"+thedate+"' and '"+thedate1+"' and Status in ('Allocated', 'Attended') order by VehAvaildate Desc";
	}
	//out.print(sql);	
	ResultSet rst=st.executeQuery(sql);
	int i=1;
	while(rst.next())
	{
	
		sql="select * from t_callocation1 where Tno='"+rst.getString("Tno")+"' and Technicion='"+techn+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
			technician=rst1.getString("Technicion");
		
	
		String vehcode="";
		String sql3="select * from t_vehicledetails where VehicleRegNumber='"+rst.getString("VehicleNo")+"' ";
		ResultSet rs3=stmt2.executeQuery(sql3);
		if(rs3.next())
		{
			vehcode=rs3.getString("VehicleCode");
					
		
		
	
	%>
	<tr>
	<td><%=i%></td>
	<td>
	<a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here">	
	<%=rst.getString("VehicleNo")%>
	</a>
<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href='action1.jsp?tno=<%=rst.getString("Tno")%>&tech=<%=technician%>&vehno=<%=rst.getString("VehicleNo")%>&d1=<%=thedate%>&d2=<%=thedate1%>' onclick="toggleDetails(<%=i%>,false);">Action By Technician</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehcode%>', 'win1', 'width=750, height=400, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')" > View History</a></td></tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
</div>
	
	</td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("TdyDate")))%></td>
	<td><%=rst.getString("Customer")%></td>
	
	<td><%=rst.getString("VehAttLoc")%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvaildate"))%></td>
	<td><%=technician%></td>
	<td><%=rst.getString("CDescription")%></td>
	<td><%=rst.getString("ContDets")%></td>			
	<td><%=rst.getString("RegBy")%></td>	
	</tr>	
	
	<%
	i++;
		}
	}
	}
	
		

	%>
	
	</table>	
	<%
//} //close of main IF (whether request is from tech login or not)


//} //close of else (whether request is from tech login or not)
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
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
