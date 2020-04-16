<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
%>
<!--- code start here ------>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(),stmtinsert=con1.createStatement();
	ResultSet rs1=null;
	String sql1="", sql2="", sql3="";
	
	String transporter=request.getParameter("transporter");
	//String newamcdate=request.getParameter("calender");
	//String amcdatetill=request.getParameter("calender1");
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	//int k1=request.getParameter(k);
	String user=session.getAttribute("DisplayName").toString();
	
	out.print(cntr);	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);
	
	for(int i=0; i<cntr; i++)
	{
		String vehcode=request.getParameter("vehcode"+i);
		String newamcdate=request.getParameter("calender1"+i);
		String amcdatetill=request.getParameter("calender2"+i);
		System.out.println("New Amc --->"+newamcdate);
		System.out.println("New Amc Till--->"+amcdatetill);
		
		
		sql1="select * from t_vehicledetails where VehicleCode='"+vehcode+"' ";
		rs1=stmt1.executeQuery(sql1);
		if(rs1.next())
		{
			sql2="insert into db_gps.t_amchistory (Transporter, VehCode, VehNo, OldDate, NewDate, EntBy, WarrantyTill) values ('"+transporter+"', '"+vehcode+"', '"+rs1.getString("VehicleRegNumber")+"','"+rs1.getString("InstalledDate")+"','"+newamcdate+"','"+user+"','"+amcdatetill+"')";
			//Query for t_sqlquery
			
			stmt2.executeUpdate(sql2);
					
   			String abcd=sql2.replace("'","#");	
   			abcd=abcd.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
			
			
			//System.out.println("Insert"+sql2);
			
			/* sql3="update db_gps.t_vehicledetails set InstalledDate='"+newamcdate+"' where VehicleCode='"+vehcode+"'";
			stmt3.executeUpdate(sql3); */
			//System.out.println("Update --->"+sql3);
			
			
		}
	}
	
	response.sendRedirect("fullfleet.jsp?amcdone=yes&transporter="+transporter);
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
</form>
</body>
</html>
