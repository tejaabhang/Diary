<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st, stmtsp1,stmtsp11,stmtsp111,stmt1,stmt2,stmtsp, st1,st23, st2, st3,st4,st5,st6, st9, st11, st01, st12,stamc,stamc1 ,stwar1,stwar2,stwar3,stwar4;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8;
String transporter,InstalledPlace,InstPlace="N.A.",today,Svehlist,username,simno="-",mobno="-",vehiclecode,typeunit, tpunit;
String instdate,warranty, expdate,simcomp="-",peripherals="-",Empname="",Instruction="",psno="",pcbno="",boxno="",batteryno="",WMSN="NA",CodeVersion="NA",UnitType="NA",battrystatus ="NA",battrystatustime="NA";
String sqlamc,sqlamc1,sqlamc2,sqlamc3,sqlamc4,sqlbt;

%>

 
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css"/>
	
	<script language="javascript">
	function addgroup()
	{
		//alert("in add group function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="AddEditGroup.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function deletegroup()
	{
		//alert("in delete group function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="DeleteGroup.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function addeditemp()
	{
		//alert("in add edit employee function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
	//	alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="AddEditMultipleEmp.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    		//	alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function unitmissing()
	{
		//alert("in unitmissing function");
	
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="unitmissingmultiple.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    			//alert("unitid"+document.getElementById("unitid"+j).value);
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value+"&unitid"+i+"="+document.getElementById("unitid"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	
	function deactive()
	{
		//alert("in deactivation function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="multipleDeactivation.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	function permremoval()
	{
		//alert("in perm removal function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="perremoval.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}

	function tempremoval()
	{
		//alert("in temp removal function");
		var transporter=document.fullfleet.transporter.value;
		//alert(transporter);
		var cntr=document.fullfleet.cntr.value;
		//alert(cntr);
		//alert("hi"+cntr);
		cntr=cntr-1;
		//alert("hi"+cntr);
		var url="remuittempmultiple.jsp?transporter="+transporter;
	      	var i=0;
	   	for(var j=0;j<cntr;j++)
	    	{	//alert("j loop");
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
					 i++;
					// alert("map"+url);
	    		}		
	    	}
	        //write function to check no of check boxes get value
	        document.fullfleet.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.fullfleet.submit();
			}
	
		function toggleDetails(id, show)
		{
			var popup = document.getElementById("popup"+id);
			if (show) {
				popup.style.visibility = "visible";
				popup.setfocus();
				
			} else {
				popup.style.visibility = "hidden";
			}
		}
		function toggleDetails1(id, show)
			{
				//alert("bbbb");
				var popupx = document.getElementById("popupx"+id);
				if (show) {
					popupx.style.visibility = "visible";
					popupx.setfocus();
					
				} else {
					popupx.style.visibility = "hidden";
				}
			}
		function showtextarea(a,b,c)
		{
			document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
		}mouse;
		function canceldiv(A)
		{
		document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
		}

		function selectAll()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			if(document.fullfleet.maincb.checked==true)
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

		function validate()
		{
			var cntr=document.fullfleet.cntr.value;
			cntr=cntr-1;
		
			var flag="False";
		
			for(var j=0;j<cntr;j++)
			{	
				if(document.getElementById("cb"+j).checked==true)
				{
					flag="True";
				}		
			}
		
			if(flag=="False")
			{
				alert("Please select check-box");
				return false;	
			}		
			return true;
		}
		function changeAction()
		{ alert("hi");
			var transporter=document.fullfleet.transporter.value;
			var cntr=document.fullfleet.cntr.value;
			//alert("hi"+cntr);
			cntr=cntr-1;
			//alert("hi"+cntr);
			var url="changewarranty.jsp?transporter="+transporter;
		      	var i=0;
		   	for(var j=0;j<cntr;j++)
		    	{	//alert("j loop");
		    		if(document.getElementById("cb"+j).checked==true)
		    		{
		            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
						 i++;
						// alert("map"+url);
		    		}		
		    	}
		        //write function to check no of check boxes get value
		        document.fullfleet.action=url+"&cntr="+i;
		      	//document.fullfleet.action="Changewarranty1.jsp";
		        //alert(document.fullfleet.action);
		        document.fullfleet.submit();
		}

		function reset(vehcode)
		{
				//alert("in the reset funtion ");
			
				//var vehcode = document.getElementById("vehcode").value;

				//alert("vehcode is :- "+vehcode);


				var xmlhttp;
				if (window.XMLHttpRequest)
				  {
				  // code for IE7+, Firefox, Chrome, Opera, Safari
				  xmlhttp=new XMLHttpRequest();
				  }
				else if (window.ActiveXObject)
				  {
				  // code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
				else
				  {
				  alert("Your browser does not support XMLHTTP!");
				  }


				xmlhttp.onreadystatechange=function()
				{
				 if(xmlhttp.readyState==4)
				 {
				  //alert(xmlhttp.responseText);
				     var result=xmlhttp.responseText;
					 //alert("result :- "+result);
					 result = result.trim();

					 //alert("result after trim "+result);

					 if(result == "Send Successful")
					 {
						alert("Successfully sent Reset message to unit");	 	
					 }
					 else
					 {
						alert("Could not send message to unit ");	 
					 }
					 	 
				  }
				};

				xmlhttp.open("GET","reset.jsp?vehcode="+vehcode,true);
				xmlhttp.send(null);
						
		}



				


	    
		
</script>
		<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
		.popupx {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
		
		
		</style>
</head>
<body>
<% 


String insert12="";
insert12=request.getParameter("inserted");
try{
if(insert12.equalsIgnoreCase("yes"))
{
	
	 out.println("<script>"); 
		out.println("alert('Vehicle Removed Successfully');");
	 	out.println("</script>");
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
          <%@ include file="header1.jsp" %>
          </div>
          <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="fullfleet" method="post" action="" onSubmit="return validate();">
<%
	String inserted12="";
	transporter=request.getParameter("transporter");
    
    

System.out.println("transporter=@@@@@=>"+transporter);
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
	miliseconds=miliseconds-1000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	today = formatter.format(defoultdate);
	Svehlist="(0";
	username=session.getAttribute("username").toString();
	try{
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		stmtsp1=conn.createStatement();
		stmtsp111=conn.createStatement();
		stmtsp11=conn.createStatement();
		stmtsp=conn.createStatement();
		st01=conn.createStatement();
		st1=conn1.createStatement();
		st2=conn1.createStatement();
		st4=conn1.createStatement();
		st5=conn1.createStatement();
		st6=conn1.createStatement();
		st23=conn1.createStatement();
		st9=conn1.createStatement();
		st11=conn1.createStatement();
		st12=conn1.createStatement();
		stamc=conn1.createStatement();
		stamc1=conn1.createStatement();
 		stwar1=conn1.createStatement();
 		stwar2=conn1.createStatement();
		stwar3=conn1.createStatement();
 		stwar4=conn1.createStatement();
 		stmt1=conn1.createStatement();
 		stmt2=conn1.createStatement();
	}catch(Exception e)
		{
			out.print("Exception --->"+e);
		}
		// check transporter unit limit---------------
		int limit=0;
		Boolean flag=false;
		sql1="select Unitlimit from t_transporter where TypeValue='"+transporter+"' ";
		ResultSet rs1=stmt1.executeQuery(sql1);
		if(rs1.next())
		{
			limit=rs1.getInt(1);
		//out.println("limit--"+limit);
		}
		else
		{
			flag=true;
		}
		int count=0,rem_unit=0;
		String str="select count(*) as count from t_vehicledetails where status <> 'Deleted' and OwnerName='"+transporter+"'";
		ResultSet rs2=stmt2.executeQuery(str);
		if(rs2.next())
		{
			count=rs2.getInt("count");
			//out.println("count--"+count);
		}
		String alert="";
		rem_unit=limit-count;
		//out.println("rem_unit--"+rem_unit);
		//-----------------------------------------------------------------------------------------------
		String userrole=session.getAttribute("userrole").toString();
		String inserted=request.getParameter("inserted");
		String Urole=session.getAttribute("Urole").toString();
		
		
		if(inserted==null)
		{
		}
		else
		{
			String vehno=request.getParameter("vehno");
 %>
			<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
				<tr>
					<td align="center"> <font color="maroon"> <U> Special Report for <%=vehno%> has been added successfully </U> </font> </td>
				</tr>
			</table>
<%		}
		String nocbselected=request.getParameter("nocbselected");
		if(nocbselected==null)
		{
		}
		else
		{
%>
			<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
				<tr>
					<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
				</tr>
			</table>
<%	
		}
		String amcdone=request.getParameter("amcdone");
		if(amcdone==null)
		{
		}
		else
		{ 
%>
			<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
				<tr>
					<td> <div align="center"> <font color="maroon" > Successfully changed AMC of selected Vehicles.</font> </div> </td>
				</tr>
			</table>
<%	
		}
%>
			<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
<%
			if(rem_unit!=0 && flag==false && count<limit)
			{
%>
				<tr>
					<td align="center" colspan="2"> 
						<center><font color="red" size="2.8"><b><blink><%=rem_unit %> Pending Installation</blink></b></font></center>
					</td>
				</tr>
<%
			} 
%>
				<tr>
					<td align="center" colspan="2"> 
						<center><font color="black" size="3"><b>Vehicle List of <%=transporter %> .</b></font></center>
					</td>
				</tr>
				<tr  bgcolor="#BDBDBD"> 
 				   <td>
				    	<a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="#2A0A12" size="2"><b>Last 10 Outgoing Calls</b></font></a> &nbsp;&nbsp;
				    	<a href="#" onClick="window.open ('last3disp.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Last 5 Dispatches </b> </font> </a> &nbsp;&nbsp;
						<a href="#" onClick="window.open ('last5recfrmcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Last 5 Receivals </b> </font> </a> &nbsp;&nbsp;
						<a href="#" onClick="window.open ('mydiary.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Veh Avail </b> </font> </a>&nbsp;&nbsp;
						<a href="#" onClick="window.open ('PendingUnits.jsp?holdername=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Unit/s Pending </b> </font> </a>&nbsp; &nbsp;
						<%
			                String typevalue1=session.getAttribute("typevalue").toString();
			                if(typevalue1.equals("transporter"))
			               {
			            %>
						
						
                        <% } 
			                
			               else{
                        %>
                            <a href="#" onClick="window.open ('addcontact.jsp?transporter=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Transporter Contact</b> </font> </a>&nbsp; &nbsp;                       						
						<%     } 
						
						if(rem_unit!=0 && count<limit && rem_unit>0)
						{  %>
						    <a href="#" onClick="window.open ('addunit.jsp?transporter=<%=transporter%>&limit=<%=limit%>&count=<%=count%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Add Unit</b> </font> </a>
						<%}
						else
						   { %>
						
						<% } %>
					</td>
				</tr>
		</table>
		<br></br>
		<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<th><b>Sr.</b></th>
			<th><b>Contact Name</b></th>
			<th><b>Phone</b></th>
			<th><b>Mobile</b></th>
			<th><b>Designation</b></th>
			<th><b>Department</b></th>
			<th><b>Email</b></th>
			<th><b>Location</b></th>
			<th><b>Comment</b></th>
<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
		{ 
%>
			<th>Edit</th>
<%	
		}
%>
		</tr>
<%
		sql1="select * from t_recieverinfo where Transporter='"+transporter+"' and ActiveStatus='Yes' ";
		ResultSet rst2=st.executeQuery(sql1);
		int a=1;
		while(rst2.next())
		{
			String rname=rst2.getString("RecieverName");
%>
		<tr bgcolor="#BDBDBD">
			<td><%=a%></td>
			<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst2.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><%=rst2.getString("RecieverName")%></b></a></td>
			<td><%=rst2.getString("Phone")%></td>
			<td><%=rst2.getString("Mobile")%></td>
			<td><%=rst2.getString("designation")%></td>
			<td><%=rst2.getString("department")%></td>
			<td><a href="mailto:<%=rst2.getString("Email")%>?subject=Vehicle%20Complaints%20"><b><%=rst2.getString("Email")%></b></a></td>
			<td><%=rst2.getString("PlaceName")%></td>
			
			<td><a href="javascript: flase" onClick="window.open ('addcall2.jsp?reciever=<%=rname%>&trans=<%=transporter%>&mob=<%=rst2.getString("Mobile")%>&loct=<%=rst2.getString("PlaceName")%>&designation=<%=rst2.getString("designation")%>', 'win1', 'width=400, height=250, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0')"><b>Click</b></a></td>
<%
			if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
			{ 
%>
			<td>  
				<a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst2.getString("Rid") %>',
						 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')"><b>Edit</b></a>
			</td>
<%	
			} 
%>
		</tr>
<%
		a++;
		}
%>
	</table>
	<br></br>
	
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><font color="yellow"><b>UNIT MISSING</b></font></td>
			<td colspan="2"><font color="red"><b>UNIT REMOVED</b></font></td>
			<td colspan="2"><font color="green"><b>UNIT DEACTIVATED</b></font></td>
			<td colspan="2"><font color="blue"><b>SPECIAL COMMENT ON VEHICLE</b></font></td>
		</tr>		
		<tr>
			<td colspan="10"> 
					<div align="left">
				<font color="Black"><b><i>Note:</i></b>Move your mouse to Complaint Date to check more details</font></div>
				<div align="right"><a href="excelfullfleet.jsp?transporter=<%=transporter%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> 
					</div> 
			</td>	
		</tr>
	</table>
	<br></br>
	<br></br>
	<table border="1" align="center" width="750px" class="sortable">
		
					
			<%
			 String typevalue=session.getAttribute("typevalue").toString();
			   if(typevalue.equals("transporter")){
			%>
			<tr  bgcolor="#BDBDBD">
			<td><b>Sr.</b></td>
			<td><b>JRM</b></td>
			<td><b>Ticket</b></td>
			<td><b>Ticket ID</b></td>
			<td><b>Mains Status</b></td>
			<td><b>Mains StatusTime</b></td>
			<td><b>Vehicle No</b></td>
			<td><b>Employee Name</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Veh Available Date</b> </td>
			<td><b>UnitID</b></td>
			<td><b>TypeUnit</b></td>
			<td><b>MobileNo</b></td>
			<td><b>SimNo</b></td>
			<td><b>Peripheral</b></td>
			<td><b>Sim Comp</b></td>
			<td><b>Inst On</b></td>
			<td><b>Inst Location</b></td>
			<td><b>Warranty</b></td>
			<td><b>Last Rep. Date</b></td>    
			<td><b>Replacement Location</b></td>    
			<td><b>Sp. Comments</b></td>
			<td><b>Sp. Comment Desc.</b></td>
			<td><b>Extra Comment</b></td>
			<td><b>Date of Entry</b></td>
			<td><b>Entered By</b></td>
			
			
			
		</tr>
			<%	
			}else{
		%>
		<tr  bgcolor="#BDBDBD">
		<%
	if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ 
			%><td><div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"/></div> </td><%
		}
%>
			<td><b>Sr.</b></td>
			<td><b>JRM</b></td>
			<td><b>Ticket</b></td>
			<td><b>Ticket ID</b></td>
			<td><b>Mains Status</b></td>
			<td><b>Mains StatusTime</b></td>
			
			<td><b>Vehicle No</b></td>
			<td><b>Employee Name</b></td>
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Veh Available Date</b> </td>
			<td><b>UnitID</b></td>
			<td><b>TypeUnit</b></td>
			<td><b>MobileNo</b></td>
			<td><b>SimNo</b></td>
			<td><b>Tx.Intrval<br>(Min)</b></td>
			<td><b>St.Intrval<br>(Min)</b></td>
			<td><b>CodeVersion</b></td>
			<td><b>WMSN</b></td>
			<td><b>Tx.Type</b></td>
			<td><b>Peripheral</b></td>
			<td><b>Unit Type</b></td>
			<td><b>Sim Comp</b></td>
			<td><b>PS No</b></td>
			<td><b>PCB No</b></td>
			<td><b>Box No</b></td>
			<td><b>Battery No</b></td>
			<td><b>GPName</b></td>                                                                    
			<td><b>Inst On</b></td>
			<td><b>Inst Location</b></td>
			<td><b>Installed By</b></td>
			<td><b>Warranty</b></td>
			<td><b>Last Rep. Date</b></td>    
			<td><b>Replacement Location</b></td>    
			<td><b>Sp. Comments</b></td>
			<td><b>Sp. Comment Desc.</b></td>
			<td><b>Extra Comment</b></td>
			<td><b>Date of Entry</b></td>
			<td><b>Entered By</b></td>
			
			
		</tr>
		<%
			}
		try
		{
			int i=1, j=0;
			String instdte="-";
			String instby="-";//Added by veena for Installed By
			String instdte1="", vhno;
			Double lat, lon;
			
			Double lat2, lon2; 
			String direction;
			String loc11;
			String msg1="";
			String grp="",insLocation, insdt, insdt1;
			String tctegory ="",tctmsg="No Ticket",tid="-";
			String us=username.toUpperCase();
			//System.out.println("transporter--->"+transporter);
			if(transporter.equalsIgnoreCase("Topsline") || transporter.equalsIgnoreCase("HPCL") || transporter.equalsIgnoreCase("Ujjain") )
			{
				//System.out.println("in other options");
				int l=0;
				String simno1="-", mobno1="-", peripherals1="-", simcomp1="-",psno1="-",pcbno1="-",boxno1="-",batteryno1="-";
				String drivername="",vehid="";
				int delaydays1=0;
				int amc1=0;
				String sqltuh="select * from t_onlinedataotherservers where Transporter like '"+transporter+"' order by TheDate desc";
				//System.out.println(sqltuh);
				ResultSet rsttuh=st4.executeQuery(sqltuh);
				while(rsttuh.next())
				{
					String sqlbt="select * from t_onlinedata where Transporter like '"+transporter+"' order by TheDate desc";
					ResultSet battr=stmtsp.executeQuery(sql1);
					System.out.println(">>>sqlbt>>>>*******"+sqlbt);
				
					if(battr.next())
					{
						
						battrystatus =battr.getString("bcharging");
						battrystatustime =battr.getString("bdatetime");	
						
					}
				
					
					
					
					vhno=rsttuh.getString("VehicleRegNo");
					vehid=rsttuh.getString("VehicleCode");
					
					String sqltct="select * from db_gps.t_livetickettest where vehid = '"+vehid+"' ";
					ResultSet tct=stwar3.executeQuery(sqltct);
					System.out.println(">>>sqlbt>>>>*******"+sqltct);
					if(tct.next())
					{
						
						tctegory = 	tct.getString("tcategory");
						tid=tct.getString("tid");
						
					}
					else
					{
						tctegory ="-";
						tid="-";
						
					}
									
					
					String upddate1=rsttuh.getString("TheDate");
					String bg2="";
					
					if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
					{
						
						bg2="#FFA500";
					}
					
					
					
					insdt=rsttuh.getString("InstDate");
				//	insLocation=rsttuh.getString("insLocation");
					String war;			
//******************************************For Getting Location******************************************				
//********************************************************************************************************				
				lat=rsttuh.getDouble("LatitudePosition");
				lon=rsttuh.getDouble("LongitudePosition");
				
				String sqlloc="SELECT city,lat,lon,((ACOS(SIN('"+lat+"' * PI() / 180) * SIN(lat * PI() / 180) + COS('"+lat+"' * PI() / 180) * COS(lat * PI() / 180) * COS(('"+lon+"' - lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_citylatlong order by  distance ASC limit 1";
				ResultSet rsloc=st2.executeQuery(sqlloc);
				if(rsloc.next())
				{ 
					String dst=""+rsloc.getDouble("distance");
					lat2=rsloc.getDouble("lat");
					lon2=rsloc.getDouble("lon");
					System.out.println(">>>>>latitude>>>>>>>"+lat2);
					if(dst.length() >5)
					{
						dst=dst.substring(0,4);
					}
					double dist1=Double.parseDouble(dst);
					if(lat2 >lat)
					{
						direction="S";
					}
					else
					{
						direction="N";
					}
					if(lon2 > lon)
					{
						direction=direction+"E of";
					}
					else
					{
						direction=direction+"W of";
					}
					loc11=""+dist1+" kms "+direction+" "+rsloc.getString("city");
				}
				else
				{
					loc11="-";
				}

				//System.out.println(">>>>>latitude>>>>>>>"+lat2);
				
				
//******************************************End of Getting Location******************************************

//*************************************For Printing MSG With Location******************************************

			sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+rsttuh.getString("TheDate")+"') as days";
			ResultSet rsdate=st11.executeQuery(sql8);
			if(rsdate.next())
			{
					delaydays1=rsdate.getInt("days");
					if(delaydays1>7)
					{
						msg1="Device Disconnected";					
					}
			}

			String nogpschk="";
			try{
				nogpschk=loc11.substring(0,11);
			} catch(Exception e)
			{
				nogpschk=loc11;
			}
			if(nogpschk.equals("No GPS Data"))
			{
				msg1=msg1+" No GPS Data";
			}
			
	/*		String VehicleCode=rsttuh.getString("VehicleCode");
			if(VehicleCode!=null||VehicleCode!=""){
			String driver="SELECT  "+ 
			"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
		    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
		    "		( " +
		    "			SELECT vehid, startdate" +
		    "			FROM t_startedjourney " +
		    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
		    "			" +
		    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
			System.out.println(driver);
			
			ResultSet driver1=st11.executeQuery(driver);
			if(driver1.next()){
				drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
			}
			}*/
			
			sql8="select status,Empname,Instruction from t_vehicledetails where vehiclecode='"+rsttuh.getString("VehicleCode")+"'";
			//System.out.println("sql8------>"+sql8);
			ResultSet rstrem=st2.executeQuery(sql8);
			if(rstrem.next())
			{
				Empname=rstrem.getString("Empname");
				Instruction=rstrem.getString("Instruction");
				// System.out.println("status--->"+rstrem.getString("Status"));
				 if(rstrem.getString("Status").equals("Removed"))
				{
					bg2="red";
				}
				if(rstrem.getString("Status").equals("Missing"))
				{
					bg2="yellow";
				}
				if(rstrem.getString("Status").equals("DeActivated"))
				{
					bg2="lightgreen";
				}
				
			}
 
%>

<% //---------------------------------------------%>
			<tr bgcolor='<%=bg2%>'>
<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ 
%>
				<td> 
					<div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> 
				</td>
<%	
		}
%>
				<td><div align="right"><%=i%></div><input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=rsttuh.getString("VehicleRegNo")%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=rsttuh.getString("UnitID")%>" /></td> 
				<td align="left"><%=Instruction%></td>
				
				
				<td> <div align="left"><font color=""><%if(tctegory.equalsIgnoreCase("-") || tctegory=="-") { %> <%=tctmsg %><%}else{ %> <%=tctegory %><%} %>	</font> </div> </td>
				<%
				if(tid.equalsIgnoreCase("-"))
				{
				%>
				<td align="left"><%=tid %></td>
				<%}else{
				%>
				<td align="left"><a href ="javascript:toggleDetails1(<%=j%>,true);" title="Click Here" >  <%=tid %> </a>
				
				<div class="popupx" id="popupx<%=j%>">
				<table border="0" >
							<tr>
								<td>
									<a href="livetickethistoryreport.jsp?tid=<%=tid%>" onclick="toggleDetails1(<%=j%>,false);">Show History</a>
								</td>
							</tr>
							</table>
							</div>
							</td>
				<% 
				}
				%>
				
				<td align="left"><%=battrystatus %>
				<td> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
			
				
				<td width="100px" align="left"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=vhno%></b></a>
				<br/>	
					<div class="popup" id="popup<%=i%>">
						<table border="0" >
							<tr>
								<td>
									<a href="addcomplaint.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a>
								</td>
							</tr>
							<tr><td><a href="inspection.jsp?vid=<%=vhno%>&warranty=<%=warranty%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
							<tr><td><a href="inspection.jsp?vid=<%=vhno%>&warranty=<%=warranty%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">fUNCTION</a></td></tr>
							
					   <!-- <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
							<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr> -->
<%

if(typevalue.equals("transporter")){
	 %>
	     <tr>
			<td>
				<a href="repunit.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=vhno%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a>
			</td>
		</tr>
		
		<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=vhno%>&vehno=<%=vehid%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		<tr>
			<td> 
				<a href="techspcomment.jsp?transporter=<%=transporter%>&vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
			</td>
		</tr>
		<tr>
		
		
</tr>
	 <%
 }else{
		
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
							{  
%>
							<tr>
								<td>
									<a href="repunit1.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
								</td>
							</tr>
							
							
<%
							}else{ 
%>
							<tr>
								<td>
									<a href="repunit.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
								</td>
							</tr>
							<tr>
								<td> 
									<a href="remuittemp.jsp?veh=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>"> Temp Removal </a> 
								</td>
							</tr>
<%
							} 
%>
							<tr>
								<td>
									<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vhno%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a>
								</td>
							</tr>
							
							<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=vhno%>&vehno=<%=vehid%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
		
		<tr>
								<td>
									<a href="editrecs.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a>
								</td>
							</tr>
<%


							if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
							{  
%>	 
							
	
							<tr>
								<td> <a href="DeactiveReq.jsp?veh=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>"> Deactivation Req </a> </td>
							</tr>
<%
							}  
							if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
							{  
%>
							<tr>
								<td>
									<a href="removeunit.jsp?veh=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a>
								</td>
							</tr>
							<tr>
								<td>  
									<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=vhno%>&vehregno=<%=vhno %>&unitid=<%=rsttuh.getString("UnitID")%>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> 
								</td>
							</tr>
<%
							}
%>  
							<tr>
								<td>
									 <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vhno%>&vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID")%>&tpunit=<%=tpunit%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> 
								</td>
							</tr>
							<tr>
									<td> <a href="sendmail.jsp?vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=rsttuh.getString("UnitID")%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
							</tr>
							<tr>
								<td> 
									<a href="techspcomment.jsp?vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
								</td>
							</tr>
							
							<%
								if(SUPERADMIN.equalsIgnoreCase(userrole)){
								%>
								<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=rsttuh.getString("UnitID")%>&transp=<%=transporter%>&GPName=<%=grp%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								<%
								}}
							%>
							<tr>
								<td>
									<a href="javascript:toggleDetails(<%=i%>,false);">Close</a>
								</td>
							</tr>
						</table>
					</div>
				</td>
		<!-- ----------------------------------------------------------------------------------------- -->		
				 <td align="left"><%=Empname %></td>
				<td align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttuh.getString("TheDate"))) %><br><%=rsttuh.getString("TheTime") %></br></td>
				<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rsttuh.getDouble("LatitudePosition") %>&long=<%=rsttuh.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=loc11 %> </font> </b> </a> <font color="red"><%=msg1 %></font></td>
				
				
				 
<%
				
                      System.out.println("messege1>>>>>>>>>"+msg1);
                sql5="select * from t_unitmaster where UnitID='"+rsttuh.getString("UnitID")+"'";
				ResultSet rs5=st5.executeQuery(sql5);
				if(rs5.next())
				{	
					try{
							mobno1=rs5.getString("MobNo");
							simno1=rs5.getString("SimNo");
							typeunit=rs5.getString("InstType");
							tpunit=rs5.getString("TypeUnit");
							simcomp1=rs5.getString("SimCompany");
							peripherals1=rs5.getString("Peripherals");
							psno1=rs5.getString("PSNo");
							pcbno1=rs5.getString("PCBNo");
							boxno1=rs5.getString("BoxNo");
							batteryno1=rs5.getString("BatteryNo");
						}catch(Exception e)
						{
							mobno1="-";
							simno1="-";
							simcomp1="-";
							typeunit="-";
							tpunit="-";
							peripherals1="-";
						}
				}
				else
				{
					mobno1="-";
					simno1="-";
					simcomp1="-";
					typeunit="-";
					tpunit="-";
					peripherals1="-";
				}
				String b="NA",stmin="NA";
				String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+rsttuh.getString("UnitID")+"'";
				// System.out.println(sqlFTP);
				ResultSet rsFTP=st5.executeQuery(sqlFTP);
				if(rsFTP.next()){
					WMSN=rsFTP.getString("WMSN");
					int TXInterval=0,StInterval=0;
					if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
						
					}else{
					TXInterval=rsFTP.getInt("TXInterval");
					}
					if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
						
					}else{
					StInterval=rsFTP.getInt("StInterval");
					}
					CodeVersion=rsFTP.getString("CodeVersion");
					UnitType=rsFTP.getString("UnitType");
					if(CodeVersion.contains("AVL_LITE")){
						int aa=(TXInterval*500)/1000;
						int aSX=(StInterval*500)/1000;
						int bTemp=aa/60;
						int stminTemp=aSX/60;
						b=bTemp+"";
						stmin=stminTemp+"";
					//	System.out.println("b====>"+b);
					}else{
						int aa=(TXInterval*100)/1000;
						int aSX=(StInterval*100)/1000;
						int bTemp=aa/60;
						int stminTemp=aSX/60;
						b=bTemp+"";
						stmin=stminTemp+"";
					//	System.out.println("b====>"+b);
					}
				}
				
				String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
				sql="select * from t_complaints1 where VehicleNo='"+vhno.trim()+"' and Status <> 'Solved' ";
				ResultSet rscomp=st.executeQuery(sql);
				if(rscomp.next())
				{
					compdate=rscomp.getString("TdyDate");
					attloc=rscomp.getString("VehAttLoc");
					availdate=rscomp.getString("VehAvailDate");
					allocatedto=rscomp.getString("Status");
					desc=rscomp.getString("Complaint");
					contpers=rscomp.getString("ContDets");
					entby=rscomp.getString("RegBy");
					if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
					{
						sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
						ResultSet rsallocto=st01.executeQuery(sql);
						if(rsallocto.next())
						{
							allocatedto=rsallocto.getString("Technicion");
						}
						else
						{
							allocatedto="Unallocated";
						}
				
					}
%>
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </b></td>
			   				
<%		
				}
				else
				{ 
%>
				<td> No Complaint</td>		
<%	
				}
%>
				<td align="right"><%=rsttuh.getString("UnitID") %></td>
				<td align="right"><%=tpunit %></td>
				<td align="right"><%=mobno1%></td>
				<td align="right"><%=simno1%></td>
				<td align="right"><%=b%></td>
				<td align="right"><%=stmin%></td>
				<td align="left"><%=CodeVersion%></td>
				<td align="right"><%=WMSN%></td>
				<td align="left"><%=UnitType%></td>
				<td align="left"><%=peripherals1%></td>
				<%
				 if(typevalue.equals("transporter")){
					 
				 }else{
				%>
				<td align="left"><%=typeunit %></td>
				<%
				 }
				%>
				<td align="left"><%=simcomp1%></td>
				<%
				 if(typevalue.equals("transporter")){
					 
				 }else{
				%>
				<td align="right"><%=psno1%></td>
				<td align="right"><%=pcbno1%></td>
				<td align="right"><%=boxno1%></td>
				<td align="right"><%=batteryno1%></td>
<%		
				 }	//********************************************For Getting Group***********************************
				String sqlgrp="select * from t_group where VehRegno='"+vhno+"'";
				//out.print(sql6);
				ResultSet rsgrp=st6.executeQuery(sqlgrp);
				if(rsgrp.next())
				{
					try{
							grp=rsgrp.getString("GPName");
						}
						catch(Exception X)
						{
							grp="None";
						}
				}
				else
				{
					grp="None";
				}
/******************column added for inst location by sujata***************************/
				String unitid1=rsttuh.getString("UnitID");
				//System.out.println("unitid1-----?>>"+unitid1);
				String sql23="select * from t_vehicledetails where UnitID='"+unitid1+"'";
				ResultSet rs23=st23.executeQuery(sql23);
				if(rs23.next())
				{
					InstalledPlace=rs23.getString("InstalledPlace");
				}else
				{
					InstalledPlace="N.A";
				}
//end of changes
//*******************************************Fro POPUP Menus************************************
				if(typevalue.equals("transporter")){
					 
				 }else{
%>
				<td align="left"><%=grp %></td>
				<%
				 }
				%>
				<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(insdt))%></td>
				<td align="left"><%=InstalledPlace%></td>
<%
				//sql4="select * from t_onlinedataotherservers where VehicleRegNo='"+vhno+"' ";
       sql4=" select * from t_vehicledetails where VehicleRegNumber='"+vhno+"'";
				ResultSet rs4=stwar1.executeQuery(sql4);
				if(rs4.next())
				{
					//unitid=rs4.getString("UnitID");
					//vehregno=rs4.getString("VehicleRegNo");
					try{
						instdte=rs4.getString("InstDate");
						}
					catch(Exception X)
					{
						instdte="-";
					}
				sqlamc="select * from t_amchistory where VehNo = '"+vhno+"' order by WarrantyTill desc limit 1";
				ResultSet rsamcc=stwar2.executeQuery(sqlamc);
				if(rsamcc.next())
				{
					if(!(null==rsamcc.getDate("WarrantyTill")))
					{
					try{	
						sqlamc1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
						ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
						if(rsamcc1.next())
						{
							if(rsamcc1.getInt("days") > 0)
							{
								warranty="Yes";
							}
							else
							{
								warranty="No";
							}
						}
						}
						catch(Exception X)
						{
							warranty="-";
						}
					}
					else
					{
						sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt+"') as days";
						ResultSet rst222=stwar3.executeQuery(sql4);
						if(rst222.next())
						{
							if(rst222.getInt("days") > 365)
								{
									warranty="NO";
								}
							else
							{
								warranty="YES";
							}
						}
					}
				}
				else
				{
				//out.println("Hiiiiiiiiiiiiiiii");
					insdt1=rs4.getString("InstDate");
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt1+"') as days";
					ResultSet rst222=stwar4.executeQuery(sql4);
					if(rst222.next())
					{
						if(rst222.getInt("days") > 365)
						{
							warranty="NO";
						}
						else
						{
							warranty="YES";
						}
					}
				}
			}
%>
				<td align="left"><%=warranty%></td>
				<td>
<%			//---------- Last replacement date
					//column added for replacement place
					String d1="N.A";
					InstPlace="N.A";
				  	sql="select * from t_unitreplacement where VehRegNo='"+vhno+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
					ResultSet rsgett=st6.executeQuery(sql);
					if(rsgett.next())
					{
						
						InstPlace=rsgett.getString("InstPlace");
						 d1=rsgett.getString("InstDate");
						if(d1=="0000-00-00"||d1=="-")
						{
							out.print(d1);
						}
						else
						{
							String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
							out.print(d2);
						}
					}
					else
					{
						out.print(d1);
					}
%>
				</td>
				<td align="left"><%=InstPlace %></td>
<%
					int spcnt=0,spcnt1=0,k=0;
					String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
					String unitid=rsttuh.getString("UnitID");
					String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+vhno+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc";
					//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
					ResultSet rssp1=stmtsp1.executeQuery(sqlsp1);
					while(rssp1.next())
					{
						spcnt++;
						//System.out.println(spcnt);
						// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
						String cmntype=rssp1.getString("cmmt_type");
						if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
						{
							spcmmnt=rssp1.getString("SpComment");
							extracmnt=rssp1.getString("Extra_comment");
							Entrydt=rssp1.getString("EntDateTime");
							Enteredby=rssp1.getString("EntBy");
							k++;
						}
				//---------------------------------------
					}
						/*if(rssp1.next())
						{
							spcnt1=0;
							spcnt1=rssp1.getInt("cnt");
						}
							
					String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vhno+"' and cmmt_type='Vehicle' and Closed='No' ";
					//out.print(sql10);
					ResultSet rs10=st.executeQuery(sql10);
					while(rs10.next())
					{
						spcnt=rs10.getInt("cnt");	
					}
					spcnt=spcnt+spcnt1;*/
%>
    
				<td align="left"> 
					<a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID") %>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  
				</td>
		  	    <td align="left"><%=spcmmnt %></td>
				<td align="left"><%=extracmnt %></td>
<%				if(!Entrydt.equals("N.A"))
				{
%>
				<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
<%
				}else{
%>
				<td align="right"><%=Entrydt %></td>
<%
				} 
%>
				<td align="left"><%=Enteredby %>
					
				
				<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=vhno%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" /></td>
			</tr>

				<%
				i++;
		        j++;

			}

		}else
		{
		
		
		System.out.println("in else statement@@@@@@@@@");
		String drivername="";
		if(session.getAttribute("userrole").toString().equals("Group"))
		{
			if(us.equals("CASTROL"))
			{
				sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
			}
			else
			{
				sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
			}
		}else
		{
		
			 if(transporter.equalsIgnoreCase("Vehall"))
			 {
					sql="select *  from t_vehicledetails order by ownername "; 
				 
			 }else{
				 
					sql="select *  from t_vehicledetails where OwnerName='"+transporter+"'"; 
				 
			 }
		
		
		
		}
		
			ResultSet rst=st1.executeQuery(sql);
			System.out.println(">>>>sql111 else"+sql);
			while(rst.next())
			{
				Svehlist=Svehlist+","+rst.getString("VehicleCode");
			}
			Svehlist=Svehlist+")"; 
	//out.print(Svehlist);
	           
	      if(transporter.equalsIgnoreCase("Vehall"))
	      {
	    	  sql="select * from t_onlinedata  order by Transporter asc";
	      }else{
	    	  
	    	  
	    	  sql="select * from t_onlinedata where Transporter='"+transporter+"' and VehicleCode in "+Svehlist+" order by TheDate desc, TheTime desc";  
	      }
			
			ResultSet rst1=st1.executeQuery(sql);
			System.out.println("changed query=@@@@@11111=>"+sql);
	//int i=1, j=0;
		
			String Vehcode="",unitid="",group1="", vehregno="";
			Double lat1,lon1;
			while(rst1.next())
			{    System.out.println("In the first while loop");
				String bg="", msg="";
				int delaydays=0;
				int amc=0;
				
				lat1=rst1.getDouble("LatitudePosition");
				lon1=rst1.getDouble("LongitudePosition");
				String upddate=rst1.getString("TheDate");
				battrystatus =rst1.getString("bcharging");
				battrystatustime =rst1.getString("bdatetime");
				String loc=rst1.getString("Location");
				System.out.println(lat1);
				System.out.println(lon1);
		/*		String VehicleCode=rst1.getString("VehicleCode");
				if(VehicleCode!=null||VehicleCode!=""){
				String driver="SELECT  "+ 
				"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
			    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
			    "		( " +
			    "			SELECT vehid, startdate" +
			    "			FROM t_startedjourney " +
			    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
			    "			" +
			    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
				System.out.println(driver);
				
				ResultSet driver1=st11.executeQuery(driver);
				if(driver1.next()){
					drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
				}
				} */
				
				if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
				{
					
					bg="#FFA500";
				}
				
				
				sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+upddate+"') as days";
				ResultSet rsdate=st11.executeQuery(sql8);
				if(rsdate.next())
				{
						delaydays=rsdate.getInt("days");
						if(delaydays>7)
						{
							msg="Device Disconnected";					
						}
				}
				
		String nogpschk="";
		try{
			nogpschk=loc.substring(0,11);
		} catch(Exception e)
		{
			nogpschk=loc;
		}
		if(nogpschk.equals("No GPS Data"))
		{
			msg=msg+" No GPS Data";
		}
		
	 sql8="select status,Empname,Instruction from t_vehicledetails where vehiclecode='"+rst1.getString("VehicleCode")+"'";
 System.out.println("sql8------>"+sql8);
	 ResultSet rstrem=st2.executeQuery(sql8);
	 if(rstrem.next())
	 {
	 	
		 Empname=rstrem.getString("Empname");
		 Instruction=rstrem.getString("Instruction");
		 if(rstrem.getString("Status").equals("Removed"))
	 	{
	 		bg="red";
	 	}
	 	if(rstrem.getString("Status").equals("Missing"))
	 	{
	 		bg="yellow";
	 	}
	 	if(rstrem.getString("Status").equals("DeActivated"))
	 	{
	 		bg="lightgreen";
	 	}
	 	
	 }
	 
	
	 
	 //--------------------------------------- special comment color for row--------------------
	/* int spcnt1=0;
	 	String sqlsp="select count(*) as cnt from t_techspecialrep where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle' and Closed='No' ";
		ResultSet rssp=stmtsp.executeQuery(sqlsp);
		if(rssp.next())
		{
			spcnt1=rssp.getInt("cnt");
			
		}
		if(spcnt1 > 0)
		{
			System.out.println("inside vehicle");
		
			bg="lightBlue";
		}
		else
		{
			
		System.out.println("unit id--"+rst1.getString("UnitID"));
		
		int spcnt=0;
		sqlsp="select count(*) as cnt from t_techspecialrep where UnitId = '"+rst1.getString("UnitID")+"' and Closed='No' and cmmt_type='Unit' ";
	 	ResultSet rssp1=stmtsp.executeQuery(sqlsp);
		if(rssp1.next())
		{
			
			spcnt=rssp1.getInt("cnt");
		}
		
		if(spcnt > 0)
		{System.out.println("inside unit");
			bg="#F6FDD0";
		}
		}*/
	//-------------------------------------------------------------------------------------------------------------
		Vehcode=rst1.getString("VehicleCode");
		
		try{
		
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"'";
		
		ResultSet rs4=st4.executeQuery(sql4);
		System.out.println("sql4-->"+unitid);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
		//	System.out.println("unitid-->"+unitid);
			vehregno=rs4.getString("VehicleRegNumber");
			try{
			instdte=rs4.getString("InstalledDate");
		//	System.out.println("InstalledDate---->"+instdte);
			InstalledPlace=rs4.getString("InstalledPlace");
			instby=rs4.getString("InstalledBy");//Added by veena for installed by
		//	System.out.println("InstalledPlace---->"+InstalledPlace);
			}
			catch(Exception X)
			{
				instdte="-";
				InstalledPlace="-";
				instby="-";
			}
			
			sqlamc="select * from t_amchistory where VehCode = '"+Vehcode+"' order by WarrantyTill desc limit 1";
			ResultSet rsamc=stamc.executeQuery(sqlamc);
			if(rsamc.next())
			{
				if(!(null==rsamc.getDate("WarrantyTill")))
				{
				try{	
				sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
				ResultSet rsamc1=stamc1.executeQuery(sqlamc1);
				if(rsamc1.next())
				{
					if(rsamc1.getInt("days") > 0)
					{
						warranty="Yes";
					}
					else
					{
						warranty="No";
					}
				}
				}
				catch(Exception X)
				{
					warranty="-";

				}
				}
				else
				{
					
					
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
					ResultSet rst222=st4.executeQuery(sql4);
					if(rst222.next())
					{
						
						if(rst222.getInt("days") > 365)
								{
							warranty="NO";
								}
						else
						{
							warranty="YES";
						}
					}
				}
			}
			else
			{
					try{
						instdte1=rs4.getString("InstalledDate");
						}
						catch(Exception X)
						{
							instdte1="-";
						}	
				sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte1+"') as days";
				ResultSet rst222=st4.executeQuery(sql4);
				if(rst222.next())
				{
					if(rst222.getInt("days") > 365)
							{
						warranty="NO";
							}
					else
					{
						warranty="YES";
					}
				}
				
				
				
			}	
	
		}
		
		
		
		
		}catch(Exception e)
		{
			
			System.out.println(">>>>Exception  !!!!>>"+e);	
		}
		
		
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rs5=st5.executeQuery(sql5);
		System.out.println(">>>>sql5  !!!!>>"+sql5);	
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			typeunit=rs5.getString("InstType");
			tpunit=rs5.getString("TypeUnit");
			simcomp=rs5.getString("SimCompany");
			peripherals=rs5.getString("Peripherals");
			psno=rs5.getString("PSNo");
			pcbno=rs5.getString("PCBNo");
			boxno=rs5.getString("BoxNo");
			batteryno=rs5.getString("BatteryNo");
			
		} 
		String b="NA",stmin="NA";
		
		try{
		String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+unitid+"'";
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		System.out.println(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
				TXInterval=rsFTP.getInt("TXInterval");
			}
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
				StInterval=rsFTP.getInt("StInterval");
			}
			CodeVersion=rsFTP.getString("CodeVersion");
			UnitType=rsFTP.getString("UnitType");
			if(CodeVersion.contains("AVL_LITE")){
				int aa=(TXInterval*500)/1000;
				int aSX=(StInterval*500)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				System.out.println("b====>"+b);
			}else{
				int aa=(TXInterval*100)/1000;
				int aSX=(StInterval*100)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				System.out.println("b====>"+b);
			}
		}
		
		}catch(Exception e33)
		{
			System.out.println("$#$#====>"+e33);
			
		}
		
		
		
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		System.out.println(sql6);
		//out.print(sql6);
		ResultSet rs6=st6.executeQuery(sql6);
		if(rs6.next())
		{
			group1=rs6.getString("GPName");
		}
		else
		{
			group1="None";
		}
		
		
		 //---------------------------------------------------------------------------------------------------------
		 String  spcnmttype="",spcmnt="";
		 String sqlsp="select * from t_techspecialrep where ((VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc Limit 1";
		//String sqlsp="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
	//	System.out.println(sqlsp);
		ResultSet rssp=stmtsp.executeQuery(sqlsp);
		System.out.println(">>>>sqlsp  !!!!>>"+sqlsp);	
		if(rssp.next())
		{
			spcnmttype=rssp.getString("cmmt_type");
		}
		if(spcnmttype.equalsIgnoreCase("Vehicle"))
		{
		//	System.out.println("inside vehicle");
		
			bg="lightBlue";
		}
		else if(spcnmttype.equalsIgnoreCase("Unit"))
		{
			if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg="#FFA500";
			}else{
			
			
			bg="#F6FDD0";
			}
			
		}
	
		String sqlrepdis="select SpComment from t_techspecialrep where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle'  and Closed='No' order by EntDateTime desc";
		System.out.println("aaaaaaaaaaa^^^^^^^^^^^^^");
		System.out.println(sqlrepdis);
		ResultSet rsrepdis=stmtsp.executeQuery(sqlrepdis);
		System.out.println("bbbbbbbbbb^^^^^^^");
		while(rsrepdis.next()){
			spcmnt=rsrepdis.getString("SpComment");
			//System.out.println("spcmnt^^^^^^^^^^^^^"+spcmnt);
			if(spcmnt.contains("System disconnection detected")){
				if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
				{
					
					bg="#FFA500";
				}else{
				
				bg="#E2A9F3";
				
				}
			}
		}
		
		System.out.println("ccccccccccc^^^^^^^^^^^^^");
	%>
	<tr bgcolor='<%=bg%>'>
	<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ %>
				<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
	<%	}
	%>
	<td align="right"><%=i%>  	 </td> 
	<td><%=Instruction%></td>
	<%
	try
	{
		String sqltct="select * from db_gps.t_livetickettest where vehid ='"+rst1.getString("VehicleCode")+"' ";
		ResultSet tct=stwar3.executeQuery(sqltct);
		System.out.println(">>>sqlbt>>>>*******"+sqltct);
		if(tct.next())
		{
			
			tctegory = 	tct.getString("tcategory");
			tid=tct.getString("tid");
			
		}else
		{
			tctegory ="-";
			tid="-";
		}
		
		System.out.println(">>>tctegory>>>>*******"+tctegory);
	}
	catch(Exception e)
	{
		System.out.println(">>>exception>>>>*******"+e);
	}
	%>
	
	<%try{
		  	%>
		  <td> <div align="left"><font color=""><%if( tctegory.equalsIgnoreCase("-") ||  tctegory=="-") { %> <%=tctmsg %><%}else{ %> <%=tctegory %><%} %>	</font> </div> </td>
			
		<% }catch (Exception e)
		
		{
			   e.printStackTrace();
			} %>
	
	
	
	
	
	<%
				if(tid.equalsIgnoreCase("-"))
				{
				%>
				<td align="left"><%=tid %></td>
				<%}else{
				%>
				<td align="left"><a href ="javascript:toggleDetails1(<%=j%>,true);" title="Click Here" >  <%=tid %> </a>
			
			<div class="popupx" id="popupx<%=j%>">
				<table border="0" >
							<tr>
								<td>
									<a href="livetickethistoryreport.jsp?tid=<%=tid%>" onclick="toggleDetails1(<%=j%>,false);">Show History</a>
								</td>
							</tr>
							</table>
							</div>
							</td>
				
				<% 
				}
				%>
	<td>  <%=battrystatus%>	  </td>
	   <%try{
		  	%>
		   <td> <%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	 </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
	
	
	<td width="100px"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=rst1.getString("VehicleRegNo")%></b>
	</a>
	<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	
	<%

if(bg.equals("red"))
{
		
	String remdate="", oldunitwith="", withtech="";
	// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
	String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
	ResultSet rs9=st9.executeQuery(sql9);	
	if(rs9.next())
	{
		unitid=rs9.getString("OldUnitId");
		remdate=rs9.getString("EntDate");
		oldunitwith=rs9.getString("OldUnitWith");
		withtech=rs9.getString("InstBy");
		//out.println("unitid");
		String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
		
		ResultSet rs11 = st11.executeQuery(sql11);
		
		if(rs11.next())
		{
			simno=rs11.getString("MobNo");
			mobno=rs11.getString("SimNo");
			//remdate=rs11.getString("EntDate");
		}
		
	} 
	else
	{
		String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' order by InstDate desc limit 1";
		
		ResultSet rs11 = st11.executeQuery(sql11);
		
		if(rs11.next())
		{
			unitid=rs11.getString("NewUnitId");
			oldunitwith="Not Avail";
			//remdate=rs11.getString("EntDate");
		}
	}
}


	if(bg.equals("lightgreen"))
	{
		
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
							
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
			ResultSet rs11 = st11.executeQuery(sql11);
			//out.println(sql11);
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
			}
		}
		
	}

