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
	
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	
	ResultSet rs1=null;
	String sql1="", sql2="";
	String complaint="", amount=""; 

	String complid=request.getParameter("complid");
		
	sql1="select * from t_specialcomp where Sr='"+complid+"' ";
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		complaint=rs1.getString("Complaint");
		amount=rs1.getString("Amount");
	}
%>
 	<input type="hidden" name="compid" value="<%=complid%>" />
	
	<table border="10" width="350px">
		<tr>
			<td> <div align="center"> <B> Complaint </B> </div> </td>
			<td> <div align="center"> <B> Amount </B> </div> </td>
		</tr>
		<tr>
			<td> <div align="center"> <textarea name="complaint" class="formElement" > <%=complaint%> </textarea> </div> </td>
			<td> <div align="center"> <input type="text" name="amount" value="<%=amount%>" class="formElement" size="10"/> </div> </td>
		</tr>	
		<tr>
			<td colspan="2" align="center"> 
  				<table border="0" width="100%">
			          <tr> 
					<td align="center"> <input type="submit" name="update" value="Update" class="formElement"> &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" name="delete" value="Delete" class="formElement">			</td>	
			          </tr>    
				</table>
		</tr>	
	</table>
<%
	String compid=request.getParameter("compid");
	if(compid==null)
	{
	}
	else
	{
		String complidtxtbx=request.getParameter("compid");
		String newcompl=request.getParameter("complaint");
		String newamount=request.getParameter("amount");

		String delsubm=request.getParameter("delete");	
		
		if(delsubm==null)
		{
			sql2="update t_specialcomp set Complaint='"+newcompl+"', Amount='"+newamount+"' where Sr='"+complidtxtbx+"' ";
			
		}
		else
		{
			sql2="delete from t_specialcomp where Sr='"+complidtxtbx+"' ";
		}
		//Query for t_sqlquery
			String abcd=sql2.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

			stmt1.executeUpdate(sql2);
%>
		<table border="0" width="350px">
			<tr>
				<td align="center"> <font color="maroon"> <B> Done. </b> </font> </td>	
			</tr>
			<tr>
				<td> <font color="maroon">
				 Please refresh the Complaint Charges page to reflect the Changes.
				 </font> </td>
			</tr>
		</table>
<%		
	}
	
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
	
