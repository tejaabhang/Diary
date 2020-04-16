<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,today,olddate,username,userrole,thename;
String fromdate,todate,caller;
%>
<<script type="text/javascript">
function gotoPrint(divName)  
{  
	  
	  var printContents = document.getElementById(divName).innerHTML; 
	  var originalContents = document.body.innerHTML; 
	  document.body.innerHTML = printContents;  
	  window.print();
	  document.body.innerHTML = originalContents;  
}


function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
          document.form1.action ="excel.jsp";
          document.forms["form1"].submit();
} 

</script>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
	function fun2()
	{	
		document.form1.submit();
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
          <%@ include file="header1.jsp" %>
          </div>
                   
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds +7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
caller=request.getParameter("tech");
fromdate=request.getParameter("fromdate");
todate=request.getParameter("todate");
String loop_insp="",techname="";
loop_insp=request.getParameter("loop");
techname=request.getParameter("tech");
//System.out.println("loop_insp---->"+loop_insp);
//System.out.println("techname->>>--->"+techname);
//System.out.println("fromdate->>>--->"+fromdate);
//System.out.println("todate->>>--->"+todate);
String techo="",tk="",tk1="",token2="",tk13="",tech11="",repname="",p="",regby="";
tk=request.getParameter("tk");
token2=request.getParameter("token2");
tk13=request.getParameter("tk13");
tk1=request.getParameter("tk1");
repname=request.getParameter("repname");
//System.out.println("repname->>>--->"+repname);
regby=request.getParameter("regby");
//p=request.getParameter("p");
//System.out.println("p->>>--->"+p);
//System.out.println("regby->>>--->"+regby);

//ResultSet rst1=null;
//System.out.println("tk->>>--->"+tk);
//System.out.println("token2->>>--->"+token2);
//System.out.println("tk13->>>--->"+tk13);
//System.out.println("tk1->>>--->"+tk1);
//String totaltoken="";
 //totaltoken=tk+","+token2+","+tk13+","+tk1;

 //tech11=request.getParameter("tech11");

 ////System.out.println("tech11->>>--->"+tech11);


try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	
	thename=request.getParameter("radio1");
	if(null==thename)
	{
	
	thename="ALL";
	}
	
	
	%>
	
	<form name="form1" id="form1" action="" method="post">
			<div id="table1">	
	<%
	
	 String exportFileName="Reinspection.xls";  
	
	%>
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           </div>






	<%
if(!(null==thename))
{
	if(thename.equals("ALL"))
	{ %>
	
		
		 	
		
		<%
		if(loop_insp.equals("lp1"))
	{
	%>	
		
	
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Inspection Details for  <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
	
	
	
	<table border="1" width="750px" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Techician</b></td>
	<td><b>Ticket No</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
		
	//sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet Insp=st1.executeQuery(sql);
	////System.out.println("sql---->" +  sql);
	//String  token =""; 
	//int  cnt2 =0;
         
        	  
        	
			  
          String lp1="";
	lp1=tk.replace(" ","");
	String[] tokenlp1=tk.split(",");
	int lp11;
	//System.out.println("tokenlp1--OF LP!!!!!!!!!!!!!11111-->" + tokenlp1.length);
	int i=1;
	for(lp11=0;lp11<tokenlp1.length;lp11++){
        
		  
		
		
		sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and  '"+todate+"' and  Technicion = '"+caller+"'  order by DofAllocation  ";
		ResultSet Inspct=st1.executeQuery(sql);
	String tno="";
	
		//System.out.println("sql--lp1-->" +  sql);
		while(Inspct.next()){
			tno=Inspct.getString("Tno");
			
			
			
		
		
		
		
		
		
		
		
		
		
             
                       
	
	sql="select *  from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno = '"+tno+"' ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		
		if(rst.next())
		{
			// token =rst.getString("Tno");
			
			
		
		
		%>
		<tr>
	<td><%=i%></td>
	
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=techname %></font></td>
	<td><font color=''><%=rst.getString("Tno") %></font></td>
	<td><font color=''><%=rst.getString("UnitNo") %></font></td>
	<td><font color=''><%=rst.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rst.getString("Complaint") %></font></td>
	<td><font color=''><%=rst.getString("Status") %></font></td>
	<td><font color=''><%=rst.getString("RegBy") %></font></td>
	<td><font color=''><%=rst.getString("Result") %></font></td>
	<td><font color=''><%=rst.getString("VehAttLoc") %></font></td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td><font color=''><%=rst.getString("CostOfInspection") %></font></td>
	<td><font color=''><%=rst.getString("ClaimDetails") %></font></td>
	<td><font color=''><%=rst.getString("DurationOfClosure") %></font></td>
	<td><font color=''><%=rst.getString("DeviceIsFixed") %></font></td>
	<td><font color=''><%=rst.getString("GPSPleacement") %></font></td>
	<td><font color=''><%=rst.getString("PowerConnection") %></font></td>
	<td><font color=''><%=rst.getString("JRMOther") %></font></td>
	<td><font color=''><%=rst.getString("inspection") %></font></td>
	
	
	
		
		
		</tr>
		<%
		i++;
		}
		
	}
	}
	
					%>
		
	
		
	</table>
				
	
		<% 
					
	} else if(loop_insp.equals("lp2")){
	%>	
		
		<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Reallocation Details for  <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 30em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
		
			                          
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<td><b>Sr.</b></td>
		<td><b>Token no</b></td>
		<td><b>VehRegNo</b></td>
		<td><b>Transporter</b></td>
		<td><b>Vehicle Available Date</b></td>
		<td><b>NewTechnician</b></td>
		<td><b>NewLocation</b></td>
		<td><b>OldAvailableDate</b></td>
		<td><b>OldLocation</b></td>
		<td><b>OldTechnician</b></td>
		<td><b>comment</b></td>
		<td><b>AllocatedBy By</b></td>
		<td><b>Reason</b></td>
		<td><b>contactdetails</b></td>
		
		
		
		
		
		
		
		</tr>
		<%
		sql="select * from db_CustomerComplaints.t_reallocated where NewAvailableDate  between '"+fromdate+"' and '"+todate+"' and  NewTechnician='"+techname+"'  ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql---lp2->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td><%=i%></td>
	<td><%=rst.getString("Tno")%></td>
	<td><%=rst.getString("VehRegNo")%></td>
	<td><%=rst.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td><%=rst.getString("NewTechnician")%></td>
		<td><%=rst.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td><%=rst.getString("OldLocation")%></td>
		<td><%=rst.getString("OldTechnician")%></td>
		<td><%=rst.getString("comment")%></td>
		
		
		<td><%=rst.getString("AllocatedBy")%></td>
		<td><%=rst.getString("Reason")%></td>
		<td><%=rst.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
		
		
		<%
		i++;
		}
		%>
	</table>
		
<% 		
	
}else if(loop_insp.equals("lp3")){
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost of Complaints Details for  <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 09em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
		
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Techician</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
	//sql="select * from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet cstsmp=st1.executeQuery(sql);
	////System.out.println("sql---->" +  sql);
	//int token1 =0; 
          
        	//  token1 =cstsmp.getInt("Tno");
	
	
	String lp3="";
	lp3=tk1.replace(" ","");
	String[] tokenlp3=tk1.split(",");
	int lp;
	int i=1;
	for(lp=0;lp<tokenlp3.length;lp++){
	
	
		sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion = '"+caller+"' order by DofAllocation  ";
		ResultSet Inspct=st1.executeQuery(sql);
	String tno1="";
		//System.out.println("sql---->" +  sql);
		while(Inspct.next()){
			tno1=Inspct.getString("Tno");
		
		
		
		
		
		
		
		
		
		
		
		sql="select *  from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'  and  CostOfInspection <> '0' and  Tno = '"+tno1+"' ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--lp3-->" +  sql);
		
		if(rst.next())
		{
		%>
		<tr>
	<td><%=i%></td>
	
		<%
		try
		{
		%>
		
	
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=techname %></font></td>
	<td><font color=''><%=rst.getString("UnitNo") %></font></td>
	<td><font color=''><%=rst.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rst.getString("Complaint") %></font></td>
	<td><font color=''><%=rst.getString("Status") %></font></td>
	<td><font color=''><%=rst.getString("RegBy") %></font></td>
	<td><font color=''><%=rst.getString("Result") %></font></td>
	<td><font color=''><%=rst.getString("VehAttLoc") %></font></td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td><font color=''><%=rst.getString("CostOfInspection") %></font></td>
	<td><font color=''><%=rst.getString("ClaimDetails") %></font></td>
	<td><font color=''><%=rst.getString("DurationOfClosure") %></font></td>
	<td><font color=''><%=rst.getString("DeviceIsFixed") %></font></td>
	<td><font color=''><%=rst.getString("GPSPleacement") %></font></td>
	<td><font color=''><%=rst.getString("PowerConnection") %></font></td>
	<td><font color=''><%=rst.getString("JRMOther") %></font></td>
	<td><font color=''><%=rst.getString("inspection") %></font></td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		}
		}
		}    
		%>
		
		 
	
		</table>
		
	
<%		
}else if(loop_insp.equals("lp4")){

	%>
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost of Inspection Details for  <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 09em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
		
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Techician</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
	
	//sql="select * from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet cstinsp=st1.executeQuery(sql);
	//System.out.println("sql---->" +  sql);
	//int token22 =0; 
         
        	  //token22 =cstinsp.getInt("Tno");

        	  String lp4="";
        		lp4=token2.replace(" ","");
        		String[] tokenlp4=token2.split(",");
        		int lpp;
        		//System.out.println("tokenlp4 OF LP$$$$44444444---->" +  tokenlp4.length);
        		int i=1;
        		
        		
        	  
        		sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion = '"+caller+"'  order by DofAllocation  ";
        		ResultSet Inspct=st1.executeQuery(sql);
        	String tno4="";
        	
        		//System.out.println("sql---lp4->" +  sql);
        		while(Inspct.next()){
        			tno4=Inspct.getString("Tno");
        		
       
        			
        			
        			
        			
        			
        			
        			
        			
        			
        			
        	  
        	  
        	  
        	  sql="select *  from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and CostOfInspection <> '0'  and  inspection='Yes' and  Tno = '"+tno4 +"' ";
		//out.print(sql);
	ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		if(rst.next())
		{
			
			//System.out.println("Inside result SETttttt---->" +  sql);
		%>
		<tr>
	<td><%=i%></td>
			<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=techname %></font></td>
	<td><font color=''><%=rst.getString("UnitNo") %></font></td>
	<td><font color=''><%=rst.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rst.getString("Complaint") %></font></td>
	<td><font color=''><%=rst.getString("Status") %></font></td>
	<td><font color=''><%=rst.getString("RegBy") %></font></td>
	<td><font color=''><%=rst.getString("Result") %></font></td>
	<td><font color=''><%=rst.getString("VehAttLoc") %></font></td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td><font color=''><%=rst.getString("CostOfInspection") %></font></td>
	<td><font color=''><%=rst.getString("ClaimDetails") %></font></td>
	<td><font color=''><%=rst.getString("DurationOfClosure") %></font></td>
	<td><font color=''><%=rst.getString("DeviceIsFixed") %></font></td>
	<td><font color=''><%=rst.getString("GPSPleacement") %></font></td>
	<td><font color=''><%=rst.getString("PowerConnection") %></font></td>
	<td><font color=''><%=rst.getString("JRMOther") %></font></td>
	<td><font color=''><%=rst.getString("inspection") %></font></td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		}
        		}   		 
		%>
		
		 
	
		</table>
	
<%	
	
}else if(loop_insp.equals("lp6")){
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  by <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Allocation Date</b></td>
	<td><b>Transporter</b></td>
	<td><b>Technicion</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Status</b></td>
	
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Action By Technician</b></td>
	<td><b>Allocated By</b></td>
	<td><b>Action</b></td>
	</tr>
	<%
		sql="select distinct(Tno),DofAllocation,Technicion,VehRegNo,Status,ActualProb from t_callocation1 where Technicion='"+caller+"' and  ActualProb <> 'Unit Replace, Okay'   and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'   ) GROUP BY Tno  ";
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--lp6-->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst.getString("Tno")%></td>
		<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
		
		<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>
	<td><%=rst1.getString("Customer")%></td>
	<td><%=rst.getString("Technicion")%></td>
	<td><%=rst.getString("VehRegNo")%></td>
	<td><%=rst.getString("Status")%></td>
	
	
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate <'"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td><font color=""><%=rst11.getString("Location") %></font></td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
	<td><%=rst.getString("ActualProb") %></td>
	<td><%=rst1.getString("RegBy")%></td>
	<td><%=rst1.getString("Action")%></td>
	<%
		}
		else
		{
		%>
	<td>--</td>
	<td>--</td>
	<td>--</td>
	<%
		}	
	%>
		</tr>		
		<%
		i++;
		}
		} else if(loop_insp.equals("lp7")){        
 
			%>
			<table border="0" width="750px" align="center">
			<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  by <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
			<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
			</tr>	
			<tr><td>
			<table border="1" width="100%" align="center" class="sortable">
			<tr>
			<td><b>Sr.</b></td>
			<td><b>Tiket.No</b></td>
			<td><b>Allocation Date</b></td>
			<td><b>Transporter</b></td>
			<td><b>Technicion</b></td>
			<td><b>VehRegNo.</b></td>
			<td><b>Status</b></td>
			
			<td><b>Updated</b></td>
			<td><b>Location</b></td>
			<td><b>Action By Technician</b></td>
			<td><b>Allocated By</b></td>
			
			</tr>
			<%
			sql="select *  from t_callocation1 where  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate  ='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and RegBy='"+repname+"' and  inspection='No') ";
			ResultSet rstrep=st.executeQuery(sql);
			//System.out.println("sql--lp7-->" +  sql);
			int i=1;
			while(rstrep.next())
			{

				%>
				<tr>
				<td align ="right"><div align =""><%=i%></td></div>
				<td align ="right"><div align ="right"><%=rstrep.getString("Tno")%></td></div>
				<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstrep.getDate("DofAllocation"))%></td>
				
				<%
				sql="select * from t_complaints1 where tno='"+rstrep.getString("Tno")+"'";	
				ResultSet rst1=st1.executeQuery(sql);
				//System.out.println("sql---->" +  sql);
				if(rst1.next())
				{
			%>
			<td align ="left"><%=rst1.getString("Customer")%></td>
			<td align ="left"><%=rstrep.getString("Technicion")%></td>
			<td><%=rstrep.getString("VehRegNo")%></td>
			<td align ="left"><%=rstrep.getString("Status")%></td>
			
			
			<%		sql="select *from t_onlinedata where VehicleRegNo='"+rstrep.getString("VehRegNo")+"' and (TheDate >='"+rstrep.getDate("DofAllocation")+"' or TheDate <'"+rstrep.getDate("DofAllocation")+"') order by TheDate Desc";
					ResultSet rst11=st3.executeQuery(sql);
					if(rst11.next())
					{
			%>
						<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
						<td align ="left"><font color=""><%=rst11.getString("Location") %></font></td>
			<%		}
					else
					{
						%>
						<td>-</td>
						<td>-</td>
			<%
					}
					
			%>
			<td align ="left"><%=rstrep.getString("ActualProb") %></td>
			<td align ="left"><%=rst1.getString("RegBy")%></td>
			
			<%
				}
				else
				{
				%>
			<td>--</td>
			<td>--</td>
			<td>--</td>
			<%
				}	
			%>
				</tr>		
				<%
				i++;
				
				
			}
			
		
			}else if(loop_insp.equals("lp8")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Realloacation Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Token no</b></td>
				<td><b>VehRegNo</b></td>
				<td><b>Transporter</b></td>
				<td><b>Vehicle Available Date</b></td>
				<td><b>NewTechnician</b></td>
				<td><b>NewLocation</b></td>
				<td><b>OldAvailableDate</b></td>
				<td><b>OldLocation</b></td>
				<td><b>OldTechnician</b></td>
				<td><b>comment</b></td>
				<td><b>AllocatedBy By</b></td>
				<td><b>Reason</b></td>
				<td><b>contactdetails</b></td>
				
				
				
				
				
				
				
				</tr>
				<%
		sql="select * from db_CustomerComplaints.t_reallocated where NewAvailableDate  between '"+fromdate+"' and '"+todate+"' and  	AllocatedBy ='"+regby+"'  ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--lp8-->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td align ="right"><%=i%></td>
	<td align ="right"><%=rst.getString("Tno")%></td>
	<td align ="right"><%=rst.getString("VehRegNo")%></td>
	<td align ="left"><%=rst.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("NewTechnician")%></td>
		<td align ="left"><%=rst.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("OldLocation")%></td>
		<td align ="left"><%=rst.getString("OldTechnician")%></td>
		<td align ="left"><%=rst.getString("comment")%></td>
		
		
		<td align ="left"><%=rst.getString("AllocatedBy")%></td>
		<td align ="left"><%=rst.getString("Reason")%></td>
		<td align ="left"><%=rst.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
		
		
		<%
		i++;
		}
		%>
	</table>
		</td>
		</tr>	
		</table>	
				
				
			<% 	
		
			}else if(loop_insp.equals("lp9")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and CostOfInspection <> '0'  and inspection='No' and RegBy='"+regby+"'";	
			ResultSet rstcst=st.executeQuery(sql);
			//System.out.println("sql--lp9-->" +  sql);
			int i=1;
			while(rstcst.next())
			{
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcst.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcst.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcst.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcst.getString("Status") %></font></td>
			<td><font color=''><%=rstcst.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcst.getString("Result") %></font></td>
			<td><font color=''><%=rstcst.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcst.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcst.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcst.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcst.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcst.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcst.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcst.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcst.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	
			
				
			}else if(loop_insp.equals("lp10")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Inspection Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and CostOfInspection <> '0'  and RegBy='"+regby+"'";	
			ResultSet rstcs=st.executeQuery(sql);
			//System.out.println("sql--lp10-->" +  sql);
			int i=1;
			while(rstcs.next()){
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcs.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcs.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcs.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcs.getString("Status") %></font></td>
			<td><font color=''><%=rstcs.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcs.getString("Result") %></font></td>
			<td><font color=''><%=rstcs.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcs.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcs.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcs.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcs.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcs.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcs.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcs.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcs.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	
				
				
				
			}else if(loop_insp.equals("lp12")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  by <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
	      
	                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
	                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Tiket.No</b></td>
				<td><b>Allocation Date</b></td>
				<td><b>Transporter</b></td>
				<td><b>Technicion</b></td>
				<td><b>VehRegNo.</b></td>
				<td><b>Status</b></td>
				
				<td><b>Updated</b></td>
				<td><b>Location</b></td>
				<td><b>Action By Technician</b></td>
				<td><b>Allocated By</b></td>
				
				</tr>
				<%
				sql="select *  from t_callocation1 where  Customer ='"+regby+"' and  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate<='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and  inspection='No') ";
				ResultSet rstrep=st.executeQuery(sql);
				//System.out.println("sql--lp12-->" +  sql);
				int i=1;
				while(rstrep.next())
				{

					%>
					<tr>
					<td align ="right"><div align =""><%=i%></td></div>
					<td align ="right"><div align ="right"><%=rstrep.getString("Tno")%></td></div>
					<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstrep.getDate("DofAllocation"))%></td>
					
					<%
					sql="select * from t_complaints1 where tno='"+rstrep.getString("Tno")+"'";	
					ResultSet rst1=st1.executeQuery(sql);
					//System.out.println("sql---->" +  sql);
					if(rst1.next())
					{
				%>
				<td align ="left"><%=rst1.getString("Customer")%></td>
				<td align ="left"><%=rstrep.getString("Technicion")%></td>
				<td><%=rstrep.getString("VehRegNo")%></td>
				<td align ="left"><%=rstrep.getString("Status")%></td>
				
				
				<%		sql="select *from t_onlinedata where VehicleRegNo='"+rstrep.getString("VehRegNo")+"' and (TheDate >='"+rstrep.getDate("DofAllocation")+"' or TheDate <'"+rstrep.getDate("DofAllocation")+"') order by TheDate Desc";
						ResultSet rst11=st3.executeQuery(sql);
						if(rst11.next())
						{
				%>
							<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
							<td align ="left"><font color=""><%=rst11.getString("Location") %></font></td>
				<%		}
						else
						{
							%>
							<td>-</td>
							<td>-</td>
				<%
						}
						
				%>
				<td align ="left"><%=rstrep.getString("ActualProb") %></td>
				<td align ="left"><%=rst1.getString("RegBy")%></td>
				
				<%
					}
					else
					{
					%>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<%
					}	
				%>
					</tr>		
					<%
					i++;
					
					
				}
				
			
			}else if(loop_insp.equals("lp13")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Realloacation Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Token no</b></td>
				<td><b>VehRegNo</b></td>
				<td><b>Transporter</b></td>
				<td><b>Vehicle Available Date</b></td>
				<td><b>NewTechnician</b></td>
				<td><b>NewLocation</b></td>
				<td><b>OldAvailableDate</b></td>
				<td><b>OldLocation</b></td>
				<td><b>OldTechnician</b></td>
				<td><b>comment</b></td>
				<td><b>AllocatedBy By</b></td>
				<td><b>Reason</b></td>
				<td><b>contactdetails</b></td>
				
				
				
				
				
				
				
				</tr>
				<%
		sql="select  *  from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	Transporter ='"+regby+"'  ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--lp8-->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td align ="right"><%=i%></td>
	<td align ="right"><%=rst.getString("Tno")%></td>
	<td align ="right"><%=rst.getString("VehRegNo")%></td>
	<td align ="left"><%=rst.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("NewTechnician")%></td>
		<td align ="left"><%=rst.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("OldLocation")%></td>
		<td align ="left"><%=rst.getString("OldTechnician")%></td>
		<td align ="left"><%=rst.getString("comment")%></td>
		
		
		<td align ="left"><%=rst.getString("AllocatedBy")%></td>
		<td align ="left"><%=rst.getString("Reason")%></td>
		<td align ="left"><%=rst.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
		
		
		<%
		i++;
		}
		%>
	</table>
		</td>
		</tr>	
		</table>	
				
				
			<% 	
			
			}else if(loop_insp.equals("lp14")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'   and CostOfInspection <> '0' and Customer='"+regby+"'";
			ResultSet rstcst=st.executeQuery(sql);
			//System.out.println("sql--lp9-->" +  sql);
			int i=1;
			while(rstcst.next())
			{
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcst.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcst.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcst.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcst.getString("Status") %></font></td>
			<td><font color=''><%=rstcst.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcst.getString("Result") %></font></td>
			<td><font color=''><%=rstcst.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcst.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcst.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcst.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcst.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcst.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcst.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcst.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcst.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	

			
			}else if(loop_insp.equals("lp15")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes'  and CostOfInspection <> '0' and Customer='"+regby+"'";
			ResultSet rstcst=st.executeQuery(sql);
			//System.out.println("sql--lp9-->" +  sql);
			int i=1;
			while(rstcst.next())
			{
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcst.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcst.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcst.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcst.getString("Status") %></font></td>
			<td><font color=''><%=rstcst.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcst.getString("Result") %></font></td>
			<td><font color=''><%=rstcst.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcst.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcst.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcst.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcst.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcst.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcst.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcst.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcst.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	

				
				
				
				
			}else if(loop_insp.equals("q2")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Realloacation Details for  All Transporter from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Token no</b></td>
				<td><b>VehRegNo</b></td>
				<td><b>Transporter</b></td>
				<td><b>Vehicle Available Date</b></td>
				<td><b>NewTechnician</b></td>
				<td><b>NewLocation</b></td>
				<td><b>OldAvailableDate</b></td>
				<td><b>OldLocation</b></td>
				<td><b>OldTechnician</b></td>
				<td><b>comment</b></td>
				<td><b>AllocatedBy By</b></td>
				<td><b>Reason</b></td>
				<td><b>contactdetails</b></td>
				
				
				
				
				
				
				
				</tr>
				<%
		sql="select  *  from db_CustomerComplaints.t_reallocated where NewAvailableDate  between '"+fromdate+"' and '"+todate+"' and  	Transporter in (select distinct(OwnerName)as OwnerName from db_gps.t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc)   ";
		//out.print(sql);
		ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql--lp8-->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
	<td align ="right"><%=i%></td>
	<td align ="right"><%=rst.getString("Tno")%></td>
	<td align ="right"><%=rst.getString("VehRegNo")%></td>
	<td align ="left"><%=rst.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("NewTechnician")%></td>
		<td align ="left"><%=rst.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst.getString("OldLocation")%></td>
		<td align ="left"><%=rst.getString("OldTechnician")%></td>
		<td align ="left"><%=rst.getString("comment")%></td>
		
		
		<td align ="left"><%=rst.getString("AllocatedBy")%></td>
		<td align ="left"><%=rst.getString("Reason")%></td>
		<td align ="left"><%=rst.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
		
		
		<%
		i++;
		}
		%>
	</table>
		</td>
		</tr>	
		</table>	
				
				
			<% 	
				
				
			}else if(loop_insp.equals("q3")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for All Transporter from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and CostOfInspection <> '0' and Customer in ((select distinct(OwnerName)as OwnerName from db_gps.t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc))    ";
			ResultSet rstcst=st.executeQuery(sql);
			//System.out.println("sql--lp9-->" +  sql);
			int i=1;
			while(rstcst.next())
			{
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcst.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcst.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcst.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcst.getString("Status") %></font></td>
			<td><font color=''><%=rstcst.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcst.getString("Result") %></font></td>
			<td><font color=''><%=rstcst.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcst.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcst.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcst.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcst.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcst.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcst.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcst.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcst.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	

				
				
				
				
			}else if(loop_insp.equals("q4")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for  All Transporter from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>TdyDate</b></td>
				<td><b>UnitNo</b></td>
				<td><b>VehicleNo</b></td>
				<td><b> Complaint</b></td>
				<td><b>Status</b></td>
				<td><b>Regby</b></td>
				<td><b>Result</b></td>
				<td><b>VehAttLoc</b></td>
				<td><b>VehAvailDate</b></td>
				<td><b>Cost</b></td>
				<td><b>Claim</b></td>
				<td><b>Duration</b></td>
				<td><b>DeviceIsFixed</b></td>
				<td><b>GPSPlacement</b></td>
				<td><b>Power</b></td>
				<td><b>JRMOther.</b></td>
				<td><b>Inspection</b></td>
				
				</tr>
			<% 		
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes'  and CostOfInspection <> '0' and Customer in (select distinct(OwnerName)as OwnerName from db_gps.t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc)    ";
			ResultSet rstcst=st.executeQuery(sql);
			//System.out.println("sql--lp9-->" +  sql);
			int i=1;
			while(rstcst.next())
			{
				%>
				<tr>
			<td><%=i%></td>
			
				<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("TdyDate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			<td><font color=''><%=rstcst.getString("UnitNo") %></font></td>
			<td><font color=''><%=rstcst.getString("VehicleNo") %></font></td>
			<td><font color=''><%=rstcst.getString("Complaint") %></font></td>
			<td><font color=''><%=rstcst.getString("Status") %></font></td>
			<td><font color=''><%=rstcst.getString("RegBy") %></font></td>
			<td><font color=''><%=rstcst.getString("Result") %></font></td>
			<td><font color=''><%=rstcst.getString("VehAttLoc") %></font></td>
			
			
			<%
				try
				{
				%>
				
				<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcst.getDate("VehAvaildate"))%></font></td>
				<%
				}catch(Exception e){
					
					out.println("-");
					
				}
				
				%>
			
			
			<td><font color=''><%=rstcst.getString("CostOfInspection") %></font></td>
			<td><font color=''><%=rstcst.getString("ClaimDetails") %></font></td>
			<td><font color=''><%=rstcst.getString("DurationOfClosure") %></font></td>
			<td><font color=''><%=rstcst.getString("DeviceIsFixed") %></font></td>
			<td><font color=''><%=rstcst.getString("GPSPleacement") %></font></td>
			<td><font color=''><%=rstcst.getString("PowerConnection") %></font></td>
			<td><font color=''><%=rstcst.getString("JRMOther") %></font></td>
			<td><font color=''><%=rstcst.getString("inspection") %></font></td>
			
			
			
			</tr>	
				
				
				<%
				i++;
				}
				
				 
				%>
				
				 
			
				</table>
				</td>
				</tr>	
				</table>	
				
				
			<%	

				
				
				
			}else if(loop_insp.equals("q1")){
				%>
				<table border="0" width="750px" align="center">
				<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  by All Transporter from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
				<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
	      
	                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
	                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
				</tr>	
				<tr><td>
				<table border="1" width="100%" align="center" class="sortable">
				<tr>
				<td><b>Sr.</b></td>
				<td><b>Tiket.No</b></td>
				<td><b>Allocation Date</b></td>
				<td><b>Transporter</b></td>
				<td><b>Technicion</b></td>
				<td><b>VehRegNo.</b></td>
				<td><b>Status</b></td>
				
				<td><b>Updated</b></td>
				<td><b>Location</b></td>
				<td><b>Action By Technician</b></td>
				<td><b>Allocated By</b></td>
				
				</tr>
				<%
				sql="select *  from t_callocation1 where  Customer in (select distinct(OwnerName)as OwnerName from db_gps.t_vehicledetails where OwnerName not like '% del' order by OwnerName Asc)  and  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate<='"+todate+"' and Status='Solved' and Tno in(select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and  inspection='No') ";
				ResultSet rstrep=st.executeQuery(sql);
				//System.out.println("sql--lp12-->" +  sql);
				int i=1;
				while(rstrep.next())
				{

					%>
					<tr>
					<td align ="right"><div align =""><%=i%></td></div>
					<td align ="right"><div align ="right"><%=rstrep.getString("Tno")%></td></div>
					<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstrep.getDate("DofAllocation"))%></td>
					
					<%
					sql="select * from t_complaints1 where tno='"+rstrep.getString("Tno")+"'";	
					ResultSet rst1=st1.executeQuery(sql);
					//System.out.println("sql---->" +  sql);
					if(rst1.next())
					{
				%>
				<td align ="left"><%=rst1.getString("Customer")%></td>
				<td align ="left"><%=rstrep.getString("Technicion")%></td>
				<td><%=rstrep.getString("VehRegNo")%></td>
				<td align ="left"><%=rstrep.getString("Status")%></td>
				
				
				<%		sql="select *from t_onlinedata where VehicleRegNo='"+rstrep.getString("VehRegNo")+"' and (TheDate >='"+rstrep.getDate("DofAllocation")+"' or TheDate <'"+rstrep.getDate("DofAllocation")+"') order by TheDate Desc";
						ResultSet rst11=st3.executeQuery(sql);
						if(rst11.next())
						{
				%>
							<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
							<td align ="left"><font color=""><%=rst11.getString("Location") %></font></td>
				<%		}
						else
						{
							%>
							<td>-</td>
							<td>-</td>
				<%
						}
						
				%>
				<td align ="left"><%=rstrep.getString("ActualProb") %></td>
				<td align ="left"><%=rst1.getString("RegBy")%></td>
				
				<%
					}
					else
					{
					%>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<%
					}	
				%>
					</tr>		
					<%
					i++;
					
					
				}
				
			
			
				
			
			}else if(loop_insp.equals("ab1")){
	
		%>	
			
		
		
		<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Inspection Details for  All Technician from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
	</tr>	
		<tr><td>
		<table border="1" width="100%" align="center" class="sortable">
		<tr>
		<td><b>Sr.</b></td>
		<td><b>TdyDate</b></td>
		<td><b>Customer</b></td>
		<td><b>Technicion</b></td>
		<td><b>UnitNo</b></td>
		<td><b>VehicleNo</b></td>
		<td><b> Complaint</b></td>
		<td><b>Status</b></td>
		<td><b>Regby</b></td>
		<td><b>Result</b></td>
		<td><b>VehAttLoc</b></td>
		<td><b>VehAvailDate</b></td>
		<td><b>Cost</b></td>
		<td><b>Claim</b></td>
		<td><b>Duration</b></td>
		<td><b>DeviceIsFixed</b></td>
		<td><b>GPSPleacement</b></td>
		<td><b>Power</b></td>
		<td><b>JRMOther.</b></td>
		<td><b>Inspection</b></td>
		
		</tr>
		<%
		////System.out.println(rst1.getString("RegBy"));	
		sql="select Tno,Technicion from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion in (select Distinct(TechName) from t_techlist where Available='Yes')   ";
		ResultSet insptotal=st1.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		int i=1;
		
		String ab =""; 
		//System.out.println("sql-ab1--->" +  sql);
		while(insptotal.next()){
		
			ab=insptotal.getString("Tno");
			
			/**
			if(ab=="")
		  {
			  ab=insptotal.getString("Tno");
		  }
		  else
		  {
			
			  ab =ab+","+insptotal.getString("Tno");
		//System.out.println("inside if of lp1---->");
		
		  }
		  //System.out.println("tk---->"+tk);
		**/
		
		
		/**
		
		
		ab=ab.replace(" ","");
		int cntab=0;
		int p=1;
		
			
			
		int a;
		String[] tokenab11=ab.split(",");
			
		
		
		
		**/
		
						
			/**
			//System.out.println("totaltoken--ABBBBBB-->"+totaltoken);	
			String ab1="";
	ab1=totaltoken.replace(" ","");
	String[] tokenab1=totaltoken.split(",");
	int abb;
	//System.out.println("tokenab1--ABBBBBB-->"+tokenab1.length);	
	**/
	
			
			
			
			
			
			sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno ='"+ab+"'   ";
			//out.print(sql);
			ResultSet rst=st.executeQuery(sql);
			//System.out.println("sql---->" +  sql);
			
			String Tno="";
			if(rst.next())
			{
				
				
				 //Tno=Tno+","+rst.getString("Tno");
				//sql="select * from t_techlist where  Available='Yes' ";
					//ResultSet rst3=st1.executeQuery(sql);
					////System.out.println("sql---->" +  sql);
					
						//techo=techo+","+rst3.getString("RegBy");
				//System.out.println("inside rst3---->");	
			%>
			<tr>
		<td><%=i%></td>
		
			<%
			try
			{
			%>
			
			<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("TdyDate"))%></font></td>
			<%
			}catch(Exception e){
				
				out.println("-");
				
			}
					
			//System.out.println("up to here---->");
			////System.out.println(rst.getString("Customer"));
			//String a=rst.getString("Customer");
			////System.out.println(rst.getString("a>>>>"+a));
			%>
	  	<td><font color=''><%=rst.getString("Customer") %></font></td>
	  	<td><font color=''><%=insptotal.getString("Technicion") %></font></td>
	<td><font color=''><%=rst.getString("UnitNo") %></font></td>
	<td><font color=''><%=rst.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rst.getString("Complaint") %></font></td>
	<td><font color=''><%=rst.getString("Status") %></font></td>
	<td><font color=''><%=rst.getString("RegBy") %></font></td>
	<td><font color=''><%=rst.getString("Result") %></font></td>
	<td><font color=''><%=rst.getString("VehAttLoc") %></font></td>
		
		
		<%
			try
			{
			%>
			
			<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("VehAvaildate"))%></font></td>
			<%
			}catch(Exception e){
				
				out.println("-");
				
			}
			
			%>
		
		
		<td><font color=''><%=rst.getString("CostOfInspection") %></font></td>
		<td><font color=''><%=rst.getString("ClaimDetails") %></font></td>
		<td><font color=''><%=rst.getString("DurationOfClosure") %></font></td>
		<td><font color=''><%=rst.getString("DeviceIsFixed") %></font></td>
		<td><font color=''><%=rst.getString("GPSPleacement") %></font></td>
		<td><font color=''><%=rst.getString("PowerConnection") %></font></td>
		<td><font color=''><%=rst.getString("JRMOther") %></font></td>
		<td><font color=''><%=rst.getString("inspection") %></font></td>
		
		
		
			
			
			</tr>
			<%
			i++;
				}
				
		}	
		
		
		
		
			
			
	%>
			
			
		</table>
			</td>
			</tr>	
			</table>		
		
			<% 
			
				
}else if(loop_insp.equals("ab2")){
	//System.out.println("inside ab2>>>>>>>>>");
	%>	
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Reallocation Details for  All Technician from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
		<td><b>Token no</b></td>
		<td><b>VehRegNo</b></td>
		<td><b>Transporter</b></td>
		<td><b>Vehicle Available Date</b></td>
		<td><b>NewTechnician</b></td>
		<td><b>NewLocation</b></td>
		<td><b>OldAvailableDate</b></td>
		<td><b>OldLocation</b></td>
		<td><b>OldTechnician</b></td>
		<td><b>comment</b></td>
		<td><b>AllocatedBy By</b></td>
		<td><b>Reason</b></td>
		<td><b>contactdetails</b></td>
	
	
	
	</tr>
	<%
	
		
	//sql="select TechName from t_techlist where   Available='Yes' ";
	//out.print(sql);
	//ResultSet rst=st.executeQuery(sql);
//	//System.out.println("sql---->" +  sql);
	//String tech="";
	int i=1;
	//while(rst.next())
	
		//tech=rst.getString("TechName");
		sql="select * from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  NewTechnician in (select Distinct(TechName) from t_techlist where Available='Yes') ";
		//sql="select * from t_techlist where TechName='"+techname+"' and Available='Yes'";
		ResultSet rst3=st1.executeQuery(sql);
		//System.out.println("sql-ab2--->" +  sql);
		while(rst3.next()){
		
		
		
	%>
	<tr>
<td><%=i%></td>
	<td><%=rst3.getString("Tno")%></td>
	<td><%=rst3.getString("VehRegNo")%></td>
	<td><%=rst3.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td><%=rst3.getString("NewTechnician")%></td>
		<td><%=rst3.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td><%=rst3.getString("OldLocation")%></td>
		<td><%=rst3.getString("OldTechnician")%></td>
		<td><%=rst3.getString("comment")%></td>
		
		
		<td><%=rst3.getString("AllocatedBy")%></td>
		<td><%=rst3.getString("Reason")%></td>
		<td><%=rst3.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
	
	
	<%
	i++;
	}
	
	%>
</table>
	</td>
	</tr>	
	</table>		
	
<% 		
	
}else if(loop_insp.equals("ab3")){
	//System.out.println("inside ab3>>>>>>>>>");
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost of Inspection for  All Technician from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Customer</b></td>
	<td><b>Technicion</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
	sql="select Tno,Technicion from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion in (select Distinct(TechName) from t_techlist where Available='Yes')    ";
	ResultSet rst=st.executeQuery(sql);
	//System.out.println("sql-ab3--->" +  sql);
	int i=1;
	String ab2 =""; 
	//System.out.println("sql---->" +  sql);
	while(rst.next())
	{
		ab2=rst.getString("Tno");
	/**	
		if(ab2=="")
	  {
		  ab2=rst.getString("Tno");
	  }
	  else
	  {
		
		  ab2 =ab2+","+rst.getString("Tno");
	//System.out.println("inside if of lp1---->");
	
	  }
	// //System.out.println("tk---->"+tk);
	  
	
	**/
	
	
	
	
	
	
	
	
		sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='Yes' and Tno = '"+ab2 +"'  and CostOfInspection <> '0'  ";
		
			//sql="select * from t_techlist where TechName='"+techname+"' and Available='Yes'";
			ResultSet rst3=st1.executeQuery(sql);
			//System.out.println("sql---->" +  sql);
		
		if(rst3.next()){
		
		%>
		<tr>
	<td><%=i%></td>
	
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=rst3.getString("Customer") %></font></td>
	<td><font color=''><%=rst.getString("Technicion") %></font></td>
	<td><font color=''><%=rst3.getString("UnitNo") %></font></td>
	<td><font color=''><%=rst3.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rst3.getString("Complaint") %></font></td>
	<td><font color=''><%=rst3.getString("Status") %></font></td>
	<td><font color=''><%=rst3.getString("RegBy") %></font></td>
	<td><font color=''><%=rst3.getString("Result") %></font></td>
	<td><font color=''><%=rst3.getString("VehAttLoc") %></font></td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td><font color=''><%=rst3.getString("CostOfInspection") %></font></td>
	<td><font color=''><%=rst3.getString("ClaimDetails") %></font></td>
	<td><font color=''><%=rst3.getString("DurationOfClosure") %></font></td>
	<td><font color=''><%=rst3.getString("DeviceIsFixed") %></font></td>
	<td><font color=''><%=rst3.getString("GPSPleacement") %></font></td>
	<td><font color=''><%=rst3.getString("PowerConnection") %></font></td>
	<td><font color=''><%=rst3.getString("JRMOther") %></font></td>
	<td><font color=''><%=rst3.getString("inspection") %></font></td>
	
	
	
	</tr>	
		
		
		<%
		
		
		i++;
		
				}
	}
		%>
		
		 
	
		</table>
		</td>
		</tr>	
		</table>	
	
<%		
	
	
	}else if(loop_insp.equals("ab4")){
	//System.out.println("inside ab4>>>>>>>>>");
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost of Complaint Details for  All Technician from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Customer</b></td>
	<td><b>Technicion</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
	sql="select Tno,Technicion from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion in (select Distinct(TechName) from t_techlist where Available='Yes')    ";
	ResultSet rst=st1.executeQuery(sql);
	//System.out.println("sql--ab4-->" +  sql);
	int i=1;
	String ab4 =""; 
	//System.out.println("sql---->" +  sql);
	while(rst.next())
	{
	  
		 ab4=rst.getString("Tno");
		/**
		
		if(ab4=="")
	  {
		  ab4=rst.getString("Tno");
	  }
	  else
	  {
		
		  ab4 =ab4+","+rst.getString("Tno");
	//System.out.println("inside if of lp1---->");
	
	  }
	// //System.out.println("tk---->"+tk);
	
	
	**/
	
	
	
	
	
	
	
	
	
		sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and Tno = '"+ab4 +"' and  CostOfInspection <> '0'  ";
		//out.print(sql);
		ResultSet rstab=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		if(rstab.next())
		{
			//sql="select * from t_techlist where TechName='"+techname+"' and Available='Yes'";
			//ResultSet rst3=st1.executeQuery(sql);
			////System.out.println("sql---->" +  sql);
			
		
		
		%>
		<tr>
	<td><%=i%></td>
			<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstab.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td><font color=''><%=rstab.getString("Customer") %></font></td>
	<td><font color=''><%=rst.getString("Technicion") %></font></td>
	<td><font color=''><%=rstab.getString("UnitNo") %></font></td>
	<td><font color=''><%=rstab.getString("VehicleNo") %></font></td>
	<td><font color=''><%=rstab.getString("Complaint") %></font></td>
	<td><font color=''><%=rstab.getString("Status") %></font></td>
	<td><font color=''><%=rstab.getString("RegBy") %></font></td>
	<td><font color=''><%=rstab.getString("Result") %></font></td>
	<td><font color=''><%=rstab.getString("VehAttLoc") %></font></td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstab.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td><font color=''><%=rstab.getString("CostOfInspection") %></font></td>
	<td><font color=''><%=rstab.getString("ClaimDetails") %></font></td>
	<td><font color=''><%=rstab.getString("DurationOfClosure") %></font></td>
	<td><font color=''><%=rstab.getString("DeviceIsFixed") %></font></td>
	<td><font color=''><%=rstab.getString("GPSPleacement") %></font></td>
	<td><font color=''><%=rstab.getString("PowerConnection") %></font></td>
	<td><font color=''><%=rstab.getString("JRMOther") %></font></td>
	<td><font color=''><%=rstab.getString("inspection") %></font></td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		
		}
	
	}
		%>
		
		 
	
		</table>
		</td>
		</tr>	
		</table>
<%	
	
}else if(loop_insp.equals("ab5")){
	//System.out.println("inside ab5>>>>>>>>>");
  
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Average Closure Duration  Details for  All Technician from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Customer</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%
		
	sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion in (select Distinct(TechName) from t_techlist where Available='Yes')   ";
	ResultSet rst=st1.executeQuery(sql);
	//System.out.println("sql--ab5-->" +  sql);
	int i=1;
	String ab5 =""; 
	//System.out.println("sql---->" +  sql);
	while(rst.next())
	{
		ab5=rst.getString("Tno");
	/**	
		if(ab5=="")
	  {
		  ab5=rst.getString("Tno");
	  }
	  else
	  {
		
		  ab5 =ab5+","+rst.getString("Tno");
	//System.out.println("inside if of lp1---->");
	
	  }
	// //System.out.println("tk---->"+tk);
	  **/
	
		
	
	
	
	
	
		sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and Tno = '"+ab5 +"' and DurationOfClosure <> '-' and DurationOfClosure <> '0:0'  ";
	
	
		
		//out.print(sql);
		ResultSet rst5=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		if(rst5.next())
		{
			//sql="select * from t_techlist where TechName='"+techname+"' and Available='Yes'";
			//ResultSet rst3=st1.executeQuery(sql);
			////System.out.println("sql---->" +  sql);
		
		
		
		%>
		<tr>
	<td align ="right"><div align ="right"><%=i++%></div> </td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst5.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td align ="left"><div align ="left"><font color=''><%=rst5.getString("Customer") %></font></div> </td>
	<td align ="right"><div align ="right"><font color=''><%=rst5.getString("UnitNo") %></font></div> </td>
	<td ><font color=''><%=rst5.getString("VehicleNo") %></font></td>
	<td align ="left"><div align ="left"><font color=''><%=rst5.getString("Complaint") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst5.getString("Status") %></font> </div></td>
	<td align ="left"> <div align ="left"><font color=''><%=rst5.getString("RegBy") %></font> </div></td>
	<td align ="left"> <div align ="left"><font color=''><%=rst5.getString("Result") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst5.getString("VehAttLoc") %></font></div> </td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst5.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td align ="right"><div align ="right"> <font color=''><%=rst5.getString("CostOfInspection") %></font></div>  </td>
	<td align ="left"> <div align ="right"><font color=''><%=rst5.getString("ClaimDetails") %></font></div> </td>
	<td align ="right"><div align ="right"> <font color=''><%=rst5.getString("DurationOfClosure") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst5.getString("DeviceIsFixed") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst5.getString("GPSPleacement") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst5.getString("PowerConnection") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst5.getString("JRMOther") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst5.getString("inspection") %></font></div> </td>
	
	
	
	</tr>	
		
		
		<%
		//i++;
		
		}
	
		
}
		%>
		
		</table>
		</td>
		</tr>	
		</table>
		
<% 
	
            

}else if(loop_insp.equals("pp1")){
	%>
	
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  for  All Representatives  from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>	
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Allocation Date</b></td>
	<td><b>Transporter</b></td>
	<td><b>Technicion</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Status</b></td>
	
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Action By Technician</b></td>
	<td><b>Allocated By</b></td>
	
	</tr>
	<%
	sql="select *  from t_callocation1 where  ActualProb <> 'Unit Replace, Okay'  and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and Tno in (select Tno from t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and RegBy in  (select distinct (name) from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes') ) ";
	ResultSet rstrep=st.executeQuery(sql);
	//System.out.println("sql--pp1-->" +  sql);
	int i=1;
	while(rstrep.next())
	{

		%>
		<tr>
		<td align ="right"><%=i%></td>
		<td align ="right"><%=rstrep.getString("Tno")%></td>
		<td align ="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstrep.getDate("DofAllocation"))%></td>
		
		<%
		sql="select * from t_complaints1 where tno='"+rstrep.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		if(rst1.next())
		{
	%>
	<td align ="left"><%=rst1.getString("Customer")%></td>
	<td align ="left"><%=rstrep.getString("Technicion")%></td>
	<td align ="left"><%=rstrep.getString("VehRegNo")%></td>
	<td align ="left"> <%=rstrep.getString("Status")%></td>
	
	
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rstrep.getString("VehRegNo")+"' and (TheDate >='"+rstrep.getDate("DofAllocation")+"' or TheDate <'"+rstrep.getDate("DofAllocation")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td align ="left"><font color=""><%=rst11.getString("Location") %></font></td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
	<td align ="left"><%=rstrep.getString("ActualProb") %></td>
	<td align ="left"><%=rst1.getString("RegBy")%></td>
	
	<%
		}
		else
		{
		%>
	<td>--</td>
	<td>--</td>
	<td>--</td>
	<%
		}	
	%>
		</tr>		
		<%
		i++;
		
		
	}
	
	
	
}else if(loop_insp.equals("pp2")){
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Realloacation Details for  All Representatives from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>	
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
		<td><b>Token no</b></td>
		<td><b>VehRegNo</b></td>
		<td><b>Transporter</b></td>
		<td><b>Vehicle Available Date</b></td>
		<td><b>NewTechnician</b></td>
		<td><b>NewLocation</b></td>
		<td><b>OldAvailableDate</b></td>
		<td><b>OldLocation</b></td>
		<td><b>OldTechnician</b></td>
		<td><b>comment</b></td>
		<td><b>AllocatedBy By</b></td>
		<td><b>Reason</b></td>
		<td><b>contactdetails</b></td>
	
	
	
	</tr>
	<%
	
		
	//sql="select TechName from t_techlist where   Available='Yes' ";
	//out.print(sql);
	//ResultSet rst=st.executeQuery(sql);
//	//System.out.println("sql---->" +  sql);
	//String tech="";
	int i=1;
	//while(rst.next())
	
		//tech=rst.getString("TechName");
		sql="select * from db_CustomerComplaints.t_reallocated where NewAvailableDate 	 between '"+fromdate+"' and '"+todate+"' and  	AllocatedBy in (select name from t_admin where URole='service' and Active ='yes') ";
		//sql="select * from t_techlist where TechName='"+techname+"' and Available='Yes'";
		ResultSet rst3=st1.executeQuery(sql);
		//System.out.println("sql--pp2-->" +  sql);
		while(rst3.next()){
		
		
		
	%>
	<tr>
<td><%=i%></td>
	<td align ="right"><%=rst3.getString("Tno")%></td>
	<td align ="right"><%=rst3.getString("VehRegNo")%></td>
	<td align ="left"><%=rst3.getString("Transporter")%></td>
		<%
		try
		{
		%>
		
		<td align ="right"><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("NewAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst3.getString("NewTechnician")%></td>
		<td align ="left"><%=rst3.getString("NewLocation")%></td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("OldAvailableDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
		
		<td align ="left"><%=rst3.getString("OldLocation")%></td>
		<td align ="left"><%=rst3.getString("OldTechnician")%></td>
		<td align ="left"> <%=rst3.getString("comment")%></td>
		
		
		<td align ="left"><%=rst3.getString("AllocatedBy")%></td>
		<td align ="left"><%=rst3.getString("Reason")%></td>
		<td align ="left"><%=rst3.getString("contactdetails")%></td>
		
		
		
		
		
		</tr>	
	
	
	<%
	i++;
	}
	
	%>
</table>
	</td>
	</tr>	
	</table>		

	
	
	
	
<%
}else if(loop_insp.equals("pp3")){
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost Of Complaint Details for  All Representatives from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>	
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
<% 		
sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and CostOfInspection <> '0' and inspection='No' and RegBy in (select name from t_admin where URole='service' and Active ='yes')  ";	
ResultSet rstcs=st.executeQuery(sql);
//System.out.println("sql--pp3-->" +  sql);
int i=1;
while(rstcs.next()){
	%>
	<tr>
<td align ="right"><%=i%></td>

	<%
	try
	{
	%>
	
	<td align ="right"><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("TdyDate"))%></font></td>
	<%
	}catch(Exception e){
		
		out.println("-");
		
	}
	
	%>

<td align ="right"><font color=''><%=rstcs.getString("UnitNo") %></font></td>
<td align ="right"><font color=''><%=rstcs.getString("VehicleNo") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Complaint") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Status") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("RegBy") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Result") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("VehAttLoc") %></font></td>


<%
	try
	{
	%>
	
	<td ><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("VehAvaildate"))%></font></td>
	<%
	}catch(Exception e){
		
		out.println("-");
		
	}
	
	%>


<td align ="right"><font color=''><%=rstcs.getString("CostOfInspection") %></font></td>
<td align ="right"><font color=''><%=rstcs.getString("ClaimDetails") %></font></td>
<td align ="right"> <font color=''><%=rstcs.getString("DurationOfClosure") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("DeviceIsFixed") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("GPSPleacement") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("PowerConnection") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("JRMOther") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("inspection") %></font></td>



</tr>	
	
	
	<%
	i++;
	}
	
	 
	%>
	
	 

	</table>
	</td>
	</tr>	
	</table>	
	
	
<%	
	
	
	
}else if(loop_insp.equals("pp4")){
    
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Cost Of Inspection Details for All Representatives from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>	
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPleacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther.</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
<% 		
sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and CostOfInspection <> '0'  and inspection='Yes' and RegBy in (select name from t_admin where URole='service' and Active ='yes')  ";	
ResultSet rstcs=st.executeQuery(sql);
//System.out.println("sql-pp4--->" +  sql);
int i=1;
while(rstcs.next()){
	%>
	<tr>
<td align ="right"><%=i%></td>

	<%
	try
	{
	%>
	
	<td align ="right"><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("TdyDate"))%></font></td>
	<%
	}catch(Exception e){
		
		out.println("-");
		
	}
	
	%>

<td align ="right"><font color=''><%=rstcs.getString("UnitNo") %></font></td>
<td align ="right"><font color=''><%=rstcs.getString("VehicleNo") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Complaint") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Status") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("RegBy") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("Result") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("VehAttLoc") %></font></td>


