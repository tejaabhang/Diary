<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String vehcode, transporter, vehregno,displayform;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<!-- <link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" /> -->
	
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">

function validate()
{
   var v1=document.regcompform.translist.value;
   var v2=document.regcompform.vehlist.value;
   var v3=document.regcompform.comptyp.value;
   var v4=document.regcompform.calender.value;
   var v5=document.regcompform.attadd.value;
   

   if(v1=="Select")
   {
      alert("Please select Transporter from the list");
      return false;
   }

   if(v2=="Select")
   {
      alert("Please select Vehicle from the list");
      return false;
   }

   if(v3=="Select")
   {
      alert("Please select Type of Complaint");
      return false;
   }

   if(v4.length==0)
   {
      alert("Please enter Problem Since");
      return false;
   }

   if(v5=="Select")
   {
      alert("Please select address where Vehicle is to be attended");
      return false;
   }

  

  return true;
}

function datevalidate()
{ 
   var date1=document.regcompform.tdydte.value;
   var prbsndte=document.regcompform.calender.value;
   var vehattdte=document.regcompform.calender1.value;
 
   var dm1,dd1,dy1,dm2,dd2,dy2,dy3,dm3,dd3;
   
   dy1=date1.substring(0,4);
   dy2=prbsndte.substring(0,4);
   dy3=vehattdte.substring(0,4);
//alert(dy1);
//alert(dy1);
   dm1=date1.substring(5,7);
   dm2=prbsndte.substring(5,7);
   dm3=vehattdte.substring(5,7);

   dd1=date1.substring(8,10);
   dd2=prbsndte.substring(8,10);
   dd3=vehattdte.substring(8,10);
   
   if(dy2>dy1 || dy3<dy1)
	{
		alert("Please select proper Date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		
		return false;
	
	}
  else if(dm2>dm1 || dm3<dm1)
	{
		alert("Please select proper Date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";

		return false;
	
	}

  if(dm2==dm1)
 {
		if(dd2>dd1 || dd3<dd1)
		{
		alert("Please select proper date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";

		return false;
	
		}
 }

    if(dy2>dy3)
	{
		alert("Problem since year cannot be greater than Vehicle available year");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}
  else if(dm2>dm3)
	{
		alert("Problem since month cannot be greater than Vehicle available month");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}

  if(dm2==dm3) {
	if(dd2 > dd3)
	{
		alert("Problem since day cannot be greater than Vehicle available day");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}
	}
   

   return true;
}
</script>
</head>
<body bgcolor="white">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
vehcode=request.getParameter("vid");
displayform="yes";
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	sql="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
	ResultSet rst=st1.executeQuery(sql);
	if(rst.next())
	{
		transporter=rst.getString("OwnerName");
		vehregno=rst.getString("VehicleRegNumber");
	}
	%>
	<table border="0" width="450px">
	<tr><td align="center"><font color="maroon" size="2">ADD COMPLAINT</font></td></tr>
	<tr><td>
	<form name="regcompform" method="get" action="add_comp_insert.jsp" onSubmit="return validate()";>
<%
  java.util.Date dd=new java.util.Date();
String dte= "" + (dd.getYear()+1900) + "-" + (1+dd.getMonth()) + "-" + dd.getDate();

 java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatterx=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatterx.format(datefrmdb);
%>
<input type="hidden" name="tdydte" value="<%=nwfrmtdte %>" > </input>
<%
 String inserted=request.getParameter("inserted");
 if(inserted==null)
 { 

 sql="select * from t_complaints1 where VehicleNo='"+vehregno+"' and Result='Unsolved' ";
 //String alrdyinsrtd=request.getParameter("alrdyinsrtd");
	ResultSet rstx=st.executeQuery(sql);
	if(rstx.next())
	{
	displayform="no";
	response.sendRedirect("re_allocate.jsp?tno="+rstx.getString("Tno"));
%>
<table border="0" width="450px">
  <tr>
      <td> <div align="center"> <font color="maroon" size="1"><b> <U>Complaint for this Vehicle has already been registered. Ticket no. is <%=rstx.getString("Tno")%></u> </b></font> </td>
  </tr>
</table>
<table border="15" width="400px" align="center">
<tr><td>Transporter :</td><td><%=rstx.getString("Customer")%></td></tr>
<tr><td>Vehicle Registration Number :</td><td><%=rstx.getString("VehicleNo")%></td></tr>
<tr><td>Complaint Type :</td><td><%=rstx.getString("Complaint")%></td></tr>
<tr><td>Problem Since :</td><td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstx.getDate("TdyDate"))%></td></tr>
<tr><td>Description :</td><td><%=rstx.getString("CDescription")%></td></tr>
<tr><td>Vehicle Attend Address :</td><td><%=rstx.getString("OnSiteAdd")%></td></tr>
<tr><td>Vehicle Available Date :</td><td><%=rstx.getString("VehAvailDate")%></td></tr>
<tr><td>Complaint Status :</td><td><%=rstx.getString("Status")%></td></tr>
<tr><td colspan="2" align="center"><a href='re_allocate.jsp?tno=<%=rstx.getString("Tno")%>'>REALLOCATE</a></td></tr>
<tr><td colspan="2" align="center"> <a href="javascript:window.close();">CLOSE</a></td></tr>	
</table>

<% }

 }
 else
 {
   String tno=request.getParameter("Tno");
%> 
<table border="0" width="100%">
  <tr>
      <td> <div align="center"> <font color="maroon" size="1"><b> <U>Registered Sucessfully. Ticket no. is <%=tno %> </u> </b></font> </td>
  </tr>
</table>
<% }
	if(displayform.equals("yes"))
	{

 %>


	<table border="1" width="100%">
	<tr><td><font color="maroon" >Transporter :</font></td>
	<td><input type="text" name="translist" value="<%=transporter%>" class="formElement" readonly /></td></tr>
	<tr><td><font color="maroon" >Vehicle :</font></td>
	<td><input type="text" name="vehlist" value="<%=vehregno%>" class="formElement" readonly /></td></tr>
	<tr><td><font color="maroon" >Complaint Type :</font></td>
	<td>
	<select name="comptyp" class="formElement"> 
	<option value="Select">Select </option> 
	<%
	sql="select ComplaintType from t_complainttype order by ComplaintType asc";
   	ResultSet rst1=st.executeQuery(sql);
	while(rst1.next())
	{
		%><option value='<%=rst1.getString("ComplaintType")%>'><%=rst1.getString("ComplaintType")%></option><%
	}
	%>
	</select>
	</td></tr>
	<tr><td><font color="maroon" >Problem Since :</font></td>
	<td>
	<input type="text" id="calender" name="calender" size="13" class="formElement" value="" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger"> -->
<input type="button" name="trigger" id="trigger" value="Date" class="formElement">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender",         // ID of the input field
      ifFormat    : "%Y-%m-%d",     // the date format
      button      : "trigger"       // ID of the button
    }
  );
</script>
	</td></tr>
	<tr><td><font color="maroon" >Problem Discription :</font></td>
	<td>
	<textarea name="probdesc" class="formElement">  </textarea>
	</td></tr>
	<tr><td><font color="maroon" >Attend Address :</font></td>
	<td>
	<select name="attadd" class="formElement"> <option value="Select">Select </option>
	<%
	sql="select * from t_location order by LName asc";
	ResultSet rst2=st.executeQuery(sql);
	while(rst2.next())
	{
	%>
	<option value='<%=rst2.getString("LName")%>'><%=rst2.getString("LName")%></option>
	<%
	}
	%>

	</select>
	</td></tr>
	<tr><td><font color="maroon" >Vehicle Avail. Date :</font></td>
	<td>
	<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger"> -->
<input type="button" name="trigger1" id="trigger1" value="Date" class="formElement">
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "calender1",         // ID of the input field
      ifFormat    : "%Y-%m-%d",     // the date format
      button      : "trigger1"       // ID of the button
    }
  );
</script>
	</td></tr>
	<tr><td colspan="2" align="center"><input type="Submit" name="Submit" value="Submit" class="formElement"></td></tr>
	<tr>
		<td colspan="2" align="center"> <a href="javascript:window.close();">CLOSE</a></td>
		</tr>	
	</table>
	<%  
	}
	%>
	</form>
	</td></tr>
	</table>
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
</body>
</html>
