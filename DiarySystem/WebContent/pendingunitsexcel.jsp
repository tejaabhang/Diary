<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="PendingUnits_Transporter.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%!
Connection con1, con2;
String present=null;
String present1=null;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

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



//String sql1,sql2,sql3,sql4;
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




String transp=request.getParameter("holdername");
	
%>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="3"> <B> Units with <%=transp%></B> </font> </td>
			<tr><td>Pending Units From Replacement/Removed</td></tr>
			
		</tr>
	</table>
	<table class="stats">
		<tr>
			
			<td> <b> Sr. No </b> </td>
			<td> <b> Unit Id </b> </td>	
			<td><b> Status </b></td>
			<td> <b> Status Date </b> </td>
			<td><b> Veh. Reg No. </b></td>
			
			<td> <b> Location </b> </td>
			<td> <b> Technician </b> </td>
			<td><b>Old Unit With</b></td>
				
		</tr>
<%
	int i=1;	

		sql1="select * from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('cust','customer','Customer','"+transp+"') and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
		rs1=stmt1.executeQuery(sql1);
		//out.print(sql1);
		
		//String ouid=rs1.getString("OldUnitId");
		
		
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
				//and Transporter='"+transp+"'";
				ResultSet rstime=stmt2.executeQuery(sql2);
				//String ss=rs2.getString("Rdate");
				//out.print(ss);
				//out.print(sql2);
				if(rstime.next())

				{
				}
				else
				{
				
				
				//out.print(rs2.getString("UnitID"));
				
			sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate > '"+rs1.getString("EntDate")+"'";
				rs3=stmt3.executeQuery(sql3);
				//out.print(sql3);
				//out.print(sql3);
				if(rs3.next())
				{
					
				}
				
				else
				{
					
					sql3="select * from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate = '"+rs1.getString("EntDate")+"' and InstTime > '"+time+"'";
					ResultSet rsreptime=stmt3.executeQuery(sql3);
					//out.print(sql3);
					//out.print(sql3);
					if(rsreptime.next())
					{
						
					}
					
					else
					{
					//String ss=trim(rs1.getString("OldUnitID"));
				//	String ss=rs1.getString("OldUnitID");
				//String ss1=ss.trim();
					
					sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate > '"+rs1.getString("EntDate")+"'";
					
					rs4=stmt5.executeQuery(sql4);
					//out.print(sql4);
					if(rs4.next())
					{
						
					}
					else
					{
						
						
						sql4="select * from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate = '"+rs1.getString("EntDate")+"' and EntTime > '"+time+"' ";
						
						ResultSet rsdtime=stmt5.executeQuery(sql4);
						//out.print(sql4);
						if(rsdtime.next())
						{
							
						}
						else
						{
//			sql5="Select * from t_allconnectedunits where TheDate >'"+rs1.getString("EntDate")+"' order by TheDate Desc ";

							sql5="Select * from allconnectedunits where UnitID='"+rs1.getString("OldUnitID").trim()+"' and TheDate >'"+rs1.getString("EntDate")+"' and VehNo <> '-' order by TheDate Desc ";

							rs5=stmt6.executeQuery(sql5);
							//out.print(sql5);
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
								
%>				
							<tr>
							<td><%=i %></td>
							<td><%=rs1.getString("OldUnitID")%></td>
							<td><%=rs1.getString("InstType") %></td>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate"))) %></td>
							<td><%=rs1.getString("VehRegNo") %></td> 
							
							<td><%=rs1.getString("InstPlace") %></td>
							<td><%=rs1.getString("InstBy") %></td>
							<td><%=rs1.getString("OldUnitWith") %></td>
							</tr>
		
<%	
							i++;
								}
							}
							
					}
					}
					}
				}
				}
			}
	
		}
		
	//------------------------------------------------------//	
	
	
	%>
	</table>
	<br></br><br></br>
	<%
	
		out.print("Pending Units From Dispatches");
	
	
