<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 

String trans, vid, vehno, group, mob, uid, trans1;
String otrans, ovehno, ogroup;
String comment="";

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

<script language="javascript" >

showvoicepar="No";
UnitDamaged="No";
warcommentt="No";
NewDamage="No";
	

function validate()
{
	var spcomt=document.repunitform.spcomment.value;	


	if(spcomt.length < 2)
	{
		alert("Please Enter Special Comment");
		return false;
	}

	if(document.repunitform.hour.value=="Select")
	{
		alert("Please Select Time");
		return false; 
	}
	
	
  return true;
	 
}

// if Type of UNit is 'Voice call', then this will get called

function voicecall(dropdown)
{
	var vv1=dropdown.selectedIndex;
 	var SelValue1 = dropdown.options[vv1].value;
	//alert(SelValue1);
 
       	if(SelValue1=="VOICECALL")
       	{
		document.getElementById("voiceparam").style.display="";
		showvoicepar="Yes";
	}   
	else
	{
		document.getElementById("voiceparam").style.display='none';
		document.unitaddform.voice1.value="";
		document.unitaddform.voice2.value="";
		showvoicepar="No";
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
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="repunitform" method="get" action="exchangeinsrt.jsp" onsubmit="return validate();"> 

<%
try
{
	
	vehno=request.getParameter("newvehreg");
	trans=request.getParameter("ownername");
	uid=request.getParameter("unid");
	group=request.getParameter("ngrp");
	mob=request.getParameter("mobno");
	vid=request.getParameter("vehcode");
    comment=request.getParameter("spcomment");

	ovehno=request.getParameter("oldvehreg");
	otrans=request.getParameter("oldtrans");
	ogroup=request.getParameter("oldgrp");

		%>


	<table border="0" width="750px">
<tr>
   <td> <div align="center"><font color="maroon"><b><blink>Note:</b></blink> If these are not the Correct Entries, please go Back </font></div> </td>
</tr>
</table>

		<table border="10" width="750px" >
<tr>
	<td colspan="4"><div align="center"><font color="brown" size="3"> <B> Vehicle Exchange Confirmation</B> </font></div></td>
</tr>

<table border="0" width="750px">
  	  <tr>
       	      <td> <div align="center">	

		 <table border="1" width="450px">
  		    <tr>
			<td> <div align="center"><b><font color="maroon"> Owner Name: </font> </b> </div> </td>
			<td><div align="center"><b><%=trans %></div> </b>
			</td>
	            </tr>
<input type="hidden" name="trans" value="<%=trans%>" />
	  	    <tr>
			   <td><div align="center"><b><font color="maroon"> Group Name: </font> </b> </div> </td>
			    <td><div align="center"><b><%=group %></div> </b> </td>
</tr>	
<input type="hidden" name="group" value="<%=group%>" />
  
		    <tr> 
   			<td width="50%"><div align="center"><b><font color="maroon"> Vehicle No:</font>  </b> </div></td>
			<td><div align="center"><b><%=vehno %></div></b> </td>
		   </tr>	
<input type="hidden" name="vehno" value="<%=vehno%>" /> 
		   <tr>
   			<td><div align="center"><b><font color="maroon"> Unit Id: </font> </b> </div></td>
			<td><div align="center"><b><%=uid %></div></b> </td>
		</tr>
<input type="hidden" name="unid" value="<%=uid%>" />
<input type="hidden" name="vehcode" value="<%=vid%>" />
		
		
		<tr>
			 <td colspan="3"><div align="center"> <input type="submit" name="submit1" value="Update" class="formElement"> </input> </div> </td>
		</tr> 	
	         </table> </div>
    	     </td> 
         </tr>
      </table>
<input type="hidden" name="ovehno" value="<%=ovehno%>" />
<input type="hidden" name="otrans" value="<%=otrans%>" />
<input type="hidden" name="ogroup" value="<%=ogroup%>" />
<input type="hidden" name="spcomment" value="<%=comment%>" />



</form>
	

<%
		
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}

%>
<!-- code end here --->

		<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
