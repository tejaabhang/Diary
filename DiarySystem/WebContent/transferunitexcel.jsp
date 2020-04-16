<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<% response.setContentType("application/vnd.ms-excel");

String filename="Dailyreport_callocated.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate;
int Ocount,Icount,CAcount,CScount,URcount,NIcount,OCcount,ICcount,NCcount,RCAcount,SPcount;
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

try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	fromdate=request.getParameter("d1");
	todate=request.getParameter("d2");
	

	%>
			<table border="1" width="100%" class="sortable">
				<div align="center"><font color="brown" size="2">From Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> To Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></div>
				<tr>
				<td>Sr No.</td>
				<td>Unit ID</td>
				<td>Transfer Date</td>
				<td>Transfer From</td>
				<td>Transfer To</td>
				<td>Transfer by</td>
				</tr>			
				<%
				sql="select * From t_unitmasterhistory where ModeofDispatch='Transfer' and TransDate >='"+fromdate+"' and TransDate <='"+todate+"' order by TransDate desc";	
				ResultSet rst=st2.executeQuery(sql);
				int i=1;
				while(rst.next())
				{	
					%>
					<tr>
					<td><%=i %></td>
					<td><%=rst.getString("UnitID") %></td>
					<td><%=rst.getString("TransDate") %></td>
					<td><%=rst.getString("DisName") %></td>
					<td><%=rst.getString("DisAdd") %></td>
					<td><%=rst.getString("EntBy") %></td>
					</tr>
					
					<%
					
					i++;
				}
				%>
							
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
