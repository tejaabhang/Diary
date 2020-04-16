<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="Total_Removed_Vehicles.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3, st01,st4,st5,st6,st7,st8;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7;
String transporter,today,Svehlist,username,warranty;
String Vehcode="",unitid="",instdate="";
%>
<%
transporter="All Transporter";
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String tdydate=formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-4000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today3 = formatter.format(defoultdate);
miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=miliseconds-5000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String today4 = formatter.format(defoultdate);

miliseconds=miliseconds+1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
String sdays = formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
String  userrole2=session.getAttribute("userrole").toString();



try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st01=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	st6=conn1.createStatement();
	st7=conn1.createStatement();
	st8=conn1.createStatement();
	
	
}catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<table border="0" width="750px" class="">
<tr><td align="center" colspan="2"><center><font color="black" size="3">List of All Vehicles For Removed Units.</font></center></td></tr>

<tr><td colspan="" bgcolor="">  
					<div align="right">  <a href="totremovedexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
</tr>

</table>

<%
String userrole=session.getAttribute("userrole").toString();


%>
		<table border="1" width="750px" align="center" class="sortable">
<tr>
<td>Sr.</td>
<td>Transporter</td>
<td>Vehicle No</td>
<td>Updated</td>
<td>Location</td>
<td>Unit ID</td>
<td>Mobile No</td>
<td>Sim No</td>
<td>Peripherals</td>
<td>Sim Company</td>
<td>Removed Date</td>

</tr>

<%
try
{
		
		
	if(userrole2.equalsIgnoreCase("supertech")){


		
		
		String sqlas="",trns="",rep="";	
		
		String us=username.toUpperCase();
		String update = "-";
		String uptime = "-";
		String uplocation = "-";
		String mobno = "-";
		String simno = "-";
		String peripheral = "-";
		String simcompany= "-";
		sql="select * from t_vehicledetails where status ='Removed' and OwnerName not in ('Topsline del')  order by OwnerName Asc"; 
		ResultSet rst1=st1.executeQuery(sql);
		int i=1;
		while(rst1.next())
		{
			trns=rst1.getString("OwnerName");
		
			sqlas="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+trns+"'";
			ResultSet agnt=st8.executeQuery(sqlas);
			System.out.println(">>>>>>sql 3>>sqlas>>"+sqlas);
			if(agnt.next())
			{
				rep=agnt.getString("Representative");		
			
			
			
			if(rep=="Kamal Dixit" || rep.equalsIgnoreCase("Kamal Dixit"))
			{
			
		
		
		
		%>
		<tr>
		<td align="right"><%=i%></td>
		<td align="left"><%=rst1.getString("OwnerName") %></td>
		<td align="left"><%=rst1.getString("VehicleRegNumber")%></td>
		<%
			String sqldata="select * from t_onlinedata where VehicleRegNo = '"+rst1.getString("VehicleRegNumber")+"' order by TheDate Desc";
			ResultSet rstdata= st4.executeQuery(sqldata);
			if(rstdata.next())
			{
				update = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rstdata.getString("TheDate")));	
				uptime = rstdata.getString("TheTime");
				uplocation = rstdata.getString("Location");
			}
		
			String remdate="", remunit="-";
			sql2="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";
		    ResultSet rs2=st2.executeQuery(sql2);
		    if(rs2.next())
		    {
		    	
		    		remdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate")));
		    	   	remunit=rs2.getString("OldUnitId");
		    }
		    	
			sql4 = "select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' and NewUnitID='"+remunit.trim()+"'";
			ResultSet rstms = st5.executeQuery(sql4);
			if(rstms.next())
			{

		    	
			    try{
						simno = rstms.getString("SimNo");		
				
				}catch(Exception e)
				{
					simno = "-";
				}
				   
				  
					try{
						mobno = rstms.getString("MobNo");
			 			
			 		    }catch(Exception e)
			 		{
			 		    	mobno = "-";
			 		}
			 	
			}
			
			sql5="select * from t_unitmaster where unitid = '"+unitid+"' ";
			ResultSet rstps = st6.executeQuery(sql5);
			if(rstps.next())
			{
				
				peripheral = rstps.getString("Peripherals");
				simcompany = rstps.getString("SimCompany");
			}
			
			
		%> 
		<td><%=update%><br><%=uptime %></br></td>
		<td align="left"><%=uplocation %></td>
		<td align="left"><%=remunit %></td>
		<td align="right"><%=mobno%></td>
		<td align="right"><%=simno %></td>
		<td align="left"><%=peripheral %></td>
		<td align="left"><%=simcompany %></td>
		<td align="left"><%=remdate %></td>
		
		
		</tr>

	        <%
		i++;
		
		}
		}
		}
		
		

		
		
	
		
		
	}else{
	
	
	String us=username.toUpperCase();
		String update = "-";
		String uptime = "-";
		String uplocation = "-";
		String mobno = "-";
		String simno = "-";
		String peripheral = "-";
		String simcompany= "-";
		sql="select * from t_vehicledetails where status ='Removed' order by OwnerName Asc"; 
		ResultSet rst1=st1.executeQuery(sql);
		int i=1;
		while(rst1.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst1.getString("OwnerName") %></td>
		<td><%=rst1.getString("VehicleRegNumber")%></td>
		<%
			String sqldata="select * from t_onlinedata where VehicleRegNo = '"+rst1.getString("VehicleRegNumber")+"' order by TheDate Desc";
			ResultSet rstdata= st4.executeQuery(sqldata);
			if(rstdata.next())
			{
				update = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rstdata.getString("TheDate")));	
				uptime = rstdata.getString("TheTime");
				uplocation = rstdata.getString("Location");
			}
		
			String remdate="", remunit="-";
			sql2="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";
		    ResultSet rs2=st2.executeQuery(sql2);
		    if(rs2.next())
		    {
		    	
		    		remdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate")));
		    	   	remunit=rs2.getString("OldUnitId");
		    }
		    	
			sql4 = "select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNumber")+"' and NewUnitID='"+remunit.trim()+"'";
			ResultSet rstms = st5.executeQuery(sql4);
			if(rstms.next())
			{

		    	
			    try{
						simno = rstms.getString("SimNo");		
				
				}catch(Exception e)
				{
					simno = "-";
				}
				   
				  
					try{
						mobno = rstms.getString("MobNo");
			 			
			 		    }catch(Exception e)
			 		{
			 		    	mobno = "-";
			 		}
			 	
			}
			
			sql5="select * from t_unitmaster where unitid = '"+unitid+"' ";
			ResultSet rstps = st6.executeQuery(sql5);
			if(rstps.next())
			{
				
				peripheral = rstps.getString("Peripherals");
				simcompany = rstps.getString("SimCompany");
			}
			
			
		%> 
		<td><%=update%><%=uptime %></td>
		<td><%=uplocation %></td>
		<td><%=remunit %></td>
		<td><%=mobno%></td>
		<td><%=simno %></td>
		<td><%=peripheral %></td>
		<td><%=simcompany %></td>
		<td><%=remdate %></td>
		
		
		</tr>

	        <%
		i++;
		}
		
}
	}catch(Exception e)
	{
		out.print("Exception --->"+e);
	}
	finally
	{
		conn.close();
		conn1.close();

	}

	%>
		</table>
		
	</table>
			<table border="0" width="750px" height="300px">
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
	   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
	  </div>

	</body>
	</html>