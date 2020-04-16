<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="dets" method="get"  action="" onsubmit="return validate();">

<%!
Connection con1, con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con2.createStatement();

ResultSet rs1=null,rs2=null, rs3=null;
String sql1="", sql2="", sql3="";

String transp=request.getParameter("trans");
String cntr=request.getParameter("cntr");
//out.print(transp);

%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Last 5 Receivals from <%=transp%></b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
	<table border="1" width="750px" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			<td> <B> Sr. No </B> </td>
			<td> <B> Unit Id </B> </td>	
			<td> <B> Peripherals </B> </td>	
			<td> <B> Rec Date </B> </td>
			<td> <B> Chalan No </B> </td>
			<td> <B> Received </B> </td>
			<td> <B> Ent. By </B> </td>
			
		</tr>
<%
	int i=0, k=1;	
if(cntr==null)
{
	sql1="select distinct(DC_No) from t_unitreceived where Transporter like '%"+transp+"%' and Status = 'True' order by RDate desc limit 5";
}
else
{
	sql1="select distinct(DC_No) from t_unitreceived where Transporter like '%"+transp+"%' and Status = 'True' order by RDate desc";
}
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String dcno=rs1.getString("DC_No");
		
		i++;
%>
		<tr>
			<td colspan="9" align="center"> <B> Receival <%=i%> </B> </td>
		</tr>
		
<%		
		int j=0;
		sql2="select * from t_unitreceived where DC_No='"+dcno+"' and Transporter like '%"+transp+"%'";
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next())
		{
			String periph="";	
			sql3="select * from t_unitmasterhistory where UnitId='"+rs2.getString("UnitId")+"' and EntDate <= '"+rs2.getString("RDate")+"' order by EntDate asc limit 1 ";
			rs3=stmt3.executeQuery(sql3);
			if(rs3.next())
			{
				periph=rs3.getString("Peripherals");
			}

			j++;
%>
		<tr> 

			<td> <%=j%> </td>
			<td> <%=rs2.getString("UnitId")%> </td>
			<td> <%=periph%> </td>	
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("RDate")))%> </td>
			<td> <%=rs2.getString("DC_No")%> </td>
			<td> <%=rs2.getString("InTransit")%> </td>
			<td> <%=rs2.getString("EntBy")%> </td>
		</tr>
<%
			k++;
		}
		
	}

%>
		<tr>
			<td colspan="7"><div align="center"> <input type="submit" name="submit" value="Show All" class="formElement" /></div>
		</tr>
	</table>
<input type="hidden" name="cntr" value="<%=k%>" />
<input type="hidden" name="trans" value="<%=transp%>" />
<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();

}

%>