<%
	try
	{
	%>
	
	<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rstcs.getDate("VehAvaildate"))%></font></td>
	<%
	}catch(Exception e){
		
		out.println("-");
		
	}
	
	%>


<td align ="right"><font color=''><%=rstcs.getString("CostOfInspection") %></font></td>
<td align ="right"><font color=''><%=rstcs.getString("ClaimDetails") %></font></td>
<td align ="right"><font color=''><%=rstcs.getString("DurationOfClosure") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("DeviceIsFixed") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("GPSPleacement") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("PowerConnection") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("JRMOther") %></font></td>
<td align ="left"><font color=''><%=rstcs.getString("inspection") %></font></td>



</tr>	
	
	
	<%
	i++;
	}
	
	 
	%>
	
	 

	</table>
	</td>
	</tr>	
	</table>	
	
	
<%	
	
	
	
}else if(loop_insp.equals("ab6")){

	
	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Complaints solved without Replacement  by <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
<td><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --></a> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></td>	
	</tr>	
	<tr><td>
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>Tiket.No</b></td>
	<td><b>Date</b></td>
	<td><b>Transporter</b></td>
	<td><b>Technicion</b></td>
	<td><b>VehRegNo.</b></td>
	<td><b>Status</b></td>
	<td><b>Action</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Technician</b></td>
	<td><b>Allocated By</b></td>
	<td><b>Action</b></td>
	</tr>
	<%
		//sql="select * from t_callocation1 where Technicion in(select Distinct(TechName) from t_techlist where Available='Yes')   and  ActualProb <> 'Unit Replace, Okay' and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select tno from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'   ) ";
	sql="select distinct(Tno),DofAllocation,Technicion,VehRegNo,Status,ActualProb from t_callocation1 where Technicion in (select Distinct(TechName) from t_techlist where Available='Yes') and  ActualProb <> 'Unit Replace, Okay'   and VehAvailDate >='"+fromdate+"' and VehAvailDate <='"+todate+"' and Status='Solved' and tno in (select distinct(tno) from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No'   ) GROUP BY Tno  ";	
	
	ResultSet rst=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		int i=1;
		while(rst.next())
		{
		%>
		<tr>
		<td><%=i%></td>
		<td><%=rst.getString("Tno")%></td>
		<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst.getDate("DofAllocation"))%></td>
		
		<%
		sql="select * from t_complaints1 where tno='"+rst.getString("Tno")+"'";	
		ResultSet rst1=st1.executeQuery(sql);
		if(rst1.next())
		{
	%>

	<td><%=rst1.getString("Customer")%></td>
	<td><%=rst.getString("Technicion")%></td>
	<td><%=rst.getString("VehRegNo")%></td>
	<td><%=rst.getString("Status")%></td>
	<td><%=rst1.getString("Action")%></td>
	
	<%		sql="select *from t_onlinedata where VehicleRegNo='"+rst.getString("VehRegNo")+"' and (TheDate >='"+rst.getDate("DofAllocation")+"' or TheDate >='"+rst.getDate("DofAllocation")+"') order by TheDate Desc";
			ResultSet rst11=st3.executeQuery(sql);
			if(rst11.next())
			{
	%>
				<td><font color=""><%=rst11.getString("TheDate") %><br><%=rst11.getString("TheTime") %></font></td>
				<td><font color=""><%=rst11.getString("Location") %></font></td>
	<%		}
			else
			{
				%>
				<td>-</td>
				<td>-</td>
	<%
			}
			
	%>
	<td><%=rst.getString("Technicion")%></td>
		
	<td><%=rst1.getString("RegBy")%></td>
	<td><%=rst1.getString("Action")%></td>
	<%
		}
		else
		{
		%>
	<td>--</td>
	<td>--</td>
	<td>--</td>
	<%
		}	
	%>
		</tr>		
		<%
		i++;
		}
		
	
	
	
	
}else if(loop_insp.equals("rep")) {



	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Average Closure Duration for  <%=regby%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%

	//sql="select * from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet cstavg=st1.executeQuery(sql);
	////System.out.println("sql---->" +  sql);
	//int token3 =0; 
          
        	  //token3 =cstavg.getInt("Tno");	
	
	
        	  ////System.out.println("token3---->" +token3);
	
	
        		
	
	
        			
        			
        			int i=1;
        			
        			
        			
        			
        			
        			
        			
        			
	
	sql="select *   from db_CustomerComplaints.t_complaints1 where CDate >= '"+fromdate+"' and PSolDate <= '"+todate+"'  and  inspection='No' and DurationOfClosure <> '-'  and DurationOfClosure <> '0:0'  and tno in (select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and RegBy='"+regby+"'  order by DofAllocation )  ";
		//out.print(sql);
		ResultSet rst11=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		while(rst11.next())
		{
		%>
		<tr>
	<td align ="right"><div align ="right"> <%=i%></div>  </td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("UnitNo") %></font></div> </td>
	<td><font color=''><%=rst11.getString("VehicleNo") %></font></td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Complaint") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Status") %></font></div> </td>
	<td align ="left" > <div align ="left"><font color=''><%=rst11.getString("RegBy") %></font></div> </td>
	<td align ="left"><div align ="left">  <font color=''><%=rst11.getString("Result") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("VehAttLoc") %></font></div> </td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("CostOfInspection") %></font></div> </td>
	<td align ="left"><div align ="right">  <font color=''><%=rst11.getString("ClaimDetails") %></font></div> </td>
	<td align ="right"> <div align ="right"><font color=''><%=rst11.getString("DurationOfClosure") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("DeviceIsFixed") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("GPSPleacement") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("PowerConnection") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("JRMOther") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("inspection") %></font></div> </td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		}
        		



	
	
	
}else if(loop_insp.equals("reptot")){




	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Average Closure Duration for  All Representatives from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Techician</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%

	//sql="select * from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet cstavg=st1.executeQuery(sql);
	////System.out.println("sql---->" +  sql);
	//int token3 =0; 
          
        	  //token3 =cstavg.getInt("Tno");	
	
	
        	  ////System.out.println("token3---->" +token3);
	
	
        		
	
	
        			
        			
        			int i=1;
        			
        			
        			
        			
        			
        			
        			
        			
	
	sql="select *   from db_CustomerComplaints.t_complaints1 where CDate >= '"+fromdate+"' and PSolDate <= '"+todate+"'  and  inspection='No'  and DurationOfClosure <> '-'  and DurationOfClosure <> '0:0' and  tno in (select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and RegBy in (select distinct(Name)  from t_admin where (URole='service'  or URole ='SuperTech') and Active ='yes' )  order by DofAllocation )  ";
		//out.print(sql);
		ResultSet rst11=st.executeQuery(sql);
		//System.out.println("sql--repavg-->" +  sql);
		
		while(rst11.next())
		{
		%>
		<tr>
	<td align ="right"><div align ="right"> <%=i%></div>  </td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td align ="left"><div align ="left"> <font color=''><%=techname %></font> </div></td>
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("UnitNo") %></font></div> </td>
	<td><font color=''><%=rst11.getString("VehicleNo") %></font></td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Complaint") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Status") %></font></div> </td>
	<td align ="left" > <div align ="left"><font color=''><%=rst11.getString("RegBy") %></font></div> </td>
	<td align ="left"><div align ="left">  <font color=''><%=rst11.getString("Result") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("VehAttLoc") %></font></div> </td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("CostOfInspection") %></font></div> </td>
	<td align ="left"><div align ="right">  <font color=''><%=rst11.getString("ClaimDetails") %></font></div> </td>
	<td align ="right"> <div align ="right"><font color=''><%=rst11.getString("DurationOfClosure") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("DeviceIsFixed") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("GPSPleacement") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("PowerConnection") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("JRMOther") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("inspection") %></font></div> </td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		}
        		



	
	
	

	
	
	
}else{


	%>
	<table border="0" width="750px" align="center">
	<tr><td align="center"><font color="brown" size="2">Average Closure Duration for  <%=caller%> from <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%> </font></td>
	<td></td>
	</tr>	
</table>
	<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a></div>
	
	<table border="1" width="100%" align="center" class="sortable">
	<tr>
	<td><b>Sr.</b></td>
	<td><b>TdyDate</b></td>
	<td><b>Techician</b></td>
	<td><b>UnitNo</b></td>
	<td><b>VehicleNo</b></td>
	<td><b> Complaint</b></td>
	<td><b>Status</b></td>
	<td><b>Regby</b></td>
	<td><b>Result</b></td>
	<td><b>VehAttLoc</b></td>
	<td><b>VehAvailDate</b></td>
	<td><b>Cost</b></td>
	<td><b>Claim</b></td>
	<td><b>Duration</b></td>
	<td><b>DeviceIsFixed</b></td>
	<td><b>GPSPlacement</b></td>
	<td><b>Power</b></td>
	<td><b>JRMOther</b></td>
	<td><b>Inspection</b></td>
	
	</tr>
	<%

	//sql="select * from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and  Technicion = '"+techname+"'  ";
	//ResultSet cstavg=st1.executeQuery(sql);
	////System.out.println("sql---->" +  sql);
	//int token3 =0; 
          
        	  //token3 =cstavg.getInt("Tno");	
	
	
        	  ////System.out.println("token3---->" +token3);
	
	
        		
	
	
        			
        			sql="select Tno from db_CustomerComplaints.t_callocation1 where DofAllocation between '"+fromdate+"' and '"+todate+"' and Technicion = '"+caller+"'  ";
        			ResultSet rst=st1.executeQuery(sql);
        			//System.out.println("sql---->" +  sql);
        			int i=1;
        			String ab7 =""; 
        			//System.out.println("sql---->" +  sql);
        			while(rst.next()){		
        			
        			ab7=rst.getString("Tno");
        			
        			
        			
        			
        			
        			
        			
	
	sql="select * from db_CustomerComplaints.t_complaints1 where TdyDate between '"+fromdate+"' and '"+todate+"' and inspection='No' and Tno='"+ab7+"' and DurationOfClosure <> '-'  and DurationOfClosure <> '0:0'  ";
		//out.print(sql);
		ResultSet rst11=st.executeQuery(sql);
		//System.out.println("sql---->" +  sql);
		
		if(rst11.next())
		{
		%>
		<tr>
	<td align ="right"><div align ="right"> <%=i%></div>  </td>
		<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("TdyDate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	<td align ="left"><div align ="left"> <font color=''><%=techname %></font> </div></td>
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("UnitNo") %></font></div> </td>
	<td><font color=''><%=rst11.getString("VehicleNo") %></font></td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Complaint") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("Status") %></font></div> </td>
	<td align ="left" > <div align ="left"><font color=''><%=rst11.getString("RegBy") %></font></div> </td>
	<td align ="left"><div align ="left">  <font color=''><%=rst11.getString("Result") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("VehAttLoc") %></font></div> </td>
	
	
	<%
		try
		{
		%>
		
		<td><font color=''><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst11.getDate("VehAvaildate"))%></font></td>
		<%
		}catch(Exception e){
			
			out.println("-");
			
		}
		
		%>
	
	
	<td align ="right"><div align ="right"> <font color=''><%=rst11.getString("CostOfInspection") %></font></div> </td>
	<td align ="left"><div align ="right">  <font color=''><%=rst11.getString("ClaimDetails") %></font></div> </td>
	<td align ="right"> <div align ="right"><font color=''><%=rst11.getString("DurationOfClosure") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("DeviceIsFixed") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("GPSPleacement") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("PowerConnection") %></font></div> </td>
	<td align ="left"><div align ="left"> <font color=''><%=rst11.getString("JRMOther") %></font></div> </td>
	<td align ="left"> <div align ="left"><font color=''><%=rst11.getString("inspection") %></font></div> </td>
	
	
	
	</tr>	
		
		
		<%
		i++;
		}
        		
}

}    
		%>
		
		
		
<% 

	
	}
 }
 }catch(Exception e)
{
	out.print("Exception -->"+e);
	e.printStackTrace();

}
finally
{
	conn.close();
	conn1.close();

}
%>
		<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
		</table>
		</td>
		</tr>
		</table>
		</table>
		</td>
		</tr>
		</table>
		</table>
		</td>
		</tr>
		</table>
		</table>
		</td>
		</tr>
		</table>
		</table>
		</td>
		</tr>
		</table>
		</div>
		</form>
	

<!-- code end here --->

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
