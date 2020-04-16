<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="All_Report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,sql2,sql3,today,olddate,username,userrole,today1;
String fromdate,todate;
String vehregno="-",probdate="-",compdate="-",availdate="-",ticketno,tech="-",status="-",solvedate="-", reallocated="-",reason="-",solution;
ResultSet rst=null , rst1=null, rst2=null, rst3=null, rst4=null, rst5=null,rst6=null,rst7=null;
%>
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
				
					<table border="1" width="100%" class="sortable">
					<tr>
					<td><b>Sr</b></td>
					<td><b>Customer</b></td>
					<td><b>Problem Since</b></td>
					<td><b>Complaint Date</b></td>
					<td><b>Available Date</b></td>
					<td><b>Vehicle Number</b></td>
					<td><b>Updated</b></td>
					<td><b>Location</b></td>
					<td><b>Nature Of Cmplaint</b></td>
					<td><b>Action</b></td>
					<td><b>Complaint By</b></td>
					<td><b>Attend Address</b></td>
					<td><b>Complaint to</b></td>
					<td><b>Status</b></td>
					<td><b>Solved Date</b></td>
					<td><b>Re-allocted</b></td>
					<td><b>Reason</b></td>
					<td><b>Comment</b></td>
					
					</tr>		
				
					<%

					sql = "select * from t_complaints1 where TdyDate  between '"+fromdate+"' and '"+todate+"'order By TdyDate Desc";
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
							<td><%=i%></td>
							<td><%=rst.getString("Customer")%></td>
						<%
						
						probdate = rst.getString("CDate");
						if(probdate==null)
						{
							probdate = "-";
						}
						%>
							<td><%=probdate%></td>
						<%
						
						compdate = rst.getString("TdyDate");
						%>
							<td><%=compdate%></td>
						<%
						availdate = rst.getString("VehAvailDate");
						%>
							<td><%=availdate%></td>
						<%
						 
						vehregno = rst.getString("VehicleNo");
						%>
							<td><%=vehregno%></td>
						<%
						
							//	*****************FOR DATE AND LOCATION
						
								sql1 = "select TheDate,TheTime,Location from t_onlinedata where VehicleRegNo = '"+vehregno+"' order by TheDate Desc ";
					 			rst1 = st1.executeQuery(sql1);
					 			if(rst1.next())
					 			{
					 				%>
									<td><%=rst1.getString("TheDate")%><%=rst1.getString("TheTime")%></td>
									<td><%=rst1.getString("Location")%></td>
									<%
					 			}
					 	
					 	%>
								<td><%=rst.getString("Complaint")%></td>
						<%ticketno = rst.getString("Tno");
						
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
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
