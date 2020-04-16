<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

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

<script language="javascript" >
function vehno()
{
	 
	console.log("=========onload vehno======= outer ");
	if(document.getElementById("reasn").value=="exchange")
	{
		console.log("=========onload vehno=======");
	document.getElementById("used").style.display="";
	}
	
		
	}
</script>
</head>

<body onload="vehno();">
  <form name="removeunitform" method="get" action="vehexchangerem.jsp" onsubmit="return validate();">
  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%!Connection con1; %>
<form name="removeunitform" method="get" action="vehexchangerem.jsp" onsubmit="return validate();">
<%

try
{
String 	transp=request.getParameter("owner");
String 	vehno=request.getParameter("vehreg");
String 	unitid=request.getParameter("unid");
String 	oldunitwth=request.getParameter("techname");
String 	comment=request.getParameter("cmnt");
String reason=request.getParameter("reason");
 String newvehno=request.getParameter("vehno");
 Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
ResultSet rs1=null;
//String Vehno=request.getParameter("newvehregno");
String mobno="";
String sql1="select * from db_gps.t_unitmaster where UnitID='"+unitid+"' ";
System.out.println("unitmaster query==>"+sql1);
rs1=stmt1.executeQuery(sql1);
System.out.println(sql1);
String userrole=session.getAttribute("userrole").toString();
System.out.println(userrole);
while(rs1.next())
{
	System.out.println("in loop");
	mobno=rs1.getString("MobNo");
	

}
//String mobchk="";
String mobchk="-";
String sql6="select MobNo from   db_gps.t_deactivatednosnew  where MobNo='"+mobno+"'";
ResultSet rstnew=stmt1.executeQuery(sql6);
System.out.println("sql6666==>>"+sql6);
if(rstnew.next())
{
	
	mobchk=rstnew.getString("MobNo");
	
}
/* if(mobchk!="-" && !(mobchk.equalsIgnoreCase("-")))
{
	
	
	out.println("<script type=\"text/javascript\">");  
	out.println("alert('Mobile no of the unit id is deactivated Please Activate Mobile no');");  
	out.println("window.history.go(-1);");
	out.println("</script>");
	
}
 */
/* =============================== */

String CodeVersion ="";
String FTP="";

String sqlversion="select * from t_ftplastdump where UnitID='"+unitid+"'";
ResultSet rsversion=stmt1.executeQuery(sqlversion);
if(rsversion.next()){
	CodeVersion=rsversion.getString("CodeVersion"); 
	if("AVL_VER_4.9.9_3S".equalsIgnoreCase(CodeVersion)||CodeVersion.equalsIgnoreCase("AVL_VER_4.9.9_3S")){
	FTP="Yes";
		//out.println(FTP+"#");
	}else{
		 FTP="No";
		//out.println(FTP+"#");
	}
}else{
	FTP="-";
	//out.println("-"+"#");
}




/* =================================== */

if(CodeVersion.contains("JRM")){
	String JRM="JRM";
	//out.println(JRM+"#");
}else{
	String JRM="No";
	//out.println(JRM+"#");
}

String isCodeVerValid="No";
String sqlutcodever="select * from db_CustomerComplaints.t_utcodever where codever='"+CodeVersion+"' and valid='Yes'";
System.out.println(sqlutcodever);
ResultSet rsutcodever=stmt1.executeQuery(sqlutcodever);
if(rsutcodever.next()){
	isCodeVerValid="Yes";
	//out.println(isCodeVerValid+"#");
}else{
	isCodeVerValid="No";

}








if(reason.equalsIgnoreCase("exchange"))
{
String sql11="select * from  db_gps.t_vehicledetails where  VehicleRegNumber ='"+newvehno+"'";
System.out.println("query"+sql11);

rs1=stmt1.executeQuery(sql11);

if(rs1.next())
{
	out.println("<script type=\"text/javascript\">");  
	out.println("alert('Vehno Already  exist');");  
	out.println("window.history.go(-1);");
	out.println("</script>");	
}

/* if(isCodeVerValid=="No")
{
	
	out.println("<script type=\"text/javascript\">");  
	out.println("alert('Device contains wrong firmware');");  
	out.println("window.history.go(-1);");
	out.println("</script>");

} */
/* if(FTP=="Yes"){
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Invalid Software version in Unit Id');");  
	out.println("window.history.go(-1);");

	out.println("</script>");
	} */


if(mobchk!="-" && !(mobchk.equalsIgnoreCase("-")))
{
	
	
	out.println("<script type=\"text/javascript\">");  
	out.println("alert('Mobile no of the unit id is deactivated Please Activate Mobile no');");  
	out.println("window.history.go(-1);");
	out.println("</script>");
	
}





}

 
 
 
%>	

<input type="hidden" name="owner" value="<%=transp%>"  />
<input type="hidden" name="vehreg" value="<%=vehno%>" />	
<input type="hidden" name="unid" value="<%=unitid%>" />
<input type="hidden" name="techname" value="<%=oldunitwth%>" />
<input type="hidden" id="newvehno" name="newvehno" value="<%=newvehno%>" />
<input type="hidden" name="cmnt" value="<%=comment%>" />
<input type="hidden"  id="reasn" name="reasn" value="<%=reason%>" />
<center>
<table border="0" width="750px" >
<tr>
	<td> <font color="maroon"> Note: If below given details are wrong, please click <a href="javascript:history.go(-1)"> Here </a> </font> </td>
</tr>
<tr>
   <td> <div align="center">
	<table border="10" width="450px" >
		<tr>
			<td colspan="4"><div align="center"><font color="brown" size="3"> <B> Confirm Records</B> </font></div></td>
		</tr>
		<tr> <td> <font color="maroon"> Transporter: </font> </td>
  			<td> <%=transp%> </td>
		</tr> 
		<tr> <td> <font color="maroon"> Vehicle No.: </font> </td>
  			<td> <%=vehno%> </td>
		</tr>  
		<tr> <td> <font color="maroon"> Unit Id: </font> </td>
  			<td> <%=unitid%> </td>
		</tr> 
		<tr> <td> <font color="maroon"> Old Unit with: </font> </td>
  			<td> <%=oldunitwth%> </td>
		</tr> 
	
		
			<tr id="used" style="display: none"> <td> <font color="maroon"> New Veh no: </font> </td>
  			<td> <%=newvehno%> </td>
		
	</tr>
		
		
		<tr> <td> <font color="maroon"> Reason: </font> </td>
  			<td> <%=reason%> </td>
		</tr> 
		
		<tr> <td> <font color="maroon"> Comment: </font> </td>
  			<td> <%=comment%> </td>
		</tr> 
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Update" class="formElement" /> </td>
		</tr>    
	</table>
 </div> </td>	
 </tr>
</table>
	
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
<script>
//window.onload=vehno();
</script>
</body>

</html>
