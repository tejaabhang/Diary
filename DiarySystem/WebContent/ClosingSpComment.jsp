<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ include file="header.jsp" %>



<head>


<title>Closing standard comments</title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/css.css" rel="StyleSheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<script type="text/javascript">
function validate(){
	//alert("in validate function");
	var closingComments=document.getElementById("closingComments").value;
	//alert("closingComments====>"+closingComments);
	if(closingComments=="Select"){
		alert("Please select closing special comment");	
		return false;
	}
	var closingExtra=document.getElementById("closingExtraComments").value;
	if(closingExtra==null||closingExtra==""){
			alert("Please enter extra comment");
			return false;
		}
	return true;
}
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
} 
</script>
</head>

<body onload="window.opener.close();">
<%! 
Connection con1;
%>
<%
//Statement st=conn.createStatement();
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
String RId=request.getParameter("RId");
String vehno=request.getParameter("vehno");
String unitid=request.getParameter("unitid");

//System.out.println("************"+RId+"***********");
String finalRID=RId.substring(0,RId.length()-1);
String ConfComments="";
String sq="select * from db_CustomerComplaints.t_techspecialrep where SrNo in ("+finalRID+") and Closed='No'";
ResultSet rs=stmt1.executeQuery(sq);
int i=1;
%>
<form action="insertClosingComments.jsp" method="get" onsubmit="return validate();">
<table border="1" width="400px" bgcolor="#E6E6E6" align="black" class="sortable">
			<tr bgcolor="#BDBDBD">
				<td align="center"> <b>Sr. No</b></td>
				<td align="center"> <b>Ent Date-Time</b> </td>
				<td align="center"> <b>Sp. Comment</b></td>
				<td align="center"> <b>Extra Comment</b></td>
				<td align="center"> <b>Concerned Person</b></td>
				<td align="center"> <b>Ent. By</b></td>
				<td align="center"> <b>Comment type</b></td>
				
			</tr>
			<%
			while(rs.next()){
				%>
				<tr>
				<td> <%=i%> </td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs.getString("EntDateTime")))%> </td>
				<td> <%=rs.getString("SpComment")%> </td>
				<td><%=rs.getString("Extra_comment") %></td>
				<td> <%=rs.getString("ActionToBeTakenBy")%> </td>
				<td> <%=rs.getString("EntBy")%> </td>
				<td> <%=rs.getString("cmmt_type")%> </td>
				</tr>
				<%
			i++;}
			%>
</table>
<br></br>	
<table style="background: #E6E6E6" align="center" width="80%">
<tr align="center"><td align="center">
<font size="2"><b>Enter closing comments </b></font>
</td></tr>
</table>
		
<table border="0" cellpadding="3" width="80%" style="background: #E6E6E6" align="center">
<tr  bgcolor="#BDBDBD">
	<%
	String sql="SELECT Comment FROM db_CustomerComplaints.t_commentlist WHERE Modulename='DiarySystem' AND Listname ='ClosingVehicle' order by Comment";
	ResultSet rs1=stmt2.executeQuery(sql);
	
	%>		
			<td valign="top" align="left"><font size="2">Closing standard comment:</font></td>
			<td align="left">
				<select name="closingComments" id="closingComments" class="formElement">
				<option value="Select">Select</option>
				<%
				while(rs1.next()){
				%>
				<option value="<%=rs1.getString("Comment")%>"><%=rs1.getString("Comment")%></option>
				<%
				}
				%>
				
			</select>
			</td>
			</tr>
			<tr  bgcolor="#BDBDBD">
			<td valign="top" align="left"><font size="2">Extra Comments:</font></td>
			<td align="left">
			<textarea rows="2" cols="20" name="closingExtraComments" id="closingExtraComments"></textarea>
			<input type="hidden" name="srno" id="srno" value="<%=finalRID%>">
			<input type="hidden" name="vehno" id="vehno" value="<%=vehno%>">
			<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>">
			</td>
</tr>
</table>

<table border="0" cellpadding="3" width="80%" style="background: #E6E6E6" align="center">
<tr>
<td align="center"><input type="submit" id="search-submit" name="submitFollowUp" value="Update"  /></td>
</tr>
</table>
</form>
</body>
</html>