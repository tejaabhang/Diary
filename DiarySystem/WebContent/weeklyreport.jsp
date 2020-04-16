<%-- 
    Document   : WeeklyReport
    Created on : 18-JAN-2010 
    Author     : Ayaz A.
    Discription: this page Shows The information of 1 Week for Technician And Representatives.  
--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!

Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6;
String radio,today,unitno,unitno1,today1,date;

%>
<html>
<head>
	
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css">
	<script language="javascript">

	function fun2()
	{
		document.form1.submit();
	}

	function fun1()
	{
		document.form2.submit();
	}
	
	</script>
<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

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
          <%@ include file="header1.jsp" %>
          </div>
          <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
today=formatter1.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds - 1000 * 60 * 60 *24;

defoultdate.setTime(miliseconds);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	st4=conn.createStatement();
	st5=conn1.createStatement();
	st6=conn.createStatement();
	
	radio=request.getParameter("r1");
	if(null==radio)
	{
		radio="Technician";
	}
		
	%>
	<table border="0" width="750px">
		<tr>	
			<td align="center"> <font color="maroon" size="3"> 7 Day Report.  </font> </td>
		</tr>
	</table>
	
	<form name="form1" id="form1" action="" method="post">
	
		<table border="0" width="750px">
		<tr>
			<td>	
			<input type="radio" name="r1" value="Technician" <% if(radio.equals("Technician")) { out.print("CHECKED"); } %> onclick="fun2();" ><B>Technician</B>
			<input type="radio" name="r1" value="Representative" <% if(radio.equals("Representative")) { out.print("CHECKED"); } %> onclick="fun2();"><B>Representative</B>				
			</td>
			<td><a href="weeklyreportexcel.jsp?r1=<%=radio%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a></td>	
			
		</tr>
		</table>
	</form>

	<%
	if(!(null==radio))
	{
		if(radio.equals("Technician"))
		{
		
		%>
		<table border="2" width="">
			<tr>
				<td><font color="Red">Date:</font></td>
				<td bgcolor="Black"></td>
				<%
				for(int i=1;i <= 7 ;i++)
				{
				miliseconds=miliseconds + 1000 * 60 * 60 *24;
				defoultdate.setTime(miliseconds);
				String today1=formatter1.format(defoultdate);
				%>
				<td align="center" colspan="6"><font color="Red"><%=today1 %></font></td>
				<td bgcolor="Black"></td>
				<%
				}
				%>
				</tr>
			<tr>
				<td><font color="Red">Technician</font></td>
				<td bgcolor="Black"></td>
				<%
				for(int l=0;l<7;l++)
				{
				%>
				<td><font color="Red">Veh<br>Avail</font></td>
				<td><font color="Red">OK<br>Unt</font></td>
				<td><font color="Red">Flty<br>Unt</font></td>
				<td><font color="Red">Tran<br>sit</font></td>
				<td><font color="Red">Flty<br>Trnst</font></td>
				<td><font color="Red">Unit<br>Req</font></td>
				<td bgcolor="Black"></td>
				<%
				}
				%>
			</tr>
			<%
		String sql="select distinct(TechName)as TechName from t_techlist where Available='Yes'";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
		%>
		<tr>	
		<td><%=rs.getString("TechName") %></td>
		<td bgcolor="Black"></td>
		<%
		int countavail=0, countunit=0, countreq=0, totcount=0;;
		java.util.Date todaysdate=new java.util.Date();
		Format formatter2=new SimpleDateFormat("yyyy-mm-dd");
		String todayis=formatter2.format(todaysdate);
		long todaysmiliseconds=todaysdate.getTime();
		todaysmiliseconds =	todaysmiliseconds - 1000 * 60 * 60*24;
		for(int m=0;m<7;m++)
		{
			todaysmiliseconds = todaysmiliseconds + 1000 * 60 * 60 *24;
			todaysdate.setTime(todaysmiliseconds);
			String today2=formatter.format(todaysdate);
		%>
		<td align="center">
		<%
		String sql1="select  count(Distinct VehRegNo) as count from t_callocation1 where VehAvaildate ='"+today2+"' and Technicion='"+rs.getString("TechName")+"' and Status='UnSolved'";
		ResultSet rs1=st1.executeQuery(sql1);
		while(rs1.next())
		{
			countavail = rs1.getInt("count");
			out.println("<a href='a.jsp?'>"+rs1.getString("count")+"</a>");
		}
		%>
		</td>
		<td align="center">
		<%
		String nextstr="";
		int k=0;
		String sql2="select OkayUnitsToday from t_techattendance where TechName = '"+rs.getString("TechName")+"' and AttendDateTime like '"+today2+"%'";
		ResultSet rs2=st2.executeQuery(sql2);
		if(rs2.next())
		{
			unitno=rs2.getString("OkayUnitsToday");
			if(unitno.equals("0") || unitno.equals("00") || unitno.equals(" 0"))
			{
				%>
				<a href="c.jsp"><%=k %></a>
				<%
			}
			else
			{
			StringTokenizer strtok= new StringTokenizer(unitno,",");
			while(strtok.hasMoreTokens())
			{
				nextstr=strtok.nextToken();
				k++;
			}
			%>
			<a href="b.jsp"><%=k %></a>
			<%
			}
			countunit=k;
		}
		else
		{
			%>
			<a href="b.jsp"><%=k %></a>
			<%
			countunit=k;
		}
		%>
		</td>
		<td align="center">
		<%
		String nextstr1="";
		int j=0;
		String sql3="select * from t_techattendance where TechName = '"+rs.getString("TechName")+"' and AttendDateTime like '"+today2+"%'";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			unitno1=rs3.getString("FaultyUnitsToday");
			if(unitno1.equals("0") || unitno1.equals("00") || unitno1.equals(" 0"))
			{
				%>
				<a href="c.jsp"><%=j %></a>
				<%
			}
			else
			{
			StringTokenizer strtok1= new StringTokenizer(unitno1,",");
			while(strtok1.hasMoreTokens())
			{
				nextstr1=strtok1.nextToken();
				j++;
			}
			%>
			<a href="c.jsp"><%=j %></a>
			<%
			}
		}
		else
		{
			%>
			<a href="c.jsp"><%=j %></a>
			<%
		}
		%>
		</td>
		<%
		int cnt=0;
		String sql4="select * from t_unitorder where Tech like '"+rs.getString("TechName")+"' and ReqDate ='"+today2+"' and Status <> 'Open' order by ReqDate desc ";
		ResultSet rs4=st4.executeQuery(sql4);
		while(rs4.next())
		{
			String orderno=rs4.getString("Reqno");
			String sql5="select * from t_unitmasterhistory where OrderNo='"+orderno+"' and RecByTech='No' ";
			ResultSet rs5=st5.executeQuery(sql5);
			while(rs5.next())
			{
				cnt++;
			}
			totcount=totcount+cnt;
		}
		%>
		<td align="center"><a href='d.jsp?'><%=totcount %></a></td>
		<td align="center">
		<%
		String sql6="select count(*) as count  from t_unitreceived where InTransit='Yes' and TechName='"+rs.getString("TechName")+"' and RDate = '"+today2+"'";
		ResultSet rs6=st6.executeQuery(sql6);
		while(rs6.next())
		{
			out.println("<a href='e.jsp?'>"+rs6.getString("count")+"</a>");
		}
		%>
		</td>
		<%
		countreq = countavail - countunit;
		if(countreq== 0)
		{
			%>
				<td align="center">
				<%=countreq %>
				</td>
			<%
		}
		else
		{
			%>
				<td align="center">
				<b><blink>
				<%=countreq %>
				</blink>
				</b>
				</td>
			<%
		}
		%>
				<td bgcolor="Black"></td>
		<%
		}
		}
		%>
		</tr>
		</table>
		<%
		}
		else
			if(radio.equals("Representative"))
		{
		%>
		<table border="2" width="750px">
				<tr>
					<td><b><font color="Red">Representative</font></b></td>
					<td><b><font color="Red">Total Calls</font></b></td>
					<td><b><font color="Red">Total Customers</font></b></td>
					<td><b><font color="Red">Comp. Allocated</font></b></td>
					<td><b><font color="Red">Com Re-Allocated</font></b></td>
					<td><b><font color="Red">Vehicle Available</font></b></td>
					<td><b><font color="Red">Pending Complaints</font></b></td>
				</tr>
		</table>
		<%
		}
	}

}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	try{
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
		conn1.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
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
