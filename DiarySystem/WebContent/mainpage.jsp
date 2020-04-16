<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6, st7, st8, st9, st10;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,transporter;
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
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn.createStatement();
	st8=conn.createStatement();
	st9=conn.createStatement();
	st10=conn1.createStatement();
	
	int total=0,updated=0,nogpscnt=0,dealy=0,disconnected=0,notactive=0,transid=0;
	int instcount=0,currcount=0,delcount=0,discount=0,notacount=0,unallocated=0, unallocatedall=0,removedcnt=0, deativatedreqtotcnt=0, nogpscnttot=0, missingtot=0, compalltot=0, callcounttot=0, callcounttecttot=0;
	
	
	String tt=session.getAttribute("TransporterList").toString();
	StringTokenizer s= new StringTokenizer(tt,",");
	String us1=username.toUpperCase();
		if(us1.equals("CASTROL"))
		{
		%>
		<div align="left"><font size="2"><a href="notactiveintrip.jsp">Click to view vehicles not active in trip</a></font></div>		
		<%
		}
		%>
		<hr width="750px"> </hr>
		<font color="yellow"> <B> Yellow </B> </font> mark means Transporter is Blocked.
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<th> Sr.</th>
		<th> Transporter</th>
		<th>Install</th>
		<th>Current</th>
		<th>No GPS</th>
		<th>1 to 6 days</th>
		<th>Discon- nected</th>
		<th>Rem- oved</th>
		<th>De-Activ<br>ation<br> Req</th>
		<th>In - Active</th>
		<th>Mis- sing</th>
		<th>Comp.-  Allocated</th>
		<th>Comp. Un- Allocated<br> <!-- <a href="viewallunallocated.jsp">View All</a> --> </th>
<% /*
		String userrole=session.getAttribute("userrole").toString();
		if(userrole.equals("Manager"))
		{  */ %>
			<th> Allocated to</th>
			<th> Today's Call/s (Transp)</th>
			<th> Today's Call/s (Techs)</th> </tr>	

