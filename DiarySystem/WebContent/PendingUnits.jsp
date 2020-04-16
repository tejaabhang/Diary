<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<html>
<head>	
<link href="css/css.css" rel="StyleSheet" type="text/css">
	<script language="javascript">
function validate()
{ 
	var tech=document.transferunits.techlist.value;
	var cust=document.transferunits.custlist.value;
	var cmnt=document.transferunits.cmnt.value;
	//var tech1=document.transferunits.techlist1.value;

	
	if(tech=="Select" && cust=="Select")
	{
		alert("Please select Tech name or Cust Name from the List");
		return false;
	}

	if(tech!="Select" && cust!="Select")
	{
		alert("You can only select one at a time (Tech or Cust)");
		return false;
	} 	

	if(document.transferunits.unittype[0].checked==false && document.transferunits.unittype[1].checked==false)
	{
		alert("Please select Transfer as (New or Faulty)");
		return false;
	}

	if(cmnt.length < 2)
	{
		alert("Please enter Comment");
		return false;
	}
		
	return true;
}
</script>
</head>



<%!
Connection con1, con2;
String username;
String present=null;
String present1=null;
%>
<body>
<form name="transferunits" method="get"  action="transrunitsfrmtech1.jsp" onsubmit="return validate();">
<%
username=session.getAttribute("username").toString();
String userrole=session.getAttribute("userrole").toString();
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
	ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null;
	String sql1="",sql2="",sql3="",sql4="",sql5="",sql11="",sql22="",sql33="";
	String sql44="", sql55="",sql66="",sql77="",sql88="",sql99="",sql10="",sql111="",sql12="",sql13="";
	ResultSet rs11=null,rs22=null,rs33=null,rs44=null,rs55=null,rs66=null,rs77=null,rs88=null,rs99=null,rs10=null;
	ResultSet rs111=null,rs12=null,rs13=null;
	String transp=request.getParameter("holdername");
	String nounitselected=request.getParameter("nounitselected");
	if(nounitselected==null)
	{
	}
	else
	{
%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>	
			<td align="center"> <font color="#2A0A12" > No check-box was selected.  </font> </td>
		</tr>
		</table>
<%	}
	String updated=	request.getParameter("updated");
	//System.out.println("Updated--->"+updated);

	if(updated==null)
	{
	}
	else
	{ 
%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>	
			<td align="center"> <font color="#2A0A12" >Successfully Updated. </font> </td>
		</tr>
		</table>
<%	}	
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center" colspan="2">
				<font size="2" color="#2A0A12">
					<b>Units with <%=transp%></b>
				</font>
			</td>
		</tr>
		<tr>
			<td><font size="2" color="#2A0A12"><b>Pending Units From Replacement/Removed</b></font></td>
			<td colspan="" bgcolor="">  
					<div align="right">  <a href="pendingunitsexcel.jsp?holdername=<%=transp%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
		</tr>
	</table>
	
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="3"> <B> </B> </font> </td>
		</tr>
		
		
		
				
			 	
	</table>
	<table border="1" align="center" width="750px" class="sortable"  bgcolor="#E6E6E6">
		<tr bgcolor="#BDBDBD">
			<td></td>
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
%>				
							<tr>
							<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
							<td><%=i %></td>
							<td><%=rs1.getString("OldUnitID")%></td>
							<td><%=rs1.getString("InstType") %></td>
							<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate"))) %></td>
							<td><%=rs1.getString("VehRegNo") %></td> 
						
							<td><%=rs1.getString("InstPlace") %></td>
							<td><%=rs1.getString("InstBy") %></td>
							<td><%=rs1.getString("OldUnitWith") %>
								<input type="hidden" name="unitid<%=i%>" value="<%=rs1.getString("OldUnitID")%>" />
							</td>
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
		
	//--------------------------FOR DISPATCH----------------------------//	
	
	
	%>
	</table>
	<br></br><br></br>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td>
				<font size="2" color="#2A0A12">
					<b>Pending Units From Dispatches/Transform</b>
				</font>
			</td>
		</tr>
	</table>
	<br></br>
		<table border="1" align="center" width="750px" class="sortable">
		<tr  bgcolor="#BDBDBD">
			<td></td>
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
		sql66="select * from t_unitorder where (Tech ='"+transp+"' or Cust = '"+transp+"') and Status <> 'Open' order by ReqDate desc ";
    	rs66=stmt4.executeQuery(sql66);
		 while(rs66.next())
		 {
			 String orderno=rs66.getString("Reqno");
				sql77="select * from t_unitmasterhistory where OrderNo='"+orderno+"' ";
				rs77=stmt7.executeQuery(sql77);
				while(rs77.next())
				{
					String received=rs77.getString("RecByCust");
					String tme=rs77.getString("DispTime");
					String z=new Integer(00).toString();
					if(tme==null)
					{
						tme=z;
					}
					else
					{}
					sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and InstBy In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
					rs88=stmt88.executeQuery(sql88);
					if(rs88.next())
					{}
					else
					{
						sql88="select * from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and InstBy In ('"+transp+"' , '"+transp+" del') order by EntDate Desc";
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
										sql12="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and DispTime > '"+tme+"'";
										ResultSet rsumh=stmt5.executeQuery(sql12);
										if(rsumh.next())
										{}
										else
										{
											String sql122="select * from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and DispTime = '"+tme+"'";
											ResultSet rsumh1=stmt5.executeQuery(sql122);
											if(rsumh1.next())
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
%>								
											<tr>
											<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
											<td> <%=i%> </td>
											<td><%=rs77.getString("UnitId")%></td>
											<td><font>OK</font></td>
											<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs77.getString("DispDate")))%> </td>
											<td><%=rs77.getString("typeunit") %></td>
											<td> <%=rs77.getString("DisAdd") %></td>
											<td><%=rs77.getString("ModeofDispatch") %></td>
											<td><B><%=rs77.getString("DisName") %></B></td>
											<td> <%=rs77.getString("ChalanNo")%> </td>
											<td> <%=rs66.getString("Reqto")%> 
												<input type="hidden" name="unitid<%=i%>" value="<%=rs77.getString("UnitId")%>" />
											</td>
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
							}
						}
					}
				}
				
			//-------------------------------------		
