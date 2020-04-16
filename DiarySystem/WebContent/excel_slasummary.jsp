<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%@ page contentType="application/vnd.ms-excel; charset=gb2312"%>
<%  response.setContentType("application/vnd.ms-excel");
    response.addHeader("Content-Disposition", "attachment;filename=\"DaywiseReport.xls\"");
%>
<%@ include file="header.jsp" %>
<%!
	
 
%>
<%

Class.forName("org.gjt.mm.mysql.Driver");

//conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps", "fleetview", "1@flv");
Connection con= DriverManager.getConnection("jdbc:mysql://173.234.153.82/db_gps","fleetview","1@flv");
	Statement st,st1,st2,st4; 
/*	String calender="",calender1="";

	String data=request.getParameter("calender");
	String data1=request.getParameter("calender1");*/
//	String d1="01-jul-2010";
	String data=request.getParameter("month");
	String data1=request.getParameter("year");
	//int data2=Integer.parseInt(data1);
	String cust="",sql2="",customer="",sql11="";
	double Amtperveh=0.0,AmtPerDay=0.0,SLAdiff=0.0,ExpTotalAmt=0.0;	
	double AmtSLADiff=0.0,NetBillAmt=0;
	int totalexpected=0;
	double totalNetBill=0.0;	
	int totalvehcounter=0;    
	//int totdiff=0;
	String Nettotamt="";
	float  monthdays=0.0f;
	float  monthdays1=0.0f;
	String finaldate="";
	String finaldate1="";
	////System.out.println("data---->"+data);
//	 String s = new Integer(str).toString();
//int result = data.compareTo(d1);
if(data==null)
{

}

