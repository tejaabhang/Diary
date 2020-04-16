<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,stmtinsert;
String sql,sql1;
String techname,techmobile,thedate,intime1,intime2,outtime1,outtime2;
String veh,transporter,location,acctime,unitid,fixed,problem,newunit,driver,regby,intime,outtime;
int i,count;

%>
<%
try
{
Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmtinsert=conn1.createStatement();
	
count=Integer.parseInt(request.getParameter("hid1"));
regby=session.getAttribute("username").toString();
techname=request.getParameter("hidname");
techmobile=request.getParameter("hidmobile");
thedate=request.getParameter("hiddate");
intime1=request.getParameter("hidintime1");
intime2=request.getParameter("hidintime2");
intime=intime1+":"+intime2;
outtime1=request.getParameter("hidouttime1");
outtime2=request.getParameter("hidouttime2");
//out.print(techname+" "+techmobile+" "+thedate+" "+intime1+" "+intime2+" "+outtime1+" "+outtime2+"<br>");
outtime=outtime1+":"+outtime2;
for(i=1;i<count;i++)
{

	veh=request.getParameter("veh"+i);
	transporter=request.getParameter("trans"+i);
	location=request.getParameter("loc"+i);
	acctime=request.getParameter("acct"+i);
	unitid=request.getParameter("unit"+i);
	fixed=request.getParameter("fixed"+i);
	problem=request.getParameter("prob"+i);
	newunit=request.getParameter("newunit"+i);
	driver=request.getParameter("driver"+i);
	//out.print(veh+" "+transporter+" "+location+" "+acctime+" "+unitid+" "+fixed+" "+problem+" "+newunit+" "+driver+"<br>");
	
	if(veh.length()>2 && transporter.length()>2 && location.length()>2 && acctime.length()>0 && unitid.length()>2 )
	{
		sql="insert into t_techdailyreport (TechName,ConNo,InTime,OutTime,Transporter,VehNo,Fixed,OldUnitId,NewUnitId,ProbFound,AccessTime,Location,DriverName,EntBy)values('"+techname+"','"+techmobile+"','"+intime+"','"+outtime+"','"+transporter+"','"+veh+"','"+fixed+"','"+unitid+"','"+newunit+"','"+problem+"','"+acctime+"','"+location+"','"+driver+"','"+regby+"')";
		//Query for t_sqlquery
			String abcd=sql.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		//out.print(sql+"<br>");
		st.executeUpdate(sql);
	}
}
response.sendRedirect("techdailyreport.jsp");
}
catch(Exception e)
{
	out.print("Exception-->" +e);
}
finally
{
	conn.close();
	conn1.close();
}
%>