<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate;
int Ocount,Icount,CAcount,CScount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
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
CScount=0;
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
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
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
				</td>
				<td><input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromdate%>" readonly/>
             <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
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
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
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
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Comp. Solved</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					<td>Special Report</td>
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					while(rst.next())
					{
					%>
					<tr>
					<td><div align="right"><%=i%></div></td>
					<td><%=rst.getString("TechName")%></td>
					<td><div align="right"><%=rst.getString("MobNo")%></div></td>
					<td><div align="right">
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst1=st1.executeQuery(sql);	
					if(rst1.next())
					{
					if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst2=st1.executeQuery(sql);	
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>	
					</div>					
					</td>
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
					ResultSet rst3=st1.executeQuery(sql);	
					if(rst3.next())
					{
					if(rst3.getInt("count") >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst3.getString("count")+"</a>");
					CAcount=CAcount+rst3.getInt("count");
					}
					else
					{
					out.print(rst3.getString("count"));
					}
					}				
					%>	
					</div>				
					</td>
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Solved'";
					ResultSet rst4=st1.executeQuery(sql);	
					if(rst4.next())
					{
					if(rst4.getInt("count") >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst4.getString("count")+"</a>");
					CScount=CScount+rst4.getInt("count");
					}
					else
					{
					out.print(rst4.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and 103.241.181.36='Rep'";
					ResultSet rst5=st2.executeQuery(sql);	
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
					<td>
					<div align="right">
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and 103.241.181.36='New'";
					ResultSet rst6=st2.executeQuery(sql);	
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>		
					</div>				
					</td>	
					<td>
					<%					
					sql="select count(*) as count from t_specialreports where Technician='"+rst.getString("TechName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
					ResultSet rst7=st1.executeQuery(sql);
					if(rst7.next())
					{
						if(rst7.getInt("count")>0)
						{
						out.print("<div align='right'><a href='viewspecialreport.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst7.getInt("count")+"</a></div>");
						SPcount=SPcount+rst7.getInt("count");
						}
						else
						{
							out.print("<div align='right'>0</div>");
						}
					}
					%>
					</td>				
					</tr>
					<%	
					i++;		
					}				
					%>		
					</table>
					<table border="1" width="750px" align="center" class="sortable">
					<tr>
					<td><font color="red"><b>Total</b></font></td>
					<td><font color="red"><b><div align="right"><a href="techoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=Ocount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="techincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=Icount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="techcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CAcount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="techcompsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CScount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="techunitrep.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=URcount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="technewinstall.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=NIcount%></a></div></b></font></td>
					<td><font color="red"><b><div align="right"><a href="techspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=SPcount%></a></div></b></font></td>
										
					</tr>					
					</table>	
					<%
					}
					else
					{
					%>
					<div align="center"><font color="brown" size="2">Representative  Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Name</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Not Called</td>
					<td>Comp. Allocated</td>
					</tr>				
					<%
					sql="select * from t_admin where URole='service'";
					ResultSet rst7=st.executeQuery(sql);
					int i=1;
					while(rst7.next())
					{
					%>
					<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<td width="20%"><%=rst7.getString("Name")%></td>
						<td width="25%"><div align="right">
						<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
						ResultSet rst8=st1.executeQuery(sql);	
						if(rst8.next())
						{
						if(rst8.getInt("count") >0)
						{
								out.print("<a href='repoutgoing.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count")+"</a>");
								OCcount=OCcount+rst8.getInt("count");						
						}
						else
						{
								out.print(rst8.getString("count"));
						}
						}				
						%>	
						</div>						
						</td>
						<td width="25%"><div align="right">
						<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
						ResultSet rst9=st1.executeQuery(sql);	
						if(rst9.next())
						{
						if(rst9.getInt("count") >0)
						{
								out.print("<a href='repincoming.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst9.getString("count")+"</a>");
								ICcount=ICcount+rst9.getInt("count");						
						}
						else
						{
								out.print(rst9.getString("count"));
						}
						}				
						%>	
						</div>						
						</td>

		<td width="25%"><div align="right">
			<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='NotCalled'";
						ResultSet rst11=st1.executeQuery(sql);	
						if(rst11.next())
						{
						if(rst11.getInt("count") >0)
						{
								out.print("<a href='repnotcalled.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst11.getString("count")+"</a>");
								NCcount=NCcount+rst11.getInt("count");						
						}
						else
						{
								out.print(rst11.getString("count"));
						}
						}				
						%>
		</div>
		</td>	

						<td width="25%"><div align="right">
						<%
						sql="select count(*) as count from t_callocation1 where  DOfAllocation >='"+fromdate+"' and DOfAllocation <='"+todate+"' and Tno in(select Tno from t_complaints1 where RegBy='"+rst7.getString("Name")+"')";
						ResultSet rst10=st1.executeQuery(sql);	
						if(rst10.next())
						{
						if(rst10.getInt("count") >0)
						{
								out.print("<a href='repcallocated.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst10.getString("count")+"</a>");
								RCAcount=RCAcount+rst10.getInt("count");						
						}
						else
						{
								out.print(rst10.getString("count"));
						}
						}				
						%>
						</div>							
						</td>
					</tr>				
					<%
					i++;
					}			
					%>
					</table>	
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
					<td width="25%"><font color="red"><b>Total</b></font></td>
					<td width="22%"><font color="red"><b><div align="right"><a href="viewoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=OCcount%></a></div></b></font></td>
					<td width="22%"><font color="red"><b><div align="right"> <a href="viewincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"> <%=ICcount%></a></div></b></font></td>
					<td width="22%"><font color="red"><b><div align="right"> <a href="viewnotcalled.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"> <%=NCcount%></a></div></b></font></td>
					<td width="22%"><font color="red"><b><div align="right"><a href="viewcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"> <%=RCAcount%></a></div></b></font></td>
										
					</tr>					
					</table>
					<%
					}
					}
					else
					{
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Comp. Solved</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					while(rst.next())
					{
					%>
					<tr>
					<td><%=i%></td>
					<td><%=rst.getString("TechName")%></td>
					<td><%=rst.getString("MobNo")%></td>
					<td>
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst1=st1.executeQuery(sql);	
					if(rst1.next())
					{
					if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					}				
					%>					
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst2=st1.executeQuery(sql);	
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>						
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
					ResultSet rst3=st1.executeQuery(sql);	
					if(rst3.next())
					{
					if(rst3.getInt("count") >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst3.getString("count")+"</a>");
					CAcount=CAcount+rst3.getInt("count");
					}
					else
					{
					out.print(rst3.getString("count"));
					}
					}				
					%>					
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Solved'";
					ResultSet rst4=st1.executeQuery(sql);	
					if(rst4.next())
					{
					if(rst4.getInt("count") >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst4.getString("count")+"</a>");
					CScount=CScount+rst4.getInt("count");
					}
					else
					{
					out.print(rst4.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and 103.241.181.36='Rep'";
					ResultSet rst5=st2.executeQuery(sql);	
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and 103.241.181.36='New'";
					ResultSet rst6=st2.executeQuery(sql);	
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>						
					</td>	
									
					</tr>
					<%	
					i++;		
					}				
					%>		
					</table>
					<table border="1" width="750px" align="center" class="sortable">
					<tr>
					<td><font color="red"><b>Total</b></font></td>
					<td><font color="red"><b><%=Ocount%></b></font></td>
					<td><font color="red"><b><%=Icount%></b></font></td>
					<td><font color="red"><b><%=CAcount%></b></font></td>
					<td><font color="red"><b><%=CScount%></b></font></td>
					<td><font color="red"><b><%=URcount%></b></font></td>
					<td><font color="red"><b><%=NIcount%></b></font></td>
					
					</tr>					
					</table>	
					<%
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
