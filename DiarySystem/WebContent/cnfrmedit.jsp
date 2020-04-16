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
<form name="cnfrmeditForm" method="get" action="editinsrt.jsp"> 
<%
 
	String vehcode="", vehno="", owner="", group="", unid="", nwvehno="", nwowner="", nwgroup="", oldveh="", comment="",nwsoldout="",soldout="";
	String fnlowner="", fnlgroup="", fnlvehno="",fnlsoldout="",vehtyp="",vehtyp1="";

	vehcode=request.getParameter("vehcode");
	vehno=request.getParameter("vehno");
	owner=request.getParameter("owner");
	unid=request.getParameter("unid");
	//group=request.getParameter("group");
	oldveh=request.getParameter("oldveh");
	comment=request.getParameter("comment");
	soldout=request.getParameter("soldout");
	nwowner=request.getParameter("edit1");
	vehtyp=request.getParameter("edit2");
	nwvehno=request.getParameter("edit3");
	nwsoldout=request.getParameter("edit4");
	
	vehtyp1=request.getParameter("vehtyp");
	
	
	
	//System.out.println("vehtyp>>>in cnfrm edit>>>"+vehtyp);
	
	if(vehtyp.equalsIgnoreCase("select"))
	{
		vehtyp=vehtyp1;
		
	}
	
	
	if(nwowner.equals("Select"))
	{
 		 fnlowner=owner;
	}
	else
	{
 		 fnlowner=nwowner;
	}

	

	if(nwvehno.equals(""))
	{
 		 fnlvehno=vehno;
	}
	else
	{
  		fnlvehno=nwvehno;
	}
	if(nwsoldout.equals("Select"))
	{
 		 fnlsoldout=soldout;
	}
	else
	{
		fnlsoldout=nwsoldout;
	}	
%>
	
	<table border="0" width="750px">
<tr>
   <td> <div align="center"><font color="maroon"><b><blink>Note:</b></blink> If these are not the Correct Entries, please go Back </font></div> </td>
</tr>
</table>
	 <table border="0" width="750px">
	   <tr>
		<td> <div align="center"> <font color="maroon" size="2"> <B> Confirm Records </B> </font> </div> </td>
	   </tr>	
	 </table>

	<table border="0" width="750px">
  	  <tr>
       	      <td> <div align="center">	

		 <table border="1" width="450px">
  		    <tr>
			<td> <div align="center"><b><font color="maroon"> Owner Name: </font> </b> </div> </td>
			<td><div align="center"><b><%=fnlowner %></div> </b>
			</td>
	            </tr>
<input type="hidden" name="trans" value="<%=fnlowner%>" />
	  	   
		    <tr> 
   			<td width="50%"><div align="center"><b><font color="maroon"> Vehicle No:</font>  </b> </div></td>
			<td><div align="center"><b><%=fnlvehno %></div></b> </td>
		   </tr>	 
		   
		    <tr>
   			<td><div align="center"><b><font color="maroon"> Vehicle Category: </font> </b> </div></td>
			<td><div align="center"><b><%=vehtyp %></div></b> </td>
		</tr>
		   
		   
		   <tr>
   			<td><div align="center"><b><font color="maroon"> Unit Id: </font> </b> </div></td>
			<td><div align="center"><b><%=unid %></div></b> </td>
		</tr>
		<tr>
   			<td><div align="center"><b><font color="maroon"> SoldOut: </font> </b> </div></td>
			<td><div align="center"><b><%=fnlsoldout %></div></b> </td>
		</tr>
		<tr>
			<td><div align="center"><b><font color="maroon"> Comment: </font> </b> </div></td>
			<td><div align="center"><b><%=comment %></div></b> </td>
		</tr>
		<tr>
			 <td colspan="3"><div align="center"> <input type="submit" name="submit1" value="Update" class="formElement"> </input> </div> </td>
		</tr> 	
	         </table> </div>
    	     </td> 
         </tr>
      </table>

<input type="hidden" name="vehcode" value="<%=vehcode %>" > </input>
<input type="hidden" name="fnlowner" value="<%=fnlowner %>" > </input>
<input type="hidden" name="fnlvehno" value="<%=fnlvehno %>" > </input>
<input type="hidden" name="fnlgroup" value="<%=fnlgroup %>" > </input>
<input type="hidden" name="comment" value="<%=comment %>" > </input>
<input type="hidden" name="soldout" value="<%=soldout%>" > </input>
<input type="hidden" name="fnlsoldout" value="<%=fnlsoldout %>" > </input>
<input type="hidden" name="oldveh" value="<%=oldveh %>" > </input>
<input type="hidden" name="oldowner" value="<%=owner %>" > </input>
<input type="hidden" name="oldgroup" value="<%=group %>" > </input>
<input type="hidden" name="vehtyp" value="<%=vehtyp%>" />

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

</body>
</html>



