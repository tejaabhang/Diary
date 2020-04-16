<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,sql2,sql3,today,olddate,username,userrole,today1;
String fromdate,todate;
String vehregno="-",probdate="-",compdate="-",availdate="-",ticketno,tech="-",status="-",solvedate="-", reallocated="-",reason="-",solution;
ResultSet rst=null , rst1=null, rst2=null, rst3=null, rst4=null, rst5=null,rst6=null,rst7=null;
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
String s=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);

try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	if(null==fromdate)
	{
		
		fromdate=today;
		todate=today;
	}
	
	%>
			<table border="0" width="750px">
				<tr>
				<td align="center"><font color="brown" size="3">Main Report</font>
				</td>
				</tr>
			</table>
				
				<form name="replacementrpt" id="form1" action="" method="get" >
				<table border="1" width="750px" align="left">
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
				<td><input align="center" type="submit" name="Submit" value="Submit" class="formElement" ></td>
				
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="reportexcel.jsp?calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				</tr>				
				<tr>			
					<td colspan="4" align="center"><font color="brown" size="2">From: <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> To :<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font>
					</td>
				</tr>
				</table>	
				</form>	
					
					<table border="1" width="100%" class="sortable">
					<tr>
					<td><b><font color="Black">Sr</font></b></td>
					<td><b><font color="Black">Customer</font></b></td>
					<td><b><font color="Black">Problem Since</font></b></td>
					<td><b><font color="Black">Complaint Date</font></b></td>
					<td><b><font color="Black">Available Date</font></b></td>
					<td><b><font color="Black">Vehicle Number</font></b></td>
					<td><b><font color="Black">Updated</font></b></td>
					<td><b><font color="Black">Location</font></b></td>
					<td><b><font color="Black">Nature Of Cmplaint</font></b></td>
					<td><b><font color="Black">Action</font></b></td>
					<td><b><font color="Black">Complaint By</font></b></td>
					<td><b><font color="Black">Attend Address</font></b></td>
					<td><b><font color="Black">Complaint to</font></b></td>
					<td><b><font color="Black">Status</font></b></td>
					<td><b><font color="Black">Solved Date</font></b></td>
					<td><b><font color="Black">Re-allocted</font></b></td>
					<td><b><font color="Black">Reason</font></b></td>
					<td><b><font color="Black">Comment</font></b></td>
					
					</tr>		
				
					<%

					sql = "select * from t_complaints1 where TdyDate  between '"+fromdate+"' and '"+todate+"' order By TdyDate Desc";
					int i=1;
					rst = st.executeQuery(sql);
					while(rst.next())
					{ 
						vehregno="-";
						probdate="-";
						compdate="-";
						availdate="-";
						ticketno="-";
						tech="-";
						status="-";
						solvedate="-";
						reallocated="-";
						reason="-";
						solution="-";
						
						%>
						<tr>
						
							<td><font color="RED"><%=i%></font></td>
							<td><font color="RED"><%=rst.getString("Customer")%></font></td>
						<%
						
						probdate = rst.getString("CDate");
						if(probdate==null)
						{
							probdate = "-";
						}
						%>
							<td><font color="RED"><%=probdate%></font></td>
						<%
						
						compdate = rst.getString("TdyDate");
						%>
							<td><font color="RED"><%=compdate%></font></td>
						<%
						availdate = rst.getString("VehAvailDate");
						%>
							<td><font color="RED"><%=availdate%></font></td>
						<%
						 
						vehregno = rst.getString("VehicleNo");
						%>
							<td><font color="RED"><%=vehregno%></font></td>
						<%
						
							//	*****************FOR DATE AND LOCATION
						
								sql1 = "select TheDate,TheTime,Location from t_onlinedata where VehicleRegNo = '"+vehregno+"' order by TheDate Desc ";
					 			rst1 = st1.executeQuery(sql1);
					 			if(rst1.next())
					 			{
					 				%>
									<td><font color="RED"><%=rst1.getString("TheDate")%><br></br><%=rst1.getString("TheTime")%></font></td>
									<td><font color="RED"><%=rst1.getString("Location")%></font></td>
									<%
					 			}
					 	
					 	%>
								<td><font color="RED"><%=rst.getString("Complaint")%></font></td>
						<%
					 	
						ticketno = rst.getString("Tno");
						
								sql2 = "select * from t_callocation1 where Tno = '"+ticketno+"'  ";
			 					rst2 = st2.executeQuery(sql2);
			 					if(rst2.next())
			 					{
			 						
			 						tech = rst2.getString("Technicion");
			 						status = rst2.getString("Status");
			 						solution = rst2.getString("ActualProb");
			 						if(solution==null)
			 						{
			 							solution="-";
			 						}
			 						%>
									<td><font color="RED"><%=solution%></font></td>
									<td><font color="RED">-</font></td>
									
									<%
									if(status.equals("Unsolved"))
									{
										sql3 = "select * from t_reallocated where Tno = '"+ticketno+"' ";
										rst3 = st3.executeQuery(sql3);
										if(rst3.next())
										{
											reallocated = "YES";
											reason = rst3.getString("Reason");
										}
										else
										{
											reallocated = "NO";
											reason = "-";
										}
									}
									
			 					}
			 			solvedate = rst.getString("PSolDate");
			 			if(solvedate==null)
			 			{
			 				solvedate="-";
			 			}
					 	%>	
					 		<td><font color="RED"><%=rst.getString("VehAttLoc")%></font></td>
							<td><font color="RED"><%=tech%></font></td>
							<td><font color="RED"><%=status%></font></td>
					 		<td><font color="RED"><%=solvedate%></font></td>
					 		<td><font color="RED"><%=reallocated%></font></td>
					 		<td><font color="RED"><%=reason%></font></td>
					 		<td><font color="RED">-</font></td>
					 		
					 	</tr>
						<%
					i++;
					}
					%>
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
