<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<script language="javascript">
function validate()
{ 
	var name=document.editrecs.name.value;
	var phno=document.editrecs.phno.value;
	var mob=document.editrecs.mob.value;
	var email=document.editrecs.email.value;
	var loc=document.editrecs.loc.value;
	var designation=document.editrecs.designation.value;
	if(name=="")
	{
		alert("Please enter contact Person's name");
		return false;
	}		

	if(phno!="")
	{
		if(isNaN(phno))
		{	
			alert("Please enter correct Phone No");
			return false;
		}	
	}

	if(mob=="")
	{
		alert("Please enter Mobile No.");
		return false;
	}
	if(isNaN(mob))
	{	
		alert("Please enter correct Mobile No");
		return false;
	}
	if(mob.length<10 || mob.length>10)
	{	
		alert("Please enter correct Mobile No");
		return false;
	}	

	if(email=="")
	{
		alert("Please enter contact Person's Email Id");
		return false;
	}

	if(loc=="")
	{
		alert("Please enter contact Person's location");
		return false;
	}
	if(designation=="")
	{
		alert("Please enter contact Person's designation");
		return false;
	}
	return validateEmail(email);
}

function validateEmail(email)
{
	var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null)
    {
    	alert("Please enter valid Email Id");	    
        return false;
    }  
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null)
      {
          alert("Please enter valid Email Id");    
          return false;
      }  
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) 
	    {
	    	alert("Please enter valid Email Id");	
		    return false;
	    }   
      }// if
      return true;
    }
    alert("Please enter valid Email Id");	 
return false;
}
</script>

<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">

<form name="editrecs" method="get" action="editcontdets.jsp" onSubmit="return validate();"> 
<%!

Connection conn,conn1;
Statement st;
%>

<%
String reciever,thedate,thetime,transporter,username;
transporter=request.getParameter("trans");
reciever=request.getParameter("reciever");
String rid=request.getParameter("rid");

username=session.getAttribute("username").toString();

	try{
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		Statement stmtinsert=conn1.createStatement(),stmtinsert1=conn1.createStatement();
		ResultSet rs1=null;
		String sql1="", sql2="";
		String name="", phno="", mob="", email="", loc="",designation="",department="";
		%>
			<input type="hidden" name="rid" value="<%=rid %>" />
		<%	
		sql1="select * from t_recieverinfo where Rid='"+rid+"'";
		//out.print(sql1);
		rs1=st.executeQuery(sql1);
		if(rs1.next())
		{
			name=rs1.getString("RecieverName");
			phno=rs1.getString("Phone");
			mob=rs1.getString("Mobile");
			email=rs1.getString("Email");
			loc=rs1.getString("PlaceName");
			designation=rs1.getString("designation");
			department=rs1.getString("department");
		} 
		
		String upname=request.getParameter("name");
		if(!(upname==null))
		{
			String upphno=request.getParameter("phno");
			String upmob=request.getParameter("mob");
			String upemail=request.getParameter("email");
			String uploc=request.getParameter("loc");
			String updesignation=request.getParameter("designation");
			String updepartment=request.getParameter("DepartmentName");
			String submitbut=request.getParameter("submit");
			String msg="";
			 
			if(!(submitbut==null))
			{	
				sql2="update t_recieverinfo set RecieverName='"+upname+"', Phone='"+upphno+"', Mobile='"+upmob+"',designation='"+updesignation+"',department='"+updepartment+"',Email='"+upemail+"', PlaceName='"+uploc+"', Representative='"+username+"'  where Rid='"+rid+"'";
				////System.out.println(sql2);
				msg="Successfully Updated";
				
			}
			else
			{
				sql2="update t_recieverinfo set ActiveStatus='No'  where Rid='"+rid+"'";
				msg="Successfully Deleted";
				
			}
			//Query for t_sqlquery
   			String abcd=sql2.replace("'","#");	
   			abcd=abcd.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

			st.executeUpdate(sql2);
		%>
				<table border="0" width="320px">
					<tr>
						<td colspan="3" align="center"> <%=msg %></td>
					</tr>
					<tr>
						<td colspan="2" align="center"> Please refresh main page to reflect changes</td>
					</tr>
					<tr>
						<td colspan="3" align="center"> <a href="javascript:window.close();"> Close </a></td>
					</tr>
				</table>
		<%	
		}
		else
		{	
		%> <center>
			<table border="10" width="350px">
				<tr>
					<td> <font color="red"><b> *</b></font> Name </td>
					<td> <input type="text" name="name" value="<%=name %>"> </input> </td>
				</tr>
				<tr>
					<td> Phone No. </td>
					<td> <input type="text" name="phno" value="<%=phno %>"> </input> </td>
				</tr>
				<tr>
					<td> <font color="red"><b> *</b></font> Mobile No. </td>
					<td> <input type="text" name="mob" value="<%=mob %>" size="10"> </input> </td>
				</tr>
				<tr>
					<td> <font color="red"><b> *</b></font> Designation. </td>
					<td> <input type="text" name="designation" value="<%=designation %>" size="10"> </input> </td>
				</tr>
				<tr>
					<td> <font color="red"><b> *</b></font> Department. </td>
					<td><select name="DepartmentName" id="DepartmentName">
		<option value="<%=department%>"><%=department %></option>
		<%
		
		String sqlDepartment="select * from db_CustomerComplaints.t_dropdown where dropdown='DepartmentName'"; 
		ResultSet rstDepartment=stmtinsert1.executeQuery(sqlDepartment);
		while(rstDepartment.next())
		{
			
			String value=rstDepartment.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment.getString("value")%>"><%=rstDepartment.getString("value")%></option><%
		}
		%>	
		
		</select></td>
				</tr>
				<tr>
					<td> <font color="red"><b> *</b></font> Email </td>
					<td> <input type="text" name="email" value="<%=email %>"> </input> </td>
				</tr>
				<tr>
					<td> <font color="red"><b> *</b></font> Location </td>
					<td> <input type="text" name="loc" value="<%=loc %>"> </input> </td>
				</tr>
				<tr>
					<td colspan="2" align="center"> <input type="submit" name="submit" value="Update" class="formElement" />
						&nbsp;&nbsp;&nbsp;	 <input type="submit" name="delete" value="deactivate" class="formElement" />  
					</td>
				</tr>
			</table>
		<% } //close of else
		%>	
		
		
					<%
			
		}catch(Exception e)
	{
		out.print("Exception -->"+e);
	}
	finally
	{
		conn.close();
		conn1.close();
	}
	


%>
<body background="images/green_grad_bot.jpg" onload="focusChild();">

</form>
