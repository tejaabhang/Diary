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
	<script type="text/javascript">
	function validate(){
		var unitid=document.getElementById("unitid").value;
		if(unitid==""){
			alert("Please select UnitID");
			return false;
			}
		var tech=document.getElementById("tech").value;
		if(tech=="Select"){
			alert("Please select Hold by Technician");
			return false;
			}
		var techlist=document.getElementById("techlist").value;
		var custlist=document.getElementById("custlist").value;
		if(techlist=="Select" && custlist=="Select"){
			alert("Please select Transfer to Technician/Customer ");
			return false;
			}
		
		
		var transferAs=document.single.unittype[0].checked;
		var transferAs1=document.single.unittype[1].checked;
		if(transferAs==false&&transferAs1==false){
				alert("Please select Okay/Faulty ");
				return false;
			}
		var cmnt=document.getElementById("cmnt").value;
		if(cmnt.length<=0){
			alert("Please select  Comment ");
			return false;
			}
		return true;

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
<!-- Checking request from tech type or not, and making headers available accordingly-->


<%@ include file="header1.jsp" %>
   
    </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
              <form name="single" method="post" action="inserSingleUnitTransferToTechnician.jsp" onsubmit="return validate();">
          
<%
//System.out.println("in insert page");
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt4=con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null;
String sql="", sql1="", sql2="", sql3="";
String tm="";
String userrole=session.getAttribute("userrole").toString();

java.util.Date tdydate = new java.util.Date();
Format formatter = new SimpleDateFormat("HH:mm:ss");
tm=formatter.format(tdydate);

java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

//tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();

String inserted=request.getParameter("inserted");
if(inserted==null)
{
}
else
{ %>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
			<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
		</tr>
	</table>
	

<%
} 

String alrdyentered=request.getParameter("alrdyentered");
if(alrdyentered==null)
{
}
else
{ 
	String unitalrdyinrted=request.getParameter("unitid");
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">	
			<td align="center"> <font color="maroon"> Unit Id <%=unitalrdyinrted%> has already been received. </font> </td>
		</tr>
	</table>
	
	
<% 	} 

String firstentered=request.getParameter("firstentered");
if(firstentered==null)
{
}
else
{ 
	String unitfirstentered=request.getParameter("unitid");
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">	
			<td align="center"> <font color="maroon"> Unit Id <%=unitfirstentered%> has been received first time. Successfully Entered </font> </td>
		</tr>
	</table>
<% 	} 
String sqltech="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
ResultSet rstechname=stmt2.executeQuery(sqltech);
String sqltech1="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
ResultSet rstechname1=stmt4.executeQuery(sqltech1);
%>
 
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>Unit Transfer By Technician to technician</b></font></td></tr>
</table>
<br></br>
		 <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr bgcolor="#BDBDBD">
				<td colspan="3" align="center">
					<font color="black"><b>Internal Transfer Form</b></font>
				</td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td><b>UnitID</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="unitid" id="unitid"></input></td>
			</tr>
			<tr bgcolor="#BDBDBD">
			<td>  <B>Hold by Technician:</B> 
					<select name="tech" id="tech" > 	
						<option value="Select">Select</option>	
<%
						while(rstechname1.next())
						{ %>
							<option value="<%=rstechname1.getString("TechName")%>"><%=rstechname1.getString("TechName")%></option>
<%						}
%>
							
	    		     </select> 
			</td>
			</tr>
			<tr bgcolor="#BDBDBD">
				<td>  <B>Transfer to Tech:</B> 
					<select name="techlist" id="techlist" > 	
						<option value="Select">Select</option>	
<%
						while(rstechname.next())
						{ %>
							<option value="<%=rstechname.getString("TechName")%>"><%=rstechname.getString("TechName")%></option>
<%						}
%>
							
	    		     </select> 
<%	
						if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
						{
%>
							&nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
						String sqltrans="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
						ResultSet rstransname=stmt3.executeQuery(sqltrans);
%>						      
						 <B>Transfer to Cust:</B> <select name="custlist" id="custlist"> 	
								<option value="Select">Select</option>
								<%
									while(rstransname.next())
									{ %>
										<option value="<%=rstransname.getString("cust")%>"><%=rstransname.getString("cust")%></option>
<%									}
%>
								</select>	
<%									
}
%>

							</td>
						  </tr>   
						  
						     <tr bgcolor="#BDBDBD">
						     <td align="center">
						 <B> Transfer as: </B><input type="radio" name="unittype" id="unittype" value="Okay"> Okay
						 			<input type="radio" name="unittype" id="unittype" value="Faulty">Faulty
						</td>
					</tr>
					<tr bgcolor="#BDBDBD">
						<td align="center"> <B> Comment: </B> <textarea name="cmnt" id="cmnt"> </textarea> </td>
					</tr>
					<tr>
						<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer"/> </td>
					</tr>
				</table>
		</form>		
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>