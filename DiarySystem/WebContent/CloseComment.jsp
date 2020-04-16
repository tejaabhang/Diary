<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
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
		}else
		{
		//alert(rid);
		var url="closeunitcomment.jsp";
		document.unitclose.action=url+"?totsrno="+srno+"&unit="+unit;
		document.unitclose.submit();
		}

}

</script>
</head>

<%! 
Connection con1;
%>
<form name="unitclose" method="post" action="" >
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
		<table border="0" width="500px" >
			<tr>
				<td align="center"> <font color="maroon"> <B> Special Comments of Unit : <%=unitid%>  
				</B> </font> </td>
			</tr>
		</table>

		<table border="1" class="sortable" width="750">
			<tr>
				<td></td>	
				<td align="center"> Sr. No</td>
				<td align="center"> Ent Date-Time </td>
				<td align="center"> Sp. Comment</td>
				<td align="center"> Extra Comment</td>
				<td align="center"> Concerned Person</td>
				<td align="center"> Ent. By</td>
				<td align="center"> Close By</td>
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
	
