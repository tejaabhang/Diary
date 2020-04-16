<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,transporter;
int total,updated,dealy,disconnected,notactive,transid;
String trans="", alloctech="", tcktlgddte="", vehicle="" ;
int i=0, tick=0;
String date;

%>
<%
String  userrole1=session.getAttribute("userrole").toString();
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
        <%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);

Calendar now = Calendar.getInstance();
String IDate=new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());
now.add(Calendar.DATE, -4);
////System.out.println("IDate"+formatter.format(now.getTime()));
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
transporter=request.getParameter("transporter");
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
	st3=conn1.createStatement();
	st4=conn1.createStatement();
		%>
	
		<table border="0" width="750px" align="center">
		<tr><td>
		<table border="0" width="750px" align="center">
		<hr width="750px"></hr>
		<div align="center"><font color="#330011" size="2"> <B> <U>Transporter <%=transporter%></U><B></font></div>
		<hr width="750px"></hr>
		<div align="center"><font color="#330011" size="2"> <B> <U>Contact Person's</U><B></font></div>
		<hr width="750px"></hr>
		</table>

<table border="1" class="sortable" width="100%">
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
int a=1;
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
		Not Re-Allocated Complaints List.
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
      <th> Problem </th>
      <th> Location </th> 
      <th> Technician </th> 
      <th> Veh. Avail Date </th>
          
  </tr>
<%

//sql="select * from t_complaints1 where VehAvaildate between '"+formatter.format(now.getTime())+"' and '"+today+"' and Customer='"+transporter+"' and Status in ('Allocated','Attended') order By VehAvaildate Desc";		
sql="select * from t_complaints1 where VehAvaildate < '"+formatter.format(now.getTime())+"' and Customer='"+transporter+"' and Status in ('Allocated','Attended') order By VehAvaildate Desc";		
		
ResultSet rst=st.executeQuery(sql);
////System.out.println("sql in complaintview-----------"+sql);
while(rst.next())
{
	i++;
   // tick=rst.getInt("Tno");
    tcktlgddte=rst.getString("TdyDate");
   // //System.out.println("tcktlgddte"+tcktlgddte);
    String status=rst.getString("Complaint");
   // //System.out.println("status"+status);
    vehicle=rst.getString("VehicleNo");
   // //System.out.println("vehicle"+vehicle);
    String loc=rst.getString("VehAttLoc");
 //   //System.out.println("loc"+loc);
    date=rst.getString("VehAvaildate");
  //  //System.out.println("VehAvaildate"+date);
%>
<tr>
	<td> <%=i %> </td>
	<td> <%=rst.getInt("Tno") %> </td>
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
	<%=loc%>
	</td>	
	<%
	sql1="select * from t_callocation1 where Tno='"+rst.getInt("Tno")+"' ";
	ResultSet rst1=st1.executeQuery(sql1);
	if(rst1.next()) 
	{ 
		%>
		<td><%=rst1.getString("Technicion")%></td>
		<%
	}
	else
	{
	%>
	<td>-</td>
	<%	
	}
	%>
	
	<%
	try
	{
	String VehAvaildate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rst.getString("VehAvaildate")));
	%>
	
	<td><%=VehAvaildate %></td>
	<%	
	}catch(Exception e)
	{
		%><td>No</td>
		<%
	//	//System.out.println(e);
	}
	
	
	
}
	%> 
</tr>
</table>
		
	<%

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
		

<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
</form>
</td>
</tr>
</table>
<br>
<br>
<table border="1" width="750px" align="center">
<center><tr><td bgcolor="#98AFC7" class="copyright" width="750px">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr></center>
</table>
</body>
</html>
