<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,con1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
	function getstatus()
	{
		var mobno=document.getElementById("mobno").value;
		if(mobno=="")
		{
			alert("Please Enter Mobile No or Sim No to Deactivate");
			return false;
		}
		var len=document.multiplemobileform.src.length;
		var i=0;
		var src="";
		for(i=0;i<len;i++)
		{
			if(document.multiplemobileform.src[i].checked)
			{
				flag=true;
				src=document.multiplemobileform.src[i].value;
			}
		}
		if(src=="")
		{
			alert("Please Select the checkbox");
			return false;
		}
		document.multiplemobileform.action="";
		document.multiplemobileform.submit();
	}
</script>
<script type="text/javascript">
	function validate()
	{
		 var cntr=document.multiplemobileform.cntr.value;
		 var i=1;
		 var flag=false;
		 for(i=1;i<cntr;i++)
		 {
			var chk=document.getElementById("chk"+i).checked;
			var mbno=document.getElementById("mobno"+i).value;
			if(chk==true)
			{
				flag=true;
				var reason=document.getElementById("reason"+i).value;
				if(reason=="")
				{
					alert("Please Enter Reason");
					return false;
				}
			}
			
		}
		if(flag==false)
		{ alert("Please Select atleast one Deactivate Checkbox");
			return false;
		}
		else
		{
	      var ans=confirm("Are you sure to De-activate the Mobile No.");
		  if(ans==true)
			 return true;
		  else
			 return false;
		}
	}

	function cancel()
	{
		document.multiplemobileform.reset();
		document.multiplemobileform.action="";
		document.multiplemobileform.submit();
	}
</script>
</head>
<body>
<% 
String inserted1="";
try{
	
	inserted1=request.getParameter("inserted");
	if(inserted1.equalsIgnoreCase("sucessfull"))
	{
		out.println("<script type=\"text/javascript\">");  
    	out.println("alert('Data Submitted Sucessfully');");
    	out.println("</script>");
     System.out.println("Inserted1"+inserted1);
		
	}
    if(inserted1.equalsIgnoreCase("fail"))
    {
    	out.println("<script type=\"text/javascript\">");  
    	out.println("alert('Please check Status before Submit');");
    	out.println("</script>");
    	System.out.println("Inserted1"+inserted1);
    }

}
catch(Exception e)
{
	
	e.printStackTrace();
}

%>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <p></p>
         <%
String   userrole11=session.getAttribute("userrole").toString();
   %>
   <%
   if(userrole11.equalsIgnoreCase("supertech"))
   {%>
	   <%@ include file="headertech.jsp" %>
	   
   <%}else{
	%>   
	  <%@ include file="header1.jsp" %>
	   
   <%}
   %> 
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=con1.createStatement();
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement(),stmt5=con1.createStatement(),stmt6=con1.createStatement(),st3=con1.createStatement(),st4=con1.createStatement(),st5=con1.createStatement();
	java.util.Date dte = new java.util.Date();
	ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	final String today=formatter.format(dte);
	final String serviceprovider=request.getParameter("Service_provider");	
	final String insertedmob=request.getParameter("insertedmob");
	final String notinserted=request.getParameter("notinserted");
	final String flag=request.getParameter("flag");
%>
<%
	if(notinserted==null || notinserted=="" )
	{	
	}
	else//(serviceprovider!=null && serviceprovider.equals("no"));
	{
%>
   <table border="0" width="750px">
  	  <tr> 
  	  	<td> <div align="center"> <font color="maroon" size="1"> <b> Cannot Deactivate the Mobile No. : <%=notinserted %> as Service Provider is not available </b> </font></div> 
  	  	</td> 
  	  </tr> 
   </table>
<%
	}
%>
<%  
	if(insertedmob==null || insertedmob=="")
	{
		
	}
	else
	{
%>
<table border="0" width="750px">
   <tr> 
   	  <td> <div align="center"> <font color="maroon" size="1"> <b>Successfully Inserted the Mobile No: <%=insertedmob %> </b> </font></div> 
   	  </td> 
   </tr> 
    <%
    if(flag!=null && flag.equalsIgnoreCase("true"))
    {
    %>
    <tr> <td> <div align="center"> <font color="maroon" size="1"> <b>Mail Send to Service Provider ............... </b> </font></div> </td> </tr>
    <%
    } 
    %> 
</table>
<%}
	String Mobileno=request.getParameter("mobno");
	String src=request.getParameter("src");
