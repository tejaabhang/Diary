<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp"%>
<%!Connection conn, conn1;
	Statement st_user,st, st1, st2, st3, st4, stmtsp1, stmtsp11, stmtsp, stmtsp111,stvhdt,stvhdt1,
			stQuickTest, st5, st6, st9, st11, st23, st01, stmt1, stmt2, st12,
			stamc, stamc1, stwar1, stwar2, stwar3, stwar4, cnt1, cnt2, cnt3,
			cnt4, cnt5, cnt6, cnt7, cnt8 , cnttot,cnttot1,cnttot2,cnttot3,cnttot4,cnttot5,cnttot6,cnttot12;
	String data, data1, fromdate = "", transporter="", Svehlist, today, typeunit;
	String InstalledPlace, InstPlace = "N.A.", username, simno = "-",
			mobno = "-", vehiclecode;
	String sqlamc, sqlamc1, sqlamc2, sqlamc3, sqlamc4, sqlbt;
	String sql, sql1, sql2, sql3, sql4;
	String chk = "-", stg1 = "", stg2 = "", stg3 = "", stg4 = "", status = "",
			status1 = "", close1 = "", opentct = "", opened = "",
			closedtot = "", totaltc = "";
	
	String control_reallocation="-",tranporter_realct="-",tcategory_realct="-";
	String sql5, sql6, sql7, sql8;
	String instdate, warranty, expdate, simcomp = "-", peripherals = "-",
			Empname = "", Instruction = "", psno = "", pcbno = "", boxno = "",
			batteryno = "", WMSN = "NA", CodeVersion = "NA", UnitType = "NA",
			battrystatus = "NA", battrystatustime = "NA";
	String t1 = "opened", t2 = "closedtot", t3 = "totaltc";
	String t11 = "All", t22 = "All", t33 = "All";%>



<html><head><title>Seven Day Diary System</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"charset="utf-8" />
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css"/>
	
	
	
<script src="sorttable.js" type="text/javascript"></script>
<script language="javascript">

function gotoExcel(elemId,frmFldId)  
	{  

	//	alert("&&&&&&&&&&&&&&&"+frmFldId)
		try
		{
		 var obj = document.getElementById(elemId);  
      var oFld = document.getElementById(frmFldId); 
      oFld.value = obj.innerHTML;  
    // alert("&&&&&&&&&&&&&&&")
      document.fullfleet1.action = "excel.jsp";
    //  alert("IIIIIIIIIIIIIIIIIII");
     // document.fullfleet1.submit();
     // alert("*********************8");
     // document.fullfleet.action ="excel.jsp";
      document.forms["fullfleet1"].submit();
		}
		catch(e)
		{
		//	alert(e);
		}
	} 

   




 			
