<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>
<body onload="window.opener.location.reload();setTimeout('self.close()',5);"> 
<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmt2=con1.createStatement();
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);
	String user=session.getAttribute("DisplayName").toString();	
	String Srno=request.getParameter("srno");
	String vehno=request.getParameter("vehno");
	String unitid=request.getParameter("unitid");
	String ClosingComment=request.getParameter("closingComments");
	String ClosingExtraComment=request.getParameter("closingExtraComments");
	////System.out.println(Srno);
	////System.out.println(ClosingComment);
	////System.out.println(ClosingExtraComment);
	String sql1="update t_techspecialrep set Closed='Yes', ClosedDateTime='"+s+"',CloseBy='"+user+"',ClosingSpComment='"+ClosingComment+"',ClosingExtra_comment='"+ClosingExtraComment+"' where SrNo in ("+Srno+")";
				//Query for t_sqlquery
				////System.out.println("sql1-->"+sql1);
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmt2.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

				stmt1.executeUpdate(sql1);
	if(unitid.equals("-")){
			
	}else{
				response.sendRedirect("spcmntabtveh.jsp?inserted=yes&vehno="+vehno+"&unitid="+unitid);
	}
		return;
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
	con1.close();
}
%>
</body>
