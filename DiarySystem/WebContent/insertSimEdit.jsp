<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection conn;
Statement st1,st2,st3,st4,st5;
String sql="",sql1="",sql2="",sql3="",sql4="",uname="";
String mno="",splan="",scategory="",service_provider="",previous_plan="",previous_category="";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
 function redirect()
 {
	 alert("Record Submitted successfully");
	 window.location="Simtrack.jsp";
 }

</script>
</head>
<body>
<!-- Code starts here -->
<%  mno=request.getParameter("mobileno");
    splan=request.getParameter("simplan");
    scategory=request.getParameter("simcategory");
    uname=session.getAttribute("username").toString();
              try
              {
              	Class.forName(MM_dbConn_DRIVER);
              	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
              	st1=conn.createStatement();
              	st2=conn.createStatement();
              	st3=conn.createStatement();
              	st4=conn.createStatement();
              	st5=conn.createStatement();
              	ResultSet rs7=null;
              	String sql7="";
              	
              	/* sql="update t_simmaster set Plan='"+splan+"',category='"+scategory+"' where Mobno='"+mno+"' ";
              	System.out.println("\n\n update table query????????"+sql);
              	int i=st1.executeUpdate(sql);
              	System.out.println("Table t_simmaster updated successfully");
              	 */
              	sql1="select distinct(Service_provider)as sprovider,Plan,category from t_simmaster where Mobno='"+mno+"' ";
              	System.out.println("\n\n select query >>>>>>"+sql1);
              	ResultSet RS1=st2.executeQuery(sql1);
              	while(RS1.next())
              	{
              		service_provider=RS1.getString("sprovider");
              		previous_plan=RS1.getString("Plan");
              		previous_category=RS1.getString("category");
              	}
              	
              	sql="update t_simmaster set Plan='"+splan+"',category='"+scategory+"' where Mobno='"+mno+"' ";
              	
              	System.out.println("\n\n update table query????????"+sql);
              	
              	int i=st1.executeUpdate(sql);
              	
              	System.out.println("\nTable t_simmaster updated successfully");
              	
              	
              	sql2="insert into t_simedithistory(MobNo,NewPlan,NewCategory,ChangedBy,InsertDate,ServiceProvider,PreviousPlan,PreviousCategory )values('"+mno+"','"+splan+"','"+scategory+"','"+uname+"',current_timestamp,'"+service_provider+"','"+previous_plan+"','"+previous_category+"')";
              	
              	System.out.println("\n\n insert query >>>>>>>"+sql2);
              	
              	int j=st3.executeUpdate(sql2);
              	
              	System.out.println("\n Record Inserted  successfully in table t_simedithistory");
              	

              	 if(i!=0 && j!=0)
              	{
              		out.println("<script> redirect(); </script>");
              	} 
              	
              	
              }
             catch(Exception e)
             {
            	 
              }
            finally
           {
	          conn.close();
	
           }
              
%>

</body>
</html>