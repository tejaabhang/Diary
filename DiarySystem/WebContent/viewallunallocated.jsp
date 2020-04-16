<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,stx1,stx2;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,transporter;
int total,updated,dealy,disconnected,notactive,transid;
String trans="", alloctech="", tcktlgddte="", vehicle="" ;
int i=0, tick=0;

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
function GetTechnitian(aaa,bbb,ii)
{
	var aa=aaa.value;
	var bb=bbb;
	var i=ii;
	var ajaxRequest;  // The variable that makes Ajax possible!

     try{
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
							 document.getElementById("techdiv"+i).innerHTML=reslt;
      			 }
            }
            
  
           var queryString = "?loc=" +aa+"&tran="+bb+"&intval="+i;
           ajaxRequest.open("GET", "GetTechName.jsp" + queryString, true);
 	  
 	   ajaxRequest.send(null); 
}
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}
function showtextarea(a,b,c)
{
		document.getElementById("div"+a).innerHTML='<form action="callinfo.jsp" method="get"><TEXTAREA name="callinfo" id="callinfo" class="formElement"></TEXTAREA><br><input type="Submit" name="Submit" value="Submit" class="formElement"><input type="button" value="Cancel" onclick="canceldiv('+a+');" class="formElement"><br><input type="hidden" name="rname" id="rname" value="'+b+'"><br><input type="hidden" name="transporter" id="transporter" value="'+c+'"><br><input type="hidden" name="pagename" value="complaintview.jsp"></form>';
}
function canceldiv(A,B,C)
{	
	var B="'"+document.getElementById("rname").value+"'";
	var C="'"+document.getElementById("transporter").value+"'";
	document.getElementById("div"+A).innerHTML='<a href="javascript:showtextarea('+A+','+B+','+C+');">Edit</a>';
	
}
</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
</style>
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
          <table border="0" width="750px" align="center">
				<tr>
				<td  BGCOLOR="#EAE8E8"><a href="javascript:history.go(-1);"><b><i>BACK</i></b></a></td>
				<td  BGCOLOR="#EAE8E8"><a href="mainpage.jsp"><b><i>MAIN PAGE</i></b></a></td>
				<td  BGCOLOR="#EAE8E8"><a href="http://www.mobile-eye.in/contact.html"><b><i>CONTACT US</i></b></a></td>
				<td  BGCOLOR="#EAE8E8"><a href="#"><b><i>WELCOME </i></b></a><font color="red"><%=session.getAttribute("username").toString()%></font></td>
				<td  BGCOLOR="#EAE8E8"><a href="logout.jsp"><b><i>LOGOUT</i></b></a></td>
				<td  BGCOLOR="#EAE8E8"><b><i><%
			
			java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			String s=formatter1.format(d);
			out.print(s);
		%></i></b></td>
				</tr>          
          </table>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
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
//transporter=request.getParameter("transporter");
i=0;
tick=0;
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	stx1=conn.createStatement();
	stx2=conn.createStatement();
	sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where Representative='"+username+"'";
	ResultSet rstx1=stx1.executeQuery(sql);
	int a=1;
	int compcount=0;
	while(rstx1.next())
	{
	transporter=rstx1.getString("Transporter");
	sql="select Count(*) as count from t_complaints1 where Customer='"+transporter+"' and Status in ('UnAllocated','Attended')";
	ResultSet rstx2=stx2.executeQuery(sql);
	if(rstx2.next())
	{
	compcount=rstx2.getInt("count");
	}
	if(compcount >0)
	{
		%>
	
		<table border="0" width="750px" align="center">
		<tr><td>
		<hr width="750px"></hr>
<div align="center"><font color="#330011" size="2"> <B> <U>Transporter <%=transporter%></U><B></font></div>
<hr width="750px"></hr>
<div align="center"><font color="#330011" size="2"> <B> <U>Contact Person's</U><B></font></div>
<hr width="750px"></hr>
<P></P>
<table border="1" width="750px" class="sortable">
<tr>
<th>Sr.</th>
<th>Contact Name</th>
<th>Phone</th>
<th>Mobile</th>
<th>Email</th>
<th>Location</th>
<th>Comments</th>
</tr>
<%
sql1="select * from t_recieverinfo where Transporter='"+transporter+"'";
ResultSet rst4=st.executeQuery(sql1);

while(rst4.next())
{
String rname=rst4.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td><a href="javascript:toggleDetails1(<%=a%>,true);" title="Click Here">
<%=rst4.getString("RecieverName")%>
</a>
<br/>	
	<div class="popup" id="popupx<%=a%>">
	<table border="0" >
	<tr><td><a href='showdetails.jsp?res=<%=rst4.getString("RecieverName")%>&today=<%=today%>' onclick="toggleDetails1(<%=a%>,false);">Show Details</a></td></tr>
	<tr><td><a href="javascript:toggleDetails1(<%=a%>,false);">Close</a></td></tr>
	</table>
	
</div>
</td>
<td><%=rst4.getString("Phone")%></td>
<td><%=rst4.getString("Mobile")%></td>
<td><a href="mailto:<%=rst4.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst4.getString("Email")%></a></td>
<td><%=rst4.getString("PlaceName")%></td>
<td><div id="div<%=a%>"><a href="javascript:showtextarea(<%=a%>,'<%=rname%>','<%=transporter%>');">Edit</a></div></td>
</tr>
<%
a++;
}
%>
</table>

<p></p>
		
		</td></tr>
		<tr>
		<td align="center"><font color="#330011" size="2"> <B> <U>
		Complaints List.
		</U></B> </font>
		</td>
		</tr>
		<tr><td>
		<% String inserted=request.getParameter("inserted"); 
			if(!(inserted==null))
			{
			%><div align="center"><font color="maroon" size="2"> <B> <U>Successfully Done </U></B> </font></div><%
			}
		%>
		</td></tr>
		</table>
		<hr width="750px"> </hr>
		<table border="0" width="750px" align="center"  class="sortable" >
		<tr>
		<td>
		<form name="mainform" method="post" action="alloc.jsp">
<table border="1" width="750px" class="sortable">
  <tr>
      <th> Sr. No </th>
      <th> Ticket No </th>
      <th> Vehicle No </th>
      <th> Ticket Logged Date </th>
      <th> Status </th>
      <th> Location </th> 
      <th> Technician </th> 
      <th> Veh. Avail Date </th>
          
  </tr>
<%
	sql="select * from t_complaints1 where Customer='"+transporter+"' and Status in ('UnAllocated','Attended')";
ResultSet rst=st.executeQuery(sql);
//out.print(sql);
while(rst.next())
{
alloctech="Select";
    i++;
    tick=rst.getInt("Tno");
    tcktlgddte=rst.getString("TdyDate");
    String status=rst.getString("Status");
    vehicle=rst.getString("VehicleNo");
    String loc=rst.getString("VehAttLoc");
%>
<tr>
	<td> <%=i %> </td>
	<td> <%=tick %> </td>
	<td> <%=rst.getString("VehicleNo") %> </td>
	<td>
	<% 
     	java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(tcktlgddte);
	Format frt1=new SimpleDateFormat("dd-MMM-yyyy");
	String nwfrmtdte1=frt1.format(datefrmdb1);
	out.print(nwfrmtdte1);
	%>
	</td>	
	<td> <%=status %> </td>
	<td> 
	<select name="location<%=i%>" class="formElement" onchange="GetTechnitian(this,'<%=transporter%>',<%=i%>);">
	<%
		if(loc.equals("-"))
		{
			%><option value="Select">Select</option><%
		}
		else
		{	
	%>	
	<option value="<%=loc%>"><%=loc%></option>	
	<%
	}
	sql="select * from t_locoftrans where Transporter='"+transporter+"'";	
	ResultSet rst5=st1.executeQuery(sql);
	while(rst5.next())
	{
		%><option value='<%=rst5.getString("Location")%>'><%=rst5.getString("Location")%></option><%
	}
	%> 
	</select>	
	</td>
	<td> 
<% if(status.equals("Allocated"))
   { 
     sql="select * from t_callocation1 where Tno='"+tick+"' ";
     
     ResultSet rst1=st1.executeQuery(sql);
     if(rst1.next()) 
     { 
       alloctech=rst1.getString("Technicion");
       //out.print(alloctech);
     }
     else
     {  
        alloctech="Select";
     }
  }
         
%>
		<div id="techdiv<%=i%>"><select name="tech<%=i%>" class="formElement">
		<option vallue='<%=alloctech%>'><%=alloctech%></option>		
		</select></div>
       </td>
<td sorttable_customkey="dd-MMM-yyyy">

<% String vehdte="";
   sql="select VehAvaildate from t_complaints1 where Tno='"+tick+"' ";
   ResultSet rst3=st1.executeQuery(sql);
   if(rst3.next())
   { 
     vehdte=rst3.getString("VehAvaildate");
   } 
   
   if(!(vehdte.equals("-")))
   { %>   
     <input type="text" id="calender<%=i %>" name="calender<%=i %>" size="13" class="formElement" value="<%=vehdte %>" readonly/>
<% }
   else
   { %>
     <input type="text" id="calender<%=i %>" name="calender<%=i %>" size="13" class="formElement" value="" readonly/>
<% } %> 
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="button" name="trigger<%=i %>" id="trigger<%=i %>" value="Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender<%=i %>",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger<%=i %>"       // ID of the button
             }
                           );
             </script>
    </td>
</tr>
		<input type="hidden" name="tick<%=i %>" value="<%=tick %>" />
   		<input type="hidden" name="ticklgddte<%=i %>" value="<%=tcktlgddte %>" />
   		<input type="hidden" name="vehno<%=i %>" value="<%=vehicle %>" />
<%
}//end of main while.
%>
<input type="hidden" name="cntr" value="<%=i %>" />
<input type="hidden" name="transporter" value="<%=transporter %>"/>
</table>
<table width="750px">
<tr>
      <td> <div align="center"> <input type="submit" name="submit" value="Allocate" class="formElement" /> </div> </td>
  </tr>
</table>
</form>
		</td></tr>
	
		
	<%
	}
}
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
		</table>
		<table border="0" width="750px" height="300px">
		<tr><td></td></tr>
		</table>

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