%>
	<form name="multiplemobileform" method="get" action="addmultiplemobile.jsp" onsubmit="return validate();">
		<table border="1" width="750px">
			<tr>
				<td colspan="4" align="center"><font size="3" color="maroon" >Mobile De-activation </font></td>
			</tr>
			<tr>
				<td><font color="maroon" ><input type="radio" name="src" value="mobile"><b>Mobile No.</b>
					<input type="radio" name="src" value="sim"><B>Sim No.</B>&nbsp; &nbsp; &nbsp;<b>Enter with comma seperation</b></font></td><td>
					<textarea rows="3" cols="30" name="mobno" id="mobno" class="formElement"></textarea>
				</td>
				<td><input type="button" name="btnstatus" value="Status" onclick="getstatus();"></input></td>
			</tr>
		</table>

		<table border="1" width="750px" id="details" >
			<tr>
				<td colspan="6" align="center"><font size="3" color="maroon" >-----------Details--------------- </font></td>
			</tr>
<% 
	if(Mobileno!=null)
	{
	StringTokenizer strtok = new StringTokenizer(Mobileno,",");
	
	int i=1;
	while (strtok.hasMoreTokens())
	{	
		String number=strtok.nextToken().trim();
		 String mobile="", unitid="", serv_provider="",newunit="",vehcode="",simno="",ownername="",TheDate="",TheTime="",lastdata="",ftpdate="";
			
		 Boolean Inflag=true,mobilefalg=true;
		 if(src.equalsIgnoreCase("sim"))
			{
			// ---------------get the service provider---------------------------------
				String str1="Select Service_provider from t_simmaster where Simno Like '%"+number+"%'";
				////System.out.println(str1);
				ResultSet rst1=st3.executeQuery(str1);
				if(rst1.next())
				{
					serv_provider=rst1.getString("Service_provider");
				}
				else
				{
					// if service provider is not available
					Inflag=false;
				
				}
				
				//----------------if service provider is airtel get the mobile no from AirtelMobno col.-------------
				if(serv_provider!=null && serv_provider.equalsIgnoreCase("Airtel"))
				{
				 String str2="select AirtelMobno from t_simmaster where Simno Like '%"+number+"%'";
				//	//System.out.println(str2);
				 ResultSet rst2=st4.executeQuery(str2);
				 if(rst2.next())
				 {
					 mobile=rst2.getString("AirtelMobno");
				 }
				}
				
				if(mobile.equals("")|| mobile.equals("-"))
				{
					//----------------
				
						String str="Select Mobno from t_simmaster where Simno Like'%"+number+"%'";
					//	//System.out.println(str);
						ResultSet rsget=st5.executeQuery(str);
						if(rsget.next())
						{
						//	//System.out.println("inside if");
							mobile=rsget.getString("Mobno");
						}
						else
						{
							Inflag=false;
						
						}
				}
			}
		else
		{
			mobile=number;
		}
		 
		 
		 // if the mobile is already deativated then show the error msg
		 if((!mobile.equals("")) && !(mobile.equals("-"))) 
		 {
		 String que="Select MobNo from t_deactivatednosnew where MobNo='"+mobile+"'";
		 ResultSet rsget1=st5.executeQuery(que);
		 if(rsget1.next())
		 {
			 mobilefalg=false;
		 }
		 }
		 
		 // if sim is available in sim master then Inflag is true
		 // if mobile is not already deativated then mobilefalg is true
		 
		 if(Inflag==true && mobilefalg==true)
		 {
		sql1="select * from t_unitmaster where MobNo='"+mobile+"'";
		//out.println(sql1);
		rs1=stmt1.executeQuery(sql1);
		if(rs1.next())
		{
			unitid=rs1.getString("UnitID");
	
			String sql="select VehicleRegNumber,OwnerName from t_vehicledetails where unitid="+unitid;
			rs2=stmt2.executeQuery(sql);
			if(rs2.next())
			{
				
				 vehcode=rs2.getString("VehicleRegNumber");
				 ownername=rs2.getString("OwnerName");		 
				
			}
			else
			{
				vehcode="N.A";
				ownername="N.A";
			}
		}
		else
		{
			unitid="N.A";
			vehcode="N.A";
			ownername="N.A";
		}
	
		String sql4="SELECT * FROM t_onlinedata WHERE UnitID='"+unitid+"'";
		rs4=stmt4.executeQuery(sql4);
		if(rs4.next())
		{
			TheDate=rs4.getString("TheDate");
			TheTime=rs4.getString("TheTime"); 
			lastdata=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(TheDate+" "+TheTime));
		}
		else
			lastdata="N.A";
		String sql2="";
		if(serv_provider!=null && serv_provider.equalsIgnoreCase("Airtel"))
		{
			
		 sql2="Select Simno,Service_provider from t_simmaster where AirtelMobno='"+mobile+"'";
		}
		else
			 sql2="Select Simno,Service_provider from t_simmaster where Mobno='"+mobile+"'";
		
		rs3=stmt3.executeQuery(sql2);
		if(rs3.next())
		{
			simno=rs3.getString("Simno");
			serv_provider=rs3.getString("Service_provider");
			String str="Select * from  t_ftplastdump where SimNo='"+simno+"'";
			ResultSet rsget=stmt5.executeQuery(str);
			if(rsget.next())
			{
				ftpdate=rsget.getString("StoredDateTime");
				ftpdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ftpdate));
				
			}
			else
				ftpdate="N.A";
			
		}
		else
		{
			simno="N.A";
			serv_provider="N.A";
			ftpdate="N.A";
		}
		 }
		 // if sim is available in sim master then Inflag is true
		 // if mobile is not already deativated then mobilefalg is true
		// if both condition are true then only show the records
		 if(Inflag==true && mobilefalg==true)
		 {
 %>
	 <tr>
		<td><font color="maroon" ><b>Mobile No.</b></font></td>
		<td>
			<input type="text" name="mobno<%=i %>" id="mobno<%=i %>" class="formElement" value="<%=mobile%>" readonly> </input> 
		</td>
		<td><font color="maroon" ><font color="red" size="2">*</font> <b>Enter Reason</b></font></td>
		<td>
			<input type="text" name="reason<%=i %>" id="reason<%=i %>" class="formElement" value=""></input>
		</td>
		<td><font color="maroon" ><font color="red" size="2">*</font> <b>Deactivate</b><input type="checkbox" name="chk<%=i %>" id="chk<%=i %>" class="formElement" ></input></font></td>
		<td><font color="maroon" ><b>Auto Mail</b><input type="checkbox" name="mail<%=i %>" id="mail<%=i %>" value="yes" class="formElement" ></input></font></td>
	</tr>
	<tr>
		<td><font color="maroon" ><b>Unit Id.</b></font></td><td>
			<input type="text" name="unitid<%=i %>" id="unitid<%=i %>" class="formElement" value="<%=unitid%>" readonly> </input> 
		</td>
		<td><font color="maroon" ><b>Vehicle Reg.No</b></font></td>
		<td>
			<input type="text" name="vehregno<%=i %>" id="vehregno<%=i %>" class="formElement" value="<%=vehcode %>" readonly></input>
		</td>
		<td><font color="maroon" ><b>Owner Name</b></font></td>
		<td>
			<input type="text" name="ownername<%=i %>" id="ownername<%=i %>" class="formElement" value="<%=ownername %>" readonly></input>
		</td>
	</tr>
	<tr>
		<td><font color="maroon" ><b>Last Data.</b></font></td>
		<td>
			<input type="text" name="lstdate<%=i %>" id="lstdate<%=i %>" class="formElement" class="formElement" value="<%=lastdata %>" readonly> </input> 
		</td>
		<td><font color="maroon" ><b>Sim Master</b></font></td>
		<td>
			<input type="text" name="sim<%=i %>" id="sim<%=i %>" class="formElement" value="<%=simno %>" readonly></input>
		</td>
		<td><font color="maroon" ><b>FTP Dump.</b></font></td>
		<td>
			<input type="text" name="ftpdump<%=i %>" id="ftpdump<%=i %>" class="formElement" value="<%=ftpdate %>" readonly> </input> 
		</td>
	</tr>
	<tr>
		<td><font color="maroon" ><b>Service Provider</b></font></td>
		<td>
			<input type="text" name="servprov<%=i %>" id="servprov<%=i %>" class="formElement" class="formElement" value="<%=serv_provider %>" readonly> </input> 
		</td>
	</tr>
	<tr>
		<td colspan=6>&nbsp;</td>
	</tr>
<%
	i++;
	}
	else	// if both flag are not true then check what was the actual errror
	{
	if(Inflag==false)		// in sim not present in sim master then sim error
	{
%>
	<tr>
		<td colspan=6 align="center"><font color="maroon">Sim No. = <%=number %> is not available in sim master</font></td>
	</tr>
<%
	}
	else if(mobilefalg==false) 		// in mobile already present in deactivated table then mobile error
	{
%>
	<tr>
		<td colspan=6 align="center"><font color="maroon">Mobile No./Sim No. = <%=number %> is already deactivated</font></td>
	</tr>
<%
}
}
}
%>
	<tr>
		<td><input type="hidden" name="cntr" id="cntr" value="<%=i %>"></input></td>
	</tr>

<%
}
%>
</table>
<table align="center" width="750px" border=0>
	<tr align="center">
		<td>
			<input type="button" name="btncancel" value="Cancel" onclick="cancel();"></input><input type="submit" name="btnsubmit" value="Submit"></input>
		</td>
	</tr>
</table>
</form>
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	try{
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
		con1.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
<!-- code end here --->
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>