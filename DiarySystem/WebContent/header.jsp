<%!
String MM_dbConn_STRING,MM_dbConn_STRINGERP,MM_dbConn_USERNAMEERP,MM_dbConn_PASSWORDERP, MM_dbConn_STRING1, MM_dbConn_STRING2, MM_dbConn_STRING3, MM_dbConn_DRIVER, MM_dbConn_USERNAME, MM_dbConn_PASSWORD, MM_dbConn_PASSWORD1;

%>
<%

try{

	String sess=session.getAttribute("userrole").toString();
	
}
catch(Exception e)
{
	response.sendRedirect("index.jsp");
	return;
}

//MM_dbConn_STRING="jdbc:mysql://192.168.1.55/db_CustomerComplaints";
MM_dbConn_STRING="jdbc:mysql://103.241.181.36/db_CustomerComplaints";

//MM_dbConn_STRING1="jdbc:mysql://203.199.134.128/db_gps";

//MM_dbConn_STRING2="jdbc:mysql://203.199.134.128/twsql_twalldata";
MM_dbConn_STRING1="jdbc:mysql://103.241.181.36/db_gps";
MM_dbConn_STRINGERP="jdbc:mysql://103.241.181.36/db_GlobalERP";
//MM_dbConn_STRING1="jdbc:mysql://192.168.1.55/db_gps";

MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";

MM_dbConn_USERNAME="diary";
MM_dbConn_USERNAMEERP="fleetview";

MM_dbConn_PASSWORDERP="1@flv";

MM_dbConn_PASSWORD="d@1ry";

MM_dbConn_PASSWORD1="";

%>
