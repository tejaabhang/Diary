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
ResultSet rs1=null;
String sql1="";
String getownername=request.getParameter("owname");
String permremoval=request.getParameter("permrem");

if(permremoval==null)
{
sql1="select VehicleRegNumber from t_vehicledetails where OwnerName='"+getownername+"' and Status not in ('Removed', 'Deleted') order by VehicleRegNumber asc ";
}
else
{
sql1="select VehicleRegNumber from t_vehicledetails where OwnerName='"+getownername+"' and Status <> 'Deleted' order by VehicleRegNumber asc ";

}

//out.println(sql1);
rs1=stmt1.executeQuery(sql1);
out.println("<select name='vehreg' class='formElement' onChange='AJAXFunc();'> ");
out.print("<option value='Select'>Select</option>");
while(rs1.next())
{
out.println("<option value='"+rs1.getString("VehicleRegNumber")+"'> "+rs1.getString("VehicleRegNumber")+" </option> " );
}
out.println("</select>");
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>





