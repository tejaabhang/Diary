<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
int instcount,currcount,delcount,discount,notacount,unallocated, unallocatedall;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<title>Seven Day Diary System.</title>
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
           <!-- <div id="gbox-top1"> </div> --> 
            <div id="gbox-bg1">
              <div id="gbox-grd1">
        <table border="0" width="750px">
       <tr> 
          <td>
            <div align="right"><a href="viewnotactive.jsp"><font color="red" size="2">Click to view all not active vehicles in trip with last trip date.</font></a>
            </div>
            
          </td>
       </tr>
     </table>       
     
   
<!--- code start here ------>
<%
instcount=0;
currcount=0;
delcount=0;
discount=0;
notacount=0;
unallocatedall=0;
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-6000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where GPName='"+username+"'";
	%>
		<hr width="750px"> </hr>
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<th> Sr.</th>
		<th> Transporter</th>
		<th>Total </th>
		<th>Current </th>
		<th>1 to 6 days</th>
		<th>Disconnected</th>
		<th>Not Active</th>
		</tr>
		<%
		ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		total=0;
		updated=0;
		dealy=0;
		disconnected=0;
		notactive=0;
		Svehlist="(0";
		unallocated=0;
		%>
		<tr>
		<td><%=i%></td>
		<td><B><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst.getString("Transporter")%></a></B>
		<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href='callhistory.jsp?trans=<%=rst.getString("Transporter")%>' onclick="toggleDetails(<%=i%>,false);">Call HIstory</a></td></tr>
	<tr><td><a href='rephistory.jsp?trans=<%=rst.getString("Transporter")%>' onclick="toggleDetails(<%=i%>,false);">Maintenance</a></td></tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
</div>		
		</td>
		<td>
		<%
		String us=username.toUpperCase();
		if(us.equals("CASTROL"))
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+rst.getString("Transporter")+"' and Active='No'";
		}
		else
		{
		sql="select *  from t_vehicledetails where OwnerName='"+rst.getString("Transporter")+"'";
		}
		ResultSet rst1=st2.executeQuery(sql);
		while(rst1.next())
		{
			Svehlist=Svehlist+","+rst1.getString("VehicleCode");
			total ++;
		}
		instcount=instcount+total;
		Svehlist=Svehlist+")";
		out.print("<div align='right'><font color='red'>"+total+"</font></div>");
		%>
		</td>
		<td>
		<%
		sql="select count(*) as count from t_onlinedata where Transporter='"+rst.getString("Transporter")+"' and TheDate >='"+today+"' and VehicleCode in "+Svehlist+" order by VehicleCode";	
		ResultSet rst2=st2.executeQuery(sql);
		if(rst2.next())
		{
			out.print("<div align='right'><font color='red'>"+rst2.getInt("count")+"</font></div>");
			updated=rst2.getInt("count");
			currcount=currcount+updated;
		}
		%>
		</td>
		<td>

		<%
		sql="select count(*) as count from t_onlinedata where Transporter='"+rst.getString("Transporter")+"' and TheDate < '"+today+"' and TheDate >= '"+olddate+"' and VehicleCode in "+Svehlist+" order by VehicleCode";
		ResultSet rst3=st2.executeQuery(sql);
		if(rst3.next())
		{
			out.print("<div align='right'><font color='red'>"+rst3.getInt("count")+"</font></div>");
			dealy=rst3.getInt("count");
			delcount=delcount+dealy;
		}
		%>
		</td>
		<td>
		<%
		sql="select count(*) as count from t_onlinedata where Transporter='"+rst.getString("Transporter")+"' and TheDate < '"+olddate+"' and VehicleCode in "+Svehlist+" order by VehicleCode";	
		ResultSet rst4=st2.executeQuery(sql);
		if(rst4.next())
		{
			out.print("<div align='right'><font color='red'>"+rst4.getInt("count")+"</font></div>");
			disconnected=rst4.getInt("count");
			discount=discount+disconnected;
		}
		%>
	
		</td>
		<td><div align="right">
		<%
		notactive=total-updated-dealy-disconnected;
		notacount=notacount+notactive;
		out.print("<font color='red'>"+notactive+"</font>");
		%>
		</div>
		</td>
		</tr>

		<%
		i++;
		}
		%>
		</table>
		<p></p>
		<table width="750px" class="sortable">
		<tr>
		<td><b>Total </b></td>
		<td><b>Current</b></td>
		<td><b>1 to 6 Days</b></td>
		<td><b>Disconnected</b></td>
		<td><b>Not Active</b></td>
		<td><b>Delay Percentage</b></td>

</tr>
<tr>
		<td ><div align="right"><font color="#660033" ><%=instcount%></font></div></td>
		<td><div align="right"><font color="#660033"><%=currcount%></font></div></td>
		<td><div align="right"><font color="#660033"><%=delcount%></font></div></td>
		<td><div align="right"><font color="#660033"><%=discount%></font></div></td>
		<td><div align="right"><font color="#660033"><%=notacount%></font></div></td>
		<td><div align="right"><font color="#660033"><% double pp=(notacount+discount+delcount)*100;
																		double pp1=pp/instcount;
																		String pp2=""+pp1;
																		if(pp2.length()>5)
																		{
																			out.print(pp2.substring(0,5)+" %");
																		}	
																		else
																		{
																			out.print(pp2+" %");
																		}	
		%></font></div></td>
</tr>
		</table>
		<table border="0" width="350px" height="300px">
		<tr><td></td></tr>
		</table>
	<%

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
