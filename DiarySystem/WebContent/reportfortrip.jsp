<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename=""+showdatex+"Device_Disconnected_vehicles_in_trip.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st, st1, st2, st3;
String sql,sql1,sql2;
String transporter,today,Svehlist,olddate,lastday;
%>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
long miliseconds1=defoultdate.getTime();
miliseconds1=miliseconds1-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
defoultdate.setTime(miliseconds1);
lastday=formatter.format(defoultdate);
//out.print(today+"  "+lastday+"  "+olddate);
try{
	Class.forName("org.gjt.mm.mysql.Driver");
	conn =  DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	sql="select * from db_gps.t_onlinedata where TheDate <'"+olddate+"' order by TheDate Desc";
	//out.print(sql);
	ResultSet rst1=st.executeQuery(sql);
	int i=1;
	%>
	<table border="0" width="90%" align="center">
	<tr><td colspan="7">vehicles whose devices are disconnected and loaded on <%=new SimpleDateFormat("dd-MMM-yyyy").format(defoultdate)%></td>
	<tr>
	<td>Sr.</td>
	<td>Veh Reg. No.</td>
	<td>Transporter</td>
	<td>Disconnected Date</td>
	<td>Trip Date</td>
	<td>Origin</td>
	<td>Destination</td>
	</tr>
	<%
	while(rst1.next())
	{
	sql1="select * from db_gps.t_startedjourney where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and StartDate >='"+lastday+"' order by StartDate desc limit 1";
	ResultSet rst2=st1.executeQuery(sql1);
	while(rst2.next())
	{
	%>
	<tr>
	<td><%=i%></td>
	<td><%=rst2.getString("VehRegNo")%></td>
	<td><%=rst1.getString("Transporter")%></td>
	<td><%="'"+new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))+"'"%></td>
	<td><%="'"+new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("StartDate"))+"'"%></td>
	<td><%=rst2.getString("StartPlace")%></td>
	<td><%=rst2.getString("EndPlace")%></td>
	</tr>
	<%
	i++;
	}
	}
	%>
	</table>	
	<%
}catch(Exception e)
{
	out.print("Exception--->"+e);
}
%>

