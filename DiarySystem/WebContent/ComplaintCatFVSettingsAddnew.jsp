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
	String CatID = request.getParameter("CategoryID");
	String CatDetails = request.getParameter("CategoryDetails");
	String MaxTime = request.getParameter("MaxTimeInHrs");
	
	//System.out.println("OUTOUTOUT");
	String sno="";
	int s=0;
	
	//System.out.println("CatID"+CatID);
	//System.out.println("CatDetails"+CatDetails);
	//System.out.println("MaxTime"+MaxTime);
	
	try{
		String sql2="select MAX(SrNo) as srno from db_gps.t_complaintscategory ";
		ResultSet rs2=st1.executeQuery(sql2);
		while(rs2.next()){
		sno=rs2.getString("srno");
		}
		}catch(Exception e2){
			//System.out.println("the exception1 is :"+e2);
		}
		
		//System.out.println("the max row id is =====>>"+sno);
		if(sno==null){
			s=0;
		}else{
		 s = Integer.parseInt(sno);
		}
		//s=s+1;
	
	try{
	String sql1="select * from db_gps.t_complaintscategory where CategoryID='"+CatID+"'";
	ResultSet rs=st1.executeQuery(sql1);
	if(rs.next()) {
			//System.out.println("inside if");
			String sql="update db_gps.t_complaintscategory SET CategoryDetails='"+CatDetails+"',MaxTimeInHrs='"+MaxTime+"' where CategoryID='"+CatID+"'";
		 	i=st.executeUpdate(sql);
		 	//System.out.println("the query in if is :=====>>"+sql);
	}else {
			//System.out.println("inside else");
			String sql="insert into db_gps.t_complaintscategory(SrNo,CategoryID,CategoryDetails,MaxTimeInHrs)values('"+ ++s+"','"+CatID+"','"+CatDetails+"','"+MaxTime+"')";
			st.executeUpdate(sql);
			//System.out.println("the query in else is :=====>>"+sql);
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
	response.sendRedirect("ComplaintCatSettingsAddNew.jsp?Msg=1");
}
%>
</body>

</html>