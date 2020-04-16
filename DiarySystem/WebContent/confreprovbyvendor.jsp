<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1;
Statement stmt1;
String sql1;
ResultSet rs1=null;
String tm;
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
function validate()
{
	var cntr=document.reprovconf.cntr.value;
	cntr=cntr-1;	
	
	for (var v=0;v<cntr;v++)	
	{	
		if(document.getElementById("cb"+v).checked==true)
		{
			var slct=document.getElementById("actprob"+v).value;
			if(slct=="Select")
			{
				alert("Please select Actual Problem for Checked Check-box");
				return false;
			}
		}
		else
		{
			
		}
			
	}
	
	return true;	
}

function selectAll()
{
	var cntr=document.reprovconf.cntr.value;
	cntr=cntr-1;

	if(document.reprovconf.maincb.checked==true)
	{
		for(var j=0;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=true;
		}
	}
	else
	{
		
		for(var j=0;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=false;
		}
	}
}
</script>


</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
<br>
           <table border="0" width="450px" align="center">
			<tr>
				<td BGCOLOR="#EAE8E8"><a href="#"><b><i>WELCOME </b></i></a><font color="red"><%=session.getAttribute("username").toString()%></font></td>
				<td BGCOLOR="#EAE8E8"><a href="logout.jsp"><b><i>LOGOUT</b></i></a></td>
				<td BGCOLOR="#EAE8E8"><b><i><%
			
			java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String s=formatter1.format(d);
			out.print(s);
		%></b></i></td>
			</tr>
			</table>
          	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<form name="reprovconf" method="get" action="reprovisionconfinsrt.jsp" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement();
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";
	int i=1;
	int j=0;

	
	String nocbselected=request.getParameter("nocbselected");
	if(nocbselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
			</tr>
		</table>
<%	}
	
	String closed=request.getParameter("closed");
	if(closed==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > Successfully Closed</font> </div> </td>
			</tr>
		</table>
<%	}

	sql1="select * from t_reprovisionnos where MailSent='Yes' and ReprovConfirmation='No' order by SendDateTime desc";
	rs1=stmt1.executeQuery(sql1);
	
%>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Confirm Re-Provision by the Vendor </B> </font> </td>
		</tr>
	</table>

	<table class="sortable">
		<tr> 
			<td> <div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"> </input> </div> </td>
			<td> <div align="center"> <B> Sr.<br> No.</B> </div> </td>
			<td> <div align="center"> <B> Unit Id</B> </div> </td>
			
			<td> <div align="center"> <B> Mob. No</B> </div> </td>
			<td> <div align="center"> <B> Sim No.</B> </div> </td>
			<td> <div align="center"> <B> Sent Date-Time</B> </div> </td>
			<td> <div align="center"> <B> Ent. By</B> </div> </td>
			<td> <div align="center"> <B> Actual Prob.</B> </div> </td>
		</tr>
<%
	while(rs1.next())	
	{ %>
		<tr>
			<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
			<td> <%=i%> <input type="hidden" name="id<%=j%>" value="<%=rs1.getString("SrNo")%>" />          </td>
			<td> <%=rs1.getString("UnitId")%> </td>
			<td> <%=rs1.getString("MobileNo")%> 
			<td> <%=rs1.getString("SimNo")%> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("SendDateTime")))%> </td>
			<td> <%=rs1.getString("EntBy")%> </td>
			<td> <div align="center"> <select name="actprob<%=j%>" id="actprob<%=j%>" class="formElement"> <option value="Select">Select</option>  
<%
				sql2="select * from t_reprovprobs order by Probs asc";
				rs2=stmt2.executeQuery(sql2);
				while(rs2.next())
				{ %>
					<option value="<%=rs2.getString("Probs")%>"><%=rs2.getString("Probs")%></option>
<%
				}
%>
				</select> </div> </td>
			
		</tr>
<%	
		i++;
		j++;
	}
%>
		<tr>
				<td colspan="8"> <div align="center"> <input type="submit" name="Submit" value="Re-Provisioning Done" class="formElement" /> </div> </td>
			</tr>
</table>
	
<input type="hidden" name="cntr" value="<%=i%>" />	
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->

 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
