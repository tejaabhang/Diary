<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<link href="css/css.css" rel="StyleSheet" type="text/css">


<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>
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

	function validate()
	{
		if(document.getElementById("cname").value=="")
		{
			alert("Please Enter Contact Person Name");
			return false;

		}
		if(document.getElementById("designation").value=="")
		{
			alert("Please Enter contacts persons designation");
			return false;

		}
		if(document.getElementById("address").value=="")
		{
		alert("Please Enter The Address");
		return false;	
		}
		if(document.getElementById("email").value=="")
		{
			alert("Please Enter The Email");
			return false;
		}	
		else
		{
		    email=document.getElementById("email").value;
		     var sss=validateEmail(email);
		if(!sss)
			{
				alert("Please Enter Valid Email Id");
				return false;
			}
		}
		var aa=IsNumeric(document.getElementById("phone").value);
		if(!aa)
		{
			alert("Phone Number is always Numeric");
			return false;
		}
		if(document.getElementById("mobile").value=="")
		{
			alert("Please Enter Mobile Number");
			return false;

		}
		else
		{
				var bb=IsNumeric(document.getElementById("mobile").value);
				if(!bb)
				{
					alert("Mobile Number is always Numeric");
					return false;
				}
				else
				{
					if(document.getElementById("mobile").value.length !=10)
					{
						alert("Mobile Number is always 10 digit");
						return false;
					}

				}
			

		}
		if (document.contactform.transporter[document.contactform.transporter.selectedIndex].value== "Select")
		{
			alert("Please Select a Transporter");
			return false;
		}

		if (document.contactform.DepartmentName[document.contactform.DepartmentName.selectedIndex].value== "Select")
		{
			alert("Please Select a DepartmentName");
			return false;
		}
		
		if(document.getElementById("place").value=="")
		{
			alert("Please enter the Place");
			return false;				
		}
return true;
	}
function validateEmail(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}
function IsNumeric(sText)
{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
	
         IsNumber = false;
         }
      }
	return IsNumber;
   
}

</script>
</head>

<body>
<br>
<br>
<br>
<br>
<br>
<br>

<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000*60*60*24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	sql="select Distinct(TypeValue) as Transporter from t_transporter order by TypeValue";
	%>
<form action="addcontactintodatabase.jsp" method="get" name="contactform" accept-charset="utf-8" onsubmit="return validate();">
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="3"><div align="center">
				<font color="#2A0A12" ><b>ADD TRANSPORTER CONTACT</b></font>
			</div></td>
		</tr>
		<tr><th colspan="2"><font color="#2A0A12" ><% 
		String transporter=request.getParameter("transporter");
								String err=request.getParameter("err");
								if(null==err)
								{
								}
								else
								{
								if(request.getParameter("err").equals("no"))
								{
									out.print("Record Inserted");
								}
								else
								{
									out.print("Record Not Inserted");
								}
								}
								 %></font></th></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Contact Name:</b> </td><td><input type="text" name="cname" id="cname" class="formElement"></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Address :</b></td><td><TEXTAREA name="address" id="address" rows="3" cols="50" class="formElement"></TEXTAREA></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Designation:</b></td><td><TEXTAREA name="designation" id="designation" rows="1" cols="50" class="formElement"></TEXTAREA></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Email :</b></td><td><input type="text" name="email" id="email" class="formElement"></td></tr>
		<tr bgcolor="#BDBDBD"><td><b>Phone : </b></td><td><input type="text" name="phone" id="phone" class="formElement"></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Mobile :</b></td><td><input type="text" name="mobile" id="mobile" class="formElement"></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>DepartmentName :</b></td>
		<td><select name="DepartmentName" id="DepartmentName">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment="select * from db_CustomerComplaints.t_dropdown where dropdown='DepartmentName'"; 
		ResultSet rstDepartment=st4.executeQuery(sqlDepartment);
		while(rstDepartment.next())
		{
			
			String value=rstDepartment.getString("value");
			////System.out.println(value);
		%><option value="<%=rstDepartment.getString("value")%>"><%=rstDepartment.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Transporter :</b></td>
		<td>
		<%System.out.println("transporter:-"+transporter);if(transporter!=null){ %>
		<input type="hidden" name="hiddentransp" id="hiddentransp" value="<%=transporter%>"></input>
		<%System.out.println("transporter:-"+transporter);} %>
    <select name="transporter" id="transporter" <%if(transporter!=null){ %>disabled <%} %>>
 
		
		<!-- <option value="Select">Select</option> -->
		<%
		ResultSet rst=st4.executeQuery(sql);
		while(rst.next())
		{
			
			String Transporter=rst.getString("Transporter");
			System.out.println("Transporter:-"+Transporter);
			System.out.println("transporter:-"+transporter);
			Transporter=Transporter.trim();
			transporter=transporter.trim();
		%><option value="<%=rst.getString("Transporter")%>" <%if(transporter!=null && transporter.equalsIgnoreCase(Transporter)){ %> selected <%} %>><%=rst.getString("Transporter")%></option><%
				System.out.println("here");}
		%>	
		<option value="Other">Other</option>	
		</select></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Place :</b></td><td><input type="text" name="place" id="place" class="formElement"></td></tr>
		<tr bgcolor="#BDBDBD"><td><font color="red"><b> *</b></font><b>Active :</b></td>
			<td>
	      		  <input type=radio name="radio2" value="Yes" checked>  <font color="maroon"><b>yes</b></font>
				  <input type=radio name="radio2" value="No" >  <font color="maroon"><b>No</b></font>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD"><td colspan="2"><center><input type="submit" value="Submit" class="formElement"></center></td></tr>
		<tr><td colspan="2"><center><font color="red"><b>All<font color="red"><b> *</b></font> Fields Are Mandatory.</b></font></center></td></tr>
		</table>		
		</form>
		
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
		

<!-- code end here --->

 		
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>