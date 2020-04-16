	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.UnitData"
		import="com.transworld.diary.framework.ConsolidatedUnitDataProvider"
		import="com.transworld.diary.framework.ConsolidatedUnitData"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stmtsp1,stmtsp11,stmtsp,stmtsp111,stQuickTest,st5,st6, st9, st11,st23, st01,stmt1,stmt2, st12,stamc,stamc1 ,stwar1,stwar2,stwar3,stwar4,cnt1,cnt2,cnt3,cnt4,cnt5,cnt6,cnt7,cnt8;


String sql,sql1,sql2,sql3,sql4;

int total1=0,open1=0,closed1=0;

%>

				
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application"></jsp:useBean>

<jsp:useBean id="consolidatedUnitDataProvider" 
			 type="com.transworld.diary.framework.ConsolidatedUnitDataProvider"
			 scope="application"></jsp:useBean>			 


<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<title>Seven Day Diary System.</title>
	<script type="text/javascript">

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
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
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
String   userrole1=session.getAttribute("userrole").toString();
   %>
   <%
   if(userrole1.equalsIgnoreCase("supertech"))
   {%>
	   <%@ include file="headertech.jsp" %>
	   
   <%}else{
	%>   
	  <%@ include file="header1.jsp" %>
	   
   <%}
   %> 

        </div>
          <div id="gbox1">
            <div id="gbox-bg1">
              <div id="gbox-grd1">





<%
	final String userName=session.getAttribute("username").toString();


	final String userRole=session.getAttribute("userrole").toString();
	final String us1=userName.toUpperCase();
	List<ConsolidatedUnitData> consolidatedData= null;
	int numRecords = 0;
	List<UnitData> transporterWiseUnitData=null;
    try{
    	transporterWiseUnitData = unitDetailsDao.getUnitData(userRole,userName);       	
       	consolidatedData = consolidatedUnitDataProvider.getConsolidatedViewData(transporterWiseUnitData);
       	numRecords = transporterWiseUnitData.size();	 
	} catch(Exception e){
		e.printStackTrace();
	}

    
    %>
    
    	
    

		
		<div align="right"> 
			<a href="mainpage1excel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
		</div>
		
		<hr width="750px"/>    	
             	
        <font color="yellow"> <B> Yellow </B> </font> mark means Transporter is Blocked.
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<td> Sr.</td>
		<td> Transporter</td>
		<td>Open</td>
		<td>closed</td>
		<td>Total</td>
		<td>Install</td>
		<td>Current</td>
		<td>No GPS</td>
		<td>1 to 2 Days</td>
		<td>3 to 5 Days</td>
		<td>6 Days</td>
		<td>Discon- nected</td>
		<td>Rem- oved</td>
		<td>De-Activ <br/>ation <br/> Req</td>
		<td>In - Active</td>
		<td>Mis- sing</td>
		<td>Comp.-  Allocated</td>
		<td>Comp. Not Re- Allocated</td>
		<td> Assign to</td>
		<td> Today's Call/s (Transp)</td>
		<td> Today's Call/s (Techs)</td> 
		</tr>	
<%
	
