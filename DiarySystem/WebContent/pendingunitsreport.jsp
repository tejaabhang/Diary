
<%-- 
    Document   : Pending Unit Report
    Created on : Oct 2009
    Author     : Ayaz Ansari
    Discroption: This page shows the Number Of units With Customer Or Transporter
    last updated :  Jan 2010 
    Modified by: Ayaz Ansari 
--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1,con1,con2;
Statement sttrans,sttech;
String sqltrans,sqltech,username,userrole,thename;

String present=null;
String present1=null;
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
function fun1()
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
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
sttrans=conn1.createStatement();
sttech=conn.createStatement();
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con2.createStatement();
Statement stmt3=con1.createStatement();
Statement stmt4=con2.createStatement();
Statement stmt5=con1.createStatement();
Statement stmt6=con1.createStatement();
Statement stmt7=con1.createStatement();
Statement stmt88=con1.createStatement();
Statement stmt99=con1.createStatement();
Statement stmt10=con2.createStatement();
Statement stmt111=con1.createStatement();
Statement stmt12=con1.createStatement();
Statement stmt13=con1.createStatement();

ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
ResultSet rs5=null;
String sql1="";
String sql2="";
String sql3="";
String sql4="";
String sql5="";
String sql11="";
String sql22="";
String sql33="";
String sql44="";
String sql55="";
String sql66="";
String sql77="";
String sql88="";
String sql99="";
String sql10="";
String sql111="";
String sql12="";
String sql13="";
ResultSet rs11=null;
ResultSet rs22=null;
ResultSet rs33=null;
ResultSet rs44=null;
ResultSet rs55=null;
ResultSet rs66=null;
ResultSet rs77=null;
ResultSet rs88=null;
ResultSet rs99=null;
ResultSet rs10=null;
ResultSet rs111=null;
ResultSet rs12=null;
ResultSet rs13=null;
int totcount=0;
int i=1;
thename=request.getParameter("radio1");
if(null==thename)
{
	thename="Transporter";
}
%>
	<table>
	<tr><td>
		<form name="form1" id="form1" action="" method="post">
	
		<table border="0" width="750px" >
			<tr>
				<td>
					<div align="center"><Font color='Brown' size='3'>PENDING UNITS REPORT</Font></div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="left">
			
					<input type="radio" name="radio1" value="Transporter" <% if(thename.equals("Transporter")) { out.print("CHECKED"); } %> onclick="fun1();" >Transporter</input>
					<input type="radio" name="radio1" value="Technician" <% if(thename.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun1();" >Technician</input>
					<div align="right">  <a href="pendingunitsreportexcel.jsp?thename=<%=thename%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div>
				</div>
				</td>
			</tr>
		</table>
		</form>
	</td></tr>
		<%
		if(!(null==thename))
		{
			if(thename.equals("Transporter"))
			{
		 %>
			<tr>
				<td align="center"><font color="RED" size="2">ALL TRANSPORTERS LIST. </font></td>
			</tr>
			<tr> 
				<td><div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Unit To Know Pending Units To Them.</font> </marquee> </div></td>
			</tr>	
			<tr>
				<td>
				<table border="1" width="50%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Transporter</b></td>
						<td><b>Units Count</b></td>
					</tr>
					
					<%
					sqltrans="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";	
					ResultSet rsttrans=sttrans.executeQuery(sqltrans);
					while(rsttrans.next())
					{
						String transp=rsttrans.getString("OwnerName");
						int count=0;
						int count1=0;
						int totunits=0;
						%>
						<tr>					
						<td width="5%"><div align="right"><%=i%></div></td>
						<%
						sql1="select * from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('cust','customer','Customer','"+transp+"') and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
						rs1=stmt1.executeQuery(sql1);
						while(rs1.next())
						{
							String time=rs1.getString("InstTime");
							String z=new Integer(00).toString();
							if(time==null)
							{
								time=z;
							}
							else
							{
							}
							sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate > '"+rs1.getString("EntDate")+"' order by Rdate desc"; 
							rs2=stmt2.executeQuery(sql2);
							if(rs2.next())
							{
							}
							else
							{	
								sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate = '"+rs1.getString("EntDate")+"' and Rtime > '"+time+"' order by Rdate desc"; 
								ResultSet rstime=stmt2.executeQuery(sql2);
								if(rstime.next())
								{
								}
								else
								{
						    	sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate > '"+rs1.getString("EntDate")+"'";
								rs3=stmt3.executeQuery(sql3);
								if(rs3.next())
								{
								}
								else
								{
									sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate = '"+rs1.getString("EntDate")+"' and InstTime > '"+time+"'";
									ResultSet rsreptime=stmt3.executeQuery(sql3);
									if(rsreptime.next())
									{
									}
									else
									{
									sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate > '"+rs1.getString("EntDate")+"'";
									rs4=stmt5.executeQuery(sql4);
									if(rs4.next())
									{
									}
									else
									{
										sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate = '"+rs1.getString("EntDate")+"' and EntTime > '"+time+"' ";
										ResultSet rsdtime=stmt5.executeQuery(sql4);
										if(rsdtime.next())
										{
										}
										else
										{
											sql5="Select * from allconnectedunits where UnitID='"+rs1.getString("OldUnitID").trim()+"' and TheDate >'"+rs1.getString("EntDate")+"' and VehNo <> '-' order by TheDate Desc ";
											rs5=stmt6.executeQuery(sql5);
											if(rs5.next())
											{
												
											}
											else
											{
												String newunit=rs1.getString("OldUnitID").trim();
												if(newunit.equals(present))
												{						
												}
												else
												{
													present=rs1.getString("OldUnitID");
												
													count++;
												}
											}
									}
									}
									}
								}
								}
							}
						}
		 sql66="select * from t_unitorder where Cust like '%"+transp+"%' and Status <> 'Open' order by ReqDate desc ";
		 rs66=stmt4.executeQuery(sql66);
		 while(rs66.next())
		 {
				String orderno=rs66.getString("Reqno");
				sql77="select * from t_unitmasterhistory where OrderNo='"+orderno+"' ";
				rs77=stmt7.executeQuery(sql77);
				while(rs77.next())
				{
					String received=rs77.getString("RecByCust");
					String tme=rs77.getString("EntTime");
					String z=new Integer(00).toString();
					if(tme==null)
					{
						tme=z;
					}
					else
					{}
					sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and NewUnitID='"+rs77.getString("UnitId")+"' and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
					rs88=stmt88.executeQuery(sql88);
					if(rs88.next())
					{}
					else
					{
						sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and NewUnitID='"+rs77.getString("UnitId")+"' and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
						rs88=stmt88.executeQuery(sql88);
						if(rs88.next())
						{}
						else
						{
							sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate > '"+rs77.getString("DispDate")+"' order by Rdate desc"; 
							rs10=stmt10.executeQuery(sql10);
							if(rs10.next())
							{}
							else
							{	
								sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate = '"+rs77.getString("DispDate")+"' and Rtime > '"+tme+"' order by Rdate desc"; 
								rs10=stmt10.executeQuery(sql10);
								if(rs10.next())
								{}
								else
								{
						    	sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate > '"+rs77.getString("DispDate")+"'";
								rs111=stmt111.executeQuery(sql111);
								if(rs111.next())
								{}
								else
								{
									sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate = '"+rs77.getString("DispDate")+"' and InstTime > '"+tme+"'";
									rs111=stmt111.executeQuery(sql111);
									if(rs111.next())
									{}
									else
									{
									sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate > '"+rs77.getString("DispDate")+"'";
									rs12=stmt5.executeQuery(sql12);
									if(rs12.next())
									{}
									else
									{
										sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and EntTime > '"+tme+"'";
										rs12=stmt5.executeQuery(sql12);
										if(rs12.next())
										{}
										else
										{
											sql13="Select * from allconnectedunits where UnitID='"+rs77.getString("UnitId").trim()+"' and TheDate >'"+rs77.getString("DispDate")+"' and VehNo <> '-' order by TheDate Desc ";
											rs13=stmt13.executeQuery(sql13);
											if(rs13.next())
											{}
											else
											{
												
												String newunit1=rs77.getString("UnitId").trim();
												if(newunit1.equals(present1))
												{}
												else
												{
													present1=rs77.getString("UnitId");
													count++;
												}
											}
										}
									}
									}
								}
								}
							}
						}
					}
				}
		 }
		totunits=totunits+count;
						%>
						<td><%=rsttrans.getString("OwnerName")%> </td>
						<td><div align='right'><a href='PendingUnits.jsp?holdername=<%=rsttrans.getString("OwnerName")%>'><%=totunits %></a></div></td>	
						<%
						i++;
						totcount=totcount+totunits;
					}
					%>
					<tr>
						<td></td>
						<td><b><font color='RED'>TOTAL UNITS</font></b></td>
						 <td><a href='pendingunitsreportexcel1.jsp?thename=<%=thename%>'><%=totcount %></td></a>
					</tr>
					</table>
				</td>
			</tr>
	<%
			}
			else
			{
				%>
				<tr>
				<td align="center"><font color="RED" size="2">ALL TECHNICIANS LIST. </font></td>
			</tr>
			<tr> 
				<td>
					<div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Technician To Know His Pending Units.</font> </marquee> </div>
				</td>
			</tr>	
			<tr>
				<td>
					<table border="1" width="50%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Technician Name</b></td>
						<td><b>Mobile Number</b></td>
						<td><b>Unit Count</b></td>
					</tr>
			<%
			sqltech="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
			ResultSet rsttech=sttech.executeQuery(sqltech);
			
			while(rsttech.next())
			{
				String techname=rsttech.getString("Techname");
				int count=0;
				int totunits=0;
				
			%>
				<tr>
					<td><div align="right"><%=i%></div></td>
					<%
						sql1="select * from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('tech','"+techname+"') and InstBy In ('"+techname+"' , '"+techname+" del') order by EntDate Desc";
						rs1=stmt1.executeQuery(sql1);
						while(rs1.next())
							{
							String time=rs1.getString("InstTime");
							String z=new Integer(00).toString();
							if(time==null)
							{
								time=z;
							}
							else
							{}
						sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate > '"+rs1.getString("EntDate")+"' order by Rdate desc"; 
						rs2=stmt2.executeQuery(sql2);
						if(rs2.next())
						{}
						else
						{	
							sql2="select * from t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate = '"+rs1.getString("EntDate")+"' and Rtime > '"+time+"' order by Rdate desc"; 
             				ResultSet rstime=stmt2.executeQuery(sql2);
			            	if(rstime.next())
				              {}
			                else
				             {
			                  sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate > '"+rs1.getString("EntDate")+"'";
				              rs3=stmt3.executeQuery(sql3);
                				if(rs3.next())
			                	{}
								else
				                 {	
					              sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate = '"+rs1.getString("EntDate")+"' and InstTime > '"+time+"'";
					              ResultSet rsreptime=stmt3.executeQuery(sql3);
								 if(rsreptime.next())
					              {}
									else
					                  {
										sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate > '"+rs1.getString("EntDate")+"'";
										rs4=stmt5.executeQuery(sql4);
                    					if(rs4.next())
					                     {}
			                        		else
				                              	{
												sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate = '"+rs1.getString("EntDate")+"' and EntTime > '"+time+"' ";
												ResultSet rsdtime=stmt5.executeQuery(sql4);
												if(rsdtime.next())
					                         	{}
						                          else
						                             {
					                            		sql5="Select * from allconnectedunits where UnitID='"+rs1.getString("OldUnitID").trim()+"' and TheDate >'"+rs1.getString("EntDate")+"' and  VehNo <> '-' order by TheDate Desc ";
					                            		rs5=stmt6.executeQuery(sql5);
														if(rs5.next())
															{}
															else
																{
																
																String newunit=rs1.getString("OldUnitID").trim();
																if(newunit.equals(present))
																{						
																}
																else
																{
																	present=rs1.getString("OldUnitID");
								                                 	count++;
																}
																}
						                             }
				                              	}
					                  }
				                 }
				             }
						}
							}
		 sql66="select * from t_unitorder where Tech like '"+techname+"' and Status <> 'Open' order by ReqDate desc ";
		 rs66=stmt4.executeQuery(sql66);
		 	
		 while(rs66.next())
		 {
				String orderno=rs66.getString("Reqno");
				sql77="select * from t_unitmasterhistory where OrderNo='"+orderno+"' ";
				rs77=stmt7.executeQuery(sql77);
				
				while(rs77.next())
				{
					String received=rs77.getString("RecByCust");
					String tme=rs77.getString("EntTime");
					String z=new Integer(00).toString();
					if(tme==null)
					{
						tme=z;
					}
					else
					{}
					sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and NewUnitID='"+rs77.getString("UnitId")+"' and InstBy In ('"+techname+"' , '"+techname+" del') order by EntDate Desc";
					rs88=stmt88.executeQuery(sql88);
					if(rs88.next())
					{}
					else
					{
						sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and NewUnitID='"+rs77.getString("UnitId")+"' and InstBy In ('"+techname+"' , '"+techname+" del') order by EntDate Desc";
						ResultSet reurep=stmt88.executeQuery(sql88);
						if(reurep.next())
						{}
						else
						{
							sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate > '"+rs77.getString("DispDate")+"' order by Rdate desc"; 
							rs10=stmt10.executeQuery(sql10);
							if(rs10.next())
							{}
							else
							{
								sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate = '"+rs77.getString("DispDate")+"' and Rtime > '"+tme+"' order by Rdate desc"; 
								ResultSet rsurcv=stmt10.executeQuery(sql10);
								if(rsurcv.next())
								{}
								else
								{	
								sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate > '"+rs77.getString("DispDate")+"'";
								rs111=stmt111.executeQuery(sql111);
								if(rs111.next())
								{}
								else
								{
									sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate = '"+rs77.getString("DispDate")+"' and InstTime > '"+tme+"' ";
									ResultSet rsurep=stmt111.executeQuery(sql111);
									if(rsurep.next())
									{}
									else
									{
									sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate > '"+rs77.getString("DispDate")+"'";
									rs12=stmt5.executeQuery(sql12);
									if(rs12.next())
									{}
									else
									{
										sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and EntTime > '"+tme+"'";
										ResultSet rsumh=stmt5.executeQuery(sql12);
										if(rsumh.next())
										{}
										else
										{
											sql13="Select * from allconnectedunits where UnitID='"+rs77.getString("UnitId").trim()+"' and TheDate >'"+rs77.getString("DispDate")+"' and VehNo <> '-'order by TheDate Desc ";
											rs13=stmt13.executeQuery(sql13);
											if(rs13.next())
											{}
											else
											{
												
												String newunit1=rs77.getString("UnitId").trim();
												if(newunit1.equals(present1))
												{}
												else
												{
													present1=rs77.getString("UnitId");
													count++;
												}
											}
										}
									}
									}
								}
								}
							}
						}
					}
					}
				}
								totunits=totunits+count;
						%>
					<td><%=rsttech.getString("TechName")%> </td>
					<td><div align="right"><%=rsttech.getString("MobNo")%></div></td>
					<td><div align='right'><a href='unitholdbytech1.jsp?holdername=<%=rsttech.getString("TechName")%>'><%=totunits %></a></div></td>	
						<%
						i++;
						totcount=totcount+totunits;
					}
					%>
					<tr>
						<td></td>
						<td><b><font color='RED'>TOTAL UNITS</font></b></td>
						<td></td>
						<td><div align='right'><%=totcount %></div></td>
					</tr>
					</table>
				</td>
			</tr>
			<%	
			}
		}
		else
		{
			%>
			</table>
				</td>
			</tr>
			 
			<tr>
				<td align="center"><font color="brown" size="3">ALL TRANSPORTERS LIST. </font></td>
			</tr>
			<tr> 
				<td>
					<div align="right"> <marquee> <font color="RED"><b><i>Note:</i></b>Click On Transporter To Know Pending UNits.</font> </marquee> </div>
				</td>
			</tr>	
			<tr>
				<td>
					<table border="1" width="100%" align="center" class="sortable">
					<tr>
						<td><b>Sr.</b></td>
						<td><b>Transporter</b></td>
					</tr>
					</table>
				</td>
			</tr>
		<%
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
