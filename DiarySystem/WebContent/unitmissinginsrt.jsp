<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%!
Connection con1, con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmtinsert=con2.createStatement();
ResultSet rs1=null, rs3=null;
String sql1="", sql2="", sql3="";

	String owner=request.getParameter("owner");
	String vehreg=request.getParameter("vehreg");
	String unitid=request.getParameter("unitid").trim();
	String cmnt=request.getParameter("cmnt");
	
	String singveh=request.getParameter("singveh");

	java.util.Date d = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(d);
	
	sql3="select * from t_unitmissing where VehNo='"+vehreg+"' and Status='Missing'";
	rs3=stmt1.executeQuery(sql3);
	if(rs3.next())
	{
		if(singveh==null || singveh.equals("null"))
		{
			response.sendRedirect("unitmissing.jsp?alrdydone=yes&transp="+owner+"&vehno="+vehreg+"&unitid="+unitid);
			
			return;
		}
		else
		{	
			response.sendRedirect("unitmissingofveh.jsp?alrdydone=yes");
			return;
		}					
	}
	
	else
	{	
		sql1="insert into t_unitmissing (Owner, VehNo, UnitId, Comment, EntDateTime) values ('"+owner+"', '"+vehreg+"', '"+unitid+"', '"+cmnt+"', '"+s+"')";
		//Query for t_sqlquery
			String abcd=sql1.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		stmt1.executeUpdate(sql1);

		sql2="update t_vehicledetails set Status='Missing' where VehicleRegNumber='"+vehreg+"' ";
		//Query for t_sqlquery
			String abcd1=sql2.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
		//out.print(sql2);
		stmt2.executeUpdate(sql2);
	
		if(singveh==null || singveh.equals("null"))
		{
			response.sendRedirect("unitmissing.jsp?inserted=yes");
			return;
		}
		else
		{	
			response.sendRedirect("unitmissingofveh.jsp?inserted=yes");
			return;
		}	
	}

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>

