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
Connection con1;
%>
<form name="dets" method="get"  action="dispunitsreceived.jsp" onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	ResultSet rs1=null;
	String sql1="", sql2="";
	String comment=request.getParameter("comment");
	String commentdesc=request.getParameter("comdesc");
	String dte=request.getParameter("date");

	if(!(comment==null))
	{ %>
		<center>
		<table border="10" width="450px">
			<tr>
				<td align="center"> <font color="maroon" > <B> Comments on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dte))%> </B></font> </td>
			</tr>
			<tr>
				<td> <%=commentdesc%> </td>
			</tr>
		</table>		
<%	}
	else 
	{ 
		String tech=request.getParameter("tech");
%>		
		<center>
		<table border="10" width="450px">
			<tr>
				<td align="center" colspan="3"> <font color="maroon" > <B> Special Comments on <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dte))%> </B></font> </td>
			</tr>
			<tr> 
				<td align="center"> <font color="maroon" > Sr. No</font> </td>
				<td align="center"> <font color="maroon" > Sp. Comment</font> </td>
				<td align="center"> <font color="maroon" > Closed</font> </td>			
			</tr>
<%
	int i=1;
	sql1="select * from t_techspecialrep where TechName='"+tech+"' and EntDateTime like '"+dte+" %' ";
	
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{ %>
		<tr>
				<td align="center">  <%=i%> </td>
				<td>  <%=rs1.getString("SpComment")%> </td>
				<td>  <%=rs1.getString("Closed")%> </td>
		</tr>		
<%	
		i++;
	}	
%>
			
		</table>	
<%	}
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();

}
%>
	

