<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
	//System.out.println(">>>>");
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();
String Buffer="",Buffer1="";
ResultSet rs1=null, rs2=null;
String sql1="", sql2="",transporter="",vehiclecode="",instn="",VehicleregNo="";
String ownername=request.getParameter("transporter");
//System.out.println(">>>>>"+ownername);
int Userlimit=0,Unitlimit=0;
int i=1;
try{
sql1="select VehicleCode,Instruction,VehicleRegNumber from db_gps.t_vehicledetails  where OwnerName='"+ownername+"'";
rs1=stmt1.executeQuery(sql1);

	//System.out.println(sql1);

String userrole=session.getAttribute("userrole").toString();
String html="Add Instruction for " +ownername;
 html=html+"#<table border='0'  align='center' class='sortable'  id='txv' style='width: 43em;'>"+
"<tr   >"+
"<td><div align= 'center' ><b>Sr.No.</b></div></td>"+
"<td><div align= 'center' ><b> VehicleregNo </b></div></td>"+

"<td> <div align= 'center' > <b>Instruction </b></div></td>"+
"<td><div align='center' > <b><b><input type=checkbox id='fst' onclick='checkbox();' name='' value='' /> <br /> </b></div></td>"+
"</tr>";
while(rs1.next())
{
	vehiclecode=rs1.getString("VehicleCode");
	VehicleregNo=rs1.getString("VehicleRegNumber");
	instn= rs1.getString("Instruction");
	////System.out.println(">>>>>>>.");
html=html+"<tr>"+
	"<td><div align='right' >  "+i+"</div></td>"+
	"<td><div align= 'left'> "+VehicleregNo+"</div></td>"+
	
	"<td><div align='left' >"+instn+"</div></td>"+
	"<td><div align= 'center' >  <input type='checkbox' name='chkbx' id='ab"+i+"'     type='checkbox'   value='"+vehiclecode+"' onclick = 'mychkbx()' /> <br /></div></td>"+
	"</tr>";
	
	i++;
	
	
//	if(Buffer=="" && Buffer1=="")
//	{
//		Buffer = vehiclecode;
	//	Buffer1 =instn;
//	}
//	else
//	{
//		Buffer = Buffer+","+vehiclecode;
//		Buffer1 =Buffer1+","+instn;
//	}
	
}
html=html+
"</table>";


//System.out.println(html);
out.print(html);
}catch(Exception e) {
	out.println(e);
}
////System.out.println(Buffer+"#"+Buffer1);
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>
