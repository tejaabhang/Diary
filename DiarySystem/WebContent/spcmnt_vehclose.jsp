<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmtinsert=con2.createStatement();
	
	String sql1="";
	int chkdcntr=0;
	String flag="true";

	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydate);
	String user=session.getAttribute("DisplayName").toString();	
	int cntr=Integer.parseInt(request.getParameter("cntr"));
	//System.out.println("cntr-->"+cntr);
	String vehno=request.getParameter("vehno");
	String unitid=request.getParameter("unitid");
	
	String[] chkbox=new String[cntr];
	String[] id = new String[cntr];

	for(int i=0;i<cntr;i++)
	{
		 chkbox[i] = request.getParameter("del"+i );
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
		if(vehno==null)
		{
		
		response.sendRedirect("closetechspcomment.jsp?nocbselected=true");
	        return;
		}
		else
		{
			response.sendRedirect("spcmntabtveh.jsp?nocbselected=true&vehno="+vehno+"&unitid="+unitid);
			return;
		}
	}
	else
	{
		String[] x = new String[cntr];
		String[] unitidvalue = new String[cntr];
		out.print(request.getParameter("id1"));
		for(int k=0;k<cntr;k++)
		{
			x[k] = request.getParameter("del"+k );
			unitidvalue[k] = request.getParameter("id"+k );
			//System.out.println("x[k]-->"+x[k]);
			//System.out.println("unitidvalue[k]-->"+unitidvalue[k]);
			if(x[k]==null)
       			{
    	
     		        }
       			else
       			{
				//chkdcntr++;
				id[k] = request.getParameter("id"+k ); 
	
				sql1="update t_techspecialrep set Closed='Yes', ClosedDateTime='"+s+"',CloseBy='"+user+"' where SrNo='"+unitidvalue[k]+"'";
				//Query for t_sqlquery
				//System.out.println("sql1-->"+sql1);
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

				stmt1.executeUpdate(sql1);
			}
		}
	}	
	
	if(vehno==null)
	{
		
	response.sendRedirect("closetechspcomment.jsp?inserted=yes");
	return;
	}
	else
	{
		response.sendRedirect("spcmntabtveh.jsp?inserted=yes&vehno="+vehno+"&unitid="+unitid);
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

