<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<%
try {
    
          
    Class.forName(MM_dbConn_DRIVER);
	
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
    Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement();
    Statement stmt4=con1.createStatement(),stmt5=con1.createStatement(),stmt6=con1.createStatement();
    Statement stmt7=con1.createStatement(),stmt8=con1.createStatement(),stmt9=con1.createStatement();
    Statement stmt10=con1.createStatement(),stmtinsert=con1.createStatement();
    Statement stmt19=con1.createStatement(), stmt29=con1.createStatement();
    
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null,rs5=null,rs6=null;
    String sql1="",sql2="",myquery=""; 
   
    
    Format fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//Format fmt1 = new SimpleDateFormat("yyyy-MM-dd");
	//SimpleDateFormat sdfIn = new SimpleDateFormat("dd-MMM-yyyy");
	//SimpleDateFormat sdfOut = new SimpleDateFormat("yyyy-MM-dd");
	String insertdate = fmt.format(new java.util.Date());
	
    
    
	String transporter=request.getParameter("transporter");
	String userlimit=request.getParameter("userlimit");
	String old_userlimit=request.getParameter("hid_userlimit");
	String unitlimit=request.getParameter("unitlimit");
	String old_unitlimit=request.getParameter("hid_unitlimit");
	String status=request.getParameter("status");
	String old_status=request.getParameter("hid_status");
	String comment=request.getParameter("comment");	
	String old_comment=request.getParameter("hid_comment");	
	String adminemail=request.getParameter("adminemail");	
	String adminemail_hidden=request.getParameter("adminemail_hidden");	
	String button=request.getParameter("btn");
	String datetime= request.getParameter("datetime");
	String old_user= request.getParameter("enteredby");
	String customertype=request.getParameter("customertype");
        String customercode=request.getParameter("customercode");        
	String operationalstatus=request.getParameter("opstatus");
	String category=request.getParameter("category");
	String current_date_time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a").format(new java.util.Date());
	String username=session.getAttribute("username").toString();

int i=0;
int tcode=0;
Boolean flag=true;
if(button.equalsIgnoreCase("ADD"))
{	
	String Str="select TypeValue from t_transporter where TypeValue='"+transporter+"'";
	rs1=stmt2.executeQuery(Str);
	if(rs1.next())
	{	
		response.sendRedirect("transporterdetails.jsp?transporter=yes");
		return;
	}
else
{
	
	String code="";
	String sql="SELECT MAX(`TCode`) as tcode FROM `t_transporter`";
	rs3=stmt4.executeQuery(sql);
	 if(rs3.next())
	 {
		 code=rs3.getString("tcode");
		 
	 }
	 tcode=Integer.parseInt(code);
	tcode=tcode+1;
	String str1="Insert into t_transporter(TypeValue,TCode,Userlimit,Unitlimit,ActiveStatus,comment,EnteredBy,CustomerType,OperationalStatus,ERPCode,category,AdminEmail) values('"+transporter+"','"+tcode+"','"+userlimit+"','"+unitlimit+"','"+status+"','"+comment+"','"+username+"','"+customertype+"','"+operationalstatus+"','"+customercode+"','"+category+"','"+adminemail+"')";
	//Query for t_sqlquery
		String abcd=str1.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
		System.out.println(">>>>>>>>ADD>>>str1 "+str1);
		i=stmt1.executeUpdate(str1);
		//System.out.println(">>>>>>>>>ADD>>str1@@ "+str1);

        String str19="Insert into t_transporterHistory(TypeValue,TCode,Userlimit,Unitlimit,ActiveStatus,comment,EnteredBy,CustomerType,OperationalStatus,ERPCode,updatedt,category,AdminEmail) values('"+transporter+"','"+tcode+"','"+userlimit+"','"+unitlimit+"','"+status+"','"+comment+"','"+username+"','"+customertype+"','"+operationalstatus+"','"+customercode+"','"+insertdate+"','"+category+"','"+adminemail+"')";
		System.out.println(">>>>>>>>ADD>>>str19 "+str19);
		stmt19.executeUpdate(str19);   	



	 if(i==0)
		 flag=false;
	 else
	 {
		 flag=true;
		 
		 
	 // for history of transporter details
	myquery="INSERT INTO t_oldtransporterdetails (TypeValue,TCode,Userlimit,Unitlimit,ActiveStatus,comment,DateTime,Entered_By,AdminMailID,CustomerType,OperationalStatus,category) VALUES ('"+transporter+"','"+tcode+ "',"+userlimit+","+unitlimit+",'"+status+"','"+comment+"','" + current_date_time+"','"+username+"','"+adminemail+"','"+customertype+"','"+operationalstatus+"','"+category+"')";
	//Query for t_sqlquery
	String abcd1=myquery.replace("'","#");	
	abcd1=abcd1.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
	int k = stmt10.executeUpdate(myquery);	
	//System.out.println(">>>>>>ADD>>>>>myquery@@ "+myquery);
		
	// to fetch the transporter into unit order
	String str="Insert into t_security(Username,FullName,Password,TypeValue,ActiveStatus) values('"+transporter+"','"+transporter+"','"+transporter+"','"+transporter+"','No')";
	//Query for t_sqlquery
	String abcd2=str.replace("'","#");	
	abcd2=abcd2.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
	
	stmt7.executeUpdate(str);
	//System.out.println(">>>>>>ADD>>>>>str@@ "+str);
	 }
		
}
	
	
}
else if(button.equalsIgnoreCase("UPDATE"))
{
	
	String str2="Update t_transporter set Userlimit='"+userlimit+"',Unitlimit='"+unitlimit+"',ActiveStatus='"+status+"',comment='"+comment+"',EnteredBy='"+username+"',AdminEmail='"+adminemail+"',CustomerType='"+customertype+"',OperationalStatus='"+operationalstatus+"',ERPCode='"+customercode+"',category='"+category+"' where TypeValue='"+transporter+"'";
	//Query for t_sqlquery
	String abcd3=str2.replace("'","#");	
	abcd3=abcd3.replace(",","$");								
	stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd3+"')");
	//System.out.println("str2---->"+str2);
	i=stmt3.executeUpdate(str2);	
	//System.out.println(">>>>UPDATE>>>>>>>str222@@ "+str2);
	
  String str29="Insert into t_transporterHistory(TypeValue,TCode,Userlimit,Unitlimit,ActiveStatus,comment,EnteredBy,CustomerType,OperationalStatus,ERPCode,DateTime,updatedt,category) values('"+transporter+"','"+tcode+"','"+userlimit+"','"+unitlimit+"','"+status+"','"+comment+"','"+username+"','"+customertype+"','"+operationalstatus+"','"+customercode+"','"+datetime+"','"+insertdate+"','"+category+"')";
System.out.println(">>>>>>>>ADD>>>str29 "+str29);
stmt29.executeUpdate(str29); 
 

	if(i==0)
	{
		flag=false;
	}
	else
	{
		flag=true;
		//code added by shilpa K
		sql2 = "select Tcode from t_transporter where TypeValue='"+transporter+"'";
		rs5 =stmt8.executeQuery(sql2);
	 	
	 		if(rs5.next())
	 		{ // for history of transporter details
	 			String str3= "INSERT INTO `t_oldtransporterdetails` (TypeValue,TCode,Userlimit,Unitlimit,ActiveStatus,comment,DateTime,Entered_By,New_UserLimit,New_UnitLimit,New_ActiveStatus,New_Comment,New_DateTIme,New_EnteredBy,AdminMailID,NewAdminMailID,CustomerType,OperationalStatus,category) VALUES('"+transporter+"','"+rs5.getString("TCode")+"',"+old_userlimit+","+old_unitlimit+",'"+old_status+"','"+old_comment+"','" + datetime+"','"+old_user+"',"+userlimit+","+unitlimit+",'"+status+"','"+comment+"','"+current_date_time+"','"+username+"','"+adminemail_hidden+"','"+adminemail+"','"+customertype+"','"+operationalstatus+"','"+category+"')";
	 			//Query for t_sqlquery
	 			String abcd4=str3.replace("'","#");	
	 			abcd4=abcd4.replace(",","$");								
	 			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
				int j =stmt9.executeUpdate(str3);
				
	 		}//end of if(rs5.next())
	 	//end of if(!(userlimit.equals(old_userlimit)&&unitlimit.equals(old_unitlimit)&&status.equals(old_status)&&comment.equals(hid_comment)))
	}//end of else
	//end of code added by shilpa K	
}//end of else if(button.equalsIgnoreCase("UPDATE"))
	
	response.sendRedirect("transporterdetails.jsp?insert="+flag);
	return;

}catch(Exception e)
{
e.printStackTrace();
	//	//System.out.println(e);
}
finally
{
con1.close();
}

%>