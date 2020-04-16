<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<head>
<link href="css/css.css" rel="StyleSheet" type="text/css"></link>
</head>
<body>
<form name="dets" method="get"  action="" onsubmit="return validate();">

<%!
Connection con1, con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="", sql2="";
	String transp=request.getParameter("trans");
	String nounitselected=request.getParameter("nounitselected");
	if(nounitselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
		<tr>	
			<td align="center"> <font color="maroon" > No check-box was selected.  </font> </td>
		</tr>
		</table>
<%	}
	String updated=	request.getParameter("updated");
	if(updated==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
		<tr>	
			<td align="center"> <font color="maroon" >Successfully Updated. </font> </td>
		</tr>
		</table>
<%	}	
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<tr>
	<td> <div align="center"> <font color="#2A0A12" size="2"> <B> Note:</B>If check-box is missing, it means, that Unit has been received.  </font> </div> </td>
</tr>
</table>
<br><br>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Last 5 Dispatches to <%=transp%></b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
	<table border="1" width="750px" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			<td> </td>
			<td> <B> Sr. No </B> </td>
			<td> <B> Unit Id </B> </td>	
			
			<td> <B> Peripheral </B> </td>
			<td> <B> Disp Date </B> </td>
			<td> <B> Cust Loc </B> </td>
			<td> <B> Mode of Disp </B> </td>
			<td> <B> Disp Name </B> </td>
			<td> <B> Chalan No </B> </td>
			
		</tr>
<%
	int i=0, k=1;	

String cntr=request.getParameter("cntr");
if(cntr==null)
{	
	sql1="select * from t_unitorder where Cust like '%"+transp+"%' and Status <> 'Open' order by ReqDate desc limit 5";
}
else
{
	sql1="select * from t_unitorder where Cust like '%"+transp+"%' and Status <> 'Open' order by ReqDate desc ";
}
	rs1=stmt2.executeQuery(sql1);
	while(rs1.next())
	{
		String orderno=rs1.getString("Reqno");
		i++;
%>
		<tr>
			<td colspan="9" align="center"> <B> Dispatch <%=i%> </B> </td>
		</tr>
		
<%		
		int j=0;
		sql2="select * from t_unitmaster where OrderNo='"+orderno+"' ";
		rs2=stmt1.executeQuery(sql2);
		while(rs2.next())
		{
			String received=rs2.getString("RecByCust");
			j++;
%>
		<tr> 
<%
		if(received.equals("Yes"))
		{ %>
			<td> </td>
<%		}
		else
		{ %>	<td> <input type="checkbox" name="disp<%=k%>" value="disp<%=k%>" /> </td>
<%		} %>	
			<td> <%=j%> </td>
			<td> <%=rs2.getString("UnitId")%> </td>
			
			<td> <%=rs2.getString("Peripherals")%> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("DispDate")))%> </td>
			<td> <%=rs2.getString("DisAdd") %></td>
			<td> <%=rs2.getString("ModeofDispatch")%> </td>
			<td> <%=rs2.getString("DisName")%> </td>
			<td> <%=rs2.getString("ChalanNo")%>
<input type="hidden" name="unitid<%=k%>" value="<%=rs2.getString("UnitId")%>" />
<input type="hidden" name="orderno<%=k%>" value="<%=orderno%>" /> </td>
		</tr>
<%
			k++;
		}
		
	}

%>
		<tr>
			<td colspan="9"> <div align="center">
				<input type="submit" name="Submit" value="Received" class="formElement" onClick="dets.action='last3dispinsrt.jsp'; return true;"/>
				<input type="submit" name="submit1" value="Show More" class="formElement"onClick="dets.action=''; return true;"/> 
			</div></td>
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
</form>
</body>
</html>