<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<script language="javascript">
function validate()
{
	var cust=document.transferunits.custlist.value;
	
	if(cust=="Select")
	{
		alert("Please select Cust name from the List");
		return false;
	}

	if(document.transferunits.unittype[0].checked==false && document.transferunits.unittype[1].checked==false)
	{
		alert("Please select Transfer as");
		return false;
	}
	return true;
}
</script>


<form name="transferunits" method="get"  action="transfunitscust.jsp" onsubmit="return validate();">

<%!
Connection con1;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	

Statement stmt1=con1.createStatement();

ResultSet rs1=null, rs2=null;
String sql1="", sql2="";

String holdby=request.getParameter("holdby");
String holdername=request.getParameter("holdername");

//out.print(holdby);
//out.print(holdername);

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
			<td align="center"> <font color="maroon" >Successfully Updated. </font> </td>
		</tr>
		</table>
<%	}	

%> 
<center>
	<table width="400px" border="0">
		<tr> 
			<td align="center"> <font color="maroon"> <B> Units with <%=holdername%> (<%=holdby%>)  </B> </font> </td>
		</tr>	
	</table>
<%
	int i=1;
	sql1="select * from t_unitmaster where HoldBy='"+holdername+"' order by UnitId asc ";
	rs1=stmt1.executeQuery(sql1);	
%>
	<table width="400px" border="10">
		<tr>
			<th> </th>
			<th align="center"> Sr. No </th>
			<th align="center"> Unit Id </th>
			<th align="center"> Peripherals </th>
			<th align="center"> Disp. Date </th>
		</tr>
<%
	while(rs1.next())	
	{ 

		String nwfrmtdte="";
		try{
	 		java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("DispDate"));
        	        Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
 		        nwfrmtdte=formatter.format(datefrmdb);
		} catch(Exception e)
			{
				nwfrmtdte=rs1.getString("DispDate");
			}
%>
		<tr>
			<td> <input type="checkbox" name="disp<%=i%>" value="disp<%=i%>" /> </td>
			<td> <%=i%> </td>
			<td> <%=rs1.getString("UnitId")%> </td>
			<td> <%=rs1.getString("Peripherals")%> </td>
			<td> <%=nwfrmtdte%> </td>
		</tr>
<input type="hidden" name="unitid<%=i%>" value="<%=rs1.getString("UnitId")%>" />
<%	
		i++;
	}

	sql2="select distinct(TypeValue) as typval from t_security where TypeofUser = 'Transporter' order by TypeValue asc";
	rs2=stmt1.executeQuery(sql2);
%>
		<tr>
			<td colspan="5" align="center">
				<table border="1" width="400px" align="center">
					<tr>
						<td align="center" colspan="2"> <font color="maroon" > Transfer Details </font>  		 	</td>
					</tr>
					<tr>
						<td align="center"> <label for="Cust" class="formElement"> <B>Cust:</B></label> <select name="custlist" class="formElement"> 	
						<option value="Select">Select</option>	
<%
						while(rs2.next())
						{ %>
							<option value="<%=rs2.getString("typval")%>"><%=rs2.getString("typval")%></option>
<%						}
%>
							
						     </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="Transferas" class="formElement"> <B> Transfer as: </B> </label>	<input type="radio" name="unittype" value="Okay"> Okay</input> 			<input type="radio" name="unittype" value="Faulty">Faulty</input> 
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer" class="formElement" /> </td>
					</tr>
				</table>
			</td>
		</tr>	
		
	</table>
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="holdername" value="<%=holdername%>" />	
<input type="hidden" name="holdby" value="<%=holdby%>" />	

<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();

}

%>
