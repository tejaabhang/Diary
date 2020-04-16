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
	
Statement stmt1=con1.createStatement();
Statement stmtinsert=con1.createStatement();
Statement stmtinsert2=con1.createStatement();
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql8="", sql9="", sql10="";
ResultSet rs2=null, rs4=null;

String ownname="", vehreg="", unid="", instby="", entby="", techname="", comment="", oldunitwith="";
int i1=0, i2=0, i3=0, i4=0;

   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

entby=session.getValue("username").toString();
ownname=request.getParameter("owner");
vehreg=request.getParameter("vehreg");
unid=request.getParameter("unid");
techname=request.getParameter("techname");
comment=request.getParameter("cmnt");
int pos=0;
pos=comment.indexOf("'");
if(pos>0)
{
	comment=comment.replace("'","");
}
String ownerchange=ownname+" "+"del";
String vehregchange=vehreg+" "+"del_"+nwfrmtdte;
/*
String sqldel2="select * from db_gps.t_vehicledetails where VehicleRegNumber='"+vehregchange+"' ";
//System.out.println(sqldel2);
ResultSet rsdel2=stmt1.executeQuery(sqldel2);
if(rsdel2.next()){
 //System.out.println("vehiclereg number is already exist");	
}else{
	vehregchange=vehreg+" "+"del1";
}
 */
String unitholdby="";
if(techname.equals("Customer"))
{
   unitholdby=ownname;
}
else if(techname.equals("Company"))
{
   unitholdby="Transworld"; 
}
else
{
   unitholdby=techname;	
}
int vehcode=0;
 sql4="select VehicleCode from t_vehicledetails where UnitID='"+unid+"' ";

   rs4=stmt1.executeQuery(sql4);
   while(rs4.next())
   {
     vehcode=rs4.getInt("VehicleCode");
   }


sql1="update t_vehicledetails set OwnerName='"+ownerchange+"', MobilePhNo='0', TheFieldFromEmailAddress='-', UnitID='-', Status='Deleted', VehicleRegNumber='"+vehregchange+"' where VehicleRegNumber='"+vehreg+"' ";
//Query for t_sqlquery
//System.out.println(sql1);
	String abcd1=sql1.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
i1=stmt1.executeUpdate(sql1); 
//System.out.println(sql1);
int rid=0;

sql2="select max(RID) from t_unitreplacement";
rs2=stmt1.executeQuery(sql2);
while(rs2.next())
{
  rid=rs2.getInt(1);
}
rid=rid+1;
sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, 103.241.181.36, Comment, EntBy, OldUnitWith, EntDate) values ('"+rid+"', '"+vehcode+"', '"+vehreg+"', '"+ownerchange+"', '"+unid+"', '-', '"+techname+"', 'Del', '"+comment+"', '"+entby+"', '"+unitholdby+"', '"+nwfrmtdte+"')" ;
//Query for t_sqlquery
String abcd2=sql3.replace("'","#");	
abcd2=abcd2.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
out.print(sql3);
i2=stmt1.executeUpdate(sql3);

String sqlgroup="select GPName from db_gps.t_group where transporter='"+vehreg+"'";
ResultSet rsgroup=stmtinsert2.executeQuery(sqlgroup);
//System.out.println("sqlgroup===>"+sqlgroup);
while(rsgroup.next()){
		sql9="update t_group set GPName='"+rsgroup.getString("GPName")+" del', VehRegno='"+ownerchange+"', SepReport='No',Active ='No',transporter='"+vehreg+" del'   where transporter='"+vehreg+"' and GPName='"+rsgroup.getString("GPName")+"' ";
		//Query for t_sqlquery
		//System.out.println(sql9);
		String abcd3=sql9.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
		stmt1.executeUpdate(sql9); 
		
		//System.out.println("sql9===>"+sql9);
		String sqlgrp="insert into db_gps.t_grouphistory (GPName,VehRegno,transporter,VehCode,Status,EntBy,UpdatedDate,InsertedFrom) values ('"+rsgroup.getString("GPName")+"','"+vehreg+"','"+ownname+"','"+vehcode+"','Deleted','"+entby+"','"+formatter.format(d)+"','PermanentRemovalOfVehicle')";
		//System.out.println(sqlgrp);
		stmt1.executeUpdate(sqlgrp);
		String abcd44=sqlgrp.replace("'","#");	
		abcd44=abcd44.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd44+"')");
}

sql5="update t_unitmaster set HoldBy='"+unitholdby+"' where UnitId='"+unid+"' ";
//Query for t_sqlquery
String abcd4=sql5.replace("'","#");	
abcd4=abcd4.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
stmt1.executeUpdate(sql5);
String send="inserted"; 
con1.close();
response.sendRedirect("removeunit.jsp?send="+send);
return;
} catch(Exception e) {out.println(e);}
finally
{
	
}
%>

