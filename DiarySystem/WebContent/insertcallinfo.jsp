<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,stmtinsert;
String representative,sql,info,thedate,thetime,reciever,transporter,pagename;
String calltype,callertype,callername,callinfo;

%>
<%
try{ 
	java.util.Date date= new java.util.Date();
	Format f1 = new SimpleDateFormat("yyyy-MM-dd");
	Format f2 = new SimpleDateFormat("HH:mm:ss");
	thedate=f1.format(date);
	thetime=f2.format(date);
	representative=session.getAttribute("username").toString();
	calltype=request.getParameter("calltype");
	callertype=request.getParameter("callertype");
	callername=request.getParameter("callername");
	callinfo=request.getParameter("callinformation");
	transporter=request.getParameter("transporter");
	out.print(transporter+" "+representative+"  "+calltype+" "+callertype+"  "+thedate+" "+thetime+" "+callername+"  "+callinfo);
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmtinsert=conn1.createStatement();
	sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType) values('"+thedate+"','"+thetime+"','"+callername+"','"+representative+"','"+callinfo+"','"+transporter+"','"+calltype+"','"+callertype+"')";
	//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	out.print(sql);	
	int a=st.executeUpdate(sql);
	if(a >0)
		{
			response.sendRedirect("incommingcalls.jsp?err=no");
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
