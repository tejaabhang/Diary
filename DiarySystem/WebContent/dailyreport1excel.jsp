<%@ page contentType="application/vnd.ms-excel;" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Dailyreport1.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%!Connection conn, conn1;
	Statement st, st1, st2, st3, st33, st4, st5, st6, st7, st8, st9, st10,
			st11, st51, stInspection;
	String sql, sql1, sql2, today, olddate, username, userrole, thename, sql3,
			sql33, sql4, sql5, sql6, sql7, sql8, sql9, sql10;
	String fromdate, todate,totalas="",tto="";
	int Ocount, Icount, CAcount, CAvcount = 0, CScount,CSrepcount, CPcount, URcount,
			NIcount, OCcount, ICcount, NCcount, RCAcount, SPcount, inspcount,
			realtcount, cstcount, cstcmpcount,URrepcount,IStrcstcount,IStrrepcount,CSrealctncount,CSpendtrcount,SPrepcount,CSreptrcount,NIrepcount,CAvehcount,RCAvehcount,CSrep1count,CSrep2count,CPndcount,realtrepcount,ISrepcount,ISrep1count;
	double avgdurtn;
	float SPcptpercount =0.0f,SPcptbillcount = 0.0f;
	double avg,aks;
	String ak= "";
	%>
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
Ocount=0;
Icount=0;
CAcount=0;
int CINcount=0;
CAvcount=0;
CScount=0;
CSrepcount=0;
CPcount=0;
URcount=0;
CSreptrcount =0;
CAvehcount =0;
CSpendtrcount= 0;
CSrealctncount =0;
IStrrepcount = 0;
NIcount=0;
NIrepcount=0;
IStrcstcount = 0;
OCcount=0;
ICcount=0;
SPrepcount=0;
URrepcount=0;
NCcount=0;
CSrep1count=0;
CSrep2count=0;
CPndcount=0;
RCAcount=0;
realtrepcount=0;
ISrepcount=0;
ISrep1count=0;
inspcount=0;
RCAvehcount=0;
realtcount=0;
cstcount=0;
cstcmpcount=0;
avgdurtn=0.00;
avg=0.00;
aks = 0.00;
int IScount=0,totalsec =0;
SPcount=0;
int CTCcount=0;
int CTcount=0;
String loop="";
float  monthdays=0.0f;
float  monthdays1=0.0f;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st33=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn.createStatement();
	st6=conn.createStatement();
	st7=conn.createStatement();
	st8=conn.createStatement();
	st9=conn1.createStatement();
	st10=conn1.createStatement();
	st11=conn.createStatement();
	st51=conn.createStatement();
	stInspection = conn.createStatement();
	//st51=conn.createStatement();
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	thename=request.getParameter("thename");
	loop=request.getParameter("loop");
	System.out.println("loop---->"+loop);
	System.out.println("fromdate---->"+fromdate);
	System.out.println("todate---->"+todate);
	if(null==fromdate)
	{
	fromdate=today;
	todate=today;
	thename="Technician";
	}
	%>
			<table border="0" width="750px" align="center">
				<tr>
				<td>
				<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				<tr>
				<td>
				<input type="radio" name="radio1" value="Technician" <% if(thename.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun2();" >Technician
				<input type="radio" name="radio1" value="Representative" <% if(thename.equals("Representative")) { out.print("CHECKED"); } %> onclick="fun2();">Representative
				<input type="radio" name="radio1" value="Transporter" <% if(thename.equals("Transporter")) { out.print("CHECKED"); } %> onclick="fun2();">Transporter				
								
				</td>
				<td name="trigger" id="trigger" value="From Date" class="formElement"> From Date:&nbsp; 
             <input type="text" id="calender" name="calender" size="08" class="formElement" value="<%=fromdate%>" readonly/>
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></td>
				<td name="trigger1" id="trigger1" value="To Date" class="formElement"> ToDate:&nbsp;
				<input type="text" id="calender1" name="calender1" size="08" class="formElement" value="<%=todate%>" readonly/>
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="dailyreport1excel.jsp?thename=<%=thename%>&calender=<%=fromdate %>&calender1=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
				
				</tr>
								
				</table>	
				</form>	
						
				</td>
				</tr>
				<tr>
				<td>
				<%
						
					if(!(null==thename))
					{
					if(thename.equals("Technician"))
					{System.out.println("loop-of tech--->");
					
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Solved without Replacement </td>
					<td>Comp. Pending</td>
					<td>Inspection</td>
					<td>Reallocation</td>
					<td>Cost of Complaint</td>
					<td>Cost of Inspection</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					<td>Special Report</td>
					<td>Avg Closure Duration</td> 
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					String tech="";
					while(rst.next())
					{
						tech=rst.getString("TechName");
						System.out.println("tech---->"+tech);
					%>
					<tr>
					<td align ="right"><div align="right"><%=i%></div></td>
					<td align ="left"><%=rst.getString("TechName")%></td>
					<td align ="right"><div align="right"><%=rst.getString("MobNo")%></div></td>
					<td align ="right"><div align="right">
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst1=st1.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(rst1.next())
					{
					if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td align ="right">
					<div align="right">
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst2=st1.executeQuery(sql);
					System.out.println("sql-11--->" +  sql);
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>	
					</div>					
					</td>
					<td align ="right">
					<div align="right">
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"'   and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'  and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  )  ";
					ResultSet rst3=st1.executeQuery(sql);	
					System.out.println("sql--22-->" +  sql);
					int cntcomp=0;
					while(rst3.next())
					{
						cntcomp=cntcomp+rst3.getInt("count");
					
					}
					
					System.out.println("cntcomp ---->"+cntcomp);
						if(cntcomp >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cntcomp+"</a>");
					CAcount=CAcount+cntcomp;
					}
					else
					{
					out.print("0");
					}
									
					%>	
					</div>				
					</td>
					<td align ="right">
					<div align="right">
		<!-- change -->	
					<%
					sql33="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ";
					ResultSet rst33=st1.executeQuery(sql33);	
					int vhavail=0;
					while(rst33.next())
					{
						vhavail=vhavail+rst33.getInt("count");
					
					}
					System.out.println("vhavail ---->"+vhavail);
					
					if(vhavail >0)
					{
					out.print("<a href='vehavail.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+vhavail+"</a>");
					CAvcount=CAvcount+vhavail;
					}
					else
					{
					out.print("0");
					}			
					%>	
					</div>				
					</td>
					<td align ="right">
					<div align="right">
					
			<!-- change -->	
			
			
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ";
					ResultSet rst4=st1.executeQuery(sql);
					
					System.out.println("sql--44-->" +  sql);
					int csol=0;
					while(rst4.next())
					{
						csol=csol+rst4.getInt("count");
					}	
						if(csol >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+csol+"</a>");
					CScount=CScount+csol;
					}
					else
					{
					out.print("0");
					}
								
					%>	
					</div>
					</td>
					<td align ="right">
					<div align="right">
					<%
					sql="SELECT count( * ) AS count FROM ( SELECT DISTINCT (Tno), DofAllocation, Technicion, VehRegNo,STATUS , ActualProb FROM db_CustomerComplaints.t_callocation1 WHERE Technicion = '"+rst.getString("TechName")+"' AND ActualProb <> 'Unit Replace, Okay' AND VehAvailDate >= '"+fromdate+"' AND VehAvailDate <= '"+todate+"' AND STATUS = 'Solved' 	AND tno IN (SELECT tno FROM db_CustomerComplaints.t_complaints1  WHERE TdyDate 	BETWEEN '"+fromdate+"' AND '"+todate+"' 	AND inspection = 'No'  )GROUP BY Tno )a ";
					ResultSet rst41=st1.executeQuery(sql);	
					System.out.println("sql--55-->" +  sql);
					int csolrep=0;
					while(rst41.next())
					{
						csolrep=csolrep+rst41.getInt("count");
						
						
					}	
						
					System.out.println("csolrep ---->"+csolrep);
					if(csolrep >0)
					{
						loop="lp6";	
					out.print("<a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+csolrep+"</a>");
					CSrepcount=CSrepcount+csolrep;
					}
					else
					{
					out.print("0");
					}
					
					%>	
					</div>
					</td>
					
					
					<td align ="right">
					<div align="right">
					
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  ) ";
					ResultSet rst44=st1.executeQuery(sql);	
					int cpend=0;
					while(rst44.next())
					{
						cpend=cpend+rst44.getInt("count");
					}	
						
					System.out.println("cpend ---->"+cpend);
					if(cpend >0)
					{
					out.print("<a href='cpending.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cpend+"</a>");
					CPcount=CPcount+cpend;
					}
					else
					{
					out.print("0");
					}		
					%>	
					</div>
					</td>
					<td align ="right">
					<div align="right">
					<%	
					sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion='"+rst.getString("TechName")+"'  order by DofAllocation  ";
					ResultSet Insp=st1.executeQuery(sql);
					System.out.println("sql-77-->" +  sql);
					String tk ="";
					String tech11="";
					
					int cnt=0;
					int count=0;
					while(Insp.next()){
						tk=Insp.getString("Tno");
						
													
					sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno ='"+tk+"'  ";
					ResultSet rstInsp=stInspection.executeQuery(sql);
					System.out.println("sql--771-->" +  sql);
					//System.out.println("token---->" +token11[a]);
					
					//System.out.println("aaaaaaa---->" +a);
					
					System.out.println("sql---->" +  sql);
					if(rstInsp.next()){
						cnt++;
						System.out.println("count OF INSPPPPPPP---->" +cnt);	
						//cnt++;
						
						System.out.println("count OF INSPPPPPPP---IIIIIII1245454->" +cnt);	
					
					}
					}
					System.out.println("count OF INSPPPPPPP---IIIIIII155555555->" +cnt);	
						
					//System.out.println("cnt---4444444->"+cnt);
				//System.out.println("token---->" +token);
				if(cnt >0)
					{System.out.println("cnt--->>>>->" +cnt);
						loop="lp1";	
						out.print("<a href='reinspection.jsp?loop="+loop+"&tech11="+tech11+"&tk="+tk+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+cnt+"</a>");
							inspcount=inspcount+cnt;
							System.out.println("loop---->" +  loop);
					}else
					{
							out.print("0");
					}		%>
					</div>		
					</td>
					<td align ="right">
					<div align="right">
					<%					
					sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  NewTechnician='"+rst.getString("TechName")+"'  ";
					ResultSet realctn=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(realctn.next())
					{System.out.println("inside if of lp2---->");
					if(realctn.getInt("count") >0)
					{System.out.println("inside if of count  lp2---->");
						loop="lp2";	
						System.out.println("loop---->" +  loop);
						out.print("<a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+realctn.getString("count")+"</a>");
						System.out.println("loop-22--->" +  loop);	
						realtcount=realtcount+realctn.getInt("count");	
							System.out.println("loop---->" +  loop);
							
					}
					else
					{
							out.print(realctn.getString("count"));
					}
					}	
					%>
					</div>		
					</td>
					<td align="right">
					
					<div align="right">
					<%					
					sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion='"+rst.getString("TechName")+"' order by DofAllocation  ";
					ResultSet Inspct=st1.executeQuery(sql);
					System.out.println("sql-99--->" +  sql);
					String tk1 =""; 
					
					int cmpct=0;
					while(Inspct.next())
					{
						tk1=Inspct.getString("Tno");
						
						/**
						if(tk1=="")
					  {
						  tk1=Inspct.getString("Tno");
					  }
					  else
					  {
						
						tk1 =tk1+","+Inspct.getString("Tno");
					System.out.println("inside if of lp1---->");
					
					  }
					  System.out.println("tk---->"+tk1);
					  
					**/
					
					
					
					
					//int p=1;
					
						
						
					
					
					
					
					
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  and Tno = '"+tk1+"' ";
					ResultSet rstInsp1=stInspection.executeQuery(sql);
					System.out.println("sql-991--->" +  sql);
					//System.out.println("token---->" +token12[a]);
					
					//System.out.println("aaaaaaa---->" +a);
					
					System.out.println("sql---->" +  sql);
					if(rstInsp1.next()){
					
						cmpct=cmpct+rstInsp1.getInt("count");
						
						
						
						
					}
					
					}
					
					
					
					//System.out.println("cnt---4444444->"+cnt1);
				//System.out.println("token---->" +token);
				if(cmpct >0)
					{//System.out.println("cnt--->>>>->" +cnt1);
						loop="lp3";	
						out.print("<a href='reinspection.jsp?loop="+loop+"&tk1="+tk1+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+cmpct+"</a>");
						cstcmpcount=cstcmpcount+cmpct;
							System.out.println("loop---->" +  loop);
					}else
					{
							out.print("0");
					}		%>
					</div>		
					</td>
					<td align ="right">
					<div align="right">
					<%					
					sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ";
					ResultSet Inspcst=st1.executeQuery(sql);
					System.out.println("sql---111->" +  sql);
					String token2 =""; 
					int	ct=0;
					int cnt2=0;
					System.out.println("sql---->" +  sql);
					while(Inspcst.next()){
						
						token2 =Inspcst.getString("Tno");
						/**
						if(token2==""){
						token2 =Inspcst.getString("Tno");
					
						}else{
							token2=token2+","+Inspcst.getString("Tno");
							
						}
					
					**/
					
					
						System.out.println("token2-outside--->"+token2);
						token2=token2.replace(" ","");
						
						
						
						
							
							//token11=token11.split(",");
						
							
							
							
							
							
				
								
					sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno = '"+token2+"' ";
					ResultSet cstinsp=stInspection.executeQuery(sql);
					System.out.println("sql--111b-->" +  sql);
					int a4;
					if(cstinsp.next())
					{ //  for(a4=0;a4<token22.length;a4++) 
					
						System.out.println("sql-WWWWWWWWWWWWWWW--->");
						
							ct=ct+cstinsp.getInt("count");
							System.out.println("ct--inside-->" +ct);
					
							//ct++;
						
					
						
							
							}
						
							
							
					}
						
						
						
						
						
						//String[] tokenz=ct.split(",");
						//int[] token =tokenz.Pa;
						//System.out.println("tokenz---->" +  tokenz);
					//	int ct1=(String)ct;
					//	String a="";
						
						//String q="";
						//int r=0;
						//int m=0;
						//if(m<tokenz.length)
						//{
						//q=tokenz[r]+tokenz[r++];
							
						//}
						System.out.println("ct->>>>>>>>@@@@$$$$$$$$$$-->"+ct);
					/**	
						System.out.println("inside if of lp3---->");
					String xz=cstinsp.getString("count");					
                    int ab1=0;
					if(xz==null || xz.contains("null") || xz.equalsIgnoreCase("null")){
						 
						 ab1=0;
						 
						 }else{
							 ab1= cstinsp.getInt("count");		
						 }
					
					**/
				
					if(ct >0)
					{
						loop="lp4";		
						out.print("<a href='reinspection.jsp?loop="+loop+"&token2="+token2+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"' >"+ct+"</a>");
							cstcount=cstcount+ct;
							System.out.println("loop---->" +  loop);
					}
					else
					{
						out.print("0");
					}					%>
					</div>		
					</td>	
					<td align ="right">
					<div align="right">
					
					
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
					ResultSet rst5=st2.executeQuery(sql);
					System.out.println("sql---222->" +  sql);
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
					<td align ="right">
					<div align="right">
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
					ResultSet rst6=st2.executeQuery(sql);
					System.out.println("sql---333->" +  sql);
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>		
					</div>				
					</td>	
					<td align ="right">
					<%					
					sql="select count(*) as count from t_specialreports where Technician='"+rst.getString("TechName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
					ResultSet rst7=st1.executeQuery(sql);
					System.out.println("sql---444->" +  sql);
					if(rst7.next())
					{
						if(rst7.getInt("count")>0)
						{
						out.print("<div align='right'><a href='viewspecialreport.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst7.getInt("count")+"</a></div>");
						SPcount=SPcount+rst7.getInt("count");
						}
						else
						{
							out.print("<div align='right'>0</div>");
						}
					}
					%>
					</td>
																									
					<td align ="right">
					<div align="right"> 
					<%					
										
					//sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ";
					//ResultSet Inspavg=st1.executeQuery(sql);
					
					
					//String tk13 =""; 
					//System.out.println("sql--og AVGGGGGGGGG-->" +  sql);
					
					
					
					
					
					
					
					//System.out.println("sql---->" +  sql);
					//String token3 =""; 
					double ab1=0.00;
					double abc=0.00;
					double ab=0.00;
					double ak=0.00;
						//ab1=Inspavg.getDouble("count");
						//tk13=Inspavg.getString("Tno");
						
						//if(tk13==""){
							//tk13=Inspavg.getString("Tno");
							
						//}else{
							//tk13=tk13+","+Inspavg.getString("Tno");
							
										
						
						//}
							
										
					
							
					String xz="",xz1="";	
							
					System.out.println("UP TO HEREEEEEEEEEE---->" );	
							
															
					sql="select avg( time_to_sec( DurationOfClosure ) )  as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and  inspection='No'  and tno in (select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+rst.getString("TechName")+"'  order by DofAllocation ) ";
					ResultSet avgdur=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					String s="",s1="",chk ="";
					int cntt =0;
					int sec =0;
					int hrs=0;
					int min =0;
					while(avgdur.next())
					{
						
						
						System.out.println("INSIDE RESULT SETTTTTT---->" );
						totalsec= totalsec +avgdur.getInt("count");
						sec=sec+avgdur.getInt("count");
						//abc=abc+avgdur.getDouble("count");
						
						xz=avgdur.getString("count");
						
					}	
						// xz=avgdur.getString("count");
						
						System.out.println("xz--11111-->"+xz);
						System.out.println("sec--11111-->"+sec);
						
						
						if(xz==null)
						{
							chk="00:00";
							
						}else{
						
						if(sec > 3600)
						{
							hrs=sec/(60 * 60);
							min = sec % 60;
						chk =""+hrs+""+":"+" "+min+" ";	
							
						}else
						{
							
							min = sec / 60;
							chk ="00"+":"+" "+min+" ";		
							
						}
						
						}	
						// System.out.println("abc >>> >>>>>"+abc); 
						
					
						
						
						//abc=abc * 100;
						//double xtrunc=(int)(abc * 100 ); 
						//double xtrunc1=		(Math.(abc*100))/100.0;
                      
						
						
						
						
						//xz=xz.replace(" ","");
						
						//xz1=xz.split(",");
						System.out.println("xz >>>>>"+xz); 
						NumberFormat nfrating=NumberFormat.getInstance();
						nfrating.setMaximumFractionDigits(4);
						nfrating.setMinimumFractionDigits(2);                   
						 //DecimalFormat df = new DecimalFormat("#.##");
						   // df.format(abc);
						   // System.out.println("abc >>>>>"+abc); 
						       //double ab=0.00;
						      //  ab= Double.parseDouble(nfrating.format(abc));
						
						
							 
							 System.out.println("inside else loop >>>>>"); 
					
						//if(xz==null){
							//System.out.println("Null Loop &&&$$$$$$$$$$$$ >>>>>"); 
						//}else{ 
							// System.out.println("HIIIIII>>>>>>>>>>-->"+xz.length() ); 
							
							//if(xz.length()>4){
						      // chk=xz.substring(0,5);
						 
						       //cntt++;
						 
							//}
						 System.out.println("chk >>>>>"+chk);
						/**
						 if(xz.length() > 4){
						  s=xz.substring(xz.indexOf("."),xz.indexOf(".")+3);
						 System.out.println("s. >>>>>"+s);
						 }
						 if(xz.length() > 3){ 
						 s1=xz.substring(xz.indexOf("."),xz.indexOf(".")+2);
						 
						 System.out.println("s1. >>>>>"+s1);
						 
						 }
						 **/
						 String chk2="";
						/**
						 if(s.equalsIgnoreCase(".000") || s.contains(".000") || s==".000"){
							 System.out.println("inside if of 0 >>>>>");
							 chk2=xz.substring((xz.indexOf(".")+4),(xz.indexOf(".")+6));
							System.out.println("chk2. >>>>>"+chk2);
						 
						 }else if(s.equalsIgnoreCase(".00")){
							 System.out.println("inside if of 0 >>>>>");
							 chk2=xz.substring((xz.indexOf(".")+3),(xz.indexOf(".")+5));
							System.out.println("chk2. >>>>>"+chk2);
						}else if(s1.equalsIgnoreCase(".0")){
							System.out.println("inside else if of 0 >>>>>");
							 chk2=xz.substring((xz.indexOf(".")+2),(xz.indexOf(".")+4));
							System.out.println("chk2. >>>>>"+chk2);
							
						}else{
							 System.out.println("inside else of 0 >>>>>");
							 chk2=xz.substring((xz.indexOf(".")+1),(xz.indexOf(".")+2));
							System.out.println("chk2. >>>>>"+chk2);
							
						}
						 
						chk2=chk+chk2;
						**/
						//System.out.println("chk2. new>>>>>"+chk2);
						 //DecimalFormat dc=new DecimalFormat("0.00");
						//dc.format(abc);
						
						//ab1= Double.parseDouble(chk);
						//System.out.println("ab1. >>>>>"+ab1);
						System.out.println("inside if of avg>>>>>");
						//}else{
						
						//ab1= Double.parseDouble(xz);
						System.out.println("ab1. >>>>>"+ab1);
						//}
							 NumberFormat nfrating1=NumberFormat.getInstance();
								nfrating1.setMaximumFractionDigits(2);
								nfrating1.setMinimumFractionDigits(2);  
								
							       //ab= ab+Double.parseDouble(nfrating.format(ab1));
					
					
					
					
						
					
					
					
						
					
					sql="select count(TechName) as tech from t_techlist where Available='Yes' ";
					ResultSet total=st1.executeQuery(sql);
					System.out.println("sql--total count-->" +  sql);
					String tot="",tl="";
					int ctl =0;
					while(total.next()){
						ctl= ctl+total.getInt("tech");
						
						
					}
					//tl=tot.split(",");
					System.out.println("ctl>*******8>1111>>"+ctl);
					try
                    {
                            StringTokenizer str=new StringTokenizer(xz,":");
         while(str.hasMoreTokens())
         {
             String test=str.nextToken();
             String test1=str.nextToken();
             xz=test+"."+test1;
             String test2=str.nextToken();
         }
        // ak=ak+Double.valueOf(xz.trim()).doubleValue();


                    }
                    catch(Exception e)
                    {
                            System.out.println(">>>>>>>exception:"+e);
                    }



					
					System.out.println("OUTSIDE OF ALL >>>>>"+ab1);
					
					ak=totalsec/ctl;
					//ak =ak/(60 * 60);
					
					sql5="select sec_to_time('"+ak+"')  ";
					ResultSet tot1=stInspection.executeQuery(sql5);
					System.out.println("sql--conversion -->" +  sql5);
					if(tot1.next())
					{
						
						totalas=tot1.getString(1);
						
					}
					
					
					//if(totalas==null){
						//totalas ="00:00";
						
					System.out.println("totalas &&&$$$$$$$$$$$$ >>>>>"+totalas); 
				//}else{ 
					 //System.out.println("HIIIIII>>>>>>>>>>-->"+xz.length() ); 
					
					if(totalas.length()>4){
						tto=totalas.substring(0,5);
				 
				      // cntt++;
				 
					}
				//}
					
					
					System.out.println("abc >>>>>>>>>>>>>"+abc);
					System.out.println("TOtal SEC--11111-->"+ totalsec);
					
							
					if(xz !=null )
					{System.out.println("inside ab1 of count if loop avg>>>>>");
						loop="lp5";
						cntt++;
						System.out.println("cntt>>>2222>>"+cntt);
						System.out.println("inside if of count loop avg>>>>>");
						 System.out.println("chk >>>>>"+chk);	
						out.print("<div align='right'><a href='reinspection.jsp?loop="+loop+"&tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+chk+"</a></div>");
							//avgdurtn=avgdurtn+aks;
							//avgdurtn=avgdurtn/ctl;
							NumberFormat nfrating2=NumberFormat.getInstance();
							nfrating2.setMaximumFractionDigits(3);
							nfrating2.setMinimumFractionDigits(2); 
							avg= Double.parseDouble(nfrating2.format(avgdurtn));
							
							//DecimalFormat df = new DecimalFormat("##.##");
							//avg= Double.parseDouble(df.format(avgdurtn));
							System.out.println("loop---->" +  loop);
					}
					else
					{System.out.println("inside ab1 of count else loop avg>>>>>");
							out.print("00:00");
					}
					
					
					
						%>                      
					</div> 		
					</td>				
					</tr>
					<%	
					i++;		
					}				
					String a="",b="",c="",d="",e="",f="";
					a="ab1";
					b="ab2";
				c="ab3";
					d="ab4";
					e="ab5";
					f="ab6";
					
					%>		
				<!-- 	</table>
					<table border="1" width="750px" align="center" class="sortable">
				 -->
					
					<tr>
					<td></td>
					<td></td>
					<td> <font color="red"><b>Total</b></font></td>
					
					<td align="right"><font color="red"><b><div align="right"><a href="techoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=Ocount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=Icount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CAcount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techvehavail.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CAvcount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techcompsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CScount%></a></div></b></font></td>
					<td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=f%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CSrepcount%></b></font></a></div></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techcomppending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=CPcount%></a></div></b></font></td>
					<td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=a%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=inspcount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=b%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=realtcount%></b></font></a></div></td>					
					<td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=d%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=cstcmpcount%></b></font></a></div></td>					
					<td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=c%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=cstcount%></b></font></a></div></td>					
					<td align="right"><font color="red"><b><div align="right"><a href="techunitrep.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=URcount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="technewinstall.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=NIcount%></a></div></b></font></td>
					<td align="right"><font color="red"><b><div align="right"><a href="techspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><%=SPcount%></a></div></b></font></td>
				   <td align="right"><div align="right"><a href="reinspectionexcel.jsp?loop=<%=e%>&tech=<%=tech%>&fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=tto%></b></font></a></div></td> 															
					</tr>					
					</table>	
					<%		
					}
					else if(thename.equals("Representative"))
					{
					%>
					<div align="center"><font color="brown" size="2">Representative  Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<tr>
					<td>Sr.</td>
					<td>Name</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Not Called</td>
					<td>Call Transfer</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Solved without Replace </td>
					<td>Comp. Pending</td>
					<td>Inspection</td>
					<td>Reallocation</td>
					<td>Cost of Complaint</td>
					<td>Cost of Inspection</td>
				  	<td>Unit Replaced</td>  
					<td>New Installation</td>
					<td>Special Report</td>  
					</tr>				
					<%
					sql="select distinct(Name) from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes' ";
					ResultSet rst7=st.executeQuery(sql);
					int i=1;
					while(rst7.next())
					{
					%>
					<tr>					
						<td align="right" width="5%"><div align="right"><%=i%></div></td>
						<td align="left" width="20%"><%=rst7.getString("Name")%></td>
						<td align="right" width="25%"><div align="right">
						<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
						ResultSet rst8=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst8.next())
						{
						if(rst8.getInt("count") >0)
						{
								out.print("<a href='repoutgoing.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst8.getString("count")+"</a>");
								OCcount=OCcount+rst8.getInt("count");						
						}
						else
						{
								out.print(rst8.getString("count"));
						}
						}				
						%>	
						</div>						
						</td>
						<td align="right" width="25%"><div align="right">
						<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
						ResultSet rst9=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst9.next())
						{
						if(rst9.getInt("count") >0)
						{
								out.print("<a href='repincoming.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst9.getString("count")+"</a>");
								ICcount=ICcount+rst9.getInt("count");						
						}
						else
						{
								out.print(rst9.getString("count"));
						}
						}				
						%>	
						</div>						
						</td>

		<td align="right" width="25%"><div align="right">
			<%
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='NotCalled'";
						ResultSet rst11=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst11.next())
						{
						if(rst11.getInt("count") >0)
						{
								out.print("<a href='repnotcalled.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst11.getString("count")+"</a>");
								NCcount=NCcount+rst11.getInt("count");						
						}
						else
						{
								out.print(rst11.getString("count"));
						}
						}				
						%>
		</div>
		</td>	
		<td align="right" width="25%"><div align="right">
			<%
					
						sql="select count(*) as count from t_callinformation where Caller='"+rst7.getString("Name")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='Call Transfer'";
						ResultSet rst111=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst111.next())
						{
						if(rst111.getInt("count") >0)
						{
								out.print("<a href='repcalltransfer.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst111.getString("count")+"</a>");
								CTcount=CTcount+rst111.getInt("count");						
						}
						else
						{
								out.print(rst111.getString("count"));
						}
						}				
						%>
		</div>
		</td>
						<td align="right" width="25%"><div align="right">
						
						
						
						
						<%
						sql="select count(*) as count from t_callocation1 where  DOfAllocation >='"+fromdate+"' and DOfAllocation <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No' )";
						ResultSet rst10=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						int call =0;
						while(rst10.next())
						{
							call=call+rst10.getInt("count");
							
							
						}
						System.out.println("call--Rep-->" +  call);
							if(call >0)
						{
								out.print("<a href='repcallocated.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+call+"</a>");
								RCAcount=RCAcount+call;						
						}
						else
						{
								out.print("0");
						}
										
						%>
						</div>							
						</td>
						
						<td align="right" width="25%"><div align="right">
						
						
						
						
						<%
						sql="select count(*) as count from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No' )";
						
						ResultSet rst17=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						int veh =0;
						while(rst17.next())
						{
							veh=veh+rst17.getInt("count");
						
						}
						
						System.out.println("veh--Rep-->" +veh);
							if(veh  >0)
						{
								out.print("<a href='repvehavail.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+veh+"</a>");
								RCAvehcount=RCAvehcount+veh;						
						}
						else
						{
								out.print("0");
						}
									
						%>
						</div>							
						</td>
						
						
						<td align="right">
					<div align="right">
					
			
			
			
					<%
					sql="select count(*) as count from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No') ";
					ResultSet rst4=st1.executeQuery(sql);	
					System.out.println("sql---->" +  sql);
					int csol=0;
					while(rst4.next())
					{
						csol=csol+rst4.getInt("count");
						
						
					}	
						
					System.out.println("csol ---->"+csol);
					if(csol >0)
					{
					out.print("<a href='repsolved.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+csol+"</a>");
					CSrep1count=CSrep1count+csol;
					}
					else
					{
					out.print("0");
					}
									
					%>	
					</div>
					</td>
						
						<td align="right">
					<div align="right">
					
			
			
			
					<%
					sql="select count(*) as count from t_callocation1 where  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No') ";
					ResultSet rst41=st1.executeQuery(sql);	
					System.out.println("sql---->" +  sql);
					int csolrep=0;
					while(rst41.next())
					{
						csolrep=csolrep+rst41.getInt("count");
						
						
					}	
						
					System.out.println("csolrep ---->"+csolrep);
					if(csolrep >0)
					{
						loop="lp7";	
					out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&repname="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+csolrep+"</a>");
					CSrep2count=CSrep2count+csolrep;
					}
					else
					{
					out.print("0");
					}
									
					%>	
					</div>
					</td>
						
						<td align="right">
					<div align="right">
					
					<%
					sql="select count(*) as count from t_callocation1 where  VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+rst7.getString("Name")+"' and inspection='No') ";
					ResultSet rst44=st1.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(rst44.next())
					{
					if(rst44.getInt("count") >0)
					{
					out.print("<a href='rep_pending.jsp?regby="+rst7.getString("Name")+"&repndg="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst44.getString("count")+"</a>");
					CPndcount=CPndcount+rst44.getInt("count");
					}
					else
					{
					out.print(rst44.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
						
						
						
						
						
						<td align="right" width="25%"><div align="right">
						
						
						
						
						<%
						sql="select count(*) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rst110=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rst110.next())
						{
						if(rst110.getInt("count") >0)
						{
								out.print("<a href='repinsection.jsp?rep="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"' >"+rst110.getString("count")+"</a>");
								IScount=IScount+rst110.getInt("count");						
						}
						else
						{
								out.print(rst110.getString("count"));
						}
						}				
						%>
						</div>							
						</td>
						<td align="right"> 
					<div align="right">
					<%					
					sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	AllocatedBy ='"+rst7.getString("Name")+"'  ";
					ResultSet realctn=stInspection.executeQuery(sql);
					System.out.println("sql---->" +  sql);
					if(realctn.next())
					{System.out.println("inside if of lp2---->");
					if(realctn.getInt("count") >0)
					{System.out.println("inside if of count  lp2---->");
						loop="lp8";	
						System.out.println("loop---->" +  loop);
						out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+realctn.getString("count")+"</a>");
						System.out.println("loop-22--->" +  loop);	
						realtrepcount=realtrepcount+realctn.getInt("count");	
							System.out.println("loop---->" +  loop);
							
					}
					else
					{
							out.print(realctn.getString("count"));
					}
					}
					%>
					</div>		
					</td>
					<td align="right" width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rstcst=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rstcst.next())
						{
						if(rstcst.getInt("count") >0)
						{
							loop="lp9";	
								out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst.getString("count")+"</a>");
								ISrepcount=ISrepcount+rstcst.getInt("count");						
						}
						else
						{
								out.print("0");
						}
						}				
						%>
						</div>							
						</td>
					
						<td align="right" width="25%"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and RegBy='"+rst7.getString("Name")+"'";
						ResultSet rstinsp=st1.executeQuery(sql);
						System.out.println("sql---->" +  sql);
						if(rstinsp.next())
						{
						if(rstinsp.getInt("count") >0)
						{
							loop="lp10";	
								out.print("<a href='reinspection.jsp?regby="+rst7.getString("Name")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstinsp.getString("count")+"</a>");
								ISrep1count=ISrep1count+rstinsp.getInt("count");						
						}
						else
						{
								out.print("0");
						}
						}				
						%>
						</div>							
						</td>
					
				  	<td align="right">
					<div  align="right"> 
					
					
					<%
					
					sql="select count(*) as count from t_unitreplacement where EntBy='"+rst7.getString("Name")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
					ResultSet rst5=st2.executeQuery(sql);
					System.out.println("sql--last1-->" +  sql);
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='rep_utreplaced.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URrepcount=URrepcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					
					%>	
				  	
					</div>
					</td> 
					<td align="right">
					<div align="right">
					<%
					sql="select count(*) as count from t_unitreplacement where EntBy='"+rst7.getString("Name")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
					ResultSet rst6=st2.executeQuery(sql);
					System.out.println("sql-last 2--->" +  sql);
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='rep_nwinsttltn.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIrepcount=NIrepcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>		
					</div>				
					</td>	
					
					<td align="right">
					<div align="right">
					<%					
					sql="select count(*) as count from t_specialreports where  FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"' and TickNo in (select tno  from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy = '"+rst7.getString("Name")+"') ";	
					ResultSet rstsp=st1.executeQuery(sql);
					System.out.println("sql--last 3-->" +  sql);
					int cntp=0;
					while(rstsp.next())
					{
						cntp=cntp+rstsp.getInt("count");
						
						
						
					}
					System.out.println("cntp-spcl of rep->" +  cntp);
						if(cntp >0)
						{
						out.print("<div align='right'><a href='rep_vwspclrport.jsp?regby="+rst7.getString("Name")+"&fromdate="+fromdate+"&todate="+todate+"'>"+cntp+"</a></div>");
						SPrepcount=SPrepcount+cntp;
						}
						else
						{
							out.print("<div align='right'>0</div>");
						}
					
					%>
					</div>
					</td>	
					</tr>				
					<%
					i++;
					}
					String p="",q="",r="",s="";
					p="pp1";
					q="pp2";
					r="pp3";
					s="pp4";
					%>
					<tr>
					
					<td></td>	
									
					<td align="right" width="25%"><font color="red"><b>Total</b></font></td>
					<td align="right" width="22%"><div align="right"><b><a href="viewoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=OCcount%></font></a></b></div></td>
					<td align="right" width="22%"><div align="right"><b><a href="viewincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=ICcount%></font></a></b></div></td>
					<td align="right" width="22%"><div align="right"><b><a href="viewnotcalled.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=NCcount%></font></a></b></div></td>
					<td align="right" width="22%"><div align="right"><b><a href="viewcalltransfer.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CTcount%></font></a></b></div></td>
					<td align="right" width="22%"><div align="right"><b><a href="viewcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=RCAcount%></font></a></b></div></td>
					<td align="right" width="22%"><b><div align="right"><a href="totvehavail.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=RCAvehcount%></font></a></div></b></td>				
					
					<td align="right" width="22%"><b><div align="right"><a href="totrepsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CSrep1count%></font></a></div></b></td>				
					<td align="right" width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=p%>&todate=<%=todate%>"><font color="red"> <%=CSrep2count%></font></a></div></b></td>
									
					
					<td align="right" width="22%"><b><div align="right"><a href="tot_pending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=CPndcount%></font></a></div></b></td>				
												
					<td align="right" width="22%"><b><div align="right"><a href="viewinspection.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=IScount%></font></a></div></b></td>				
					<td align="right" width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=q%>&todate=<%=todate%>"><font color="red"> <%=realtrepcount%></font></a></div></b></td>				
					<td align="right" width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=r%>&todate=<%=todate%>"><font color="red"> <%=ISrepcount%></font></a></div></b></td>
					<td align="right" width="22%"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=s%>&todate=<%=todate%>"><font color="red"> <%=ISrep1count%></font></a></div></b></td>	
					<td align="right" width="22%"><b><div align="right"><a href="tot_utrplaced.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=URrepcount%></font></a></div></b></td>				
					<td align="right" width="22%"><b><div align="right"><a href="totrep_nwinstt.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=NIrepcount%></font></a></div></b></td>				
					<td align="right" width="22%"><b><div align="right"><a href="totrp_vwspcl.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"> <%=SPrepcount%></font></a></div></b></td>							
					</tr>					
					</table>				
					</table>
					<%
					}
						else if(thename.equals("Transporter"))
						{
							%>
							<div align="center"><font color="brown" size="2">Transporter Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div></br>
							
							
							<div align ="right"><font color="red" size="2" > Note:The last two columns will show the monthly SLA data only  for first date of any month. 
							
							
							
							<table border="1" width="100%" class="sortable">
							<tr>
							<td>Sr.</td>
							<td>Transporter</td>
							<td>OutGoing Call</td>
							<td>Incoming Call</td>
							<td>Call Transfer</td>
							<td>Comp. Allocated</td>
							<td>Vehicle Available</td>
							<td>Inspection</td>
							<td>Comp. Solved</td>
							<td>Solved without Replace </td>
							<td>Comp. Pending</td>
							<td>Reallocation</td>
					        <td>Cost of Complaint</td>
					        <td>Cost of Inspection</td>
							<td>Unit Replaced</td>
							<td>New Installation</td>
							<td>Special Report</td>
							 <td>% Captured Days</td>
							<td>% Billed Days</td> 
							
							</tr>
							
							<%
							sql2="select distinct(OwnerName)as OwnerName from t_vehicledetails where OwnerName not like '% del'  order by OwnerName Asc";// where Available='Yes'";	
							ResultSet rst11=st4.executeQuery(sql2);
							System.out.println("sql--tr-->" +  sql);
							int i=1;
							while(rst11.next())
							{
							%>
								<tr>					
						<td  align="right"><div align="right"><%=i%></div></td>
						<td align="right"><font color='red'><%=rst11.getString("OwnerName")%></font></td>
						<td align="right"><div align="right">
								<%//i++;
							
							
							%>
							
							
								<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst22=st51.executeQuery(sql);	
					System.out.println("sql--tr-->" +  sql);
					if(rst22.next())
					{
					if(rst22.getInt("count") >0)
					{
					out.print("<a href='incoming1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst22.getString("count")+"</a>");
					Icount=Icount+rst22.getInt("count");
					}
					else
					{
					out.print(rst22.getString("count"));
					}
					}				
					%>	
					</div>					
					</td>
					<td align="right">
					<div align="right">

					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst21=st51.executeQuery(sql);
					System.out.println("sql--tr-->" +  sql);
					if(rst21.next())
					{
					if(rst21.getInt("count") >0)
					{
					out.print("<a href='outgoing1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst21.getString("count")+"</a>");
					Ocount=Ocount+rst21.getInt("count");
					}
					else
					{
					out.print(rst21.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td align="right">
					<div align="right">
						<%
					
					sql="select count(*) as count from t_callinformation where Reciever='"+rst11.getString("OwnerName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='Call Transfer'";
					ResultSet rst211=st51.executeQuery(sql);
					System.out.println("sql--tr-->" +  sql);
					if(rst211.next())
					{
					if(rst211.getInt("count") >0)
					{
					out.print("<a href='calltransfer1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst211.getString("count")+"</a>");
					CTCcount=CTCcount+rst211.getInt("count");
					}
					else
					{
					out.print(rst211.getString("count"));
					}
					}				
					%>		
					</div>			
					</td>
					<td align="right">
					<div align="right">
<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' ) ";
								ResultSet rst12=st5.executeQuery(sql);
								System.out.println("sql-tr--->" +  sql);
								int call =0;
								while(rst12.next())
								{
									call=call+rst12.getInt("count");
									
								}
								System.out.println("call-- trns-->" +call);
								
								if(call >0)
								{
								out.print("<a href='callocated1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+call+"</a>");
								CAcount=CAcount+call;
								}
								else
								{
								out.print("0");
								}
												
								%>	
								</div>				
								</td>
								
								<td align="right">
					<div align="right">
<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and inspection='No' ) ";
								ResultSet rst111=st51.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								int veh =0;
								while(rst111.next())
								{
									veh=veh+rst111.getInt("count");
								}	
								System.out.println("veh-- trns-->" +veh);	
								
								if(veh >0)
								{
								out.print("<a href='trnsvehavail.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+veh+"</a>");
								CAvehcount=CAvehcount+veh;
								}
								else
								{
								out.print("0");
								}
												
								%>	
								</div>				
								</td>
								<td align="right">
					<div align="right">
<%
								sql="select count(*) as count from db_CustomerComplaints.t_complaints1 where Customer='"+rst11.getString("OwnerName")+"' and TdyDate between'"+fromdate+"' and '"+todate+"' and inspection='Yes'";
								ResultSet rst122=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst122.next())
								{
								if(rst122.getInt("count") >0)
								{
								out.print("<a href='inspection1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst122.getString("count")+"</a>");
								CINcount=CINcount+rst122.getInt("count");
								}
								else
								{
								out.print(rst122.getString("count"));
								}
								}				
								%>	
								</div>				
								</td>
								<td align="right">
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' )  ";
								ResultSet rst13=st6.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst13.next())
								{
								if(rst13.getInt("count") >0)
								{
								out.print("<a href='csolved1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst13.getString("count")+"</a>");
								CScount=CScount+rst13.getInt("count");
								}
								else
								{
								out.print(rst13.getString("count"));
								}
								}				
								%>	
								</div>
								</td>
								
								<td align="right">
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"' and ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and Customer='"+rst11.getString("OwnerName")+"' and inspection='No' ) ";
								ResultSet rst112=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								int repsol= 0;
								while(rst112.next())
								{
									repsol=repsol+rst112.getInt("count");
								}
								System.out.println("repsol-- trns-->" +repsol);	
									
								if(repsol >0)
								{
									loop ="lp12";
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"'>"+repsol+"</a>");
								CSreptrcount=CSreptrcount+repsol;
								}
								else
								{
								out.print("0");
								}
											
								%>	
								</div>
								</td>
								
								
								<td align="right">
								<div align="right">
								<%
								sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"'  and inspection='No' ) ";
								ResultSet rst113=st6.executeQuery(sql);
								System.out.println("sql-tr--->" +  sql);
								int repend= 0;
								while(rst113.next())
								{
									repend=repend+rst113.getInt("count");
								}
								System.out.println("repend-- trns-->" +repend);	
									
								if(repend >0)
								{
								out.print("<a href='trncmpnd.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+repend+"</a>");
								CSpendtrcount=CSpendtrcount+repend;
								}
								else
								{
								out.print("0");
								}
											
								%>	
								</div>
								</td>
								
								
								<td align="right">
								<div align="right">
								<%
								//sql="select count(*) as count from t_callocation1 where Customer='"+rst11.getString("OwnerName")+"'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Unsolved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and Customer='"+rst11.getString("OwnerName")+"' and inspection='No' ) ";
								sql="select count(*) as count from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	Transporter ='"+rst11.getString("OwnerName")+"'  ";
								ResultSet rst114=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								
								if(rst114.next())
								{
															
									
								if(rst114.getInt("count") >0)
								{
									loop ="lp13";
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst114.getInt("count")+"</a>");
								CSrealctncount=CSrealctncount+rst114.getInt("count");
								}
								else
								{
								out.print(rst114.getInt("count"));
								}
								}			
								%>	
								</div>
								</td>
								
								
								
								<td width="25%" align="right"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and Customer='"+rst11.getString("OwnerName")+"'";
						ResultSet rstcst=st6.executeQuery(sql);
						System.out.println("sql--tr-->" +  sql);
						if(rstcst.next())
						{
						if(rstcst.getInt("count") >0)
						{
							loop="lp14";	
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst.getString("count")+"</a>");
								IStrrepcount=IStrrepcount+rstcst.getInt("count");						
						}
						else
						{
								out.print(rstcst.getInt("count"));
						}
						}				
						%>
						</div>							
						</td>
								
							
							<td width="25%"  align="right"><div align="right">
						
						
						
						
						<%
						sql="select sum(CostOfInspection) as count from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Customer='"+rst11.getString("OwnerName")+"'";
						ResultSet rstcst1=st5.executeQuery(sql);
						System.out.println("sql---tr->" +  sql);
						if(rstcst1.next())
						{
						if(rstcst1.getInt("count") >0)
						{
							loop="lp15";	
								out.print("<a href='reinspection.jsp?regby="+rst11.getString("OwnerName")+"&loop="+loop+"&fromdate="+fromdate+"&todate="+todate+"' >"+rstcst1.getString("count")+"</a>");
								IStrcstcount=IStrcstcount+rstcst1.getInt("count");						
						}
						else
						{
								out.print(rstcst1.getInt("count"));
						}
						}				
						%>
						</div>							
						</td>
							
							
							
							
								
								
								
								
								<td align="right">
								<div align="right">
								<%
								sql="select count(*) as count from db_gps.t_unitreplacement where OwnerName='"+rst11.getString("OwnerName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
								ResultSet rst14=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst14.next())
								{
								if(rst14.getInt("count") >0)
								{
								out.print("<a href='ureplaced1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst14.getString("count")+"</a>");
								URcount=URcount+rst14.getInt("count");					
								}
								else
								{
								out.print(rst14.getString("count"));
								}
								}				
								%>	
								</div>
								</td>
								<td align="right">
								<div align="right">
								<%
								sql="select count(*) as count from db_gps.t_unitreplacement where OwnerName='"+rst11.getString("OwnerName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
								ResultSet rst15=st6.executeQuery(sql);	
								System.out.println("sql--tr-->" +  sql);
								if(rst15.next())
								{
								if(rst15.getInt("count") >0)
								{
								out.print("<a href='newinstallation1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst15.getString("count")+"</a>");
								NIcount=NIcount+rst15.getInt("count");
								}
								else
								{
								out.print(rst15.getString("count"));
								}
								}				
								%>		
								</div>				
								</td>	
								<td align="right">
								<div align="right">
								<%					
								sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								ResultSet rst16=st7.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								if(rst16.next())
								{
									if(rst16.getInt("count")>0)
									{
									out.print("<div align='right'><a href='viewspecialreport1.jsp?cust="+rst11.getString("OwnerName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst16.getInt("count")+"</a></div>");
									SPcount=SPcount+rst16.getInt("count");
									}
									else
									{
										out.print("<div align='right'>0</div>");
									}
								}
								%>
								</div>
								</td>
								
								<td align="right">
								<div align="right"> 
								<%					
								//sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								sql="SELECT sum( totalyes ) AS captured_days, sum(TotalDays) as TotalDays FROM db_gps.t_billingdetails WHERE Month1 = '"+fromdate+"' and Transporter ='"+rst11.getString("OwnerName")+"' ";
								ResultSet rst125=st5.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								String cptdays ="",totaldys="",totalbilleddys="";
								 NumberFormat nf = NumberFormat.getNumberInstance();
								    NumberFormat nf1 = NumberFormat.getNumberInstance();
									nf.setMaximumFractionDigits(2) ;
									nf1.setMaximumFractionDigits(2) ;
									String SLAPer ="",BillType= "",CustomerCode ="";
								float cptdays1 =0.0f,totaldys1=0.0f,totalbilleddys1=0.0f,PerOfCapturedDays=0.0f,PerOfBILL=0.0f;
								
								while(rst125.next())
								{
									sql="SELECT SLAPer,BillType,ERPCode as CustomerCode  FROM db_gps.t_fv_erp_relation  WHERE  Transporter ='"+rst11.getString("OwnerName")+"' ";
									ResultSet rst1295=st6.executeQuery(sql);
									System.out.println("sql--tr-->" +  sql);
									if(rst1295.next())
									{
									
									cptdays=rst125.getString("captured_days");
									SLAPer=rst1295.getString("SLAPer");
									BillType =rst1295.getString("BillType");
									CustomerCode= rst1295.getString("CustomerCode");
									totaldys=rst125.getString("TotalDays");
									//totalbilleddys=rst125.getString("Total_billed_days");
									if(cptdays ==null  || totaldys ==null || SLAPer ==null || BillType ==null)
									{
										PerOfCapturedDays =0;
										
									}else{
									
									cptdays1=Float.parseFloat(cptdays);
									totaldys1=Float.parseFloat(totaldys);
									//totalbilleddys1 =Float.parseFloat(totalbilleddys);
									
									
									 PerOfCapturedDays=(cptdays1 * 100)/totaldys1;
									//PerOfBILL=(totalbilleddys1*100)/totaldys1;
									}
									}	
								}	
									
									
									
									if(PerOfCapturedDays >0)
									{
									out.print("<div align='right'><a href='SLAForTransporter1.jsp?transporter="+rst11.getString("OwnerName")+"&GroupName="+rst11.getString("OwnerName")+"&monthdays = "+monthdays+"&date="+fromdate+"&CustomerCode="+CustomerCode+"&SLAPer="+SLAPer+"&BillType="+BillType+"'>"+nf.format(PerOfCapturedDays)+"</a></div>");
									
									SPcptpercount=SPcptpercount+PerOfCapturedDays;
									}
									else
									{
										out.print("0");
									}
								
								%>
								</div>
								</td>
									
								
							  	<td align="right">
								<div align="right"> 
								<%					
								//sql="select count(*) as count from t_specialreports where Transporter='"+rst11.getString("OwnerName")+"' and FoundDate >='"+fromdate+"' and FoundDate <='"+todate+"'";	
								sql="SELECT  sum( totalyes ) AS captured_days, sum( totalyes ) + sum( TotalYesStar ) AS Total_billed_days ,sum(TotalDays) as TotalDays FROM db_gps.t_billingdetails WHERE Month1 = '"+fromdate+"' and Transporter ='"+rst11.getString("OwnerName")+"' ";
								ResultSet rst127=st6.executeQuery(sql);
								System.out.println("sql--tr-->" +  sql);
								//String cptdays ="",totaldys="",totalbilleddys="";
								// NumberFormat nf = NumberFormat.getNumberInstance();
								  //  NumberFormat nf1 = NumberFormat.getNumberInstance();
									//nf.setMaximumFractionDigits(2) ;
									//nf1.setMaximumFractionDigits(2) ;
								//float cptdays1 =0.0f,totaldys1=0.0f,totalbilleddys1=0.0f,PerOfCapturedDays=0.0f,PerOfBILL=0.0f;
								
								while(rst127.next())
								{
									sql="SELECT SLAPer,BillType,ERPCode as CustomerCode  FROM db_gps.t_fv_erp_relation  WHERE  Transporter ='"+rst11.getString("OwnerName")+"' ";
									ResultSet rst1221=st5.executeQuery(sql);
									System.out.println("sql--tr-->" +  sql);
									if(rst1221.next())
									{
									//cptdays=rst125.getString("captured_days");
									totaldys=rst127.getString("TotalDays");
									totalbilleddys=rst127.getString("Total_billed_days");
									cptdays=rst127.getString("captured_days");
									SLAPer=rst1221.getString("SLAPer");
									BillType =rst1221.getString("BillType");
									CustomerCode= rst1221.getString("CustomerCode");
									
									if(totaldys ==null ||  totalbilleddys ==null)
									{
										PerOfBILL =0;
										
									}else{
									
									//cptdays1=Float.parseFloat(cptdays);
									totaldys1=Float.parseFloat(totaldys);
									totalbilleddys1 =Float.parseFloat(totalbilleddys);
									
									
									 //PerOfCapturedDays=(cptdays1 * 100)/totaldys1;
									 PerOfBILL=(totalbilleddys1*100)/totaldys1;
									
									}
								}
								}	
								
								
									if(PerOfBILL >0)
									{
									out.print("<div align='right'><a href='SLAForTransporter1.jsp?transporter="+rst11.getString("OwnerName")+"&GroupName="+rst11.getString("OwnerName")+"&monthdays = "+monthdays+"&date="+fromdate+"&CustomerCode="+CustomerCode+"&SLAPer="+SLAPer+"&BillType="+BillType+"'>"+nf1.format(PerOfBILL)+"</a></div>");
									SPcptbillcount=SPcptbillcount+PerOfCapturedDays;
									}
									else
									{
										out.print("0");
									}
								
								%>
							  	 </div>
								</td>	
									
									</tr>
									
												
								
								<%	
								i++;		
							}			
								String a ="",b ="", c="", d="",e="",f="";
								a="q1" ;
								b= "q2";
								c= "q3";
								d= "q4";
								e="-";
								f= "-";
								%>		
								
								<tr>
								<td><font color="red"><b>Total</b></font></td>
								<td>-</td>
								
					<td align="right"><div align="right"><a href="custhoutgoing.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=Ocount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custhincoming.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=Icount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custhcalltransfer.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CTCcount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custcompallocated.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAcount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="trvehavailtot.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CAvehcount%></b></font></a></div></td>
															
					<td align="right"><b><div align="right"><a href="custinspection.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=CINcount%></a></div></b></font></td>
					<td align="right"><div align="right"><a href="custcompsolved.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=CScount%></b></font></a></div></td>
					<td align="right"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=a%>&todate=<%=todate%>"><font color="red"><%=CSreptrcount%></a></div></b></font></td>
					<td align="right"><b><div align="right"><a href="trpending.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><%=CSpendtrcount%></a></div></b></font></td>
					<td align="right"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=b%>&todate=<%=todate%>"><font color="red"><%=CSrealctncount%></a></div></b></font></td>
					<td align="right"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=c%>&todate=<%=todate%>"><font color="red"><%=IStrrepcount%></a></div></b></font></td>
					<td align="right"><b><div align="right"><a href="reinspection.jsp?fromdate=<%=fromdate%>&loop=<%=d%>&todate=<%=todate%>"><font color="red"><%=IStrcstcount%></a></div></b></font></td>
														
					
					
					<td align="right"><div align="right"><a href="custunitrep.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=URcount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custnewinstall.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=NIcount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=SPcount%></b></font></a></div></td>
					 <td align="right"><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=SPcptpercount%></b></font></a></div></td>
					<td align="right"><div align="right"><a href="custspecialreport.jsp?fromdate=<%=fromdate%>&todate=<%=todate%>"><font color="red"><b><%=SPcptbillcount%></b></font></a></div></td>
								</tr>					
								</table>

					<%
							
								
							
						}
					
					}
					else
					{
					%>
					<div align="center"><font color="brown" size="2">Technician Report from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
					<table border="1" width="100%" class="sortable">
					<td>Sr.</td>
					<td>Name</td>
					<td>Mobile</td>
					<td>OutGoing Call</td>
					<td>Incoming Call</td>
					<td>Comp. Allocated</td>
					<td>Vehicle Available</td>
					<td>Comp. Solved</td>
					<td>Unit Replaced</td>
					<td>New Installation</td>
					</tr>			
					<%
					sql="select distinct(TechName)as TechName,MobNo from t_techlist where Available='Yes'";	
					ResultSet rst=st.executeQuery(sql);
					int i=1;
					while(rst.next())
					{
					%>
					<tr>
					<td><%=i%></td>
					<td><%=rst.getString("TechName")%></td>
					<td><%=rst.getString("MobNo")%></td>
					<td>
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='OutGoing'";
					ResultSet rst1=st1.executeQuery(sql);	
					if(rst1.next())
					{
					if(rst1.getInt("count") >0)
					{
					out.print("<a href='outgoing.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst1.getString("count")+"</a>");
					Ocount=Ocount+rst1.getInt("count");
					}
					else
					{
					out.print(rst1.getString("count"));
					}
					}				
					%>					
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callinformation where Reciever='"+rst.getString("TechName")+"' and TheDate >='"+fromdate+"' and TheDate <='"+todate+"' and CallType='InComing'";
					ResultSet rst2=st1.executeQuery(sql);	
					if(rst2.next())
					{
					if(rst2.getInt("count") >0)
					{
					out.print("<a href='incoming.jsp?caller="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst2.getString("count")+"</a>");
					Icount=Icount+rst2.getInt("count");
					}
					else
					{
					out.print(rst2.getString("count"));
					}
					}				
					%>						
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"'";
					ResultSet rst3=st1.executeQuery(sql);	
					if(rst3.next())
					{
					if(rst3.getInt("count") >0)
					{
					out.print("<a href='callocated.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst3.getString("count")+"</a>");
					CAcount=CAcount+rst3.getInt("count");
					}
					else
					{
					out.print(rst3.getString("count"));
					}
					}				
					%>					
					</td>
					<td>
					
					
		<!-- change -->	
					<%
					sql33="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and VehAvailDate between '"+fromdate+"' and '"+todate+"'";
					ResultSet rst33=st1.executeQuery(sql);	
					if(rst33.next())
					{
					if(rst33.getInt("count") >0)
					{
					out.print("<a href='vehavail.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst33.getString("count")+"</a>");
					CAvcount=CAvcount+rst33.getInt("count");
					}
					else
					{
					out.print(rst33.getString("count"));
					}
					}				
					%>	
						
					</td>
					<td>
					
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Solved'";
					ResultSet rst4=st1.executeQuery(sql);	
					if(rst4.next())
					{
					if(rst4.getInt("count") >0)
					{
					out.print("<a href='csolved.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst4.getString("count")+"</a>");
					CScount=CScount+rst4.getInt("count");
					}
					else
					{
					out.print(rst4.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_callocation1 where Technicion='"+rst.getString("TechName")+"' and DofAllocation >='"+fromdate+"' and DofAllocation <='"+todate+"' and Status='Unsolved'";
					ResultSet rst44=st1.executeQuery(sql);	
					if(rst44.next())
					{
					if(rst44.getInt("count") >0)
					{
					out.print("<a href='cpending.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst44.getString("count")+"</a>");
					CPcount=CPcount+rst44.getInt("count");
					}
					else
					{
					out.print(rst44.getString("count"));
					}
					}				
					%>	
					</div>
					</td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='Rep'";
					ResultSet rst5=st2.executeQuery(sql);	
					if(rst5.next())
					{
					if(rst5.getInt("count") >0)
					{
					out.print("<a href='ureplaced.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst5.getString("count")+"</a>");
					URcount=URcount+rst5.getInt("count");					
					}
					else
					{
					out.print(rst5.getString("count"));
					}
					}				
					%>	
					</td>
					<td>
					<%
					sql="select count(*) as count from t_unitreplacement where InstBy='"+rst.getString("TechName")+"' and InstDate >='"+fromdate+"' and InstDate <='"+todate+"' and InstType='New'";
					ResultSet rst6=st2.executeQuery(sql);	
					if(rst6.next())
					{
					if(rst6.getInt("count") >0)
					{
					out.print("<a href='newinstallation.jsp?tech="+rst.getString("TechName")+"&fromdate="+fromdate+"&todate="+todate+"'>"+rst6.getString("count")+"</a>");
					NIcount=NIcount+rst6.getInt("count");
					}
					else
					{
					out.print(rst6.getString("count"));
					}
					}				
					%>						
					</td>	
									
					</tr>
					<%	
					i++;		
					}				
					%>		
					</table>
					<table border="1" width="750px" align="center" class="sortable">
					<tr>
					<td><font color="red"><b>Total</b></font></td>
					<td><font color="red"><b><%=Ocount%></b></font></td>
					<td><font color="red"><b><%=Icount%></b></font></td>
					<td><font color="red"><b><%=CAcount%></b></font></td>
					<td><font color="red"><b><%=CAvcount%></b></font></td>
					<td><font color="red"><b><%=CScount%></b></font></td>
					<td><font color="red"><b><%=CPcount%></b></font></td>
					<td><font color="red"><b><%=URcount%></b></font></td>
					<td><font color="red"><b><%=NIcount%></b></font></td>
					
					</tr>					
					</table>	
					<%
					}
				%>
							
				</td>
				</tr>
			</table>	
	<%
	
}catch(Exception e)
{
	out.print("Exception -->"+e);
	e.printStackTrace();

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