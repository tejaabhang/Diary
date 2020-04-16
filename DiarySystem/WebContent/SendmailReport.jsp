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
			if(id==0)
			{
				document.getElementById("daterange").style.display='none';
				document.getElementById("tokenno").style.display="";
				document.getElementById("vehno").style.display='none';
				document.getElementById("trans").style.display='none';
				document.getElementById("temp").style.display='none';
			}
			else if(id==1)
			{
				document.getElementById("daterange").style.display="";
				document.getElementById("tokenno").style.display='none';
				document.getElementById("vehno").style.display='none';
				document.getElementById("trans").style.display='none';
				document.getElementById("temp").style.display='none';
			}
			else if(id==2)
			{
				document.getElementById("daterange").style.display='none';
				document.getElementById("tokenno").style.display='none';
				document.getElementById("vehno").style.display="";
				document.getElementById("trans").style.display='none';
				document.getElementById("temp").style.display='none';
			}else if(id==3){
				document.getElementById("daterange").style.display='none';
				document.getElementById("tokenno").style.display='none';
				document.getElementById("vehno").style.display='none';
				document.getElementById("trans").style.display="";
				document.getElementById("temp").style.display='none';
			}else if(id==4){
				document.getElementById("daterange").style.display='none';
				document.getElementById("tokenno").style.display='none';
				document.getElementById("vehno").style.display='none';
				document.getElementById("trans").style.display='none';
				document.getElementById("temp").style.display="";
			}else{
				document.getElementById("daterange").style.display='none';
				document.getElementById("tokenno").style.display='none';
				document.getElementById("vehno").style.display='none';
				document.getElementById("trans").style.display='none';
				document.getElementById("temp").style.display='none';
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
    data1=request.getParameter("data");
    String vehno=request.getParameter("vehno");
    String inputtype=request.getParameter("dataFilter");
    //System.out.println(inputtype);
    String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
    String templatevalue=request.getParameter("templatevalue");
    String owner=request.getParameter("owner");
%>


 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Send mail report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#77D7D4" align="center">
		<tr>
		<td> 
				<input type="radio" name="dataFilter" value="All"
				   CHECKED> <font color="black" size="2" >All</font>	
				<input type="radio" name="dataFilter" value="token" 
				 onClick="ShowHide(0);"><font color="black" size="2">Token Number</font>	
				<input type="radio" name="dataFilter" value="date" 
				 onClick="ShowHide(1);"> <font color="black" size="2">Date Range</font>	
				 <input type="radio" name="dataFilter" value="vehno" 
				 onClick="ShowHide(2);"> <font color="black" size="2">Vehicle Reg No.</font>
				 <input type="radio" name="dataFilter" value="trans" 
				 onClick="ShowHide(3);"> <font color="black" size="2">Transporter</font>
				 <input type="radio" name="dataFilter" value="temp" 
				 onClick="ShowHide(4);"> <font color="black" size="2">Template</font>		
			</td>
		</tr>
		<tr id="daterange" style="display:none"> <td><font color="black" size="2"><b>From Date:</b> </font>
					<input type="text" id="calender" name="calender" size="13" value="<%=sdt%>" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;&nbsp;&nbsp;
					
				<font color="black" size="2"><b>To Date:</b> </font>
					<input type="text" id="calender1" name="calender1" size="13" value="<%=sdt%>" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "calender1",         // ID of the input field
			                    ifFormat    : "%Y-%m-%d",     // the date format
			                    button      : "trigger1"       // ID of the button
			               }
			                             );
              		 </script>
		</td></tr>
		<tr id="tokenno" style="display:none"> 
	        <td><font color="black" size="2"><b>Token No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;</b></font>
	             <input type="text" id="data" name="data"  size="20"  />
	            
	        </td>
	    </tr>
	    <tr id="vehno" style="display:none"> 
	        <td><font color="black" size="2"><b>Vehicle Reg No: &nbsp;&nbsp;</b></font>
	             <input type="text" id="vehno" name="vehno" size="20"  />
	            
	        </td>
	    </tr>
	    <tr id="trans" style="display:none"> 
	        <td><font color="black" size="2"><b>Transporter: &nbsp;&nbsp;</b></font>
	             <select name="owner" id="owner" onchange="formsubmitt();">
						<option value="Select">Select</option>
						<%
						String que11="select Distinct(TypeValue) as Transporter from t_transporter order by TypeValue";
						
						ResultSet rst111=st.executeQuery(que11);
						while(rst111.next()){
						%>   
						       <option value="<%=rst111.getString("Transporter") %>"><%=rst111.getString("Transporter") %></option>  
						<%
						}
						 %>
	        	</select>
	        </td>
	    </tr>
	    <tr id="temp" style="display:none"> 
	        <td><font color="black" size="2"><b>Template: &nbsp;&nbsp;</b></font>
	             <select name="templatevalue" id="templatevalue" onchange="formsubmitt();">
						<option value="Select">Select</option>
						<%
						String que1="Select * from t_template where Active='Yes'";
						
						ResultSet rst11=st4.executeQuery(que1);
						while(rst11.next()){
						%>   
						       <option value="<%=rst11.getString("Template") %>"><%=rst11.getString("Template") %></option>  
						<%
						}
						 %>
	        	</select>
	        </td>
	    </tr>
	    <tr>
			<td align="center" colspan="2">
				<input type="submit" name="submit" id="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>


