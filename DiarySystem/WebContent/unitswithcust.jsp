<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
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

	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con1.createStatement(), stmt4=con2.createStatement(), stmt5=con1.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null;
String sql1="", sql2="", sql3="", sql4="", sql5="";

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
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="3"> <B> Units with <%=transp%></B> </font> </td>
		</tr>
	</table>
	<table class="stats">
		<tr>
			
			<td> <B> Sr. No </B> </td>
			<td> <B> Unit Id </B> </td>	
			
			<td> <B> Date </B> </td>
			<td> <B> Location </B> </td>
			<td> <B> Technician </B> </td>
						
		</tr>
<%
	int i=0;	

/* ***************************************Checking for Removal or Deletion *******************************************/
	sql1="select * from t_unitreplacement where InstType in ('Rem', 'Del') and OldUnitWith='"+transp+"' order by EntDate desc";
//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		
		String remdate=rs1.getString("EntDate");
		String unitid=rs1.getString("OldUnitId");
		
		sql2="select * from t_unitreceived where UnitId='"+unitid+"' and RDate > '"+remdate+"' ";
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
					
		}
		else
		{ 
			if(!(unitid.equals("-")))
			{
				sql5="select * from t_unitreplacement where NewUnitId='"+unitid+"' and Instdate > '"+remdate+"' ";
				rs5=stmt5.executeQuery(sql5);
				if(rs5.next())
				{
					// Returned
				}
				else
				{	
					i++;
		%>
					<tr>
						<td> <%=i%> </td>
						<td> <%=unitid%></td>
						<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate")))%></td>
						<td> <%=rs1.getString("InstPlace")%></td>
						<td> <%=rs1.getString("InstBy")%></td>
				
					</tr>		
	<%			}
			}	
		}
		
		
	}	
	
	/* *************************************Checking for Replacement ************************************************/ 
		sql3="select * from t_unitreplacement where InstType = 'Rep' and OwnerName='"+transp+"' order by EntDate desc";
		rs3=stmt3.executeQuery(sql3);
		while(rs3.next())
		{
				
			String remdate1=rs3.getString("EntDate");
			String unitid1=rs3.getString("OldUnitId");
			
			sql4="select * from t_unitreceived where UnitId='"+unitid1+"' and RDate > '"+remdate1+"' ";
			rs4=stmt4.executeQuery(sql4);
			if(rs4.next())
			{
						
			}
			else
			{ 
				if(!(unitid1.equals("-")))
				{	
					sql5="select * from t_unitreplacement where NewUnitId='"+unitid1+"' and Instdate > '"+remdate1+"'";
					rs5=stmt5.executeQuery(sql5);
					if(rs5.next())
					{
						// Returned
					}
					else
					{	
						i++;
			%>
					
						<tr>
							<td> <%=i%> </td>
							<td> <%=unitid1%></td>
							<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs3.getString("EntDate")))%></td>
							<td> <%=rs3.getString("InstPlace")%></td>
							<td> <%=rs3.getString("InstBy")%></td>
					
						</tr>
			<%	
					}
				}	
		}
			
		}
		
	
%>
	</table>
<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>