<%	/*	}   			

		*/
		//ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(s.hasMoreTokens())
		{
		transporter=s.nextElement().toString();
		transporter=transporter.replace(")","");
		transporter=transporter.replace("(","");
		if(transporter.equals("a"))
		{
			transporter=s.nextElement().toString();
		}
		
		String rowcolor="";
		sql="select * from t_usermessage where UserTypeValue='"+transporter+"' and MessageId in ('4','5') and DisplayStatus='yes' ";
		ResultSet rsblock=st10.executeQuery(sql);
		if(rsblock.next())
		{
			rowcolor="yellow";
		}
		
		total=0;
		updated=0;
		nogpscnt=0;
		dealy=0;
		disconnected=0;
		notactive=0;
		Svehlist="(0";
		unallocated=0;
		int disconcnt=0, remcnt=0, deactreqcnt=0, inactive=0, missing=0, allocated=0, callcounttrans=0, callcounttemp=0;
		%>
		<tr bgcolor='<%=rowcolor%>'>
		<td><%=i%> </td>
		<td><B><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=transporter%></a></B>
		<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href='callhistory.jsp?trans=<%=transporter%>' onclick="toggleDetails(<%=i%>,false);">Call HIstory</a></td></tr>
	<tr><td><a href='rephistory.jsp?trans=<%=transporter%>' onclick="toggleDetails(<%=i%>,false);">Maintenance</a></td></tr>
	<tr><td><a href='comprep.jsp?trans=<%=transporter%>' onclick="toggleDetails(<%=i%>,false);">Comp. Report</a></td></tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
</div>		
		</td>
		
		<%
		String us=username.toUpperCase();
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
		sql="select *  from t_vehicledetails where OwnerName='"+transporter+"'";
		}
		ResultSet rst1=st2.executeQuery(sql);
		//out.print(sql+"<br>");
		while(rst1.next())
		{
			Svehlist=Svehlist+","+rst1.getString("VehicleCode");
			total ++;
		}
		instcount=instcount+total;
		Svehlist=Svehlist+")";
		%>
		<td>
		<div align="right"><a href="fullfleet.jsp?transporter=<%=transporter%>"><font color="red"><%=total%></font></a></div>
		
		</td>
		<td>
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate >='"+today+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.VehicleCode";	
		//out.print(sql+"<br>");
		ResultSet rst2=st2.executeQuery(sql);
			
		if(rst2.next())
		{
			out.print("<div align='right'><a href='currentdata.jsp?transporter="+transporter+"' ><font color='red'>"+rst2.getInt("count")+"</font></a></div>");
			
			updated=rst2.getInt("count");
			currcount=currcount+updated;
		}
		%> 
		</td>
		<td>
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in('Deleted','Removed', 'DeActivated') and a.Location like 'No GPS %' order by a.VehicleCode";	
		//out.print(sql+"<br>");
		ResultSet rstnogps=st2.executeQuery(sql);
			
		if(rstnogps.next())
		{
			out.print("<div align='right'><a href='nogpsvehs.jsp?transporter="+transporter+"' ><font color='red'>"+rstnogps.getInt("count")+"</font></a></div>");
			
			nogpscnt=rstnogps.getInt("count");
			nogpscnttot=nogpscnttot+nogpscnt;
			
		}
		%>  
		</td>
		<td>

		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+today+"' and a.TheDate >= '"+olddate+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
		//out.print(sql+"<br>");
		ResultSet rst3=st2.executeQuery(sql);
		if(rst3.next())
		{
			out.print("<div align='right'><a href='delaydata.jsp?transporter="+transporter+"' ><font color='red'>"+rst3.getInt("count")+"</font></a></div>");
			dealy=rst3.getInt("count");
			delcount=delcount+dealy;
		}
		%>
		</td>
		<td> 
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+olddate+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
		
		//out.print(sql+"<br>");
		ResultSet rst4=st2.executeQuery(sql);
		if(rst4.next())
		{
			disconnected=rst4.getInt("count");
			discount=discount+disconnected;
		} 
		
		out.print("<div align='right'><a href='disconnected.jsp?transporter="+transporter+"' ><font color='red'>"+disconnected+"</font></a></div>");

		 	
		%>
	
		</td>
		<td><div align="right">
		<%
			sql="select * from t_vehicledetails where ownername='"+transporter+"' and status='Removed' and VehicleCode in "+Svehlist+" order by VehicleCode";
			ResultSet rstrem=st2.executeQuery(sql);
			while(rstrem.next())
			{
			remcnt++;
			}
			if(remcnt >0)
			{
				out.print("<a href='removedunits.jsp?transporter="+transporter+"' <font color='red'>"+remcnt+"</font></a>");
				
			}
	      else
	      {	
			out.print("<font color='red'>"+remcnt+"</font>");
			}
			removedcnt=removedcnt+remcnt;
		%>
		</td>
		<td><div align="right">
		<%
			sql="select * from t_vehicledetails where ownername='"+transporter+"' and status='DeActivated' and VehicleCode in "+Svehlist+" order by VehicleCode";
			ResultSet rstdeact=st2.executeQuery(sql);
			while(rstdeact.next())
			{
				deactreqcnt++;
			}
			if(deactreqcnt >0)
			{
				out.print("<a href='deactivatedreq.jsp?transporter="+transporter+"' <font color='red'>"+deactreqcnt+"</font></a>");
				
			}
	      else
	      {	
			out.print("<font color='red'>"+deactreqcnt+"</font>");
			}
			
			deativatedreqtotcnt=deativatedreqtotcnt+deactreqcnt;
				
		%>
		</td>
		<td><div align="right">
		<%
		notactive=total-updated-dealy-disconnected-remcnt-nogpscnt-deactreqcnt;
		notacount=notacount+notactive;
		out.print("<a href='notactive.jsp?transporter="+transporter+"'><font color='red'>"+notactive+"</font></a>");
		%>
		</div>
		</td>