%>
	
	
	
	<tr><td><a href="addcomplaint.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
	
	<tr>
	
	
	<td>
	   
	   
	   
	   <a href="#" onclick="reset(<%=rst1.getString("VehicleCode")%>);">Reset Device</a></td></tr>
	
	
	
	<tr><td><a href="inspection.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid %>&category=<%=tctegory %>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
	<!--  <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>

	<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr>-->

	
<%

if(typevalue.equals("transporter")){
	 %>
	     <tr>
			<td>
				<a href="repunit.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
		
		<tr>
			<td> 
				<a href="techspcomment.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
			</td>
		</tr>
		
	 <%
 }else{

if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr><td><a href="repunit1.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
}else
{ %>
	<tr><td><a href="repunit.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
	<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
} %>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=rst1.getString("VehicleCode")%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
	 <tr>
		<td> <a href="remuittemp.jsp?veh=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&Vehcode=<%=Vehcode%>"> Temp Removal </a> </td>
	</tr>
	
	<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
	
	 <tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								<tr>
		<td><a href="editrecs.jsp?vid=<%=rst1.getString("VehicleCode")%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
	</tr>
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
{  %>	 
	
	
	<tr>
		<td> <a href="DeactiveReq.jsp?veh=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>"> Deactivation Req </a> </td>
	</tr>
	<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
}  
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr>
		<td><a href="removeunit.jsp?veh=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a></td>
	</tr>
