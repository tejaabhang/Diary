<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Main_Page.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st22,st3,st4,st5,st6, st7, st8, st9, st10,sttrans,st444,stchk;
String sql,sql1,sql2,sql3,sql4,sqlsix,username,userrole,today,olddate,Svehlist,transporter,asgntr;
%>

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
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st22=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn.createStatement();
	st8=conn.createStatement();
	st9=conn.createStatement();
	st10=conn1.createStatement();
	sttrans=conn1.createStatement();
	st444=conn1.createStatement();
	stchk =conn1.createStatement();
	
	
	
	int total=0,updated=0,nogpscnt=0,dealy=0,dealy1=0,disconnected=0,notactive=0,transid=0,sixdays=0;
	int instcount=0,currcount=0,delcount=0,delcount1=0,discount=0,notacount=0,unallocated=0, unallocatedall=0,removedcnt=0, deativatedreqtotcnt=0, nogpscnttot=0, missingtot=0, compalltot=0, callcounttot=0, callcounttecttot=0,sixcount=0;
			
	String us1=username.toUpperCase();
		if(us1.equals("CASTROL"))
		{
		%>
		<div align="left"><font size="2"><a href="notactiveintrip.jsp">Click to view vehicles not active in trip</a></font></div>		
		<%
		}
		%>
		
		<hr width="750px"> </hr>
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<td> Sr.</td>
		<td> Transporter</td>
		<td>Install</td>
		<td>Current</td>
		<td>No GPS</td>
		<td>1 to 2 Days</td>
		<td>3 to 5 Days</td>
		<td>6 Days</td>
		<td>Discon- nected</td>
		<td>Rem- oved</td>
		<td>De-Activation Req</td>
		<td>In - Active</td>
		<td>Mis- sing</td>
		<td>Comp.-  Allocated</td>
		<td>Comp. Un- Allocated</td>
		<td> Assign to</td>
		<td> Today's Call/s (Transp)</td>
		<td> Today's Call/s (Techs)</td> </tr>	

