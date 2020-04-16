<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>


<%@ include file="header.jsp" %>
<%!
Connection con1;
%>


<%
try { 
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmtinsert=con1.createStatement(),stmt3=con1.createStatement();
   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);
	String entby=session.getValue("username").toString();
	int cntr=Integer.parseInt(request.getParameter("cntr"))-1;
	System.out.print(cntr);	
	String[] ownname=new String[cntr];
	String[] vehreg=new String[cntr];
	String[] unid=new String[cntr];
	String[] techname=new String[cntr];
	String[] comment=new String[cntr];
	String[] deactiv=new String[cntr];
	
	for(int i=0; i<cntr; i++)
	{
		
		

	ownname[i]=request.getParameter("owner"+i);
	out.println(ownname[i]);
	vehreg[i]=request.getParameter("vehreg"+i);
	out.println(vehreg[i]);
	unid[i]=request.getParameter("unid"+i);
	out.println(unid[i]);
	techname[i]=request.getParameter("techname"+i);
	out.println(techname[i]);
	comment[i]=request.getParameter("cmnt"+i);
	out.println(comment[i]);
	deactiv[i]=request.getParameter("deactasper"+i);
	out.println(deactiv[i]);
	int pos=0;
	pos=comment[i].indexOf("'");
	if(pos>0)
	{
		comment[i]=comment[i].replace("'","");
	}

		String[] ownerchange=new String[cntr];
		String[] vehregchange=new String[cntr];
		ownerchange[i]=ownname[i]+" "+"del";
		vehregchange[i]=vehreg[i]+" "+"del";

String[] unitholdby=new String[cntr];

if(techname[i].equals("Customer"))
{
   unitholdby[i]=ownname[i];
}
else if(techname[i].equals("Company"))
{
   unitholdby[i]="Transworld"; 
}
else
{
   unitholdby[i]=techname[i];	
}

int vehcode=0;
 String sql4="select VehicleCode from t_vehicledetails where UnitID='"+unid[i]+"' ";
 ResultSet rs4=stmt1.executeQuery(sql4);
 out.println(sql4);
   while(rs4.next())
   {
     vehcode=rs4.getInt("VehicleCode");
   }
	 String  stat="DeActivated";
	// String  stat1="DeActive";
	 String status="";
		String sql44="select * from t_unitreplacement where VehRegNo='"+vehreg[i]+"' order by rid DESC limit 1";
		System.out.println(sql44);
		ResultSet rs44=stmt3.executeQuery(sql44);
		if(rs44.next()){
			String olduid=rs44.getString("OldUnitID");
			String newuid=rs44.getString("NewUnitID");
			status=rs44.getString("InstType");
			System.out.println(status);
		}
			if(status.equalsIgnoreCase("Rem")){
				
			}else{
				System.out.println(vehreg[i]);
String sql1="update t_vehicledetails set TheFieldFromEmailAddress='-', UnitID='-', Status='"+stat+"' where VehicleRegNumber='"+vehreg[i]+"' ";
//Query for t_sqlquery
	String abcd=sql1.replace("'","#");	
	abcd=abcd.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	int i1=0;
	i1=stmt1.executeUpdate(sql1); 
	out.println(sql1);
	int rid=0;
	String sql2="select max(RID) from t_unitreplacement";
	ResultSet rs2=stmt1.executeQuery(sql2);
	out.println(sql2);
	while(rs2.next())
	{
  		rid=rs2.getInt(1);
	}
		rid=rid+1;
	String sql5="update t_unitmaster set HoldBy='"+unitholdby[i]+"' where UnitId='"+unid[i]+"' ";
//Query for t_sqlquery
out.println(sql5);
	String abcd1=sql5.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
//out.print(sql5);
stmt1.executeUpdate(sql5);

/* Checking whether the request has come from de-activation page or temp removal page */
try{
	String sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate, DeActiveReqAsPer) values ('"+rid+"', '"+vehcode+"', '"+vehreg[i]+"', '"+ownerchange[i]+"', '"+unid[i]+"', '-', '"+techname[i]+"', '"+stat+"', '"+comment[i]+"', '"+entby+"', '"+unitholdby[i]+"', '"+nwfrmtdte+"', '"+deactiv[i]+"')" ;
	//Query for t_sqlquery
	
	String abcd2=sql3.replace("'","#");	
	abcd2=abcd2.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
	//out.print(sql3);
	int i2=0;
	i2=stmt1.executeUpdate(sql3);
	out.println(sql3);
}catch(Exception e)
{e.printStackTrace();}
	}
}
String send="inserted"; 

con1.close();
int j=0;
response.sendRedirect("fullfleet.jsp?transporter="+ownname[j]);
return;


} catch(Exception e) {out.println(e);}

finally
{
	con1.close();
}

%>


