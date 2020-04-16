<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<script language="javascript">
function validate()
{ 
	var tech=document.transferunits.techlist.value;
	var cust=document.transferunits.custlist.value;
	var cmnt=document.transferunits.cmnt.value;
	
	if(tech=="Select" && cust=="Select")
	{
		alert("Please select Tech name or Cust Name from the List");
		return false;
	}

	if(tech!="Select" && cust!="Select")
	{
		alert("You can only select one at a time (Tech or Cust)");
		return false;
	} 	

	if(document.transferunits.unittype[0].checked==false && document.transferunits.unittype[1].checked==false)
	{
		alert("Please select Transfer as (New or Faulty)");
		return false;
	}

	if(cmnt.length < 2)
	{
		alert("Please enter Comment");
		return false;
	}
		
	return true;
}
</script>

<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="transferunits" method="get"  action="transrunitsfrmtech.jsp" onsubmit="return validate();">

<%!
Connection con1, con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con1.createStatement();

ResultSet rs1=null, rs2=null, rs3=null;
String sql1="", sql2="", sql3="";

String typ=request.getParameter("type");
String holdername=request.getParameter("holdername");

%> 
<center>
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
			<td align="center"> <font color="maroon" >Successfully Updated. </font> </td>
		</tr>
		</table>
<%	}	
%>
	<table width="300px" border="0">
		<tr> 
			<td align="center"> <font color="maroon"> <B> Units (<%=typ%>) with <%=holdername%> </B> </font> </td>
		</tr>	
	</table>
<%
	int i=1;
if(typ.equals("New"))
{
	sql1="select * from t_unitmaster where HoldBy='"+holdername+"' and FaultyUnit='No' order by UnitId asc ";
}
else
{
	sql1="select * from t_unitmaster where HoldBy='"+holdername+"' and FaultyUnit='Yes' order by UnitId asc ";

}	
	
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

	sql2="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc";
	rs2=stmt2.executeQuery(sql2);
%>
		<tr>
			<td colspan="5" align="center">
				<table border="1" width="420px">
					<tr>
						<td align="center" colspan="2"> <font color="maroon" > Transfer To </font>  		 	</td>
					</tr>
					<tr>
						<td align=""> <label for="Tech" class="formElement"> <B>Tech:</B></label> <select name="techlist" class="formElement"> 	
						<option value="Select">Select</option>	
<%
						while(rs2.next())
						{ %>
							<option value="<%=rs2.getString("tech")%>"><%=rs2.getString("tech")%></option>
<%						}
%>
							
						     </select> &nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
			sql3="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
			rs3=stmt3.executeQuery(sql3);
%>						      
						  		 <label for="Cust" class="formElement"> <B>Cust:</B></label> <select name="custlist" class="formElement"> 	
								<option value="Select">Select</option>
								<%
									while(rs3.next())
									{ %>
										<option value="<%=rs3.getString("cust")%>"><%=rs3.getString("cust")%></option>
<%									}
%>
								</select>	
							</td>
						  </tr>   
						  
						     <tr>
						     <td align="center">
						<label for="Transferas" class="formElement"> <B> Transfer as: </B> </label>	<input type="radio" name="unittype" value="Okay"> Okay</input> 			<input type="radio" name="unittype" value="Faulty">Faulty</input> 
						</td>
					</tr>
					<tr>
						<td align="center"> <label for="Comment" class="formElement"> <B> Comment: </B> </label> <textarea name="cmnt" class="formElement"> </textarea> </td>
					</tr>
					<tr>
						<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer" class="formElement" /> </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="type" value="<%=typ%>" />	
<input type="hidden" name="holdername" value="<%=holdername%>" />	

<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>
