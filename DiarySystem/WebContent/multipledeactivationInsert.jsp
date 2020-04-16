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
	String entby=session.getValue("username").toString();
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	System.out.print(cntr);	
	String[] ownname=new String[cntr];
	String[] vehreg = new String[cntr];
	String[] unid = new String[cntr];
	String[] comment = new String[cntr];
	for(int i=0; i<cntr; i++)
	{
		ownname[i]=request.getParameter("owner"+i);
		out.println("ownname--->"+ownname[i]);
		vehreg[i]=request.getParameter("vehreg"+i);
		out.println("vehregno--->"+vehreg[i]);
		unid[i]=request.getParameter("unitid"+i);
		out.println("unitid--->"+unid[i]);
		comment[i]=request.getParameter("cmnt"+i);
		out.println("comment[i]--->"+comment[i]);
		java.util.Date d = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s=formatter.format(d);
		String sql3="select * from db_CustomerComplaints.t_unitmissing where VehNo='"+vehreg[i]+"' and Status='Missing'";
		
		ResultSet rs3=stmt1.executeQuery(sql3);
		//System.out.println(sql3);
		if(rs3.next())
		{
						
		}
		else
		{	
			 String sql1="insert into db_CustomerComplaints.t_unitmissing (Owner, VehNo, UnitId, Comment, EntDateTime) values ('"+ownname[i]+"', '"+vehreg[i]+"', '"+unid[i]+"', '"+comment[i]+"', '"+s+"')";
			//Query for t_sqlquery
				String abcd=sql1.replace("'","#");	
				abcd=abcd.replace(",","$");								
				stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
			stmt1.executeUpdate(sql1);
		//	System.out.println(sql1);
			String sql2="update db_gps.t_vehicledetails set Status='Missing' where VehicleRegNumber='"+vehreg[i]+"' ";
			//Query for t_sqlquery
				String abcd1=sql2.replace("'","#");	
				abcd1=abcd1.replace(",","$");								
				stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
			//out.print(sql2);
			stmt2.executeUpdate(sql2);
			//System.out.println(sql2);
		}

		
	}
	int j=0;
	response.sendRedirect("fullfleet.jsp?transporter="+ownname[j]);
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
