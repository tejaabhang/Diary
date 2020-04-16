<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con2, con3;
int newuid=0;
%>

<%
try {
Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();
con3 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt2=con2.createStatement(), stmt3=con3.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="";
ResultSet rs3=null, rs5=null;
int nxtrid=0;

String ownname="", typusr="", uid="", pwd="";

String user=session.getValue("username").toString();
out.print(user);

ownname=request.getParameter("ownname");
typusr=request.getParameter("typusr");
uid=request.getParameter("uid");
pwd=request.getParameter("pass");

//out.println(ownname);

 
sql2="insert into db_gps.t_security (Username,FullName,Password,OtherDetails,RightToViewTracking,RightToAddorEditUsers,RightToAddorEditVehicles,RightToSendSMSInterval,RightToSendSMSRelayOpenClose,RightToSendSMSRemotePolling,TypeofUser,TypeValue,MM_DBConn_Driver,MM_dbConn_UserName,MM_dbConn_Password,MM_dbConn_String,MM_dbConn_String1) values ('"+uid+"','"+ownname+"','"+pwd+"','SHOWMAIL','No','No','No','No','No','No','"+typusr+"','"+ownname+"','org.gjt.mm.mysql.Driver','diary','d@1ry','jdbc:mysql://103.241.181.36/db_gps','jdbc:mysql://103.241.181.36/db_gpsExceptions') ";
int i=stmt2.executeUpdate(sql2); 

//out.println("Inserted2"); 

sql4="insert into t_asgndtranstoreps (Transporter, Representative) values ('"+ownname+"', '"+user+"')";
stmt3.executeUpdate(sql4);

 sql5="select max(RID) as lastrid from t_transporterbilldetails";
 rs5=stmt2.executeQuery(sql5);
 while(rs5.next())
 {
    nxtrid=rs5.getInt("lastrid");
 }
  nxtrid=nxtrid+1;
  
  sql6="insert into t_transporterbilldetails (RID, OwnerName) values('"+nxtrid+"', '"+ownname+"')";
  stmt2.executeUpdate(sql6);
  
 out.print(nxtrid);  


response.sendRedirect("newcustadd.jsp?i="+i);
} catch(Exception e) { out.println("Exception>>>>> "+e); }

finally
{

	con2.close();
	con3.close();
}
%>


