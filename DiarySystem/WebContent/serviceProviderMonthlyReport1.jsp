<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ include file="header.jsp" %>		
	 

<html>
<%!
	Connection conn,conn1;
	
	%>
<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>





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
function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.sp1.action ="excel.jsp";
          document.forms["sp1"].submit();
} 
function goToFullExcel(mno) {
	//alert(">>>>"+mno+">>>>>>>>>>>");
	
		window.location.href="serviceProviderMonthlyReportExcel1.jsp?mno="+mno;	
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

try{
Statement st = null;
Statement st1 = null;
Statement st2 = null;
Statement st3 = null;
Statement st4 = null;
Statement st5 = null;
Statement st6 = null;
Statement st7 = null;
Statement st8 = null;

String mno = request.getParameter("mno");
String Service_Provider=request.getParameter("Service_Provider");

System.out.println("**********ServicProviderMonthlyReport1*************");

String MM_dbConn_DRIVER1 = "org.gjt.mm.mysql.Driver";
//String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/airtelnew";
String MM_dbConn_GPS = "jdbc:mysql://192.168.2.35/airtelnew";

String MM_dbConn_GPS1 = "jdbc:mysql://192.168.2.55/db_gps";


// String MM_dbConn_GPS1 = "jdbc:mysql://10.0.10.62/db_gps";
String MM_dbConn_USERNAME1 = "fleetview";
String MM_dbConn_PASSWORD1 = "1@flv";


		Class.forName(MM_dbConn_DRIVER1);
		conn = DriverManager.getConnection(MM_dbConn_GPS,MM_dbConn_USERNAME1, MM_dbConn_PASSWORD1);
		
		conn1 = DriverManager.getConnection(MM_dbConn_GPS1,MM_dbConn_USERNAME1, MM_dbConn_PASSWORD1);
		
		st = conn1.createStatement();
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st5 = conn.createStatement();
		st6 = conn.createStatement();
		st7 = conn.createStatement();
		st8 = conn.createStatement();
		
		ResultSet rsPagination = null;
	    ResultSet rsRowCnt = null;
	    
	    PreparedStatement psPagination=null;
	    PreparedStatement psRowCnt=null;
	    
	    int iShowRows=20;  // Number of records show on per page
	    int iTotalSearchRecords=10;  // Number of pages index shown
	    
	   
	    
	    
	    System.out.println("The else Service_Provider==>"+Service_Provider);
	    
	    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
	    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
	    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
	    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
	    
	    int iStartResultNo=0;
	    int iEndResultNo=0;

	    if(iPageNo==0)
	    {
	        iPageNo=0;
	    }
	    else{
	        iPageNo=Math.abs((iPageNo-1)*iShowRows);
	    }

System.out.println("This is Ashutosh Bhardwaj");
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
%>

<div id="form_container" style="width:70%;">
	
		<h1 align="center">
		<table width="100%">
		<tr>
		<td>
<!--		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>-->
<!--		</td><td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Service Provider Monthly Report</a></div></td>-->
<!--		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td></tr>-->
		</table></h1>
							
				<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Service Provider Monthly Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>			
							
							
<ul style="margin-right: 3em;">
<form id="sp1" name="sp1" method="post" >	

<%
         final String exportFileName="service_provider_monthly_report_of_mobile No:"+mno+".xls";  
%>

<%
boolean flag = false; 
String Simno="-",unitID="-",vehRegNo="-",transporter="-",lastDataDate="-",lastDataLoc="-",unitMasterEntry="-";
String lastDispatchDate="-",lastDispatchLoc="-",dateOfSimPurchase="-",dateOfDeactivation="-",simNoFromTrackFile="-";
String trackFileDate="-",nowInVeh="-",holdBy="-",lastMobNoInUnit="-",simChange="-";

String query = "select Simno,DateOfPurchase  from t_simmaster where   mobno='"+mno+"' ";
ResultSet rs = st.executeQuery(query);


System.out.println("The query is :"+query);
if(rs.next())
 {
	flag = false;
	Simno = rs.getString("Simno");
	dateOfSimPurchase = rs.getString("DateOfPurchase");
	dateOfSimPurchase = formatter1.format(formatter.parseObject(dateOfSimPurchase)); 
	flag =true;
	 
}
System.out.println("The sim no is :"+Simno);

if(flag ==true) {
	
	String query1 = "select * from db_gps.t_unitmasterhistory where   mobno='"+mno+"' order by entdate desc limit 1";
	ResultSet rs1 = st1.executeQuery(query1);
	System.out.println("The query is 11111:"+query1);
	while(rs1.next())
	 {
		unitID = rs1.getString("UnitID");
		unitMasterEntry = rs1.getString("EntDate");
		unitMasterEntry = formatter1.format(formatter.parseObject(unitMasterEntry)); 
		 
	}
	
	
	if(!(unitID.equalsIgnoreCase("-")))
	{
	
	String query2 = "select * from db_gps.t_unitmasterhistory where  unitid='"+unitID+"' and status in ('Dispatched','InterDisp') order by dispdate desc limit 1";
	ResultSet rs2 = st2.executeQuery(query2);
	System.out.println("The query 22222is :"+query2);
	while(rs2.next())
	 {
		lastDispatchDate = rs2.getString("DispDate");
		lastDispatchLoc = rs2.getString("DisAdd");
		lastDispatchDate = formatter1.format(formatter.parseObject(lastDispatchDate)); 
		 
	}
	
	String query3 = "select * from db_gps.allconnectedunits where   unitid='"+unitID+"' order by thedate desc,thetime desc limit 1";
	ResultSet rs3 = st3.executeQuery(query3);
	System.out.println("The query is3333 :"+query3);
	while(rs3.next())
	 {
		lastDataDate = rs3.getString("TheDate");
		lastDataLoc = rs3.getString("Location");
		lastDataDate = formatter1.format(formatter.parseObject(lastDataDate)); 
	}
	
	String query4 = "select * from db_gps.t_unitreplacement where NewUnitID='"+unitID+"' order by instdate desc limit 1" ;
	ResultSet rs4 = st4.executeQuery(query4);
	System.out.println("The query is44444 :"+query4);
	while(rs4.next())
	 {
		vehRegNo = rs4.getString("VehRegNo");
		transporter = rs4.getString("OwnerName");
		 
	}
	
	System.out.println("The dateOfDeactivation is5555 :"+dateOfDeactivation);
	
	String query6 = "select * from db_gps.t_ftplastdump where   unitid='"+unitID+"' " ;
	ResultSet rs6 = st6.executeQuery(query6);
	System.out.println("The query is66666 :"+query6);
	while(rs6.next())
	 {
		simNoFromTrackFile = rs6.getString("SimNo");
		trackFileDate = rs6.getString("Filedatetime");
		trackFileDate = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parseObject(trackFileDate)); 
		 
	}
	
	String query7 = "select * from db_gps.t_vehicledetails where   unitid='"+unitID+"' ";
	ResultSet rs7 = st7.executeQuery(query7);
	System.out.println("The query is7777 :"+query7);
	while(rs7.next())
	 {
		nowInVeh = rs7.getString("VehicleRegNumber");
		 
	}
	
	String query8 = "select holdby,MobNo from db_gps.t_unitmaster where unitid='"+unitID+"' ";
	ResultSet rs8 = st8.executeQuery(query8);
	System.out.println("The query is88888 :"+query8);
	while(rs8.next())
	 {
		holdBy = rs8.getString("HoldBy");
		lastMobNoInUnit = rs8.getString("MobNo");
		 
	}
	
	if(mno==lastMobNoInUnit || mno.equals(lastMobNoInUnit) || mno.equalsIgnoreCase(lastMobNoInUnit)) {
		simChange="NO";
	}else{
		simChange="Yes";
	}
	
	
	
	
	System.out.println("exportFileName===!!!!!!111========"+exportFileName);
	String query5 = "select * from db_gps.t_deactivatednosnew where   mobno='"+mno+"' ";
	ResultSet rs5 = st5.executeQuery(query5);
	System.out.println("The query is5555 :"+query5);
	if(rs5.next())
	 {
		dateOfDeactivation = rs5.getString("DecaDate");
		dateOfDeactivation = formatter1.format(formatter.parseObject(dateOfDeactivation)); 
		 
	}else{
		dateOfDeactivation="-";
	}
	
	
	}
}
%>  
<table border="0"  width="700px" align="center" CELLPADDING=4 style="background: #f8fcff">
	<tr bgcolor="#E6E6E6">
	  <th align="center">Sim No </th>
	  <th align="center">Unit ID </th>
	  <th align="center">Veh Reg No </th>	
	  <th align="center">Transporter </th>	
	  <th align="center">Last Data Date</th>
	  <th align="center">Last Data Location</th>	
	</tr>
	
	<tr>
		<td align="left">			
			<div align="left"><%=Simno %></div>
	  	</td>
	  	<td align="right">			
			<div align="right"><%=unitID %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=vehRegNo %></div>
	  	</td>
	  	<td align="left">			
			<div align="left" ><%=transporter %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=lastDataDate %></div>
	  	</td>
	  	<td align="left">			
			<div align="left" style="width: 50 px;"><%=lastDataLoc %></div>
	  	</td>
	</tr>
</table>
<br>	
<table border="0" width="700px" align="center" CELLPADDING=4 style="background: #f8fcff">
	<tr bgcolor="#E6E6E6">
	  <th align="center">Unit Master Entry </th>
	  <th align="center">Last Dispatch Date </th>	
	  <th align="center">Last Dispatch Loc </th>	
	  <th align="center">Date of sim purchase</th>	
	   <th align="center">Date of Deactivation </th>
	</tr>
	
	<tr>
	  	<td align="left">			
			<div align="left"><%=unitMasterEntry %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=lastDispatchDate %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=lastDispatchLoc %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=dateOfSimPurchase %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=dateOfDeactivation %></div>
	  	</td>
	</tr>
</table> 
<br>
<table border="0" width="700px" align="center" CELLPADDING=4 style="background: #f8fcff">
	<tr bgcolor="#E6E6E6">
	 
	  <th align="center">Sim no from track file </th>
	  <th align="center">Track file date </th>	
	  <th align="center">Currently Configured In </th>	
	  <th align="center">Hold By</th>	
	  <th align="center">Last Mob No in Unit</th>
	   <th align="center">Sim Change</th>
	</tr>
	
	<tr>
		
	  	<td align="left">			
			<div align="left"><%=simNoFromTrackFile %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=trackFileDate %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=nowInVeh %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=holdBy %></div>
	  	</td>
	  	<td align="right">			
			<div align="right"><%=lastMobNoInUnit %></div>
	  	</td>
	  	<td align="left">			
			<div align="left"><%=simChange %></div>
	  	</td>
	</tr>
</table> 		
	
<br>

<%

System.out.println("exportFileName===!!!!!!111========"+exportFileName);
%>
<table  style="width:600px ">
		<tr>
			<td>
			 				<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
				<div style="text-align: right"><a href="#" style="font-weight: bold; color: black; " onclick="goToFullExcel('<%=mno%>')">Get Full Excel</a><a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a></div>
        	</td>
		</tr>
		
		</table>	 		      	  
<div style="width:100%;" align="center" id="table1" >			
	<table border="1" width="700px" CELLPADDING=2 style="background: #f8fcff;" class=sortable   >
	<tr bgcolor="#E6E6E6">
	<th align="center">Sr No</th>
	<th  align="center">Mobile No</th>
	<th align="center">Account No</th>
	<th  align="center">Bill No</th>
	<th  align="center">Bill Date</th>
	<th  align="center">TDate</th>
	<th  align="center">TTime</th>
	<th align="center">CallNo</th>
	<th  align="center">Duration</th>
	<th  align="center">Amount</th>
	<th  align="center" style="width: 50px;">Item Type</th>
	</tr>
			
		
<%
String Mobno="-",AccNo="-",BillNo="-",BillDate="-",TDate="-",TTime="-",CallNo="-",Duration="-",Amount="-",ItemType="-";
int srno=0;
srno = iPageNo;
String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM airtelnew.t_chargedetailsamt_FINAL WHERE MobNo = '"+mno+"'   order by TDate desc limit "+iPageNo+","+iShowRows+"    ";
System.out.println("The query is :"+sqlPagination);

psPagination=conn.prepareStatement(sqlPagination);
rsPagination=psPagination.executeQuery();
System.out.println("The query is :"+sqlPagination);

////this will count total number of rows
String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
psRowCnt=conn.prepareStatement(sqlRowCnt);
rsRowCnt=psRowCnt.executeQuery();

if(rsRowCnt.next())
 {
    iTotalRows=rsRowCnt.getInt("cnt");
 }
%>
<tr>
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
</tr>
<%
while(rsPagination.next()){
	Mobno=rsPagination.getString("MobNo");
	AccNo=rsPagination.getString("AccNo");
	BillNo=rsPagination.getString("BillNo");
	BillDate=rsPagination.getString("BillDate");
	TDate=rsPagination.getString("TDate");
	TTime=rsPagination.getString("TTime");
	CallNo=rsPagination.getString("CallNo");
	Duration=rsPagination.getString("Duration");
	Amount=rsPagination.getString("Amount");
	ItemType=rsPagination.getString("ItemType");
	
	if(TTime!=null)
	{
		
		
	}else{
		
		TTime="-";
		
	}
	
	
%>		<tr>
		<td align="right">			
			<div align="right" style="overflow: auto;"><%=++srno %></div>	
	    </td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Mobno %></div>
			
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=AccNo %></div>
	  	</td>
	  	<td align="right" >			
			<div align="right" style="overflow: auto;"><%=BillNo %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=formatter1.format(formatter.parseObject(BillDate)) %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=formatter1.format(formatter.parseObject(TDate)) %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=TTime %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=CallNo %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Duration %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Amount %></div>
	  	</td>
	  	<td align="left">			
			<div align="left" style="overflow: auto;"><%=ItemType %></div>
	  	</td>	  	
   </tr> 
   <%} %>
   <%
  //// calculate next record start record  and end record 
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
           
            
            if(iEndResultNo==0)
            {
            iStartResultNo=(iPageNo);
            }else{
            	
            	iStartResultNo=(iPageNo+1);
            	
            	
            }
            
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        
        
        

%>
</table><br>

</div>
<div align="center" style="width: 100%;">
<table  style="background: #E8EEF7;width:900px ">
		<tr>
		 <td colspan="3" align ="left"><a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>">First Page</a></td> 
   <td colspan="3" align ="center">
<div>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>&iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>&iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>&iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>&iPageNo=<%=i%>&cPageNo=<%=i%>"> Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Records  <%=iTotalRows%> </b>
</div>
</td>
   <td colspan="3" align ="right"><a href="serviceProviderMonthlyReport1.jsp?mno=<%=mno%>&iPageNo=<%=iTotalPages%>">Last Page</a></td> 
   
		</tr>		
		</table><br></br>
		</div>


</div>		
</ul>

</div>
</div>
</div>
</div>
</div>
 </div>
 </div>
</body>

<%
}catch(Exception e33)

{
e33.printStackTrace();
out.print(e33);

}

%>

 <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>