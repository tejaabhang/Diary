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
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(),stmtinsert=con2.createStatement();
	
	String sql1="";
	String comment="",result="";
		
	String rid=request.getParameter("rid");
	String type=request.getParameter("type");
	String index=request.getParameter("index");
	//System.out.println("rid"+rid+type);
	String btn=request.getParameter("btn");
	if(btn==null || btn=="")
	{
	if(type.equalsIgnoreCase("Tech"))
	{
		comment=request.getParameter("comment"+index);
	}
	if(type.equalsIgnoreCase("Unit"))
	{
		comment=request.getParameter("comment1"+index);
	}
	if(type.equalsIgnoreCase("Vehicle"))
	{
		comment=request.getParameter("comment2"+index);
	}
	sql1="update t_commentlist set Comment='"+comment+"' where Rid='"+rid+"'";

	//Query for t_sqlquery
		String abcd=sql1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

	int i=stmt1.executeUpdate(sql1);
	if(i!=0)
	{
		result="Updated";
	}

	}
	else if(btn.equalsIgnoreCase("Delete"))
			{
	//System.out.println("inside btn");
		String totrid=request.getParameter("totrid");
		StringTokenizer strtok = new StringTokenizer(totrid,",");
		while (strtok.hasMoreTokens())
		{	
			String rowid=strtok.nextToken();
		String que="Delete from t_commentlist where Rid='"+rowid+"'";
		//Query for t_sqlquery
		String abcd=que.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		
		int j=stmt2.executeUpdate(que);
		if(j!=0)
		{
			result="Deleted";
		}
		}
		
			}
	response.sendRedirect("specialcmmtentryform.jsp?result="+result);
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

