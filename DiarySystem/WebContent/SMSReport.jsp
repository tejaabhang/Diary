<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st33,st4,st5,st6,st7,st8,st9,st10,st11,st51,st12,st13,st14,st15;
String sql,sql1,sql2,today,olddate,username,userrole,thename,sql3,sql33,sql4,sql5,sql6,sql7,sql8,sql9,sql10;
String fromdate,todate;
int Ocount,Icount,CAcount,CAvcount=0,CScount,CPcount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
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
	function fun2()
	{	
		document.form1.submit();
	}	
	</script>
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
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
Ocount=0;
Icount=0;
CAcount=0;
CAvcount=0;
CScount=0;
CPcount=0;
URcount=0;
NIcount=0;
OCcount=0;
ICcount=0;
NCcount=0;
RCAcount=0;
SPcount=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st12= conn.createStatement();
	st13= conn.createStatement();
	st14 = conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st33=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn.createStatement();
	//st6=conn.createStatement();
	//st7=conn.createStatement();
	//st8=conn.createStatement();
	st9=conn1.createStatement();
	st10=conn.createStatement();
	st11=conn.createStatement();
	st15=conn1.createStatement();
	//st51=conn.createStatement();
	//st51=conn.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	thename=request.getParameter("radio1");
	if(null==fromdate)
	{
	fromdate=today;
	todate=today;
	thename="Technician";
	}
	%>
			<table border="0" width="750px" align="center">
				<tr>
				<td>
				<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" value="Technician" <% if(thename.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun2();" >Technician
				<input type="radio" name="radio1" value="Representative" <% if(thename.equals("Representative")) { out.print("CHECKED"); } %> onclick="fun2();">Representative
				<input type="radio" name="radio1" value="Transporter" <% if(thename.equals("Transporter")) { out.print("CHECKED"); } %> onclick="fun2();">Transporter				
								
				</td>
				<td><input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromdate%>" readonly/>
             <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",     // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=todate%>" readonly/>
             <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",    // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"      // ID of the button
             }
                           );
             </script></td>
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="dailyreport1excel.jsp?thename=<%=thename%>&calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				</tr>
				</table>	
				</form>	
						
				</td>
				</tr>
				<tr>		
				<td>
				<%
					
					if(!(null==thename))
					{
					if(thename.equals("Technician"))
					{
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<tr>
					<th>Sr.</th>
					<th>Technician Name</th>
					<th>Number of SMS Send</th>
					<th>Vehicles attended</th>
					</tr>			
					<%
					String myfromdate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
					String mytodate = new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
				
					int total_sms_send =0;
					int total_veh_attended =0;
					int i=1;
					String techsql = "select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";
					
					ResultSet rs_tech = st10.executeQuery(techsql);
					while(rs_tech.next())
					{
						
						%>
						<tr>
						<td><%= i++ %></td>
						<td><%= rs_tech.getString("TechName") %></td>
						<% 
						
						////System.out.println("techname------>" +  rs_tech.getString("TechName"));
						String sql = "select count(TechName) as count from t_ComplaintAllocationSMS WHERE Complaint_date BETWEEN '"+ myfromdate + "' AND '"+ mytodate +"' and TechName like '"+rs_tech.getString("TechName") +"'";
						////System.out.println("sql------>" +  sql);
						ResultSet rst=st.executeQuery(sql);
						
						if(rst.next())
						{								
							String sql2 = "select Tno from t_ComplaintAllocationSMS where TechName='"+rs_tech.getString("TechName")+"' and Complaint_date BETWEEN '"+ myfromdate + "' AND '" + mytodate  + "'";
							////System.out.println("sql2--->" + sql2);
							int status_count =0;
							ResultSet rst2=st12.executeQuery(sql2);
							while (rst2.next())
							{
								int tno = rst2.getInt("Tno");
								String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
								////System.out.println("sql3---->" + sql3);
								ResultSet rst3=st13.executeQuery(sql3);
					
								while (rst3.next())
								{
									////System.out.println("status_count--->" + status_count);
									status_count = status_count+1;
								}
							
							} %>
							<td><a href="Technician_Detail.jsp?tech_name=<%=rs_tech.getString("TechName")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= rst.getString("Count") %></a></td>
							<td align="center"><a href="Attended_Vehicle_details_Tech.jsp?tech_name=<%=rs_tech.getString("TechName")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= status_count %></a></td></tr>
						</tr>
						<% 
						total_veh_attended =total_veh_attended+ status_count;
						total_sms_send = total_sms_send+ Integer.parseInt(rst.getString("Count"));
						}
						else
						{
							%>
								<td><%= rst.getString("Count") %></td>
								<td align="center"><%= 0 %></td></tr>
							
							<% 
						}
					}
					////System.out.println("total_sms_send------>" + total_sms_send);
					%>
					<tr>
					
					<td colspan="2" align="left"> Total </td>
					<td><a href="TotalSMSSend.jsp?Type=Technician&total_sms_send=total_sms_send&date1=<%= fromdate%>&date2=<%= todate%>"><%= total_sms_send %></a></td>			
					<td><a href="TotalSMSSend.jsp?Type=Technician&total_sms_send=total_veh_attended&date1=<%=fromdate%>&date2=<%= todate%>"><%= total_veh_attended %></a></td>		
					<td></td>
							</tr>	
					</table>	
					<%		
					
					////System.out.println("total_sms_send---->" + total_sms_send);
					}		
					else
					if(thename.equals("Representative"))
					{
					%>
					<div align="center"><font color="brown" size="2">Representative  Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<tr>
					<th>Sr.</th>
					<th>Representative name</th>
					<th>Number of SMS Sent </th>
					<th>Vehicles attended</th>
					</tr>				
					<%
					String myfromdate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
					String mytodate = new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
					int i=1;
					int total_sms_send =0;
					int total_veh_attended =0;
					String techsql = "select Distinct(Name) as name from t_admin where URole='service'";
					ResultSet rs_tech = st14.executeQuery(techsql);
					String tech;
					while(rs_tech.next())
					{
					%>
						<tr>
						<td><%= i++ %></td>			
						<td><%= rs_tech.getString("Name") %></td>
					<% 
					sql="SELECT AllotedBy AS Representative, count( AllotedBy ) AS count FROM `t_ComplaintAllocationSMS` WHERE Complaint_date BETWEEN '" + myfromdate + "' AND '" + mytodate + "' and Trim(AllotedBy) like Trim('"+ rs_tech.getString("Name") +"')";
			//		//System.out.println("sql---->" + sql);
					ResultSet rst7=st.executeQuery(sql);	
					if(rst7.next())
					{
						if(rst7.getString("Representative") != null)
						{
						int status_count =0;
					
						String sql2 = "select Distinct(Tno) from t_ComplaintAllocationSMS where Complaint_date BETWEEN '"+ myfromdate + "' AND '"+ mytodate +"' and AllotedBy='"+rst7.getString("Representative")+"'";
				//		//System.out.println("sql2--->" + sql2);
						
						ResultSet rst2=st12.executeQuery(sql2);
						while (rst2.next())
						{
							int tno = rst2.getInt("Tno");		
							String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
					//		//System.out.println("sql3-->" + sql3);
							ResultSet rst3=st13.executeQuery(sql3);
								
							while (rst3.next())
							{
								status_count = status_count+1;
							}
						} 
						%>
						<td><a href="Representative_Detail.jsp?representative=<%=rst7.getString("Representative")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= rst7.getString("count") %></a></td>
						<td><a href="Attended_Vehicle_details_Repre.jsp?representative=<%=rst7.getString("Representative")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= status_count %></a></td>
						</tr>
						<% 
							total_veh_attended =total_veh_attended+ status_count;
							total_sms_send = total_sms_send+ Integer.parseInt(rst7.getString("Count"));
					}
						else
						{
						//	//System.out.println("i am in else");
						%>
							<td><%= rst7.getString("Count") %></td>
							<td align="center"><%= 0 %></td>
							</tr>
						
						<% 	
						}
					}
				
					
					}
					
					%>
					<tr>
					
					<td colspan="2" align="left"> Total </td>
					<td><a href="TotalSMSSend.jsp?Type=Representative&total_sms_send=total_sms_send&date1=<%= fromdate%>&date2=<%= todate%>"><%= total_sms_send %></a></td>			
					<td><a href="TotalSMSSend.jsp?Type=Representative&total_sms_send=total_veh_attended&date1=<%=fromdate%>&date2=<%= todate%>"><%= total_veh_attended %></a></td>		
					</tr>
					</table>	
					
					<%
					}
						else
		//					if(thename.equals("Transporter"))
						
						if(thename.equals("Transporter"))
						{
							%>
							
							<div align="center"><font color="brown" size="2">Transporter Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
							<table border="1" width="100%" class="sortable">
							<th>Sr.</th>
							<th>Transporter name </th>
							<th>Number of SMS sent</th>
							<th>Vehicles attended</th>
							</tr>
							
							<% 
							String myfromdate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate));
							String mytodate = new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate));
							int i=1;
							int total_sms_send =0;
							int total_veh_attended =0;
							String techsql = "SELECT DISTINCT (Ownername) as Ownername FROM db_gps.t_vehicledetails WHERE Ownername NOT LIKE '% del' order by Ownername";
							ResultSet rs_tech = st15.executeQuery(techsql);
							while(rs_tech.next())
							{
						
						
							sql="SELECT Transporter, count(Transporter) AS count FROM `t_ComplaintAllocationSMS` WHERE Complaint_date BETWEEN '" + myfromdate + "' AND '" + mytodate + "' and Transporter like '"+ rs_tech.getString("Ownername")+"'";
							////System.out.println("sql--->" + sql);
							ResultSet rst7=st.executeQuery(sql);	
							
							if(rst7.next())
							{	
							%>
								<tr>
								<td><%= i++ %></td>
								<td><%= rs_tech.getString("Ownername") %></td>
								
								<% 
								String sql2 = "select Tno from t_ComplaintAllocationSMS where Complaint_date BETWEEN '" + myfromdate + "' AND '" + mytodate + "' and  Transporter='"+rs_tech.getString("Ownername") +"'";
								////System.out.println("sql2--->" + sql2);
								int status_count =0;
								ResultSet rst2=st12.executeQuery(sql2);
								while (rst2.next())
								{
									int tno = rst2.getInt("Tno");
									////System.out.println("tno---->" + tno);
							
									String sql3 = "select status from t_complaints1 where Tno = "+ tno + " and (status like 'Attended' or status like 'Solved')";
							
									////System.out.println("sql3--->" +  sql3);
									ResultSet rst3=st13.executeQuery(sql3);
								
								while (rst3.next())
								{
									status_count = status_count+1;
								}
								////System.out.println("status_count--->" + status_count);
							
							} %>
						<td><a href="Transporter_Detail.jsp?transporter=<%=rst7.getString("Transporter")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= rst7.getString("count") %></a></td>
						<td><a href="Attended_Vehicles_details_Tran.jsp?transporter=<%=rst7.getString("Transporter")%>&date1=<%= fromdate%>&date2=<%= todate%>"><%= status_count %></a></td>
						</tr>
						<% 
						
									total_veh_attended =total_veh_attended+ status_count;
									total_sms_send = total_sms_send+ Integer.parseInt(rst7.getString("Count"));
								}	
							}
								%>
								<tr>
					
					<td colspan="2" align="left"> Total </td>
					<td><a href="TotalSMSSend.jsp?Type=Transporter&total_sms_send=total_sms_send&date1=<%= fromdate%>&date2=<%= todate%>"><%= total_sms_send %></a></td>			
					<td><a href="TotalSMSSend.jsp?Type=Transporter&total_sms_send=total_veh_attended&date1=<%=fromdate%>&date2=<%= todate%>"><%= total_veh_attended %></a></td>		
					</tr>		
								</table>
					<%
					}
				}
				
				%>
							
				</td>
				</tr>
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
