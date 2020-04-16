<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2;
String sql,sql1,sql2,sql3;
String today,option,fromdate,holdername,todate,olddate;
ResultSet rs1=null, rs2=null, rs3=null, rs5=null, rs6=null, rs7=null;

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
<script language="JavaScript">

function fun2()
{
	document.transitunit.submit();
}

</script>

</head>

<body>

<div id="outer">
<div id="wrapper">
  <div id="body-bot">
    <div id="body-top">
    
<br>
<br>
<br>
<br>
<br>
<br>
<!--- code start here ------>
<form name="transitunit" id="transitunit" action="" method="post">
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds - 7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);


option=request.getParameter("option");

try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn.createStatement();
	
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	String thename=request.getParameter("radio1");
	holdername=request.getParameter("holdername");
	if(null==fromdate)
	{
	fromdate=olddate;
	todate=today;
	
	}
	int i=1;
	
	
	
	
	
	if(option==null)
	{
		option="fromfield";
	}
	
	%>
		<table border="0" width="750px" >
		<tr><td align="center"><font color="brown" size="3">IN TRANSIT UNITS REPORT. </font></td></tr>
	</table>
	<table border="2" width="750px" >
	
	<tr>
		<td><div align="left"><form name="form1" id="form1" action="" method="post">Dispach from Field</div></td>
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
             <!--<td align="right">  <a href="compnotallocatedexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>-->
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
		 
	</tr>
	
	</table>
	
	
	
	
	<table class="sortable">
	
	
	
			
			<tr>
				<td><b><font color="red">Sr. No</font></b></td>
				<td><b><font color="red">Unit ID</font></b></td>
				<td><b><font color="red">Transporter</font></b></td>
				
				<td><b><font color="red">Sent Date</font></b></td>
				<td><b><font color="red">Technician Name</font></b></td>
				<td><b><font color="red">Courier Name</font></b></td>
				<td><b><font color="red">Courier Docket No</font></b></td>
				<td><b><font color="red">Location</font></b></td>
				<td><b><font color="red">Status of Unit</font></b></td>
				<td><b><font color="red">DC NO</font></b></td>
				<td><b><font color="red">Comment</font></b></td>
				<td><b><font color="red">EntBy</font></b></td>
			</tr>
			
			
			<%
			sql="select * from t_unitreceived where InTransit='Yes' and RDate >='"+fromdate+"' and RDate <= '"+todate+"' and TechName='"+holdername+"' order by RDate desc";
			//out.println(sql);
			rs1=st.executeQuery(sql);
			while(rs1.next())
			{
				%>
				<tr>
				<td><%=i %></td>
				<td><%=rs1.getString("UnitID") %></td>
				<td><%=rs1.getString("Transporter")%></td>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("Rdate")))%></td>
					<td><%=rs1.getString("TechName") %></td>
					<td><%=rs1.getString("Courier") %></td>
					<td><%=rs1.getString("CourierDCNo") %></td>
					<%if(rs1.getString("Location")==null || rs1.getString("Location").equals("null"))
					{%>
					<td>-</td>
					<%}else{ %>
					<td><%=rs1.getString("Location") %></td>
					<%} %>
					<td><%=rs1.getString("Utype") %></td>
					<td><%=rs1.getString("DC_NO") %></td>
						<td><%=rs1.getString("Comment") %></td>
					<td><%=rs1.getString("EntBy") %></td>
				</tr>
				<%
				
				i++;
			}
	
	%>
	
		
</table>
</form>

	<%
	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn1.close();
	conn.close();

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