<%	
		int i=1;
	
		
	String sqltrans="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";// where Available='Yes'";	
	ResultSet rsttrans=sttrans.executeQuery(sqltrans);
	while(rsttrans.next())
	{	
		transporter=rsttrans.getString("OwnerName");
		//System.out.println(">>>>>>sql 3>>username>>"+username);
		
		if(username.equalsIgnoreCase("Kamal Dixit") || username=="Kamal Dixit")
		{
			
			//System.out.println(">>>>>>INSIDE LOOP OF WHILE>>");
			
			total=0;
			updated=0;
			nogpscnt=0;
			dealy=0;
			dealy1=0;
			disconnected=0;
			notactive=0;
			Svehlist="(0";
			unallocated=0;
			int disconcnt=0, remcnt=0, deactreqcnt=0, inactive=0, missing=0, allocated=0, callcounttrans=0, callcounttemp=0;
			
			
			String tr="";
			asgntr="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+transporter+"' ";
			ResultSet  st=stchk.executeQuery(asgntr);
			//System.out.println(">>>>>>sql 3>>asgntr>>"+asgntr);
			if(st.next())
			{
				
			tr=st.getString("Representative");	
				
			}
			
			//System.out.println(">>>>>>REP>>"+tr);
			
			
			if(tr=="Kamal Dixit" || tr.equalsIgnoreCase("Kamal Dixit")){

				
				//System.out.println(">>>>>>INSIDE KAMAL DIXIT>>");
				
			
			
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
		while(rst1.next())
		{
			Svehlist=Svehlist+","+rst1.getString("VehicleCode");
			total ++;
		}
		instcount=instcount+total;
		Svehlist=Svehlist+")";
		%>
		
		<td><%=i%> </td>
		<td><%=transporter%>"</td>
		<td><%=total%></font></a></div>
		</td>
		<td>
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate ='"+tdydate+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.VehicleCode";	
		ResultSet rst2=st2.executeQuery(sql);
		if(rst2.next())
		{
			out.print("<font color='red'>"+rst2.getInt("count")+"</font>");
			
			updated=rst2.getInt("count");
			currcount=currcount+updated;
		}
		%> 
		</td>
		<td>
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in('Deleted','Removed', 'DeActivated') and a.Location like 'No GPS %' order by a.VehicleCode";	
		ResultSet rstnogps=st2.executeQuery(sql);
		//out.println(sql);	
		if(rstnogps.next())
		{
			out.print("<font color='red'>"+rstnogps.getInt("count")+"</font>");
			nogpscnt=rstnogps.getInt("count");
			nogpscnttot=nogpscnttot+nogpscnt;
		}
		%>  
		</td>
		<td>
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+tdydate+"' and a.TheDate > '"+today3+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
		ResultSet rst3=st2.executeQuery(sql);
		if(rst3.next())
		{
			out.print("<font color='red'>"+rst3.getInt("count")+"</font>");
			dealy=rst3.getInt("count");
			delcount=delcount+dealy;
		}
		%>
		</td>
		<td> 
		<%
		String sqll="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+today+"' and a.TheDate > '"+sdays+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
		ResultSet rst33=st22.executeQuery(sqll);
		if(rst33.next())
		{
			out.print("<font color='red'>"+rst33.getInt("count")+"</font>");
			dealy1=rst33.getInt("count");
			delcount1=delcount1+dealy1;
		}
		%>
		</td>
		<td> 
			<%
			sqlsix="select count(distinct(VehicleRegNo)) as count from t_onlinedata where Transporter='"+transporter+"' and TheDate = '"+sdays+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
			ResultSet rst444=st2.executeQuery(sqlsix);
			//out.println(sqlsix);
			if(rst444.next())
			{
				sixdays=rst444.getInt("count");
				sixcount=sixcount+sixdays;
			} 
			out.print("<font color='red'>"+sixdays+"</font>");
			%>
			</td>
		<td> 
		<%
		sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+sdays+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
		ResultSet rst4=st2.executeQuery(sql);
		//out.println(sql);
		if(rst4.next())
		{
			disconnected=rst4.getInt("count");
			discount=discount+disconnected;
		} 
		out.print("<font color='red'>"+disconnected+"</font>");
		%>
		</td>
		<td><div align="right">
		<%
			sql="select * from t_vehicledetails where ownername='"+transporter+"' and status='Removed' and VehicleCode in "+Svehlist+" order by VehicleCode";
			ResultSet rstrem=st2.executeQuery(sql);
			//out.println(sql);
			while(rstrem.next())
			{
			remcnt++;
			}
			if(remcnt >0)
			{
				out.print("<font color='red'>"+remcnt+"</font>");
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
			//out.println(sql);
			while(rstdeact.next())
			{
				deactreqcnt++;
			}
			if(deactreqcnt >0)
			{
				out.print("<font color='red'>"+deactreqcnt+"</font>");
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
		notactive=total-updated-dealy-dealy1-sixdays-disconnected-remcnt-nogpscnt-deactreqcnt;
		notacount=notacount+notactive;
		out.print("<font color='red'>"+notactive+"</font>");
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
		<td> <%=missing%> </td>
<%	}
	else
	{ %>
		<td> <%=missing%> </td>
<%	} %>
		<td><div align="right">
		<%
		sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and (Status in ('Allocated','Attended'))";		
		ResultSet rst6=st1.executeQuery(sql);
		if(rst6.next())
		{
			allocated=rst6.getInt("count");
			compalltot=compalltot+allocated;
			if(allocated >0)
			{
				out.print(allocated);
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
		ResultSet rst5=st1.executeQuery(sql);
		if(rst5.next())
		{
			unallocated=rst5.getInt("count");
			unallocatedall=unallocatedall+unallocated;
			
			if(unallocated >0)
			{
			%>
			<%=unallocated%>			
			<%
			}
			else
			{
			out.print(unallocated);
			}
		}
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
		</div>
		</td>
		</tr>

		<%
		i++;
		
		
				
				
			}
			
			
			
		}else{
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
		dealy1=0;
		disconnected=0;
		notactive=0;
		Svehlist="(0";
		unallocated=0;
		int disconcnt=0, remcnt=0, deactreqcnt=0, inactive=0, missing=0, allocated=0, callcounttrans=0, callcounttemp=0;
				
		%>
		<td><%=i%> </td>
		<%
if(transporter.equals("Topsline") || transporter.equals("HPCL") || transporter.equals("Ujjain") )
		{
			String us=username.toUpperCase();
			sql="select * from t_onlinedataotherservers where Transporter like '"+transporter+"' order by TheDate desc";
			ResultSet rst1=st2.executeQuery(sql);
			while(rst1.next())
			{
				Svehlist=Svehlist+","+rst1.getString("VehicleCode");
				total ++;
			}
			instcount=instcount+total;
			Svehlist=Svehlist+")";
			%>
			<td><%=transporter%>"></td>
			<td><%=total%></td>
			<td>
			<%
			sql="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate ='"+tdydate+"' and VehicleCode in "+Svehlist+" order by TheDate Desc";	
			ResultSet rst2=st2.executeQuery(sql);
			if(rst2.next())
			{
				out.print("<font color='red'>"+rst2.getInt("count")+"</font>");
				
				updated=rst2.getInt("count");
				currcount=currcount+updated;
			}
			%> 
			</td>
			<td>
			<%
			sql="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where transporter='"+transporter+"' and VehicleCode in "+Svehlist+" and Status not in('Deleted','Removed', 'DeActivated') and Location like 'No GPS %' ";	
			ResultSet rstnogps=st2.executeQuery(sql);
			if(rstnogps.next())
			{
				out.print("<font color='red'>"+rstnogps.getInt("count")+"</font>");
				nogpscnt=rstnogps.getInt("count");
				nogpscnttot=nogpscnttot+nogpscnt;
			}
			%>  
			</td>
			<td>
			<%
			sql="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate < '"+tdydate+"' and TheDate > '"+today3+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
			ResultSet rst3=st2.executeQuery(sql);
			if(rst3.next())
			{
				out.print("<font color='red'>"+rst3.getInt("count")+"</font>");
				dealy=rst3.getInt("count");
				delcount=delcount+dealy;
			}
			%>
			</td>
			<td> 
			<%
			String sqll="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate < '"+today+"' and TheDate > '"+sdays+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
			ResultSet rst33=st22.executeQuery(sqll);
			if(rst33.next())
			{
				out.print("<font color='red'>"+rst33.getInt("count")+"</font>");
				dealy1=rst33.getInt("count");
				delcount1=delcount1+dealy1;
			}
			%>
			</td>
			<td> 
			<%
			sqlsix="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate = '"+sdays+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
			
			ResultSet rst444=st444.executeQuery(sqlsix);
			if(rst444.next())
			{
				sixdays=rst444.getInt("count");
				sixcount=sixcount+sixdays;
			} 
			out.print("<font color='red'>"+sixdays+"</font>");
			%>
			</td>
			<td> 
			<%
			sql="select count(distinct(VehicleRegNo)) as count from t_onlinedataotherservers where Transporter='"+transporter+"' and TheDate < '"+sdays+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
			ResultSet rst4=st2.executeQuery(sql);
			if(rst4.next())
			{
				disconnected=rst4.getInt("count");
				discount=discount+disconnected;
			} 
			
			out.print("<font color='red'>"+disconnected+"</font>");
			%>
			</td>
			<td><div align="right">
			<%
				sql="select * from t_onlinedataotherservers where Transporter='"+transporter+"' and status='Removed' and VehicleCode in "+Svehlist+" ";
				ResultSet rstrem=st2.executeQuery(sql);
				while(rstrem.next())
				{
				remcnt++;
				}
				if(remcnt >0)
				{
					out.print("<font color='red'>"+remcnt+"</font>");
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
				sql="select * from t_onlinedataotherservers where Transporter='"+transporter+"' and status='DeActivated' and VehicleCode in "+Svehlist+" ";
				ResultSet rstdeact=st2.executeQuery(sql);
				while(rstdeact.next())
				{
					deactreqcnt++;
				}
				if(deactreqcnt >0)
				{
					out.print("<font color='red'>"+deactreqcnt+"</font>");
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
			notactive=total-updated-dealy-dealy1-sixdays-disconnected-remcnt-nogpscnt-deactreqcnt;
			notacount=notacount+notactive;
			out.print("<font color='red'>"+notactive+"</font>");
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
			sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and (Status in ('Allocated','Attended')) and VehAvaildate >= '"+tdydate+"'";		
			ResultSet rst6=st1.executeQuery(sql);
			if(rst6.next())
			{
				allocated=rst6.getInt("count");
				compalltot=compalltot+allocated;
				if(allocated >0)
				{
					out.print(allocated);
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
			sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and (Status in ('Allocated','Attended')) and VehAvaildate < '"+tdydate+"'";		
			ResultSet rst5=st1.executeQuery(sql);
			if(rst5.next())
			{
				unallocated=rst5.getInt("count");
				unallocatedall=unallocatedall+unallocated;
				
				if(unallocated >0)
				{
				%>
				<%=unallocated%>			
				<%
				}
				else
				{
				out.print(unallocated);
				}
			}
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
			</div>
			</td>
			</tr>
			<%
			i++;
			
		}
		else
		{
					
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
			while(rst1.next())
			{
				Svehlist=Svehlist+","+rst1.getString("VehicleCode");
				total ++;
			}
			instcount=instcount+total;
			Svehlist=Svehlist+")";
			%>
			<td><%=transporter%>"</td>
			<td><%=total%></font></a></div>
			</td>
			<td>
			<%
			sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate ='"+tdydate+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status ='-' and a.Location not like 'No GPS %' order by a.VehicleCode";	
			ResultSet rst2=st2.executeQuery(sql);
			if(rst2.next())
			{
				out.print("<font color='red'>"+rst2.getInt("count")+"</font>");
				
				updated=rst2.getInt("count");
				currcount=currcount+updated;
			}
			%> 
			</td>
			<td>
			<%
			sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in('Deleted','Removed', 'DeActivated') and a.Location like 'No GPS %' order by a.VehicleCode";	
			ResultSet rstnogps=st2.executeQuery(sql);
			//out.println(sql);	
			if(rstnogps.next())
			{
				out.print("<font color='red'>"+rstnogps.getInt("count")+"</font>");
				nogpscnt=rstnogps.getInt("count");
				nogpscnttot=nogpscnttot+nogpscnt;
			}
			%>  
			</td>
			<td>
			<%
			sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+tdydate+"' and a.TheDate > '"+today3+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
			ResultSet rst3=st2.executeQuery(sql);
			if(rst3.next())
			{
				out.print("<font color='red'>"+rst3.getInt("count")+"</font>");
				dealy=rst3.getInt("count");
				delcount=delcount+dealy;
			}
			%>
			</td>
			<td> 
			<%
			String sqll="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+today+"' and a.TheDate > '"+sdays+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
			ResultSet rst33=st22.executeQuery(sqll);
			if(rst33.next())
			{
				out.print("<font color='red'>"+rst33.getInt("count")+"</font>");
				dealy1=rst33.getInt("count");
				delcount1=delcount1+dealy1;
			}
			%>
			</td>
			<td> 
				<%
				sqlsix="select count(distinct(VehicleRegNo)) as count from t_onlinedata where Transporter='"+transporter+"' and TheDate = '"+sdays+"' and VehicleCode in "+Svehlist+" and Status not in ('Removed', 'DeActivated') and Location not like 'No GPS %' ";
				ResultSet rst444=st2.executeQuery(sqlsix);
				//out.println(sqlsix);
				if(rst444.next())
				{
					sixdays=rst444.getInt("count");
					sixcount=sixcount+sixdays;
				} 
				out.print("<font color='red'>"+sixdays+"</font>");
				%>
				</td>
			<td> 
			<%
			sql="select count(distinct(a.vehiclecode)) as count from t_onlinedata a, t_vehicledetails b where a.Transporter='"+transporter+"' and a.TheDate < '"+sdays+"' and a.VehicleCode in "+Svehlist+" and a.VehicleCode= b.VehicleCode and b.status not in ('Removed', 'DeActivated') and a.Location not like 'No GPS %' order by a.VehicleCode";
			ResultSet rst4=st2.executeQuery(sql);
			//out.println(sql);
			if(rst4.next())
			{
				disconnected=rst4.getInt("count");
				discount=discount+disconnected;
			} 
			out.print("<font color='red'>"+disconnected+"</font>");
			%>
			</td>
			<td><div align="right">
			<%
				sql="select * from t_vehicledetails where ownername='"+transporter+"' and status='Removed' and VehicleCode in "+Svehlist+" order by VehicleCode";
				ResultSet rstrem=st2.executeQuery(sql);
				//out.println(sql);
				while(rstrem.next())
				{
				remcnt++;
				}
				if(remcnt >0)
				{
					out.print("<font color='red'>"+remcnt+"</font>");
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
				//out.println(sql);
				while(rstdeact.next())
				{
					deactreqcnt++;
				}
				if(deactreqcnt >0)
				{
					out.print("<font color='red'>"+deactreqcnt+"</font>");
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
			notactive=total-updated-dealy-dealy1-sixdays-disconnected-remcnt-nogpscnt-deactreqcnt;
			notacount=notacount+notactive;
			out.print("<font color='red'>"+notactive+"</font>");
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
			<td> <%=missing%> </td>
	<%	}
		else
		{ %>
			<td> <%=missing%> </td>
	<%	} %>
			<td><div align="right">
			<%
			sql="select count(*) as count from t_complaints1 where Customer='"+transporter+"' and (Status in ('Allocated','Attended'))";		
			ResultSet rst6=st1.executeQuery(sql);
			if(rst6.next())
			{
				allocated=rst6.getInt("count");
				compalltot=compalltot+allocated;
				if(allocated >0)
				{
					out.print(allocated);
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
			ResultSet rst5=st1.executeQuery(sql);
			if(rst5.next())
			{
				unallocated=rst5.getInt("count");
				unallocatedall=unallocatedall+unallocated;
				
				if(unallocated >0)
				{
				%>
				<%=unallocated%>			
				<%
				}
				else
				{
				out.print(unallocated);
				}
			}
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
			</div>
			</td>
			</tr>

			<%
			i++;
			
			
			
			
			
		
		}
		
	}
}
		%>
		</table>
		<p></p>
		<table width="750px" class="sortable">
		<tr>
			<td>Performance </td>
		</tr>
		<tr>
		<td><b>Installed</b></td>
		<td><b>Current</b></td>
		<td><b>No GPS</b></td>
		<td><b> 1 to 2 Days </b></td>
		<td><b> 3 to 5 Days </b></td>
		<td><b> 6 Days</b></td>
		<td><b>Disconnected </b></td>
		<td><b>Removed </b></td>
		<td><b>DeActivation Req </b></td>
		<td><b>In Active</b></td>
		<td><b>Missing </b></td>
		<td><b>Comp Allocated </b></td>
		<td><b>Comp UnAllocated </b></td>
		<td><b>Today's Calls(Transp)</b></td>
		<td><b>Today's Calls(Techs)</b></td>
		<td><b>Delay Percentage </b></td>
</tr>
<tr>
		<td >
			<% if(instcount>0)
				{ %>
					<%=instcount%> </a>
							
			<%	}
			else
			{%>
					<%=instcount%>
		<%	} %>
			
		</td>
		<td>
			<% if(currcount>0) 
				{  %>
					<%=currcount%> </a> 
			<%   } 
			else
			{		
			%>		
					<%=currcount%>
		<%   }
			%>					</td>
			
		<td>
		<%
			if(nogpscnttot>0)
			{%>
				 <%=nogpscnttot%> </a> 
		<% 	}
			else
			{ %>
				<%=nogpscnttot%>
		<%	}		
		%>	
		</td>
		
		<td>
		<%
			if(delcount>0)
			{ %>
		 		 <%=delcount%> </a> 
	<%		}
			else
			{ %>
				<%=delcount%>	
		<%	}
		%>
		</td>
		<td>
		
		<%
		if(delcount1>0)
		{ %>
	 		 <%=delcount1%> </a> 
<%		}
		else
		{ %>
			<%=delcount1%>	
	<%	}
	%>
	 </td>
	 <td>
		<%
			if(sixcount>0)
			{ %>
		 <%=sixcount%> </a> 
		<%	}
			else
			{ %>
				<%=sixcount%>
		<%	}
		%>
		 </td>
	<td>
		<%
			if(discount>0)
			{ %>
		<%=discount%> </a> 
		<%	}
			else
			{ %>
				<%=discount%>
		<%	}
		%>
		 </td>
		<td>
		<%
			if(removedcnt>0)
			{ %>
				   <%=removedcnt%> </a> 
		<%	}
			else
			{ %>
				<%=removedcnt%>	
		<%	}
		%>
		</td>
		<td>
		<%
			if(deativatedreqtotcnt>0)
			{ %>
		 	 <%=deativatedreqtotcnt%> </a> 
		<%	}
			else
			{ %>
					<%=deativatedreqtotcnt%>
		<%	}
		%>
		</td>
		
		<td>
		<%
			if(notacount>0)
			{ %>
		<%=notacount%>  
		<%	}
			else
			{ %>
				<%=notacount%>			
		<%	}
		%>
		</td>
		<td>
		<%
			if(missingtot>0)
			{ %>
				 <%=missingtot %>
		<%	}
			else
			{ %>
				<%=missingtot %>			
		<% 	}
		%>
		 </td>
		<td>
		<%
			if(compalltot>0)
			{ %>
			 <%=compalltot %>
		<%	}
			else
			{ %>
					<%=compalltot %>				
		<%	}
		%>
		 </td>
		<td>
		<%
			if(unallocatedall>0)
			{ %>
			  <%=unallocatedall %> 
		<%	}
			else
			{ %>
				<%=unallocatedall %>									
		<%	}
		%>
		 </td>
		<td>
		<%
			if(callcounttot>0)
			{ %>
			 <%=callcounttot %>	
		<%	}
			else
			{ %>
					<%=callcounttot %>	
		<%	}
		%>
		</td>
		<td>
		<%
			if(callcounttecttot>0)
			{ %>
			<%=callcounttecttot %>
		<%	}
			else
			{ %>
					<%=callcounttecttot %>	
		<%	}
		%>
		</td>
		
		<td><% double pp=(notacount+sixcount+discount+delcount+delcount1)*100;
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
		%></td>
</tr>
		
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
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>