else
{	
	
	String Customer1,CustomerCode,SLAAttained,Rate,BillType,ChargeperDay,SLAPer,GroupName,NotCaptured,VehcileAdded,VehcileRemoved,TotalDays,NoofVehicles;
	String CapturedDays,DisconnectedDays,TotalBilledDays,Maintenance;
	float BilledAmt1=0.0f;
	String today=new SimpleDateFormat("dd").format(new java.util.Date());
	int today1=Integer.parseInt(today);
	//out.print(today);
	/*java.util.Date showDate6 = new SimpleDateFormat("dd-MMM-yyyy").parse(data1);
    Format formatter6 = new SimpleDateFormat("yyyy-MM-dd");
    String showdate6=formatter6.format(showDate6);
	String Month=showdate6.substring(5,7);
	String Year=showdate6.substring(0,4);
	calender=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data));
	calender1=new SimpleDateFormat("yyyy-MM-dd ").format(new SimpleDateFormat("dd-MMM-yyyy").parse(data1));
	String mont=calender.substring(5,7);
	String mont1=calender.substring(5,7);
	String day=calender.substring(8,10);
	String day1=calender1.substring(8,10);
	int year=Integer.parseInt(calender.substring(0,4));
	int year1=Integer.parseInt(calender1.substring(0,4));
	if(mont.equals("01")||mont.equals("03")||mont.equals("05")||mont.equals("07")||mont.equals("08")||mont.equals("10")||mont.equals("12"))
	{
		monthdays=31;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else if(mont.equals("04")||mont.equals("06")||mont.equals("09")||mont.equals("11"))
	{
		monthdays=30;
		finaldate=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year%4==0)
		{
			monthdays=29;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays=28;
			finaldate=year+"-"+mont+"-"+monthdays;
		}
	}
	if(mont1.equals("01")||mont1.equals("03")||mont1.equals("05")||mont1.equals("07")||mont1.equals("08")||mont1.equals("10")||mont1.equals("12"))
	{
		monthdays1=31;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else if(mont1.equals("04")||mont1.equals("06")||mont1.equals("09")||mont1.equals("11"))
	{
		monthdays1=30;
		finaldate1=year+"-"+mont+"-"+monthdays;
	}
	else
	{
		if(year1%4==0)
		{
			monthdays1=29;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
		else
		{
			monthdays1=28;
			finaldate1=year+"-"+mont+"-"+monthdays;
		}
	}
	*/
	%>
	<table width="750px" border="0" align="centre">
	<tr>
	<th><font size="2" color="maroon" >SLA Summary Report for Month-<%=data%> and Year-<%=data1%> </font> </th>
	
	</table>
	<table width="750px" border="0" class="sortable" align="centre">
<tr>
<td>SrNo</td>
<td>Customer</font></td>
<!-- <th><font color="White">CusromerCode</font></th>-->
<td>SLAPer </font></td>
<!--<th><font color="White">Rate</font></th>  -->

<td>No Of<br>Vehicles</font></td>
<td>Vehcile<br>Added</font></td>
<td>Vehcile<br>Removed</font></td>
<td>Captured<br>Days</font></td>
<td>% of Captured<br>Days</font></td>
<td>Disconnected<br>Days</font></td>
<td>Maintenance<br>Days</td>
<td>NotCaptured</font></td>
<td>TotalDays</font></td>
<td>% of Billed<br>Days</font></td>
<td>TotalBilled<br>Days</font></td>
<td>GroupName</font></td>
<td>BillType</font></td>
<td>SLAAttained</font></td>
<!-- <th><font color="White">BilledAmt</font></th> -->
</tr>
	<%
	try
	{	
	
		Class.forName("org.gjt.mm.mysql.Driver");
	      
	     // conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps", "fleetview", "1@flv");
	     con= DriverManager.getConnection("jdbc:mysql://173.234.153.82/db_gps","fleetview","1@flv");
		
	    st=con.createStatement();
	    st1=con.createStatement();
	    st2=con.createStatement();
	    st4=con.createStatement();
	    NumberFormat nf = NumberFormat.getNumberInstance();
	    NumberFormat nf1 = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2) ;
		nf1.setMaximumFractionDigits(2) ;
		  nf.setGroupingUsed(false); 
			
		  
		  String fromdate=data1+"-"+data+"-01";
		  String data2="20"+data1;
		  int year=Integer.parseInt(data2);
		  //System.out.println("fromdate"+fromdate);
		  if(data.equalsIgnoreCase("01")||data.equalsIgnoreCase("03")||data.equalsIgnoreCase("05")||data.equalsIgnoreCase("07")||data.equalsIgnoreCase("08")||data.equalsIgnoreCase("10")||data.equalsIgnoreCase("12"))
		  {
		  monthdays=31;
		  }
		  else if(data.equalsIgnoreCase("04")||data.equalsIgnoreCase("06")||data.equalsIgnoreCase("09")||data.equalsIgnoreCase("11"))
		  {
		  	monthdays=30;
		  }
		  else
		  {
			  if(year%4==0)
				{
					monthdays=29;
				
				}
				else
				{
					monthdays=28;
					
				}
		  }
		//  //System.out.println("monthdays----->"+monthdays);
		
		String code="select distinct(transporter) from db_gps.t_billingdetails where Month1='"+fromdate+"' and ERPTransporterCode !=0  order by transporter asc";
		ResultSet rst1=st4.executeQuery(code);
		//System.out.println("Code  -->"+code);
		
	    
	   // String sql="Select ERPCustName as Customer,ERPCode as CusromerCode,SLAPer,Rate,count(t_billingdetails.vehid) as NoofVehicles,sum(VehAddedThisMonth) as VehcileAdded,sum(vehRemovedThisMonth) as VehcileRemoved,sum(TotalYes) as CapturedDays,Sum(TotalYesStar) as DisconnectedDays,sum(TotalNo) as NotCaptured,sum(TotalDays) as TotalDays,Sum(TotalYesStar)+sum(TotalYes) as TotalBilledDays ,GroupName,BillType from t_fv_erp_relation ,t_billingdetails where month1='" & Year(DTP_fromDate.Value) & "-" & Format(Month(DTP_fromDate.Value), "00") & "-01" & "'" & mCustWhereCondition & " and t_billingdetails.vehid    = t_fv_erp_relation.vehid  and t_fv_erp_relation.BillTransporter='Yes' group by   ERPCustName,groupcode";
	  // //System.out.println(sql);	
	   
	   int i=1;
	   while(rst1.next())
		{
				
		//System.out.println("In While 1");
		//String code1=rst1.getString("ERPtransportercode");
		String transporter=rst1.getString("transporter");
		
		String sql="select db_gps.t_billingdetails.Transporter as Customer,ERPCode as CustomerCode,SLAPer,Rate,Rate/'"+monthdays+"' as ChargeperDay, (select count(*) as NoofVehicles from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' ) as NoofVehicles ,(select count(VehAddedThisMonth) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"'  and VehAddedThisMonth!='No') as VehcileAdded,(select count(vehRemovedThisMonth)  from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"' and vehRemovedThisMonth !='No' and vehid not in (select vehiclecode from db_gps.t_vehicledetails where ownername='"+transporter+"' and status='-' )) as  VehcileRemoved,(select sum(TotalYes) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as CapturedDays,(select Sum(TotalYesStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as DisconnectedDays,(select sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as Maintenance,(select sum(TotalNo) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as NotCaptured,(select sum(TotalDays) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalDays,(select Sum(TotalYesStar)+sum(TotalYes)+sum(TotalYesStarStar) from db_gps.t_billingdetails where month1='"+fromdate+"' and transporter='"+transporter+"') as TotalBilledDays,db_gps.t_billingdetails.Transporter as GroupName,BillType,db_gps.t_billingdetails.Transporter as transporter from db_gps.t_fv_erp_relation,db_gps.t_billingdetails where month1='"+fromdate+"' and db_gps.t_billingdetails.transporter='"+transporter+"'  limit 1";
		ResultSet rst=st.executeQuery(sql);
		System.out.println("Sql -- >"+sql);
	   while(rst.next())
	   	{
		   Customer1=rst.getString("Customer");
	   		CustomerCode=rst.getString("CustomerCode");
	   		SLAPer=rst.getString("SLAPer");
	   		Rate=rst.getString("Rate");
	   		ChargeperDay=rst.getString("ChargeperDay");
	   		NoofVehicles=rst.getString("NoofVehicles");
	   		VehcileAdded=rst.getString("VehcileAdded");
	   		VehcileRemoved=rst.getString("VehcileRemoved");
	   		CapturedDays=rst.getString("CapturedDays");
	   		DisconnectedDays=rst.getString("DisconnectedDays");
	   		Maintenance=rst.getString("Maintenance");
	   		
	   		NotCaptured=rst.getString("NotCaptured");
	   		TotalDays=rst.getString("TotalDays");
	   		TotalBilledDays=rst.getString("TotalBilledDays");
	   		GroupName=rst.getString("GroupName");
	   		BillType=rst.getString("BillType");
	   		float	CapturedDays1 = Float.parseFloat(CapturedDays);
	   		float	TotalDays1 = Float.parseFloat(TotalDays);
			float	SLAPer1 = Float.parseFloat(SLAPer);
			float	TotalBilledDays1 = Integer.parseInt(TotalBilledDays);
			 float ChargeperDay2 =Float.parseFloat(ChargeperDay);
			 float	NoofVehicles1 = Float.parseFloat(NoofVehicles);
			 float	Rate1 = Float.parseFloat(Rate);
			String SLAAttained1="";
			float PerOfBILL=(TotalBilledDays1*100)/TotalDays1;
	   		float PerOfCapturedDays=(CapturedDays1*100)/TotalDays1;
		//	//System.out.println("PerOfCapturedDays--->"+PerOfCapturedDays);
	   		
	   		int TotalNo=0,TotalYesStar=0;
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
	   		/*    String[] D = new String[31];
	   		 CapturedDays=0;
	   		 DisconnectedDays=0;
	   		for(i=day11;i<=day12;i++)
	   		{
	   			
	   			
	   			//System.out.println("(D[i]---->"+i);
	   			String str="D"+i;
	   			if(s.equals("Yes"))
	   			{
	   				CapturedDays= CapturedDays +1;
	   				//System.out.println("CapturedDays-->"+CapturedDays);
	   			}else
	   			{
	   				CapturedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				DisconnectedDays= DisconnectedDays+1;
	   				//System.out.println("DisconnectedDays"+DisconnectedDays);
	   			}else
	   			{
	   				DisconnectedDays=0;
	   			}
	   			 if(s.equals("Yes*"))
	   			{
	   				TotalNo=TotalNo+1;
	   				//System.out.println("TotalNo"+TotalNo);
	   			}else
	   			{
	   				
	   			}
	  
	   		}
	   	int TotalBilledDays=CapturedDays+DisconnectedDays;*/
	   		float SLADays=0.0f,SLADayPerveh=0.0f;
	   	
	   		Customer1=rst.getString("Customer");
	   		if(BillType.equals("Combined"))
	   		{	
	   			if(SLAPer.compareTo("0")==0)	
	   			{
	   				SLAAttained1="NO SLA";
	   				BilledAmt1=(Rate1 * NoofVehicles1);
	   			}
	   			else
	   			{
	   				SLADays = (TotalDays1 / 100) * SLAPer1;
   			//	//System.out.println("SLADays"+SLADays);
		   			if(TotalBilledDays1 >= SLADays)
		   			{
		   				SLAAttained1 = "Yes";
		   			    BilledAmt1 = TotalDays1 * ChargeperDay2;
		   				
		   			}
		   			else
		   			{
		   	      		SLAAttained1 = "No";
		   	        	BilledAmt1 =((TotalDays1 - (SLADays - TotalBilledDays1)) * ChargeperDay2);
		   			}
	   			}
	   		}
	   		else
	   		{
	   			
	   			////System.out.println("Sla per from else"+SLAPer1);
	   			////System.out.println("monthdays from else"+monthdays);
	   			SLADayPerveh = ((monthdays / 100) * SLAPer1);
	   			////System.out.println("now in SLADayPerveh from else --->"+SLADayPerveh);
	   			String sql4="Select count(t_billingdetails.vehid) as NoofVehicles2  from  t_fv_erp_relation ,t_billingdetails where month1='"+fromdate+"'  and t_billingdetails.vehid= t_fv_erp_relation.vehid  and ERPCode='"+CustomerCode+"' and groupname='"+GroupName+"' and TotalYesStar+TotalYes >='"+SLADayPerveh+"'";
	   			////System.out.println("sql4---->"+sql4);
	   			ResultSet rst2=st2.executeQuery(sql4);
	   			if(rst2.next())
	   			{
	   				String NoofVehicles2=rst2.getString("NoofVehicles2");
	   				int NoofVehicles3=Integer.parseInt(NoofVehicles2);
	   				SLAAttained1 = NoofVehicles2+ "veh billed";
	   				BilledAmt1 = NoofVehicles3*Rate1;
	   				////System.out.println("BilledAmt1 from else --->"+BilledAmt1);
	   			}
	   		}
	
	   		%>
	   		<tr><td><%=i%></td>
					<td><div align="center"><%=Customer1%></div></td>
			<!--<td><div align="center"><%=CustomerCode%></div></td> -->		
					<td><div align="center"><%=SLAPer%></div></td>
			<!--<td><div align="center"><%=Rate %></div></td> 
					<td><div align="center"><%=nf.format(ChargeperDay2)%></div></td> -->
					<td><div align="center"><%=NoofVehicles%></div></td>
					<td><div align="center"><%=VehcileAdded%></div></td>
					<td><div align="center"><%=VehcileRemoved%></div></td>
					<td><div align="center"><%=CapturedDays%></div></td>
					<td><div align="center"><%=nf.format(PerOfCapturedDays)%></div></td>
					<td><div align="center"><%=DisconnectedDays%></div></td>
					<td><div align="center"><%=Maintenance%></div></td>
					<td><div align="center"><%=NotCaptured%></div></td>
					<td><div align="center"><%=TotalDays%></div></td>
					<td><div align="center"><%=nf1.format(PerOfBILL)%></div></td>
					<td><div align="center"><%=TotalBilledDays%></div></td>
					<td><div align="center"><%=GroupName%></div></td>
					<td><div align="center"><%=BillType%></div></td>
					<td><div align="center"><%=SLAAttained1%></div></td>
				<!--<td><div align="center"><%=nf1.format(BilledAmt1)%></div></td>  -->	
			</tr> 		
	   		
	   		<%
	   		i++;}
	   		
		}
	   	}
catch(Exception e)
{
	////System.out.println(""+e);
	e.printStackTrace();
}
finally
{
	con.close();

}
}
%>

</body>
</html>
