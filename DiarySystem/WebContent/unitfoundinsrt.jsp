<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%!
Connection con1,con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmtinsert=con1.createStatement();
ResultSet rs1=null;
String sql1="";
int chkdcntr=0;
String flag="true";

int cntr=Integer.parseInt(request.getParameter("cntr"));


String[] chkbox=new String[cntr];
String[] id = new String[cntr];

java.util.Date d = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String s=formatter.format(d);

for(int i=0;i<cntr;i++)
{
	 chkbox[i] = request.getParameter("dis"+i );
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
   response.sendRedirect("showmissingunits.jsp?nounitselected=true");
   return;
}
else
{
	String[] x = new String[cntr];
	//x[0]=request.getParameter("dis0");	
	for(int k=0;k<cntr;k++)
	{
		x[k] = request.getParameter("dis"+k );
			
		if(x[k]==null)
       		{
    
     	        }
       		else
       		{
			chkdcntr++;
			id[k] = request.getParameter("id"+k ); 

			sql1="update t_unitmissing set Status='Found', FoundDateTime='"+s+"' where SrNo='"+id[k]+"'";
			//Query for t_sqlquery
   			String abcd=sql1.replace("'","#");	
   			abcd=abcd.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

			stmt1.executeUpdate(sql1);
		}
	}
}


response.sendRedirect("showmissingunits.jsp?updated=yes");
return;

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();
}

%>

