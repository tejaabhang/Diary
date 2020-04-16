<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,stmtinsert;
String sql,tno,vehno,transporter,location, thedate,technician,user,oldlocation,loddate,oldtechnician,resone,insertdatetime,insertdatetime1;
%>

<% 
tno=request.getParameter("tno");
vehno=request.getParameter("vehno");
transporter=request.getParameter("transporter");
location=request.getParameter("location");
thedate=request.getParameter("calender");
technician=request.getParameter("techname");
oldlocation=request.getParameter("oldlocation");
loddate=request.getParameter("oldavaildate");
oldtechnician=request.getParameter("oldtechnician");
user=session.getAttribute("username").toString();
resone=request.getParameter("reason");
insertdatetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
insertdatetime1=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

try {
	Class.forName(MM_dbConn_DRIVER);
	conn= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmtinsert=conn1.createStatement();
	st1=conn.createStatement();
	sql="insert into t_reallocated (Tno,VehRegNo,Transporter,NewAvailableDate,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason) values('"+tno+"','"+vehno+"','"+transporter+"','"+thedate+"','"+location+"','"+technician+"','"+insertdatetime+"','"+loddate+"','"+oldlocation+"','"+oldtechnician+"','"+user+"','"+resone+"')";
	//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	st.executeUpdate(sql);
	out.print(sql);
	sql="update t_callocation1 set DofAllocation='"+insertdatetime1+"', Technicion='"+technician+"',VehAvailDate='"+thedate+"' where Tno='"+tno+"'";
	//Query for t_sqlquery
		String abcd1=sql.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
	out.print(sql);
	st.executeUpdate(sql);
	sql="update t_complaints1 set VehAvailDate='"+thedate+"',RegBy='"+user+"',VehAttLoc='"+location+"' where Tno='"+tno+"'";
	//Query for t_sqlquery
		String abcd2=sql.replace("'","#");	
		abcd2=abcd2.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
	out.print(sql);
	st.executeUpdate(sql);
	response.sendRedirect("re_allocate.jsp?tno="+tno+"&err=no");
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
conn.close();
conn1.close();
}
%>