<!-- 	<tr>
		<td>  <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=rst1.getString("VehicleCode")%>&vehregno=<%=vehregno %>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> </td>
	</tr>
 -->
 
 <tr>
		<td><a href="vehexchange.jsp?veh=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange</a></td>
	</tr>
	<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
}
%>  
<tr>
	<td> <a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('reprovisionnos.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&TypeUnit=<%=tpunit %>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>

<tr>
		<td> <a href="techspcomment.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
</tr>
<tr>
		<td> <a href="sendmail.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&vehno=<%=vehregno%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>
<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>



<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
	<tr>
		<td> <a href="unitmissing.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&vehno=<%=vehregno%>&unitid=<%=unitid%>&TypeUnit=<%=tpunit %>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Unit Missing</a> </td>
</tr>
<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
}%>
<%
								if(SUPERADMIN.equalsIgnoreCase(userrole)){
								%>
								<tr>
									<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								<%
								}}
							
 
String remdate="", oldunitwith="", withtech="";
String sql10="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"'   order by EntDate desc";
 
 System.out.println(sql10);
ResultSet rs22=st9.executeQuery(sql10);	
System.out.println("12456");
	if(rs22.next())
	{    
		//unitid=rs22.getString("OldUnitId");
		remdate=rs22.getString("EntDate");
		oldunitwith=rs22.getString("OldUnitWith");
		//withtech=rs22.getString("InstBy");
		System.out.println(">>>>>>>>remdate>>>>"+remdate);		
		System.out.println("22222145");
//String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
		
		//ResultSet rs11 = st11.executeQuery(sql11);
		
		//if(rs11.next())
		//{
			//simno=rs11.getString("MobNo");
			//mobno=rs11.getString("SimNo");
			//remdate=rs11.getString("EntDate");
		//}
	}
	System.out.println("77777777777777>>>");		
	String abc="";
	try{
	
	
	 abc="<font color='yellow' size='2'> In-Active Unit Removed on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+ " Unit with:"+oldunitwith+"</font>";
	System.out.println("123>>>"+abc);		
	}catch(Exception e){
		e.printStackTrace();
		
		//out.print(" <font color='yellow' size='2'>In-Active UNIT REMOVED on (date not available)</font>");
	}
	
	
	
	%>
    
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	</div>
	</td>
	
	
	
	
		<td><%=Empname %></td>
	<td align="right"><%= new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%> <%=rst1.getString("TheTime")%></td>
	<%  
	if(bg.equals("red")){
		System.out.println(">>>>>>>>if loop>>>>");	
	%>	
	
	<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst1.getDouble("LatitudePosition") %>&long=<%=rst1.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst1.getString("Location")%> </font> </b> </a> <br/> <font color="red"> <%= abc %></font></td>
	<% }else{
		System.out.println(">>>>>>>>else loop>>>>");
	%>
   <td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rst1.getDouble("LatitudePosition") %>&long=<%=rst1.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=rst1.getString("Location")%> </font> </b> </a> <font color="red"> <%= msg %></font></td>
<% 
	}
	