<%
String dd=request.getQueryString();
if(dd==null)
{
%>


<%
}
else
{

%>

<br></br>
			 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
				<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3">Mail History Report for Token &nbsp;<%=data1%></font></div>
						<div align="right">
						<a href="Sendmailreportexcel.jsp?data=<%=data1%>&vehno=<%=vehno%>&dataFilter=<%=inputtype%>&calender=<%=fromdate%>&calender1=<%=todate%>" title="Export to Excel">
						<img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
						<font color="black" size="2"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
						</font></div>
					</td>
				</tr>
			</table>
			<br>
<%
                        if(inputtype.equalsIgnoreCase("vehno")){
                        	sql="select * from t_emailmaster where vahno like '%"+vehno+"%' order by UpdatedDateTime Desc";
                        }else if(inputtype.equalsIgnoreCase("token")){
							sql="select * from t_emailmaster where srno='"+data1+"' order by UpdatedDateTime asc";
						}else if(inputtype.equalsIgnoreCase("date")){
							sql="select * from t_emailmaster where UpdatedDateTime>='"+fromdate+" 00:00:00' and UpdatedDateTime<= '"+todate+" 23:59:59' order by UpdatedDateTime asc";
						}else if(inputtype.equalsIgnoreCase("trans")){
							sql="select * from t_emailmaster where transporter='"+owner+"' order by UpdatedDateTime Desc";
						}else if(inputtype.equalsIgnoreCase("temp")){
							sql="select * from t_emailmaster where template='"+templatevalue+"' order by UpdatedDateTime Desc";
						}else{
							sql="select * from t_emailmaster order by UpdatedDateTime Desc";
						}
                        ResultSet rst1=stQuickTest.executeQuery(sql);
                        //System.out.println(sql);
                        int i=1;
                    

                        
%>

			<table border="1" align="center" class="sortable">
				<tr><th  colspan="13" bgcolor="#77D7D4"> <font color="black">Unit History</font></th></tr>
				<tr>
					<th colspan="1"><font color="black"> Sr.</font></th>
					<th colspan="1"><font color="black"> Token</font></th>
           			<th colspan="1"><font color="black"> Vehicle Reg no.</font></th>
					<th colspan="1"><font color="black"> Transporter</font></th>
					<th colspan="1"><font color="black"> UnitID</font></th>
					<th colspan="1"><font color="black"> Subject</font></th>
					<th ><font color="black"> Body</font></th>
					<th colspan="1"><font color="black"> Template</font></th>
					<th colspan="1"><font color="black"> From ID</font></th>
            		<th colspan="1"><font color="black"> To ID</font></th>
            		<th colspan="1"><font color="black"> Send Date Time</font></th>
                </tr>
                       	

                         <% while(rst1.next())
                         {
                        %>	
				<tr>
                    <td colspan="1"><div align="left"><%=i%></div></td>
                    <td colspan="1"><div align="left"><%=rst1.getString("srno")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("vahno")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("transporter")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("UnitID")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("subject")%></div></td>
					<td>
                        <div align="left" style="overflow: auto; width: 520px;"><%=rst1.getString("body")%></div>
                    </td>
					
					<td colspan="1"><div align="left"><%=rst1.getString("template")%></div></td>
                    <td colspan="1"><div align="left"><%=rst1.getString("fromid")%></div></td>
                    <td colspan="1"><div align="left"><%=rst1.getString("Toid")%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("UpdatedDateTime")%></div></td>
                </tr>
                       
                        <%
                          i++;
                          }
                        
                         %>
                     
                        </table>
			

                        <br>
                        

						
			

                        <br>

			
		
					
			
<%
}}catch(Exception e)
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
