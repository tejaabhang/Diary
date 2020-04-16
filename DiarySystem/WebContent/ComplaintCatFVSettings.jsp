<%@page import="java.security.acl.Owner"%><%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
	Connection con;
	
	%>
<head>
<script type="text/javascript">

</script>
</head>

<body> 
<%
//System.out.println("======inside the ComplaintFVSettings========");
try
{
	int i=0;
	Statement st=null;
	//Statement st1=null;
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st = con.createStatement();
 		//st1 = con.createStatement();
 		
 		
	} catch (Exception e) {
	}
	String srno = request.getParameter("srno");
	String CatID = request.getParameter("CategoryID");
	String CatDetails = request.getParameter("CategoryDetails");
	String MaxTime = request.getParameter("MaxTimeInHrs");
	
	
	
	try{
		String sql="update db_gps.t_complaintscategory SET CategoryID='"+CatID+"',CategoryDetails='"+CatDetails+"',MaxTimeInHrs='"+MaxTime+"' where SrNo='"+srno+"'";
		  i=st.executeUpdate(sql);
		}catch(Exception e1){
			//System.out.println("the exception1 is :"+e1);
		}
		
		//System.out.println("the no of rows updated is=====>>"+i);
	
		
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
finally{
	//con.close();
	response.sendRedirect("ComplaintCatSettingsEdit.jsp?Msg=1");
}
%>
</body>

</html>