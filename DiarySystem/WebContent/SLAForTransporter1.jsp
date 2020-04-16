<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
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
<form name="sla" method="get" action="" onSubmit="return validate();">


<%!
	Connection con;
	Statement st,st1,st2;  
%>
<%
	
//System.out.println("heeeeeeeeeeeeeeee.>>>>>>>>>>>>>-->");
String today=new SimpleDateFormat("dd").format(new java.util.Date());
	int today1=Integer.parseInt(today);
	String fromdate=request.getParameter("date");
	int index=fromdate.length();
	String year=fromdate.substring(0,4);
	//System.out.println("year-->"+year);
	String month=fromdate.substring(5,7);
	//System.out.println("month==>"+month);

	String transporter=request.getParameter("transporter");
	String SLAPer=request.getParameter("SLAPer");
	String BillType=request.getParameter("BillType");
	String monthdays=request.getParameter("monthdays");
	String CustomerCode=request.getParameter("CustomerCode");
	String GroupName=request.getParameter("GroupName");
	
	
	//System.out.println("CustomerCode==>"+CustomerCode);
	
	
	%>
	<table width="900px" border="0" align="center" bgcolor="#77D7D4">
	<tr>
		<th align="center"><font size="3" color="maroon" >SLA Summary Report for Month <%=month%> and year <%=year%></font> </th>
		<th><a href="ExcelSLAForTransporter.jsp?transporter=<%=transporter%>&date=<%=fromdate%>&SLAPer=<%=SLAPer%>&BillType=<%=BillType%>&monthdays=<%=monthdays%>&monthdays=<%=monthdays%>&CustomerCode=<%=CustomerCode%>&GroupName=<%=GroupName%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a></th>
	
</tr><tr>
		<td><font size="2" color="maroon" >Yes - Captured Data</font></td>

		<td><font size="2" color="maroon" >Yes* - Disconnected Data</font></td>
	
		<td><font size="2" color="maroon" >No - Not Captured</font></td>	
		
		<td><font size="2" color="maroon" >NA - Data Not Processed</font></td>	
	</tr>
	</table>
	<br></br>
	<table border="1" width="100%" class="sortable">
