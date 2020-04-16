<%-- 
    Document   : validate
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : Azar
    Discroption: this page having code to validate the user according to user role. and redirect the user to next page.
    last updated : Jan 12, 2009.
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con,con1;
String transporterlist,sql,user,userrole;
%>
<%
try
{
	transporterlist="(a";
	Class.forName("org.gjt.mm.mysql.Driver");
	con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement s = con.createStatement();
	Statement s1 = con1.createStatement();
	
	  
	   userrole=session.getAttribute("userrole").toString();
	   user=session.getAttribute("username").toString();
	   String typevalue=session.getAttribute("typevalue").toString();
	   if(typevalue.equals("transporter")){
		  String Transporter="";
		   String sqlassign="select * from db_CustomerComplaints.t_asgndtranstoreps where Representative='"+user+"'";
		  ResultSet rsassign=s.executeQuery(sqlassign);
		  while(rsassign.next()){
			  String trans=rsassign.getString("Transporter");
			  Transporter=Transporter+",'"+trans+"'";
		  }
		  Transporter=Transporter.substring(2,Transporter.length());
		  //System.out.println("Transporter--->"+Transporter);
		   sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del' and OwnerName IN ('"+Transporter+")  order by OwnerName";
		   //System.out.println("sql--->"+sql);	  
}
	   if(userrole.equals("service1"))
	   {
	         response.sendRedirect("Received.jsp");
	   }
	   
	   if(userrole.equals("SIMVendor"))
	   {
	         response.sendRedirect("confreprovbyvendor.jsp");
	   }
		
	   if(userrole.equals("sales"))
	   {
	         sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del'  order by OwnerName";
	   }
		
		if(userrole.equals("tech")|| userrole.equalsIgnoreCase("supertech"))
	   {
	   		response.sendRedirect("chkdatafortech.jsp");
	   }
		if(userrole.equals("service"))
	   {
	   
		sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName";

	   }
	   
	   if(userrole.equals("Manager")||userrole.equals("SuperAdmin"))
	   {
	   sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName";
	   }
	    if(userrole.equals("Group"))
	   {
	  sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where where OwnerName not like '%del' and GPName='"+user+"' order by OwnerName";
		}
	   if(userrole.equals("Superuser"))
	   {
	   sql="select Distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName";
	   
	   }
	   if(userrole.equals("dispatch"))
	   {
		   response.sendRedirect("Simtrack.jsp");	   
	   }
	   ResultSet rst1=s1.executeQuery(sql);
	   while(rst1.next())
	   {
	    transporterlist=transporterlist+","+rst1.getString("OwnerName");
	   }
	   transporterlist=transporterlist+")";
	   session.setAttribute("TransporterList",transporterlist);
	   response.sendRedirect("homepage.jsp");
	

}catch(Exception e)
{
	out.print("Exception-->"+e);
	//t_asgndtranstoreps' doesn't exist
}
finally
{

try
{
con.close();
con1.close();
}catch(Exception e)
{
}

}
%>
