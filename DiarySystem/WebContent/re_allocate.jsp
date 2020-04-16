<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1;
String tno,sql,techname;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

	<script language="javascript">
	function validate()
	{
		var a1,a2,a3,a4,a5,a6,a7;
		a1=document.reallocate.oldlocation.value;
		a2=document.reallocate.location.value;
		a3=document.reallocate.oldavaildate.value;
		a4=document.reallocate.calender.value;
		a5=document.reallocate.oldtechnician.value;
		a6=document.reallocate.techname.value;
		a7=document.reallocate.reason.value;
		if(a1==a2)
		{
			if(a3==a4)
			{
				if(a5==a6)
				{
					alert("Please Change the values");
					return false;
				}
			}
		}
		if(a7=="")
		{	
			alert("Please Enter the reason of reallocation");
			return false;
		}
		
		return true;
	}	
	</script>
</head>

<body>

 <!--- code start here ------>
<%
tno=request.getParameter("tno");
//out.print(tno);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	sql="select * from t_complaints1 where Tno='"+tno+"'";
	ResultSet rst=st.executeQuery(sql);
	if(rst.next())
	{
		//out.print(rst.getString("Tno"));
		%>
		<table border="20" width="450px" align="center">
		<tr>
		<td>
		<form name="reallocate" action="insert_re_allocation.jsp" method="post" onSubmit="return validate();">
		<table border="0" width="50%" align="center">
		<tr>
		<td colspan="2" align="center"><font color="brown" size="3"><i><u>Complaints Re-Allocation</u></i></font>
		<div align="center">
		<% String err=request.getParameter("err");
			if(!(null==err))
			{
				out.print("<br><i><u><font color='red' size='2' >Successfully Re-Allocated</u></i></font>");
			}						
		%></div>		
		</td>
		</tr>	
		<tr>
		<td>Ticket No:</td><td><b><%=rst.getString("Tno")%></b><input type="hidden" name="tno" value="<%=rst.getString("Tno")%>"></td>
		</tr>
		<tr>
		<td>Vehicle Reg. No:</td><td><b><%=rst.getString("VehicleNo")%></b><input type="hidden" name="vehno" value="<%=rst.getString("VehicleNo")%>"></td>
		</tr>	
		<tr>
		<td>Transporter :</td><td><b><%=rst.getString("Customer")%></b><input type="hidden" name="transporter" value="<%=rst.getString("Customer")%>"></td>
		</tr>	
		<tr>
		<td>Location :</td><td>
		<input type="hidden" name="oldlocation" value="<%=rst.getString("VehAttLoc")%>">		
		<% 
			sql="select * from t_locoftrans where Transporter='"+rst.getString("Customer")+"'";		
			//rst.getString("VehAttLoc");
			ResultSet rst2=st1.executeQuery(sql);
			%>
			<select name="location">			
			<%
			while(rst2.next())
			{
			%>
			<option value='<%=rst2.getString("Location")%>' <% if(rst.getString("VehAttLoc").equals(rst2.getString("Location"))){ out.print("Selected");} %>><%=rst2.getString("Location")%></option>			
			<%
			}
		%>
		</select>
		</td>
		</tr>	
		<tr>
		<td>Available Date :</td><td>	
		<input type="hidden" name="oldavaildate" value="<%=rst.getString("VehAvailDate")%>">	
		<input type="text" id="calender" name="calender" size="13" value="<%=rst.getString("VehAvailDate")%>" readonly/>
		<input type="button" name="trigger" id="trigger" value="Date">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script>			
		</td>
		</tr>	
		<tr>
		<td> Technician :</td><td>
		
		<%
			sql="select * from t_callocation1 where Tno='"+rst.getString("Tno")+"'";
			ResultSet rst1=st1.executeQuery(sql);
			techname="-";
			if(rst1.next())
			{
				techname=rst1.getString("Technicion");
			}	
			sql="select * from t_techlist where Available='Yes'";
			ResultSet rst3=st1.executeQuery(sql);
			%>
			<input type="hidden" name="oldtechnician" value="<%=techname%>">	
		
			<Select name="techname">
			<%			
			while(rst3.next())
			{
				%>
					<option value='<%=rst3.getString("TechName")%>' <% if(techname.equals(rst3.getString("TechName"))){ out.print("Selected");} %>><%=rst3.getString("TechName")%></option>				
				<%
			}	
		%>
		</select>
		</td>
		</tr>	
		<tr>
		<td>Reason :</td>
		<td> <TEXTAREA name="reason" ></TEXTAREA></td>
		</tr>	
		<tr>
		<td colspan="2" align="center"> <input type="submit" name="Allocate" value="Allocate" ></td>
		</tr>	
		<tr>
		<td colspan="2" align="center"> <a href="javascript:window.close();">CLOSE</a></td>
		</tr>	
		</table>	
		</form>	
		</td>
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
	conn.close();
}

%>

<!-- code end here --->

</body>
</html>
