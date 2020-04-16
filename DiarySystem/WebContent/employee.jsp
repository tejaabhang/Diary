<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
%>
<html>
<head>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
function ShowHide(id)
		{
//alert(id);
			if(id==0)
			{
				document.getElementById("all").style.display="";
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display='none';
			}
			else if(id==1)
			{
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display="";
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display='none';
			}
			else if(id==2)
			{
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display="";
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display='none';
			}else if(id==3){
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display="";
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display='none';
			}else if(id==4){
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display="";
				document.getElementById("quick").style.display='none';
			}else if(id==5){
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display="";
			}else if(id==6){
				document.getElementById("all").style.display='none';
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display="";
				document.getElementById("order").style.display='none';
				document.getElementById("quick").style.display='none';
			}
			else{
				document.getElementById("all").style.display="";
				document.getElementById("ser").style.display='none';
				document.getElementById("dispatch").style.display='none';
				document.getElementById("tech").style.display='none';
				document.getElementById("de").style.display='none';
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
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 



<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn.createStatement();
    st3=conn1.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("yyyy-MM-dd");
    String sdt = fmt.format(td);
    String update=request.getParameter("update");
    //System.out.println(update);
   
%>


 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Employee</font></td></tr>
				<%
				if(update!=null){
					 %>
					   <tr><td align="center"><font color="black" size="2">Deactivated successfully</font></td></tr>
					   <%
				   }else{
					  
				   }
				%>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#77D7D4" align="center">
		<tr>
		<td> 
				<input type="radio" name="dataFilter" value="token" 
				 onClick="ShowHide(0);"><font color="black" size="2" >All</font>	
				<input type="radio" name="dataFilter" value="date" 
				 onClick="ShowHide(1);"><font color="black" size="2">Service</font>	
				<input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(2);"> <font color="black" size="2">UnitDispatch</font>	
				 <input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(3);"><font color="black" size="2">Technician</font>
				 <input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(4);"><font color="black" size="2">UnitOrder</font>
				 <input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(5);"><font color="black" size="2">QuickTest</font>
				 <input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(6);"><font color="black" size="2">Deactivated Employee</font>
			</td>
		</tr>
		<tr id="all"> 
			<td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que12="select * from db_CustomerComplaints.t_admin where Active='Yes'";
						int a=1;
						ResultSet rst114=st.executeQuery(que12);
						//System.out.println(que12);
						while(rst114.next()){
						%>   
						      <tr><td><%=a%></td>
						      <td><%=rst114.getString("Name")%></td>
						      <td><%=rst114.getString("UName")%></td>
						      <td><%=rst114.getString("Email")%></td>
						      <td><%=rst114.getString("URole")%></td>
						      <td><a href="deactiveemployee.jsp?Name=<%=rst114.getString("Name")%>&UName=<%=rst114.getString("UName")%>&URole=<%=rst114.getString("URole")%>">Deactive</a></td>
						      </tr>
						<%
						a++;}
						 %>
				</table>
			</td>
		</tr>
		<tr id="tech" style="display:none"> 
			<td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que11="select * from db_CustomerComplaints.t_admin where URole='tech' and Active='Yes'";
						int i=1;
						ResultSet rst111=st.executeQuery(que11);
						//System.out.println(que11);
						while(rst111.next()){
						%>   
						      <tr><td><%=i%></td>
						      <td><%=rst111.getString("Name")%></td>
						      <td><%=rst111.getString("UName")%></td>
						      <td><%=rst111.getString("Email")%></td>
						      <td><%=rst111.getString("URole")%></td> 
						      <td><a href="deactiveemployee.jsp?Name=<%=rst111.getString("Name")%>&UName=<%=rst111.getString("UName")%>&URole=<%=rst111.getString("URole")%>">Deactive</a></td>
						      </tr>
						<%
						i++;}
						 %>
				</table>
			</td>
		</tr>
		<tr id="dispatch" style="display:none"> 
	        <td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que111="select * from db_CustomerComplaints.t_admin where (URole='manufacturer' || URole='administrator'|| URole='sales') and Active='Yes'";
						int j=1;
						ResultSet rst112=st.executeQuery(que111);
						//System.out.println(que111);
						while(rst112.next()){
						%>   
						      <tr><td><%=j%></td>
						      <td><%=rst112.getString("Name")%></td>
						      <td><%=rst112.getString("UName")%></td>
						      <td><%=rst112.getString("Email")%></td>
						      <td><%=rst112.getString("URole")%></td> 
						      <td><a href="deactiveemployee.jsp?Name=<%=rst112.getString("Name")%>&UName=<%=rst112.getString("UName")%>&URole=<%=rst112.getString("URole")%>">Deactive</a></td>
						      </tr>
						      
						<%
						j++;}
						 %>
				</table>
	        </td>
	    </tr>
	    <tr id="ser" style="display:none"> 
	        <td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que112="select * from db_CustomerComplaints.t_admin where URole='service' and Active='Yes'";
					
						int k=1;
						ResultSet rst113=st.executeQuery(que112);
						//System.out.println(que112);
						while(rst113.next()){
						//	//System.out.println(k);
						%>   
						      <tr><td><%=k%></td>
						      <td><%=rst113.getString("Name")%></td>
						      <td><%=rst113.getString("UName")%></td>
						      <td><%=rst113.getString("Email")%></td>
						      <td><%=rst113.getString("URole")%></td> 
						      <td><a href="deactiveemployee.jsp?Name=<%=rst113.getString("Name")%>&UName=<%=rst113.getString("UName")%>&URole=<%=rst113.getString("URole")%>">Deactive</a></td>
						      </tr>
						      
						<%
						k++;}
						 %>
				</table>
	        </td>
	    </tr>
	    <tr id="de" style="display:none"> 
	        <td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que114="select * from db_CustomerComplaints.t_admin where Active like '%No%'";
					
						int b=1;
						ResultSet rst115=st.executeQuery(que114);
						//System.out.println(que114);
						while(rst115.next()){
						//	//System.out.println(b);
						%>   
						      <tr><td><%=b%></td>
						      <td><%=rst115.getString("Name")%></td>
						      <td><%=rst115.getString("UName")%></td>
						      <td><%=rst115.getString("Email")%></td>
						      <td><%=rst115.getString("URole")%></td> 
						      <td><a href="activeemployee.jsp?Name=<%=rst115.getString("Name")%>&UName=<%=rst115.getString("UName")%>&URole=<%=rst115.getString("URole")%>">Active</a></td>
						      </tr>
						      
						<%
						b++;}
						 %>
				</table>
	        </td>
	    </tr>
	    <tr id="quick" style="display:none"> 
	        <td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que116="select * from db_CustomerComplaints.t_admin where (URole='manufacturer'|| URole='administrator') and  Active='Yes'";
					
						int c=1;
						ResultSet rst16=st.executeQuery(que116);
						//System.out.println(que116);
						while(rst16.next()){
						//	//System.out.println(b);
						%>   
						      <tr><td><%=b%></td>
						      <td><%=rst16.getString("Name")%></td>
						      <td><%=rst16.getString("UName")%></td>
						      <td><%=rst16.getString("Email")%></td>
						      <td><%=rst16.getString("URole")%></td> 
						      <td><a href="deactiveemployee.jsp?Name=<%=rst16.getString("Name")%>&UName=<%=rst16.getString("UName")%>&URole=<%=rst16.getString("URole")%>">DeActive</a></td>
						      </tr>
						      
						<%
						c++;}
						 %>
				</table>
	        </td>
	    </tr>
	     <tr id="order" style="display:none"> 
	        <td>
				<table border="1" align="center" class="sortable" bgcolor="white">
				<tr>
					<td>Srno</td>
					<td>Name</td>
					<td>UName</td>
					<td>Email</td>
					<td>URole</td>
				
				</tr>
					<%
						String que117="select * from db_CustomerComplaints.t_admin where (URole='admin') and Active='Yes'";
					
						int d=1;
						ResultSet rst17=st.executeQuery(que117);
						//System.out.println(que117);
						while(rst17.next()){
						//	//System.out.println(b);
						%>   
						      <tr><td><%=b%></td>
						      <td><%=rst17.getString("Name")%></td>
						      <td><%=rst17.getString("UName")%></td>
						      <td><%=rst17.getString("Email")%></td>
						      <td><%=rst17.getString("URole")%></td> 
						      <td><a href="deactiveemployee.jsp?Name=<%=rst17.getString("Name")%>&UName=<%=rst17.getString("UName")%>&URole=<%=rst17.getString("URole")%>">DeActive</a></td>
						      </tr>
						      
						<%
						c++;}
						 %>
				</table>
	        </td>
	    </tr>
	</table></form>			
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
<table width="750px" height="350px">
	<tr>
		<td></td>
	</tr>
</table>

<!-- code end here ---></div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright © 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>
