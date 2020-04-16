<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp" %>		
	<%!Connection con;%>
<%
	Statement st = null;
	Statement st1 = null;
	String Category = "";
	String dept = "";
	String limit_1 = "";
	String limit_2 = "";
	String limit_3 = "";
	String email_1 = "";
	String email_2 = "";
	String email_3 = "";

	try {
		con = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = con.createStatement();
		st1 = con.createStatement();

	} catch (Exception e) {
	} 

	
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;}</style>
<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
} 
function Reload()
{
	//alert("Hej");  
    window.location.reload(); 
}
function Editvalues() {
	//alert(">>");
	window.open ("ComplaintSettingsAddNew.jsp","mywindow","width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50");
}
function Editvalues1(i,j) {
	//alert(">>");
	//alert("+++++"+i+"+++"+j+"++++++++");
	try{
	var category= document.getElementById(i).innerHTML;
	var department= document.getElementById(j).innerHTML;	
	}catch(e) {
		alert(e);
		}
	//alert("+++++"+category+"+++"+department+"++++++++");
	//alert("+++++"+dept+"+++++++"+category+"++++");
	window.open ("ComplaintSettingsEdit.jsp?dept="+department+"&category="+category,"mywindow","width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50");
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
      <p></p>
     <%@ include file="header1.jsp" %>
     </div> 
<div id="gbox1">
        <div id="gbox-top1"> </div>
        <div id="gbox-bg1">
          <div id="gbox-grd1">
<!--- code start here ------>
<%!
Connection conn;
%>
<%



 

%>
<%


%>
<%
System.out.println("======service Provider report 2========");


String Msg = request.getParameter("Msg");

System.out.println("======Message====in srviceprovidermonthlyrepor2 page ===="+Msg);

if(Msg!=null && Msg.equalsIgnoreCase("1"))
{System.out.println("======control inside if loop====");
	%>
		<script>
		alert("Records Saved Successfully")
		</script>
	<%
}




if(Msg!=null && Msg.equalsIgnoreCase("1"))
{System.out.println("======control inside if loop====");
	%>
		<script>
		opener.Reload();
		window.close();
		</script>
	<%
}

%>

<form id="comsett1"  name="comsett1" action="" onsubmit="" method="post">
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
<!--		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>-->
<!--		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2.0em;"><div style="text-align: center;"><a><font style="font-size: 1.0em;">Cellular Company Billing</font></a></div></td>-->
<!--		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>-->
		</table></h1>
	
	<div align="center" style="width:750px; ">
		
	<tr align="center">
		<td align="right" width="60%">
			<font size="2"><b>Complaints Settings</b></font>
		</td><td align="right" width="40%"><input type="button" name="addnew" id="addnew" value="Add New" onclick="Editvalues();" style="background-color:#BDBDBD;"></input></td>
	</tr>
</table>
		<br />

								
  <ul >
	
	<table border="1" style="width: 70%; border-color: black" align="center" CELLPADDING=5 class="sortable" bgcolor="white">
	
	<tr bgcolor="#BDBDBD">
		<th style="width: 10%;text-align: left;"><font size="2">Category</font></th>
		<th style="width: 10%;text-align: left;"><font size="2">Department</font></th>
		<th style="width: 5%;text-align: left;"><font size="2">Limit1</font></th>
		<th style="width: 5%;text-align: left;"><font size="2">Limit2</font></th>
		<th style="width: 5%;text-align: left;"><font size="2">Limit3</font></th>
		<th style="width: 25%;text-align: left;"><font size="2">EmailID1</font></th>
		<th style="width: 25%;text-align: left;"><font size="2">EmailID2</font></th>
		<th style="width: 25%;text-align: left;"><font size="2">EmailID3</font></th>
		<th style="width: 25%;text-align: left;"><font size="2"></font></th>
	</tr>
	<%
		
	try{
	String sql = "select * from db_gps.t_ComplaintSettings order by dept";
		ResultSet rs = st.executeQuery(sql);
		
		System.out.println("********3***********sql***------------"+sql);
		int i = 0;
		String cat = "";
		String deptt = "";
		while (rs.next()) {
			Category = rs.getString("Category");
			dept = rs.getString("dept");
			limit_1 = rs.getString("Limit1");
			limit_2 = rs.getString("Limit2");
			limit_3 = rs.getString("Limit3");
			email_1 = rs.getString("EmailID1");
			email_2 = rs.getString("EmailID2");
			email_3 = rs.getString("EmailID3");
			i++;
			cat = "cat" + i;
			deptt = "deptt" + i;
	%>

	<tr>
	<%
	 System.out.println("-->"+cat);
	 System.out.println("-->"+deptt);
	 System.out.println("-->"+Category);
	%>
		<td id=<%=cat%> style="width: 10%;"><%=Category%></td>
		<td id=<%=deptt%> style="width: 10%;"><%=dept%></td>
		<td style="width: 5%;"><%=limit_1%></td>
		<td style="width: 5%;"><%=limit_2%></td>
		<td style="width: 5%;"><%=limit_3%></td>
		<td style="width: 25%;"><%=email_1%></td>
		<td style="width: 25%;"><%=email_2%></td>
		<td style="width: 25%;"><%=email_3%></td>
		<%
		
		%>
		<td><input type="button" id="edit_button" name="edit_button" style="background-color:#BDBDBD;"
			value="Edit" onclick="Editvalues1('<%=cat%>','<%=deptt%>');"></input></td>
	</tr>
	<%
				
		}
		
		
	}catch(Exception e11)
	{
		System.out.println("********Exception in **t_ComplaintSettings*********--------"+e11);
		
	}
	%>

</table>
</div>



</ul>

</form>
</div>		
</ul>
</div>
</div>
</div>
</div>
</div>
 </div>
 </div>
</body>
<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>