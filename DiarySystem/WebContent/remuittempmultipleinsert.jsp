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
	String sql1="", sql2="", sql3="",sql4="",sql5="";
	String instby="", entby="", oldunitwith="", stat="Removed", stat1="Rem";
	int i1=0, i2=0, i3=0, i4=0;
	java.util.Date d=new java.util.Date();
    String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
	Format formatter=new SimpleDateFormat("yyyy-MM-dd");
	String nwfrmtdte=formatter.format(datefrmdb);
	entby=session.getValue("username").toString();
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	System.out.print(cntr);	
	String[] ownname=new String[cntr];
	String[] vehreg = new String[cntr];
	String[] unid = new String[cntr];
//String unid="",techname="";
	String[] techname = new String[cntr];
	String[] comment = new String[cntr];
	String[] deactiv = new String[cntr];
	for(int i=0; i<cntr; i++)
	{
		
		ownname[i]=request.getParameter("owner"+i);
		out.println("ownname--->"+ownname[i]);
		vehreg[i]=request.getParameter("vehreg"+i);
		out.println("vehregno--->"+vehreg[i]);
		unid[i]=request.getParameter("unid"+i);
		out.println("unitid--->"+unid[i]);
		techname[i]=request.getParameter("techname"+i);
		out.println("techname--->"+techname[i]);
		//olduitwith=request.getParameter("oldunitwith");
		comment[i]=request.getParameter("cmnt"+i);
		out.println("comment[i]--->"+comment[i]);
		//deactiv[i]=request.getParameter("deactasper"+i);
		//out.println("deactiv[i]--->"+deactiv[i]);

		int pos=0;
		pos=comment[i].indexOf("'");
		if(pos>0)
		{
			comment[i]=comment[i].replace("'","");
		}
		String[] ownerchange = new String[cntr];
		String[] vehregchange = new String[cntr];
		ownerchange[i]=ownname[i]+" "+"del";
		vehregchange[i]=vehreg[i]+" "+"del";

		String[] unitholdby=new String[cntr];
		if(techname.equals("Customer"))
		{
		   unitholdby[i]=ownname[i];
		}
		else if(techname.equals("Company"))
		{
		   unitholdby[i]="Transworld"; 
		}
		else
		{
		   unitholdby[i]=techname[i];	
		}

		int vehcode=0;
		 sql4="select VehicleCode from t_vehicledetails where UnitID='"+unid[i]+"' ";
		 out.println("sql4-->"+sql4);
		   ResultSet rs4=stmt1.executeQuery(sql4);
		   while(rs4.next())
		   {
		     vehcode=rs4.getInt("VehicleCode");
		   }
		   

		sql1="update t_vehicledetails set TheFieldFromEmailAddress='-', UnitID='-', Status='"+stat+"' where VehicleRegNumber='"+vehreg[i]+"' and VehicleCode='"+vehcode+"' ";
		//Query for t_sqlquery
		
			String abcd=sql1.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
		i1=stmt1.executeUpdate(sql1); 
		//System.out.println("sql1"+sql1);
		int rid=0;

		sql2="select max(RID) from t_unitreplacement";
		ResultSet rs2=stmt1.executeQuery(sql2);
		while(rs2.next())
		{
		  rid=rs2.getInt(1);
		}
		rid=rid+1;

		sql5="update t_unitmaster set HoldBy='"+unitholdby[i]+"' where UnitId='"+unid[i]+"' ";
		//Query for t_sqlquery
		
			String abcd1=sql5.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
		//out.print(sql5);
		stmt1.executeUpdate(sql5);
		//System.out.println("sql5"+sql5);
		/* Checking whether the request has come from de-activation page or temp removal page */
		try{
		if(!(deactiv==null))
		{
			sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate) values ('"+rid+"', '"+vehcode+"', '"+vehreg[i]+"', '"+ownerchange[i]+"', '"+unid[i]+"', '-', '"+techname[i]+"', '"+stat1+"', '"+comment[i]+"', '"+entby+"', '"+unitholdby[i]+"', '"+nwfrmtdte+"')" ;
			//Query for t_sqlquery
			
				String abcd2=sql3.replace("'","#");	
				abcd2=abcd2.replace(",","$");								
				stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
				//System.out.println("sql3"+sql3);
		}
		else
		{	
			sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate) values ('"+rid+"', '"+vehcode+"', '"+vehreg[i]+"', '"+ownerchange[i]+"', '"+unid[i]+"', '-', '"+techname[i]+"', '"+stat1+"', '"+comment[i]+"', '"+entby+"', '"+unitholdby[i]+"', '"+nwfrmtdte+"')" ;
			//Query for t_sqlquery
		out.println("sql3"+sql3);
				String abcd3=sql3.replace("'","#");	
				abcd3=abcd3.replace(",","$");								
				stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
				
		}
		//out.print(sql3);
		i2=stmt1.executeUpdate(sql3);
		//System.out.println("sql3"+sql3);
		}catch(Exception e)
		{
e.printStackTrace();
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
