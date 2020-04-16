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
String sql1="", sql2="",transporter="",vehiclecode="",instn="",VehicleregNo="-";
String ownername=request.getParameter("transporter");

String gpname=request.getParameter("gpname");
System.out.println(">gpname>>>>"+gpname);

System.out.println(">ownername>>>>"+ownername);
String cntcprsn="-";

if(gpname.length() >3)
{
	
	
	
}else{
	
	gpname="-";
	
}



//System.out.println(">gpname>after>>>"+gpname);

int Userlimit=0,Unitlimit=0;
int i=1;
try{

	
	if(!(gpname.equalsIgnoreCase("-")))
	{
		
		sql1="select distinct(transporter) as VehicleRegNumber  from db_gps.t_group  where GPName='"+gpname+"'";
	}else{
		
		sql1="select distinct(VehicleRegNumber)  as VehicleRegNumber from db_gps.t_vehicledetails  where OwnerName='"+ownername+"'";	
		
	}
	
rs1=stmt1.executeQuery(sql1);

	System.out.println("AJAX GEt VEHICLES==>"+sql1);

	/*
	
	"  <td valign='top'><font  color='#990000' size='2'> *</font></td>  <td valign='top' align='left'>"+
	"<font color='black' size='2' > VehicleList :&nbsp;&nbsp;</font>"+
		" </td>"+
	
		
	
<td align='left'> </td>


"<td align='left'>"+
	*/
	
	
String userrole=session.getAttribute("userrole").toString();
String html="";
 html=html+""+

		
		
		"<option value='-'> - </option>";
while(rs1.next())
{
	//vehiclecode=rs1.getString("VehicleCode");
	VehicleregNo=rs1.getString("VehicleRegNumber");
	//instn= rs1.getString("Instruction");
	////System.out.println(">>>>>>>.");
html=html+
	
	"<option value="+VehicleregNo+" >"+VehicleregNo+"</option>";
	
//	"<input type='hidden' name='vehicleregno' value="+VehicleregNo+" />";
	
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
"";





if(!(gpname.equalsIgnoreCase("-")))
{
	
	
	sql1="select concat(FirstName,' ', LastName) as RecieverName  from db_gps.t_userdetails where username in (select username from db_gps.t_security where typevalue ='"+gpname+"')";
	//sql1="select RecieverName from db_CustomerComplaints.t_recieverinfo where Transporter='"+gpname+"' and ActiveStatus='Yes'";
	
}else{
	
	sql1="select RecieverName as RecieverName from db_CustomerComplaints.t_recieverinfo where Transporter='"+ownername+"' and ActiveStatus='Yes'";
	
}



rs1=stmt1.executeQuery(sql1);

System.out.println("AJAX get Contact Person==QUERy==>"+sql1);

/*

"  <td valign='top'><font  color='#990000' size='2'> *</font></td>  <td valign='top' align='left'>"+
"<font color='black' size='2' > VehicleList :&nbsp;&nbsp;</font>"+
	" </td>"+

	

<td align='left'> </td>


"<td align='left'>"+
*/


//String userrole=session.getAttribute("userrole").toString();

html=html+"#"+

	
	
	"<option value='-'> - </option>";
while(rs1.next())
{
//vehiclecode=rs1.getString("VehicleCode");
cntcprsn=rs1.getString("RecieverName");
//instn= rs1.getString("Instruction");
////System.out.println(">>>>>>>.");
html=html+

"<option value="+cntcprsn+" >"+cntcprsn+"</option>";

//"<input type='hidden' name='vehicleregno' value="+VehicleregNo+" />";

i++;


//if(Buffer=="" && Buffer1=="")
//{
//	Buffer = vehiclecode;
//	Buffer1 =instn;
//}
//else
//{
//	Buffer = Buffer+","+vehiclecode;
//	Buffer1 =Buffer1+","+instn;
//}

}
html=html+
"";




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