<%
	String sql8="select count(*) as miscnt from t_unitmissing where Owner='"+transporter+"' and Status='Missing' ";
	ResultSet rs8=st1.executeQuery(sql8);
	if(rs8.next())
	{
		missing=rs8.getInt("miscnt");
		missingtot=missingtot+missing;
	} 
		

	if(missing > 0)
	{
%>
		<td> <a href="showmissingunits.jsp?trans=<%=transporter%>"> <%=missing%> </a> </td>
<%	}
	else
	{ %>
		<td> <%=missing%> </td>
<%	} %>
		<td><div align="right">
		<%
		sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and (Status in ('Allocated','Attended'))";		
		//out.print(sql+"<br>");		
		ResultSet rst6=st1.executeQuery(sql);
		if(rst6.next())
		{
			allocated=rst6.getInt("count");
			compalltot=compalltot+allocated;
			if(allocated >0)
			{
				out.print("<a href='compallocated.jsp?transporter="+transporter+"'>"+allocated+"</a>");
			}
			else
			{
				out.print(allocated);
			}
		}
		
		%>
		</div>
		</td>
		
		<td><div align="right">
		<%
		sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and Status in ('UnAllocated') ";		
		//out.print(sql+"<br>");
		ResultSet rst5=st1.executeQuery(sql);
		if(rst5.next())
		{
			unallocated=rst5.getInt("count");
			unallocatedall=unallocatedall+unallocated;
			
			if(unallocated >0)
			{
			%>
			<a href='complaintview.jsp?transporter=<%=transporter%>'><%=unallocated%></a>			
			<%
			}
			else
			{
			out.print(unallocated);
			}
		}
	/*	
		if(userrole.equals("Manager"))
		{
		*/
			String rep=""; 
			
			String sql5="select * from t_asgndtranstoreps where Transporter='"+transporter+"' ";
			
			ResultSet rs5=st7.executeQuery(sql5);
			if(rs5.next())
			{
				rep=rs5.getString("Representative");
			}

			String sql6="select count(*) as count from t_callinformation where TheDate='"+tdydate+"' and Transporter='"+transporter+"' and CallerType='transporter' ";
			
			ResultSet rs6=st8.executeQuery(sql6);
			if(rs6.next())
			{
				callcounttrans=rs6.getInt("count");
				callcounttot=callcounttot+callcounttrans;
			}
			
			

			String sql7="select count(*) as count from t_callinformation where TheDate='"+tdydate+"' and Transporter='"+transporter+"' and CallerType='Technician'";
			ResultSet rs7=st9.executeQuery(sql7);
			if(rs7.next())
			{
				callcounttemp=rs7.getInt("count");
				callcounttecttot=callcounttecttot+callcounttemp;
			}
			
			
			
		%>
			<td> <%=rep%> </td>	
			<td> <%=callcounttrans%> </td>	
			<td> <%=callcounttemp%> </td>
<%	/*	} */ %>
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
			<td colspan="14"> <div align="center"> <b> <i>Performance </i> </b> </div> </td>
		</tr>
		<tr>
		<td><b>Installed</b></td>
		<td><b>Current</b></td>
		<td><b>No GPS</b></td>
		<td><b> 1 to 6<br> Days </br></b></td>
		<td><b>Disconn<br>ected </br> </b></td>
		<td><b>Rem<br> oved </br></b></td>
		<td><b>DeActiva <br>tion Req </br></b></td>
		
		<td><b>In Active</b></td>
		<td><b>Miss<br> ing</br></b></td>
		<td><b>Comp All<br> ocated</br></b></td>
		<td><b>Comp UnAll<br> ocated</br></b></td>
		<td><b>Today's Calls <br> (Transp)</br></b></td>
		<td><b>Today's Calls <br> (Techs)</br></b></td>
		<td><b>Delay<br> %age </br></b></td>
		

