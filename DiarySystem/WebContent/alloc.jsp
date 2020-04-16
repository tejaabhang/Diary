<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1,con2;
%>

<% 
try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement(),stmtinsert=con2.createStatement();
		ResultSet rs4=null;
		String sql1="", sql2="", sql3="", sql4="";

		String tick="", tech="", cust="", ticklgddte="", vehno="", vehavaildte="", transporter,loc,rep;
		int tickint=0;
		rep=session.getAttribute("username").toString();
		transporter=request.getParameter("transporter");
	 	String cntr=request.getParameter("cntr");
   	int cntrint=Integer.parseInt(cntr);
   	cntrint=cntrint+1;
   	java.util.Date d=new java.util.Date();
   	String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   	Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   	String nwfrmtdte=formatter.format(datefrmdb);
   	for(int i=1;i<cntrint;i++)
   	{
      			tick=request.getParameter("tick"+i);
      			tech=request.getParameter("tech"+i);
      			vehavaildte=request.getParameter("calender"+i);
      			if(!(tech.equals("Select")))
      			{
      					loc=request.getParameter("location"+i);
      					if(!(vehavaildte.equals("")))
         				{
             					cust=request.getParameter("transporter");
             					ticklgddte=request.getParameter("ticklgddte"+i);
             					vehno=request.getParameter("vehno"+i);
             					vehavaildte=request.getParameter("calender"+i);
           						sql4="select * from t_callocation1 where Tno='"+tick+"' ";
          						rs4=stmt2.executeQuery(sql4);
          						if(rs4.next())
          						{
             							sql2="update t_callocation1 set Technicion = '"+tech+"',VehAvailDate='"+vehavaildte+"' where Tno='"+tick+"'";
             							//Query for t_sqlquery
             				   			String abcd=sql2.replace("'","#");	
             				   			abcd=abcd.replace(",","$");								
             				   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
             							stmt3.executeUpdate(sql2); 

             							sql1="update t_complaints1 set VehAvaildate='"+vehavaildte+"',VehAttLoc='"+loc+"',RegBy='"+rep+"' ,Status='Allocated' where Tno='"+tick+"' ";
             							//Query for t_sqlquery
             				   			String abcd1=sql1.replace("'","#");	
             				   			abcd1=abcd1.replace(",","$");								
             				   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
             							stmt1.executeUpdate(sql1); 
             					}
           						else
          						{ 
             							sql1="update t_complaints1 set Status='Allocated',VehAttLoc='"+loc+"', VehAvaildate='"+vehavaildte+"', RegBy='"+rep+"' where Tno='"+tick+"' ";
             							//Query for t_sqlquery
             				   			String abcd2=sql1.replace("'","#");	
             				   			abcd2=abcd2.replace(",","$");								
             				   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
 											stmt1.executeUpdate(sql1);

            							sql2="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, VehRegNo,VehAvailDate) values ('"+tick+"', '"+cust+"', '"+ticklgddte+"', '"+nwfrmtdte+"', '"+tech+"', 'Unsolved', '"+vehno+"','"+vehavaildte+"') ";
            							//Query for t_sqlquery
            				   			String abcd3=sql2.replace("'","#");	
            				   			abcd3=abcd3.replace(",","$");								
            				   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
             							stmt4.executeUpdate(sql2); 
   
         						}
  
							}
							else
							{
									sql4="select * from t_callocation1 where Tno='"+tick+"' ";
          						ResultSet rst4=stmt2.executeQuery(sql4);
          						if(rst4.next())
          						{
											sql1="update t_complaints1 set Status='Allocated',VehAttLoc='"+loc+"', RegBy='"+rep+"' where Tno='"+tick+"' ";
											//Query for t_sqlquery
								   			String abcd4=sql1.replace("'","#");	
								   			abcd4=abcd4.replace(",","$");								
								   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd4+"')");
         								stmt1.executeUpdate(sql1);
         								sql2="update t_callocation1 set Technicion = '"+tech+"' where Tno='"+tick+"'";
         								//Query for t_sqlquery
         					   			String abcd5=sql2.replace("'","#");	
         					   			abcd5=abcd5.replace(",","$");								
         					   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd5+"')");
         								stmt3.executeUpdate(sql2); 
         						}
         						else
         						{
         								sql1="update t_complaints1 set Status='Allocated',VehAttLoc='"+loc+"', RegBy='"+rep+"' where Tno='"+tick+"' ";
         								//Query for t_sqlquery
         					   			String abcd6=sql1.replace("'","#");	
         					   			abcd6=abcd6.replace(",","$");								
         					   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd6+"')");
 											stmt1.executeUpdate(sql1);

            							sql2="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, VehRegNo) values ('"+tick+"', '"+cust+"', '"+ticklgddte+"', '"+nwfrmtdte+"', '"+tech+"', 'Unsolved', '"+vehno+"') ";
            							//Query for t_sqlquery
            				   			String abcd7=sql2.replace("'","#");	
            				   			abcd7=abcd7.replace(",","$");								
            				   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd7+"')");
             							stmt4.executeUpdate(sql2); 
         						}
							} 
					} 		
			}

%>

<% 
  response.sendRedirect("complaintview.jsp?inserted=yes&transporter="+transporter);
  return;
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();
}
%>