<tr>
<td>Sr no</td>
<td>Customer</td>
<td>VehID</td>
<td>VehRegno</td>
<td>VehAddedThisMonth</td>
<td>vehRemovedThisMonth</td>
<td>D1</td>
<td>D2</td>
<td>D3</td>
<td>D4</td>
<td>D5</td>
<td>D6</td>
<td>D7</td>
<td>D8</td>
<td>D9</td>
<td>D10</td>
<td>D11</td>
<td>D12</td>
<td>D13</td>
<td>D14</td>
<td>D15</td>
<td>D16</td>
<td>D17</td>
<td>D18</td>
<td>D19</td>
<td>D20</td>
<td>D21</td>
<td>D22</td>
<td>D23</td>
<td>D24</td>
<td>D25</td>
<td>D26</td>
<td>D27</td>
<td>D28</td>
<td>D29</td>
<td>D30</td>
<td>D31</td>
<td>CapturedDays</td>
<td>DisconnectedDays</td>
<td>NotCaptured</td>
<td>TotalDays</td>
<td>SLA Attained</td>
<td>SLA Per For Vehicle</td>
<td>SLA Required</td>
</tr>
	<%
	try
	{	
	
		Class.forName(MM_dbConn_DRIVER);
		con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    st=con.createStatement();
	    st1=con.createStatement();
	    st2=con.createStatement();
		
		//  //System.out.println("monthdays----->"+monthdays);
	    String sql="SELECT * "+
	    "	FROM t_fv_erp_relation, t_billingdetails "+
	    "	WHERE month1 = '"+fromdate+"' "+
	    "	AND t_billingdetails.vehid = t_fv_erp_relation.vehid "+
	    "	AND t_fv_erp_relation.ERPCode = '"+CustomerCode+"' "+
	    "	AND `GroupName` = '"+GroupName+"'"; 
	   //System.out.println(sql);	
	   ResultSet rst=st.executeQuery(sql);
	   	int i=1;
	   while(rst.next())
	   	{
	   		
		   String Customer=rst.getString("Transporter");
	   		String VehID=rst.getString("VehID");
	   		String VehRegno=rst.getString("VehRegno");
	   		String VehAddedThisMonth=rst.getString("VehAddedThisMonth");
	   		String vehRemovedThisMonth=rst.getString("vehRemovedThisMonth");
	   		String D1=rst.getString("D1");
	   		String D2=rst.getString("D2");
	   		String D3=rst.getString("D3");
	   		String D4=rst.getString("D4");
	   		String D5=rst.getString("D5");
	   		String D6=rst.getString("D6");
	   		String D7=rst.getString("D7");
	   		String D8=rst.getString("D8");
	   		String D9=rst.getString("D9");
	   		String D10=rst.getString("D10");
	   		String D11=rst.getString("D11");
	   		String D12=rst.getString("D12");
	   		String D13=rst.getString("D13");
	   		String D14=rst.getString("D14");
	   		String D15=rst.getString("D15");
	   		String D16=rst.getString("D16");
	   		String D17=rst.getString("D17");
	   		String D18=rst.getString("D18");
	   		String D19=rst.getString("D19");
	   		String D20=rst.getString("D20");
	   		String D21=rst.getString("D21");
	   		String D22=rst.getString("D22");
	   		String D23=rst.getString("D23");
	   		String D24=rst.getString("D24");
	   		String D25=rst.getString("D25");
	   		String D26=rst.getString("D26");
	   		String D27=rst.getString("D27");
	   		String D28=rst.getString("D28");
	   		String D29=rst.getString("D29");
	   		String D30=rst.getString("D30");
	   		String D31=rst.getString("D31");
	   		String TotalYes=rst.getString("TotalYes");
	   		String TotalYesStar=rst.getString("TotalYesStar");
	   		String TotalNo=rst.getString("TotalNo");
	   		String TotalDays=rst.getString("TotalDays");
	   		float SLADays=0.0f,SLADayPerveh=0.0f;
	   		float	SLAPer1 = Float.parseFloat(SLAPer);
	   		String SLAAttained1="";
	   		float	TotalDays1 = Float.parseFloat(TotalDays);
	   		float	TotalYes1 = Integer.parseInt(TotalYes);
	   		float	TotalYesStar1 = Integer.parseInt(TotalYesStar);
	   		float TotalBilledDays1=TotalYes1+TotalYesStar1;
	   		float per=0.0f;
	   		try{
	   		if(BillType.equals("Combined"))
	   		{	
	   			if(SLAPer.compareTo("0")==0)	
	   			{
	   				SLAAttained1="NO SLA";
	   			//	BilledAmt1=(Rate1 * NoofVehicles1);
	   			}
	   			else
	   			{
	   				SLADays = (TotalDays1/ 100) * SLAPer1;
   			//	//System.out.println("SLADays"+SLADays);
   					per=(TotalBilledDays1*100)/TotalDays1;
		   			if(TotalBilledDays1 >= SLADays)
		   			{
		   				SLAAttained1 = "Yes";
		   			  //  BilledAmt1 = TotalDays1 * ChargeperDay2;
		   				
		   			}
		   			else
		   			{
		   	      		SLAAttained1 = "No";
		   	        	//BilledAmt1 =((TotalDays1 - (SLADays - TotalBilledDays1)) * ChargeperDay2);
		   			}
	   			}
	   		}
	   		else
	   		{
	   			int mmonthdays=Integer.parseInt("monthdays");
	   			////System.out.println("Sla per from else"+SLAPer1);
	   			////System.out.println("monthdays from else"+monthdays);
	   			SLADayPerveh = ((mmonthdays / 100) * SLAPer1);
	   		//	//System.out.println("now in SLADayPerveh from else --->"+SLADayPerveh);
	   			String sql4="Select count(t_billingdetails.vehid) as NoofVehicles2  from  t_fv_erp_relation ,t_billingdetails where month1='"+fromdate+"'  and t_billingdetails.vehid= t_fv_erp_relation.vehid  and ERPCode='"+CustomerCode+"' and groupname='"+GroupName+"' and TotalYesStar+TotalYes >='"+SLADayPerveh+"'";
	   		//	//System.out.println("sql4---->"+sql4);
	   			ResultSet rst2=st2.executeQuery(sql4);
	   			if(rst2.next())
	   			{
	   				String NoofVehicles2=rst2.getString("NoofVehicles2");
	   				int NoofVehicles3=Integer.parseInt(NoofVehicles2);
	   				SLAAttained1 = NoofVehicles2+ "veh billed";
	   				//BilledAmt1 = NoofVehicles3*Rate1;
	   			//	//System.out.println("BilledAmt1 from else --->"+BilledAmt1);
	   			}
	   		}
	   		}catch(Exception e){
	   			//System.out.println(e);
	   		}
	   		%>
	   		<tr>
					<td><div align="center"><%=i%></div></td>
					<td><div align="center"><%=Customer%></div></td>
					<td><div align="center"><%=VehID%></div></td>
					<td><div align="center"><%=VehRegno%></div></td>
					<td><div align="center"><%=VehAddedThisMonth%></div></td>
					<td><div align="center"><%=vehRemovedThisMonth%></div></td>
					<td><div align="center"><%=D1%></div></td>
					<td><div align="center"><%=D2%></div></td>
					<td><div align="center"><%=D3%></div></td>
					<td><div align="center"><%=D4%></div></td>
					<td><div align="center"><%=D5%></div></td>
					<td><div align="center"><%=D6%></div></td>
					<td><div align="center"><%=D7%></div></td>
					<td><div align="center"><%=D8%></div></td>
					<td><div align="center"><%=D9%></div></td>
					<td><div align="center"><%=D10%></div></td>
					<td><div align="center"><%=D11%></div></td>
					<td><div align="center"><%=D12%></div></td>
					<td><div align="center"><%=D13%></div></td>
					<td><div align="center"><%=D14%></div></td>
					<td><div align="center"><%=D15%></div></td>
					<td><div align="center"><%=D16%></div></td>
					<td><div align="center"><%=D17%></div></td>
					<td><div align="center"><%=D18%></div></td>
					<td><div align="center"><%=D19%></div></td>
					<td><div align="center"><%=D20%></div></td>
					<td><div align="center"><%=D21%></div></td>
					<td><div align="center"><%=D22%></div></td>
					<td><div align="center"><%=D23%></div></td>
					<td><div align="center"><%=D24%></div></td>
					<td><div align="center"><%=D25%></div></td>
					<td><div align="center"><%=D26%></div></td>
					<td><div align="center"><%=D27%></div></td>
					<td><div align="center"><%=D28%></div></td>
					<td><div align="center"><%=D29%></div></td>
					<td><div align="center"><%=D30%></div></td>
					<td><div align="center"><%=D31%></div></td>
					<td><div align="center"><%=TotalYes%></div></td>
					<td><div align="center"><%=TotalYesStar%></div></td>
					<td><div align="center"><%=TotalNo%></div></td>
					<td><div align="center"><%=TotalDays%></div></td>
					<td><div align="center"><%=SLAAttained1%></div></td>
					<td><div align="center"><%=per%></div></td>
					<td><div align="center"><%=SLAPer%></div></td>
			</tr>
				   		
	   		
	   		<%
	   		
	   	i++;	
	   	
	   	}}
catch(Exception e)
{
	//System.out.println(""+e);
	e.printStackTrace();
}
finally
{
	con.close();

}

%>
</table>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
