<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<%! 
Connection con1;
%>

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
<!--- code start here ------>
 <table border="1">
<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(),stmtinsert=con1.createStatement();
	String entby=session.getValue("username").toString();
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	System.out.print(cntr);	
	String[] chkbox=new String[cntr];
	String[] id=new String[cntr];
	String[] owner = new String[cntr];
	String[] vehreg = new String[cntr];
	String[] unitid = new String[cntr];
	String[] oldempname = new String[cntr];
	String[] empcode = new String[cntr];
	String[] empname = new String[cntr];
	String[] empid = new String[cntr];
	for(int i=0; i<cntr; i++)
	{
		java.util.Date d = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s=formatter.format(d);

		id[i] = request.getParameter("id"+i);
		vehreg[i] = request.getParameter("vehreg"+i);
		owner[i] = request.getParameter("owner"+i);
		oldempname[i] = request.getParameter("oldempname"+i);
		empname[i] = request.getParameter("empname"+i);
		empcode[i] = request.getParameter("empcode"+i);
		empid[i] = request.getParameter("empid"+i);
		int vehcode=0;
		String sqlveh="SELECT VehicleCode FROM `t_vehicledetails` where VehicleRegNumber='"+vehreg[i]+"'";
		ResultSet rsveh=stmt1.executeQuery(sqlveh);
		// System.out.println(sqlveh);
		 if(rsveh.next())
		 	{
			 vehcode=rsveh.getInt("VehicleCode");	
		 	}
		
		
		 String sql2="Update t_vehicledetails set Empname ='"+empname[i]+"' ,EmpCode = '"+empcode[i]+"' where VehicleRegNumber = '"+vehreg[i]+"' ";
		//Query for t_sqlquery
			String abcd=sql2.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
		 stmt2.executeUpdate(sql2);
		
		//System.out.println("sql2-->"+sql2);
		 int maxid=0;
		 String TypeValue="";
		 String sql1="select max(UserId) as maxid from t_security";
		// System.out.println(sql1);
		 ResultSet rs1=stmt3.executeQuery(sql1);
		 if(rs1.next())
		 {
		 	maxid=rs1.getInt("maxid");
		 }
		 	maxid=maxid+1;	
		 	String sqluser="select Username,TypeValue from t_security where Username like '"+empid[i]+"'";	
		 	ResultSet rsuser=stmt1.executeQuery(sqluser);
		 //	 System.out.println(sqluser);
		 	if(rsuser.next())
		 	{
		 		TypeValue=rsuser.getString("TypeValue");
		 		
		 		 String sql3="insert into t_group (GPName,VehRegno,transporter,VehCode)values('"+TypeValue+"','"+owner[i]+"','"+vehreg[i]+"','"+vehcode+"')";
		 		//Query for t_sqlquery
		   			String abcd1=sql3.replace("'","#");	
		   			abcd1=abcd1.replace(",","$");								
		   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");

			//	 System.out.println(sql3);
				 stmt1.executeUpdate(sql3);
		 		
		 	}
		 	else
		 	{
		 	String sql="insert into t_security (UserId,UserName,FullName,Password,TypeofUser,TypeValue,CreationDate) values ('"+maxid+"','"+empid[i]+"', '"+owner[i]+"', 'transworld', 'GROUP', '"+empname[i]+"', '"+s+"') ";
		 	//Query for t_sqlquery
	   			String abcd2=sql.replace("'","#");	
	   			abcd2=abcd2.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");

		 	 stmt3.executeUpdate(sql);
		 	
		 	 String sql3="insert into t_group (GPName,VehRegno,transporter,VehCode)values('"+empname[i]+"','"+owner[i]+"','"+vehreg[i]+"','"+vehcode+"')";
		 	//Query for t_sqlquery
	   			String abcd3=sql3.replace("'","#");	
	   			abcd3=abcd3.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");

			// System.out.println(sql3);
			 stmt1.executeUpdate(sql3);
		 	}
		 	
		 	 
		 	
		 		
		 	
		 	
	 %>
	
	<tr align="center"><td><font color="BROWN" size="3"><%out.print("INSERTED SUCCESSFULLY");%></font></td></tr>
	<tr align="center"><td><font color="BROWN" size="3"><%out.print("User Id Has Been Created as:- "+empid[i]);%></font></td></tr>
	
		<%
	}
	%>
	<tr><td><a href="EditEmpName.jsp">Back To FIRST PAGE</a></td></tr>	
	</table>
	<%
	}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
}
%>
</form>
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

