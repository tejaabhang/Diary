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
function closeAllchildren()
{
	 window.opener=self;
	 window.close(); 
} 
</script>
</head>

<body> 
<%
//System.out.println("sachin sachin");
//System.out.println("======Ashutosh bhardwaj========");
String valid="-";


String limit_1 = request.getParameter("limit_1");
String limit_2 = request.getParameter("limit_2");
String limit_3 = request.getParameter("limit_3");
String email_1 = request.getParameter("email_1");
String email_2 = request.getParameter("email_2");	
String email_3 = request.getParameter("email_3");

try
{
	int i=0;
	Statement st=null;
	Statement st1=null;
	try
	{
		//System.out.println("In connection");
		con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		st = con.createStatement();
 		st1 = con.createStatement();
 		
 		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//System.out.println("INININI");
	String category = request.getParameter("cat");
	String dept = request.getParameter("dept");
	
	
	//System.out.println("OUTOUTOUT");
	
	//System.out.println("category"+category);
	//System.out.println("dept"+dept);
	//System.out.println("limit_1"+limit_1);
	//System.out.println("limit_2"+limit_2);
	//System.out.println("limit_3"+limit_3);
	//System.out.println("email_1"+email_1);
	//System.out.println("email_2"+email_2);
	//System.out.println("email_3"+email_3);
	
	
	
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
	
	try{
	
		
		
		  if(valid.equalsIgnoreCase("Yes"))  
		    {
		String sql1="select * from db_gps.t_ComplaintSettings where Category='"+category+"' ";
	ResultSet rs=st1.executeQuery(sql1);
	if(rs.next()) {
			//System.out.println("inside if");
			String sql="update db_gps.t_ComplaintSettings SET Limit1='"+limit_1+"',Limit2='"+limit_2+"',Limit3='"+limit_3+"',EmailID1='"+email_1+"',EmailID2='"+email_2+"',EmailID3='"+email_3+"' ,TimeDiffL1='"+lmt1+"',TimeDiffL2='"+lmt2+"',TimeDiffL3='"+lmt3+"' where Category='"+category+"' AND dept='"+dept+"' ";
		 	i=st.executeUpdate(sql);
		 	//System.out.println("the query in if is :=====>>"+sql);
	}else {
			//System.out.println("inside else");
			String sql="insert into db_gps.t_ComplaintSettings(Category,Limit1,Limit2,Limit3,EmailID1,EmailID2,EmailID3,dept,TimeDiffL1,TimeDiffL2,TimeDiffL3)values('"+category+"','"+limit_1+"','"+limit_2+"','"+limit_3+"','"+email_1+"','"+email_2+"','"+email_3+"','"+dept+"','"+lmt1+"','"+lmt2+"' ,'"+lmt3+"' )";
			st.executeUpdate(sql);
			//System.out.println("the query in else is :=====>>"+sql);
	}
	
		    }
	
	}catch(Exception e5){
		//System.out.println("Exception Sms  DAta Insert=====>>"+e5);
	}
	//response.sendRedirect("ComplaintSettings.jsp");
}
catch(Exception e)
{
	//System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
finally{
	//con.close();
	response.sendRedirect("ComplaintSettingsAddNew.jsp?Msg=1&valid="+valid+"&limit_1="+limit_1+"&limit_2="+limit_2+"&limit_3="+limit_3+"&email_1="+email_1+"&email_2="+email_2+"&email_3="+email_3);
}
%>
</body>

</html>