%>	
		<table class="stats">
		<tr>
			
			<td> <b> Sr. No </b> </td>
			<td> <b> Unit Id </b> </td>	
			<td><b> Status </b></td>
			<td> <b> Disp Date </b> </td>
			<td><b> Unit Type </b></td> 
			<td> <b> Dispatch Location </b> </td>
			<td><b>Mode Of Dispatch</b></td>
			<td><b>Docket No.</b></td>
			<td> <b> Chalan No </b> </td>
			<td><b>Dispatch From</b></td>
			
				
		</tr>
	
	
<%	
		int l=1;
		sql66="select * from t_unitorder where (Tech = '"+transp+"' or Cust = '"+transp+"') and Status <> 'Open' order by ReqDate desc ";
		 rs66=stmt4.executeQuery(sql66);
		 	
		 while(rs66.next())
		 {
				String orderno=rs66.getString("Reqno");
				
				//out.print("Pending Units From Dispatches");

				
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
					{
						
					}
					sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and NewUnitID='"+rs77.getString("UnitId")+"' and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
					rs88=stmt88.executeQuery(sql88);
					
					
					if(rs88.next())
					{
					
					}
					else
					{
						sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and NewUnitID='"+rs77.getString("UnitId")+"' and OwnerName In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
						rs88=stmt88.executeQuery(sql88);
						
						
						if(rs88.next())
						{
						
						}
						else
						{
							sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate > '"+rs77.getString("DispDate")+"' order by Rdate desc"; 
							rs10=stmt10.executeQuery(sql10);
							
							if(rs10.next())

							{
							}
							else
							{	
								
								sql10="select * from t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate = '"+rs77.getString("DispDate")+"' and Rtime > '"+tme+"' order by Rdate desc"; 
								rs10=stmt10.executeQuery(sql10);
								
								if(rs10.next())

								{
								}
								else
								{
								
							sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate > '"+rs77.getString("DispDate")+"'";
								rs111=stmt111.executeQuery(sql111);
								
								if(rs111.next())
								{
									
								}
								
								else
								{
									sql111="select * from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate = '"+rs77.getString("DispDate")+"' and InstTime > '"+tme+"'";
									rs111=stmt111.executeQuery(sql111);
									
									if(rs111.next())
									{
										
									}
									
									else
									{
									sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate > '"+rs77.getString("DispDate")+"'";
									
									rs12=stmt5.executeQuery(sql12);
									
									if(rs12.next())
									{
										
									}
									else
									{
					
										sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and EntTime > '"+tme+"'";
										
										rs12=stmt5.executeQuery(sql12);
										
										if(rs12.next())
										{
											
										}
										else
										{
											sql13="Select * from allconnectedunits where UnitID='"+rs77.getString("UnitId").trim()+"' and TheDate >'"+rs77.getString("DispDate")+"' and VehNo <> '-' order by TheDate Desc ";

											rs13=stmt13.executeQuery(sql13);
											if(rs13.next())
											{
												
											}
											else
											{

												String newunit1=rs77.getString("UnitId").trim();
												if(newunit1.equals(present1))
												{}
												else
												{
													present1=rs77.getString("UnitId");
												
				%>				
											<tr>
											<td><%=l %></td>
											<td><%=rs77.getString("UnitId")%></td>
											<td><font>OK</font></td>
											<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs77.getString("DispDate")))%> </td>
											<td> <%=rs77.getString("typeunit")%></td> 
											<td> <%=rs77.getString("DisAdd") %></td>
											<td><%=rs77.getString("ModeofDispatch") %></td>
											<td><B><%=rs77.getString("DisName") %></B></td>
											<td> <%=rs77.getString("ChalanNo")%> </td>
											<td> <%=rs66.getString("Reqto")%> </td>
											</tr>
						
				<%	
											l++;
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

			//-------------------------------------		
							
		
%>
	
	</table>
<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>
