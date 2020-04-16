<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st11,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,today,olddate,username,userrole,today1;
String fromdate,todate,veh1,code1,dt1;
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
	/*function fun2()
	{	
		document.form1.submit();
	}	
	*/</script>
	
	
	
		
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
//username=session.getAttribute("username").toString();
//userrole=session.getAttribute("userrole").toString();


try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st11=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	
	
	String uid1=request.getParameter("uid");
	//out.print(uid1);
	String trpt1=request.getParameter("trpt");
	//out.print(trpt1);
	String dt1=request.getParameter("dt");
	//out.print(dt1);
	String vrn1=request.getParameter("vrn");
	String on1=request.getParameter("on");
	
	String testdate="";
	int i=1;
	
	
	%>
	
			<table border="0" width="750px" align="center">
				<tr>
				<td>
				
								
				<div align="center"><font color="brown" size="3">Quick Test Report For Unit <%=uid1 %> </font></div>
			<!-- 	<td colspan="" bgcolor="">  
					<div align="right">  <a href="quicktestexcel.jsp?uid1=<%=uid1 %>&vrn1=<%=vrn1 %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> 
				</td>	
				 -->
				</td>
				</tr>
			</table>	
								
					<table border="1" width="100%" class="sortable">
					<td>Sr.</td>
					<td>Veh Reg. No.</td>
					<td>Transporter</td>
					<td>Test Date</td>
					<td>SW Comment</td>
					<td>SW DebitNote</td>
					<td>Physical Damage</td>
					<td>Correction Done</td>
					<td>Red Light</td>
					<td>Green Light</td>
					<td>Red light connection</td>
					<td>Green Light Condition</td>
					<td>Other Connection</td>
					<td>GPS Antenna OK</td>
					<td>GPS Ant. LED</td>
					<td>Connection Det</td>
					<td>Power</td>
					
					<td>Fuse Blown</td>
					<td>Power Supply Fail</td>
					
					</tr>			
					<%

					sql3="select * from hwunittest where UnitID='"+request.getParameter("uid")+"' and TheDate >= '"+request.getParameter("dt")+ "' and Cust='"+on1+"'";
					ResultSet rst11=st.executeQuery(sql3);
					while(rst11.next())
					{
						testdate= rst11.getString("TheDate");       			
					    			%>
						<tr>			
							<td> <%=i %> </td>
							<td> <%=vrn1%></td>
							<td> <%=rst11.getString("Cust") %></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst11.getString("TheDate"))) %></td>
							<td><%=rst11.getString("SWComment") %></td>	
							<td><%=rst11.getString("SWDebitNote") %></td>		
							<td><%=rst11.getString("Physicaldamage") %></td>
							<td><%=rst11.getString("Correctiondone") %></td>			
							<td> <%=rst11.getString("RLED") %></td>
							<td> <%=rst11.getString("GLED") %></td>
							<td> <%=rst11.getString("RLEDConn") %></td>
							<td> <%=rst11.getString("GLEDBlink") %></td>
							<td> <%=rst11.getString("OthConn") %></td>
							<td> <%=rst11.getString("GPSAnt") %></td>
							<td> <%=rst11.getString("GPSAntLED") %></td>
							<td> <%=rst11.getString("ConnDet") %></td>
							
							<td> <%=rst11.getString("PowerOk") %></td>
							<td> <%=rst11.getString("FuseBlownOk") %></td>
							<td> <%=rst11.getString("PowerSuppFail") %></td>
							
							
							
						</tr>
					
					<%	i++;
					} %>
					</table>
					<br></br> <br></br>
				<%		
				
								if(!(testdate.equals("")))
								{
									sql="select * from t_unitmasterhistory where DispDate >='"+testdate+"'and UnitID='"+uid1+"'order by EntDate desc";
						//out.print(sql);
								
						
						ResultSet rst=st2.executeQuery(sql);
						
						if(rst.next())
						{
								%>
								
								<table border="0" width="750px" align="center">
				<tr>
				
								
											<td colspan="4" align="center"> <div align="center"><font color="brown" size="3">Current Dispatch Report For Unit <%=uid1 %> </font></div> </td>
				
										
				
				</tr>
			</table>	
								
								
							
									<table border="1" width="100%" class="sortable">
								 	
									<tr>		
											
											<td>Ref. No.</td>
											<td>Dispatched Date</td>
											<td>Status</td>
											<td>Hold By</td>
									</tr>		
											
									<tr>
										
										<td><%=rst.getString("Rno") %></td>
										<td><%=rst.getString("DispDate") %></td>
										<td><%=rst.getString("Status") %></td>
										<td><%=rst.getString("HoldBy") %></td>
									</tr>
								</table>	
												
										<%
							}

						else
						{
							%>
							
							
							<table border="0" width="750px" align="center">
				<tr>
				<td>
				
								
 				<td colspan="4" align="center"> <div align="center"><font color="brown" size="3">Current Dispatch Report For Unit <%=uid1 %> </font></div> </td> 
														
										
				</td>
				</tr>
			</table>	
							
							
								<table border="1" width="100%" class="sortable">
										
													
								<tr>
									<br><br><br>
									<td colspan="4" align="center"> <div align="center"><font color="Red" size="3">Currently Unit Is With Transworld </font></div> </td>								</tr>
								</table> 
							<%
						}
			      	      		
			   
								
								
								}
								else
								{
									sql="select * from t_unitmasterhistory where DispDate>='"+dt1+"' and UnitID='"+uid1+"'order by DispDate desc";
										//out.print(sql);
																					
									ResultSet rst=st2.executeQuery(sql);
									//out.print(sql);
													
								if(rst.next())
								{
										%>
									
											<table border="1" width="100%" class="sortable">
										 	<tr>
													<td colspan="4" align="center"> <div align="center"><font color="brown" size="3">Current Dispatch Report For Unit <%=uid1 %> </font></div> </td>
											</tr>
											<tr>		
													
													<td>Ref. No.</td>
													<td>Dispatched Date</td>
													<td>Status</td>
													<td>Hold By</td>
											</tr>		
													
											<tr>
												
												<td><%=rst.getString("Rno") %></td>
												<td><%=rst.getString("DispDate") %></td>
												<td><%=rst.getString("Status") %></td>
												<td><%=rst.getString("HoldBy") %></td>
											</tr>
										</table>	
														
												<%
									}

								else
								{
									//out.print("hhh");
									sql4="select * from t_unitreceived where Rdate >='"+dt1+"' and UnitID='"+uid1+ "' ";//order by Rdate desc";
												//out.print(sql4);
									//ResultSet rst22=st11.executeQuery(sql4);
									ResultSet rst22=st11.executeQuery(sql4);
												
											if(rst22.next())
											{
											
											%>
									
										<table border="0" width="750px" align="center">
				<tr>
				
								
 				<td colspan="4" align="center"> <div align="center"><font color="brown" size="3">Current Dispatch Report For Unit <%=uid1 %> </font></div> </td> 
														
										
				
				</tr>
			</table>	
							
							
								<table border="1" width="100%" class="sortable">
										
													
								<tr>
									<br><br><br>
											<td colspan="4" align="center"> <div align="center"><font color="Red" size="3">Currently Unit Is With Transworld </font></div> </td>		
						</tr>								
								</table> 
									<%
									
											}
											else
											{
												%>
											
										<table border="0" width="750px" align="center">
				<tr>
				
				
								
 				<td colspan="4" align="center"> <div align="center"><font color="brown" size="3">Current Dispatch Report For Unit <%=uid1 %> </font></div> </td> 
														
										
				
				</tr>
			</table>	
							
								<table border="1" width="100%" class="sortable">
										
													
								<tr>
									<br><br><br>
											<td colspan="4" align="center"> <div align="center"><font color="Red" size="3">Unit Not Yet Received </font></div> </td>		
						</tr>								
								</table> 		
						<%
											}
								}
					      	    
								}
					   %>
				
					 
	<%
//
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
