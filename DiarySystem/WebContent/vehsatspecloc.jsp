<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
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

function validate()
{
	
		
	return datevalidate();
}

function datevalidate()
{
		var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;

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
			alert("Selected date should not be greater than Todays date (Year)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
	
			return false;
		
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>month || dm2>month)
			{
				alert("Selected date should not be greater than Todays date (Month)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
	
				return false;
			}
		}
	
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("Selected date should not be greater than Todays date (Day)");	
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
		
				return false;
		
			}if(document.techattendrep.reptype[1].checked==true)
			{
				var date1=document.getElementById("calender2").value;

				var dm1,dd1,dy1,dm2,dd2,dy2;
				
				dy1=date1.substring(0,4);
				dm1=date1.substring(5,7);
				dd1=date1.substring(8,10);
				
			
				var date=new Date();
				var month=date.getMonth()+1;
				var day=date.getDate();
				var year=date.getFullYear();
				
				if(dy1>year)
				{
					alert("Selected date should not be greater than Todays date (Year)");
					//document.getElementById("calender").value="";
					//document.getElementById("calender1").value="";
					//document.getElementById("calender").focus;
			
					return false;
				
				}
				else if(year==dy1) 
				{
					if(dm1>month)
					{
						alert("Selected date should not be greater than Todays date (Month)");
						//document.getElementById("calender").value="";
						//document.getElementById("calender1").value="";
						//document.getElementById("calender").focus;
			
						return false;
					}
				}
			
				if(dm1==month)
				{
					if(dd1>day)
					{
						alert("Selected date should not be greater than Todays date (Day)");	
						//document.getElementById("calender").value="";
						//document.getElementById("calender1").value="";
						//document.getElementById("calender").focus;
				
						return false;
				
					}
				}
					
				return true;		
			}

			if(document.techattendrep.reptype[2].checked==true)
			{
				var date1=document.getElementById("frmdte").value;
				var date2=document.getElementById("todte").value;

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
					alert("Selected date should not be greater than Todays date (Year)");
					//document.getElementById("calender").value="";
					//document.getElementById("calender1").value="";
					//document.getElementById("calender").focus;
			
					return false;
				
				}
				else if(year==dy1 && year==dy2) 
				{
					if(dm1>month || dm2>month)
					{
						alert("Selected date should not be greater than Todays date (Month)");
						//document.getElementById("calender").value="";
						//document.getElementById("calender1").value="";
						//document.getElementById("calender").focus;
			
						return false;
					}
				}
			
				if(dm1==month)
				{
					if(dd1>day || dd2>day)
					{
						alert("Selected date should not be greater than Todays date (Day)");	
						//document.getElementById("calender").value="";
						//document.getElementById("calender1").value="";
						//document.getElementById("calender").focus;
				
						return false;
				
					}
				}
			
				if(dy1>dy2)
				{
					alert("From date year should not be greater than To date year");
					//document.getElementById("data").value="";
					//document.getElementById("data1").value="";
					//document.getElementById("data").focus;
			
					return false;
				}
			
				else if(year==dy1 && year==dy2) 
				{
					if(dm1>dm2)
					{
						alert("From date month should not be greater than To date month");
						//document.getElementById("data").value="";
						//document.getElementById("data1").value="";
						//document.getElementById("data").focus;
			
						return false;
					}
				}
				
				if(dm1==dm2)
				 {
					if(dd1 > dd2)
					{
						alert("From date should not be greater than To date");
						//document.getElementById("data").value="";
						//document.getElementById("data1").value="";
						//document.getElementById("data").focus;
			
						return false;
					}
				}
				return true;		
			}
					
		}
	
		if(dy1>dy2)
		{
			alert("From date year should not be greater than To date year");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
	
			return false;
		}
	
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>dm2)
			{
				alert("From date month should not be greater than To date month");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
	
				return false;
			}
		}
		
		if(dm1==dm2)
		 {
			if(dd1 > dd2)
			{
				alert("From date should not be greater than To date");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
	
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
<!--- code start here ------>
<form name="techattendrep" method="get" action="" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql1="", sql2="", sql3="";
	int i=1;

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);

	Format formatteryear = new SimpleDateFormat("yyyy");
	String onlyyear=formatteryear.format(tdydte);
	
	String loc=request.getParameter("loc");
	
	
	
%>
	<table border="0" width="750px">
	<tr>
		<td align="center"> <font color="maroon"> <B> Vehicle/s at specific Location</B></font></td>
	</tr>	
		
<%
	sql2="select distinct(Warehouse) as wh from t_warehousedata order by Warehouse asc";
	rs2=stmt2.executeQuery(sql2);	
%>
		<tr id="sptechopts"> 
			<td> <font color="maroon"> Location </font>
				<select name="loc" class="formElement" onChange="TechSelect()">
					<option value="Select">Select</option> 
<%
				while(rs2.next())
				{ %>
					<option value="<%=rs2.getString("wh")%>"><%=rs2.getString("wh")%></option>
<%				}
%>
				</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="maroon">From Date: </font>
		<input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
              
               <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script>

		&nbsp;&nbsp;&nbsp;
		<font color="maroon">To Date: </font>
		<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
              
               <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender1",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger1"       // ID of the button
               }
                             );
               </script>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" value="Submit" class="formElement" />
			</td>

			
		</tr>
		<tr id="alltechopts" style="display:none"> 
			<td> 
				<font color="maroon">Date: </font>
		<input type="text" id="calender2" name="calender2" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
              
               <input type="button" name="trigger2" id="trigger2" value="Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender2",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger2"       // ID of the button
               }
                             );
               </script>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" value="Submit" class="formElement" />
			</td> 
		</tr>
		<tr id="mnthlyalltechrepopts" style="display:none"> 
			<td> 
				<font color="maroon">From Date: </font>
				<input type="text" id="frmdte" name="frmdte" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
              
               <input type="button" name="trigger2" id="trigger2" value="From Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "frmdte",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger2"       // ID of the button
               }
                             );
               </script> &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="todte" name="todte" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
              
               <input type="button" name="trigger3" id="trigger3" value="To Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "todte",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger3"       // ID of the button
               }
                             );
               </script>
&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit" value="Submit" class="formElement" />
			</td> 
		</tr>
	</table>
	<br></br>
<%
	if(!(loc==null))
	{	

		String date1=request.getParameter("frmdte");
		String date2=request.getParameter("todte");
%>	
	<table border="0" width="750px">
		<tr>
			<td align="center" > <div align="center"> <font size="2"> <b> Vehicles at <%=loc %> between <%=date1 %> and <%=date2 %></b> </font> </div> </td> 
		</tr>
	</table>
	
	<table class="sortable">
		<tr>
			<th> Sr No</th>
			<th> Veh No</th>
			<th> Date-Time </th>
			<th> Unit Id </th>
			<th> Sim No </th>
			<th> Mob No </th>
			<th> Group </th>
			<th> Inst Date </th>
			<th> Warranty </th>
		</tr>
		<%
			sql1="select * from t_";
		%>
	</table>

<%
	}
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->

 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</form>
</body>
</html>


