<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
<link href="css/css.css" rel="StyleSheet" type="text/css"/>
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">
function redirect()
{
	
//alert("in ftplastdump");
	var cntr=document.dets.cntr.value;


	//cntr=cntr-1;
//alert("hi"+cntr);
	var url="dispunitsreceived1.jsp?tech1="+document.getElementById("tech").value;
//alert(url);
//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
var i=0;
var flag="false";
   	for(var j=1;j<cntr;j++)
    	{	//alert("j loop");
    		//alert(document.getElementById("disp"+j).checked);
    		if(document.getElementById("disp"+j).checked==true)
    		{
    			//alert("unitid"+document.getElementById("unitid").value);
            	 url=url+"&unitid"+i+"="+document.getElementById("unitid"+j).value;
				 i++;
				// alert(url);
				// alert("map"+url);
					flag="true";
    		}		
    	}
		//alert(flag);
        if(flag=="false"){
			alert("Please select atleast one checkbox");
			return false;
        }//write function to check no of check boxes get value
       document.dets.action=url+"&cntr1="+i;
      	
       document.dets.submit();
	
}
function redirect1()
{
	
//alert("in ftplastdump");
	var cntr=document.dets.cntr.value;


	//cntr=cntr-1;
//alert("hi"+cntr);
	var url="dispunitsreceived11.jsp?tech1="+document.getElementById("tech").value;
//alert(url);
//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
var i=0;
var flag="false";
   	for(var j=1;j<cntr;j++)
    	{	//alert("j loop");
    		//alert(document.getElementById("disp"+j).checked);
    		if(document.getElementById("disp"+j).checked==true)
    		{
    			//alert("unitid"+document.getElementById("unitid").value);
            	 url=url+"&unitid"+i+"="+document.getElementById("unitid"+j).value;
				 i++;
				// alert(url);
				// alert("map"+url);
					flag="true";
    		}		
    	}
		//alert(flag);
        if(flag=="false"){
			alert("Please select atleast one checkbox");
			return false;
        }//write function to check no of check boxes get value
       document.dets.action=url+"&cntr1="+i;
      	
       document.dets.submit();
	
}
</script>
<%
//System.out.println("request----->"+request.getParameter("parameter"));
if(request.getParameter("parameter").equals("null")||request.getParameter("parameter")==null||"null".equalsIgnoreCase(request.getParameter("parameter"))){
	
		}else{
	
	if(request.getParameter("parameter").equalsIgnoreCase("tech")){
	%>
	
	
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
<%@ include file="headertech.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
	<%
	}}
%>

<%! 
Connection con1, con2;
%>
<form name="dets" method="post"  onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con2.createStatement(), stmt2=con2.createStatement(),stmt3=con2.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="", sql2="";
	//String dcno=request.getParameter("dcno");
	String typ=request.getParameter("type");
	String tech=request.getParameter("tech");
	//System.out.println(tech);
	if(tech.equalsIgnoreCase("tech")||"tech".equalsIgnoreCase(tech)){
		tech=session.getAttribute("username").toString();
	}
	int i=1,j=0;
	//out.print(dcno);
%>
<br></br>
<br></br>

<table class="stats" bgcolor="#77D7D4">
	<%
	if(typ.equals("Dispatched"))
	{
	%>
<tr>
	<td> <div align="left"> <font color="maroon"> <B> Note:</B>If check-box is missing, it means, that Unit has been received.  </font> </div> </td>
</tr>
	<%	
	}
	%>
	</table>
	<%
	String nounitselected=request.getParameter("nounitselected");
	if(nounitselected==null)
	{
	}
	else
	{ 
	%>
		<table border="0" width="750" bgcolor="#77D7D4">
		<tr>	
			<td align="center"> <font color="maroon" > No check-box was selected.  </font> </td>
		</tr>
		</table>
	<%
	}
	String updated=	request.getParameter("updated");
	if(updated==null)
	{
	}
	else
	{
		%>
		<table border="0" width="750" bgcolor="#77D7D4">
		<tr>	
			<td align="center"> <font color="maroon" >Successfully Updated. Please refresh page to reflect the changes.  </font> </td>
		</tr>
		</table>
	<%	
	}	
	%>
	<table border="0" width="750" bgcolor="#77D7D4">
		<tr>	
<%
		if(typ.equals("Dispatched"))
		{	%>
			<td colspan="5" align="center"><font color="maroon" size="2"> <%=typ%> Info </font> </td>
<%		} 
		%>
			
		</tr>
		</table>
	<table class="sortable" width="300">
		<tr>
<%
		if(typ.equals("Dispatched"))
		{ %>
			<td> </td>
<%		} %>
			<td> <B> Sr. No.</B> </td>
			<td> <B> Date</B> </td>
			<td> <B> Unit Id</B> </td>
			<td> <B> Order Number</B> </td>			
		</tr>
	
<%
	sql1="select * from t_unitmaster where HoldBy = '"+tech+"' ";
	rs2=stmt2.executeQuery(sql1);
		
	while(rs2.next())
	{ 
		//String unid=
			
		sql2="select * from t_unitmasterhistory where UnitId = '"+rs2.getString("UnitId")+"' and Status in  ('Dispatched', 'InterDisp') order by DispDate Desc limit 1";
		rs1=stmt1.executeQuery(sql2);
		if(rs1.next())
		{
			String RecByTech="";
			String UnitID=rs1.getString("UnitId");
			String sql="select * from db_gps.t_unitmaster where UnitID='"+UnitID+"'";
			ResultSet rs=stmt3.executeQuery(sql);
			if(rs.next()){
				RecByTech=rs.getString("RecByTech");
			}
		String received="";
		if(typ.equals("Dispatched"))
		{
			received=rs1.getString("RecByTech");
		}
%>
		<tr>
<%		if(typ.equals("Dispatched"))
		{ 
			if(RecByTech.equals("Yes"))
			{ %>
				
<%			}
			else
			{ %>
				<td> <input type="checkbox" name="disp<%=i%>" id="disp<%=i%>" value="disp<%=i%>" /> </td>
				<td> <%=i%> </td>
<%
		if(typ.equals("Dispatched"))
		{ %>
			<td> <%=rs1.getString("DispDate")%> </td>
<%		}
		%>
			<td> <%=rs1.getString("UnitId")%> </td>	
			<td><%=rs1.getString("OrderNo") %></td>	
		</tr>
			<input type="hidden" name="unitid<%=i%>" id="unitid<%=i%>" value="<%=rs1.getString("UnitId")%>" />
				
			<%			
			i++;
			}
			%>
			<%
			}
	} 
	}
	//System.out.println("@@@@@@@@@@@@@@@@@@@@@@-->"+tech.equalsIgnoreCase(request.getParameter("tech")));
	if("tech".equalsIgnoreCase(request.getParameter("tech"))&&typ.equals("Dispatched")){
		%>
		<tr align="center"> 
			<td colspan="5" align="center"> <input type="button" name="Submit" value="Received tech" class="formElement" onclick="redirect1();" /> </td>
		</tr>
		
<%		
	}else{
	if(typ.equals("Dispatched"))
		{ %>
			<tr align="center"> 
				<td colspan="5" align="center"> <input type="button" name="Submit" value="Received" class="formElement" onclick="redirect();" /> </td>
			</tr>
			
<%		}
	}
%>
		
	</table> 
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="tech" id="tech" value="<%=tech%>" /> 
	
<%	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();

}
%>
	</form>
	</html>