</tr>
<tr>
		<td ><div align="right"><font color="#660033" >
			<% if(instcount>0)
				{ %>
					<!--  <a href="totalinstalled.jsp"> <%=instcount%> </a> -->
							<%=instcount%>
			<%	}
			else
			{%>
					<%=instcount%>
		<%	} %>
			
		</font></div></td>
		<td><div align="right"><font color="#660033">  
			<% if(currcount>0) 
				{  %>
					<!--   <a href="totalcurrentvehs.jsp"> <%=currcount%> </a> --> <%=currcount%>
			<%   } 
			else
			{		
			%>		
					<%=currcount%>
		<%   }
			%>					 </font></div></td>
			
		<td><div align="right"><font color="#660033">	
		<%
			if(nogpscnttot>0)
			{%>
				<!-- <a href="nogpstotal.jsp"> <%=nogpscnttot%> </a> --> <%=nogpscnttot%>
		<% 	}
			else
			{ %>
				<%=nogpscnttot%>
		<%	}		
		%>	
		</font></div></td>
		
		<td><div align="right"><font color="#660033">
		<%
			if(delcount>0)
			{ %>
		<!-- 		<a href="tot1to6delayvehs.jsp"> <%=delcount%> </a> -->	  <%=delcount%>	
	<%		}
			else
			{ %>
				<%=delcount%>	
		<%	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033">
		<%
			if(discount>0)
			{ %>
				<!--  <a href="totdisconnected.jsp"> <%=discount%> </a> -->	 <%=discount%>
		<%	}
			else
			{ %>
				<%=discount%>
		<%	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033">
		<%
			if(removedcnt>0)
			{ %>
				<!--  <a href="totremovedvehs.jsp"> <%=removedcnt%> </a> -->	 <%=removedcnt%>
		<%	}
			else
			{ %>
				<%=removedcnt%>	
		<%	}
		%>
		</font></div></td>
		<td><div align="right"><font color="#660033">
		<%
			if(deativatedreqtotcnt>0)
			{ %>
			<!-- 	<a href="totdeactivreq.jsp"> <%=deativatedreqtotcnt%> </a> -->	 <%=deativatedreqtotcnt%>
		<%	}
			else
			{ %>
					<%=deativatedreqtotcnt%>
		<%	}
		%>
		</font></div></td>
		
		<td><div align="right"><font color="#660033">
		<%
			if(notacount>0)
			{ %>
			<!-- 	<a href="totnotactive.jsp"> <%=notacount%> </a> --> <%=notacount%>
		<%	}
			else
			{ %>
				<%=notacount%>			
		<%	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033"> 
		<%
			if(missingtot>0)
			{ %>
				<!--  <a href="totmissingunitsvehs.jsp"> <%=missingtot %> </a> -->	 <%=missingtot %>
		<%	}
			else
			{ %>
				<%=missingtot %>			
		<% 	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033"> 
		<%
			if(compalltot>0)
			{ %>
				<!-- 	<a href="totcompall.jsp"> <%=compalltot %> </a>  -->  <%=compalltot %>
		<%	}
			else
			{ %>
					<%=compalltot %>				
		<%	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033"> 
		<%
			if(unallocatedall>0)
			{ %>
				<!--  <a href="totcompunalloc.jsp"> <%=unallocatedall %> </a> -->	  <%=unallocatedall %> 
		<%	}
			else
			{ %>
				<%=unallocatedall %>									
		<%	}
		%>
		 </font></div></td>
		<td><div align="right"><font color="#660033">
		<%
			if(callcounttot>0)
			{ %>
			<!-- 		<a href="totcallstransp.jsp"> <%=callcounttot %> </a> --> <%=callcounttot %>	
		<%	}
			else
			{ %>
					<%=callcounttot %>	
		<%	}
		%>
		   </font></div></td>
		<td><div align="right"><font color="#660033"> 
		<%
			if(callcounttecttot>0)
			{ %>
				<!--  <a href="totcallstechs.jsp"> <%=callcounttecttot %> </a>  -->	  <%=callcounttecttot %>
		<%	}
			else
			{ %>
					<%=callcounttecttot %>	
		<%	}
		%>
		 </font></div></td>
		
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
