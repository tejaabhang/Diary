<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	String user=session.getAttribute("DisplayName").toString();	
	String sql1="";
	int chkdcntr=0;
	String flag="true";
	int j=1;
	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);
	
	boolean result=false;
	String totrid=request.getParameter("totrid");
	StringTokenizer strtok = new StringTokenizer(totrid,",");
	while (strtok.hasMoreTokens())
	{	
		String rowid=strtok.nextToken();
		////System.out.println(rowid);
		sql1="update t_techspecialrep set Closed='Yes', ClosedDateTime='"+s+"',CloseBy='"+user+"' where SrNo='"+rowid+"'";
		//Query for t_sqlquery
			String abcd=sql1.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

		j=stmt1.executeUpdate(sql1);
		if(j!=0)
		{
			result=true;
		}
	}
	response.sendRedirect("closetechspcomment.jsp?result="+result);
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

