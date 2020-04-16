<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con1;

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

<script language="javascript">




function selectAll()
{
	var cntr=document.receivedform.cntr.value;
	cntr=cntr-1;

	if(document.receivedform.maincb.checked==true)
	{
		for(var j=0;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=true;
		}
	}
	else
	{
		
		for(var j=0;j<=cntr;j++)
		{	
			document.getElementById("cb"+j).checked=false;
		}
	}
}

function checkcomment()
{
	//alert("hi");
	var comment="";
	var flag=false;
	var innerflag=false;
		var cntr=document.receivedform.cntr.value;
		//alert(cntr);
		//cntr=50;
		var i=0;
	
			for(i=0;i<cntr;i++)
			{
				
				if(document.getElementById("cb"+i).checked)
				{
					//alert("inside if true");
					flag=true;
					//alert(flag);
					//alert(document.getElementById("techrid"+i).value);
					/*var unitid=document.getElementById("unitid"+i).value;
					comment=document.getElementById("comment"+i).value;
				//	alert(document.getElementById("comment"+i).value);
					if(comment=="Yes")
					{
						alert("Please close comment for unit: "+unitid);
						return false;
					}*/

					//----------ajax code to  check whether unit comment is close or not------

					
		             	
					//------------------------------finish ajax code------------------------

				
					
				}//if
				
			}//for
	//	alert("outside");
		//	alert(flag);
			/*if(innerflag==true)
			{
				alert("Please Close Comment for Unit: "+unitid);
				return false;
			}*/
	if(flag==false)
	{ alert("Please Select atleast one Checkbox");
		return false;
	}
	else
	{
		var url="cnfrmunitrecinsrt.jsp";
		document.receivedform.action=url;
		document.receivedform.submit();
	}
			
	
}
</script>


</head>

<body>
<div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
         <p></p>
<%@ include file="headerStockadmin.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<form name="receivedform" action="" method="post">

<%
try 
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement();
	Statement stmt2=con1.createStatement();
	Statement stmt3=con1.createStatement();
 
        String sql1="";
        ResultSet rs1=null;
		
	String nocbselected=request.getParameter("nocbselected");
	//System.out.println(nocbselected);
	if(nocbselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr bgcolor="#BDBDBD">
				<td align="center">
					<font color="#2A0A12" size="3"><b>No Check-box was selected. Please select the check-box/es. </b></font>
				</td>
			</tr>
		</table>
<%	}

	String inserted=request.getParameter("inserted");
	String notinserted=request.getParameter("notinserted");
	if(inserted==null)
	{
	}
	else if(inserted.equalsIgnoreCase("true"))
	{ %>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td align="center">
					<font color="#2A0A12" size="2">
						<b>Successfully Inserted </b>
					</font>
				</td>
			</tr>
		</table>
<%	}
	////System.out.println(notinserted.length());
	if(notinserted==null||notinserted.length()==0)
	{
		
	}
	else 
	{%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td align="center">
					<font color="#2A0A12" size="2">
						<b> <blink>Please Close Comments for Unit Id : <%=notinserted %>. Then Receive it. </blink>  </b>
					</font>
				</td>
			</tr>
		</table>
	<%}
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td align="center">
				<font color="#2A0A12" size="3">
					<b>Confirm Units Received. </b>
				</font>
			</td>
		</tr>
	</table>
	<br></br>
<%
	int i=1, j=0;;
	sql1="select * from t_unitreceived where InTransit='Yes' order by RDate asc";
	rs1=stmt1.executeQuery(sql1);
