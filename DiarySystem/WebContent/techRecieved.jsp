<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp" %>
<%! 
	Connection con1;
	Statement stmt1,stmt2;
	String sql1,sql2;
	ResultSet rs1=null,rs2=null;
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
function validate(){
	//alert("in validate function");
	var fromdate=document.viewunits.calender.value;
	var todate=document.viewunits.calender1.value;
	//alert("from date"+fromdate);
	if(fromdate==""){
		alert("please enter from date");
		return false;
		}
	//alert("to date "+todate);
	if(todate==""){
		alert("please enter to date");
		return false;
		}
	return true;
}
function OnChangeFunc2(dropdown)
{
	//alert("hi");
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
        if(SelValue1=="Other")
        {
             	showothertext="true"; 
             	document.viewunits.othertech.style.visibility="visible";
        }      
        else
	{ 
        	showothertext="false";
        	document.viewunits.othertech.value="";
        	document.viewunits.othertech.style.visibility="hidden";
        }
 }
function onchangecust(dropdown)
{
	var type=document.getElementById("mydiv").value;
	//var custsel=dropdown.selectedIndex;
	//var selcust=dropdown.options[vv1].value;
	if(type=="select")
	{
		alert("please select Type");
		return false;
	}
	return true;
}  
  
function OnChangeFunc3(dropdown)
{	
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }
          

                // Create a function that will receive data sent from the server
            	ajaxRequest.onreadystatechange = function()
                {  
     	 		if(ajaxRequest.readyState == 4)
			{
                       	 	var reslt=ajaxRequest.responseText;
                       	 	// alert(reslt);
                       		document.getElementById("mydiv").innerHTML=reslt;
                        } 
       		}  
        var queryString = "?trans=" +SelValue1;
	ajaxRequest.open("GET", "Ajaxgetcust.jsp" + queryString, true);
        ajaxRequest.send(null); 
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
   <%@ include file="headertech.jsp" %>
          	<div id="gbox1">
            <div id="gbox-top1"> </div>
         <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="viewunits" method="post" action="delrecievedunit.jsp">
<%
	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);
	tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();
%>

<%
try 
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();
	stmt2=con1.createStatement();
        String sql1="",selectedvalue="",d1="",d2="";
        ResultSet rs1=null;
	String data1=request.getParameter("calender");
        String data2=request.getParameter("calender1");
	String receivefrom=request.getParameter("Recievefrom");
	String Statustype=request.getParameter("Statustype");
	String cust=request.getParameter("cust");
	String techname=request.getParameter("techname");
	String othertech=request.getParameter("othertech");
	String challan=request.getParameter("challan");
	//out.print(othertech);
	//String date3=data1;
	//String date4=data2;

String deleted=request.getParameter("deleted");
if(deleted==null)
{
}
else if(deleted.equals("deleted"))
{ %>
<table border="0" width="750px">
  <tr>
	<td align="center"> <font color="maroon"> <B> Successfully Deleted </B> </font> </td>
  </tr>
</table>	
<%
}
else
{ %>
	<table border="0" width="750px">
  <tr>
	<td align="center"> <font color="maroon"> <B> Please select one of the checkbox to delete the entry. </B> </font> </td>
  </tr>
</table>
<%
} %>


<table border="0" width="750px"  align="center"  bgcolor="#77D7D4">
<tr>
	
	<td><font size="1" color="">
		<b><blink> Note : Select any of the following to View Reports  </blink></font>
	<font color="maroon" size="2">
			<B> Units Received Details </font>
</td>
</tr>
</table>
<table border="0" width="750px"  align="center"  bgcolor="#77D7D4">
<tr>
	<td><b>From Date:</b></td><td><div align="left">	
	
	<input type="text" id="calender" name="calender"
				size="13" class="formElement" value="" readonly/>
	<script type="text/javascript">
        Calendar.setup(
        {
        	inputField  : "calender",         // ID of the input field
                ifFormat    : "%Y-%m-%d",     // the date format
                button      : "trigger"       // ID of the button
        }
                      );
        </script> 
	</div></td>
	<td><b>To Date:</b></td><td><div align="left">
	
		<input type="text" id="calender1" name="calender1" 
			size="13" class="formElement" value="" readonly/>
 	        <script type="text/javascript">
             		Calendar.setup(
             		{
                		 inputField  : "calender1",         // ID of the input field
                		 ifFormat    : "%Y-%m-%d",     // the date format
                 		button      : "trigger1"       // ID of the button
             		}
                     );
        	</script> 
	</div></td>
	<td colspan="1">
	<b><font size="2">UnitID :</font>
	 <input type="text" name="challan" class="formElement" size="15"></input>
	</td>
	</tr>
	<tr>
	<td colspan="7" align="center">
		<input type="submit" name="submit" value="Submit"
		class="formElement" onClick="viewunits.action='techRecieved.jsp'; return validate();" /></input>
	</td>
	</tr>
</table>


