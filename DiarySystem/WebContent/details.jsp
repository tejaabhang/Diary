<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">


</script>
</head>

<%! 
Connection con1, con2;
%>
<form name="dets" method="get"  action="dispunitsreceived.jsp" onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmt3=con2.createStatement();
	ResultSet rs1=null;
	String sql1="", sql2="";
	String dcno=request.getParameter("dcno");
	String typ=request.getParameter("type");
	String tech=request.getParameter("tech");	
	int i=1;
	//out.print(dcno);
%>
<input type="hidden" name="dcno" value="<%=dcno%>" />

<table class="stats">
<%
	if(typ.equals("Dispatched"))
	{
%>
<tr>
	<td> <div align="left"> <font color="maroon"> <B> Note:</B>If check-box is missing, it means, that Unit has been received.  </font> </div> </td>
</tr>
<%	} %>
<tr> <td> <div align="center">
<%
	String nounitselected=request.getParameter("nounitselected");
	if(nounitselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="350px">
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
		<table border="0" width="350px">
		<tr>	
			<td align="center"> <font color="maroon" >Successfully Updated. Please refresh Technician's Attendance page to reflect the changes.  </font> </td>
		</tr>
		</table>
<%	}	
%>
	<table border="10" width="350px">
		<tr>	
<%
		if(typ.equals("Dispatched"))
		{	%>
			<td colspan="4" align="center"><font color="maroon" size="2"> <%=typ%> Info </font> </td>
<%		} 
		else
		{ %>
			<td colspan="3" align="center"> <font color="maroon" size="2"> <%=typ%> Info </font></td>			
<%		} %>
			
		</tr>
		<tr>
<%
		if(typ.equals("Dispatched"))
		{ %>
			<td> </td>
<%		} %>
			<td> <B> Sr. No.</B> </td>
			<td> <B> Date</B> </td>
			<td> <B> Unit Id</B> </td>			
		</tr>
	
<%
	if(typ.equals("Dispatched"))
	{
		sql1="select * from t_unitmasterhistory where orderNo='"+dcno+"' group by UnitID";
		rs1=stmt2.executeQuery(sql1);
		
	}
	else
	{
		sql1="select * from t_unitreceived where DC_NO='"+dcno+"' and TechName='"+tech+"' and Status <> 'Deleted' ";
		rs1=stmt1.executeQuery(sql1);
	}
	//out.print(sql1);
	
	while(rs1.next())
	{ 
		String received="",RecByTech="";
		String UnitID=rs1.getString("UnitId");
		String sql="select * from db_gps.t_unitmaster where UnitID='"+UnitID+"'";
		ResultSet rs=stmt3.executeQuery(sql);
		if(rs.next()){
			RecByTech=rs.getString("RecByTech");
		}
		if(typ.equals("Dispatched"))
		{
			received=rs1.getString("RecByTech");
		}
%>
		<tr>
<%		if(typ.equals("Dispatched"))
		{ 
			if(RecByTech.equals("Yes"))
			{ %>
				<td> </td>
<%			}
			else
			{ %>
				<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
<%			} %>
<%		} %>
			<td> <%=i%> </td>
<%
		if(typ.equals("Dispatched"))
		{ %>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("DispDate")))%> </td>
<%		}
		else
		{ %>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("RDate")))%> </td>
<%		} %>
			<td> <%=rs1.getString("UnitId")%> </td>		
		</tr>
<input type="hidden" name="unitid<%=i%>" value="<%=rs1.getString("UnitId")%>" />
<%	
		i++;
	} %>
<%
		if(typ.equals("Dispatched"))
		{ %>
			<tr> 
				<td colspan="4" align="center"> <input type="submit" name="Submit" value="Received" class="formElement" /> </td>
			</tr>
			
<%		}	
%>
		
	</table> </div>
</td> </tr> 
</table>
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="tech" value="<%=tech%>" /> 
	
<%	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();

}
%>
	
