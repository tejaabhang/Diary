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
	
	String sql1="";
	int chkdcntr=0;
	boolean flag=false;

	String confirm=request.getParameter("confirm");
	////System.out.println("confirm"+confirm);
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date=formatter.format(tdydate);
	String unit=request.getParameter("unit");
	String user=session.getAttribute("DisplayName").toString();
	String totsrno=request.getParameter("totsrno");

	StringTokenizer strtoken=new StringTokenizer(totsrno,",");
	while(strtoken.hasMoreTokens())
	{
		String srno=strtoken.nextToken();
	
		String sql="Update t_techspecialrep set Closed='Yes', ClosedDateTime='"+date+"',CloseBy='"+user+"'  where SrNo='"+srno+"'";
		//Query for t_sqlquery
			String abcd=sql.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

		
		int i=stmt1.executeUpdate(sql);
		if(i!=0)
		{
			flag=true;
		}
		
	}
	if(confirm!=null && confirm.equalsIgnoreCase("confirmunitreceive"))
			{
		response.sendRedirect("closeunitcomnt.jsp?flag="+flag+"&unitid="+unit);
			}
	else
	{
	response.sendRedirect("CloseComment.jsp?flag="+flag+"&unitid="+unit);
	}
}catch(Exception e)
{
	e.printStackTrace();
}finally
{
	con1.close();
	con2.close();
}
	%>