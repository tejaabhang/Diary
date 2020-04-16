<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1,con2;
%>

<% 
try {
	Class.forName(MM_dbConn_DRIVER);
	con1= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement(),stmtinsert=con2.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";
ResultSet rs2=null, rs3=null, rs4=null, rs5=null, rs8=null, rs9=null;

String trans="", veh="", comptyp="", probsnc="", probdec="", attadd="", vehavldte="", tdydate="";
String location="", tech="";
String rep=session.getValue("username").toString();
int tno=0, cntloc=0;


java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();


   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

trans=request.getParameter("translist"); 
veh=request.getParameter("vehlist");
comptyp=request.getParameter("comptyp"); 
probsnc=request.getParameter("calender"); 
probdec=request.getParameter("probdesc"); 
attadd=request.getParameter("attadd"); 
vehavldte=request.getParameter("calender1"); 
out.print(veh);

sql8="select * from t_complaints1 where VehicleNo='"+veh+"' and Result='Unsolved' ";
out.print(sql8);
rs8=stmt1.executeQuery(sql8);
if(rs8.next())
{
  response.sendRedirect("add_comp.jsp?alrdyinsrtd=yes");
  return;

}
else
{
   sql1="insert into t_complaints1 (TdyDate, Customer, VehicleNo, Complaint, Status, Regby, Result, CDescription, VehAttLoc, VehAvailDate) values('"+nwfrmtdte+"', '"+trans+"', '"+veh+"', '"+comptyp+"', 'UnAllocated', '"+rep+"', 'Unsolved', '"+probdec+"', '"+attadd+"', '"+vehavldte+"')";
 //Query for t_sqlquery
		String abcd=sql1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
   stmt1.executeUpdate(sql1);

   sql2="select max(Tno) from t_complaints1 ";
   rs2=stmt1.executeQuery(sql2);
   if(rs2.next())
   {
     tno=rs2.getInt("max(Tno)");
   }

      tdydate=nwfrmtdte;

     cntloc=cntloc+1;
     location=attadd;
  

   if(cntloc > 1)
   {
   }
   else
   {  
      sql4="select * from t_techlist where Location ='"+location+"' ";
      rs4=stmt4.executeQuery(sql4);
      if(rs4.next())
      {
        tech=rs4.getString("TechName");
      }

      sql5="select * from t_callocation1 where Tno='"+tno+"' ";
      rs5=stmt2.executeQuery(sql5);
      if(rs5.next()) 
      {
      	sql7="update t_complaints1 set Status='Allocated' where Tno='"+tno+"' ";
      //Query for t_sqlquery
			String abcd1=sql7.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
        stmt4.executeUpdate(sql7);
      }
      else
      {
         sql6="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, VehRegNo) values ('"+tno+"', '"+trans+"', '"+tdydate+"', '"+nwfrmtdte+"', '"+tech+"', 'Unsolved', '"+veh+"') ";
       //Query for t_sqlquery
			String abcd2=sql6.replace("'","#");	
			abcd2=abcd2.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");

        stmt3.executeUpdate(sql6);
  
        sql7="update t_complaints1 set Status='Allocated' where Tno='"+tno+"' ";
      //Query for t_sqlquery
			String abcd3=sql7.replace("'","#");	
			abcd3=abcd3.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");

        stmt4.executeUpdate(sql7);
      }
	
   } 
}

  


response.sendRedirect("add_comp.jsp?inserted=yes&Tno="+tno);
return;

} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();

}
%>
