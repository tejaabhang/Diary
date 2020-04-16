<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">

function validate()
{
	var redlight=document.reprovision.redlight.value

	if(document.reprovision.redlight[0].checked==false && document.reprovision.redlight[1].checked==false)
	{
		alert("Please select Red light status");
		return false;
	}
	
	if(document.reprovision.greenlight[0].checked==false && document.reprovision.greenlight[1].checked==false)
	{
		alert("Please select green light status");
		return false;
	}

	if(document.reprovision.ringing[0].checked==false && document.reprovision.ringing[1].checked==false)
	{
		alert("Please select whether it is ringing or not");
		return false;
	}

	if(document.reprovision.sendmail[0].checked==false && document.reprovision.sendmail[1].checked==false)
	{
		alert("Please select whether you want to send mail now or later");
		return false;
	}
	return true;
}

</script>
</head>

<%! 
Connection con1,con2;
%>
<form name="reprovision" action="" method="get" onsubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmtinsert=con2.createStatement();
	ResultSet rs2=null, rs3=null;
	String sql1="", sql2="", sql3="";

String vehcode="", vehno="", unitid="",  simno="", mobno="", transp=""; 
String reprovvehno="", reprovunitid="", reprovsimno="", reprovmobno="", reprovdatetime="";

%>

<input type="hidden" name="sent" value="yes" />

<%
String sent1=request.getParameter("successfullysent");

if(!(sent1==null))
{ %>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" > Successfully sent for Reprovision.</font> </td>
		</tr>

	</table>
<%
} 
else
{ 

	vehcode=request.getParameter("vid");
	vehno=request.getParameter("vehno");
	unitid=request.getParameter("unitid");
	mobno=request.getParameter("simno");
	simno=request.getParameter("mobno");
	transp=request.getParameter("transp");
%> 
<input type="hidden" name="vid" value="<%=vehcode%>" />
<input type="hidden" name="vehno" value="<%=vehno%>" />
<input type="hidden" name="unitid" value="<%=unitid%>" />
<input type="hidden" name="simno" value="<%=mobno%>" />
<input type="hidden" name="mobno" value="<%=simno%>" />
<input type="hidden" name="transp" value="<%=transp%>" /> 
<%

	sql2="select * from t_reprovisionnos where MobileNo='"+mobno+"' and SentForReprov='No' ";
		rs2=stmt1.executeQuery(sql2);
if(rs2.next())
{
			reprovvehno=rs2.getString("VehNo");
			reprovunitid=rs2.getString("UnitId");
			reprovsimno=rs2.getString("SimNo");
			reprovmobno=rs2.getString("MobileNo");
			reprovdatetime=rs2.getString("SendDateTime");
%>
		<table border="0" width="750px"> 
			<tr>
				<td align="center"> <font color="maroon" > This Unit has already been sent for Reprovision. Unit No is <%=reprovunitid%> in Vehicle <%=reprovvehno%> with Sim No. <%=reprovsimno%> and Mobile No <%=reprovmobno%> on <%=new SimpleDateFormat("dd-MMM-yyyy HH:MM:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:MM:ss").parse(reprovdatetime))%> </font>  </td> 
			</tr>
		</table>		
<%
}
else
{
%>
<table border="0" width="750px"> 		
<tr> <td align="center">
	<table border="10" width="350px">
		<tr>
			<td align="center" colspan="2"> <font color="maroon" size="2"> <B> Re-Provision Details of <%=vehno%> for Unit Id <%=unitid%> </B>  </font> </td>
		</tr>
		<tr>
			<td> <div align="center"> <font color="maroon"> Mobile No: </font> </div> </td>
			<td> <div align="left">  <%=mobno%> </div> </td>
		</tr>
		<tr>
			<td> <div align="center">  <font color="maroon"> Sim No: </font> </div> </td>
			<td> <div align="left">  <%=simno%>  </div> </td>
		</tr>
		<tr>
			<td> <div align="center">  <font color="maroon"> Red Light Status: </font> </div> </td>
			<td> <div align="left">  <input type="radio" name="redlight" value="On">On</input>  &nbsp;&nbsp;&nbsp;
				<input type="radio" name="redlight" value="Off">Off</input>
</div> </td>
		</tr>
		<tr>
			<td> <div align="center">  <font color="maroon"> Green Light Status: </font> </div> </td>
			<td> <div align="left">  <input type="radio" name="greenlight" value="Stable">Stable</input>  &nbsp;&nbsp;&nbsp;
				<input type="radio" name="greenlight" value="Blinking">Blinking</input>
</div> </td>
		</tr>
		<tr>
			<td> <div align="center">  <font color="maroon"> Ringing: </font> </div> </td>
			<td> <div align="left">  <input type="radio" name="ringing" value="Yes">Yes</input>  &nbsp;&nbsp;&nbsp;
				<input type="radio" name="ringing" value="No">No</input>
</div> </td>
		</tr>
		<tr>
			<td> <div align="center">  <font color="maroon"> Send Now: </font> </div> </td>
			<td> <div align="left">  <input type="radio" name="sendmail" value="Yes">Yes</input>  &nbsp;&nbsp;&nbsp;
				<input type="radio" name="sendmail" value="No">No</input>
</div> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Send for Re-Provision" class="formElement" /> </td>
		</tr>
		
	</table>
</td> </tr> </table>

<%
	String sent=request.getParameter("sent");
	if(null==sent)
	{
	}
	else
	{
		
		String redlight=request.getParameter("redlight");	
		String greenlight=request.getParameter("greenlight");
		String ringing=request.getParameter("ringing");
		String sendmailnow=request.getParameter("sendmail");	

		java.util.Date tdydte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String s=formatter.format(tdydte);

		
		
			String user=session.getAttribute("DisplayName").toString();

			sql1="insert into t_reprovisionnos (Transporter, VehNo, UnitId, MobileNo, SimNo, RedLight, GreenLight, Ringing, SendDateTime, EntBy) value ('"+transp+"', '"+vehno+"','"+unitid+"','"+mobno+"','"+simno+"','"+redlight+"','"+greenlight+"','"+ringing+"','"+s+"','"+user+"')";
			//Query for t_sqlquery
   			String abcd=sql1.replace("'","#");	
   			abcd=abcd.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
			//out.print(sql1);
			stmt1.executeUpdate(sql1);

			String curid="";
			sql3="select SrNo from t_reprovisionnos where SentForReprov='No' and VehNo='"+vehno+"' and UnitId='"+unitid+"' and MobileNo='"+mobno+"' ";
			rs3=stmt1.executeQuery(sql3);
			if(rs3.next())
			{
				curid=rs3.getString("SrNo");
			}

			if(sendmailnow.equals("Yes"))
			{
				response.sendRedirect("sepmails?mobsend="+mobno+"&id="+curid+"&unit="+unitid);
				return;
			}
			else
			{		
				response.sendRedirect("reprovisionnos.jsp?successfullysent=yes&reprovvehno="+reprovvehno+"&reprovunitid="+reprovunitid+"&reprovsimno="+reprovsimno+"&reprovmobno="+reprovmobno);
				return;
			}
	}
} //close of main 2 else
} //close of main 1 else
%>
<%	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>
	


