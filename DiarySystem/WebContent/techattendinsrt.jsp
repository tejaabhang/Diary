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
	Statement stmt2=con1.createStatement();
	Statement stmt3=con1.createStatement();
	Statement st=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	ResultSet rs2=null;
	String sql1="", sql2="";
	String date="";
	String tech="", present="", location="", okayunits="0", faultyunits="0", comment="", holiday="", night="";	
	String Presentday="";
	String Email="",ContractId="";
	tech=request.getParameter("tech");
	present=request.getParameter("present");
	location=request.getParameter("loc");
	okayunits=request.getParameter("okayunits");
	faultyunits=request.getParameter("faultyunits");
	comment=request.getParameter("comment");
	holiday=request.getParameter("holiday");	
	night=request.getParameter("night");
	//Presentday=request.getParameter("Presentday");
	
	Presentday=request.getParameter("date_ex");
	String clientip="";
	clientip=request.getRemoteAddr();
	
	System.out.println("Client IP :- "+clientip);
	
	String user=session.getAttribute("DisplayName").toString();

	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//String s=formatter.format(tdydate);
	
	String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	        .format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
	                .parse(Presentday));
	
	System.out.println("S date is  "+s);
	
	String DateNew=s.substring(0,10);
	
			String TimeNew=s.substring(11);
			

	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	//String s1=formatter1.format(tdydate);
	String s1 =new SimpleDateFormat("yyyy-MM-dd")
    .format(new SimpleDateFormat("dd-MMM-yyyy")
            .parse(Presentday));
	
	System.out.println("S1 date is  "+s1);
	
	String TechData="select * from  db_CustomerComplaints.t_techlist where Available='Yes' and TechName='"+tech+"'";
	ResultSet rsTechData=stmt2.executeQuery(TechData);
	if(rsTechData.next())
	{
		Email=rsTechData.getString("EmailId");
		ContractId=rsTechData.getString("ContractorId");
	}
	else
	{
		Email="-";
		ContractId="-";
	}
	
	int cnt=0;
	if(ContractId.equals("-") || ContractId==null)
	{
		ContractId="0";
	}
	
	String AttendInsert="insert into db_leaveapplication.t_checkinout (EmpID,CheckinDateTime,checkDate,checkTime,CheckinType,Office,EntryComments,Name) values ('"+ContractId+"','"+s+"','"+DateNew+"','"+TimeNew+"','"+present+"','"+clientip+"','"+location+"','"+tech+"')";
	
	//String AttendInsert="insert into db_leaveapplication.t_checkinoutBackUp (EmpID,CheckinDateTime,checkDate,checkTime,CheckinType,Office,EntryComments,Name) values ('"+ContractId+"','"+s+"','"+DateNew+"','"+TimeNew+"','"+present+"','"+clientip+"','"+location+"','"+tech+"')";
	
	
	
	cnt=st.executeUpdate(AttendInsert);
	
	System.out.println("AttendInsert  :- "+AttendInsert);
	
	
	String sqlget="select * from t_techattendance where Techname='"+tech+"' order by AttendDateTime Desc limit 1";
	out.print(sqlget);
	ResultSet rsget=stmt2.executeQuery(sqlget);
	if(rsget.next())
	{
		
		date=rsget.getString("AttendDateTime");
	
	}
	String sqlnw="update t_techattendance set NightWorking='"+night+"' where AttendDateTime='"+date+"'";
	//Query for t_sqlquery
		String abcd=sqlnw.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	out.print(sqlnw);
	stmt3.executeUpdate(sqlnw);
	
	sql1="insert into t_techattendance (AttendDateTime, TechName, Present, Holiday, Location, OkayUnitsToday, FaultyUnitsToday, Comment, User) values ('"+s+"', '"+tech+"', '"+present+"', '"+holiday+"', '"+location+"', '"+okayunits+"', '"+faultyunits+"', '"+comment+"', '"+user+"')";
	//Query for t_sqlquery
		String abcd1=sql1.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
	out.print(sql1);
	stmt1.executeUpdate(sql1);
	
	
		
	
	response.sendRedirect("techattend.jsp?inserted=yes");
	return;
	/* sql2="select * from t_techattendance where Techname='"+tech+"' and AttendDateTime like '"+s1+" %' and present='"+present+"' ";
	out.print(sql2);
	rs2=stmt1.executeQuery(sql2);	
	if(rs2.next())
	{
		
			response.sendRedirect("techattend.jsp?alrdyinserted=yes&tech="+tech);
			return;
		
		
		
	}
	else
	{ 
		
		
	}*/
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