System.out.println(">>>>>>>>messege>>>>"+msg);	

if(bg.equals("yellow"))
	{ %>
		<font color="red" >UNIT MISSING </font>
<%	}
	

	
	
	if(bg.equals("red"))
	{
			
		
		// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' and InstType='Rem' order by EntDate desc";	
		ResultSet rs10=st9.executeQuery(sql9);
		System.out.println(">>>>>>>>sql9>>>>"+sql9);	
		if(rs10.next())
		{
			unitid=rs10.getString("OldUnitId");
			remdate=rs10.getString("EntDate");
			oldunitwith=rs10.getString("OldUnitWith");
			withtech=rs10.getString("InstBy");
			//out.println("unitid");
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
			
			ResultSet rs11 = st11.executeQuery(sql11);
			
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
				//remdate=rs11.getString("EntDate");
			}
			
		} 
		else
		{
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' or VehCode='"+rst1.getString("VehicleCode")+"' order by InstDate desc limit 1";
			
			ResultSet rs11 = st11.executeQuery(sql11);
			
			if(rs11.next())
			{
				unitid=rs11.getString("NewUnitId");
				oldunitwith="Not Avail";
				
				//remdate=rs11.getString("EntDate");
			}
		}
		if(oldunitwith.equals("Tech"))
		{
			oldunitwith=withtech;			
		}
		try{
	//	out.print(" <font color='yellow' size='2'> on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+" Unit with:"+oldunitwith+"</font>");
		} catch(Exception e)
		{
		//	out.print(" <font color='yellow' size='2'> on (date not available)</font>");			
		}

	 } %> </td>

	<%
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
		sql="select * from t_complaints1 where VehicleNo='"+vehregno.trim()+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		System.out.println(">>>>>>>>sql>>>>"+sql);	
		if(rscomp.next())
		{
			
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			DetDesc=rscomp.getString("CDescription");
			compdate=rscomp.getString("TdyDate");
			
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' order by DofAllocation Desc";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
					//compdate=rsallocto.getString("DofAllocation");
				}
				else
				{
					allocatedto="Unallocated";
				}
					
			}
			
	//--------------------------------------------------------	
			
			if(availdate.equals(""))
			{
				availdate="No Information";
		
				%>
				
				<td><%=availdate %> </td>
				<% 
			}
			
			else
			{
			
			try
			{
			%>
				
				<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?compdate=<%=compdate %>&attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>&DetDesc=<%=DetDesc %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate))%> </B></td>
				   
			<%	
			}catch(Exception e){
				
			out.println("-");
				
				
			}
			}
	//--------------------------------------------------	
			
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	%>
	
	<td align="right"><%=unitid%></td>
	<td align="right"><%=tpunit%></td>
		<td align="right"><%=simno%></td>
	<td align="right"><%=mobno%></td>
	<td align="right"><%=b%></td>
	<td align="right"><%=stmin%></td>
	<td><%=CodeVersion%></td>
	<td><%=WMSN%></td>
	<td><%=UnitType%></td>
	<td><%=peripherals %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td><%=typeunit %></td>
	<%
	 }
	%>
	<td><%=simcomp %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="right"><%=psno %></td>
	<td align="right"><%=pcbno %></td>
	<td align="right"><%=boxno %></td>
	<td align="right"><%=batteryno %></td>
	<td><%=group1%></td>
	<%
	 }
	%>
	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
	<td><%=InstalledPlace%></td>
    <td><%=instby%></td>
	
	
	<td><%=warranty%></td>
	
	
	
