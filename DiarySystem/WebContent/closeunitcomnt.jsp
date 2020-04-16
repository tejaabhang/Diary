<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1;

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">
function closecomment(unit)
{
	//alert("hi");
var srno="";
var flag=false;
	var cntr=document.getElementById("cntr").value;
	//alert(cntr);
	var i=1;

		for(i=1;i<cntr;i++)
		{
			//alert(document.getElementById("del"+i).value);
			if(document.getElementById("del"+i).checked)
			{
				//alert("inside if true");
				flag=true;
				//alert(document.getElementById("techrid"+i).value);
				srno=srno+document.getElementById("srno"+i).value+",";
			}
			
		}
		
		//alert(flag);
		if(flag==false)
		{ 
			alert("Please Select atleast one Checkbox");
			return false;
		}
		//alert(rid);
		var url="closeunitcomment.jsp";
		document.unitclose1.action=url+"?totsrno="+srno+"&unit="+unit+"&confirm=confirmunitreceive";
		document.unitclose1.submit();
		

}




</script>


</head>



  
<!--- code start here ------>

<form name="unitclose1" method="post" action="" >
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="",sql2="";
	int i=1;

	String inserted=request.getParameter("flag");
	if(inserted==null)
	{
	}
	else if(inserted.equalsIgnoreCase("true"))
	{ %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Closed........... </font> </td>
			</tr>
		</table>
<% 	}

	



	String unitid=request.getParameter("unitid");
%>
<br></br>
		<table border="0" align="center" >
			<tr>
				<td align="center"> <font color="maroon" size="3"> <B> Special Comments of Unit : <%=unitid%>  
				</B> </font> </td>
			</tr>
		</table>
<br></br>
		<table border="1" class="sortable" align="center">
		
			<tr>
				<td></td>	
				<td align="center"> <b>Sr. No</b></td>
				<td align="center"> <b>Ent Date-Time </b></td>
				<td align="center"> <b>Sp. Comment</b></td>
				<td align="center"> <b>Extra Comment</b></td>
				<td align="center"> <b>Concerned Person</b></td>
				<td align="center"> <b>Ent. By</b></td>
				<td align="center"> <b>Close By</b></td>
			</tr>
<%
		
		
		
		
		sql2="select * from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' order by EntDateTime desc ";
	
		
		rs1=stmt1.executeQuery(sql2);
		while(rs1.next())
		{ %>
			<tr>
		
			<td> <input type="checkbox" name="del<%=i%>" id="del<%=i%>" value="del<%=i%>"></input></td>
				<td> <%=i %> </td>
			<input type="hidden" name="srno<%=i %>" id="srno<%=i %>" value="<%=rs1.getString("SrNo")%>"></input>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs1.getString("EntDateTime")))%> </td>
				<td> <%=rs1.getString("SpComment")%> </td>
				<td><%=rs1.getString("Extra_comment") %></td>
				<td> <%=rs1.getString("ActionToBeTakenBy")%> </td>
				<td> <%=rs1.getString("EntBy")%> </td>
				<td> <%=rs1.getString("CloseBy")%> </td>
				
			</tr>
<%    i++;
} %>
		<tr>
			<td colspan="11"> <div align="center"> <input type="hidden" name="cntr" id="cntr" value="<%=i %>"/><input type="submit" name="submit" onclick="closecomment('<%=unitid %>')" value="Close" class="formElement"/> </div> </td>
		</tr>
		</table>
	</form>

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
<!-- code end here --->

 		
  

</html>


