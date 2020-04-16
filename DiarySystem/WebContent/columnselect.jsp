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
<form name="editcompamnt" action="" method="get" onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	ResultSet rs1=null;
	String sql1="";
%>
	<table border="1" width="350px" class="stats">
		<tr>
			<td> <div align="left"> <input type="checkbox" name="cust" value="cust" checked> Customer</input> </div> </td>
			<td> <div align="left"> <input type="checkbox" name="group" value="group" checked> Group</input> </div> </td>
			<td> <div align="left"> <input type="checkbox" name="veh" value="veh" checked> Vehicle</input></div> </td>
			<td> <div align="left"> <input type="checkbox" name="unitid" value="unitid" checked> Unit Id </input> </div></td>		
		</tr>
		<tr>
			<td> <div align="left"> <input type="checkbox" name="simno" value="simno" checked> Sim No </input> </div></td>
			<td>  <div align="left"><input type="checkbox" name="mobno" value="mobno" checked> Mobile No</input> </div></td>
			<td>  <div align="left"><input type="checkbox" name="lastdate" value="lastdate" checked> Last Date</input> </div></td>
			<td>  <div align="left"><input type="checkbox" name="lastloc" value="lastloc" checked> Last Location </input> </div></td>			
		</tr>
		<tr>
			<td>  <div align="left"><input type="checkbox" name="instdate" value="instdate" checked> Inst Date </input> </div></td>
			<td>  <div align="left"><input type="checkbox" name="instplace" value="instplace" checked> Inst. Place</input> </div></td>
			<td> <div align="left"> <input type="checkbox" name="instby" value="instby" checked> Inst. By</input> </div></td>
			<td>  <div align="left"><input type="checkbox" name="entby" value="entby" checked> Entered By. </input></div> </td>			
		</tr>
		<tr>
			<td> <div align="left"><input type="checkbox" name="repdate" value="repdate" checked> Replaced Date</input> </div></td>
			<td> <div align="left"><input type="checkbox" name="replby" value="replby" checked> Replaced By</input> </div></td>
			<td> <div align="left"><input type="checkbox" name="oldunit" value="oldunit" checked> Old Unit</input> </div></td>
			<td> <div align="left"> <input type="checkbox" name="dispdate" value="dispdate" checked> Disp. Date </input> </div></td>			
		</tr>
		<tr>
			<td colspan=""> <div align="left"><input type="checkbox" name="dispto" value="dispto" checked> Disp. To</input> </div></td>
			<td colspan="">  <div align="left"><input type="checkbox" name="dispby" value="dispby" checked> Disp. By</input></div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="inwarranty" value="inwarranty" checked> In Warranty</input></div> </td>
		</tr>
		<tr>
			<td colspan="4"> <div align="center"> <input type="submit" name="Submit" value="Submit" class="formElement" /> </div> </td>
		</tr>
	</table>
<input type="hidden" name="submitted" value="yes" />

<%
	String submitted=request.getParameter("submitted");
	if(submitted==null)
	{
	}
	else
	{ %>
		<table class="stats">
			<tr>
				<td> <font color="maroon"> <B> Your choices have been saved successfully </B> </font> </td>	
			</tr>
		</table>
<%
		session.setAttribute("customizedcols","Yes");
	
		String cust=request.getParameter("cust");
		String group=request.getParameter("group");
		String veh=request.getParameter("veh"); 
		String unitid=request.getParameter("unitid");
		session.setAttribute("cust",cust);
		session.setAttribute("group",group);
		session.setAttribute("veh",veh);
		session.setAttribute("unitid",unitid);

		String simno=request.getParameter("simno");
		String mobno=request.getParameter("mobno");
		String lastdate=request.getParameter("lastdate");
		String lastloc=request.getParameter("lastloc");
		session.setAttribute("simno",simno);
		session.setAttribute("mobno",mobno);
		session.setAttribute("lastdate",lastdate);
		session.setAttribute("lastloc",lastloc);


		String instdate=request.getParameter("instdate");
		String instplace=request.getParameter("instplace");
		String instby=request.getParameter("instby");
		String entby=request.getParameter("entby");
		session.setAttribute("instdate",instdate);
		session.setAttribute("instplace",instplace);
		session.setAttribute("instby",instby);
		session.setAttribute("entby",entby);

		String repdate=request.getParameter("repdate");
		String replby=request.getParameter("replby");
		String oldunit=request.getParameter("oldunit");
		String dispdate=request.getParameter("dispdate");
		session.setAttribute("repdate",repdate);
		session.setAttribute("replby",replby);
		session.setAttribute("oldunit",oldunit);
		session.setAttribute("dispdate",dispdate);

		String dispto=request.getParameter("dispto");
		String dispby=request.getParameter("dispby");
		String inwarranty=request.getParameter("inwarranty");

		session.setAttribute("dispto",dispto);
		session.setAttribute("dispby",dispby);
		session.setAttribute("inwarranty",inwarranty);
		
	}
%>
<%	
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();

}
%>
