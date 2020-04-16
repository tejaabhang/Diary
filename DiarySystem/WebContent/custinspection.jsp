<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,cust;
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
//cust=request.getParameter("cust");
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
	 st4=conn.createStatement();
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
				
					<td><div align="right">  <a href="totinspectionexcel.jsp?thename=<%=thename %>&cust=<%=cust %>&fromdate=<%=fromdate %>&todate=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
			
				</tr>
								
				</table>	
				</form>	
	
	<%
if(!(null==thename))
{
	if(thename.equals("ALL"))
	{ %>	
		
	
	<table border="0" width="100%" align="center">
	<tr><td align="center"><font color="brown" size="2">Inspection for  All Transporter from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>

	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Date</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Status</b></td>
	<td><b>Transporter</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Comp Descr.</b></td>
	<td><b>Alloc By</b></td>
	<td><b>CostOfInspection</b></td>
	<td><b>ClaimDetails</b></td>
	<td><b>DurationOfClosure</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>PowerConnection</b></td>
	<td><b>JRMOther</b></td>
	
	</tr>
	<%
		sql="select * from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and inspection='Yes'";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td><%=i%></td>
	<td><%=rst.getString("Tno")%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></td>
	<td><%=rst.getString("VehicleNo")%></td>
	<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>
	<td><%=rst1.getString("Status") %></td>
	<td><%=rst1.getString("Customer")%></td>
	
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehicleNo")+"' and TheDate >='"+rst.getDate("TdyDate")+"' order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td><font color="Red"><%=rst11.getString("Location") %></font></td>
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
	<td><%=rst.getString("CostOfInspection")%></td>
	<td><%=rst.getString("ClaimDetails")%></td>
	<td><%=rst.getString("DurationOfClosure")%></td>
	<td><%=rst.getString("DeviceIsFixed")%></td>
	<td><%=rst.getString("GPSPleacement")%></td>
	<td><%=rst.getString("PowerConnection")%></td>
	<td><%=rst.getString("JRMOther")%></td>
	</tr>		
		<%
		i++;
		}
	}
	else
	{
		%>
		<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Date</b></td>
	<td><b>Status</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Transporter</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Comp Descr.</b></td>
	<td><b>Alloc By</b></td>
	<td><b>CostOfInspection</b></td>
	<td><b>ClaimDetails</b></td>
	<td><b>DurationOfClosure</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>PowerConnection</b></td>
	<td><b>JRMOther</b></td>
	
	</tr>
	<%
		sql="select distinct(VehicleNo) as VehicleNo,Tno,TdyDate,CostOfInspection,ClaimDetails,DurationOfClosure,DeviceIsFixed,GPSPleacement,PowerConnection,JRMOther from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' group by VehicleNo";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
			
		int i=1;
		while(rst.next())
		{
/*			sql="select  distinct(VehRegNo) from t_callocation1 where VehRegNo='"+rst.getString("VehRegNo")+"' and Customer='"+cust+"' and VehRegNo='"+rst.getString("VehRegNo")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
			//out.print(sql);
			ResultSet rst01=st4.executeQuery(sql);
				
			
			while(rst01.next())
			
			{
			*/	
		%>
		<tr>
	<td><%=i%></td>
	<td><%=rst.getString("Tno")%></td>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></td>
	<td><%=rst.getString("VehicleNo")%></td>
	<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>
	<td><%=rst1.getString("Status") %></td>
	
	<td><%=rst1.getString("Customer")%></td>
	
	<%		sql="select * from t_onlinedata where VehicleRegNo='"+rst.getString("VehicleNo")+"' and TheDate >='"+rst.getDate("TdyDate")+"' order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color="Red"><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td><font color="Red"><%=rst11.getString("Location") %></font></td>
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
	<td><%=rst.getString("CostOfInspection")%></td>
	<td><%=rst.getString("ClaimDetails")%></td>
	<td><%=rst.getString("DurationOfClosure")%></td>
	<td><%=rst.getString("DeviceIsFixed")%></td>
	<td><%=rst.getString("GPSPleacement")%></td>
	<td><%=rst.getString("PowerConnection")%></td>
	<td><%=rst.getString("JRMOther")%></td>
	</tr>		
		<%
		i++;
		}
		//}
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
