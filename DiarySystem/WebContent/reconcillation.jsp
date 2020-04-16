<%@ include file="header.jsp" %>

<%!
Connection con1, con2;
String sql, transporter,group,vehicle, unit, sim, mobile, thedate, location,instdate,instplace,instby,enterby;
String vehcode,replaced,repdate,oldunit,dispdate,dispto,dispby,sql1,sql2;
Statement st, st1,st2,st3,st4,st5,st6; 
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con2.createStatement();
st1=con2.createStatement();
st2=con2.createStatement();
st3=con2.createStatement();
st4=con1.createStatement();
st5=con1.createStatement();
st6=con1.createStatement();
%>
<table border="1" width="100%" align="center">
<tr>
<td>Sr.</td>
<td>Customer</td>
<td>Group</td>
<td>Vehicle</td>
<td>Unit</td>
<td>Sim</td>
<td>Mobile</td>
<td>Updated</td>
<td>Location</td>
<td>InstDate</td>
<td>InstPlace</td>
<td>InstBy</td>
<td>EnterBy</td>
<td>Replaced</td>
<td>Rep Date</td>
<td>Old Unit</td>
<td>Dispatch Date</td>
<td>Dispatch To</td>
<td>Dispatch By</td>
</tr>
<%
sql="select distinct(TypeValue) from t_security where typeOfUser='Transporter' order by TypeValue ";
ResultSet rst=st.executeQuery(sql);
int i=1;
while(rst.next())
{
transporter=rst.getString("TypeValue");
sql1="select * from t_vehicledetails where OwnerName='"+transporter+"'";
ResultSet rst1=st1.executeQuery(sql1);
while(rst1.next())
{
vehcode=rst1.getString("VehicleCode");
sql2="select * from t_group where vehcode='"+vehcode+"'";
ResultSet rst2=st3.executeQuery(sql2);
group="";
while(rst2.next())
{
	group=group+","+rst2.getString("GPName");
}
vehicle=rst1.getString("vehicleregnumber");
unit=rst1.getString("unitid");
instdate=rst1.getString("InstalledDate");
instplace=rst1.getString("InstalledPlace");
instby=rst1.getString("InstalledBy");

sql="select * from t_onlinedata where vehiclecode='"+vehcode+"'";
ResultSet rst3=st2.executeQuery(sql);
thedate="";
location="";
if(rst3.next())
{
	thedate=rst3.getString("TheDate")+" "+rst3.getString("TheTime");
	location=rst3.getString("Location");
}
sql="select * from t_unitmasterhistory where unitid='"+unit+"' order by DispDate desc limit 1";
ResultSet rst4=st2.executeQuery(sql);
sim="";
mobile="";
dispdate="";
dispto="";
dispby="";
if(rst4.next())
{
	sim=rst4.getString("SimNo");
	mobile=rst4.getString("MobNo");
	dispdate=rst4.getString("DispDate");
	dispto=rst4.getString("DisAdd");
	dispby=rst4.getString("DisName");
	
}
sql="select * from t_unitreplacement where NewUnitID='"+unit+"' and instType='New' order by InstDate desc limit 1";
ResultSet rst5=st2.executeQuery(sql);
enterby="";
if(rst5.next())
{
	enterby=rst5.getString("EntBy");
}
sql="select * from t_unitreplacement where vehregno='"+vehicle+"' and InstType='Rep' order by InstDate desc limit 1";
ResultSet rst6=st2.executeQuery(sql);
replaced="No";
repdate="";
oldunit="";
if(rst6.next())
{
	replaced="Yes";
	repdate=rst6.getString("InstDate");
	oldunit=rst6.getString("OldUnitId");
}
%>
<tr>
<td><%=i%></td>
<td><%=transporter%></td>
<td><%=group%></td>
<td><%=vehicle%></td>
<td><%=unit%></td>
<td><%=sim%></td>
<td><%=mobile%></td>
<td><%=thedate%></td>
<td><%=location%></td>
<td><%=instdate%></td>
<td><%=instplace%></td>
<td><%=instby%></td>
<td><%=enterby%></td>
<td><%=replaced%></td>
<td><%=repdate%></td>
<td><%=oldunit%></td>
<td><%=dispdate%></td>
<td><%=dispto%></td>
<td><%=dispby%></td>
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
	out.print("Exception-->"+e);
}
finally
{
	con1.close();
	con2.close();
}
%>