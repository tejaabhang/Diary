<%-- 
    Document   : EditEmpName.jsp
    Created on : April 13, 2010, 13:19:52
    Author     : Ayaz A.
    Discroption: Page To Add or Edit The Employee Name And Code For Castrol Emp Vehicles and will update in t_vehjicledetails Table 
    last updated : 
--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1, con2;
%>

<html>
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
	//alert("Hiiiiii");
	var v1=document.addgrpform.owner.value;
	var v2=document.addgrpform.vehcles.value;
	//alert(v2);
	
	if(v1=="Select")
	{	
		alert("Select Transporter");
		return false;
	}
	else if(v2=="Select")
	{
		alert("Select Vehicle");
		return false;
	}
	else	
	{
		var v3=document.addgrpform.empname.value;
		if(v3.length=="")
		{
			alert("Enter Emp Name");
			return false;
		}
		//alert(v3);
		var v4=document.addgrpform.empcode.value;
		if(v4.length=="")
		{
			alert("Enter Emp Code");
			return false;
		}
		//alert(v4);
		var v5=document.addgrpform.empid.value;
		if(v5.length=="")
		{
			alert("Enter Emp Id");
			return false;
		}
		//alert(v5);
		
	}
	return true;
}



function formsubmit()
{
	var aa=document.addgrpform.owner.value;
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
	}
}
function formsubmit1()
{
	var bb=document.addgrpform.owner.value;
	if(!(bb=="Select"))
	{	
		document.addgrpform.submit();
	}
}
function redirect()
{
	var check=validate();
	//alert(check);
	if(check==true)
	{
	document.addgrpform.action="cnfrmempname.jsp";
	document.addgrpform.submit();
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
          <p></p>
         <%@ include file="header1.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="addgrpform" method="get" action="confirmAddEditEmp.jsp" >
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
			Successfully Removed (Temporary) </b></font>
		</td> </tr> </table>
<%
	}
%>

	

<center>
<table border="0" width="800px" >
<tr>
			<td colspan="12"><div align="center"><font color="brown" size="3"> <B> Add Edit Multiple Employee </B> </font></div></td>
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


for(int k=0;k<cntr;k++)
{
	int c=0;
	
			id[k] = request.getParameter("id"+k );
			vehno[k] = request.getParameter("vehno"+k );
			
			
		//	//System.out.println(vehno[k]);
		String transp="";
 %>
		 <tr>
      		 <td> <font color="maroon"> Owner Name: </font> </td>
      		 <td><input type="text" name="owner<%=k%>" id="owner<%=k%>" value="<%=transporter%>" readonly></td>

      		 <td>  <font color="maroon">Vehicles : </font> </td>
     		 <td><input type="text" name="vehreg<%=k%>" id=vehreg<%=k%>" value="<%=vehno[k] %>" readonly> </td>
 
  			 <td>  <font color="maroon">Old EMP Name And Code : </font> </td>
    		 <td> 
<%
	 				String sql="select Empname,Empcode from db_gps.t_vehicledetails where VehicleRegNumber = '"+vehno[k]+"'";
	   				rs2=stmt2.executeQuery(sql);
	   				while(rs2.next())
   	   				{ 
%>
			      		<%=rs2.getString("Empname") %> &nbsp;&nbsp;&nbsp; <%=rs2.getString("Empcode") %>
      		
      			<input type="hidden" name="oldempname<%=k%>" value="<%=rs2.getString("Empname")%>" />	
<% 
					} 
%>
			 </td>   
  			<td>  <font color="maroon">New EMP Name : </font> </td>
 			<td> <input type="text" name="empname<%=k%>" id="empname<%=k%>"></input></td>
    			
  			<td> <font color="maroon">New EMP Code : </font> </td>
 			<td> <input type="text" name="empcode<%=k%>" id="empcode<%=k%>"></input></td>
    			
  			<td><font color="maroon">New EMP ID : </font> </td>
   			<td> <input type="text" name="empid<%=k%>" id="empid<%=k%>"> </input></td>
<%

			l++;
			m++;
			
			
			
			}
	%>
	</tr>
	<tr><input type="hidden" name="cntr" value="<%=l%>"></input>
	 <td colspan="14" align="center"> <div align="center"> <input type="submit" name="submit" value="submit" class="formElement"> </input> </div> </td> 
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
</center>
</form>
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
