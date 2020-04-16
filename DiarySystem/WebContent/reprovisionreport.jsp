<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
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

	         
	        //  alert("HI>>>>>>");
	    
	          var obj = document.getElementById(elemId);  
	          var oFld = document.getElementById(frmFldId); 
	          oFld.value = obj.innerHTML;  

	        //   alert("11111");

	           try{
	             document.sla1.action ="excel.jsp";

	         //  alert("222222");
	          document.forms["sla1"].submit();
	          //alert("33333");


	           }catch(e){alert("exception>>>"+e);}

	}



	function fun1()
	{
		document.sla.submit();
	}	
	
	function toggleDetails(id, show)
	{
		var popup = document.getElementById("popup"+id);
		if (show) 
		{
			popup.style.visibility = "visible";
			popup.setfocus();
		}
		else
		{
			popup.style.visibility = "hidden";
		}
	}
	function validate()
	{

 // alert("Hi==>");

		var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;

		//alert("date1==>"+date1);
		//alert("date2==>"+date2);
		
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("Selected date should not be greater than Todays date (Year)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>month || dm2>month)
			{
				alert("Selected date should not be greater than Todays date (Month)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dm1==month)
		{
			if(dd1>day || dd2>day)
			{
				alert("Selected date should not be greater than Todays date (Day)");
				//document.getElementById("calender").value="";
				//document.getElementById("calender1").value="";
				//document.getElementById("calender").focus;
				return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year should not be greater than To date year");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
		else if(year==dy1 && year==dy2) 
		{
			if(dm1>dm2)
			{
				alert("From date month should not be greater than To date month");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		if(dm1==dm2)
		{
			if(dd1 > dd2)
			{
				alert("From date should not be greater than To date");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				//document.getElementById("data").focus;
				return false;
			}
		}
		return true;	
	}


	function dateformat(days)
	{
	       if(days=='Jan')
	              return(1);
	       else
	              if(days=='Feb')
	                      return(2);
	              else
	                      if(days=='Mar')
	                              return(3);
	                      else
	                              if(days=='Apr')
	                                      return(4);
	                              else
	                                      if(days=='May')
	                                              return(5);
	                                      else
	                                              if(days=='Jun')
	                                                      return(6);
	                                              else
	                                                      if(days=='Jul')
	                                                              return(7);
	                                                      else

	if(days=='Aug')

	return(8);
	                                                              else

	if(days=='Sep')

	return(9);

	else

	if(days=='Oct')

	return(10);

	else

	if(days=='Nov')

	return(11);

	else

	if(days=='Dec')

	return(12);
	 }




	function datevalidate()
	{	
	//alert("Hi===>");
		var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;

	//alert(date1);
	//alert(date2);
		dy1=date1.substring(7,11);
		dy2=date2.substring(7,11);
		dm1=date1.substring(3,6);
		dm2=date2.substring(3,6);
		dd1=date1.substring(0,2);
		dd2=date2.substring(0,2);

		//alert("dm1==>"+dm1);
	    //alert("dm2==>"+dm2);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
	    var mnth1=dateformat(dm1);
	    var mnth2=dateformat(dm2);


	    
	    
		//alert("mnth1==>"+mnth1);
		//alert("mnth2==>"+mnth2);
		
		//alert("dy1==>"+dy1);
		//alert("dy2==>"+dy2);

		//alert("dd1==>"+dd1);
		//alert("dd2==>"+dd2);
		if(dy1>year || dy2>year)
		{
			alert("selected date should not be greater than todays date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("data").focus;

			return false;
		
		}
		else if(year==dy1 && year==dy2){
		  if(mnth1>month || mnth2>month)
			{
				alert("selected date should not be greater than todays date");
				//document.getElementById("data").value="";
				//document.getElementById("data1").value="";
				document.getElementById("data").focus;

				return false;
		
			}
		}

		if(mnth1==month){
			if(dd1>day || dd2>day)
			{
			alert("selected date should not be greater than todays date");
		//	document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("data").focus;

			return false;
		
			}
		}
		if(dy1>dy2)
		{
	//alert("111");
			alert("From date year is should not be greater than to date year");
		//	document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		
		else if(year==dy1 && year==dy2) if(mnth1>mnth2)
		{
			alert("From date month is should not be greater than to date month 5");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		if(mnth1==mnth2) {
		if(dd1 > dd2)
		{
			alert("From date should not be greater than to date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		}
	//alert("end==>");
		return true;
	}
		
	</script>
	<style>
.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;

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
<!-- Checking request from tech type or not, and making headers available accordingly-->


<%@ include file="header1.jsp" %>
   
    </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
			<!--- code start here ------>
<form name="sla" method="get" action="" onSubmit="return datevalidate();">


<%
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String day=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String today11=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
String data=request.getParameter("data1");
String data1=request.getParameter("data2");
//System.out.println("12122111---today11->"+today11);

//System.out.println("33333333333--data-->"+data);
//System.out.println("33333333333---data1->"+data1);


%>



<table width="750px" border="0" bgcolor="#77D7D4">
<tr><td align="center" colspan="5" ><font size="2" color="maroon"><b>Please Select Date Range To View Reprovision  Report</td></tr>
<tr>


 <td  width="668px" id="frmdt" ><font color="black" size="2" id="trigger"><b>&nbsp;&nbsp;From :</b> </font>
				  <input type="text" id="data" name="data1" class="formElement" value="<%if(data!=null){%><%=data %> <% }else{%><%= today11%>  <% } %>   " size="10" readonly/>
				  
<!--					<input type="button" name="From Date" value="From Date" id="trigger" />-->
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data",         // ID of the input field
	      			ifFormat    : "%d-%b-%Y",     // the date format
	      			button      : "calender"       // ID of the button
	    			}
	  				);	
					</script>
				 &nbsp;
					
				<font color="black" size="2" id=trigger1><b>To :</b> </font>
				 
				 
				 
 <input type="text" id="data1" name="data2" class="formElement" value="<%if(data1!=null){%><%=data1 %> <% }else{%><%= today11%>  <% } %>" size="10" readonly/>
<!--									 	<input type="button" name="data2" value="To Date" id="trigger1" "/>-->
										<script type="text/javascript">
						  				Calendar.setup(
						    			{
						      			inputField  : "data1",         // ID of the input field
						      			ifFormat    : "%d-%b-%Y",    // the date format
						      			button      : "calender1"       // ID of the button
						    			}
						  				);
										</script>
								</td>
								
				
				
			
								
<!--
 <td width="668px" id="frmdt" ><font color="black" size="2" id="from"><b>&nbsp;&nbsp;From :</b> </font>
					<input type="text" id="data" name="data1" size="07" value="< %if(data!=null){ %>< %=data%>< %}else{%>< %=today11%> < %}%>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background:; font: normal 11px Arial, Helvetica, sans-serif; background: ;" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "data",         // ID of the input field
		                    ifFormat    : "%d-%b-%Y",     // the date format
		                    button      : "calender"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;
					
				<font color="black" size="2" id="to"><b>To :</b> </font>
					<input type="text" id="data1" name="data2" size="07" value="< %if(data1!=null){ %>< %=data1%>< %}else{%>< %=today11%> < %}%>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background:; font: normal 11px Arial, Helvetica, sans-serif; background: ;" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "data1",         // ID of the input field
			                    ifFormat    : "%d-%b-%Y",     // the date format
			                    button      : "calender1"       // ID of the button
			               }
			                             );
              		 </script>
		</td>



-->


<td><input type="submit" name="submit"  value="submit"></td></tr>
</table>
	
</form>
<form name="sla1" method="post" action="" onSubmit="">


<div id="table1">	



<%!
	Connection con;
	Statement st,st1,st2;  
%>
<%
/*	String calender="",calender1="";

	String data=request.getParameter("calender");
	String data1=request.getParameter("calender1");*/
//	String d1="01-jul-2010";
	//System.out.println("33333333333---->");
	
	
	//System.out.println("33333333333--data-->"+data);
	//System.out.println("33333333333---data1->"+data1);
	String todt="",ccdt="";
	if(data!=null)
	{
	 //todt=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data));
	// ccdt=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	 
	 
	}
	
	
	
	//int data2=Integer.parseInt(data1);
	String cust="",sql2="",customer="",sql11="";
	
	////System.out.println("data---->"+data);
//	 String s = new Integer(str).toString();
//int result = data.compareTo(d1);


if(data!=null)
{



	
	String today=new SimpleDateFormat("dd").format(new java.util.Date());
	int today1=Integer.parseInt(today);
	
	%>
	
	<%
	
	 String exportFileName="ReprovisionReport.xls";  
	
	
	
	
	%>
	
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           </div>
	
	<table width="750px" border="0" align="center" bgcolor="#77D7D4">
	<tr>
	<th><font size="2" color="maroon" >Reprovision Summary Report from <%=data%> to  <%=data1%> </font> 
		
		
<!--		<a href="excel_reprovision.jsp?month=<%=data%>&year=<%=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
		
                           <div style="text-align:right;margin-left: 50em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
                           </div>
                           
		</th>
	</tr>	
	</table>
	<br></br>
	<table border="1" width="100%" class="sortable">
<tr>
<td align="center"><div align="center"> Sr.No</div>  </td>
<td align="center"><div align="center"> Unit ID</div> </td>

<td align="center"> <div align="center">Vehicle No </div></td>



<td align="center"><div align="center"> Transporter </div></td>
<td align="center"><div align="center">  Mobile No </div></td>
<td align="center"><div align="center"> Sim No</div> </td>
<td align="center"><div align="center"> Company</div> </td>
<td align="center"> <div align="center">Updated Date </div></td>
<td align="center"> <div align="center">Date Updated after Reprovision</div> </td>

</tr>
	<%
	try
	{	
	
		Class.forName(MM_dbConn_DRIVER);
		con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st=con.createStatement();
	    st1=con.createStatement();
	    st2=con.createStatement();
	    NumberFormat nf = NumberFormat.getNumberInstance();
	    NumberFormat nf1 = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2) ;
		nf1.setMaximumFractionDigits(2) ;
		  nf.setGroupingUsed(false); 
			
		  
		  data=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
			data1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));  
		  
		  
		 
		 
		  String unitid="-",vehregno="-",mobno="-",simno="-",cmpny="-",updat="-",transporter="-",dtupdtrepr="-";
		  String thdt="-",thtime="-";
		  
		  
		//  //System.out.println("monthdays----->"+monthdays);
	    String sql="select UnitID,VehRegNo,Transporter,MobNo,Simno,Company,UpdatedDate from db_gps.t_reprovisionreport  where UpdatedDate between '"+data+" 00:00:00' and '"+data1+" 23:59:59'  ";
	   // String sql="Select ERPCustName as Customer,ERPCode as CusromerCode,SLAPer,Rate,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,GroupName,BillType from t_fv_erp_relation ,t_billingdetails where month1='" & Year(DTP_fromDate.Value) & "-" & Format(Month(DTP_fromDate.Value), "00") & "-01" & "'" & mCustWhereCondition & " and t_billingdetails.vehid    = t_fv_erp_relation.vehid  and t_fv_erp_relation.BillTransporter='Yes' group by   ERPCustName,groupcode";
	   //System.out.println(sql);	
	   ResultSet rst=st.executeQuery(sql);
	   //System.out.println("Reprovision Query==>"+sql);
	   	int i=1;
	   while(rst.next())
	   	{
	   		String noOfVehicleAdded="";
		   
		  // Customer1=rst.getString("Transporter");
		   ////System.out.println("customer--->"+Customer1);
		  
	   		 transporter=rst.getString("transporter");
	   		unitid=rst.getString("UnitID");
	   		vehregno=rst.getString("VehRegNo");
	   		mobno=rst.getString("MobNo");
	   		simno=rst.getString("Simno");
	   		cmpny=rst.getString("Company");
	   		updat=rst.getString("UpdatedDate");
	   		
	   		
	   		String repe="SELECT * FROM db_gps.t_onlinedata WHERE unitid ='"+unitid+"' and concat(thedate,' ',thetime) >'"+updat+"'   ";
	   		ResultSet rst1=st2.executeQuery(repe);
	 	   //System.out.println("Reprovision Query==>"+repe);
	   		
	 	  if(rst1.next())
	 	  {
	 		 thdt=rst1.getString("TheDate");
	 		thtime=rst1.getString("TheTime");
	 		  
	 	  }
	   		
	 	  if(thdt!="-")
	 	  {
	 		  
	 		 dtupdtrepr= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(thdt) )+" "+new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("HH:mm:ss").parse(thtime) ); 
	 		  
	 	  }else{
	 		  
	 		 dtupdtrepr="No"; 
	 	  }
	 	 updat=	new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(updat));
	 	  
		//	//System.out.println("PerOfCapturedDays--->"+PerOfCapturedDays);
	//   		int i=1;
	   		
	   		String Yes="Yes";
	   	//	String s=rst.getString("D"+i);
	   	//	//System.out.println("string s"+s);
	   		//	int	day11 = Integer.parseInt(day);
	   	//		int	day12 = Integer.parseInt(day1);
	   		//	//System.out.println("day"+day11);
		   	//	//System.out.println("day1"+day12);
	   			//int	Yes22 = Integer.parseInt(Yes);
	   			//double	Yes23 = Double.parseDouble("Yes");
	   			//int i=01;
	   		
	  
	   	
	   		%>
	   		<tr>
					<td> <div align="right"><%=i %></div> </td>
					
				
					<td><div align="right"><%=unitid%></div></td>
			
					<td><div align="left"> <font face="Arial" size="2" ><%=vehregno%></font> </div></td> 

					<td><div align="left"  ><font face="Arial" size="2" >  <%=transporter%> </font> </div></td>
					<td><div align="right"><%=mobno%></div></td>
					<td><div align="right"><%=simno%></div></td>
					<td><div align="left"><font face="Arial" size="2" > <%=cmpny%></font> </div></td>
					<td><div align="right"><%=updat%></div></td>
					<td><div align="right"><%=dtupdtrepr%></div></td>
					
					
				
			</tr>
				   		
	   		
	   		<%
	   		i++;
	   		}
	   		
	   	
	   	}
catch(Exception e)
{
	//System.out.println(""+e);
	e.printStackTrace();
}
finally
{
	con.close();

}
}
%>
</table>
</div>

<%
//System.out.println("FOOTEr=44444=>");
if(data!=null)
{
	//System.out.println("FOOTEr==>");
%>
<table border="1" width="750px" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
	
	
	<%}
%>

</form>
</body>
</html>