<%
int j=1,q1=0;
//out.print(techname.length());

	q1=8;
    
	//out.println();
	//out.print("...Tech & date....");
	//out.print(data1);
  //  out.print(data2);
	if(challan=="" && !(data1.equals("")&& data2.equals(""))){
		selectedvalue=session.getAttribute("username").toString();
		sql1="select * from t_unitreceived where TechName like '%"+session.getAttribute("username").toString()+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	//	out.println("in challan!||!(challan.equalsIgnoreCase(null)||null.equalsIgnoreCase(challan)) )&& !(data1.equals()&& data2.equals()) ");
	}else if(challan!="" && !(data1.equals("")&& data2.equals("") )){
		
		String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
		String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
		//out.print(date3);
		//out.print(date4);
		selectedvalue=session.getAttribute("username").toString()+" for period from"+date3+" TO "+date4 +"for UnitID "+challan;
		selectedvalue=session.getAttribute("username").toString()+" for period from"+date3+" TO "+date4;
		sql1="select * from t_unitreceived where  TechName like '%"+session.getAttribute("username").toString()+"%' and UnitID like '%"+challan+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";	
	//	out.println("in challan!!(challan.equalsIgnoreCase(null)null.equalsIgnoreCase(challan)) ");
	}else if(challan=="" && data1.equals("")&& data2.equals("")){
		String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
		String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
		//out.print(date3);
		//out.print(date4);
		selectedvalue=session.getAttribute("username").toString()+" for period from"+date3+" TO "+date4 +"for UnitID "+challan;
		selectedvalue=session.getAttribute("username").toString()+" for period from"+date3+" TO "+date4;
		sql1="select * from t_unitreceived where  TechName like '%"+session.getAttribute("username").toString()+"%'  and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";	
		//out.println("in challan!!(challan.equalsIgnoreCase(null)null.equalsIgnoreCase(challan)) ");
	}
	else{
		
	//out.print("else condition");
		//out.print(date4);
		selectedvalue=session.getAttribute("username").toString();
		sql1="select * from t_unitreceived where  TechName like '%"+session.getAttribute("username").toString()+"%' and UnitID like '%"+challan+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	//	out.println("in else condition");
	}

//out.println(sql1);

session.setAttribute("sql1", sql1);
rs1=stmt1.executeQuery(sql1);
%>


<%
	String del=request.getParameter("deleted");
	if(null==del)
	{
	}
	else if(del.equals("yes"))
	{
%>
		<table border="0" width="750px"> 
		<tr>
        		<td><div align="center">
				<font color="blue" ><B><U>Deleted Successfully </U> </B></font>
			</div></td>
        	</tr>
		</table>
<%
	}
	else if(del.equals("warning"))
        {
%>
		<table border="0" width="750px"> 
                <tr>
	                <td><div align="center">
				<font color="blue">
					<B><U> Please select  checkbox which you want to delete
					</U></B>
				</font>
			</div></td>
		</tr>
        	</table>
<% 	} 
  	else
	{
	}
%>
<table border="0" width="750px"> 
	<tr>
        	<td> <div align="center"> 
			<font color="maroon" size="3">
				<B> Units Received  Details of 
			</font>
			<font color="green" size="3"><%=selectedvalue %> </B></font>
		</div></td>
	</tr>
</table>
<table border="0" width="750px"> 
<tr>
	
	<td><div align="right">
		<a href="exportviewRecieved.jsp?selvalue=<%=selectedvalue %>" title="Export to Excel">
		<img src="images/excel.jpg" width="17px" height="17px" border="0"/></a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="printviewrecieved.jsp?selvalue=<%=selectedvalue %>" title="Print">
			<img src="images/print.jpg" width="20px" height="20px"border="0"/>
		</a>
	</div></td>
</tr>
</table>
<br>
<table border="1" width="750px" align="center" class="sortable">
<tr> 
       
         <td> <div align="center"> Sr. No. </div> </td>
         <td> <div align="center"> Unit Id </div> </td>
         <td> <div align="center"> Status of Unit </div> </td>
         <td> <div align="center"> Date </div> </td> 
         
		 <td> <div align="center"> DC NO </div> </td>        
         <td> <div align="center"> Recieved From </div> </td> 
         <td> <div align="center"> Type </div> </td> 
         <td> <div align="center"> Tech Name </div> </td> 
         <td> <div align="center"> Location </div></td>
</tr>
<tr>
<%
	while(rs1.next())
        { 
		String unitid=rs1.getString("UnitID");
        	String rdte=rs1.getString("Rdate");
		String date5=new SimpleDateFormat("dd-MMM-yyyy").format
				(new SimpleDateFormat("yyyy-MM-dd").parse(rdte));
	        String tech=rs1.getString("TechName");
		//out.print(tech);
        	String ent=rs1.getString("EntBy");
        	String dcno=rs1.getString("DC_NO");
        	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rdte);
        	Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
        	String nwfrmtdte=formatter.format(datefrmdb);   
%>
	<input type="hidden" name="unitid<%=j %>" value="<%=unitid %>" > </input>
	<input type="hidden" name="dte<%=j %>" value="<%=rdte %>" > </input>
<tr>
		
              	<td> <div align="center"> <%=j %> </div> </td> 
              	<td> <div align="center"> <%=rs1.getString("UnitID") %> </div></td>
              	<td> <%=rs1.getString("Utype")%> </td>
              	<td> <div align="center"><%=date5 %> </div> </td>
              	
	<%
               	if(dcno==null || dcno.equals("")) 
		{
	 %>
 		<td> <div align="center"> - </div> </td>
	<%
		} 
		else
		{
	%>
              		<td><div align="center"><%=rs1.getString("DC_NO") %></div></td>
	<%
		}
	%>
              	<td> <div align="center"><%=rs1.getString("transporter") %> </div> </td>
              	<td> <div align="center"><%=rs1.getString("Utype") %> </div> </td>
		<td> <div align="center"> <%=tech %> </div> </td>
		<td> <div align="center"> <%=rs1.getString("Lname") %> </div> </td>
</tr>
<%
		j++; 
	}
%>
</table>
<input type="hidden" name="cntr" value="<%=j %>" />

<%
}
catch(Exception e)
{
	//out.print("Exception --->"+e);
}
finally
{
	con1.close();
}
%>
<!-- code end here --->
<table border="0" width="750px" height="450px">
<tr>
	<td> </td>	
</tr>
</table>
</div>
</div>
<div id="gbox-bot1">
</div>
</div>
</div>
</div>
</div>
<div id="copyright">
 	Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
</div>
</form>
</body>
</html>


