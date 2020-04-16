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
	
Statement stmt1=con1.createStatement(),stmtinsert=con1.createStatement();

	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql8="", sql9="", sql10="";
ResultSet rs2=null, rs4=null;

String ownname="", vehreg="", unid="", instby="", entby="", techname="", comment="", oldunitwith="", deactiv="", stat="Removed", stat1="Rem";
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
//oldunitwith=request.getParameter("oldunitwith");
comment=request.getParameter("cmnt");
deactiv=request.getParameter("deactasper");

int pos=0;
pos=comment.indexOf("'");
if(pos>0)
{
	comment=comment.replace("'","");
}

String ownerchange=ownname+" "+"del";
String vehregchange=vehreg+" "+"del";

String unitholdby="";

if(techname.equals("Customer"))
{
   unitholdby=ownname;
}
else if(techname.equals("Company"))
{
   unitholdby="2"; 
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
   
 

    if(!(deactiv==null))
   {
	   stat="DeActivated";
	   stat1="DeActive";
	   
    }
    

sql1="update t_vehicledetails set TheFieldFromEmailAddress='-', UnitID='-', Status='"+stat+"' where VehicleRegNumber='"+vehreg+"' ";
//Query for t_sqlquery
	String abcd=sql1.replace("'","#");	
	abcd=abcd.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
i1=stmt1.executeUpdate(sql1); 

int rid=0;

sql2="select max(RID) from t_unitreplacement";
rs2=stmt1.executeQuery(sql2);
while(rs2.next())
{
  rid=rs2.getInt(1);
}
rid=rid+1;

sql5="update t_unitmaster set HoldBy='"+unitholdby+"' where UnitId='"+unid+"' ";
//Query for t_sqlquery
	String abcd1=sql5.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
//out.print(sql5);
stmt1.executeUpdate(sql5);

/* Checking whether the request has come from de-activation page or temp removal page */
try{
if(!(deactiv==null))
{
	sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate, DeActiveReqAsPer) values ('"+rid+"', '"+vehcode+"', '"+vehreg+"', '"+ownerchange+"', '"+unid+"', '-', '"+techname+"', '"+stat1+"', '"+comment+"', '"+entby+"', '"+unitholdby+"', '"+nwfrmtdte+"', '"+deactiv+"')" ;
	//Query for t_sqlquery
		String abcd2=sql3.replace("'","#");	
		abcd2=abcd2.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
}
else
{	
	sql3="insert into t_unitreplacement (RID, VehCode, VehRegNo, OwnerName, OldUnitID, NewUnitID, InstBy, InstType, Comment, EntBy, OldUnitWith, EntDate) values ('"+rid+"', '"+vehcode+"', '"+vehreg+"', '"+ownerchange+"', '"+unid+"', '-', '"+techname+"', '"+stat1+"', '"+comment+"', '"+entby+"', '"+unitholdby+"', '"+nwfrmtdte+"')" ;
	//Query for t_sqlquery
		String abcd3=sql3.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
}
//out.print(sql3);
i2=stmt1.executeUpdate(sql3);
}catch(Exception e)
{

	if(!(deactiv==null))
	{
		response.sendRedirect("DeactiveReq.jsp?send=inserted");
		return;
	}
	else
	{	
		response.sendRedirect("remuittemp.jsp?send=inserted");
		return;
	}	
	
}





String send="inserted"; 

con1.close();


if(!(deactiv==null))
{
	response.sendRedirect("DeactiveReq.jsp?send="+send);
	return;
}
else
{	
	response.sendRedirect("remuittemp.jsp?send="+send);
	return;
}	

} catch(Exception e) {out.println(e);}

finally
{
	con1.close();
}

%>


