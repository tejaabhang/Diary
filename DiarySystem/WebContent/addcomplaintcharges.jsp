<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">

function validate()
{
	var v1=document.editcompamnt.complaint.value;
	var v2=document.editcompamnt.amount.value;

	if(v1<2)
	{
		alert("Please enter Complaint Name");
		return false;
	}
	
	if(v2=="")
	{
		alert("Please enter Amount");
		return false;
	}
	if(isNaN(v2))
	{
		alert("Please enter valid Amount");
		return false;
	}
	return true;	
}

</script>
</head>

<%! 
Connection con1,con2;
%>
<form name="editcompamnt" action="" method="get" onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmtinsert=con2.createStatement();
	
	ResultSet rs1=null;
	String sql1="";
	
%>
	<table border="10" width="350px">
		<tr>
			<td> <div align="center"> <B> Complaint </B> </div> </td>
			<td> <div align="center"> <B> Amount </B> </div> </td>
		</tr>
		<tr>
			<td> <div align="center"> <textarea name="complaint" class="formElement" >  </textarea> </div> </td>
			<td> <div align="center"> <input type="text" name="amount" value="" class="formElement" size="10"/> </div> </td>
		</tr>	
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement"></td>
		</tr>	
	</table>
<%
	String newcompl=request.getParameter("complaint");
	if(newcompl==null)
	{
	}
	else
	{
		String newamount=request.getParameter("amount");

		sql1="insert into t_specialcomp (Complaint, Amount,CompStatus) values ('"+newcompl+"', '"+newamount+"','Yes') ";
		//Query for t_sqlquery
			String abcd=sql1.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		//out.print(sql1);
		stmt1.executeUpdate(sql1);
%>
		<table border="0" width="350px">
		<tr>
			<td align="center"> <font color="maroon"> <B> Successfully Inserted </b> </font> </td>
		</tr>
		<tr>
			<td> <font color="maroon">
			 Please refresh the Complaint Charges page to reflect the Changes.
			 </font> </td>
		</tr>
		</table>
<%	}
	
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
	
