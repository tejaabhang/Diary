<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="Complaint_Not_Allocated_Vehicles.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5;
String sql,sql1,sql2,sql3,sql4,sql5,today,olddate,username,userrole,thename;
String fromdate,todate,cust;
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
cust=request.getParameter("cust");
fromdate=request.getParameter("fromdate");
todate=request.getParameter("todate");
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn1.createStatement();
	st1=conn1.createStatement();
	st2=conn.createStatement();
	
	
int i=0;
	
	%>
	
	<table border="0" width="750px" >
	
	<tr><td align="center"><font color="brown" size="3"><%=cust %> Report For Vehicle Which Are Faulty And Complaints Not Re-Allocated. </font></td></tr>

	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Last Complaint Date</b></td>
	</tr>
	
	<%
		sql="select VehicleRegNumber from t_vehicledetails where Status='-' and OwnerName='"+cust+"'";
		ResultSet rst=st.executeQuery(sql);
		while(rst.next())
		{
			String veh1=rst.getString("VehicleRegNumber");
		
			sql1="select TheDate,TheTime,Location,VehicleRegNo from t_onlinedata where VehicleRegNo='"+veh1+"' and Transporter='"+cust+"' and TheDate < '"+today+"' order by TheDate Desc limit 1";
			
			//sql1="select TheDate,TheTime,Location from t_onlinedata where VehicleRegNo='"+veh+"' and TheDate < '"+today+"' order by TheDate Desc";
			ResultSet rst1=st1.executeQuery(sql1);
			while(rst1.next())
			{
				String lastdate=rst1.getString("TheDate");
				String lasttime=rst1.getString("TheTime");
				String loc=rst1.getString("Location");
				String veh=rst1.getString("VehicleRegNo");
				
				sql2="select * from t_callocation1 where VehRegNo='"+veh+"' and DofAllocation>='"+rst1.getString("TheDate")+"' ";
				ResultSet rst2=st2.executeQuery(sql2);
				
				
				if(rst2.next())
				{
					//out.println(rst2.getString("DofAllocation"));
					String date=rst2.getString("DofAllocation");
					String veh2=rst2.getString("VehRegNo");
					//out.print(Icount);
					sql3="select DofAllocation,VehAvailDate from t_callocation1 where VehAvailDate >= '"+today+"' and VehRegNo='"+veh2+"'";
					//out.println(sql3);
					ResultSet rst3=st2.executeQuery(sql3);
					//out.println(sql3);
					if(rst3.next())
					{
						
					}
					else
					{
						//out.print(i);
						i++;
%>		
				<tr>
				<td><%=i %></td>
				<td><%=rst1.getString("VehicleRegNo") %></td>
<%				
		/*		sql3="select UnitID from t_unitreplacement where VehicleRegNumber='"+veh+"' and EntDate < '"+today+"' order by EntDate Desc";
				ResultSet rst3=st3.executeQuery(sql3);
				if(rst3.next())
					
			*/
			%>	<td><font color="Red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastdate)) %><%=lasttime %></font></td>
				<td><font color='red'><b><%=loc %></b></font></td>
				<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date)) %></td>
				</tr>
				
				
<%				
				
					
					}
				}
				else
				{
					}
	
			}
			
		}
		
	%>	
		<table border="1" width="100%" align="center" class="sortable">
		<tr>
		<td><b>Total.</b></td>
		<td><b><%=i %></b></td>
		</tr>
		</table>
		
		
	</table>
	</td></tr>
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
