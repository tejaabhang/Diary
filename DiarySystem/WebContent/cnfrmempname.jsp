
<%-- 
    Document   : cnfrmempname.jsp
    Created on : April 13, 2010, 13:19:52
    Author     : Ayaz A.
    Discroption: Page To Show The Add or Edited details for confirmation 
    last updated : 
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
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
<form name="addgrpform" method="get" action="insrtempname.jsp" onSubmit="return validate();">
<%
try
{	
	
	 //System.out.println("control inside confirm query =========");
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt=con1.createStatement();
	
	String empcode = "-",empid = "-",empname="-",hod = "-";
	String email = "-",location = "-",designation = "-",phno = "-";
	
	 String OwnerName=request.getParameter("owner");
	 String vehcles=request.getParameter("vehcles");
	 String grp=request.getParameter("grp");
	 
	 String oldempcode=request.getParameter("oldempcode");
	 
	 //System.out.println("OwnerName=====if loop===   "+OwnerName);
	 //System.out.println("vehcles=====if loop===   "+vehcles);
	 //System.out.println("grp====if loop===   "+grp);
	 
	 //System.out.println("oldempcode===   "+oldempcode);
	 
	 
	 String checkstatus = request.getParameter("checkstatus");
	 if(checkstatus == "Yes" || checkstatus.equalsIgnoreCase("Yes"))
	 {
		 empname=request.getParameter("empname");
		 empcode=request.getParameter("empcode");
		 empid=request.getParameter("newempid");
		 hod = request.getParameter("newHOD");
		 email = request.getParameter("email");
		 location = request.getParameter("loc");
		 designation = request.getParameter("deg");
		 phno = request.getParameter("phno");		
		 
		 //System.out.println("empcode in confirmation page=====if loop===   "+empcode);
		 //System.out.println("empname in confirmation page=====if loop===   "+empname);
		 
		 
	 }
	 else
		 if(checkstatus == "No" || checkstatus.equalsIgnoreCase("No"))
		 {
			 
			 //System.out.println(" else if loop[========   ");
			 
			 empid = request.getParameter("empid");
			 String sql = "select firstname,lastname from db_gps.t_userdetails where username ='"+empid+"'";
			 //System.out.println("sql   "+sql);
			 ResultSet rs = stmt.executeQuery(sql);
			 if(rs.next())
			 {
				 empname = rs.getString("firstname")+" "+rs.getString("lastname");
			 }
			 
			 
			 
			 //System.out.println(" else if loop empname========   "+empname);
			 
			 //sql = "select empcode from db_gps.t_empAllocationHistory where empname = '"+empname+"' and VehNo='"+vehcles.trim()+"' ";
			
			 sql = "select empcode from db_gps.t_vehicledetails where empname = '"+empname+"' and Vehicleregnumber='"+vehcles.trim()+"' ";
			 
			 //System.out.println("sql1 empcode  "+sql);
			 rs = stmt.executeQuery(sql);
			 if(rs.next())
			 {
				 empcode = rs.getString("empcode");
			 }
			
			 
			 
			 empcode=oldempcode;
			 hod = request.getParameter("oldHOD");
			 if(hod == null || hod.equals("null") || hod == "" || hod.equals(""))
			 {
				 hod = request.getParameter("newHOD");
			 }
		 }
	
	 
	 //System.out.println("empcode in confirmation page========   "+empcode);
	 
	 String oldempname=request.getParameter("oldempname");
	 String calender=request.getParameter("calender");
	%>
	

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>CONFIRM EMPLOYEE NAME</b>  </font></td>
		</tr>
</table>
<br></br>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
       <td> <font color="black"><b> Owner Name: </b></font> </td>
       <td><b><%=OwnerName %></b></td>
 	</tr>
   <tr bgcolor="#BDBDBD">
      <td>  <font color="black"><b>Vehicles :</b> </font> </td>
      <td><b><%=vehcles %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Emp Name :</b> </font> </td>
     <td><b><%=empname %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Emp Code :</b> </font> </td>
     <td><b><%=empcode %></b></td>
  </tr>
  <%
  if(checkstatus == "Yes" || checkstatus.equalsIgnoreCase("Yes"))
  {
	  %>
	  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Email ID :</b> </font> </td>
     <td><b><%=email %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Contact No :</b> </font> </td>
     <td><b><%=phno %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Designation :</b> </font> </td>
     <td><b><%=designation %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Location :</b> </font> </td>
     <td><b><%=location %></b></td>
  </tr>
	  <%
  }
  %>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Allocation Date :</b> </font> </td>
     <td><b><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(calender))%></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>Emp Id : </b> </font> </td>
     <td><b><%=empid %></b></td>
  </tr>
  <tr bgcolor="#BDBDBD">
     <td>  <font color="black"><b>HOD :</b> </font> </td>
     <td><b><%=hod %></b></td>
  </tr>
 
  <tr>
	 <td colspan="2" align="center">
	 	 <input type="hidden" name=owner value="<%=OwnerName %>" />
  		 <input type="hidden" name=vehcles value="<%=vehcles %>" />	
 		 <input type="hidden" name=empname value="<%=empname %>" />		
 		 <input type="hidden" name=empcode value="<%=empcode %>" />
		 <input type="hidden" name=empid value="<%=empid %>" />	
 		 <input type="hidden" name="oldempname" value="<%=oldempname%>" />	
 		 <input type="hidden" name="allocationDate" value="<%=calender%>" />
 		 <input type="hidden" name="hod" value="<%=hod%>" />
 		 <input type="hidden" name="email" value="<%=email%>" />
 		 <input type="hidden" name="location" value="<%=location%>" />
 		 <input type="hidden" name="designation" value="<%=designation%>" />
 		 <input type="hidden" name="phno" value="<%=phno%>" />	
 		 <input type="hidden" name="checkstatus" value="<%=checkstatus%>" />
	 	 <input type="submit" name="Submit" value="Submit" class="formElement"">
	 </td>
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
