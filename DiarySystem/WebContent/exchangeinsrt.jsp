<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection con1;
%>

<%
try
{
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con1.createStatement();
	ResultSet rs6=null;
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";

	String transname="", vehno="", vehcode="", group="", comment="";
	String otransname="", ovehno="", ogroup="";

	String username=session.getAttribute("username").toString();

	vehcode=request.getParameter("vehcode");
	vehno=request.getParameter("vehno");
	group=request.getParameter("group");
	transname=request.getParameter("trans");
	comment=request.getParameter("spcomment");
	
	
	ovehno=request.getParameter("ovehno");
	ogroup=request.getParameter("ogroup");
	otransname=request.getParameter("otrans");
	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);
	
if(group.equals("None"))
{
    
   sql1="update t_vehicledetails set VehicleRegNumber='"+vehno+"', OwnerName='"+transname+"' where VehicleCode='"+vehcode+"' ";
   //Query for t_sqlquery
	String abcd=sql1.replace("'","#");	
	abcd=abcd.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
    stmt1.executeUpdate(sql1);
  
   sql2="update t_unitreplacement set VehRegNo='"+vehno+"', OwnerName='"+transname+"' where VehCode='"+vehcode+"' ";
   //Query for t_sqlquery
	String abcd1=sql2.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
    stmt1.executeUpdate(sql2);

     
   sql6="delete from t_group where VehCode='"+vehcode+"' ";
   //Query for t_sqlquery
	String abcd2=sql6.replace("'","#");	
	abcd2=abcd2.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
   stmt1.executeUpdate(sql6);

}

else
{
    sql1="update t_vehicledetails set VehicleRegNumber='"+vehno+"', OwnerName='"+transname+"' where VehicleCode='"+vehcode+"' ";
    //Query for t_sqlquery
	String abcd3=sql1.replace("'","#");	
	abcd3=abcd3.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
    stmt1.executeUpdate(sql1);
  
   sql2="update t_unitreplacement set VehRegNo='"+vehno+"', OwnerName='"+transname+"' where VehCode='"+vehcode+"' ";
   //Query for t_sqlquery
	String abcd4=sql2.replace("'","#");	
	abcd4=abcd4.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
    stmt1.executeUpdate(sql2);

    sql6="select * from t_group where VehCode='"+vehcode+"' ";
    rs6=stmt1.executeQuery(sql6);
    if(rs6.next())
    {
      sql7="update t_group set GPName='"+group+"', VehRegNo='"+vehno+"', Transporter='"+transname+"' where VehCode='"+vehcode+"'  ";
      //Query for t_sqlquery
  	String abcd5=sql7.replace("'","#");	
  	abcd5=abcd5.replace(",","$");								
  	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd5+"')");
      stmt1.executeUpdate(sql7);
      
    }
    else
    {
       sql7="insert into t_group (GPName, VehRegNo, transporter, VehCode, SepReport) values('"+group+"', '"+vehno+"', '"+transname+"', '"+vehcode+"', 'Yes') ";
       //Query for t_sqlquery
   	String abcd6=sql7.replace("'","#");	
   	abcd6=abcd6.replace(",","$");								
   	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd6+"')");
       stmt1.executeUpdate(sql7);
       
    }
    
} 

sql9="insert into t_editrecords (EditDate, OldOwner, NewOwner, OldGroup, NewGroup, OldVeh, NewVeh, Comment, Rep) values ('"+s+"', '"+otransname+"', '"+transname+"', '"+ogroup+"', '"+group+"', '"+ovehno+"', '"+vehno+"', '"+comment+"', '"+username+"')";
//Query for t_sqlquery
String abcd7=sql9.replace("'","#");	
abcd7=abcd7.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd7+"')");
stmt1.executeUpdate(sql9);
  
String trans=request.getParameter("trans");

con1.close();
response.sendRedirect("fullfleet.jsp?updated=yes&transporter="+trans);
return;

}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
}
%>