<td>
	<%			//---------- Last replacement date
	String d1="N.A";
	InstPlace="N.A";
  	sql="select * from t_unitreplacement where VehRegNo='"+vehregno+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
  //	System.out.println("sql---->"+sql); 
  	ResultSet rsgett=st6.executeQuery(sql);
	if(rsgett.next())
	{
		InstPlace=rsgett.getString("InstPlace");
		d1=rsgett.getString("InstDate");
		//System.out.println("date---->"+d1); 
		//System.out.println("InstPlace----"+InstPlace); 
		if(d1=="0000-00-00"||d1=="-")
		{ 
			System.out.println("inside last replacement"+d1);
			out.print(d1);
		}
		else
		{
			System.out.println("1 else inside last replacement"+d1);
			String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
			out.print(d2);
			System.out.println("1 else inside last replacement"+d2);
		}
	}
	else
	{
		System.out.println("last else inside last replacement"+d1);
		out.print(d1);
	}

	%>
	</td>

	<%
	//String sql23="select * from t_unitreplacement where VehRegNo='"+vehregno+"'and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
	//ResultSet rst23=st23.executeQuery(sql23);
	//while(rst23.next())
	//{
//		InstPlace=rst23.getString("InstPlace");
		
//	}
//	 %>
	<td><%=InstPlace%></td>
