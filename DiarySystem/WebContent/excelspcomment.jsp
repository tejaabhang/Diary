<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="specialreport.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs3=null, rs4=null;
	String sql1="", sql3="", sql4="";
	
	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);

	String radtype=request.getParameter("radtype");
	
	int i=1, j=0;
	
	if(radtype==null || radtype.equals("Tech"))
	{  

		String techname=request.getParameter("techlist");
		String date=request.getParameter("calender");
		String date1=request.getParameter("calender1");
		String between="";  
		
		if(techname==null || techname.equals("Select") || techname.equals("Tech's"))
		{  
			sql1="select * from t_techspecialrep where TechName not in ('NA','-') and VehRegNo in ('NA','-')  and UnitId in ('NA','-') and cmmt_type not in ('Unit','Vehicle') order by EntDateTime desc";
			techname="Tech's";
		}
		else
		{  
			sql1="select * from t_techspecialrep where TechName = '"+techname+"' and EntDateTime between '"+date+" 00:00:00' and '"+date1+" 23:59:59'and TechName not in ('NA','-') and VehRegNo in ('NA','-')  and UnitId in ('NA','-') and cmmt_type not in ('Unit','Vehicle') order by EntDateTime desc ";
			date=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date));
			date1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1));
			between="between "+ date + " and " + date1;
		}
	
		rs1=stmt1.executeQuery(sql1);	
%>
		<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> <%=techname%> Special Comments <%=between%> </B> </font> </td>
		</tr>
	</table>

	
		<table class="sortable">
		 	<tr>
				<td> </td>
				<td> <div align="center"> <B> Sr.No  </div> </td>	
				<td> <div align="center"> <B> Ent Date Time  </div> </td>	
				<td> <div align="center"> <B> Tech.  </div> </td>
				<td> <div align="center"> <B> Action to be Taken by </div> </td>	
				<td> <div align="center"> <B> Sp. Comment  </div> </td>	
				<td> <div align="center"> <B> Extra Comment  </div> </td>	
				<td> <div align="center"> <B> Ent. By  </div> </td>
				<td> <div align="center"> <B> Close By  </div> </td>	
			</tr>	
			</tr>
<%
	while(rs1.next())
	{ %>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ %>

			 <div align="center">  <input type="checkbox" name="del<%=j%>" value="del<%=j%>" /> </div>  </td>
<%		} %>
			<td> <div align="center"> <%=i%> </div>
	<input type="hidden" name="id<%=j%>" value="<%=rs1.getString("SrNo")%>" /> 
			</td>
			<td><div align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			<td> <div align="center"><%=rs1.getString("TechName")%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="center"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("Extra_comment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("CloseBy")%> </div></td>
		</tr>
<%	
		i++;
		j++;
	}
%>
		</table>			
<%	} 
	else if(radtype.equals("Unit"))	
	{  
		String unit=request.getParameter("unitid");
		String date2=request.getParameter("calender2");
		String date3=request.getParameter("calender3");
		String between="";
		
		if(unit==null || unit.equals("") || unit.equals("Unit's"))
		{
			sql1="select * from t_techspecialrep where UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
			unit="Unit's";
		}
		else
		{
			sql1="select * from t_techspecialrep where UnitId = '"+unit+"' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";

			date2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2));
			date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date3));
			between="between "+ date2 + " and " + date3;
			
		}
		
		rs1=stmt1.executeQuery(sql1);	
%>
		
		<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Unit's Special Comments <%=between%></b> </font> </td>
		</tr>
	</table>

		<table class="sortable">
		 	<tr>
				<td> </td>
				<td> <div align="center"> <B> Sr.No  </div> </td>	
				<td> <div align="center"> <B> Ent Date Time  </div> </td>	
				
				<td> <div align="center"> <B> Unit Id  </div> </td>
				<td> <div align="center"> <B> Red Light </div> </td>
				<td> <div align="center"> <B> Green Light </div> </td>
				<td> <div align="center"> <B> GPS Blue Light </div> </td>
				
				<td> <div align="center"> <B> Ringing </div> </td>	
				
				<td> <div align="center"> <B> Action to be Taken by </div> </td>	
				
					<td> <div align="center"> <B> Sp. Comment  </div> </td>	
				<td> <div align="center"> <B> Extra Comment  </div> </td>	
				<td> <div align="center"> <B> Ent. By  </div> </td>	
				<td> <div align="center"> <B> Close By  </div> </td>	
			</tr>
