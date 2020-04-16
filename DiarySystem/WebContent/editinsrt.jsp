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
	Statement stmt1=con1.createStatement(),stmtinsert=con1.createStatement();
	ResultSet rs6=null;
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";

	String vehcode="", fnlowner="",fnlgroup="", fnlvehno="", typechk="", email="", oldveh="", oldowner="", oldgroup="", comment="";

	String username=session.getAttribute("username").toString();

	vehcode=request.getParameter("vehcode");
	fnlowner=request.getParameter("fnlowner");
	fnlvehno=request.getParameter("fnlvehno");
	fnlgroup=request.getParameter("fnlgroup");
	oldveh=request.getParameter("oldveh");
	oldowner=request.getParameter("oldowner"); 
	oldgroup=request.getParameter("oldgroup");
	comment=request.getParameter("comment");
	String soldout=request.getParameter("soldout");
	String fnlsoldout=request.getParameter("fnlsoldout");
	
	 String vehtyp=request.getParameter("vehtyp");
	
	 //System.out.println("vehtyp>>>in INSERT PAGE>>> edit>>>"+vehtyp);
	String  tid=request.getParameter("tid"); 

	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);
	
	//System.out.println("fnlgroup->>>>>>>.@@@@@@  --->"+fnlgroup);
	//System.out.println("fnlowner->>>>>>>.@@@@@@  --->"+fnlowner);

	//System.out.println("vehcode->>>>>>>.@@@@@@  --->"+vehcode);
	
	
	if(fnlowner.equals("None"))
{
	
	// //System.out.println("INSIDE IF LOOP-  --->");
    
  // sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"',SoldOut='"+fnlsoldout+"' where VehicleCode='"+vehcode+"' ";
   //System.out.println("INSIDE IF LOOP-  --->");
   
	 
	if(!(vehtyp.equalsIgnoreCase("-")))
	{
  sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"',SoldOut='"+fnlsoldout+"' ,vehtype ='"+vehtyp+"'  where VehicleCode='"+vehcode+"' ";
	}else{
		  sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"',SoldOut='"+fnlsoldout+"'  where VehicleCode='"+vehcode+"' ";
		
	}
   
   
   
   //Query for t_sqlquery
	////System.out.println(sql1);
 String abcd1=sql1.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
    stmt1.executeUpdate(sql1);
    //System.out.println("sql-1  --->" +  sql1);
  
   sql2="update t_unitreplacement set VehRegNo='"+fnlvehno+"', OwnerName='"+fnlowner+"' where VehCode='"+vehcode+"' ";
 //Query for t_sqlquery
	String abcd2=sql2.replace("'","#");	
	abcd2=abcd2.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
    stmt1.executeUpdate(sql2);
    //System.out.println("sql-1  --->" +  sql2);

     
   sql6="delete from t_group where VehCode='"+vehcode+"' ";
 //Query for t_sqlquery
	String abcd3=sql6.replace("'","#");	
	abcd3=abcd3.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
   stmt1.executeUpdate(sql6);
   //System.out.println("sql-6  --->" +  sql6);

}

