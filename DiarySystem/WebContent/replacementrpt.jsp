<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,strec;
String sql,sql1,sql2,sql3,sql4,today,olddate,username,userrole,today1;
String fromdate,todate,veh1,code1,dt1;
int Ocount;
int days=0;
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
Ocount=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	strec=conn.createStatement();
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
				<td align="center"><font color="brown" size="3">Unit Replacement Report For No Warranty Vehicles</font>
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
					<div align="right">  <a href="replrptexcel.jsp?calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				</tr>				
				<tr>			
					<td colspan="4" align="center"><font color="brown" size="2">From: <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> To :<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font>
					</td>
				</tr>
				</table>	
				</form>	
					
					<table border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Veh Reg. No.</td>
					<td>Transporter</td>
					<td>Replace Date</td>
					<td>Old Unit</td>
					<td>New Unit</td>
					<td>Peripheral</td>
					<td>Replace Place</td>
					<td>Replace By</td>
					<td>First Inst. Date</td>
					<td>Old Unit Damaged</td>
					<td>Recieved Status</td>
					<td>Quick Test</td>
					
			<!-- Change 30 -->
					<td>Test Date</td>
					<td>SW Comment</td>
					<td>SW DebitNote</td>
					<td>Physical Damage</td>
					<td>Correction Done</td>
					<td>GPS Antenna OK</td>
					<td>Power Supply Fail</td>
			
					</tr>		
				<!-- till here -->	
					<%

					sql = "select * from t_unitreplacement where InstDate between '"+fromdate+"' and '"+todate+"' and InstType = 'rep'";
					//sql = "select * from t_unitreplacement where InstDate between '"+fromdate+"' and '"+todate+"' ";
					int i=1;
					ResultSet rst=st2.executeQuery(sql);
					while(rst.next())
					{ 
						//System.out.println("in while loop");
						veh1 = rst.getString("VehRegNo");
						java.util.Date repdate=rst.getDate("EntDate");
						sql1 = "select * from t_vehicledetails where VehicleRegNumber='"+rst.getString("VehRegNo")+"'";
						ResultSet rst1=st3.executeQuery(sql1);
							while (rst1.next())
							{
								java.util.Date instdate=rst1.getDate("InstalledDate");
								sql2="select (TO_DAYS('"+repdate+"')-TO_DAYS('"+instdate+"'))";
								ResultSet rst2=st4.executeQuery(sql2);
								if(rst2.next())
								{
									days=rst2.getInt(1);
							        	if(days > 365)
											{
							        		
							        			sql3="select * from hwunittest where UnitID='"+rst.getString("OldUnitID")+"' and Custdb='"+rst1.getString("OwnerName")+"' and TheDate >= '"+rst.getString("EntDate")+ "' ";
							        			ResultSet rst11=st.executeQuery(sql3);
							        		if(rst11.next())
							        		{
					%>
						<tr>
						
							<td> <%=i %> </td>
							<td> <%=rst1.getString("VehicleRegNumber")%></td>
							<td> <%=rst1.getString("OwnerName") %></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("EntDate"))) %></td>
							<td> <%=rst.getString("OldUnitID") %></td>
							<td> <%=rst.getString("NewUnitID") %></td>
							<td> <%=rst.getString("TypeUnit") %></td>
							<td> <%=rst.getString("InstPlace") %></td>
							<td> <%=rst.getString("InstBy") %></td>
							<td><%=rst1.getString("InstalledDate") %></td>
							<td> <%=rst.getString("OldUnitDamaged") %></td>
							
							<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							
							
							<td><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"><font color="Red" size="2"> Done</font></a>	
							</td>
						<!-- change 30 -->
						
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheDate"))) %></td>
							<td><%=rst11.getString("SWComment") %></td>	
							<td><%=rst11.getString("SWDebitNote") %></td>		
							<td><%=rst11.getString("Physicaldamage") %></td>
							<td><%=rst11.getString("Correctiondone") %></td>
							<td> <%=rst11.getString("GPSAnt") %></td>
							<td> <%=rst11.getString("PowerSuppFail") %></td>
							
						<!-- till here -->	
							
						</tr>
					<%	i++;
														}
														else
													{
														%>
							<tr>
						
							<td> <%=i %> </td>
							<td> <%=rst1.getString("VehicleRegNumber")%></td>
							<td> <%=rst1.getString("OwnerName") %></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("EntDate"))) %></td>
							<td> <%=rst.getString("OldUnitID") %></td>
							<td> <%=rst.getString("NewUnitID") %></td>
							<td> <%=rst.getString("TypeUnit") %></td>
							<td> <%=rst.getString("InstPlace") %></td>
							<td> <%=rst.getString("InstBy") %></td>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst1.getString("InstalledDate"))) %></td>
							
							<td> <%=rst.getString("OldUnitDamaged") %></td>
							
							<%
							try{
							String sqlrec="select * from t_unitreceived where Rdate >='"+rst.getString("EntDate")+"' and UnitID='"+rst.getString("OldUnitID")+ "' ";
							ResultSet rsrec=strec.executeQuery(sqlrec);
							if(rsrec.next())
							{
							%>
								<td><b><font color="Red">YES</font></b></td>
							<%	
							}
							else
							{
							%>
								<td><b><font color="Red">NO</font></b></td>
							<%	
							}
							}catch(Exception e)
							{
								%>
								<td><b><font color="Red">-</font></b></td>
							<%	
							}
							
								
							%>
							
							
							<td><a href="quicktest.jsp?uid=<%=rst.getString("OldUnitID")%>&trpt=<%=rst1.getString("OwnerName") %>&dt=<%=rst.getString("EntDate")%>&vrn=<%=rst1.getString("VehicleRegNumber")%>&on=<%=rst1.getString("OwnerName") %>"> Not Done</a> 
							</td>
				
							<!-- change 30 -->
						
							<td>-</td>
							<td>-</td>	
							<td>-</td>		
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							
						<!-- till here -->
						
						</tr>
													<%	i++;
													}
													
													
							        		
													}	
											}
								}
							
					}
					%>
									
						
					
					
					<table border="2" width="750px" align="center" class="sortable">
										
					<tr>
					<td olspan="13"><font color="red"><b>Total Replacement</b></font></td>
					<td><font color="red"><b><% --i; %> <%=i%></b></font></td>
					
					
					</tr>					
					</table>	
					</table>
	<%
	
//
}catch(Exception e)
{
	out.print("Exception -->"+e);
	System.out.print("Exception -->"+e);
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
