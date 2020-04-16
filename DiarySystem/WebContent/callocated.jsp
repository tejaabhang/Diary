<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,caller;
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
caller=request.getParameter("tech");
fromdate=request.getParameter("fromdate");
todate=request.getParameter("todate");
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	
	thename=request.getParameter("radio1");
	if(null==thename)
	{
	
	thename="ALL";
	}
	
	
	%>
	
	<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" value="ALL" <% if(thename.equals("ALL")) { out.print("CHECKED"); } %> onclick="fun2();" >ALL
				<input type="radio" name="radio1" value="Distinct" <% if(thename.equals("Distinct")) { out.print("CHECKED"); } %> onclick="fun2();">Distinct
								
								
				</td>
				
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="callocatedexcel.jsp?thename=<%=thename %>&tech=<%=caller %>&fromdate=<%=fromdate %>&todate=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
			
				</tr>
								
				</table>	
				</form>	
	<%
if(!(null==thename))
{
	if(thename.equals("ALL"))
	{ %>	
		
	
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Complaints Allocated to <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Comp. Allocated Date</b></td>
	<td><b>Veh. Available Date</b></td>
	<td><b>Status</b></td>
	<td><b>Technicion</b></td>
	<td><b>Transporter</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Comp Descr.</b></td>
	<td><b>Alloc By</b></td>
	</tr>
	<%
		sql="select * from t_callocation1 where Technicion='"+caller+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  )  ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td><%=i%></td>
	<td><%=rst.getString("Tno")%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvailDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=rst.getString("Status") %></font></td>
	<td><font color=''><%=rst.getString("Technicion") %></font></td>
	
	<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>
	<td><%=rst1.getString("Customer")%></td>
	
	<td><%=rst.getString("VehRegNo")%></td>
	<%		sql="select * from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate <'"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color=""><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("TheDate")) %><br><%=rst11.getString("TheTime") %></font></td>
				
				<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst11.getDouble("LatitudePosition") %>&long=<%=rst11.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst11.getString("Location") %> </font> </b> </a> </td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
	
	
	
	<td><%=rst1.getString("Complaint")%></td>
	<td><%=rst1.getString("RegBy")%></td>
	<%
		}
		else
		{
		%>
	<td>--</td>
	<td>--</td>
	<%
		}	
	%>
	</tr>		
		<%
		i++;
		}	
	}
	else
	{
		%>
		<table border="0" width="750px" align="center">
		<tr><td align="center"><font color="brown" size="2">Complaints Allocated to <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
		<tr><td>
		<table border="1" width="100%" align="center" class="sortable">
		<tr>
		<td><b>Sr.</b></td>
		<td><b>Tiket.No</b></td>
		<td><b>Comp. Allocated Date</b></td>
		<td><b>Veh. Available Date</b></td>
		<td><B>Status</B></td>
		<td><b>Transporter</b></td>
		<td><b>VehRegNo.</b></td>
		<td><b>Updated</b></td>
		<td><b>Location</b></td>
		<td><b>Comp Descr.</b></td>
		<td><b>Alloc By</b></td>
		</tr>
		<%
			sql="select distinct(VehRegNo) as VehRegNo,Tno,DofAllocation,Status,VehAvailDate from t_callocation1 where Technicion='"+caller+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) group by VehRegNo order by DofAllocation  Desc";
			//out.print(sql);
			ResultSet rst=st.executeQuery(sql);
			//System.out.println("sql-distinct--->" +  sql);
			int i=1;
			while(rst.next())
			{
			%>
			<tr>
		<td><%=i%></td>
		<td><%=rst.getString("Tno")%></td>
		<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
		<%
		try
		{
		%>
		
		<td><font color='red'><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvailDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td><font color='red'><%=rst.getString("Status") %></font></td>
	
		
		<%
			sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
			ResultSet rst1=st1.executeQuery(sql);
			if(rst1.next())
			{
		%>
		<td><%=rst1.getString("Customer")%></td>
		
		
		<td><%=rst.getString("VehRegNo")%></td>
		<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate <'"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
				ResultSet rst11=st3.executeQuery(sql);
				if(rst11.next())
				{
		%>
					<td><font color="Red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("TheDate")) %><br><%=rst11.getString("TheTime") %></font></td>
					<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst11.getDouble("LatitudePosition") %>&long=<%=rst11.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst11.getString("Location") %> </font> </b> </a> </td>
		<%		}
				else
				{
					%>
					<td>-</td>
					<td>-</td>
		<%
				}
				
		%>
		
		
		
		<td><%=rst1.getString("Complaint")%></td>
		<td><%=rst1.getString("RegBy")%></td>
		<%
			}
			else
			{
			%>
		<td>--</td>
		<td>--</td>
		<%
			}	
		%>
		</tr>		
			<%
			i++;
			}	
	}
}
else
{
	
}
	%>
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