try{
	
	 System.out.println(">>>INSIDE TRY 11111111<<<");
	
	Class.forName(MM_dbConn_DRIVER);
	 System.out.println(">>>INSIDE TRY 2222222<<<");
    //conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    System.out.println(">>>INSIDE TRY 333333333<<<");
    st=conn1.createStatement();
  
    System.out.println(">>>INSIDE TRY 444444444<<<");
    
	st1=conn1.createStatement();
	
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	stmtsp1=conn1.createStatement();
	System.out.println(">>>INSIDE TRY 555555<<<");
   
	//st2=conn.createStatement();
	
	System.out.println(">>>INSIDE TRY 666666<<<");
	
	int f=1;
	
	String check="",stg11="",stg22="",stg33="",stg44="",open="",close="",total="",sqlcnt="",sqlcnt1="",sqlcnt2="",sqlcnt3="",sqlcnt4="",sqlcnt5="",sqlcnt6="",sqlcnt7="";
	String chk="ToCheck",stg1="Stage1Ticket",stg2="Stage2Ticket",stg3="Stage3Ticket",stg4="Stage4Ticket",status="Closed",status1="AutoClosed",closed="close",opentct="open",opened="opened",closedtot="closedtot",totaltc="totaltc";
    String opent="All",closet="All",totalt="All";
  
	System.out.println(">>>INSIDE TRY 77777<<<");

	
	
	
	
	try{
	
	String dlt="delete from db_gps.t_onlinedatacopy ";
	st1.executeUpdate(dlt);
	System.out.println(">>>dlt<<<"+dlt);
	
	String insrt="insert into  db_gps.t_onlinedatacopy(select * from db_gps.t_onlinedata)  ";
	st2.executeUpdate(insrt);
	System.out.println(">>>insrt<<<"+insrt);
	
	}catch(Exception e33)
	{
		
		System.out.println(">>>Exception e33<<<"+e33);
	}
	
	

	if(userName.equalsIgnoreCase("Kamal Dixit") ||  userName=="Kamal Dixit")
    {


try
	{
		
	 System.out.println(">>>INSIDE TRY<<<");
          
	    
	    
	    
	    for (int counter = 0; counter < numRecords; counter++) 
		{
			final UnitData currentRecord = transporterWiseUnitData.get(counter);
			int i = counter+1;
			int j = counter+1;
             
             

			if(currentRecord.getRepresentative().equalsIgnoreCase("Kamal Dixit") || currentRecord.getRepresentative()=="Kamal Dixit")
			{
			
			
			
			sqlcnt5="select count(*) as cnt5  from db_gps.t_livetickettest WHERE STATUS = 'open' and vehid in (select vehiclecode from db_gps.t_onlinedata where transporter ='"+currentRecord.getOwnerName()+"') ";
		  	ResultSet rs155=st.executeQuery(sqlcnt5);
		  	 System.out.println(">>>sqlcnt5<<<"+sqlcnt5);
		  	 if(rs155.next())
		  	 {
		  		open=rs155.getString("cnt5");
		  		 
		  		 
		  	 }
		  	sqlcnt6="select count(*) as cnt6  from db_gps.t_ticketmastertest WHERE  vehid in (select vehiclecode from db_gps.t_onlinedatacopy where transporter ='"+currentRecord.getOwnerName()+"') and STATUS = 'AutoClosed' or STATUS = 'Closed'  ";
		  	ResultSet rs156=st1.executeQuery(sqlcnt6);
			 System.out.println(">>>sqlcnt6<<<"+sqlcnt6);
		  	 if(rs156.next())
		  	 {
		  		close=rs156.getString("cnt6");
		  		 
		  		 
		  	 }
		  	sqlcnt4="select count(tcategory) as cnt7  from db_gps.t_ticketmastertest where vehid in (select vehiclecode from db_gps.t_onlinedatacopy where transporter ='"+currentRecord.getOwnerName()+"')  ";
		  	ResultSet rs158=st2.executeQuery(sqlcnt4);
		  	System.out.println(">>>sqlcnt4<<<"+sqlcnt4);
		  	
		  	 if(rs158.next())
		  	 {
		  		total=rs158.getString("cnt7");
		  		 
		  		 
		  	 }
		  	 
		  	sqlcnt2="select count(*) as cnt8  from db_gps.t_ticketmastertest  ";
		  	ResultSet rs157=st4.executeQuery(sqlcnt2);
		  	System.out.println(">>>sqlcnt2<<<"+sqlcnt2);
		  	 	 if(rs157.next())
		  	 {
		  		total1=rs157.getInt("cnt8");
		  		 
		  		 
		  	 }
		  	 
		  	 
		  	 
			  	sqlcnt1="select count(*) as cnt9  from db_gps.t_livetickettest where status ='open'  ";
			  	ResultSet rs151=st3.executeQuery(sqlcnt1);
			  	System.out.println(">>>sqlcnt2<<<"+sqlcnt1);
			  	
			  	 if(rs151.next())
			  	 {
			  		open1=rs151.getInt("cnt9");
			  		 
			  		 
			  	 }
		  	 
		  	 
			  	sqlcnt="select count(*) as cnt9  from db_gps.t_ticketmastertest where status ='closed' or  status ='AutoClosed'  ";
			  	ResultSet rs152=stmtsp1.executeQuery(sqlcnt);
			  	System.out.println(">>>sqlcnt2<<<"+sqlcnt);
			  	
			  	 if(rs152.next())
			  	 {
			  		closed1=rs152.getInt("cnt9");
			  		 
			  		 
			  	 }
		  	 
		  	 


%>	
		<tr <%=currentRecord.isOwnerBlocked() ? "bgcolor='yellow'" :""%>>
		<td><%=f%> </td>
		<td><b><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=currentRecord.getOwnerName()%></a></b>
			<br/>	
		<div class="popup" id="popup<%=i%>">
			<table border="0" >
			<tr><td><a href='callhistory.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Call HIstory</a></td></tr>
			<tr><td><a href='rephistory.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Maintenance</a></td></tr>
			<tr><td><a href='comprep.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Comp. Report</a></td></tr>
			<tr><td><a href="addcontact.jsp?transporter=<%=currentRecord.getOwnerName()%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
			<tr><td><a href="addunit.jsp?transporter=<%=currentRecord.getOwnerName()%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr>		
			<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
			</table>
		</div>		
			</td>
		
		<td><b><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&opentct=<%=opentct %>'><%=open%></a></b>
										
			</td>
		
		
		
		<td>
			<div align="right"><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&status=<%=status %>&status1=<%=status1%>'><font color="red"><%=close%></font></a></div>
		</td>
		<td>
		
		
			<div align="right"><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&closed=<%=closed %>'><font color="red"><%=total%></font></a></div>
		</td>
		<td>
			<div align="right"><a href='fullfleet.jsp?transporter=<%=currentRecord.getOwnerName()%>'><font color="red"><%=currentRecord.getInstalledCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='currentdata.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getCurrentCount() %></font></a></div>
		</td>
		<td>
			<div align='right'><a href='nogpsvehs.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getNoGpsCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='delaydata.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getTwoDaysCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='delaydata1.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getFiveDaysCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='sixdays.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getSixDaysCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='disconnected.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getDisconnectedCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='removedunits.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getRemovedCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='deactivatedreq.jsp?Transporter=<%=currentRecord.getOwnerName()%>'> <font color='red'><%=currentRecord.getDeactivationCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='deactivatedreq.jsp?Transporter=<%=currentRecord.getOwnerName()%>'> <font color='red'><%=currentRecord.getNoActiveCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href="showmissingunits.jsp?trans=<%=currentRecord.getOwnerName()%>"><font color='red'><%=currentRecord.getMissingCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href='compallocated.jsp?transporter=<%=currentRecord.getOwnerName()%>'><font color='red'><%=currentRecord.getComplaintsAllocatedCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><a href="complaintview.jsp?transporter=<%=currentRecord.getOwnerName()%>"><font color='red'><%=currentRecord.getComplaintsUnallocatedCount()%></font></a></div>
		</td>
		<td>
			<div align='right'><%=currentRecord.getRepresentative()%></div>
		</td>		
		<td>
			<div align='right'><font color='red'><%=currentRecord.getTransporterCallCount()%></font></div>
		</td>
		<td>
			<div align='right'><font color='red'><%=currentRecord.getTechnicianCallCount()%></font></div>
		</td>
		</tr>		
<%
		f++;
			}
			
		}
	}catch (Exception e) {
			out.println("<tr><td colspan=23>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
	</table>
<%
	}
	try
	{
		NumberFormat nf = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2) ;
%>	
		<table width="750px" class="sortable">
		<tr>
			<td colspan="14"> <div align="center"> <b> <i>Performance </i> </b> </div> </td>
		</tr>
		<tr>
		<td> <b>Open</b> </td>
		<td><b>closed  </b> </td>
		<td><b> Total</b> </td>
		<td><b>Installed</b></td>
		<td><b>Current</b></td>
		<td><b>No GPS</b></td>
		<td><b> 1 to 2<br/> Days <br/></b></td>
		<td><b> 3 to 5<br/> Days <br/></b></td>
		<td><b> 6 Days</b></td>
		<td><b>Disconn<br/>ected <br/> </b></td>
		<td><b>Rem<br/> oved <br/></b></td>
		<td><b>DeActiva <br/>tion Req <br/></b></td>
		<td><b>In Active</b></td>
		<td><b>Miss<br/> ing<br/></b></td>
		<td><b>Comp All<br/> ocated<br/></b></td>
		<td><b>Comp UnAll<br/> ocated<br/></b></td>
		<td><b>Today's Calls <br/> (Transp)<br/></b></td>
		<td><b>Today's Calls <br/> (Techs)<br/></b></td>
		<td><b>Delay<br/> %age <br/></b></td>
		</tr>
<% 
		for (final ConsolidatedUnitData currentRecord : consolidatedData) 
		{
%>
		<tr>
		
		
		<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=opent%>&opened=<%=opened %>"> <%=open1%></a></font></div></td>
		<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=closet%>&closedtot=<%=closedtot %>" > <%=closed1%></a></font></div></td>
		<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=totalt%>&totaltc=<%=totaltc %>"> <%=total1%></a></font></div></td>
		
		
		<td><div align="right"><font color="#660033" ><a href="totinstalled.jsp"> <%=currentRecord.getInstalledCount()%></a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="totalcurrentvehs.jsp"> <%=currentRecord.getCurrentCount()%> </a> </font></div></td>
		<td><div align="right"><font color="#660033"><a href="nogpstotal.jsp"> <%=currentRecord.getNoGpsCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="tot1to2delayvehs.jsp"> <%=currentRecord.getTwoDaysCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="tot3to6delayvehs.jsp"> <%=currentRecord.getFiveDaysCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="totsixdays.jsp"> <%=currentRecord.getSixDaysCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="totdisconnected.jsp"> <%=currentRecord.getDisconnectedCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><a href="totremovedvehs.jsp"> <%=currentRecord.getRemovedCount()%> </a></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getDeactivationCount()%></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getNoActiveCount()%></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getMissingCount()%></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getComplaintAllocatedCount()%></font></div></td>
		<td><div align="right"><font color="#660033"> <%=currentRecord.getComplaintUnallocatedCount() %></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getTransporterCallCount() %></font></div></td>
		<td><div align="right"><font color="#660033"><%=currentRecord.getTechnicianCallCount()%></font></div></td>		
		<td><div align="right"><font color="#660033"><%=nf.format(currentRecord.getPercentageDelay())%></font></div></td>
		</tr>
<% 		
		}
	}catch (Exception e) {
			out.println("<tr><td colspan=16>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally {
%>
		</table>
<%		
	}
	
    }else{


    	try
    		{
    			
    		 System.out.println(">>>INSIDE TRY<<<");
    	          
    		    
    		    
    		    
    		    for (int counter = 0; counter < numRecords; counter++) 
    			{
    				final UnitData currentRecord = transporterWiseUnitData.get(counter);
    				int i = counter+1;
    				int j = counter+1;



    				
    				
    				
    				
    				sqlcnt5="select count(*) as cnt5  from db_gps.t_ticketmastertest WHERE STATUS = 'open' and vehid in (select vehiclecode from db_gps.t_onlinedatacopy where transporter ='"+currentRecord.getOwnerName()+"') ";
    			  	ResultSet rs155=st.executeQuery(sqlcnt5);
    			  	 System.out.println(">>>sqlcnt5<<<"+sqlcnt5);
    			  	 if(rs155.next())
    			  	 {
    			  		open=rs155.getString("cnt5");
    			  		 
    			  		 
    			  	 }
    			  	sqlcnt6="select count(*) as cnt6  from db_gps.t_ticketmastertest WHERE  vehid in (select vehiclecode from db_gps.t_onlinedatacopy where transporter ='"+currentRecord.getOwnerName()+"') and STATUS = 'AutoClosed' or STATUS = 'Closed'  ";
    			  	ResultSet rs156=st1.executeQuery(sqlcnt6);
    				 System.out.println(">>>sqlcnt6<<<"+sqlcnt6);
    			  	 if(rs156.next())
    			  	 {
    			  		close=rs156.getString("cnt6");
    			  		 
    			  		 
    			  	 }
    			  	sqlcnt4="select count(tcategory) as cnt7  from db_gps.t_ticketmastertest where vehid in (select vehiclecode from db_gps.t_onlinedatacopy where transporter ='"+currentRecord.getOwnerName()+"')  ";
    			  	ResultSet rs158=st2.executeQuery(sqlcnt4);
    			  	System.out.println(">>>sqlcnt4<<<"+sqlcnt4);
    			  	
    			  	 if(rs158.next())
    			  	 {
    			  		total=rs158.getString("cnt7");
    			  		 
    			  		 
    			  	 }
    			  	 
    			  	sqlcnt2="select count(*) as cnt8  from db_gps.t_ticketmastertest  ";
    			  	ResultSet rs157=st4.executeQuery(sqlcnt2);
    			  	System.out.println(">>>sqlcnt2<<<"+sqlcnt2);
    			  	
    			  	 if(rs157.next())
    			  	 {
    			  		total1=rs157.getInt("cnt8");
    			  		 
    			  		 
    			  	 }
    			  	 
    			  	 
    				  	sqlcnt1="select count(*) as cnt9  from db_gps.t_ticketmastertest where status ='open'  ";
    				  	ResultSet rs151=st3.executeQuery(sqlcnt1);
    				  	System.out.println(">>>sqlcnt2<<<"+sqlcnt1);
    				  	
    				  	 if(rs151.next())
    				  	 {
    				  		open1=rs151.getInt("cnt9");
    				  		 
    				  		 
    				  	 }
    			  	 
    			  	 
    				  	sqlcnt="select count(*) as cnt9  from db_gps.t_ticketmastertest where status ='closed' or  status ='AutoClosed'  ";
    				  	ResultSet rs152=stmtsp1.executeQuery(sqlcnt);
    				  	System.out.println(">>>sqlcnt2<<<"+sqlcnt);
    				  	
    				  	 if(rs152.next())
    				  	 {
    				  		closed1=rs152.getInt("cnt9");
    				  		 
    				  		 
    				  	 }
    			  	 
    			  	 


    	%>	
    			<tr <%=currentRecord.isOwnerBlocked() ? "bgcolor='yellow'" :""%>>
    			<td><%=i%> </td>
    			<td><b><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=currentRecord.getOwnerName()%></a></b>
    				<br/>	
    			<div class="popup" id="popup<%=i%>">
    				<table border="0" >
    				<tr><td><a href='callhistory.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Call HIstory</a></td></tr>
    				<tr><td><a href='rephistory.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Maintenance</a></td></tr>
    				<tr><td><a href='comprep.jsp?trans=<%=currentRecord.getOwnerName()%>' onclick="toggleDetails(<%=i%>,false);">Comp. Report</a></td></tr>
    				<tr><td><a href="addcontact.jsp?transporter=<%=currentRecord.getOwnerName()%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
    				<tr><td><a href="addunit.jsp?transporter=<%=currentRecord.getOwnerName()%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr>		
    				<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
    				</table>
    			</div>		
    				</td>
    			
    			<td><b><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&opentct=<%=opentct %>'><%=open%></a></b>
    											
    				</td>
    			
    			
    			
    			<td>
    				<div align="right"><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&status=<%=status %>&status1=<%=status1%>'><font color="red"><%=close%></font></a></div>
    			</td>
    			<td>
    			
    			
    				<div align="right"><a href='liveticket.jsp?owner=<%=currentRecord.getOwnerName()%>&closed=<%=closed %>'><font color="red"><%=total%></font></a></div>
    			</td>
    			<td>
    				<div align="right"><a href='fullfleet.jsp?transporter=<%=currentRecord.getOwnerName()%>'><font color="red"><%=currentRecord.getInstalledCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='currentdata.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getCurrentCount() %></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='nogpsvehs.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getNoGpsCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='delaydata.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getTwoDaysCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='delaydata1.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getFiveDaysCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='sixdays.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getSixDaysCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='disconnected.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getDisconnectedCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='removedunits.jsp?transporter=<%=currentRecord.getOwnerName()%>' ><font color='red'><%=currentRecord.getRemovedCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='deactivatedreq.jsp?Transporter=<%=currentRecord.getOwnerName()%>'> <font color='red'><%=currentRecord.getDeactivationCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='deactivatedreq.jsp?Transporter=<%=currentRecord.getOwnerName()%>'> <font color='red'><%=currentRecord.getNoActiveCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href="showmissingunits.jsp?trans=<%=currentRecord.getOwnerName()%>"><font color='red'><%=currentRecord.getMissingCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href='compallocated.jsp?transporter=<%=currentRecord.getOwnerName()%>'><font color='red'><%=currentRecord.getComplaintsAllocatedCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><a href="complaintview.jsp?transporter=<%=currentRecord.getOwnerName()%>"><font color='red'><%=currentRecord.getComplaintsUnallocatedCount()%></font></a></div>
    			</td>
    			<td>
    				<div align='right'><%=currentRecord.getRepresentative()%></div>
    			</td>		
    			<td>
    				<div align='right'><font color='red'><%=currentRecord.getTransporterCallCount()%></font></div>
    			</td>
    			<td>
    				<div align='right'><font color='red'><%=currentRecord.getTechnicianCallCount()%></font></div>
    			</td>
    			</tr>		
    	<%
    			
    				
    			}
    		}catch (Exception e) {
    				out.println("<tr><td colspan=23>");
    				out.println("Exception :" + e.getMessage());
    				out.println("Cause : " + e.getCause());
    				out.println("</td></tr>");
    				e.printStackTrace();
    		}finally{
    	%>
    		</table>
    	<%
    		}
    		try
    		{
    			NumberFormat nf = NumberFormat.getNumberInstance();
    			nf.setMaximumFractionDigits(2) ;
    	%>	
    			<table width="750px" class="sortable">
    			<tr>
    				<td colspan="14"> <div align="center"> <b> <i>Performance </i> </b> </div> </td>
    			</tr>
    			<tr>
    			<td> <b>Open</b> </td>
    			<td><b>closed  </b> </td>
    			<td><b> Total</b> </td>
    			<td><b>Installed</b></td>
    			<td><b>Current</b></td>
    			<td><b>No GPS</b></td>
    			<td><b> 1 to 2<br/> Days <br/></b></td>
    			<td><b> 3 to 5<br/> Days <br/></b></td>
    			<td><b> 6 Days</b></td>
    			<td><b>Disconn<br/>ected <br/> </b></td>
    			<td><b>Rem<br/> oved <br/></b></td>
    			<td><b>DeActiva <br/>tion Req <br/></b></td>
    			<td><b>In Active</b></td>
    			<td><b>Miss<br/> ing<br/></b></td>
    			<td><b>Comp All<br/> ocated<br/></b></td>
    			<td><b>Comp UnAll<br/> ocated<br/></b></td>
    			<td><b>Today's Calls <br/> (Transp)<br/></b></td>
    			<td><b>Today's Calls <br/> (Techs)<br/></b></td>
    			<td><b>Delay<br/> %age <br/></b></td>
    			</tr>
    	<% 
    			for (final ConsolidatedUnitData currentRecord : consolidatedData) 
    			{
    	%>
    			<tr>
    			
    			
    			<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=opent%>&opened=<%=opened %>"> <%=open1%></a></font></div></td>
    			<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=closet%>&closedtot=<%=closedtot %>" > <%=closed1%></a></font></div></td>
    			<td><div align="right"><font color="#660033" ><a href="liveticket.jsp?owner=<%=totalt%>&totaltc=<%=totaltc %>"> <%=total1%></a></font></div></td>
    			
    			
    			<td><div align="right"><font color="#660033" ><a href="totinstalled.jsp"> <%=currentRecord.getInstalledCount()%></a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="totalcurrentvehs.jsp"> <%=currentRecord.getCurrentCount()%> </a> </font></div></td>
    			<td><div align="right"><font color="#660033"><a href="nogpstotal.jsp"> <%=currentRecord.getNoGpsCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="tot1to2delayvehs.jsp"> <%=currentRecord.getTwoDaysCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="tot3to6delayvehs.jsp"> <%=currentRecord.getFiveDaysCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="totsixdays.jsp"> <%=currentRecord.getSixDaysCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="totdisconnected.jsp"> <%=currentRecord.getDisconnectedCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><a href="totremovedvehs.jsp"> <%=currentRecord.getRemovedCount()%> </a></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getDeactivationCount()%></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getNoActiveCount()%></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getMissingCount()%></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getComplaintAllocatedCount()%></font></div></td>
    			<td><div align="right"><font color="#660033"> <%=currentRecord.getComplaintUnallocatedCount() %></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getTransporterCallCount() %></font></div></td>
    			<td><div align="right"><font color="#660033"><%=currentRecord.getTechnicianCallCount()%></font></div></td>		
    			<td><div align="right"><font color="#660033"><%=nf.format(currentRecord.getPercentageDelay())%></font></div></td>
    			</tr>
    	<% 		
    			}
    		}catch (Exception e) {
    				out.println("<tr><td colspan=16>");
    				out.println("Exception :" + e.getMessage());
    				out.println("Cause : " + e.getCause());
    				out.println("</td></tr>");
    				e.printStackTrace();
    		}finally {
    	%>
    			</table>
    	<%		
    		}
    		
    	    }
}catch(Exception e)
{
	
	e.printStackTrace();
}

		
		
	





%>
		</div>
   		</div> 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
 </body>
</html>	