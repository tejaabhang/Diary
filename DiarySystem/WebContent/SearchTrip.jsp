<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import ="java.text.DecimalFormat" errorPage="" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
	<%@ include file="header.jsp"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>

<%!
Connection conn;
Statement st,st1,st2;
String query1,query2,query3,query4,query5;
%>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Search TripID</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
</script>
</head>


<body>
<div id="wrapper">
<div id="body-bot">
<div id="body-top">
<div id="logo">
<h1><img src="images/Transworld.gif"></h1>
<p>We care about your Vehicles</p>
</div>
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 

<%
try{
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    st1=conn.createStatement();
    st2=conn.createStatement();
    
	}catch(Exception E){
	//System.out.println(""+E);
	}	    
    //System.out.println("Connection Created");
    
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="5">Search Trip</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br></br>
<form name="searchtrip" id ="searchtrip" method="get" >
      <table border="0" width="750px" align="center">          	
			<tr> 
			 	<td align="center">
			 		<input type="text" name="search" id="search" value="" style="width: 600px;height: 25px;"/>
			 	</td>
	        	<td align ="center">	        
	        		<input type="submit" name="submit" id="submit" value="Go" style="width: 100px;height: 33px; font-size: 5;" />
	        	</td>
			</tr>
	</table>
</form>
<br />			
<%

	String searchText = request.getParameter("search");
	String searchText1 = searchText;

if(searchText == null || searchText == "") {

}
else{
	
	if(searchText.contains(" "))
	{
		searchText = searchText.replaceAll(" ","");
	}
	if(searchText.contains("."))
	{
		searchText = searchText.replaceAll(".","");
	}
	
	
	//System.out.println("The searchText is  :"+searchText);
	//System.out.println("The searchText1 is  :"+searchText1);
	
%>
<form id="SimmasterReport" name="SimmasterReport"  method="post" >
<%	

	try{
	String sql2 ="SELECT * from db_gps.t_startedjourney where Replace(Replace(TripID,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(Vehid,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(VehRegNo,'.', ''),' ','') LIKE '%"+searchText+"%'  OR Replace(Replace(StartPlace,'.', ''),' ','')  LIKE '%"+searchText+"%' OR Replace(Replace(StartCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(EndPlace,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(EndCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DriverCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DriverName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(OwnerName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(GPName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(JStatus,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(TripCategory,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DistributorName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(ConsideredLatLon,'.', ''),' ','') LIKE '%"+searchText+"%' Order by updateddt desc  limit 10 ";
	//System.out.println("The query is :"+sql2);
	ResultSet rs2 = st2.executeQuery(sql2);
	if(rs2.next())
	{
		%> 
		<table border="0" width="750px" align="center">
		<tr>
		<td align =left><font color="black" size="3">Your search - <%= searchText1%> .</font></td>
		</tr>
		</table>
		<%
	
	int count = 0;
	String sql ="SELECT * from db_gps.t_startedjourney where Replace(Replace(TripID,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(Vehid,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(VehRegNo,'.', ''),' ','') LIKE '%"+searchText+"%'  OR Replace(Replace(StartPlace,'.', ''),' ','')  LIKE '%"+searchText+"%' OR Replace(Replace(StartCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(EndPlace,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(EndCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DriverCode,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DriverName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(OwnerName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(GPName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(JStatus,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(TripCategory,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(DistributorName,'.', ''),' ','') LIKE '%"+searchText+"%' OR Replace(Replace(ConsideredLatLon,'.', ''),' ','') LIKE '%"+searchText+"%' Order by updateddt desc  limit 10 ";
	//System.out.println("The query is :"+sql);
	ResultSet rs = st.executeQuery(sql);
	
		if(count == 0)
		{	
		%>
		<table border="0" width="750px" align="center" class="sortable">
		<tr>
			<th bgcolor="#E6E6E6"><font size="2">Sr No</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Trip ID</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Veh Code</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Veh Reg No</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Start Place</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Start Code</font></th>
			<th bgcolor="#E6E6E6"><font size="2">End Place</font></th>
			<th bgcolor="#E6E6E6"><font size="2">End Code</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Start Date & Time</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Driver Name (Code)</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Owner Name</font></th>
			<th bgcolor="#E6E6E6"><font size="2">GP Name</font></th>
			<th bgcolor="#E6E6E6"><font size="2">JStatus</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Trip Category</font></th>	
			<th bgcolor="#E6E6E6"><font size="2">Considered Lat Long</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Distributor Name</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Ship To Code</font></th>
			<th bgcolor="#E6E6E6"><font size="2">Ship To Place</font></th>
		</tr>
		<%
		}
	while(rs.next()){
		//System.out.println("The query is :>>>");
		String  TripID = rs.getString("TripID");
		String  Vehid = rs.getString("Vehid");
		String  VehRegNo = rs.getString("VehRegNo");
		String  StartPlace = rs.getString("StartPlace");
		String  StartCode = rs.getString("StartCode");
		String  EndPlace = rs.getString("EndPlace");
		String  EndCode = rs.getString("EndCode");
		
		String  StartDate = rs.getString("StartDate");
		String  StartTime = rs.getString("StartTime");
		
		String StartDateTime = StartDate + " " + StartTime;
		
		String  DriverCode = rs.getString("DriverCode");
		String  DriverName = rs.getString("DriverName");
		
		String DriverNameCode = DriverName + " ("+ DriverCode +")";
		
		String  OwnerName = rs.getString("OwnerName");
		String  GPName = rs.getString("GPName");
		String  JStatus = rs.getString("JStatus");
		String  TripCategory = rs.getString("TripCategory");
		String  ConsideredLatLon = rs.getString("ConsideredLatLon");
		String  distributername = rs.getString("distributername");
		String  ship_to_code = rs.getString("Ship_To");
		
		String ship_to_place = "-";
		
		String sql1 ="SELECT newendcode from db_gps.t_alljddata where TripID = '"+TripID+"' "; 
		ResultSet rs1 = st1.executeQuery(sql1);
		if(rs1.next()){
			ship_to_place = rs1.getString("newendcode");
		}
		
		%>
		<tr>
		<td align =right><%= ++count %></td>
		<td align =right><%=TripID %></td>
		<td align =right><%=Vehid %></td>
		<td align =left><%=VehRegNo %></td>
		<td align =left><%=StartPlace %></td>
		<td align =right><%=StartCode %></td>
		<td align =left><%=EndPlace %></td>
		<td align =right><%=EndCode %></td>
		<td align =center><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(StartDateTime)) %></td>
		<td align =left><%=DriverNameCode %></td>
		<td align =left><%=OwnerName %></td>
		<td align =left><%=GPName %></td>
		<td align =left><%=JStatus %></td>
		<td align =left><%=TripCategory %></td>
		<td align =left><%=ConsideredLatLon %></td>
		<td align =left><%=distributername %></td>
		<td align =right><%=ship_to_code %></td>
		<td align =left><%=ship_to_place %></td>
		</tr>
		<%
		
	}//end of while
		%></table><br></br><%
}//end of if 

	else {
		%>
		<table border="0" width="750px" align="center">
		<tr>
		<td align =left><font color="black" size="3">Your search - <%= searchText%> - did not match any documents.</font></td>
		</tr>
		</table>
		<%
}
	%>
</form>
<%
	}catch(Exception e){
	//System.out.println("The exception is :"+e);
}
}//end of query if  %>

</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright Â© 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>