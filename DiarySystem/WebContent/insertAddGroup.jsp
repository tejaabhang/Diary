<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
</head>
<body>
   <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <p></p>
         <%@ include file="header1.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
   <table border="0">
     <%
try
{ 
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//out.print("in insert page");
	Statement stmt=con2.createStatement(),stmt1=con2.createStatement(), stmt2=con2.createStatement(),stmtinsert=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql="", sql1="", sql2="", sql3="";
	String tm="";
	int vcode=0;
	int vcode1;

	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);
	//out.print("date"+sdt);
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	out.print(cntr);	
	String[] OwnerName=new String[cntr];
	String[] vehcles = new String[cntr];
	String[] grp = new String[cntr];
	
	for(int i=0; i<cntr; i++)
	{
		OwnerName[i]=request.getParameter("owner"+i).trim();
		//out.print(OwnerName[i]);	
	    vehcles[i]=request.getParameter("vehcles"+i).trim();
	    //out.print(vehcles[i]);	
	 	grp[i]=request.getParameter("gadd"+i).trim();
	 	//out.print(grp[i]);	
		 
	 sql="select VehicleCode from t_vehicledetails where VehicleRegNumber like '%"+vehcles[i]+"%'";
	 //out.println(sql);
	 rs1=stmt.executeQuery(sql);
	
	 if(rs1.next())
	 {
		vcode=rs1.getInt("VehicleCode");
		
	 }
	 
	 //vcode=Integer.parseInt("vcode1");
		
	 sql1="select * from t_group where GPName='"+grp[i]+"' and VehCode="+vcode+"";
	 rs2=stmt1.executeQuery(sql1);
	 //out.println(sql1);
	 if(rs2.next())
	 {
		 
	 }
	 else
	 {
		 sql2="insert into t_group (GPName,VehRegno,transporter,VehCode,SepReport,Active,LastTripDate)values('"+grp[i]+"','"+OwnerName[i]+"','"+vehcles[i]+"',"+vcode+",'Yes','Yes','"+sdt+"')";
		//Query for t_sqlquery
			String abcd=sql2.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
		
		  stmt2.executeUpdate(sql2);
		 // out.println(sql2);
	 }
	
   //  response.sendRedirect("vehiclegroupentry.jsp?radio1=add");

     %>
	
	<tr align="center"><td><font color="BROWN" size="5"><%out.print("INSERTED SUCCESSFULLY");%></font></td></tr>
	
	 <%
	} 	
	%><td><a href="vehiclegroupentry.jsp">Back To FIRST PAGE</a></td>	
	</table><%
}
catch(Exception e)
{
	out.print("Exception --->"+e);e.printStackTrace();
}
finally
{
	con1.close();
	con2.close();
	
}
%>

<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</body>
</html>