<%

//System.out.println("query-----");
int spcnt=0,spcnt2=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A",InstalledBy="N.A.";//Added by veena
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+rst1.getString("VehicleRegNo")+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and  `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";
//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp2=stmtsp111.executeQuery(sqlsp1);
	System.out.println(">>>>>>>>sqlsp1>>>>"+sqlsp1);	
	while(rssp2.next())
	{
		//System.out.println("INside while");
	
		spcnt++;

		// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
	
		String cmntype=rssp2.getString("cmmt_type");
		
		if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
		{
			spcmmnt=rssp2.getString("SpComment");
			extracmnt=rssp2.getString("Extra_comment");
			Entrydt=rssp2.getString("EntDateTime");
			Enteredby=rssp2.getString("EntBy");
			//InstalledBy=rssp2.getString("InstBy");//Added by veena
			k++;
		}
		//---------------------------------------
		
	}
	//System.out.println("OUTside while");
/*if(rssp1.next())
{
	spcnt2=0;
	spcnt2=rssp1.getInt("cnt");
}
	String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' ";
	//out.print(sql10);
	ResultSet rs10=st.executeQuery(sql10);
	while(rs10.next())
	{
		spcnt=rs10.getInt("cnt");	
	}
	spcnt=spcnt+spcnt2;*/
%>

	<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  </td>
	<td><%=spcmmnt %></td>
		<td><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
		<%-- <td><%=InstalledBy %></td> --%>
		
				
		
	</tr>
				<input type="hidden" id="id<%=j%>" name="id<%=j%>" value="<%=rst1.getString("VehicleCode")%>" />
				<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=rst1.getString("VehicleRegNo")%>" />
				<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" />
        <%
	i++;
        j++;
	}
	
			if(transporter.equalsIgnoreCase("Vehall"))
			{
				
				sql="select * from t_vehicledetails where  VehicleCode not in (select VehicleCode from t_onlinedata ) order by ownername asc  ";
			}else{
				
				sql="select * from t_vehicledetails where ownername='"+transporter+"' and VehicleCode not in (select VehicleCode from t_onlinedata where Transporter='"+transporter+"')";	
				
			}
	
	
	ResultSet rst3=st1.executeQuery(sql);
	
	System.out.println("changed query=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=>"+sql);
	while(rst3.next())
	{
	System.out.println("INSIDE ND WHILE ");	
	
String bg1="";
	 sql7="select status from t_vehicledetails where vehiclecode='"+rst3.getString("VehicleCode")+"'";
	 ResultSet rstrem1=st2.executeQuery(sql7);
	 if(rstrem1.next())
	 {
	 	if(rstrem1.getString("Status").equals("Removed"))
	 	{
	 		bg1="red";
	 	}
	 	
	 }
	
		Vehcode=rst3.getString("VehicleCode");
		String VehicleRegNumber=rst3.getString("VehicleRegNumber");
		System.out.println(Vehcode);
		sql4="select * from t_vehicledetails where VehicleCode='"+Vehcode+"' ";
		
		ResultSet rs4=st4.executeQuery(sql4);
		if(rs4.next())
		{
			unitid=rs4.getString("UnitID");
			Instruction=rs4.getString("Instruction");
			try{
				instdte=rs4.getString("InstalledDate");
				
				}
				catch(Exception X)
				{
					instdte="-";
				}
				//out.println(instdte);
				System.out.println(instdte);
				
				
				sqlamc="select * from t_amchistory where VehCode = '"+Vehcode+"' order by WarrantyTill desc limit 1";
				ResultSet rsamc=stamc.executeQuery(sqlamc);
				System.out.println(sqlamc);
				if(rsamc.next())
				{
					if(!(null==rsamc.getDate("WarrantyTill")))
					{
					try{	
					sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
					ResultSet rsamc1=stamc1.executeQuery(sqlamc1);
					if(rsamc1.next())
					{
						//out.print(rsamc1.getInt("days"));
						if(rsamc1.getInt("days") > 0)
						{
							warranty="YES";
						}
						else
						{
							warranty="NO";
							//expdate="NA";
						}
					}
					}
					catch(Exception X)
					{
						warranty="-";
					}
					}
					else
					{
						
						
						sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
						ResultSet rst222=st4.executeQuery(sql4);
						if(rst222.next())
						{
							
							if(rst222.getInt("days") > 365)
									{
								warranty="NO";
									}
							else
							{
								warranty="YES";
							}
						}
					}
					
				}
				else
				{
						try{
							instdte1=rs4.getString("InstalledDate");
							}
							catch(Exception X)
							{
								instdte1="-";
							}	
					sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte1+"') as days";
					ResultSet rst222=st4.executeQuery(sql4);
					if(rst222.next())
					{
						//System.out.println("Days --->"+rst222.getInt("days"));
						
						if(rst222.getInt("days") > 365)
								{
							warranty="NO";
								}
						else
						{
							warranty="YES";
						}
					}
					
					
					
				}
		}
		sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
		System.out.println(sql5);
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{
			simno=rs5.getString("MobNo");
			mobno=rs5.getString("SimNo");
			typeunit=rs5.getString("InstType");
			tpunit=rs5.getString("TypeUnit");
			simcomp=rs5.getString("SimCompany");
			peripherals=rs5.getString("Peripherals");
			psno=rs5.getString("PSNo");
			pcbno=rs5.getString("PCBNo");
			boxno=rs5.getString("BoxNo");
			batteryno=rs5.getString("BatteryNo");
		}
		String b="NA",stmin="NA";
		String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+unitid+"'";
		System.out.println(sqlFTP);
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
			TXInterval=rsFTP.getInt("TXInterval");
			}
			if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
				
			}else{
			StInterval=rsFTP.getInt("StInterval");
			}
			CodeVersion=rsFTP.getString("CodeVersion");
			UnitType=rsFTP.getString("UnitType");
			if(CodeVersion.contains("AVL_LITE")){
				int aa=(TXInterval*500)/1000;
				int aSX=(StInterval*500)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}else{
				int aa=(TXInterval*100)/1000;
				int aSX=(StInterval*100)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
				//System.out.println("b====>"+b);
			}
		}
		sql6="select * from t_group where VehCode='"+Vehcode+"' ";
		System.out.print(sql6);
		ResultSet rs6=st6.executeQuery(sql6);
		if(rs6.next())
		{
			
			group1=rs6.getString("GPName");
		}
		else
		{
			
			group1="None";
		}
		%>
	
	<tr bgcolor='<%=bg1%>'>
	<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
		{ %>
		
				<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"> </input> </div> </td>
	<%	}
	%>
	<td align="right"><%=i%> </td>
	<td><%=Instruction%> </td>
	<%
	try
	{
		String sqltct="select * from db_gps.t_livetickettest where vehid ='"+rst1.getString("VehicleCode")+"' ";
		ResultSet tct=stwar3.executeQuery(sqltct);
		System.out.println(">>>sqlbt>>>>*******"+sqltct);
		if(tct.next())
		{
			
			tctegory = 	tct.getString("tcategory");
			tid = 	tct.getString("tid");
			
			
		}else
		{
			tctegory ="-";
			tid="-";
		}
		
		System.out.println(">>>tctegory>>>>*******"+tctegory);
	}
	catch(Exception e)
	{
		System.out.println(">>>exception>>>>*******"+e);
	}
	%>
	<%try{
		  	%>
		  <td> <div align="left"><font color=""><%if(tctegory.equalsIgnoreCase("-") ||  tctegory=="-") { %> <%=tctmsg %><%}else{ %> <%=tctegory %><%} %>	</font> </div> </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
	
	<%
				if(tid.equalsIgnoreCase("-"))
				{
				%>
				<td align="left"><%=tid %></td>
				<%}else{
				%>
				<td align="left"><a href ="javascript:toggleDetails1(<%=j%>,true);" title="Click Here" >  <%=tid %> </a>
				
				<div class="popupx" id="popupx<%=j%>">
				<table border="0" >
							<tr>
								<td>
									<a href="livetickethistoryreport.jsp?tid=<%=tid%>" onclick="toggleDetails1(<%=j%>,false);">Show History</a>
								</td>
							</tr>
							</table>
							</div>
							</td>
				
				<% 
				}
				%>
	<td>  <%=battrystatus%>	  </td>
	   <%try{
		  	%>
		   <td> <%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	 </td>
			
		<% }catch(Exception  e){
		
			System.out.println(">>>>>>Exception>>>>"+e);
			
		} %>
	
	
	<td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=VehicleRegNumber%></b></a>
	<br/>	
	<div class="popup" id="popup<%=i%>">


	
	<% if(bg1.equals("red"))
	  { 
		//String remdate="";
		String remdate="", oldunitwith="", withtech="";
		String sql9="";
		
		     sql9="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and InstType='Rem' order by EntDate desc";
		     ResultSet rs9=st9.executeQuery(sql9);	
				if(rs9.next())
				{
					unitid=rs9.getString("OldUnitId");
					remdate=rs9.getString("EntDate");
					oldunitwith=rs9.getString("OldUnitWith");
					withtech=rs9.getString("InstBy");
				}
				else
				{
					String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' order by InstDate desc limit 1";
						
					ResultSet rs11 = st11.executeQuery(sql11);
					
					if(rs11.next())
					{
						unitid=rs11.getString("NewUnitId");
						oldunitwith="Not Avail";
						//remdate=rs11.getString("EntDate");
					}
				}
				System.out.println(sql9);	
			
	 }
 
	if(bg1.equals("lightgreen"))
	{
		
		String sql9="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' or VehCode='"+rst3.getString("VehicleCode")+"' and InstType='DeActive' order by EntDate desc";	
		ResultSet rs9=st9.executeQuery(sql9);	
		if(rs9.next())
		{
			unitid=rs9.getString("OldUnitId");
							
			String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and NewUnitID='"+unitid.trim()+"' ";
			ResultSet rs11 = st11.executeQuery(sql11);
			//out.println(sql11);
			if(rs11.next())
			{
				simno=rs11.getString("MobNo");
				mobno=rs11.getString("SimNo");
				simcomp=rs11.getString("SimCompany");
				peripherals=rs11.getString("Peripherals");
			}
		}
		//System.out.println(sql9);
	}
	//System.out.println(simno);
	 %>

	<table border="0" >
		<tr>
			<td>
				<a href="addcomplaint.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);"> asdfdsafas Add Complaint</a>
			</td>
		</tr>
		
		<tr><td><a href="inspection.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
		
		<tr><td><a href="inspection.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Reset Device</a></td></tr>
<%

if(typevalue.equals("transporter")){
	 %>
	     <tr>
			<td>
				<a href="repunit.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" > View History</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=Vehcode%>&vehno=<%=VehicleRegNumber%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
		
		<tr>
			<td> 
				<a href="techspcomment.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=Vehcode%>&vehno=<%=VehicleRegNumber%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
		
		<tr>
		<td> <a href="sendmail.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&vehno=<%=vehregno%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
    </tr>
       <tr>
					<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
	 <%
 }else{

if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
		<tr>
			<td>
				<a href="repunit1.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		
		<tr>
			<td>
			</td>
		</tr>
<%
}else
{ %>
		<tr>
			<td>
				<a href="repunit.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<a href="repunit1.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Reset Device</a>
			</td>
		</tr>
		
		<tr>
									<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
} %>
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')" >View History</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('CallLogData.jsp?vid=<%=Vehcode%>&vehno=<%=VehicleRegNumber%>&&transp=<%=transporter%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" >Call Log</a>
			</td>
		</tr>
	
  		<tr>
  			<td>
  			 <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> 
  			 </td>
  		</tr>
  	
  	
  	
  	
  	
  		<tr>
			<td> 
				<a href="remuittemp.jsp?veh=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&Vehcode=<%=Vehcode%>"> Temp Removal </a> 
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="editrecs.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a>
			</td>
		</tr>
	<%
		 
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
{  %>	 
		
	
		<tr>
			<td> 
				<a href="DeactiveReq.jsp?veh=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid %>"> Deactivation Req </a> 
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="repunit1.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Reset Device</a>
			</td>
		</tr>
		<tr>
									<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
<%
}  
if(MANAGER.equalsIgnoreCase(userrole) || SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
		<tr>
			<td>
				<a href="removeunit.jsp?veh=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a>
			</td>
		</tr>
		
		<tr>
			<td>  
				<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=rst3.getString("VehicleCode")%>&vehregno=<%=VehicleRegNumber%>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> 
			</td>
		</tr>
		
		<tr>
			<td>
				<a href="repunit1.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Reset Device</a>
			</td>
		</tr>
		
		<tr>
		<td>
		<a href="vehexchange.jsp?veh=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange</a>
		</td>
		</tr>
		
		<tr>
									<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
		
		
<%
}
%>  
		<tr>
			<td> 
				<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=rst3.getString("VehicleCode")%>&vehno=<%=VehicleRegNumber%>&unitid=<%=unitid%>&tpunit=<%=tpunit%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> 
			</td>
		</tr>

		<tr>
			<td> 
				<a href="techspcomment.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
			</td>
		</tr>
		<tr>
		<td> <a href="sendmail.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&vehno=<%=vehregno%>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>
		<tr>
			<td> 
			<%-- <a href="vehexchange.jsp?veh=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transporter=<%=transporter %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange</a> --%>
			<%-- <a href="vehexchange.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&vehno=<%=VehicleRegNumber%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange </a>  --%>
			</td>
		</tr>
		
		<tr>
									<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								
		<tr>
			<td>  
				<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=rst3.getString("VehicleCode")%>&vehregno=<%=VehicleRegNumber%>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Reset Device</a> 
			</td>
		</tr>
	<%
								if(SUPERADMIN.equalsIgnoreCase(userrole)){
								%>
								<tr>
									<td> <a href="reportincident.jsp?vehno=<%=VehicleRegNumber%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
								</tr>
								<%
								}}
							%>
		<tr>
			<td>
				<a href="javascript:toggleDetails(<%=i%>,false);">Close</a>
			</td>
		</tr>
	</table>
	
	
	</div>	
	</td>
		  <td><%=Empname %></td>
	<td><% try{
	out.print(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(rst3.getDate("InstalledDate")));
	}catch(Exception e)
	{
		out.print("-");
	}	
	%></td>
	

	
	<td><%=rst3.getString("InstalledPlace")%> <font color="red"> In Active
	<% if(bg1.equals("red"))
	  { 
		//String remdate="";
		String remdate="", oldunitwith="", withtech="";
		String sql9="";
		
		     sql9="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and InstType='Rem' order by EntDate desc";
		     ResultSet rs9=st9.executeQuery(sql9);	
				if(rs9.next())
				{
					unitid=rs9.getString("OldUnitId");
					remdate=rs9.getString("EntDate");
					oldunitwith=rs9.getString("OldUnitWith");
					withtech=rs9.getString("InstBy");
				}
				else
				{
					String sql11="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' order by InstDate desc limit 1";
						
					ResultSet rs11 = st11.executeQuery(sql11);
					
					if(rs11.next())
					{
						unitid=rs11.getString("NewUnitId");
						oldunitwith="Not Avail";
						//remdate=rs11.getString("EntDate");
					}
				}
				if(oldunitwith.equals("Tech"))
				{
					oldunitwith=withtech;			
				}
				try{
				 //out.print(" <font color='yellow' size='2'> In-Active Unit Removed on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+ " Unit with:"+oldunitwith+"</font>");
				} catch(Exception e)
				{
					// out.print(" <font color='yellow' size='2'>In-Active UNIT REMOVED on (date not available)</font>");			
				}
		
			
			
	  
	 }
	 System.out.println("display of colr");%>
	  </font></td>

	 <%
	String compdate1="", attloc1="", availdate1="", allocatedto1="", desc1="", contpers1="", entby1="", DetDesc1;
	sql="select * from t_complaints1 where VehicleNo='"+rst3.getString("VehicleRegNumber").trim()+"' and Status <> 'Solved' ";
	ResultSet rscomp1=st.executeQuery(sql);
	 System.out.println("displa--->"+sql);
	if(rscomp1.next())
	{
		compdate1=rscomp1.getString("TdyDate");
		attloc1=rscomp1.getString("VehAttLoc");
		availdate1=rscomp1.getString("VehAvailDate");
		allocatedto1=rscomp1.getString("Status");
		desc1=rscomp1.getString("Complaint");
		contpers1=rscomp1.getString("ContDets");
		entby1=rscomp1.getString("RegBy");
		DetDesc1=rscomp1.getString("CDescription");
		
		if(allocatedto1.equals("Allocated") || allocatedto1.equals("Attended"))
		{
			sql="select * from t_callocation1 where Tno='"+rscomp1.getString("Tno")+"' ";
			ResultSet rsallocto1=st01.executeQuery(sql);
			if(rsallocto1.next())
			{
				allocatedto1=rsallocto1.getString("Technicion");
			}
			else
			{
				allocatedto1="Unallocated";
			}
				
		}
	%>
			<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc1 %>&availdate=<%=availdate1 %>&allocatedto=<%=allocatedto1 %>&desc=<%=desc1 %>&contpers=<%=contpers1 %>&entby=<%=entby1 %>&DetDesc=<%=DetDesc1 %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate1))%> </B></td>
	<%		
		}
		else
		{ %>
			<td> No Complaint</td>		
	<%	}
	 System.out.println("step4");
	%> 
	<td align="right"><%=unitid%></td>
		<td align="right"><%=tpunit%></td>
	
	<td align="right"><%=simno%></td>
	
	<td align="right"><%=mobno%></td>
	<td align="right"><%=b%></td>
	<td align="right"><%=stmin%></td>
	<td><%=CodeVersion%></td>
	<td align="right"><%=WMSN%></td>
	<td><%=UnitType%></td>
	<td><%=peripherals %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td><%=typeunit%></td>
	<%
	 }
	%>
	<td><%=simcomp %></td>
	<%
	if(typevalue.equals("transporter")){
		 
	 }else{
	%>
	<td align="right"><%=psno %></td>
	<td align="right"><%=pcbno %></td>
	<td align="right"><%=boxno %></td>
	<td align="right"><%=batteryno %></td>
	<td><%=group1%></td>
	<%
	 }
	
	try{
	%>
	<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%></td>
	
	<%
	}catch(Exception e22)
	{
		
		System.out.println("Exception==>"+e22);
	}
	
	%>
	
	
	<td><%=InstalledPlace%></td>
	
	
	
	<td><%=warranty%></td>
	
		
<td>
	<%			//---------- Last replacement date
	 System.out.println("step5");
	String d1="N.A";
	String d3="";
	System.out.println("Last Replacement date");
  	sql="select * from t_unitreplacement where VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
	ResultSet rsgett=st6.executeQuery(sql);
	if(rsgett.next())
	{
		 d1=rsgett.getString("InstDate");
		 d3=rsgett.getString("InstTime");
		if(d1=="0000-00-00"||d1=="-")
		{
			out.print(d1);
		}
		else
		{
			String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1) );			
			out.print(d2);
		}
	}
	else
	{
		out.print(d1);
	}
	 System.out.println("step6");

	%>
	</td>
	<td></td>
<%
	int spcnt=0,spcnt1=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+rst3.getString("VehicleRegNumber")+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";

//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc";
//System.out.println(sqlsp1);
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
	ResultSet rssp11=stmtsp11.executeQuery(sqlsp1);
while(rssp11.next())
{
	
//System.out.println("INside while");
	spcnt++;
	// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
	
	String cmntype=rssp11.getString("cmmt_type");

	if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
	{
		spcmmnt=rssp11.getString("SpComment");
		extracmnt=rssp11.getString("Extra_comment");
		Entrydt=rssp11.getString("EntDateTime");
		Enteredby=rssp11.getString("EntBy");
		k++;
	}
	//---------------------------------------
	
	//spcnt1=rssp1.getInt("cnt");
}
//System.out.println("OUTside while");
	/*String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' ";
	//out.print(sql10);
	ResultSet rs10=st.executeQuery(sql10);
	while(rs10.next())
	{
		spcnt=rs10.getInt("cnt");	
	}
	spcnt=spcnt+spcnt1;*/
%>
		
		<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=rst3.getString("VehicleRegNumber")%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><font color="black" size="2"> Click (<%=spcnt%>)</font></b></a>  </td>
		<td><%=spcmmnt %></td>
		<td><%=extracmnt %></td>
		<%if(!Entrydt.equals("N.A"))
		{%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
		<%}else{%>
		<td align="right"><%=Entrydt %></td>
		<%} %>
		<td><%=Enteredby %></td>
		
		
		
		</tr>		
		<%
		i++;
		j++;
	}	
		}
	%>
	
		<input type="hidden" name="cntr" value="<%=i%>" />	
<%	
} catch(Exception e)
{
	e.printStackTrace();
}
finally
{
conn.close();
conn1.close();
}
%>
<%
if(typevalue.equals("transporter")){
	
}else{
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
	{ %>	
<tr>
		<td align="center" colspan="38"> 
			<div align="center"> 
			
			<%
			if(Urole.equals("Manager") || Urole.equals("SuperAdmin"))
			{
			%>
			<input type="submit" name="submit" value="Change AMC" class="formElement" onclick="changeAction();"/>
				<%
			}
					%>
				
				
				<input type="submit" name="submit" value="Per Removal" class="formElement" onclick="permremoval();"/>
				 <input type="submit" name="submit" value="Temporary Remove" class="formElement" onclick="tempremoval();"/> 
				 <input type="submit" name="submit" value="Deactivation" class="formElement" onclick="deactive();"/>
				 <input type="submit" name="submit" value="UnitMissing" class="formElement" onclick="unitmissing();"/>
				  <input type="submit" name="submit" value="AddEditEmp" class="formElement" onclick="addeditemp();"/>
				   <input type="submit" name="submit" value="AddGroup" class="formElement" onclick="addgroup();"/>
				   <input type="submit" name="submit" value="DeleteGroup" class="formElement" onclick="deletegroup();"/>
			</div> </td>
	</tr>
<%  } }%>	
	</table>
	 
<input type="hidden" name="transporter" value="<%=transporter %>" />	
	
</table>

<!-- code end here --->
</form>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright ? 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>

</html>