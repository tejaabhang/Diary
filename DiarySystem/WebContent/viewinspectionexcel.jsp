<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="Dailyreport_viewinspection.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,caller="";
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
caller=request.getParameter("rep");
fromdate=request.getParameter("fromdate");
todate=request.getParameter("todate");
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	
	
	//thename=request.getParameter("thename");
	////System.out.println("--excel-->"+thename );
	
	
	//System.out.println("Hiiiiiiiiiiiiii    ..<<>>>>>  sql--excel-of total veh->");
	
	
	%>
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Inspection By <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td></tr>	
	<td><div align="right">  <a href="viewinspectionexcel.jsp?rep=<%=caller%>&fromdate=<%=fromdate %>&todate=<%=todate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Date</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Transporter</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>PowerConnection</b></td>
	<td><b>JRMOther</b></td>
	<td><b>Ent By</b></td>
	</tr>
	<%
		
		sql="select * from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and RegBy in (select name from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes') ";
		ResultSet rst=st.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td align ="right"><%=i%></td>
	<td align ="right"><%=rst.getString("Tno")%></td>
	<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></td>
	<td align ="right"><%=rst.getString("VehicleNo")%></td>
	<td align ="left"><%=rst.getString("Customer")%></td>
	<td align ="right"><%=rst.getString("CostOfInspection")%></td>
	<td align ="left"><%=rst.getString("ClaimDetails")%></td>
	<td align ="right"><%=rst.getString("DurationOfClosure")%></td>
	<td align ="left"><%=rst.getString("DeviceIsFixed")%></td>
	<td align ="left"><%=rst.getString("GPSPleacement")%></td>
	<td align ="left"><%=rst.getString("PowerConnection")%></td>
	<td align ="left"><%=rst.getString("JRMOther")%></td>
	<td align ="left"><%=rst.getString("RegBy")%></td>
	
	</tr>		
		<%
		i++;
		}	
	%>
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
