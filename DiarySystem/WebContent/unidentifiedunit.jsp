<%@ include file="header.jsp" %>


<%!
Connection con1, con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con2.createStatement(), stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt4=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null;
String sql1="", sql2="", sql3="", sql4="";
%>

<table border="1" width="100%"
	<tr>
		<th div align="center" colspan="7"> <B> UNIDENTIFIED UNITS</B> </th>
	</tr>
	<tr>
		
		<th> Last Dispatch By </th>
		<th> Dispatch Location </th>
		<th> Disp Date </th>
		<th> Disp Person/Courier</th>
		<th> Disp Cust </th>
		<th> Last Data Date </th>		
		<th> Last Data Location </th>
	</tr>


<%
int i=1;
sql1="select * from t_unitmaster where TypeUnit <> 'IP' and UnitId not in (select UnitID from t_vehicledetails) order by UnitId";
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
	String unitid="", dispby="", disadd="", disdate="", lastdate="", lastloc="", disname="", orderno="", dispcust="";
	unitid=rs1.getString("UnitId");

	sql2="select * from t_unitmasterhistory where UnitId='"+unitid+"' order by Dispdate desc limit 1";
	rs2=stmt2.executeQuery(sql2);
	if(rs2.next())
	{
		dispby=rs2.getString("User");
		disadd=rs2.getString("DisAdd");
		disdate=rs2.getString("DispDate");
		disname=rs2.getString("DisName");
		orderno=rs2.getString("OrderNo");
	}

	sql3="select * from allconnectedunits where UNitId='"+unitid+"' ";
	rs3=stmt3.executeQuery(sql3);
	if(rs3.next())
	{
		lastdate=rs3.getString("TheDate");
		lastloc=rs3.getString("Location");
	}

	sql4="select * from t_unitorder where Reqno='"+orderno+"' ";
	rs4=stmt4.executeQuery(sql4);
	if(rs4.next())
	{
		dispcust=rs4.getString("Cust");
	}

%>
	<tr> 
		<td> <%=i %> </td>
		<td> <%=unitid %> </td>
		<td> <%=dispby %> </td>
		<td> <%=disadd %> </td>
		<td> <%=disdate %> </td>
		<td> <%=disname %> </td>
		<td> <%=dispcust %> </td>
		<td> <%=lastdate %> </td>
		<td> <%=lastloc %> </td>
	</tr>	
<%
	i++;
}		
%>

</table>

<%
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();

}
%>