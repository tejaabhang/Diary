<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1,con2;
Statement stmt1,stmtinsert;
String sql1;
%>

<%
try 
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	stmt1=con1.createStatement();
	stmtinsert=con2.createStatement();
	
String  sql2="";

String cntr="";
int cntrint=0;
int j=0;
cntr=request.getParameter("cntr");
//out.print(cntr);
cntrint=Integer.parseInt(cntr);
//out.println(cntrint);

String[] x = new String[cntrint];
String[] unitid = new String[cntrint];
String[] dte = new String[cntrint];


for(int i=0; i<cntrint; i++) 
{
   x[i] = request.getParameter("del"+i );
   if(x[i]==null)
   {
	
   }
   else
   {
	j++;
       
     //out.println(x[i]);
     //out.println("<br>");

     unitid[i]=request.getParameter("unitid"+i);
     //out.println(unitid[i]);
     //out.println("<br>");

     dte[i]=request.getParameter("dte"+i);
     //out.println(dte[i]);
     //out.println("<br>");

     sql2="update t_unitdispatch set Status='Deleted' where UnitID='"+unitid[i]+"' and Ddate='"+dte[i]+"' ";
   //Query for t_sqlquery
		String abcd=sql2.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

     stmt1.executeUpdate(sql2);
   }
     
 }


	if(j<=0)
	{
		response.sendRedirect("viewdispatch.jsp?deleted=warning");
		return;
	}
	else
	{	
		response.sendRedirect("viewdispatch.jsp?deleted=yes");
		return;
	} 


} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();
}  %>
