<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
Connection con2;
String refno=null;

%>

<%@page import="java.util.Date"%>
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
	function validate()
		{
			if(document.getElementById("data").value=="")
			{
		  		alert("Please select the from date");
				return false;
			}
			if(document.getElementById("data1").value=="")
			{
	  		alert("Please select the to date");
				return false;
			}
			
			return datevalidate();
	  }

	function datevalidate()
	 {
	 	var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2)
		{
 			if(dm1>month || dm2>month)
			{
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year is should not be greater than to date year");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) if(dm1>dm2)
		{MimeMessage msg=new MimeMessage(session);
			alert("From date month is should not be greater than to date month 5");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		if(dm1==dm2) 
		{
			if(dd1 > dd2)
			{
				alert("From date should not be greater than to date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
		}
		return true;
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
  
<%
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	Statement stmt1 = con2.createStatement();
	Statement stmt2 = con1.createStatement();
	Statement stmt3 = con1.createStatement();
	Statement stmt4 = con2.createStatement();
	Statement stmt5 = con2.createStatement();
	Statement stmt6 = con2.createStatement();
	Statement stmt7 = con2.createStatement();
	Statement stmt8 = con2.createStatement();
	Statement stmt9 = con2.createStatement();
	Statement stmt10 = con2.createStatement();
	
	
	//ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
	String sql="",sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="";
	String Date="",unitid="",oldmobno="",oldsimno="",oldoperator="",data="",data1="",oldstatus="",newmobno="",OtherCorrections="";
	String newsimno="",newoperator="",newstatus="",EntBy="";
	String user=session.getAttribute("username").toString();
	String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	System.out.println("today  "  +today);
	try
	{data=request.getParameter("data");
		if(data==null || data.equalsIgnoreCase(null))
		{
	      data=today;
		}
		data1=request.getParameter("data1");
if(data1==null || data1.equalsIgnoreCase(null))
{
	
      data1=today;
	

}
	
	
	System.out.println("fromdate  "  +data);
	
	System.out.println("todate  "  +data1);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	

	%>
	  	<form action="" method="get" onsubmit="return validate();">
						<table border="2"  width="750px" align="center">
				
				<tr bgcolor="">
				<td align="center">
				  <table ><tr style="border: none;">
				  <td >
				  <input type="text" id="data" name="data" class="formElement" value="<%=data %>" size="10" readonly/>
				  </td>
				  <td>
					<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data",         // ID of the input field
	      			ifFormat    : "%Y-%m-%d",     // the date format
	      			button      : "trigger"       // ID of the button
	    			}
	  				);	
					</script>
				  </td>
				  </tr></table>
				</td>
				<td align="center">
				<table><tr><td>
				<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
				</td>
				<td>
				 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data1",         // ID of the input field
	      			ifFormat    : "%Y-%m-%d",    // the date format
	      			button      : "trigger1"       // ID of the button
	    			}
	  				);
					</script>
				</td>
				</tr></table>
				  	
				  	
	  			 </td >
				
				<td align="center">
					<input type="submit" name="submit" id="submit" value="submit" class="formElement">
				</td>
			</tr>
			
			</table>
			</form>
				<table border="1" width="750px">	<tr><td>
	                <center class='bodyText'><font size="3"><b>Sim Change Report from   <%
	                        java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
	                        Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
	                        String showdate = formatter2.format(ShowDate);
	                        out.print(showdate);
	                        %> to <%
	                        java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
	                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
	                       String showdate1 = formatter1.format(ShowDate1);
	                        out.print(showdate1); %>
	                        </b>
		<div align="right">
<!--					<a href="viewreceived_export.jsp?data=< %= data %>&data1=< %=data1 %>"  title="Export to Excel">-->
					<a>
					<img src="images/excel.jpg" width="15px" height="15px"></a>
					</div>
				</td>
				</tr>
				
			</table>
		
	
                <div >
				<table border="2"  width="750px" align="center" class="sortable">
				<tr>
				<td  class="hed"> Sr.</td>
				<td class="hed"> Date</td>
				<td class="hed"> Unit ID</td>
				<td class="hed"> OldSim No</td>
				<td class="hed"> OldMob No</td>
				<td class="hed"> Old Status </td>
				<td class="hed"> Old Operator</td>
				<td class="hed"> NewSim No</td>
				<td class="hed"> NewMob No</td>
				<td class="hed"> Present Status</td>
				<td class="hed"> Other corrections</td>
				<td class="hed"> Entryby</td>
				</tr>		
				<%
				
				int i=0;
				sql="select distinct(UnitID),EntDate ,EntBy,OtherCorrections from db_gps.t_unitmasterhistory where  EntDate between '"+data+"' and '"+data1+"'  and OtherCorrections in('simcard', 'sim change')";
				ResultSet rs=stmt1.executeQuery(sql);
				System.out.println("ist querry  "  +sql);
				while(rs.next())
				{
					i++;
					OtherCorrections=rs.getString("OtherCorrections");
					Date=rs.getString("EntDate");
					Date=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("EntDate")));
					unitid=rs.getString("UnitID");
					System.out.println("unitid  "  +unitid);
					EntBy=rs.getString("EntBy");
					System.out.println("unitid  "  +EntBy);
				%>
				<tr>
				<td><div><%=i %></div></td>
				<td><div><%= Date%></div></td>
				<td><div><%=unitid %></div></td>
				<%
				sql1="select MobNo from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and EntDate<'"+rs.getString("EntDate")+"' and MobNo<>'-'  order by EntDate desc limit 1";	
				ResultSet rs1=stmt2.executeQuery(sql1);
				System.out.println("2nd querry  "  +sql1);
				if(rs1.next())
				{
					oldmobno=rs1.getString("MobNo");
				}
				
				sql2="select Simno,Service_provider,Status from db_gps.t_simmaster where Mobno='"+oldmobno+"' ";
				ResultSet rs2=stmt3.executeQuery(sql2);
				while(rs2.next())
				{
					oldsimno=rs2.getString("Simno");
					oldoperator=rs2.getString("Service_provider");
					oldstatus=rs2.getString("Status");
				}
				
				sql3="select MobNo from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' and OtherCorrections in('simcard', 'sim change') order by MobNo desc limit 1";
				ResultSet rs3=stmt4.executeQuery(sql3);
				System.out.println("3rd querry  "  +sql3);
				if(rs3.next())
				{
					newmobno=rs3.getString("MobNo");
				}
				sql4="select Simno,Service_provider,Status from db_gps.t_simmaster where Mobno='"+newmobno+"' ";
				ResultSet rs4=stmt5.executeQuery(sql4);
				while(rs4.next())
				{
					newsimno=rs4.getString("Simno");
					newoperator=rs4.getString("Service_provider");
					newstatus=rs4.getString("Status");
				}
				/*sql5="select EntBy from db_gps.t_unitmasterhistory  where EntDate between '"+data+"' and '"+data1+"'  and OtherCorrections='sim change'";
				ResultSet rs5=stmt5.executeQuery(sql5);
				System.out.println("last querry  "  +sql5);
				if(rs5.next())
				{
					EntBy=rs5.getString("EntBy");
				}*/
				%>
				<td><div><%=oldsimno %></div></td>
				<td><div><%=oldmobno%></div></td>
				<td><div><%=oldstatus %></div></td>
				<td><div><%=oldoperator %></div></td>
				<td><div><%=newsimno%></div></td>
				<td><div><%=newmobno %></div></td>
				<td><div><%=newstatus %></div></td>
				<td><div><%=OtherCorrections%></div></td>
				<td><div><%=EntBy %></div></td>
				</tr>
			<%
				}
			%>	
		</table>
		</div>
	<% 
	} catch(Exception e) { out.println("Exception----->"+e); }

	finally
	{
	con1.close();
	con2.close();
	}
	%>



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
