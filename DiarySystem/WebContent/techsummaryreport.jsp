<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1;
String sql,sql1,today,olddate,username,userrole,fromdate,todate;
int CAcount,CScount,COcount,SRcount,CAcount1,CScount1,COcount1,SRcount1;
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
         <%@ include file="header1.jsp" %>
          </div>
                   
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
CAcount=0;
CScount=0;
COcount=0;
SRcount=0;
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds -7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
fromdate=olddate;
todate=today;
if(!(null==request.getParameter("calender")))
{
	fromdate=request.getParameter("calender");
todate=request.getParameter("calender1");
}
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	%>
	<table border="0" width="750px" align="center">
	<tr><td>
	<table border="0" width="750px" align="center">
				<tr>
				<td>
				<form name="form1" id="form1" action="" method="post">
				<table border="1" width="50%" align="right">
				<tr>
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
	</td></tr>
	<tr>
	<td align="center"><font color="brown" size="2"><i><u>Technician's Summary Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </u></i></font></td>
	</tr>	
	<tr><td>
	<table border="1" class="sortable" width="750px">
	<tr>
	<td><font color="brown">Sr.</font></td>
	<td><font color="brown">Tech. Name</font></td>
	<td><font color="brown">Mobile </font></td>
	<td><font color="brown">Location</font></td>
	<td><font color="brown">Comp. Allocated</font></td>
	<!-- <td><font color="brown">Comp. Attended</font></td> --> 
	<td><font color="brown">Comp. Solve</font></td>
	<td><font color="brown">Comp. Over-Due</font></td>
	<!-- <td><font color="brown">Comp. Pending</font></td> -->
	<td><font color="brown">Special Report</font></td>
	</tr>	
	<%
	sql="select Distinct(TechName) as TechName, MobNo from t_techlist where Available='Yes'";
	ResultSet rst=st.executeQuery(sql);
	int i=1;
	while(rst.next())
	{
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst.getString("TechName") %></td>
	<td><%=rst.getString("MobNo") %></td>
	<td>
	<%
		sql="select Distinct(Location) as loc from t_techlist where TechName='"+rst.getString("TechName")+"'";
		ResultSet rst2=st1.executeQuery(sql);
		String loc="";
		while(rst2.next())
		{
		loc=loc+rst2.getString("loc")+" ,";
		}	
		out.print(loc.substring(0,loc.length()-1));
	%>	
	</td>
	<td><div align="right">
	<%
		sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"'and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
			if(rst1.getInt("count") >0)
			{
				%><a href="callocated.jsp?tech=<%=rst.getString("TechName")%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><%=rst1.getInt("count")%></a><%
				CAcount=CAcount+rst1.getInt("count");			
			}
			else
			{
				out.print(rst1.getInt("count"));
			}
		}	
	%>	
	</div>
	</td>
	<!-- <td></td> --> 
	<td><div align="right">
	<%
		sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and Status='Solved' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
		ResultSet rst3=st1.executeQuery(sql); 	
		if(rst3.next())
		{
			if(rst3.getInt("count") >0)
			{
				%><a href="csolved.jsp?tech=<%=rst.getString("TechName")%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><%=rst3.getInt("count")%></a><%
				CScount=CScount+rst3.getInt("count");			
			}
			else
			{
				out.print(rst3.getInt("count"));
			}
		}	
	%>		</div>
	</td>
	<td><div align="right">
	<%
		sql="select count(*) as count from t_complaints1 where VehAvailDate < '"+today+"' and Tno in(select Tno from t_callocation1 where Status='UnSolved' and Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"')";
		ResultSet rst4=st1.executeQuery(sql);
		if(rst4.next())
		{
			if(rst4.getInt("count") >0)
			{
				%><a href="compoverdue.jsp?tech=<%=rst.getString("TechName")%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><%=rst4.getInt("count")%></a><%
				COcount=COcount+rst4.getInt("count");	
			}
			else
			{
				out.print(rst4.getInt("count"));
			}
		}	
	%>		</div>
	</td>
	<!--
	<td><div align="right">
	<%
		sql="select count(*) as count from t_complaints1 where VehAvailDate >= '"+today+"' and Tno in(select Tno from t_callocation1 where Status='UnSolved' and Technicion='"+rst.getString("TechName")+"')";
		ResultSet rst5=st1.executeQuery(sql);
		if(rst5.next())
		{
			if(rst5.getInt("count") >0)
			{
				%><a href="comppending.jsp?tech=<%=rst.getString("TechName")%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><%=rst5.getInt("count")%></a><%
			}
			else
			{
				out.print(rst5.getInt("count"));
			}
		}	
	%>	</div>	
	</td>
	-->
	<td><div align="right">
	<%
	sql="select count(*) as count from t_specialreports where Technician='"+rst.getString("TechName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
	ResultSet rst6=st1.executeQuery(sql);
		if(rst6.next())
		{
			if(rst6.getInt("count") >0)
			{
				%><a href="viewspecialreport.jsp?tech=<%=rst.getString("TechName")%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><%=rst6.getInt("count")%></a><%
				SRcount=SRcount+rst6.getInt("count");	
			}
			else
			{
				out.print(rst6.getInt("count"));
			}
		}	
	%>	</div>
	</td>
	</tr>	
	<%
	i++;
	}	
	
	%>
	</table>	
	</td></tr>
	<tr><td>
		<table border="1" width="100%" align="center" class="stats">
		<tr>
		<td width="385px"><b>Total</b></td>
		<td width="85px"><b><div align="right"><%=CAcount%></div></b></td>
		<td width="65px"><b><div align="right"><%=CScount%></div></b></td>
		<td width="90px"><b><div align="right"><%=COcount%></div></b></td>
		<td><b><div align="right"><%=SRcount%></div></b></td>
		</tr>		
		</table>	
	</td></tr>
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
