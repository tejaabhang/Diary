
<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();

ResultSet rs1=null, rs2=null;
String sql1="", sql2="";
String getunid=request.getParameter("unid");
String mobno="-",simno="-", holdby="", recby="",recbycust="",recbytech="",InstType="",swver="";
sql1="select * from t_unitmaster where UnitID='"+getunid+"' ";
rs1=stmt1.executeQuery(sql1);
String userrole=session.getAttribute("userrole").toString();

while(rs1.next())
{
	mobno=rs1.getString("MobNo");
	simno=rs1.getString("SimNo");
	holdby=rs1.getString("HoldBy");
	InstType=rs1.getString("InstType");
	swver=rs1.getString("SwVer");
	if(mobno!=null|| mobno.length()>0)
		out.println(mobno.trim()+"#");
	else
		out.println(mobno+"#");
	
	if(simno!=null|| simno.length()>0)
		out.println(simno.trim()+"#");
	else
		out.println(simno+"#");
	
	if(InstType!=null|| InstType.length()>0)
		out.println(InstType.trim()+"#");
	else
		out.println(InstType+"#");
	//if(userrole.equals("service"))
	//{

	if(holdby!=null|| holdby.length()>0)
		out.println(holdby.trim()+"#");
	else
		out.println(holdby+"#");
	
	recbycust=rs1.getString("RecByCust");
	recbytech=rs1.getString("RecByTech");
	if(recbytech.equals("Yes") || recbycust.equals("Yes"))
	{
	recby="YES";
	out.println(recby+"#");
	}
	else
	{
		recby="NO";
		out.println(recby+"#");
	}

	//}
	out.println(swver+"#");
}
String CodeVersion ="";
String sqlversion="select * from t_ftplastdump where UnitID='"+getunid+"'";
ResultSet rsversion=stmt2.executeQuery(sqlversion);
if(rsversion.next()){
	CodeVersion=rsversion.getString("CodeVersion"); 
	if("AVL_VER_4.9.9_3S".equalsIgnoreCase(CodeVersion)||CodeVersion.equalsIgnoreCase("AVL_VER_4.9.9_3S")){
		String FTP="Yes";
		out.println(FTP+"#");
	}else{
		String FTP="No";
		out.println(FTP+"#");
	}
}
	
//if(userrole.equals("service"))
//{
/*sql2 = "select * from t_unitmasterhistory where UnitID='"+getunid+"' and Status in ('Dispatched','InterDisp' ) order by DispDate Desc limit 1";
rs2=stmt2.executeQuery(sql2);
if(rs2.next())
{
	recbycust=rs2.getString("RecByCust");
	recbytech=rs2.getString("RecByTech");
	if(recbytech.equals("Yes") || recbycust.equals("Yes"))
	{
	recby="YES";
	out.println(recby+"#");
	}
	else
	{
		recby="NO";
		out.println(recby+"#");
	}

} */
//}

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>




