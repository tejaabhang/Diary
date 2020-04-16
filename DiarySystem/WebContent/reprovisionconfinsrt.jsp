<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	
	String sql1="";
	int chkdcntr=0;
	String flag="true";

	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);

	int cntr=Integer.parseInt(request.getParameter("cntr"));

	String[] chkbox=new String[cntr];
	String[] id = new String[cntr];
	String[] actprob = new String[cntr];
	
	for(int i=0;i<cntr;i++)
	{
		 chkbox[i] = request.getParameter("cb"+i );
		 if(chkbox[i]==null)
   		{
       		}
   		else
   		{
			chkdcntr++;
			flag="false";
   		} 	
	}

	if(flag.equals("true"))
	{
   		//response.sendRedirect("confreprovbyvendor.jsp?nocbselected=true");
	        //return;

		response.sendRedirect("confirmreprovnos.jsp?nocbselected=true");
		return;
	}
	else
	{
		String[] x = new String[cntr];

		for(int k=0;k<cntr;k++)
		{
			x[k] = request.getParameter("cb"+k );
				
			if(x[k]==null)
       			{
    	
     		        }
			else
       			{
				id[k] = request.getParameter("id"+k ); 
				actprob[k] = request.getParameter("actprob"+k ); 
				
				sql1="update t_reprovisionnos set ReprovConfirmation='Yes', ConfirmDateTime='"+s+"', ActualProb='"+actprob[k]+"' where SrNo='"+id[k]+"'";
				//Query for t_sqlquery
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

				stmt1.executeUpdate(sql1);
			}
		}
		//response.sendRedirect("confreprovbyvendor.jsp?closed=yes");
		//return;

		response.sendRedirect("confirmreprovnos.jsp?closed=yes");
		return;
	
	}	
	

	
	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>

