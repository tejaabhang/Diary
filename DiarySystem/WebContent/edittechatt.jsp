<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<script language="javascript">

function validate()
{
	var v2=document.editatten.cmnt.value;
	
	if(v2.length < 2)
	{
		alert("Please enter Comment");
		return false;
	}
	return true;
}

</script>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="editatten" method="get"  action="" onsubmit="return validate();">

<%!
Connection con1,con2;
%>
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

String comment="", oldpresent="", oldholiday="";

String present=request.getParameter("present");
String holiday=request.getParameter("holiday");
if(present==null)
{
	String srid=request.getParameter("srid");
	String tech=request.getParameter("tech");
	String dte=request.getParameter("dte");

	sql1="select * from t_techattendance where SrNo='"+srid+"' ";
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		comment=rs1.getString("Comment");
		oldpresent=rs1.getString("Present");
		oldholiday=rs1.getString("Holiday");
	}	

%>
<input type="hidden" name="srno" value="<%=srid%>" />
<center>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B>  Edit <%=tech%>'s Attendance on <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(dte))%> </B> </font> </td>
		</tr>
	</table>
	<table class="stats">
		<tr>
			<td> <B> Present </B>
			</td>
			<td> <B> Holiday </B> </td> 
				
			<td> <B> Comment </B>
			</td>
		</tr>
		<tr>
			<td> 
			<%  if(oldpresent.equals("Yes"))
			    { %>
				<input type="radio" name="present" value="Yes" checked>Yes</input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="present" value="No" >No</input>
				<input type="radio" name="present" value="Half Day" >Half Day</input>
<%			    }
			    else if(oldpresent.equals("No"))
			   { %>
				<input type="radio" name="present" value="Yes" >Yes</input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="present" value="No" checked>No</input>	
				<input type="radio" name="present" value="Half Day" >Half Day</input>
<%			   }  
				else 
			   { %>
				<input type="radio" name="present" value="Yes" >Yes</input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="present" value="No" checked>No</input>	
				<input type="radio" name="present" value="Half Day" checked>Half Day</input>
<%			   } %>	
			</td>
			<td>
			<%    if(oldholiday.equals("Yes"))	
			      { %>	
					<input type="radio" name="holiday" value="Yes" checked>Yes</input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="holiday" value="No">No</input>
		        <%    } 
			      else	
			      { %>
					<input type="radio" name="holiday" value="Yes" >Yes</input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="holiday" value="No" checked>No</input>
			<%    } %>			
			</td>
			<td>
				<textarea name="cmnt" class="formElement"><%=comment%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" name="submit" value="Update" class="formElement" />
			</td>
		</tr>

		
	</table>
<%
}
else
{
	String cmnt=request.getParameter("cmnt");
	String srno=request.getParameter("srno");
	
	
	sql2="update t_techattendance set Present='"+present+"', Holiday='"+holiday+"', Comment='"+cmnt+"' where SrNo='"+srno+"' ";
	//Query for t_sqlquery
		String abcd=sql2.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

	stmt1.executeUpdate(sql2);
%>	
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon"> <B> Successfully Updated. Please refresh Tech Attendance Report to view the changes.</B> </font> </td>
		</tr>
		
	</table>
<%
}

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>

