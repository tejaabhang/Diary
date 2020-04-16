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
<form name="comprepform" method="get" action="" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement();
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";

	String trans=request.getParameter("trans");

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
%>	
<input type="hidden" name="trans" value="<%=trans%>" />
	<table border="0" width="750px">
         	<tr>
             	  	<td> <div align="center"> <font color="maroon" size="2"> <B> Complaint  Report of <%=trans%> </B></font></div> </td>
         	</tr>
      </table> 

	<table border="0" width="750px">
         	<tr>
             	  	<td> <input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
  
            
               <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script> &nbsp;&nbsp;&nbsp; 
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
               </script>  &nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;
		<input type="submit" name="submit" value="Submit" class="formElement" />	 

			</td>
		</tr>
	</table>
	

<%
	String date1=request.getParameter("calender");

	if(date1==null)
	{
	}
	else
	{ 
		String date2=request.getParameter("calender1");
%>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <B> From <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%> </B> 
				</td>
				<td align="right"> <a href="excelcomprep.jsp?trans=<%=trans%>&calender=<%=date1%>&calender1=<%=date2%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a>
				</td> 
			</tr>
		</table>
		<table class="sortable">
			<tr>
				<td> <div align="center"> <B> Sr.<br> No </B> </div> </td>
				<td> <div align="center"> <B> Tick No. </B> </div> </td>
				<td> <div align="center"> <B> Veh. No </B> </div> </td>
				<td> <div align="center"> <B> Lodged Date </B> </div> </td>	
				<td> <div align="center"> <B> Complaint </B> </div> </td>
				<td> <div align="center"> <B> Alloc.<br> To </B> </div> </td>
				<td> <div align="center"> <B> Alloc. Date </B> </div> </td>
				<td> <div align="center"> <B> Status </B> </div> </td>
				<td> <div align="center"> <B> Solved Date </B> </div> </td>
				<td> <div align="center"> <B> Reg. By </B> </div> </td>
			</tr>
<%
	int i=1;
	sql1="select * from t_complaints1 where Customer='"+trans+"' and TdyDate between '"+date1+
"' and '"+date2+"' order by Tno desc ";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String tickno=rs1.getString("Tno");
		String status=rs1.getString("Status");	
		String soldate="";
		
		if(status.equals("Solved"))
		{
			soldate=rs1.getString("PSolDate");
		}
		else
		{
			soldate="NA";
		}
	
		String allocto="", allocdate="";

		sql2="select * from t_callocation1 where Tno='"+tickno+"' ";
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			allocto=rs2.getString("Technicion");
			allocdate=rs2.getString("DofAllocation");

		}
		else	
		{
			allocto="UnAllocated";	
			allocdate="NA";
		}	
 %>
			<tr>
				<td> <%=i%> </td>
				<td> 
<%					if(status.equals("Allocated") || status.equals("Attended"))
				 	{ %>
						<B> <a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"> <%=rs1.getString("Tno")%> </a> </B> 
					</br>
					<div class="popup" id="popup<%=i%>">
					<table border="0" >
					   <tr>  <td> <a href='action.jsp?tno=<%=tickno%>&tech=<%=allocto%>&vehno=<%=rs1.getString("VehicleNo")%>' > Action by Tech </a> </td>
					   </tr> 
					   <tr>  <td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a> </td> </tr>	
					</table>	
<%					}
					else if(status.equals("UnAllocated"))
					{ %>
						<B> <a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"> <%=rs1.getString("Tno")%> </a> </B> 
					</br>
					<div class="popup" id="popup<%=i%>">
					<table border="0" >
					   <tr>  <td> <a href='reallocate.jsp?tno=<%=tickno%>' > Allocate </a> </td>
					   </tr> 
					   <tr>  <td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a> </td> </tr>	
					</table>	
<%					}					 
					else 
					{ %>
						<%=tickno%>
<%					} %>
				</td>	
				<td> <%=rs1.getString("VehicleNo")%> </td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TdyDate")))%> </td>		
				<td> <%=rs1.getString("Complaint")%> </td>	
				<td> <%=allocto%> </td>	
				<td>
<%	
			try { %>
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate))%> 
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
				</td>	  	
				<td> <%=status%> </td>	
				<td> 
<%	
			try { %>	
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(soldate))%>
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
 				</td>	
				<td> <%=rs1.getString("RegBy")%> </td>	
			</tr>
<%
		i++;
	}
%>
		</table>

<%	}
%>


<%
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

</body>
</html>

