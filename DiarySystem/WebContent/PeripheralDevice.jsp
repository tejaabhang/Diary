
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>

<html>
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

function birt()

{
	{  var device=document.getElementById("device").value;
		
	   
	document.getElementById('myIframe').src="http://myfleetview.com/birttest/frameset?__report=peripheralunit.rptdesign&category="+device+"&__showtitle=false";	
	document.getElementById("reportData").style.display= "";
	return true;
	
	
	}
}
	function birt1()

	{
		{  var device="All";
			
		document.getElementById('myIframe').src="http://myfleetview.com/birttest/frameset?__report=peripheralunit.rptdesign&category="+device+"&__showtitle=false";	
		document.getElementById("reportData").style.display= "";
		return true;
		
		
		}

	
	
	
}





// if Type of UNit is 'Voice call', then this will get called

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

<!-- code end here --->
<table width="850px" height="350px" border="0">

		<tr align="center"><td>
		<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st3=conn.createStatement();
	
	st2=conn1.createStatement();
	
	String userrole=session.getAttribute("userrole").toString();
	String insert=request.getParameter("insert");
	String transporter=request.getParameter("transporter");
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
		
%>	




<b>Peripheral :</b>
		 <select class="formElement" id="device" name="device" style="width: 75px; height: 20px;">
		      <option value="All" selected="selected">All</option>
		     <% 
									String sql5="select device from db_gps.categorydevice where device!='Sim'";
									ResultSet rs5=st2.executeQuery(sql5);
									while(rs5.next())		
									{%>
									
									<option value="<%=rs5.getString("device") %>"><%=rs5.getString("device") %></option>
									<%} %>
									<!-- <option value="Router">Router</option>
									<option value="NUC">NUC</option>
									<option value="Module">Module</option> -->
									
		  <%--    
			<%
			String sql3 = "select distinct(ActiveStatus) from db_gps.t_transporter";

			ResultSet rs2 = st.executeQuery(sql3);
			
			while(rs2.next())
			{
				%>
				<option value="<%=rs2.getString("ActiveStatus") %>" ><%=rs2.getString("ActiveStatus") %></option>
				<%
			}
			%> --%>
			</select>
		
		<%-- <b>Customer Type: </b>
		 <select class="formElement" id="customertype" name="customertype" style="width: 75px; height: 20px;">
		      <option value="All" selected="selected">All</option>
		     
			<%
			String sql1 = "select distinct(CustomerType) from  db_gps.t_customertypemaster";
			ResultSet rs1 = st1.executeQuery(sql1);
			
			while(rs1.next())
			{
				%>
				<option value="<%=rs1.getString("CustomerType") %>" ><%=rs1.getString("CustomerType") %></option>
				<%
			}
			%>
			</select>
			<b>Operational Status: </b>
			  <select class="formElement" id="opstatus" name="opstatus" style="width: 75px; height: 20px;">
		      <option value="All" selected="selected">All</option>
				<%
			String sql5 = "select distinct(OperationalStatus) from db_gps.t_operationalstatusmaster";
			ResultSet rs5 = st3.executeQuery(sql5);
			
			while(rs5.next())
			{
				%>
				<option value="<%=rs5.getString("OperationalStatus") %>" ><%=rs5.getString("OperationalStatus") %></option>
				<%
			}
			%>
			</select> --%>
			&nbsp; &nbsp;<input type="submit" name="submit" id="submit" onclick="birt()" value="submit">
		</td>
		</tr>
		<tr >
		<td align="right" >
<!-- 		<div id="data"  style="margin-left: 85%;"> -->
<font size="2">
			<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			</font>
			<!-- </div> -->
			<div id="reportData">	

	<iframe align="middle" id="myIframe" width='120%' height='1250px' src="">
	</iframe>
			</div>
		<%
}
catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
		<script>
		
		window.onload=birt1;
</script>		
		
		<!-- </td></tr> -->
		</table>
 	<!-- 	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div> -->
  
 <!--  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div> -->

</body>
</html>

<%--  <%@ include file="footer.jsp" %> --%>