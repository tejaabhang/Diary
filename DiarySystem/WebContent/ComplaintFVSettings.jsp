<%@page import="java.security.acl.Owner"%><%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
	Connection con;
	
	%>
<head>
<script type="text/javascript">

</script>
</head>

<body> 
<%
//System.out.println("======inside the ComplaintFVSettings========");
String valid="-";
String dept=request.getParameter("dept");
String category=request.getParameter("category");
try
{
	int i=0;
	Statement st=null;
	//Statement st1=null;
	try
	{
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st = con.createStatement();
 		//st1 = con.createStatement();
 		
 		
	} catch (Exception e) {
	}
	
	
	
	
	String srno = request.getParameter("srno");	
	//String category = request.getParameter("category");
	//String dept = request.getParameter("dept");
	String limit_1 = request.getParameter("limit_1");
	String limit_2 = request.getParameter("limit_2");
	String limit_3 = request.getParameter("limit_3");
	String email_1 = request.getParameter("email_1");
	String email_2 = request.getParameter("email_2");	
	String email_3 = request.getParameter("email_3");
	
	
	
	//System.out.println("======inside the limit_1========"+limit_1);
	//System.out.println("======inside limit_1========"+limit_2);
	//System.out.println("======inside the limit_1========"+limit_3);
	
     int lmt1=0,lmt2=0,lmt3=0;
     double hrs_cal=0.0,min_cal=0.0,total_min1=0.0,total_min2=0.0,total_min3=0.0;
     
     
     String  tokenlmt1[]=null,tokenlmt2[]=null,tokenlmt3[]=null;
     
     tokenlmt1=limit_1.split(":");
     tokenlmt2=limit_2.split(":");
     tokenlmt3=limit_3.split(":");
     
   
   
     
     
     total_min1=(Double.parseDouble(tokenlmt1[0]) * 60) +Double.parseDouble(tokenlmt1[1]);
     total_min2=(Double.parseDouble(tokenlmt2[0]) * 60) +Double.parseDouble(tokenlmt2[1]);
     total_min3=(Double.parseDouble(tokenlmt3[0]) * 60) +Double.parseDouble(tokenlmt3[1]);
     
     //System.out.println("======total_min1======="+total_min1);
     //System.out.println("======total_min2========"+total_min2);
     //System.out.println("======inside total_min3 ========"+total_min3);
     
     try{  
         
         if((total_min1 < total_min2) && (total_min2 < total_min3))
         {
        	
        	 //System.out.println("**************IF OF VALID ***********==");
        	valid="Yes"; 
        	
        	
        	
        	 
         }else{
        	 //System.out.println("**************ELSEE OF VALID ***********==");
        	 valid="No";
        	 
         }
         
         
       }catch(Exception e22)
       {
    	   valid="No";  
    	   
       }
     
     //System.out.println("======total VALID====*******************************=="+valid);
     
     
     
     
     lmt1=(int)total_min1;
     lmt2=(int)total_min2;
     lmt3=(int)total_min3;
     
     
     //System.out.println("======lmt1======="+lmt1);
     //System.out.println("======lmt2========"+lmt2);
     //System.out.println("======lmt3 ========"+lmt3);
     
     
    // hrs_cal=Double.parseDouble(tokenlmt1[0]);
	//	min_cal=Double.parseDouble(tokenlmt1[1]);
	
	
	
	try{
		
		
	    if(valid.equalsIgnoreCase("Yes"))  
	    {
		String sql="update db_gps.t_ComplaintSettings SET Limit1='"+limit_1+"',Limit2='"+limit_2+"',Limit3='"+limit_3+"',EmailID1='"+email_1+"',EmailID2='"+email_2+"',EmailID3='"+email_3+"',TimeDiffL1='"+lmt1+"',TimeDiffL2='"+lmt2+"',TimeDiffL3='"+lmt3+"' where SrNo='"+srno+"'";
		 i=st.executeUpdate(sql);
		
		 
		 
		 //System.out.println("======sql======="+sql);
		
	    }
	}catch(Exception e1){
			//System.out.println("the exception1 is :"+e1);
		}
		
		//System.out.println("the no of rows updated is=====>>"+i);
	
		
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
finally{
	//con.close();
	response.sendRedirect("ComplaintSettingsEdit.jsp?Msg=1&valid="+valid+"&dept="+dept+"&category="+category);
}
%>
</body>

</html>