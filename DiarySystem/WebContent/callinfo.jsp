<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,stmtinsert;
String representative,sql,info,thedate,thetime,reciever,transporter,pagename;
%>
<%
try{
	java.util.Date date= new java.util.Date();
	Format f1 = new SimpleDateFormat("yyyy-MM-dd");
	Format f2 = new SimpleDateFormat("HH:mm:ss");
	thedate=f1.format(date);
	thetime=f2.format(date);
	representative=session.getAttribute("username").toString();
	reciever=request.getParameter("rname");
	info=request.getParameter("callinfo");
	transporter=request.getParameter("transporter");
	pagename=request.getParameter("pagename");
	out.print(representative+"  "+reciever+" "+info+"  "+thedate+" "+thetime);
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmtinsert=conn1.createStatement();
	sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType) values('"+thedate+"','"+thetime+"','"+reciever+"','"+representative+"','"+info+"','"+transporter+"','OutGoing','Transporter')";
	//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	int a=st.executeUpdate(sql);
	if(a >0)
		{
			response.sendRedirect(pagename+"?transporter="+transporter);
		}
	
}catch(Exception e)
{
	out.println("Exception----> "+e);
}
finally
{
	conn.close();
conn1.close();
}

%>
