<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

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
	function redirect()
	{
//	alert("in validation");
//	var a=document.unittransfer.cmnt.value;
//	alert(a);
//	var b=document.unittransfer.techlist.value;
//alert(b);
//	if(a=="")
//	{
//		alert("Please enter reason of delay");
//		return false;
//    }
//	else if(b=="Select")
//	{
//		alert("Please select technician");
//		return false;
//   }else{
	var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransfertotechnician.jsp?";
//	alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("tech"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&tech"+i+"="+document.getElementById("tech"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
//    }
	}
	
	function redirect1()
	{
	//alert("in validation");
		var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransferbycourier.jsp?";
	//alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("transp"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&transp"+i+"="+document.getElementById("transp"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
		
	}
	function submitUser(){
			
	       		 var listbox = document.resourceFrm.assigned;
	        		for(var count=0; count < listbox.options.length; count++) {
	            		listbox.options[count].selected = isSelect;
	    	
		}
	        document.resourceFrm.submit();
		}




	function addUser() {
	    var src = document.resourceFrm.resources;
	    var dest = document.resourceFrm.assigned;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function removeUser() {
	    var src =document.resourceFrm.assigned;
	    var dest =  document.resourceFrm.resources;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function show(id)
	{
		//alert(id);
		if(id==0)
		{
			document.getElementById("transfer").style.display="";
			document.getElementById("courierby").style.display='none';
			
		}
		else if(id==1)
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display="";
			
		}
		else
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display='none';
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
<!-- Checking request from tech type or not, and making headers available accordingly-->


<%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
   
    </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
              
<%
Connection con;
Statement st,st1,st2;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt88,stmt7,stmt10,stmt111,stmt13;
Class.forName(MM_dbConn_DRIVER);
con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con.createStatement();
st1=con.createStatement();
stmt1=con.createStatement();
stmt2=con.createStatement();
stmt3=con.createStatement();
stmt4=con.createStatement();
stmt5=con.createStatement();
stmt6=con.createStatement();
stmt88=con.createStatement();
stmt7=con.createStatement();
stmt10=con.createStatement();
stmt111=con.createStatement();
stmt13=con.createStatement();
String userrole=session.getAttribute("userrole").toString();
java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String today=formatter.format(dte);
String updated=request.getParameter("updated");
if(updated==null){
	
}else{
	%>
	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="black"> Selected Unit Id has already been received. </font> </td>
			</tr>
		</table>
	<%
}
String inserted=request.getParameter("inserted");
if(inserted==null){}else{
%>	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>	
		<td align="center"> <font color="black"> Selected Unit Id has already been transfer by courier. </font> </td>
	</tr>
</table>
<%
}

%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="black" size="3"> <b>Unit pending on technician</b></font> 
				</td>
				<td align="right">
					<a href='singleUnitTransferToTechnician.jsp'> <B> Do you know UnitID? </B></a>
				</td>
			</tr>
</table>
<form method="get" name="resourceFrm">

<table width="100%" border="1" cellpadding="4" cellspacing="0" class="std" >
<tr>
	<td valign="top" align="center">
		<table cellspacing="0" cellpadding="2" border="0" bgcolor="#77D7D4">
			<tr>

				<td><font color="black" ><b>Technician</b></font></td>
				<td><font color="black" ><b>Selected technician:</b></font></td>
			</tr>
			<tr>
				<td>
					
<select name="resources" style="width:380px" size="15" id="resources" >
	<%
	
	String sql="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
	ResultSet rs=st.executeQuery(sql);
	int i=0;
	while(rs.next()){
		%>
		<option value="<%=rs.getString("TechName")%>" ><%=rs.getString("TechName")%></option>
		<%
	i++;
	}
	
	%>
</select>
				</td>
				<td>
					
<select name="assigned" style="width:320px" size="15" multiple="multiple">
	
</select>

				</td>
				</tr>
					<tr>
						<td align="right"><input type="button" class="button" value="&gt;" onClick="addUser();" /></td>
						<td align="left"><input type="submit" class="submit" value="submit" onClick="submitUser()" /></td>				
						<td align="left"><input type="button" class="button" value="&lt;" onClick="removeUser()" /></td>					
					</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</form>
	<br></br>
	<form action="" name="unittransfer" method="post">
	
	 
	<%
	String[] assignedtech=request.getParameterValues("assigned");
	String finaltech="";

	if(assignedtech==null){
		
	}else{
	
		%>
		 <table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
		
					<tr>
						<td align="center" colspan="2"> <font color="black" > <b>Pending Units From Replacement/Removed</b></font></td>
					</tr>
	 </table>
		  <table border="1" width="750px" align="center" class="sortable">
	<tr>
		<td></td>
		<td> <b> Sr. No </b> </td>
		<td> <b> Unit Id </b> </td>	
		<td> <b> Unit Type</b> </td>	
		<td><b> Status </b></td>
		<td> <b> Status Date </b> </td>
		<td><b> Veh. Reg No. </b></td>
		<td><b>Customer</b></td>
		<td> <b> Location </b> </td>
		<td> <b> Technician </b> </td>
		<td><b>Old Unit With</b></td>
			
	</tr>
		
		<%
		
		int iii=1;	

		for(int j=0; j<assignedtech.length;j++)
	{
		int ii=assignedtech.length;
			finaltech=assignedtech[j]+","+finaltech;
		//	cominsrt=comm;
			// out.print("===>"+finaltech); 
	
	%>
	
<%

	String sql1="select InstTime,OldUnitID,EntDate,InstType,VehRegNo,OwnerName,InstPlace,InstBy,OldUnitWith from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('tech','"+assignedtech[j]+"') and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') order by EntDate Desc";
	ResultSet rs1=stmt1.executeQuery(sql1);
	//out.print(sql1);
	
	
	//out.print(ouid);
	
	while(rs1.next())
	{
		
		String time=rs1.getString("InstTime");
		String z=new Integer(00).toString();
		if(time==null)
		{
			time=z;
			
		}
		else
		{
			
		}
		//String remdate1=rs3.getString("EntDate");
		//out.print("EntDate");
		String sql2="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate > '"+rs1.getString("EntDate")+"' order by Rdate desc"; 
		//and Transporter='"+transp+"'";
			ResultSet rs2=stmt2.executeQuery(sql2);
		//String ss=rs2.getString("Rdate");
		//out.print(ss);
		//out.print(sql2);
		if(rs2.next())

		{
		}
		else
		{	
			
			
			sql2="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+rs1.getString("OldUnitID").trim()+"' and Rdate = '"+rs1.getString("EntDate")+"' and Rtime > '"+time+"' order by Rdate desc"; 
			//and Transporter='"+transp+"'";
			ResultSet rstime=stmt2.executeQuery(sql2);
			//String ss=rs2.getString("Rdate");
			//out.print(ss);
			//out.print(sql2);
			if(rstime.next())

			{
			}
			else
			{
			
			//out.print(rs2.getString(""));
			
		String sql3="select OldUnitID from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate > '"+rs1.getString("EntDate")+"'";
			ResultSet rs3=stmt3.executeQuery(sql3);
			//out.print(sql3);
			//out.print(sql3);
			if(rs3.next())
			{
				
			}
			
			else
			{	
				
				
				
				
				sql3="select OldUnitID from t_unitreplacement where (OldUnitID='"+rs1.getString("OldUnitID").trim()+"' or NewUnitID='"+rs1.getString("OldUnitID").trim()+"') and EntDate = '"+rs1.getString("EntDate")+"' and InstTime > '"+time+"'";
				ResultSet rsreptime=stmt3.executeQuery(sql3);
				//out.print(sql3);
				//out.print(sql3);
				if(rsreptime.next())
				{
					
				}
				
				else
				{
				//String ss=trim(rs1.getString("OldUnitID"));
			//	String ss=rs1.getString("OldUnitID");
			//String ss1=ss.trim();
				
				String sql4="select UnitID from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate > '"+rs1.getString("EntDate")+"'";
				
				ResultSet rs4=stmt5.executeQuery(sql4);
				//out.print(sql4);
				if(rs4.next())
				{
					
				}
				else
				{
					
					
					sql4="select UnitID from t_unitmasterhistory where UnitID='"+rs1.getString("OldUnitID").trim()+"' and DispDate = '"+rs1.getString("EntDate")+"' and EntTime > '"+time+"' ";
					
					ResultSet rsdtime=stmt5.executeQuery(sql4);
					//out.print(sql4);
					if(rsdtime.next())
					{
						
					}
					else
					{
//		sql5="Select * from t_allconnectedunits where TheDate >'"+rs1.getString("EntDate")+"' order by TheDate Desc ";

						String sql5="Select UnitID from allconnectedunits where UnitID='"+rs1.getString("OldUnitID").trim()+"' and TheDate >'"+rs1.getString("EntDate")+"' and  VehNo <> '-' order by TheDate Desc ";

						ResultSet rs5=stmt6.executeQuery(sql5);
						//out.print(sql5);
						if(rs5.next())
						{
							
						}
						else
						{
							String sql6="select InstType from db_gps.t_unitmaster where UnitID='"+rs1.getString("OldUnitID")+"'";
							ResultSet rs6=stmt6.executeQuery(sql6);
							if(rs6.next()){
								String unittype=rs6.getString("InstType");
								
%>				
						<tr>
						<td> <input type="checkbox" name="disp<%=iii%>" id="disp<%=iii%>" value="disp<%=iii%>" /> </td>
						<td><div align="right"> <%=iii %></div> </td>
						<td><div align="right"> <%=rs1.getString("OldUnitID")%></div> </td>
						<td><div align="left"> <%=unittype%></div> </td>
						<td> <div align="left"><%=rs1.getString("InstType") %></div> </td>
						<td><div align="left"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate"))) %></div> </td>
						<td><div align="left"> <%=rs1.getString("VehRegNo") %></div> </td> 
						<td><div align="left"> <%=rs1.getString("OwnerName") %></div> </td>
						<td><div align="left"> <%=rs1.getString("InstPlace") %></div> </td>
						<td><div align="left"> <%=rs1.getString("InstBy") %></div> </td>
						<td> <div align="left"><%=rs1.getString("OldUnitWith") %>
						<input type="hidden" name="unitid<%=iii%>" id="unitid<%=iii%>" value="<%=rs1.getString("OldUnitID")%>" />
						<input type="hidden" name="tech<%=iii%>" id="tech<%=iii%>" value="<%=assignedtech[j]%>" />
						<input type="hidden" name="transp<%=iii%>" id="transp<%=iii%>" value="<%=rs1.getString("OwnerName")%>" />
						
						</div>
						</td>
						</tr>
						
						
	
<%	
							}iii++;
						}
					}
				}
				}
				
				}
			}
			
		}

	}
	
//--------------------------FOR DISPATCH----------------------------//	
	}
	%>
	</table>
	
	<br></br>
	<table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
		
					<tr>
						<td align="center" colspan="2"> <font color="black" > <b>Pending Units From Dispatches/Transform</b></font></td>
					</tr>
	 </table>
	 <br></br>
	 <table border="1" width="750px" align="center" class="sortable">
		<tr>
			<td></td>
			<td> <b> Sr. No </b> </td>
			<td> <b> Unit Id </b> </td>	
			<td> <b> Unit Type</b> </td>	
			<td><b> Status </b></td>
			<td> <b> Disp Date </b> </td>
			<td><b> Unit Type </b></td>
			<td> <b> Dispatch Location </b> </td>
			<td><b>Mode Of Dispatch</b></td>
			<td><b>Docket No.</b></td>
			<td> <b> Chalan No </b> </td>
			<td><b>Dispatch From</b></td>
			<td><b>Tech</b></td>
		</tr>
	
	<%
	for(int j=0; j<assignedtech.length;j++)
	{
		String sql66="select Reqno,Reqto from db_CustomerComplaints.t_unitorder where Tech like '"+assignedtech[j]+"' and Status <> 'Open' order by ReqDate desc ";
		//out.println(sql66);
		ResultSet rs66=stmt4.executeQuery(sql66);
		 	
		 while(rs66.next())
		 {
			//i++;
			 String orderno=rs66.getString("Reqno");
			// out.println(orderno);
			//out.print("Pending Units From Dispatches");

				
				String sql77="select RecByCust,typeunit,UnitId,EntTime,RecByCust,EntTime,DispDate,DisAdd,ModeofDispatch,DisName,ChalanNo from t_unitmasterhistory where OrderNo='"+orderno+"' group by UnitID";
				//System.out.println("sql77"+sql77);
				ResultSet rs77=stmt7.executeQuery(sql77);
				
				while(rs77.next())
				{
					
					//out.print(rs77.getString("UnitId"));
					String received=rs77.getString("RecByCust");
					String tme=rs77.getString("EntTime");
					String z=new Integer(00).toString();
					if(tme==null)
					{
						tme=z;
						
					}
					else
					{
						
					}
					//out.print("Pending Units From Dispatches");

		/*
					if(received.equals("Yes"))
					{ 
			*/			
					
								
					String sql88="select oldunitid from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate > '"+rs77.getString("DispDate")+"' or EntDate > '"+rs77.getString("DispDate")+"') and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') order by EntDate Desc";
					ResultSet rs88=stmt88.executeQuery(sql88);
				System.out.print(sql88);
					
					if(rs88.next())
					{
					
					}
					else
					{
			
						sql88="select oldunitid from t_unitreplacement where NewUnitID='"+rs77.getString("UnitId")+"' and (InstDate = '"+rs77.getString("DispDate")+"' or EntDate = '"+rs77.getString("DispDate")+"') and InstTime > '"+tme+"' and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') order by EntDate Desc";
						ResultSet reurep=stmt88.executeQuery(sql88);
						System.out.print(rs77.getString("UnitId"));
						
						if(reurep.next())
						{
						
						}
						else
						{
						
							String sql10="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate > '"+rs77.getString("DispDate")+"' order by Rdate desc"; 
							ResultSet rs10=stmt10.executeQuery(sql10);
							if(rs10.next())

							{
							}
							else
							{
								
								
								sql10="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+rs77.getString("UnitId").trim()+"' and Rdate = '"+rs77.getString("DispDate")+"' and Rtime > '"+tme+"' order by Rdate desc"; 
								ResultSet rsurcv=stmt10.executeQuery(sql10);
								
								if(rsurcv.next())

								{
								}
								else
								{	
								
																
								String sql111="select OldUnitID from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate > '"+rs77.getString("DispDate")+"'";
								ResultSet rs111=stmt111.executeQuery(sql111);
								
								if(rs111.next())
								{
									
								}
								
								else
								{
									
									
									sql111="select OldUnitID from t_unitreplacement where (OldUnitID='"+rs77.getString("UnitId").trim()+"' or NewUnitID='"+rs77.getString("UnitId").trim()+"') and EntDate = '"+rs77.getString("DispDate")+"' and InstTime > '"+tme+"' ";
									ResultSet rsurep=stmt111.executeQuery(sql111);
									
									if(rsurep.next())
									{
										
									}
									
									else
									{
								
									
									String sql12="select UnitID from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate > '"+rs77.getString("DispDate")+"'";
									
									ResultSet rs12=stmt5.executeQuery(sql12);
									//out.print(sql12);
									if(rs12.next())
									{
										
									}
									else
									{
										
									
										sql12="select UnitID from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and EntTime > '"+tme+"'";
										
										ResultSet rsumh=stmt5.executeQuery(sql12);
										//out.print(sql12);
										if(rsumh.next())
										{
											
										}
										else
										{
											String sql122="select UnitID,InstType from t_unitmasterhistory where UnitID='"+rs77.getString("UnitId").trim()+"' and DispDate = '"+rs77.getString("DispDate")+"' and EntTime = '"+tme+"'";
											
											ResultSet rsumh1=stmt5.executeQuery(sql122);
											//out.print(sql12);
											if(rsumh1.next())
											{
												
																				
											String sql13="Select UnitID from allconnectedunits where UnitID='"+rs77.getString("UnitId").trim()+"' and TheDate >'"+rs77.getString("DispDate")+"' and VehNo <> '-'order by TheDate Desc ";
											ResultSet rs13=stmt13.executeQuery(sql13);
											//out.print(sql13);
											if(rs13.next())
											{
												
											}
											else
											{											
												
%>								
											<tr>
											<td> <input type="checkbox" name="disp<%=iii%>" id="disp<%=iii%>" value="disp<%=iii%>" /> </td>
											<td> <div align="right"><%=iii%></div> </td>
											
											<td><div align="right"> <%=rs77.getString("UnitId")%></div> </td>
											<td><div align="left"> <%=rsumh1.getString("InstType")%></div> </td>
											<td><font><div align="left"> OK</div> </font></td>
											<td><div align="left"> <%=rs77.getString("DispDate")%></div> </td>
											<td><div align="left"> <%=rs77.getString("typeunit") %></div> </td>
											<td> <div align="left"><%=rs77.getString("DisAdd") %></div> </td>
											<td> <div align="left"><%=rs77.getString("ModeofDispatch") %></div> </td>
											<td><B><div align="left"> <%=rs77.getString("DisName") %></div> </B></td>
											<td><div align="right"> <%=rs77.getString("ChalanNo")%></div> </td>
											<td> <div align="left"> <%=rs66.getString("Reqto")%></div> </td>
											<td> <div align="left"><%=assignedtech[j]%> 
											
											<input type="hidden" name="unitid<%=iii%>" id="unitid<%=iii%>" value="<%=rs77.getString("UnitId")%>" />
											<input type="hidden" name="tech<%=iii%>" id="tech<%=iii%>" value="<%=assignedtech[j]%>" />
												<input type="hidden" name="transp<%=iii%>" id="transp<%=iii%>" value="-" />
											
											</div>
											</td>
											</tr>
				<%	
											iii++;
				System.out.println(iii);
											}
											}
										}
									}
									//}
									}
								}
								}
								}
							}
						}
					}
	}
	}
		String sqltech="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
		ResultSet rstechname=stmt2.executeQuery(sqltech);
%>
<input type="hidden" name="cntr" value="<%=iii%>" />	
</table>	 
<br></br>
<table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
		
					<tr>
						<td align="center" colspan="2"> <font color="black" > <b>Transfer By </b></font> 
									<input type="radio" name="transferby" value="techorcust" onclick="show(0);"> <font color="black" ><b>Tech or Cust</b></font>
						 			<input type="radio" name="transferby" value="courier" onclick="show(1);"><font color="black" ><b>Courier</b> </font>
						 </td>
					</tr>
	 </table>
	 <br></br>
	<table>
		<tr id="transfer" style="display:none"><td>
		<%
		//coding for internal transfer 
		%> 
		  <table border="1" width="750px" align="center" class="sortable">
			 <tr bgcolor="#77D7D4" align="center">
				<td colspan="2">
					<font color="black"><b>Internal Transfer Form</b></font>
				</td>
			</tr>
			<tr>
				<td>  <B>Tech:</B> 
					<select name="techlist" > 	
						<option value="Select">Select</option>	
<%
						while(rstechname.next())
						{ %>
							<option value="<%=rstechname.getString("TechName")%>"><%=rstechname.getString("TechName")%></option>
<%						}
%>
							
	    		     </select> 
<%	
						if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
						{
%>
							&nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
						String sqltrans="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
						ResultSet rstransname=stmt3.executeQuery(sqltrans);
%>						      
						 <B>Cust:</B> <select name="custlist"> 	
								<option value="Select">Select</option>
								<%
									while(rstransname.next())
									{ %>
										<option value="<%=rstransname.getString("cust")%>"><%=rstransname.getString("cust")%></option>
<%									}
%>
								</select>	
<%									
}
%>

							</td>
						  </tr>   
						  
						     <tr>
						     <td align="center">
						 <B> Transfer as: </B><input type="radio" name="unittype" value="Okay"> Okay
						 			<input type="radio" name="unittype" value="Faulty">Faulty
						</td>
					</tr>
					<tr>
						<td align="center"> <B> Comment: </B> <textarea name="cmnt"> </textarea> </td>
					</tr>
					<tr>
						<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer"  onclick="redirect();" /> </td>
					</tr>
				</table>
				</td></tr>
				
				
				
				
				<tr id="courierby" style="display:none"><td>
				
				  <table border="1" width="750px" align="center" class="sortable">
					<tr bgcolor="#77D7D4" align="center">
					<td colspan="2"><font color="black"><b>Courier Form</b></font></td>
					</tr>
					<tr>
						<td>  <B>Courier :</B> <select name="courierlist" > 	
						<option value="Select">Select</option>	
<%
						String sqltech1="select distinct(value) as courier from db_CustomerComplaints.t_dropdown where dropdown='CourierTransfer' order by value asc";
						ResultSet rstechname1=stmt2.executeQuery(sqltech1);
						while(rstechname1.next())
						{ %>
							<option value="<%=rstechname1.getString("courier")%>"><%=rstechname1.getString("courier")%></option>
<%						}
%>
							
						     </select> 
							</td>
						 
						     <td align="center">
						 <B>Courier Account: </B>
						 	<input type="radio" name="unittype" value="Transworld">Transworld
						 	<input type="radio" name="unittype" value="Customer">Customer
						 	<input type="radio" name="unittype" value="Technician">Technician
						</td>
					</tr>
					<tr>
					<td><b>Book Date :</b>
						<input type="text" id="calender" name="calender" size="13" value="<%=today %>" readonly/>
            			 <script type="text/javascript">
           					  Calendar.setup(
          					   {
          					       inputField  : "calender",         // ID of the input field
          					       ifFormat    : "%Y-%m-%d",     // the date format
          					       button      : "trigger"       // ID of the button
          					   }
                           );
           				  </script>
           				  <%
           				String tm="";
           				 java.util.Date tdydate = new java.util.Date();
           				Format formatter11 = new SimpleDateFormat("HH:mm:ss");
           				tm=formatter11.format(tdydate);
           				  %>
           				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Time :</b> &nbsp;&nbsp;<input type="text" name="rtime" size="10" value="<%=tm%>" readonly>
					</td>
					<td><b>Pickup Date :</b>
					<input type="text" id="calender1" name="Calender1" size="13" value="<%=today %>" readonly/>
            			 <script type="text/javascript">
           					  Calendar.setup(
          					   {
          					       inputField  : "calender1",         // ID of the input field
          					       ifFormat    : "%Y-%m-%d",     // the date format
          					       button      : "trigger1"       // ID of the button
          					   }
                           );
           				  </script>
					</td>
					</tr>
					<tr>
						<td align="center"> <B> Pickup Delay Reason: </B> <textarea name="rsndelay"> </textarea> </td>
						<td align="center"> <B>Booking Ref No: </B>	<input type="text" id="refno" name="refno" size="13" /></td>
					</tr>
					<tr>
						<td align="center"> <B> Comment:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				  &nbsp;&nbsp;&nbsp; </B> <textarea name="comment"> </textarea> </td>
						<td align="center"> <B>Courier DC No: </B>	<input type="text" id="courierdcno" name="courierdcno" size="13" /></td>
					</tr>
					<tr>
						<td> <b>Tech Name :</b>
	   						<select name="techname">
          					    <option value="Select">Select</option>
<% 
	  							 String sqltech11="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
								 ResultSet rstechname11=stmt2.executeQuery(sqltech11);
								 while(rstechname11.next())
   	   							{ 
%>
      							<option value="<%=rstechname11.getString("TechName") %> "> <%=rstechname11.getString("TechName") %> </option>
<% 
								} 
%>

      							<option value="Customer">Customer</option>
	   						 </select>
		
						</td>
   						<td> <b> Location :</b>
	 					  <select name="locname">
          				    <option value="Select">Select</option>
<%
 							 sql="select Distinct(LName) from db_CustomerComplaints.t_location order by LName";
							 ResultSet rst2=stmt3.executeQuery(sql);
  							 while(rst2.next())
  { %>
     <option value="<%=rst2.getString("LName") %>"> <%=rst2.getString("LName") %> </option>
<% } %>
     
	    </select>
		
	</td>
     
     
   </tr>
   <tr>
	<td>  <b>Status of Unit:</b>
	        <input type=radio name="radio2" value="Defective" checked>  Defective 
		<input type=radio name="radio2" value="Ok" > New
		<input type=radio name="radio2" value="Service Unit" > Service Unit 
	</td>
	 <td><b>DC NO: </b> <input type="text" name="dcno" /> </td>
  </tr>
					<tr>
						<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer"  onclick="redirect1();" /> </td>
					</tr>
				</table>
				</td></tr>
				</table>
				
				<%
	}	
	
%>

	
	
	
	
	

	</form>
	
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>