<%
	
	while(rs1.next())
	{ %>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ %>

			 <div align="center">  <input type="checkbox" name="del<%=j%>" value="del<%=j%>" /> </div>  </td>
<%		} %>
			<td> <div align="center"> <%=i%> </div>
	<input type="hidden" name="id<%=j%>" value="<%=rs1.getString("SrNo")%>" /> 
			</td>
			<td><div align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("UnitId")%> </div></td>
			<td> <div align="center"><%=rs1.getString("RedLight")%> </div></td>
			<td> <div align="center"><%=rs1.getString("GreenLight")%> </div></td>
			<td> <div align="center"><%=rs1.getString("GPSLight")%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("Ringing")%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="center"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("Extra_comment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("CloseBy")%> </div></td>
		</tr>
<%	
		i++;
		j++;
	}
%>
		
		</table>
<%	}
	else
	{ 
		String cust=request.getParameter("custlist");
		
		String date4=request.getParameter("calender4");
		String date5=request.getParameter("calender5");
		String between="";
		String transp="";	
		
		if(cust==null || cust.equals("Select") || cust.equals("Vehicle's"))
		{		
			sql1="select * from t_techspecialrep where UnitId in ('NA','-') and TechName in ('NA','-') and VehRegNo not in ('NA','-') and cmmt_type not in ('Technician','Unit') order by EntDateTime desc ";
			cust="Vehicle's";
		}
		else
		{
			sql1="select * from t_techspecialrep where Transp = '"+cust+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59' and  UnitId in ('NA','-') and TechName in ('NA','-') and VehRegNo not in ('NA','-') and cmmt_type not in ('Unit','Technician') order by EntDateTime desc ";

			date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date4));
			date5=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date5));
			between="between "+ date4 + " and " + date5;
		}
		
		rs1=stmt1.executeQuery(sql1);	
%>
		<table border="0" width="750px" >
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> <%=cust%> Special Comments <%=between%> </b> </font> </td>
		</tr>
	</table>

		<table class="sortable">
		 	<tr>
				<td> </td>
				<td> <div align="center"> <B> Sr.No  </div> </td>	
				<td> <div align="center"> <B> Ent Date Time  </div> </td>	
				
				<td> <div align="center"> <B> Veh. No </div> </td>
				<td> <div align="center"> <B> Transporter </div> </td>
				<td> <div align="center"> <B> Action to be Taken by </div> </td>	
					<td> <div align="center"> <B> Sp. Comment  </div> </td>	
				<td> <div align="center"> <B> Extra Comment  </div> </td>	
				<td> <div align="center"> <B> Ent. By  </div> </td>	
				<td> <div align="center"> <B> Close By  </div> </td>	
			</tr>
<%
	while(rs1.next())
	{
		String sql2="select * from t_vehicledetails where VehicleRegNumber='"+rs1.getString("VehRegNo")+"' ";
		ResultSet rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			transp=rs2.getString("OwnerName");
		}
 %>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ %>

			 <div align="center">  <input type="checkbox" name="del<%=j%>" value="del<%=j%>" /> </div>  </td>
<%		} %>
			<td> <div align="center"> <%=i%> </div>
	<input type="hidden" name="id<%=j%>" value="<%=rs1.getString("SrNo")%>" /> 
			</td>
			<td><div align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("VehRegNo")%> </div></td>
			<td> <div align="center"><%=transp%> </div></td>
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="center"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("Extra_comment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("CloseBy")%> </div></td>
		</tr>
<%	
		i++;
		j++;
	}
%>
		
		</table>	
<%	}
%>
	
<input type="hidden" name="cntr" value="<%=i-1%>" />

<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	con2.close();
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
