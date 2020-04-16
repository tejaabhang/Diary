<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">


</script>
</head>

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
	
	ResultSet rs1=null;
	String sql1="";
	String flag="true";
	int chkdcntr1=0, chkdcntr=0;
	
	String holdername=request.getParameter("holdername");
	String cntr=request.getParameter("cntr");
	String newcust=request.getParameter("custlist");
	String unittyp=request.getParameter("unittype");
	String holdby=request.getParameter("holdby");	

out.print(unittyp);

	if(unittyp.equals("Faulty"))
	{
		unittyp="Yes";
	}
	else
	{
		unittyp="No";
	}
	
	int cntrint=Integer.parseInt(cntr);
	out.print(cntrint);

	String[] uncntchk = new String[cntrint];

	 for(int k=0; k<cntrint; k++) 
	{
   		uncntchk[k] = request.getParameter("disp"+k );

		if(uncntchk[k]==null)
   		{
     
   		}
   		else
   		{
			chkdcntr1++;
			flag="false";
   		}
	}

	if(flag.equals("true"))
 	{
   		response.sendRedirect("unitdetails.jsp?nounitselected=true&holdername="+holdername+"&holdby="+holdby);
   		return;
 	}
	else
 	{
		String[] unid = new String[cntrint];
		String[] x = new String[cntrint];

		for(int i=0; i<cntrint; i++) 
     		{
          		x[i] = request.getParameter("disp"+i );

          		if(x[i]==null)
         		{
    
      		        }
         		else
         		{
				chkdcntr++;
				unid[i]=request.getParameter("unitid"+i);

				sql1="update t_unitmaster set HoldBy='"+newcust+"', FaultyUnit='"+unittyp+"' where UnitID='"+unid[i]+"' ";
				//Query for t_sqlquery
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");

				stmt1.executeUpdate(sql1);
			}
		}

		con1.close();
		
		response.sendRedirect("unitdetails.jsp?updated=yes&holdername="+holdername+"&holdby="+holdby);
		return;
	}

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	

}
%>
	
