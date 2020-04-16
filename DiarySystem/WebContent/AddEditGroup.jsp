<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>


<%! 
Connection con1, con2;
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
  <form name="removeunitform" method="get" action="insertAddGroup.jsp" onsubmit="return validate();">

<%
try
{	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql1="", sql2="", sql3="";

	sql1="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='Transporter' order by TypeValue";
	
	rs1=stmt1.executeQuery(sql1);

	String send=request.getParameter("send");
	if(send==null)
	{
	}
	else
	{%>
		<table border="0" width="750px">	
		<tr>
		<td align="center"> <font color="red"> <b>
			Successfully Removed (Temporary) </b>
		</td> </tr> </table>
<%
	}
%>

	

<center>
<table border="0" width="800px" >
<tr>
			<td colspan="12"><div align="center"><font color="brown" size="3"> <B> Add Group</B> </font></div></td>
		</tr>
<tr>
   <td> <div align="center">
	<table border="1" width="800px" >
		
<%
int cntr=Integer.parseInt(request.getParameter("cntr"));
String transporter=request.getParameter("transporter");
int l=1, m=0 ;

String[] chkbox=new String[cntr];
String[] id = new String[cntr];
String[] vehno = new String[cntr];
String[] x = new String[cntr];
String[] unitid = new String[cntr];

for(int k=0;k<cntr;k++)
{
	int c=0;
	
			id[k] = request.getParameter("id"+k );
			vehno[k] = request.getParameter("vehno"+k );
			unitid[k] = request.getParameter("unitid"+k );
			
	//		//System.out.println(vehno[k]);
		String transp="";
 %>
		
 <tr>
      <td> <font color="maroon"> Owner Name: </font> </td>
      <td><%=transporter %></td>
 
      <td>  <font color="maroon">Vehicles : </font> </td>
      <td><%=vehno[k]%></td>

      <td>  <font color="maroon">Groups : </font> </td>
      <td><input type="text" name="gadd<%=k%>" value="" ></input></td>
  
 		 <input type="hidden" name="owner<%=k%>" value="<%=transporter%>"></input>
 		<input type="hidden" name="vehcles<%=k%>" value="<%=vehno[k]%>"></input>
<%

			l++;
			m++;
			
			
			
			}
	%>
	</tr>
	<tr><input type="hidden" name="cntr" value="<%=l%>"></input>
	 <td colspan="14" align="center"> <div align="center"> <input type="submit" name="submit" value="Add" class="formElement"> </input> </div> </td> 
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
finally
{
	con1.close();
	
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
</form>
</body>
</html>
