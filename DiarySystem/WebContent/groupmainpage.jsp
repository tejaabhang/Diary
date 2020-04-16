<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6,st7,st8,st9;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8,sql9;
String username,userrole,today,olddate,transporter;
String Svehlist;
ResultSet rst,rst1,rst2,rst3,rst4,rst5,rst6,rst7,rst8,rst9;
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
              
   
<!--- code start here ------>
<%
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
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
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
	st8=conn1.createStatement();
	st9=conn1.createStatement();
	
	int i=1;
	int alltotal=0;
	int allcurrent=0;
	int allnogps=0;
	int allonetwo=0;
	int allthreefive=0;
	int allsix=0;
	int alldisconnect=0;
	int allremoved=0;
	int allinactive=0;
	int alldeactivated=0;


	
	%>
	<table border="0" width="750px">
			<tr>
				<td align="center"> <font color="maroon" size="4">  GROUP LIST </font> </td>
			</tr>
	</table>
				<table border="2" width="750px">
						<tr>
							
							<td>Sr. No</td>
							<td>Group Name</td>
							<td>Install</td>
							<td>Current</td>
							<td>No GPS</td>
							<td>1 to 2 Days</td>
							<td>3 to 5 Days</td>
							<td>6 Days</td>
							<td>Disconnected</td>
							<td>Removed</td>
							<td>DeActivation Req</td>
							<td>In-Active</td>
							
						</tr>
		<%
		
		
		sql="select Distinct(GPName) as GPName from t_group where GPName not like '% del' and `GPName` not like '-' order by `GPName` Asc";
		rst = st.executeQuery(sql);
		while(rst.next())
		{
			
			Svehlist="('0";
			int total=0;
			int current=0;
			int nogps=0;
			int onetwo=0;
			int threefive=0;
			int six=0;
			int disconnect=0;
			int removed=0;
			int inactive=0;
			int deactivated=0;
			%>
			<tr>
				<td><%=i %></td>
				<td><font color="black"><b><%=rst.getString("GPName") %></b></font></td>
				<td><div align="center">
				<%
					sql1="select Distinct(a.transporter) from t_group a, t_vehicledetails b where a.GPName = '"+rst.getString("GPName")+"' and a.transporter = b.VehicleRegNumber ";
					rst1 = st1.executeQuery(sql1);
					while(rst1.next())
					{
						Svehlist = Svehlist+"','"+rst1.getString("transporter");
						total++;
					}
						Svehlist=Svehlist+"')";
						alltotal=alltotal+total;
				%>
				
				<a href="grpfullfleet.jsp?group=<%=rst.getString("GPName")%>"><font color="red"><%=total%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql2="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.TheDate >= '"+tdydate+"' and a.Location not like 'No GPS %' and a.VehicleRegNo = b.VehicleRegNumber and b.status not in('Deleted','Removed', 'DeActivated'))";
					rst2 = st2.executeQuery(sql2);
					//out.println(sql2);
					while(rst2.next())
					{
						current++;
					}
					allcurrent = allcurrent+current;
				%>
				<a href="grpcurrent.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=current%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql3="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.Location like 'No GPS %' and b.status not in('Deleted','Removed', 'DeActivated') and a.VehicleRegNo = b.VehicleRegNumber )";
					rst3 = st3.executeQuery(sql3);
					//out.println(sql3);
					while(rst3.next())
					{
						nogps++;	
					}
					allnogps = allnogps+nogps;
				%>
				<a href="grpnogps.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=nogps%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql4="select Distinct(a.VehicleRegNo) from t_onlinedata a,t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.TheDate < '"+tdydate+"' and a.TheDate > '"+today3+"' and a.Location not like 'No GPS %' and b.status not in('Deleted','Removed', 'DeActivated') and a.VehicleRegNo = b.VehicleRegNumber )";
					rst4 = st4.executeQuery(sql4);
					//out.println(sql4);
					while(rst4.next())
					{
						onetwo++;	
					}
					allonetwo = allonetwo+onetwo;
				%>
				<a href="grponetwo.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=onetwo%></font></a>
				</div></td>
				
				
				<td><div align="center">
				
				<%
					sql5="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.TheDate < '"+today+"' and a.TheDate > '"+sdays+"' and a.Location not like 'No GPS %' and b.status not in('Deleted','Removed', 'DeActivated') and a.VehicleRegNo = b.VehicleRegNumber )";
					rst5 = st5.executeQuery(sql5);
					//out.println(sql5);

					while(rst5.next())
					{
						threefive++;	
					}
					allthreefive = allthreefive+threefive;
				%>
				<a href="grpthreefive.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=threefive%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql6="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.TheDate = '"+sdays+"' and a.Location not like 'No GPS %' and b.status not in('Deleted','Removed', 'DeActivated') and a.VehicleRegNo = b.VehicleRegNumber )";
					rst6 = st6.executeQuery(sql6);
					//out.println(sql6);

					while(rst6.next())
					{
						six++;	
					}
					allsix = allsix+six;
				%>
				<a href="grpsix.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=six%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql7="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.TheDate < '"+sdays+"' and a.Location not like 'No GPS %' and b.status not in('Deleted','Removed', 'DeActivated') and a.VehicleRegNo = b.VehicleRegNumber )";
					rst7 = st7.executeQuery(sql7);
					//out.println(sql7);

					while(rst7.next())
					{
						disconnect++;	
					}
					alldisconnect = alldisconnect+disconnect;
				%>
				<a href="grpdisconnected.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=disconnect%></font></a>
				</div></td>
				
				<td><div align="center">
				
				<%
					sql8="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.VehicleRegNo = b.VehicleRegNumber and b.status='Removed')";
					rst8 = st8.executeQuery(sql8);
					//out.println(sql8);

					while(rst8.next())
					{
						removed++;	
					}
					allremoved = allremoved+removed;
				%>
				<a href="grpremoved.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=removed%></font></a>
				</div></td>
				
				
				<td><div align="center">
				
				<%
					sql9="select Distinct(a.VehicleRegNo) from t_onlinedata a, t_vehicledetails b where (a.VehicleRegNo in "+Svehlist+" and a.VehicleRegNo = b.VehicleRegNumber and b.status='DeActivated')";
					rst9 = st9.executeQuery(sql9);
					//out.println(sql9);

					while(rst9.next())
					{
						deactivated++;	
					}
					alldeactivated = alldeactivated+deactivated;
				%>
				<a href="grpdeactivated.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=deactivated%></font></a>
				</div></td>
				
				
				<td><div align="center">
				
				<%
						inactive = total-current-nogps-onetwo-threefive-six-disconnect-removed-deactivated;
						
						allinactive = allinactive+inactive;
				%>
				<a href="grpinactive.jsp?transporter=<%=rst.getString("GPName")%>"><font color="red"><%=inactive%></font></a>
				</div></td>
				
				
			</tr>
			
			<%
			i++;
			
		}
		
		%>	
						
				</table>
				
				<table border="2" width="750px"> 
						<tr><td><div align="center">
							<b> Perfomance Table </b>
						</td></tr>
				</table>
				<table border="2" width="750px"> 
						<tr>
							<td></td>
							<td>Install</td>
							<td>Current</td>
							<td>No GPS</td>
							<td>1 to 2 Days</td>
							<td>3 to 5 Days</td>
							<td>6 Days</td>
							<td>Discon- nected</td>
							<td>Rem- oved</td>
							<td>De-Activ<br>ation<br> Req</td>
							<td>In - Active</td>
						</tr>
						<tr>
							<td><font color="RED">TOTAL</font></td>
							<td><%=alltotal%></td>
							<td><%=allcurrent%></td>
							<td><%=allnogps%></td>
							<td><%=allonetwo%></td>
							<td><%=allthreefive%></td>
							<td><%=allsix%></td>
							<td><%=alldisconnect%></td>
							<td><%=allremoved%></td>
							<td><%=alldeactivated%></td>
							<td><%=allinactive%></td>
						
						</tr>
						
						
				</table>
	
	
	<table width="750px" height="350px" border="0">
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