%>
	<table border="1" width="100%" align="center" class="sortable">
		<tr bgcolor="#BDBDBD">
			
			<td> <div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"/> </div> </td>
			<td> <div align="center"> <B> Sr. No</B> </div> </td> 
			<td> <div align="center"> <B> Unit ID</B> </div> </td> 
			<td> <div align="center"> <B> Status of Unit </B> </div> </td>
			<td> <div align="center"> <B> Disp Date</B> </div> </td> 
			<td> <div align="center"> <B> Courier Name </B> </div> </td> 
			<td> <div align="center"> <B> Courier Docket No </B> </div> </td>
			<td> <div align="center"> <B> DC No</B> </div> </td>
			<td> <div align="center"> <B> Transporter</B> </div> </td>
			<td> <div align="center"> <B> Tech Name </B> </div> </td>
			<td> <div align="center"> <B> Location </B> </div> </td>
			<td><div align="center"> <B> Comments</B> </div></td>
			<td><div align="center"> <B> Unit Life</B> </div></td>
			<td><div align="center"> <B> Was in <br>Warranty</B> </div></td>
			 
		</tr>
<%
	while(rs1.next())
	{ %>
		<tr>
			<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"/> </div> </td>
			<td> <%=i%> <input type="hidden" name="id<%=j%>" value="<%=rs1.getString("SrNo")%>" />
			<input type="hidden" name="unitid<%=j%>" id="unitid<%=j%>" value="<%=rs1.getString("UnitId")%>" />
 			</td>
 			<td> <%=rs1.getString("UnitId")%> </td>
 			<td> <%=rs1.getString("Utype")%> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("Rdate")))%> </td>
			<td> <%=rs1.getString("Courier")%> </td>
			<td> <%=rs1.getString("CourierDCNo")%> </td>
			<td> <%=rs1.getString("DC_NO")%> </td>
			<td> <%=rs1.getString("Transporter")%> </td>
			<td> <%=rs1.getString("TechName")%> </td>
			<td> <%=rs1.getString("Lname")%> </td>
			<%  String str="Select * FROM t_techspecialrep where UnitId='"+rs1.getString("UnitId")+"' and Closed='No'";
				ResultSet rst=stmt2.executeQuery(str);
				String comment="";
				if(rst.next())
				{
					comment="Yes";
				%>
			<td> <a href="#"  onClick="window.open ('closeunitcomnt.jsp?unitid=<%=rs1.getString("UnitId")%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="red">Click here to close Comment</font></a></td>
			<%}
			else
			{comment="No";
			%>
			
			<td>N.A</td>

			<%} %><input type="hidden" name="comment<%=j %>" id="comment<%=j %>" value="<%=comment %>"/>
			<%
 		String UnitLife="0",wasWarranty="N.A";
 		String sqllastdisp="select * from db_gps.t_unitmasterhistory where UnitID='"+rs1.getString("UnitId")+"' and Status='Dispatched' order by srno desc limit 1";
 		////System.out.println(sqllastdisp);
 		ResultSet rslastdisp=stmt2.executeQuery(sqllastdisp);
 		////System.out.println(sqllastdisp);
 		if(rslastdisp.next()){
 			String DispDate=rslastdisp.getString("DispDate");
 			String sqlrep="select * from db_gps.t_unitreplacement where OldUnitID='"+rs1.getString("UnitId")+"' and InstDate >='"+DispDate+"' order by InstDate DESC limit 1";
 			ResultSet rsrep=stmt3.executeQuery(sqlrep);
 			if(rsrep.next()){
 				UnitLife=rsrep.getString("UnitLife");
 				wasWarranty=rsrep.getString("WasWarranty");
 			}else{
 				UnitLife="0";
 				wasWarranty="N.A";
 			}
 			if(UnitLife.equals("-")){
 				UnitLife="0";
 			}
 			if(wasWarranty.equals("-")){
 				wasWarranty="N.A";
 			}
 		}
%>	
			<td><%=UnitLife%></td>
			<td><%=wasWarranty%></td>
		</tr>	
<%		i++;
		j++;
	} 
%>		<tr>
			<td colspan="14"> <div align="center"> <input type="button" name="Submit" value="Confirm Receipt" onclick="checkcomment()" class="formElement" /> </div> </td>
		</tr>
	</table>
<input type="hidden" name="cntr" value="<%=j%>" />
<%        
}
catch(Exception e)
{
	out.print("Exception --->"+e);
	e.printStackTrace();
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->
</form>
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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>


</body>
</html>


