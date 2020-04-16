<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
    <%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
	Connection con;
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="sorttable.js" type="text/javascript"></script>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/view.css" media="all" />
<script type="text/javascript" src="css/chrome.js"></script>

</head>
<body>
<%
//System.out.println("************came to ComplaintFVmailadder**************");
			String compdatetime="";
			String mailfrom="";
			String subject="";
			String body="";
			String attach="";
			String srno="";
			int complaintID=0;
			String comID="";

			Statement st=null;
			Statement st1=null;
			Statement st2=null;
			Statement st3=null;
			
			srno=request.getParameter("sr");
			compdatetime=request.getParameter("compdatetime");
			mailfrom=request.getParameter("mailfrom");
			subject=request.getParameter("subject");
			body=request.getParameter("body");
			attach=request.getParameter("attach");

		//System.out.println("The srno  is :"+srno);
		//System.out.println("The complaint date time is :"+compdatetime);
		//System.out.println("The mailfrom is :"+mailfrom);
		//System.out.println("The subject is :"+subject);
		//System.out.println("The body is :"+body);
		//System.out.println("The attach is :"+attach);

			try
			{
					con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			    	st=con.createStatement();
					st1= con.createStatement();
					st2= con.createStatement();
					st3= con.createStatement();
			} catch (Exception e) {
			}
			
			
			
			try{
		    	  
		    	  String sql = "insert into db_gps.t_ComplaintDetail(ReportName,Description,EntBy,EmailID,FileName,ComplaintDateTime,Status,Website,PageName,EscalatedDept) "+
					" values('-','"+body+"','"+mailfrom+"','avlsupport@mobile-eye.in','"+attach+"','"+compdatetime+"','Pending','Diary','Email Complaint','Service')";	
		    	  st.executeUpdate(sql);
		    	  //System.out.println("The query is  :"+sql);
		     
		      }catch(Exception e){
		    	  //System.out.println("The exception in data insertion is :"+e);
		      }     
		      		//System.out.println("the complaint has been registered");
		      		
		      		try{ 
		      			String Q ="select max(ComplaintID) as ak from db_gps.t_ComplaintDetail";
						//System.out.println(">>>>>>>>>"+Q);
						ResultSet rss=st3.executeQuery(Q);
						if(rss.next())
						{
							comID = rss.getString("ak");
							////System.out.println("\n\n complaintID-->>"+complaintID);
						}
						//System.out.println("\n\n Complaint ID-->>"+comID);
						
					    }catch(Exception e3){
					    	  //System.out.println("The exception in data insertion is :"+e3);
					 }     
					    //System.out.println("the complaint has been registered");
      		
		      		
		      		
		     try{
				    	  
				   String sql2 = "insert into db_gps.t_ComplaintDetailHistory(ComplaintID,ReportName,Description,EntBy,EmailID,FileName,ComplaintDateTime,Status,Website,PageName,EscalatedDept) "+
					" values('"+comID+"','-','"+body+"','"+mailfrom+"','avlsupport@mobile-eye.in','"+attach+"','"+compdatetime+"','Pending','Diary','Email Complaint','Service')";	
				    	  st2.executeUpdate(sql2);
				    	  //System.out.println("The query is  :"+sql2);
				     
				}catch(Exception e2){
				    	  //System.out.println("The exception in data insertion is :"+e2);
				 }     
				    //System.out.println("the complaint has been registered");
				    
				    		      		
		      		
		      try{
		      		String sql1="update db_gps.t_complaintregistertable set  Status='Registered' where RID ='"+srno+"' ";
		      		//System.out.println("@@@@@@@@@@@@>>>>>>>>>>>>>:"+sql1);
		      		int i=st1.executeUpdate(sql1);		
			
		      }catch(Exception e1){
		    	  //System.out.println("The exception in data insertion1 is :"+e1);
		      }     
		      		//System.out.println("the status has been updated");
%>
<div id="form_container" style="width:70%; ">
	
		<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a></a></div></td>
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>
		</table></h1>
		<br />
<ul>
<center><b>Your Complaint has been registered successfully. your complaint ID is <%= comID%></b></center>
<center><b>Please <a href="ComplaintMailAdder.jsp">click here</a>  to go previous page.</b></center>
</ul><br/>
</div>
</body>
</html>