
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
String userrole1="";
%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>

<html>
<head>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<script language="javascript">
 			function validate()
  			{
                           var v1=document.unit.data.value;
                           var validChar='0123456789';   // legal chars
                           var   strlen=v1.length;       // test string length
                          
                           if(strlen==0||strlen>20)
                               {
                               //    alert("Invalid Unit ID length" );
                               //    return false;
                               }
                               
                               v1=v1.toUpperCase(); // case insensitive
                                                             

                           for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
                                {
                                    
                                    if(validChar.indexOf(v1.charAt(ic))<0)
                                        {		
                                            alert("please enter a valid Unit ID!");
                                            return false;
                                        }
                                } // end scanning
                           return true;       
                        }
  				
		
 			function ShowHide(id)
 			{
 				if(id==0)
 				{
 					document.getElementById("uid").style.display="";
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==1){
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display="";
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==2)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display="";
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}
 				else if(id==3)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display="";
 					document.getElementById("submitbutton").style.display="";
 				}else{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display='none';
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
<P></p>
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
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 



<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
    Statement stwmsn=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn.createStatement();
    st3=conn1.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();




%>


 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">UNIT HISTORY DETAIL. </font></td></tr>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#77D7D4" align="center">
		<tr>
			
		<td> 
				<input type="radio" name="dataFilter" value="unit"
				  onClick="ShowHide(0);" CHECKED> <font color="black" size="2" >UnitID</font>	
				<input type="radio" name="dataFilter" value="wmsn" 
				 onClick="ShowHide(1);"><font color="black" size="2">WMSN No </font>	
				<input type="radio" name="dataFilter" value="sim" 
				 onClick="ShowHide(2);"> <font color="black" size="2">SIM No </font>	
				 <input type="radio" name="dataFilter" value="mobile" 
				 onClick="ShowHide(3);"> <font color="black" size="2">Mobile No </font>
				 
			</td>
		</tr>
		<tr id="uid">
	        <td><font color="black" size="2"><b>Unit ID </b></font>
	             <input type="text" id="data" name="data" size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="wmsn" style="display:none">
	        <td><font color="black" size="2"><b>WMSN No  </b></font>
	             <input type="text" id="wmsnno" name="wmsnno"  size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="sim" style="display:none">
	        <td><font color="black" size="2"><b>SIM No </b></font>
	             <input type="text" id="sim" name="sim"  size="20"/>
	            
	        </td>
	   </tr>
	   <tr id="mobile" style="display:none">
	        <td><font color="black" size="2"><b>Mobile No </b></font>
	             <input type="text" id="mobile" name="mobile"   size="20"/>
	            
	        </td>
	   </tr>
	        <tr id="submitbutton">
			<td align="center" >
				<input type="submit" name="submit" id="submit" value="submit"  />
			</td>
		</tr>
	</table>
</form>


<%
String dd=request.getQueryString();
if(dd==null)
{
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
<tr><td align="center">
<font color="black"><b>Please enter the Unit ID to display the Unit History Report</b></font>
</td></tr>
</table>

<%
}
else
{
data1=request.getParameter("data");
String dataFilter=request.getParameter("dataFilter");
System.out.println(dataFilter);

%>

<br></br>
			 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
				<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3">Unit History Report for Unit ID&nbsp;<%=data1%></font></div>
						<div align="right">
						<a href="MISunithistoryexcel.jsp?data1=<%=data1%>" title="Export to Excel">
						<img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
						<font color="black" size="2"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
						</font></div>
					</td>
				</tr>
			</table>
			
			<br>
<%
if("unit".equalsIgnoreCase(dataFilter)){    
sql="select * from t_unitmasterhistory where UnitID='"+data1+"' order by EntDate asc";
                        ResultSet rst1=st.executeQuery(sql);
                        int i=1;
                    

                        
%>

			<table width="100%" border="2" align="center" class="sortable">
				<tr><th  colspan="13" bgcolor="#77D7D4"> <font color="black">Unit History</font></th></tr>
				<tr>
					<td><font color="black"> Sr.</font></td>
					<td><font color="black"> Date</font></td>
           			<td><font color="black"> Unit ID</font></td>
					<td><font color="black"> Sim No</font></td>
					<td><font color="black"> Mobile No</font></td>
					<td><font color="black"> InstallationType</font></td>
					<td><font color="black"> WMSN</font></td>
					<td><font color="black"> PS No</font></td>
					<td><font color="black"> PCB No</font></td>
					<td><font color="black"> Box No</font></td>
					<td><font color="black"> Battery No</font></td>
					<td><font color="black"> SimCompany</font></td>
            		<td><font color="black"> Module</font></td>
            		<td><font color="black"> GPS</font></td>
            		<td><font color="black"> Unit Type</font></td>
            		<td><font color="black"> Software Version</font></td>
            		<td><font color="black"> Peripherals</font></td>
            		<td><font color="black"> Status</font></td>
            		<td><font color="black"> FirmwareChanged </font></td>
            		<td><font color="black"> ModulePCBChanged </font></td>
            		<td><font color="black"> PCBmodification </font></td>
            		<td><font color="black"> PowerSupplyChanged </font></td>
            		<td><font color="black"> GPSMouseChanged </font></td>
            		<td><font color="black"> GSMAntennaChanged </font></td>
            		<td><font color="black"> SoftwareSimCorrections </font></td>
            		<td><font color="black"> OtherCorrections </font></td>
            		<td><font color="black"> Ent. By </font></td>  
                </tr>
                       	

                         <% while(rst1.next())
                         {
                        %>	
				<tr>
                    <td class="bodyText"><div align="left"><%=i%></div></td>
						<%
					    try{
                        %>
                    <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("EntDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                    <td class="bodyText"><div align="left"><%=rst1.getString("UnitID")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("SimNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("MobNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("InstType")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("WMSN")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("PSNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("PCBNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("BoxNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("BatteryNo")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("SimCompany")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("Module")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("GPS")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("typeunit")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("SwVer")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("Peripherals")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("Status")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("FirmwareChanged")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("ModulePCBChanged")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("PCBmodification")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("PowerSupplyChanged")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("GPSMouseChanged")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("GSMAntennaChanged")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("SoftwareSimCorrections")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("OtherCorrections")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("EntBy")%></div></td>
                  </tr>
                       
                        <%
                          i++;
                          }
                        
                         %>
                     
                        </table>
			

                        <br>
                         <%
                          sql1="select * from t_unitreplacement where NewUnitID='"+data1+"'order by EntDate asc";
                        ResultSet rst2=st1.executeQuery(sql1);
                        int j=1;
                    

                       
%>

						<table width="100%" border="1" align="center" class="sortable" >
							<tr><th class="hed" colspan="20" bgcolor="#77D7D4"><font color="black">New Unit Installations</font></th></tr>
						
							<tr>
								<td class="hed"><font color="black"> Sr.</font></td>
								<td class="hed"><font color="black"> Date</font></td>
                      		    <td class="hed"><font color="black"> Installation Time</font></td>
                                <td class="hed"><font color="black">Vehical No.</font></td>
			                    <td class="hed"><font color="black"> Transporter</font></td>
			                    <td class="hed"><font color="black"> Installation type</font></td>
		                    	<td class="hed"><font color="black"> Old Unit ID</font></td>
		                    	<td class="hed"><font color="black"> New Unit ID</font></td>
                            	<td class="hed"><font color="black"> Installation By</font></td>
                                <td class="hed"><font color="black"> Installation Place</font></td>
								<td class="hed"><font color="black"> Entry By</font></td>
								<td class="hed"><font color="black"> Sim No.</font></td>
                        		<td class="hed"><font color="black"> Mobile No.</font></td>
                      			<td class="hed"><font color="black">Type Unit </font></td>
                        		<td class="hed"><font color="black"> Voice Call No.1 </font></td>
								<td class="hed"><font color="black"> Voice Call No.2</font></td>
                 		        <td class="hed"><font color="black"> Old Unit Damaged</font></td>
								<td class="hed"><font color="black"> New Unit Run On</font></td>
                 		        <td class="hed"><font color="black"> Old Unit With</font></td>
								<td><font color="black">Entry Date</font> </td>
                     	   </tr>
                       	

                         <% while(rst2.next())
                         {
                            %>	
							<tr>
                        		<td class="bodyText"><div align="left"><%=j%></div></td>
			 <%
                        try{
                            %>
               			        <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("InstDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                     		   <td class="bodyText"><div align="left"><%=rst2.getString("InstTime")%></div></td>
		        			   <td class="bodyText"><div align="left"><%=rst2.getString("VehRegNo")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("OwnerName")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("InstType")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("OldUnitID")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("NewUnitID")%></div></td>
                        	   <td class="bodyText"><div align="left"><%=rst2.getString("InstBy")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("InstPlace")%></div></td>
                        	   <td class="bodyText"><div align="left"><%=rst2.getString("EntBy")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("SimNo")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("MobNo")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("TypeUnit")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("VoiceCallNo1")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("VoiceCallNo2")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("OldUnitDamaged")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("NewUnitRunOn")%></div></td>
							   <td class="bodyText"><div align="left"><%=rst2.getString("OldUnitWith")%></div></td>
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("EntDate"))%></font></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                               
			</tr>	
			<%
                          j++;
                          }
                        
                         %>
                        </table>
			

                        <br>

			<!-- body part come here -->
                      <%
                          sql2="select * from t_unitreceived where UnitID="+data1+" and Rcevd<>'Partially' order by Rdate asc";
                        ResultSet rst3=st2.executeQuery(sql2);
                        int k=1;
                        
                            
                         %>


                        <table width="100%" border="1" align="center" class="sortable">
							<tr><th class="hed" colspan="14" bgcolor="#77D7D4"><font color="black">Units Received</font></th></tr>
							<tr>
								<td class="hed"><font color="black"> Sr.</font></td>
								<td class="hed"><font color="black"> Date</font></td>
                   			    <td class="hed"><font color="black"> Time</font></td>
                       			<td class="hed"><font color="black"> Receive From </font></td>
								<td class="hed"><font color="black"> Courier</font></td>
            		            <td class="hed"><font color="black"> Courier DC No</font></td>
								<td class="hed"><font color="black"> Unit Type </font></td>
								<td class="hed"><font color="black"> Unit ID</font></td>
         		                <td class="hed"><font color="black"> Transporter</font></td>
           		                <td class="hed"><font color="black"> Location</font></td>
                   		        <td class="hed"><font color="black"> Faulty</font></td>
                  		        <td class="hed"><font color="black"> Technician Name</font></td>
                  		        <td class="hed"><font color="black"> Entred By</font></td>
                  		        <td class="hed"><font color="black"> DC_NO</font></td>
                   	    	</tr>
  
                         <% while(rst3.next())
                         {
                        %>	
							<tr>
                        		<td class="bodyText"><div align="left"><%=k%></div></td>
                         <%
                        try{
                            %>
                      		    <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("Rdate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        		<td class="bodyText"><div align="left"><%=rst3.getString("Rtime")%></div></td>
                  				<td class="bodyText"><div align="left"><%=rst3.getString("ReceiveFrom")%></div></td>
								<td class="bodyText"><div align="left"><%=rst3.getString("Courier")%></div></td>
                    		    <td class="bodyText"><div align="left"><%=rst3.getString("CourierDCNo")%></div></td>
								<td class="bodyText"><div align="left"><%=rst3.getString("Utype")%></div></td>
                     		    <td class="bodyText"><div align="left"><%=rst3.getString("UnitID")%></div></td>
                       			<td class="bodyText"><div align="left"><%=rst3.getString("Transporter")%></div></td>
                       			<td class="bodyText"><div align="left"><%=rst3.getString("Location")%></div></td>
                      			<td class="bodyText"><div align="left"><%=rst3.getString("Faulty")%></div></td>
                       			<td class="bodyText"><div align="left"><%=rst3.getString("TechName")%></div></td>
                       			<td class="bodyText"><div align="left"><%=rst3.getString("EntBy")%></div></td>
                       			<td class="bodyText"><div align="left"><%=rst3.getString("DC_NO")%></div></td>
                      		</tr>	
			<%
                          k++;
                          }
                         
                         %>	
					</table>
			
                        <br>
			<%
                          sql3="select * from t_unitmasterhistory where UnitId='"+data1+"' and Status in ('Dispatched','InterDisp') order by DispDate asc";
                        ResultSet rst4=st3.executeQuery(sql3);
                        int n=1;
                        
                        %>
 					<table width="100%" border="1" align="center" class="sortable">
						<tr><th class="hed" colspan="12" bgcolor="#77D7D4"><font color="black">Units Dispatched</font></th></tr>
						<tr>
							  <td class="hed"> Sr.</td>
                      		  <td class="hed"><font color="black"> Dispatch Date</font></td>
                       		  <td class="hed"><font color="black"> Unit ID</font></td>
                        	  <td class="hed"><font color="black"> Dispatch Address</font></td>
                        	  <td class="hed"><font color="black"> Order No</font></td>
                              <td class="hed"><font color="black"> Mode of Dispatch</font></td>
                              <td class="hed"><font color="black"> Dispatch Name</font></td>
                              <td class="hed"><font color="black"> Courier Date</font></td>
                              <td class="hed"><font color="black"> Chalan No.</font></td>
                              <td class="hed"><font color="black"> Dispatch Id</font></td>
                              <td class="hed"><font color="black"> User</font></td>
                              <td class="hed"><font color="black"> Entry By</font></td>
                              <td class="hed"><font color="black"> Status</font></td>
                        </tr>
                       	
                         
                          <% while(rst4.next())
                         {
                        %>	
						<tr>
                       		   <td class="bodyText"><div align="left"><%=n%></div></td>
			
                    
                                               
                         <%
                        try{
                            %>
                        	  <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("DispDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                      		  <td class="bodyText"><div align="left"><%=rst4.getString("UnitID")%></div></td>     
                        	  <td class="bodyText"><div align="left"><%=rst4.getString("DisAdd")%></div></td>
                              <td class="bodyText"><div align="left"><%=rst4.getInt("OrderNo")%></div></td>
							  <td class="bodyText"><div align="left"><%=rst4.getString("ModeofDispatch")%></div></td>
							  <td class="bodyText"><div align="left"><%=rst4.getString("DisName")%></div></td>
                        
                         <%
                        try{
                            %>
                              <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("CourierDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
			                  <td class="bodyText"><div align="left"><%=rst4.getString("ChalanNo")%></div></td>
			                  <td class="bodyText"><div align="left"><%=rst4.getInt("DispId")%></div></td>
                              <td class="bodyText"><div align="left"><%=rst4.getString("User")%></div></td>
                              <td class="bodyText"><div align="left"><%=rst4.getString("EntBy")%></div></td>
			    		      <td class="bodyText"><div align="left"><%=rst4.getString("Status")%></div></td>
			               </tr>	
			<%
                          n++;
                          }
                               
			%>
                        
					</table>
					<br></br>
					<%
					String sqlquicktest="select * from hwunittest where UnitID='"+data1+"'";	
					ResultSet rsQuickTest=stQuickTest.executeQuery(sqlquicktest);
					int a=0;
					%>
					<table width="100%" border="2" align="center" class="sortable">
				<tr><th  colspan="13" bgcolor="#77D7D4"><font color="black">Quick Test History</font></th></tr>
				<tr>
					<td><font color="black"> Sr.</font></td>
					<td><font color="black"> TheDate</font></td>
           			<td><font color="black"> TheTime</font></td>
					<td><font color="black"> Cust</font></td>
					<td><font color="black"> UnitID</font></td>
					<td><font color="black"> AVLPcbVer</font></td>
					<td><font color="black"> PowPcbVer</font></td>
					<td><font color="black"> WMSN</font></td>
            		<td><font color="black"> Module</font></td>
            		<td><font color="black"> Firmware</font></td>
            		<td><font color="black"> RLED</font></td>
            		<td><font color="black"> GLED</font></td>
            		<td><font color="black"> PowerSupply</font></td>
            		<td><font color="black"> PCBModReq</font></td>
            		<td><font color="black"> PCBMod </font></td>
            		<td><font color="black"> GLEDBlink </font></td>
            		<td><font color="black"> SWswver </font></td>
            		<td><font color="black"> SWComment </font></td>
            		<td><font color="black"> SWDebitNote </font></td>
            		<td><font color="black"> User </font></td>
            		<td><font color="black"> Peripheral type. </font></td>
            		<td><font color="black"> ManufactBy </font></td>
            		<td><font color="black"> Correctiondone</font></td>  
                </tr>
                       	

                         <% while(rsQuickTest.next())
                         {
                        %>	
				<tr>
                    <td class="bodyText"><div align="left"><%=a%></div></td>
						<%
					    try{
                        %>
                    <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rsQuickTest.getDate("TheDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("TheTime")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("Cust")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("UnitID")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("AVLPcbVer")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("PowPcbVer")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("WMSN")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("Module")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("Firmware")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("RLED")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("GLED")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("PowerSupply")%></div></td>
					<td class="bodyText"><div align="left"><%=rsQuickTest.getString("PCBModReq")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("PCBMod")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("GLEDBlink")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("SWswver")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("SWComment")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("SWDebitNote")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("User")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("Peritype")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("ManufactBy")%></div></td>
                    <td class="bodyText"><div align="left"><%=rsQuickTest.getString("Correctiondone")%></div></td>
                  </tr>
                       
                        <%
                          a++;
                          }
                         %>
                         </table>
                         <%
}else if("wmsn".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>WMSN number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String wmsn1=request.getParameter("wmsnno");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where WMSN='"+wmsn1+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
						
}else if("sim".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>SIM number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String sim=request.getParameter("sim");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where SimNo='"+sim+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
}else if("mobile".equalsIgnoreCase(dataFilter)){
	%>
	<table width="100%" border="2" align="center" class="sortable">
	<tr><td><b>Mobile number is in following unitid.Please check one UnitID to display MIS unit report of that perticular unit</b></td></tr>
	<%
	
	String mobile=request.getParameter("mobile");
	String sqlwmsn="select Distinct(UnitID) as UnitID from t_unitmasterhistory where MobNo='"+mobile+"'";
	System.out.println(sqlwmsn);
	ResultSet rswmsn=stwmsn.executeQuery(sqlwmsn);
	while(rswmsn.next()){
		%>
			<tr><td><a href="#" onClick="window.open ('MISunithistory.jsp?dataFilter=unit&data=<%=rswmsn.getString("UnitID")%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rswmsn.getString("UnitID")%></a></td>
			</tr>
		
		
		<%
	}
	%>
	</table>
						<%
}else{
	
}
                         %>
                     
                        
			
<%
}}catch(Exception e)
{
    out.print("Exception -->"+e);

}
finally
{
    conn.close();
    conn1.close();

}
%>
<table width="750px" height="350px">
	<tr>
		<td></td>
	</tr>
</table>

<!-- code end here ---></div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright © 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>
