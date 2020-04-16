<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>


<%!
Connection con1, con2;
Statement stmt1, stmt2,stmtinsert;
String sql1, sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="";
%>

<%
String dt=request.getParameter("calender");
String tm=request.getParameter("rtime");
String courier=request.getParameter("courier");
String courierdcno=request.getParameter("courierdcno");
String uid=request.getParameter("unitId");
String transp=request.getParameter("transp");
String dcno=request.getParameter("dcno");
String techname=request.getParameter("techname");
String locname=request.getParameter("locname");
String tp=request.getParameter("radio2");
String loc=request.getParameter("loc");
String faulty=request.getParameter("faulty");
String cmnt=request.getParameter("cmnt");

if(tp=="Defective")
{
	faulty="Yes";
}
else
	if(tp=="Ok")
{
		faulty="No";
}

int pos=0;
pos=cmnt.indexOf("'");
if(pos>0)
{
	cmnt=cmnt.replace("'","");
}

String entby=session.getValue("username").toString();

int h1=Integer.parseInt(request.getParameter("h1"));


try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
stmt1=con1.createStatement();
stmt2=con2.createStatement();
stmtinsert=con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs5=null, rs6=null, rs7=null;
int days=0, days1=0;

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
	

	String dispdate="", recdate="";

try
{
	sql1="select DispDate from t_unitmasterhistory where UnitId='"+uid+"' order by DispDate desc ";
	out.print(sql1);
	rs1=stmt2.executeQuery(sql1);
	if(rs1.next())
	{
		dispdate=rs1.getString("DispDate");
	}

	if(dispdate==null || dispdate.equals("-") || dispdate.equals(""))		
	{
		dispdate=s;
	}
} catch(Exception e)
{
	
}
out.print("dispdate="+dispdate);

int k=0;
sql2="select RDate from t_unitreceived where UnitId='"+uid+"' order by RDate desc";
out.print(sql2);
rs2=stmt1.executeQuery(sql2);
if(rs2.next())
{
	recdate=rs2.getString("RDate");
}
else
{
	sql4="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName, UnitId, DC_NO, Transporter, Location,Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+cmnt+"', '"+entby+"', 'Yes', '"+dt+"', '"+locname+"', 'Partially', '"+entby+"')";
	//Query for t_sqlquery
		String abcd1=sql4.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
	out.print(sql4);
	k=stmt1.executeUpdate(sql4);

		
}


	sql3="select (TO_DAYS('"+recdate+"')-TO_DAYS('"+dispdate+"'))";	
	out.print(sql3);
	rs3=stmt1.executeQuery(sql3);
	if(rs3.next())
	{
		days=rs3.getInt(1);
	}

	
if(days <= 0 && k<=0)
{
	sql4="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName,  UnitId, DC_NO, Transporter, Location, Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+cmnt+"', '"+entby+"', 'Yes', '"+dt+"', '"+locname+"', 'Partially', '"+entby+"')";
	//Query for t_sqlquery
		String abcd1=sql4.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
	out.print(sql4);
	stmt1.executeUpdate(sql4);
	
}
else if(k > 0)
	{
		//response.sendRedirect("Received.jsp?inserted=yes");
		//return;
	}
else
{
	response.sendRedirect("unitssent.jsp?alrdyentered=yes&unitid="+uid);
	return;
}
out.print(days);


if(h1>1)
{
	for(int i=1; i< h1; i++)
	{
		//java.util.Date dispdate1=new java.util.Date();
		//java.util.Date recdate1=new java.util.Date();	

		String 	dispdate1="", recdate1="";

		uid=request.getParameter("unitId"+i);
		transp=request.getParameter("transp"+i);
		loc=request.getParameter("loc"+i);
		faulty=request.getParameter("faulty"+i);

	try
	{
		sql5="select DispDate from t_unitmasterhistory where UnitId='"+uid+"' order by DispDate desc ";
		out.print(sql5);
		rs5=stmt2.executeQuery(sql5);
		if(rs5.next())
		{
			dispdate1=rs5.getString("DispDate");
		}
	} catch(Exception e)
	{
	}	
		
		int l=0;
		sql6="select RDate from t_unitreceived where UnitId='"+uid+"' order by RDate desc";
		out.print(sql6);
		rs6=stmt1.executeQuery(sql6);
		if(rs6.next())
		{
			recdate1=rs6.getString("RDate");
		}
		else
		{	
			sql4="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName, UnitId, DC_NO, Transporter, Location,Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+cmnt+"', '"+entby+"', 'Yes',  '"+dt+"', '"+locname+"', 'Partially', '"+entby+"')";
			out.print(sql4);
			l=stmt1.executeUpdate(sql4);
				
		}

		if(dispdate1==null || dispdate1.equals("-") || dispdate1.equals(""))		
		{
			dispdate1=s;
		}
		
		sql7="select (TO_DAYS('"+recdate1+"')-TO_DAYS('"+dispdate1+"'))";	
		out.print(sql7);
		rs7=stmt1.executeQuery(sql7);
		if(rs7.next())
		{
			days1=rs7.getInt(1);
		}

		if(days <= 0 && l<=0)
		{
			sql8="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName, UnitId, DC_NO, Transporter, Location,Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+cmnt+"', '"+entby+"', 'Yes',  '"+dt+"', '"+locname+"', 'Partially', '"+entby+"')";
			//Query for t_sqlquery
   			String abcd2=sql8.replace("'","#");	
   			abcd2=abcd2.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
			out.print(sql8);
			stmt1.executeUpdate(sql8);
		}
		else
		{
	
		}
	}
}

con1.close();
con2.close();

response.sendRedirect("unitssent.jsp?inserted=yes");
return;
		
}catch(Exception e)
{
out.print("Exception"+e);
}
finally
{
	con1.close();
	con2.close();

}

%>