else
{
    
	 //System.out.println("ELSE LOOP OF   --->");
	
	//sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"' ,SoldOut='"+fnlsoldout+"' where VehicleCode='"+vehcode+"' ";
  
	
	 if(!(vehtyp.equalsIgnoreCase("-"))){
			
			sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"' ,SoldOut='"+fnlsoldout+"'  ,vehtype ='"+vehtyp+"' where VehicleCode='"+vehcode+"' ";
			 }else{
				 
				 sql1="update t_vehicledetails set VehicleRegNumber='"+fnlvehno+"', OwnerName='"+fnlowner+"' ,SoldOut='"+fnlsoldout+"'  where VehicleCode='"+vehcode+"' "; 
			 }
	
	
	//Query for t_sqlquery
//	//System.out.println(sql1);
  String abcd4=sql1.replace("'","#");	
	abcd4=abcd4.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
    stmt1.executeUpdate(sql1);
    //System.out.println("sql-1  else--->" +  sql1);
  
   sql2="update t_unitreplacement set VehRegNo='"+fnlvehno+"', OwnerName='"+fnlowner+"' where VehCode='"+vehcode+"' ";
 //Query for t_sqlquery
	String abcd5=sql2.replace("'","#");	
	abcd5=abcd5.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd5+"')");
    stmt1.executeUpdate(sql2);
    //System.out.println("sql-2  else--->" +  sql2);

    sql6="select * from t_group where VehCode='"+vehcode+"' ";
    rs6=stmt1.executeQuery(sql6);
    if(rs6.next())
    {
      sql7="update t_group set  VehRegNo='"+fnlowner+"', Transporter='"+fnlvehno+"' where VehCode='"+vehcode+"'  ";
    //Query for t_sqlquery
  	String abcd6=sql7.replace("'","#");	
  	abcd6=abcd6.replace(",","$");								
  	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd6+"')");
      stmt1.executeUpdate(sql7);
      //System.out.println("sql-7 if of t_group else--->" +  sql7);
      
    }
    else
    {

    	if(tid==null || tid.equals("null") || tid.equals("-")){
    	sql7="insert into t_group (VehRegNo, transporter, VehCode, SepReport) values('"+fnlowner+"', '"+fnlvehno+"', '"+vehcode+"', 'Yes') ";
    	
    	}else{
    		
    		
    		sql7="insert into t_group (TicketID,VehRegNo, transporter, VehCode, SepReport) values('"+tid+"','"+fnlowner+"', '"+fnlvehno+"', '"+vehcode+"', 'Yes') ";	
    		
    	}
    	
    	
    	//Query for t_sqlquery
   	String abcd8=sql7.replace("'","#");	
   	abcd8=abcd8.replace(",","$");								
   	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd8+"')");
       stmt1.executeUpdate(sql7);
       //System.out.println("sql-7 ELSE of t_group else--->" +  sql7);
       
    }
    
} 
String sql10="select * from db_gps.t_onlinedata where VehicleCode='"+vehcode+"'"; 
ResultSet rs10=stmt1.executeQuery(sql10);
//System.out.println("sql-10 --->" +  sql10);
if(rs10.next()){
	String sql11="update db_gps.t_onlinedata set VehicleRegNo='"+fnlvehno+"' where  VehicleCode='"+vehcode+"' ";
	stmtinsert.executeUpdate(sql11);
	//System.out.println("sql-11 --->" +  sql11);
}

if(tid==null || tid.equals("null") || tid.equals("-")){
  sql9="insert into t_editrecords (EditDate, OldOwner, NewOwner, OldGroup,  OldVeh, NewVeh, Comment, Rep,OldSoldOut,NewSoldOut) values ('"+s+"', '"+oldowner+"', '"+fnlowner+"', '"+oldgroup+"','"+oldveh+"', '"+fnlvehno+"', '"+comment+"', '"+username+"','"+soldout+"','"+fnlsoldout+"')";
}else{
	sql9="insert into t_editrecords (TicketID,EditDate, OldOwner, NewOwner, OldGroup,  OldVeh, NewVeh, Comment, Rep,OldSoldOut,NewSoldOut) values ('"+tid+"','"+s+"', '"+oldowner+"', '"+fnlowner+"', '"+oldgroup+"','"+oldveh+"', '"+fnlvehno+"', '"+comment+"', '"+username+"','"+soldout+"','"+fnlsoldout+"')";	
	
	
}

//Query for t_sqlquery
////System.out.println(sql9);
String abcd9=sql9.replace("'","#");	
abcd9=abcd9.replace(",","$");								
stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd9+"')");
stmt1.executeUpdate(sql9);
//System.out.println("sql-9 --->" +  sql9);
  
if(tid==null || tid.equals("null") || tid.equals("-")) 
{

}else{
	
	String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Edit Records','"+comment+"','"+username+"','"+vehcode+"','"+fnlvehno+"','"+fnlowner+"') ";
	stmt1.executeUpdate(sqlths);
	//System.out.println(">>>sqlths<<<"+sqlths);	
	
	
}

String trans=request.getParameter("trans");

con1.close();
response.sendRedirect("fullfleet.jsp?updated=yes&transporter="+trans);
return;

}
catch(Exception e)
{
	out.print("Exception --->"+e);
	e.printStackTrace();
}
finally
{
	con1.close();
}
%>
