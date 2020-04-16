<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st;
String sql,today;
String fromdate,todate;

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
		
	</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></img></h1>
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
Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
today = formatter.format(defoultdate);

try
{
	Class.forName(MM_dbConn_DRIVER);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn1.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	if(null==fromdate)
	{
		
		fromdate=today;
		todate=today;
	}
	%>
		<table border="0" width="750px" align="center">
				<tr>
				<td align="center"><font color="brown" size="3">EDIT RECORD REPORT</font>
				</td>
				</tr>
			</table>	
				<form name="Allreplacementrpt" id="form1" action="" method="get" >
				<table border="1" width="750px" align="left">
				<tr>
				
				<td><input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=fromdate%>" readonly/>
           		<input type="button" name="trigger" id="trigger" value="From Date" class="formElement"></input>
             
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
             	<input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement"></input>
             	
             	<script type="text/javascript">
             	Calendar.setup(
            	 {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
           		  }
                           );
            	 </script></td>
				<td><input align="center" type="submit" name="Submit" value="Submit" class="formElement" ></input></td>
				
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="Allreplacementexcel.jsp?calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				</tr>				
				<tr>
				<td colspan="4" align="center"><font color="brown" size="2">From: <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> To :<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font>
				</td>
				</tr>
				</table>	
				</form>	
					
					<table border="1" width="100%" class="sortable">
					<tr>
						<td><B>Sr No.</B></td>
						<td><B>Edit Date</B></td>
						<td><B>Old Owner</B></td>
						<td><B>New Owner</B></td> 
						<td><B>Old Group</B></td>
						<td><B>New Group</B></td>
						<td><B>Old Vehicle</B></td>
						<td><B>New Vehicle</B></td>
						<td><B>Comment</B></td>
						<td><B>Edit By</B></td>
						
					</tr>		
				<!-- till here -->	
					<%

					int i=1;
					sql = "select * from t_editrecords where EditDate between '"+fromdate+"' and '"+todate+"' order by EditDate Desc";
					ResultSet rst=st.executeQuery(sql);
					while(rst.next())
					{
						%>
							<tr>
							<td><%=i %></td>
							<td><%=formatter1.format(rst.getDate("EditDate"))%></td>
							<td><%=rst.getString("OldOwner")%></td>
							<td><%=rst.getString("NewOwner")%></td>
							<td><%=rst.getString("OldGroup")%></td>
							<td><%=rst.getString("NewGroup")%></td>
							<td><%=rst.getString("OldVeh")%></td>
							<td><%=rst.getString("NewVeh")%></td>
							<td><%=rst.getString("Comment")%></td>
							<td><%=rst.getString("Rep")%></td>
							</tr>
						<%
						i++;
					}
					%>
					</table>
					<table border="2" width="750px" align="center" class="sortable">
					<tr>
					<td colspan="13"><font color="red"><b>Total</b></font></td>
					<td><font color="red"><b><% --i; %> <%=i%></b></font></td>
					</tr>					
					</table>	
	<%
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
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
