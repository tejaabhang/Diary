<%@ page 
	contentType="text/html; charset=iso-8859-1" 
	language="java" 
	import="java.sql.*" 
	import=" java.text.*" 
	import=" java.util.*" 
	errorPage="" %>
	
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="searchhi.js" type="text/javascript"></script>
<script src="sorttable.js" type="text/javascript"></script>
<link href="css/css.css" rel="StyleSheet" type="text/css"></link> 
<link href="css/erratic.css" rel="StyleSheet" type="text/css"></link>
<script src="js/elabel.js" type="text/javascript"></script>
<script src="js/sorttable.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="js/searchhi.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/cpanel_002.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<script type="text/javascript">
function openpopup(PageName)
{
	 try{
		 //alert(e);
	 testwindow=window.open("RegisterComplaint_Customer.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes");
	 testwindow.moveTo(200,200);
	 }catch(e)
	 {
		 alert(e);
	 }
}
</script>
<%!
String  MM_dbConn_STRING1,MM_dbConn_DRIVER, MM_dbConn_USERNAME, MM_dbConn_PASSWORD ;

%>
<%
MM_dbConn_STRING1="jdbc:mysql://192.168.2.55/db_gps";
MM_dbConn_DRIVER ="org.gjt.mm.mysql.Driver";

 MM_dbConn_USERNAME="diary";
 MM_dbConn_PASSWORD="d@1ry";
Connection conn=null;
Statement strno=null;

String PageName1=this.getClass().getName();
String reportno = "";
PageName1=PageName1.substring(PageName1.lastIndexOf(".")+1,PageName1.length());
System.out.println(">>>>PageName1>>>>"+PageName1);
PageName1=PageName1.replace("_",".");
PageName1=PageName1.replace(".005f","_");
System.out.println(PageName1);



//String PageName="diary";




try{
System.out.println("inside try of popup......");
	
	
	
	Class.forName(MM_dbConn_DRIVER);
	System.out.println("00000000......");
	
	System.out.println("<<><><><>1......");
	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	System.out.println("<><><><>222......");
	
	
	strno= conn.createStatement();

		System.out.println("<><><><>33333......");

System.out.println("1111111111111111...");


String sql = "select ReportNo from db_gps.t_reportnumberdiary where PageName = '"+PageName1+"'";
System.out.println("222222222...");
ResultSet rs = strno.executeQuery(sql);
System.out.println("33333333...");
System.out.println(sql);
System.out.println("4444444...");
if(rs.next())
{
	reportno = rs.getString("ReportNo");
}
	
	
	System.out.println(">>reportno>>"+reportno);
}
catch (NullPointerException e)
{
	   System.out.println("bar.couldReturnNull() returned null");
} catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	
	try {
        if (conn != null) conn.close();
        if (strno != null) strno.close();

    } catch (SQLException e) {
       
    } 
	
	//strno.close();
	//conn.close();
}
%>
</head>
<body id="mainbody" >
<div align="left">
		 <a href="#" onclick="openpopup('<%=PageName1 %>')" title="Register Complaint">Register Complaint</a>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="black"> Report No.: <%=reportno %></font>
		</div>
		<br>
</body>
</html>
