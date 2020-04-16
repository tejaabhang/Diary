<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<%!Connection con1, con2;%>

<%
try {
    
	// //System.out.println("in insert page");
    Class.forName(MM_dbConn_DRIVER);
	
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement(),stmt5=con1.createStatement(),stmt6=con1.createStatement(),stmt7=con1.createStatement(),stmtinsert=con1.createStatement();
    
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
    String sql1=""; 
    String result="";
    String dropdown=request.getParameter("dropdown");
    String value=request.getParameter("value");
  // //System.out.println("in insert page");
    String valueChanged=request.getParameter("valueChanged");
   // //System.out.println("in insert page"+valueChanged);
  //  String originalvalue=request.getParameter("originalvalue");
  //  String updateDropDown=request.getParameter("updateDropDown");
    String rid=request.getParameter("rid");
    String type=request.getParameter("type");
  //	//System.out.println(type);
   String index=request.getParameter("index");
  
    if(type!=null && type.equalsIgnoreCase("update"))
    {
    	String mail=request.getParameter("mailid"+index);
    	String que="Update db_CustomerComplaints.t_dropdown set value='"+valueChanged+"' where rowid='"+rid+"'";
    	//Query for t_sqlquery
			String abcd=que.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
    //	//System.out.println(que);
    	int i=stmt2.executeUpdate(que);
    	
    	if(i!=0)
    	{
    		result="Updated";
    	}
    		
    }
    else if(type!=null && type.equalsIgnoreCase("delete"))
    		{
    //	//System.out.println("inside btn");
		String totrid=request.getParameter("totrid");
		StringTokenizer strtok = new StringTokenizer(totrid,",");
		while (strtok.hasMoreTokens())
		{	
			String rowid=strtok.nextToken();
		String que="Delete from db_CustomerComplaints.t_dropdown where rowid='"+rowid+"'";
		//Query for t_sqlquery
			String abcd=que.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
	//	//System.out.println(que);
		int j=stmt2.executeUpdate(que);
		if(j!=0)
		{
			result="Deleted";
		}
		}
    		}
    else
    {
 //  //System.out.println("in else");
    String str1="Insert into db_CustomerComplaints.t_dropdown(dropdown,value) values('"+dropdown+"','"+value+"')";
  //Query for t_sqlquery
		String abcd=str1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
   
    //String str1="Update t_serviceprovidermailID set Mail_Id='"+mailid+"' where ServiceProvider='"+serv_prov+"'";
    int i=stmt1.executeUpdate(str1);
    if(i!=0)
    {
    	result="Saved";
    }
    }
    response.sendRedirect("AddDropDown.jsp?&result="+result);
	return;

}catch(Exception e)
{
	out.println(e);
}
finally
{
	con1.close();
	
}

%>