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
String courier=request.getParameter("courierlist");
String uid=request.getParameter("unitId");
String transp=request.getParameter("transp");
String dcno=request.getParameter("dcno");
String techname=request.getParameter("techname");
String locname=request.getParameter("locname");
out.println(locname);
String tp=request.getParameter("radio2");
out.println(tp);
String loc=request.getParameter("loc");
String faulty="";
String unittype=request.getParameter("unittype");
String pickupdate=request.getParameter("Calender1");
String cmnt=request.getParameter("rsndelay");
String refno=request.getParameter("refno");
String comment=request.getParameter("comment");
String courierdcno=request.getParameter("courierdcno");



if(tp.equalsIgnoreCase("Defective")||"Defective".equalsIgnoreCase(tp))
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
int pos1=0;
pos1=comment.indexOf("'");
if(pos>0)
{
	comment=comment.replace("'","");
}
String entby=session.getValue("username").toString();
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
stmt1=con1.createStatement();
stmt2=con2.createStatement();
stmtinsert=con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs5=null, rs6=null, rs7=null;
int days=0, days1=0;
String cntr=request.getParameter("cntr1");
int cntrint=Integer.parseInt(cntr);
	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
	String dispdate="", recdate="";
	for(int i=0; i<cntrint; i++)
	{
		String 	dispdate1="", recdate1="";
		uid=request.getParameter("UnitID"+i);
		out.println(uid);
		transp=request.getParameter("transp"+i);
		out.println(uid);
		loc=request.getParameter("loc"+i);
		

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
			sql4="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName, UnitId, DC_NO, Transporter, Location,Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy,pickupdate,onAccount,refno,rsnfordelay) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+comment+"', '"+entby+"', 'Yes',  '"+dt+"', '"+locname+"', 'Partially', '"+entby+"','"+pickupdate+"','"+unittype+"','"+refno+"','"+cmnt+"')";
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
			sql8="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Utype, Courier, CourierDCNo, TechName, UnitId, DC_NO, Transporter, Location,Faulty, Comment, EntBy, InTransit, ActualRecDate, Lname, Rcevd, BookedBy,pickupdate,onAccount,refno,rsnfordelay) values ('"+dt+"', '"+tm+"', 'Technician', '"+tp+"', '"+courier+"', '"+courierdcno+"', '"+techname+"', '"+uid+"', '"+dcno+"', '"+transp+"', '"+loc+"', '"+faulty+"', '"+comment+"', '"+entby+"', 'Yes',  '"+dt+"', '"+locname+"', 'Partially', '"+entby+"','"+pickupdate+"','"+unittype+"','"+refno+"','"+cmnt+"')";
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


con1.close();
con2.close();

response.sendRedirect("unitTransferToTechnician.jsp?inserted=yes");
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


