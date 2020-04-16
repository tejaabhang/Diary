<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename=showdatex+"_"+request.getParameter("trans")+"_Rep_history_report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%><%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate,username,ui,insdate;
int repcount;
%>
<!--- code start here ------>
<%
repcount=0;
transporter=request.getParameter("trans");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
Svehlist="(0";
username=session.getAttribute("username").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st2=conn1.createStatement();
	//out.print(transporter);
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="3">
	Maintenance History of Transporter <%=transporter%></font>
	</td></tr>	
	<tr><td>
	<table border="0" width="100%">
	<tr>
	<td><font  size="2">Sr.</font></td>
	<td><font  size="2">Vehicle Reg. No</font></td>
	<td><font  size="2">Unit ID</font></td>
	<td><font  size="2">Install Date</font></td>
	<td><font  size="2">Total Replacement</font></td>
	</tr>	
	<%
	String us=username.toUpperCase();
		if(us.equals("CASTROL"))
		{
			sql="select * from t_vehicledetails where vehicleCode in (select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"')";
		}
		else
		{
		sql="select *  from t_vehicledetails where OwnerName='"+transporter+"' and Status <> 'Deleted'";
		}
		//sql="select * from t_vehicledetails where OwnerName='"+transporter+"' and Status <> 'Deleted'";	
		ResultSet rst=st1.executeQuery(sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst.getString("VehicleRegNumber")%></td>
		<td><div align="right"><%
			//ui=rst.getString("TheFieldFromEmailAddress");	
			//ui=ui.substring(2,ui.indexOf("@"));
			ui=rst.getString("UnitId");	
			out.print(ui);	
		%>
		</div>		
		</td>
		<td><%
		if(null==rst.getString("InstalledDate"))
		{
		sql="select * from t_unitreplacement where NewUnitID='"+ui+"' order by InstDate limit 1";
		ResultSet rst1=st2.executeQuery(sql);
		if(rst1.next())
		{
			try{
			out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate")));
			insdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("InstDate"));
			}catch(Exception e)
			{
			
			}
		}
		}
		else
		{		
		try{
		out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstalledDate")));
		insdate=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("InstalledDate"));
		}catch(Exception e)
			{
			}
		}
		%></td>
		<td><div align="right">
		<%
		sql="select count(*) as count from t_unitreplacement where VehRegNo='"+rst.getString("VehicleRegNumber")+"' and InstType='Rep'";		
		ResultSet rst2=st2.executeQuery(sql);
		if(rst2.next())
		{
		
			out.print(rst2.getInt("count"));
		}
		%>		
		</div>
		</td>
		</tr>		
		
		<%
		i++;
		}
		
	%>
	</table>
	</td></tr>
	<tr><td><div align="right"><font color="brown" size="3">Total Replacement Count =</font><font color="red" size="3"> <%=repcount%></font></div></td></tr>
	</table>
	<%
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