</script>
<style>
		.popup {
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
<P></p>
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
    st5=conn1.createStatement();
	st6=conn1.createStatement();
	st23=conn1.createStatement();
	st9=conn1.createStatement();
	st11=conn1.createStatement();
	st12=conn1.createStatement();
	stamc=conn1.createStatement();
	stamc1=conn1.createStatement();
	stmtsp1=conn.createStatement();
	stmtsp111=conn.createStatement();
	stmtsp11=conn.createStatement();
	stmtsp=conn.createStatement();
		stwar1=conn1.createStatement();
		stwar2=conn1.createStatement();
	stwar3=conn1.createStatement();
		stwar4=conn1.createStatement();
		stmt1=conn1.createStatement();
		stmt2=conn1.createStatement();
		cnt1=conn1.createStatement();
		cnt2=conn1.createStatement();
		cnt3=conn1.createStatement();
		cnt4=conn1.createStatement();
		cnt5=conn1.createStatement();
		cnt6=conn1.createStatement();
		cnt7=conn1.createStatement();
		cnt8=conn1.createStatement();
		cnttot1 =conn1.createStatement();
		cnttot2 =conn1.createStatement();
		cnttot3 =conn1.createStatement();
		cnttot4 =conn1.createStatement();
		cnttot5 =conn1.createStatement();
		cnttot6 =conn1.createStatement();
		cnttot =conn1.createStatement();
		cnttot12 =conn1.createStatement();
		st_user =conn1.createStatement();
		stvhdt=conn1.createStatement();
		stvhdt1=conn1.createStatement();
		
    java.util.Date dte = new java.util.Date();
    Format formatter = new SimpleDateFormat("dd-MM-yyyy");
	String today=formatter.format(dte);
    String abc1 ="";
    
    abc1=today;
    int unassignedveh=0,assignedveh=0;
    int a=1;
    String unassigned1="yes";
    try{
transporter=request.getParameter("transporter"); 



System.out.println(">>>>>>transporter >>>>>>>>>>"+transporter);



	java.util.Date defoultdate = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
	miliseconds=miliseconds-1000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	today = formatter.format(defoultdate);
	Svehlist="(0";
  	username=session.getAttribute("username").toString();
  String userrole1=session.getAttribute("userrole").toString();
  	
  	
  
  	String checkbox="",chk1="";
  	
  	
  	
  
        
  	 String check="",stg11="",stg22="",stg33="",stg44="",open1="",total="",sqlcnt="",sqlcnt1="",sqlcnt2="",sqlcnt3="",sqlcnt4="",sqlcnt5="",sqlcnt6="",sqlcnt7="",sqlcnt8;
  	 String  closetotal="";
  	 //int sd=1;
    int open =0,close =0;
    int opent=0;
   
%>
<form name="fullfleet1"  method="post" action="" onsubmit="return validate();" >

<%
String exportFileName="AutoticketReport.xls"; 
%>
 <div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           </div>
	<br>
 
 <div id="table1">	
 
 <table border="0" width="800px" bgcolor="#BDBDBD" align="center">
	<tr>
		<td>
			
			
			
			
			<table border="0" width="100%">
				<tr><td  colspan="6" align="center"><font color="black" size="3">Auto Ticket Report for <%=transporter %> </font></td></tr>
				<tr>
	<td  colspan="8" align="right">
		
		
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
		
                           <div style="text-align:right;margin-left: 50em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
                           </div>
                           
	</td>
	</tr>	
			</table>
		</td>
	</tr>
</table>
   <br>
   <br>
    

<%
//System.out.println(">>>>>>>33333");


String  sqltt="",sqltt1="",sqltt2="",sqltt3="",sqltt4="",sqltt5="";
String ch="0",stt1="0",stt2="",stt3="",stt4="";

System.out.println(">>>transporter<<<"+transporter);



%>


<table border="1" align="center" style="width:800px " class="sortable" cellspacing="0">
<tr bgcolor="#BDBDBD">
	<th><b>Sr.</b></th>
	<th><b>ContactPerson</b></th>
	<th><b>ToCheck</b></th>
	<th><b>Stage1Ticket</b></th>
	<th><b>Stage2Ticket</b></th>
	<th><b>Stage3Ticket</b></th>
	<th><b>Stage4Ticket</b></th>
	<th><b>Total</b></th>
	</tr>

<%


int total_chk=0,Totalcnt=0,finalcnt=0,totalcnt=0,totalcnt1=0,totalcnt2=0,totalcnt3=0,totalcnt4=0,chkcnt=0,stg1cnt=0,stg2cnt=0,stg3cnt=0,stg4cnt=0;
String ownrtct="-",tctgry="-",cntcprsn="-",tid="-";

 
 System.out.println(">>>transporter@@@@@@@@<<<"+transporter);

 String newsql="select a.vehid as vehid  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode  and b.ownername='"+transporter+"' group by a.tcategory,a.tid  ";
	
	// String newsql="select count(*) as total,a.tcategory as category,b.ownername as ownername  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode  and b.ownername='Agility' group by a.tcategory ";
	ResultSet rst12_new22=stamc.executeQuery(newsql);
		System.out.println("newsql--->"+newsql);
		while(rst12_new22.next())
		{
		
			String s11="select vehiclecode from db_gps.t_user_vehicles where  VehicleCode='"+rst12_new22.getString("vehid")+"'" ;
			ResultSet rst12_new44=st6.executeQuery(s11);
			//System.out.println("s11--->"+s11);
			if(rst12_new44.next())
			{
				
				assignedveh++;
				
			}else{
				
				unassignedveh++;
				
			}
			
			
			
		}
 
 
		 System.out.println(">>>TOTAL UNASSIGNED VEHICLES@@@@@@@@<<<"+unassignedveh);
 
 
	String swq="select a.username as contactperson,b.ownername as  ownername from db_gps.t_user_vehicles a,db_gps.t_vehicledetails b    where   a.vehiclecode=b.vehiclecode and  b.ownername='"+transporter+"'  and  a.UserName <> 'NULL' group by a.UserName  ";
	ResultSet rst12_new1=st23.executeQuery(swq);
	System.out.println("swq--->"+swq);
	while(rst12_new1.next())
	{
		cntcprsn=rst12_new1.getString("contactperson");	
		transporter=rst12_new1.getString("ownername");
		System.out.println("transporter--->"+transporter);
		int rstcnt=0;
		
		total_chk=0;
		totalcnt=0;
		totalcnt1=0;
		totalcnt2=0;
		totalcnt3=0;
		totalcnt4=0; 
		
		String swe="select count(distinct(b.tcategory)) as totalAssignedVehicles    from   db_gps.t_livetickettest b,db_gps.t_user_vehicles c  where  b.Vehid=c.vehiclecode and   c.username='"+cntcprsn+"'  ";
		ResultSet rst12_new11=st9.executeQuery(swe);
		System.out.println("swe--->"+swe);
		if(rst12_new11.next())
		{
			
			rstcnt=rst12_new11.getInt("totalAssignedVehicles");	
			
		}
		
		System.out.println("NO OF ROWS -in resultset-->"+rstcnt);
		 newsql="select count(*) as totalAssignedVehicles,  b.tcategory as category,b.tid as ticketid    from   db_gps.t_livetickettest b,db_gps.t_user_vehicles c  where  b.Vehid=c.vehiclecode and   c.username='"+cntcprsn+"'  group by b.tcategory  ";
		
		// String newsql="select count(*) as total,a.tcategory as category,b.ownername as ownername  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode  and b.ownername='Agility' group by a.tcategory ";
		ResultSet rst12_new=st9.executeQuery(newsql);
			System.out.println("newsql--->"+newsql);
			if(rst12_new.next())
			{
				
				System.out.println("NO OF ROWS -in resultset-inside loop->"+rstcnt);
				//tid=tid+","+rst12_new.getString("ticketid");
				
				tctgry=rst12_new.getString("category");
				totalcnt=rst12_new.getInt("totalAssignedVehicles");	
				System.out.println("totalcnt->"+totalcnt);
				System.out.println("tctgry->"+tctgry);
				if(tctgry.equalsIgnoreCase("ToCheck"))
				{
					totalcnt=totalcnt;	
					total_chk=totalcnt;
					
				}
				if(tctgry.equalsIgnoreCase("Stage1Ticket"))
				{
					totalcnt1=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage2Ticket"))
				{
					totalcnt2=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage3Ticket"))
				{
					totalcnt3=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage4Ticket"))
				{
					totalcnt4=totalcnt;	
					
				}
				
				
				for(int a1=0;a1<rstcnt;a1++)
				{
					
					//tid=tid+","+rst12_new.getString("ticketid");
					tctgry=rst12_new.getString("category");
					totalcnt=rst12_new.getInt("totalAssignedVehicles");	
					System.out.println("category--^^^^^->"+rst12_new.getString("category"));
					if(tctgry.equalsIgnoreCase("ToCheck"))
					{
						totalcnt=totalcnt;	
						total_chk=totalcnt;
						
					}
					if(tctgry.equalsIgnoreCase("Stage1Ticket"))
					{
						totalcnt1=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage2Ticket"))
					{
						totalcnt2=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage3Ticket"))
					{
						totalcnt3=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage4Ticket"))
					{
						totalcnt4=totalcnt;	
						
					}
					
					System.out.println("totalcnt1--^^^^^->"+totalcnt1);
					
					if(rst12_new.next()==true)
					{
						
						//tid=tid+","+rst12_new.getString("ticketid");
					
					
					
					System.out.println("category--->"+rst12_new.getString("category"));
					
					tctgry=rst12_new.getString("category");
					
					totalcnt=rst12_new.getInt("totalAssignedVehicles");	
					System.out.println("totalcnt--->"+totalcnt);	
					
					if(tctgry.equalsIgnoreCase("ToCheck"))
					{
						totalcnt=totalcnt;	
						total_chk=totalcnt;
						
					}
					if(tctgry.equalsIgnoreCase("Stage1Ticket"))
					{
						totalcnt1=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage2Ticket"))
					{
						totalcnt2=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage3Ticket"))
					{
						totalcnt3=totalcnt;	
						
					}
					if(tctgry.equalsIgnoreCase("Stage4Ticket"))
					{
						totalcnt4=totalcnt;	
						
					}
					
					
					}else{
						
						
						
					continue;	
						
					}
					
					
					
					
				}
				Totalcnt=total_chk+totalcnt1+totalcnt2+totalcnt3+totalcnt4;
				
				System.out.println("assignedveh--->"+assignedveh);
				System.out.println("total_chk--->"+total_chk);		
				
				%>
				<tr>
				<td align="right"><b><div  align="right"><%=a%></b></td>
				<td align="left"><b> <div  align="left"><a href="FinALTransCntwiseTreport.jsp?transporter=<%=transporter %>&contactperson=<%=cntcprsn%>"><%=cntcprsn%></a> </div></b></td>
				<td align="right"><b><div  align="right"><%=total_chk%> </div></b></td>
				<td align="right"><b><div  align="right"><%=totalcnt1%> </div></b></td>
				<td align="right"><b><div  align="right"><%=totalcnt2%> </div></td>
				<td align="right"><b><div  align="right"><%=totalcnt3%> </div></b></td>
				<td align="right"><b><div  align="right"><%=totalcnt4%> </div></b></td>
				<td align="right"><b><div  align="right"><%=Totalcnt%> </div></b></td>
				</tr>
				<%
				

			a++;

			
				
			
			
			
			
			
			
			
			
			}

		
		//	System.out.println("tid--->"+tid);
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	//System.out.println("tid--->"+tid);
	
	
}catch(Exception e22)
{
	System.out.println("e33--exception in query ->"+e22);	
	
}	
	





if(unassignedveh!=0)
{
%>

	

<tr>
<td align="right"><b><div  align="right"><%=a%></b></td>
				<td align="left"><b> <div  align="left"><a href="FinALTransCntwiseTreport.jsp?transporter=<%=transporter %>&unassigned=<%=unassigned1 %>">Unassigned Vehicles</a> </div></b></td>
				<td align="right"><b><div  align="right">- </div></b></td>
				<td align="right"><b><div  align="right">-</div></b></td>
				<td align="right"><b><div  align="right">- </div></td>
				<td align="right"><b><div  align="right">- </div></b></td>
				<td align="right"><b><div  align="right">- </div></b></td>
				<td align="right"><b><div  align="right"><%=unassignedveh%> </div></b></td>

</tr>
<%
}
%>


</table>

<%

}catch(Exception e22)
{
	System.out.println("e33--exception in query ->"+e22);	
	
}




%>
</div>
</form>




<!-- code end here --->

	</div>
	 </div>
	 
<div id="gbox-bot1"> </div></div>
</div>
</div>
</div>

</div>


</body>


<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>



