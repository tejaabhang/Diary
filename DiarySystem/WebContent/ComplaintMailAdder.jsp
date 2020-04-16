<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%!
	Connection con;
	
	%>
<%
String srno="";
String MailFrom="";
String Subject = "";
String Body = "";
String Attachment = "";
String MailDate = "";
String MailTime = "";
String ComDateTime = "";
String CDateTime = "";
Statement st = null;
Statement st1 = null;
//System.out.println("The >>>>");
try {
	con = DriverManager.getConnection(MM_dbConn_STRING,
			MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	st = con.createStatement();
	st1 = con.createStatement();

} catch (Exception e2) {
	//System.out.println("The exception is :"+e2);
}
%>

<%
try{
	
String sql ="select * from db_gps.t_complaintregistertable where Status ='Pending'";
ResultSet rs=st.executeQuery(sql);
//System.out.println("The query is :"+sql);
if(rs.next()) {
	srno=rs.getString("RID");
	MailFrom=rs.getString("MailFrom");
	Subject=rs.getString("Subject");
	Body=rs.getString("Body");
	Attachment=rs.getString("Attachment");
	MailDate=rs.getString("MailDate");
	MailTime=rs.getString("MailTime");
}
	DateFormat df1=new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
	DateFormat df3=new SimpleDateFormat("HH:mm");
	DateFormat df4=new SimpleDateFormat("HH:mm:ss");
	
	String MDate = df1.format(df2.parse(MailDate));
	String MTime = df3.format(df4.parse(MailTime));


	ComDateTime=MDate+" "+MTime;
	CDateTime=MailDate+" "+MailTime;
}catch(Exception e1) {
	//System.out.println("The exception is :"+e1);
}
//System.out.println("The MailFrom  is :"+MailFrom);
//System.out.println("The Subject is :"+Subject);
//System.out.println("The Body is :"+Body);
//System.out.println("The Attachment is :"+Attachment);
//System.out.println("The MailDate is :"+MailDate);
//System.out.println("The MailTime is :"+MailTime);
//System.out.println("The ComDateTime is :"+ComDateTime);
%>
<head>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f1f8ee;}</style>

<title>MailComplaintAddition</title>
<script src="sorttable.js" type="text/javascript"></script>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />

</head>


<body>


<div id="form_container" style="width:60%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Registration of mail complaints</a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<form id="catedit"  name="catedit" class="appnitro" enctype="multipart/form-data" action="ComplaintFVMailAdder.jsp" method="get" onsubmit=" ">
								
  <ul >
	<div align="center" style="width:100%; ">
	<table border="1" width="85%" align="center" CELLPADDING=10 style="background: #f8fcff" class=mytable>
	
	<tr>
	  <td style="text-align: left" width="30%"><font size="2"><b>Mail Date&Time </b></font></td>
	  <td><b><%=ComDateTime%></b></td>
	</tr>		
	<tr>
	  <td style="text-align: left" width="30%"><font size="2"><b>Mail From </b></font></td>
	  <td><b><%=MailFrom%></b></td>
	</tr>
	
	<tr>
	  <td style="text-align: left" width="30%"><font size="2"><b>Subject </b></font></td>
	  <td><b><%=Subject%></b></td>
	</tr>
	
	<tr>
	  <td style="text-align: left" width="30%"><font size="2"><b>Body </b></font></td>
	  <td><b><%=Body%></b></td>
	
	</tr>
	
	<tr>
	  <td style="text-align: left" width="30%"><font size="2"><b>Attachments </b></font></td>
	  <td><b><%=Attachment%></b></td>
	
	</tr>
</table>
<input type="hidden" name="compdatetime" id="compdatetime" value="<%= CDateTime%>"></input>
<input type="hidden" name="mailfrom" id="mailfrom" value="<%= MailFrom%>"></input>
<input type="hidden" name="subject" id="subject" value="<%= Subject%>"></input>
<input type="hidden" name="body" id="body" value="<%= Body%>"></input>
<input type="hidden" name="attach" id="attach" value="<%= Attachment%>"></input>
<input type="hidden" name="sr" id="sr" value="<%= srno%>"></input>
<br></br>
<input type="submit" name="comadd" id ="comadd" value="Add Complaint"></input>
</div>
</form>
</div>		
</ul>

</body>
</html>