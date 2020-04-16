<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	Statement stmtinsert=con2.createStatement();
	
	String sql1="";
	
	String tech="", comment="", techcomment="",unitcomment="",closingvehiclecomment="",unitid="", radbutton="", redlight="", greenlight="", gpslight="", ringing="", commentfor="", veh="", acttobtakby="" ;	
	
	radbutton=request.getParameter("radioSelected");
	//System.out.println(radbutton);
	comment=request.getParameter("vehiclecomment");
	unitcomment=request.getParameter("unitcomment");
	techcomment=request.getParameter("techcomment");
	closingvehiclecomment=request.getParameter("closingvehiclecomment");
	//System.out.println(closingvehiclecomment);
if(radbutton.equals("vehicle"))
{
	sql1="insert into t_commentlist (Modulename, Listname, Comment) values ('DiarySystem', 'Vehicle', '"+comment+"')";
}else if(radbutton.equals("ClosingVehicle")){
	sql1="insert into t_commentlist (Modulename, Listname, Comment) values ('DiarySystem', 'ClosingVehicle', '"+closingvehiclecomment+"')";
}
else
{
	if(radbutton.equals("tech"))
	{
		sql1="insert into t_commentlist (Modulename, Listname, Comment) values ('DiarySystem', 'Technician', '"+techcomment+"')";
	}
	else
	{
		sql1="insert into t_commentlist (Modulename, Listname, Comment) values ('DiarySystem', 'Unit', '"+unitcomment+"')";
	}
}
//Query for t_sqlquery
	String abcd=sql1.replace("'","#");	
	abcd=abcd.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	//System.out.println(sql1);
	stmt1.executeUpdate(sql1);
//System.out.println(sql1);

	response.sendRedirect("specialcmmtentryform.jsp?inserted=yes&comment="+radbutton);
	return;

	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>

