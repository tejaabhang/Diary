<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,stmtinsert;

%>
<%
try{
	String cname,address,email,phone,mobile,transporter,place,representative,sql;
	cname=request.getParameter("cname");
	address=request.getParameter("address");
	email=request.getParameter("email");
	phone=request.getParameter("phone");
	mobile=request.getParameter("mobile");
	String designation=request.getParameter("designation");
//	//System.out.println("designation"+designation);
	String DepartmentName=request.getParameter("DepartmentName");
//	//System.out.println("DepartmentName"+DepartmentName);
	String radio2=request.getParameter("radio2");
//	//System.out.println("radio2"+radio2);
	transporter=request.getParameter("transporter");
	if(transporter==null)
		transporter=request.getParameter("hiddentransp");
	place=request.getParameter("place");
	representative=session.getAttribute("username").toString();
	out.print(mobile);
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmtinsert=conn1.createStatement();
	sql="insert into t_recieverinfo (RecieverName,Address,Email,Phone,Mobile,Transporter,PlaceName,Representative,ActiveStatus,designation,department) values ('"+cname+"','"+address+"','"+email+"','"+phone+"','"+mobile+"','"+transporter+"','"+place+"','"+representative+"','"+radio2+"','"+designation+"','"+DepartmentName+"')";
	//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

	out.print(sql);
	int i=st.executeUpdate(sql);
	if(i>0)
	{
		response.sendRedirect("addcontact.jsp?err=no");
	}
	else
	{
		response.sendRedirect("addcontact.jsp?err=yes");
	}

}catch(Exception e)
{
	out.println("Exception----> "+e);
}
finally
{
	conn.close();
	conn1.close();
}

%>
