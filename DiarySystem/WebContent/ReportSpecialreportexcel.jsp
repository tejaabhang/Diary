<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="Special_Report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1;
String sql,today,username,userrole;

%>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);

username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	int i=0;
	
	%>
			<table border="0" width="750px" align="center">
				<tr>
					<td>
					    <div align="center"><font color="brown" size="3">Report For Special Reports</font></div>
					    
					   
					    
					    <table border="1" width="100%" class="sortable">
					    		<tr>
					    			<td>Sr</td>
					    			<td>Transporter</td>
					    			<td>Veh. Reg. No.</td>
					    			<td>DriverName</td>
					    			<td>UnitID</td>
					    			<td>EnterDate</td>
					    			<td>Location</td>
					    			<td>Technician</td>
					    			<td>Amount</td>
					    			<td>Comment</td>
					    		</tr>
					    		
					    		<%
					    			sql="select * from t_specialreports order by Transporter Asc";
					    			ResultSet rs=st.executeQuery(sql); 
					    			
					    			while(rs.next())
					    			{
					    				i++;
					    		%>
					    		<tr>
					    		<td><%= i %></td>
					    			<td><%=rs.getString("Transporter") %></td>
					    			<td><%=rs.getString("VehRegNo")%></td>
					    			<td><%=rs.getString("DriverName")%></td>
					    			<td><%=rs.getString("UnitID")%></td>
					    			<td><%=rs.getString("EnterDate")%></td>
					    			<td><%=rs.getString("Location")%></td>
					    			<td><%=rs.getString("Technician")%></td>
					    			<td><%=rs.getString("Amount")%></td>
					    			<td><%=rs.getString("Comment")%></td>
					    		</tr>
					    		<% 
					    			}
					    		%>
					    </table>
					    
					   </td>
				</tr>
				
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
		
  <div id="copyright">
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
