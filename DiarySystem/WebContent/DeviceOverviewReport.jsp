
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%!
Connection con, con2;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7,stmt8,stmt9,stmt10,stmt11,stmt12;
String exportFileName="";
String transporter="";
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

<form id="device" name="device" method="post" action="" onSubmit="return validate();">
              <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Device Overview Report</b>  </font></td>
		</tr>
	</table>

<% 		
   try
     {
	    Class.forName(MM_dbConn_DRIVER);
	    con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    
	    exportFileName = "CodeVersionReport.xls";
	      
	    stmt1=con.createStatement();
        stmt2=con.createStatement();
             
        
	    String sql,sql1; 
	    ResultSet rs1,rs2;
       String Deviceoverview = request.getParameter("Deviceoverview");
        
       System.out.println("Deviceoverview is :- "+Deviceoverview);  


%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	   <tr>
       		<td align="center" colspan="2">
       			<b></b>
       		</td>
       </tr>
       <tr bgcolor="#BDBDBD">
       		<td> <font color="black"> <b>Select Options</b> </font> </td>
      		<td colspan="1">
   	   		<select name="Deviceoverview" id="Deviceoverview">  
             <option value="Select">Select</option>
  <%            
             if(!(Deviceoverview == null))
 					{
%>
 						<option value="<%=Deviceoverview %>" selected="selected"><%=Deviceoverview %></option>
<%
 					}
%>
             
      		 <option value="SimCompany">SimCompany</option>
      		 <option value="Module">Module</option>
      		 <option value="GPS">GPS</option>
      		 <option value="typeunit">typeunit</option>
      		 <option value="SwVer">CodeVersion</option>
      		 <option value="Peripherals">Peripherals</option>
      		       		 
		</select> 
		
   	   </td>
   	      	      	   
   	   <td> <input type="submit" name="SUBMIT" id="SUBMIT" value="Submit"></input></td>
 </tr>
</table>


<%
   
  if(!(Deviceoverview == null) && !(Deviceoverview.equalsIgnoreCase("select")))
  {
			
	System.out.println("inside of if block and the Deviceoverview is :- "+Deviceoverview);	
		
	%>
	<div>
	
	
	<div id="mytable">
	<table class="sortable" border="1" align="center" width="750px" >
	
	  <tr bgcolor="#BDBDBD">
	
	   <td>Sr.</td>
	   <td>Peripherals</td>
	   <td>Total No.Of Devices</td>
	   
	   </tr>
	   
	   <%
	   int i=1;
	   String Type="",TotalnoofDevices="";
	   int srno=0;
	   String sql_unit = "select "+Deviceoverview+",count(*) as TotalDevice from db_gps.t_unitmaster group by "+Deviceoverview+" order by count(*) desc";
		System.out.println("sql_unit is :- "+sql_unit);
		ResultSet rst = stmt2.executeQuery(sql_unit);
		while(rst.next()){
		
		srno=i;
		System.out.println("inside block");
		Type=rst.getString(Deviceoverview);
		TotalnoofDevices=rst.getString("TotalDevice");
		System.out.println("Type orignally is:-"+Type);
		
		//Type=Type.replaceAll("\\+","+");
		//Type=Type.replaceAll(" "," ");
		System.out.println("Type with replacement:-"+Type);
		 //String sql2="select UnitId from db_gps.t_unitmaster where Deviceoverview='L50'";
	   %>
	<tr>
	<td><div align="right"> <%=srno%></div></td>
	<%-- <td><div align="left"> <%=Type%></div></td> --%>
	<td><a href="# " onclick="window.open('multiplesearch.jsp?Type=<%=Type %>&Deviceoverview=<%=Deviceoverview %>'); popWin.focus(); return false"><b> <font color ="blue" ><%=Type%> </font> </b> </a> </td> 
	<%-- <td><a href="#"><b><font color ="blue" ><%=Type%></font></b></a></td> --%>
	<td><div align="left"> <%=TotalnoofDevices%></div></td>
	</tr>
	<% i++;} %>
	</div>
	
	
	
	
<% }
  else
  {
	System.out.println("the Deviceoverview has not select ed yet ");   
							
			
  }%>

</form>

<% }
catch(Exception e)
{
	System.out.println("the exception is :- "+e.getMessage());
	e.printStackTrace();



} 
finally
{
	
	stmt1.close();
    stmt2.close();
    con.close();
    con2.close();

}
%>


<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="750px" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>