%>
		</table>
		<br><br>
<%
String typevalue=session.getAttribute("typevalue").toString();
if(typevalue.equals("transporter")){}else{
		String sqltech="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc";
		ResultSet rstechname=stmt2.executeQuery(sqltech);
%>
<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td align="center" colspan="2"> 
				<font color="#2A0A12" > 
						<b>Transfer To</b> 
				</font>  		 	
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td>
			<div align="center"> 
				<label for="Tech" class="formElement"> <B>
					<font size="2">Tech:</font>
				</B></label> 
				<select name="techlist" class="formElement"> 	
					<option value="Select">Select</option>	
<%
					while(rstechname.next())
					{ 
%>
					<option value="<%=rstechname.getString("tech")%>"><%=rstechname.getString("tech")%></option>
<%
					}
%>
			     </select> 
<%	
		if("manager".equalsIgnoreCase(userrole)||"SuperAdmin".equalsIgnoreCase(userrole))
		{
%>
			&nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
			String sqltrans="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
			ResultSet rstransname=stmt3.executeQuery(sqltrans);
%>						      
	  		 <label for="Cust" class="formElement"> 
	  		 	<B><font size="2">Cust:</font></B>
	  		 </label> 
	  		 <select name="custlist" class="formElement"> 	
				<option value="Select">Select</option>
<%
				while(rstransname.next())
				{ 
%>
				<option value="<%=rstransname.getString("cust")%>"><%=rstransname.getString("cust")%></option>
<%									
				}
%>
			</select>	
<%									
		}
%>
		</div>
	</td>
  </tr>   
  <tr  bgcolor="#BDBDBD">
     <td align="center">
			<label for="Transferas" class="formElement"> <B> 
				<font size="2">Transfer as:</font></B> 
			</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="unittype" value="Okay"> Okay
			<input type="radio" name="unittype" value="Faulty">Faulty
	 </td>
  </tr>
  <tr  bgcolor="#BDBDBD">
	 <td align="center"> 
	 	<label for="Comment" class="formElement"> 
	 		<B> <font size="2">Comment: </font></B> 
	 	</label> 
	 	<textarea name="cmnt" class="formElement"> </textarea> 
	 </td>
   </tr>
    <tr>
		<td colspan="2" align="center">  
			<input type="submit" name="submit" value="Transfer" class="formElement" /> 
		</td>
	</tr>
</table>
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="techname" value="<%=transp%>" />	
<%}
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}
%>
</form>
</body>