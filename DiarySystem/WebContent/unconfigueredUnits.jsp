<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st=null,st1=null,st2=null,st3=null;
%>
<html>
<head>
<title>Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
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
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1">
<!--- code start here ------> 
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3"> <b>Unconfigured Units Report</b></font></td></tr>
			</table>
		</td>
	</tr>
</table>
<%
try{
Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st2=conn.createStatement();
st3=conn.createStatement();
st1=conn.createStatement();
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);
String fromdate=request.getParameter("calender");
String todate=request.getParameter("calender1");
%>
<form name="unit" method="get" action="" onsubmit="return validate();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD"> <td><font color="black"><b>From Date:</b> </font>
					<input type="text" id="calender" name="calender" size="13" value="<%=sdt%>" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%Y-%m-%d",     // the date format
		                    button      : "trigger"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;&nbsp;&nbsp;
					
				<font color="black" ><b>To Date:</b> </font>
					<input type="text" id="calender1" name="calender1" size="13" value="<%=sdt%>" readonly/>
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
			<td align="center" colspan="2">
				<input type="submit" name="submit" id="submit" value="submit" />
			</td>
		</tr>
	</table>
</form>
<br></br>
<table border="1" width="100%" align="center" class="sortable">
<tr bgcolor="#BDBDBD">
<td><b>Sr.No</b></td>
<td><b>UnitID</b></td>
<td><b>DateTime</b></td>
<td><b>LastLocation</b></td>
<td><b>FirstLocation</b></td>
<td><b>DispDate</b></td>
<td><b>DispBy</b></td>
<td><b>DispTo</b></td>
<td><b>OwnerName</b></td>
<td><b>First<br>DateTime</b></td>
<td><b>Device<br>Deactivated</b></td>
<td><b>SIM<br>Deactivated</b></td>
<td><b>Total<br>DaysData</b></td>
</tr>
<%
String dd=request.getQueryString();
if(dd==null||(sdt.equalsIgnoreCase(fromdate)&& sdt.equalsIgnoreCase(todate)))
{
	String ownername="";
	String TheFieldDataDate="";
	String TheFieldDataTime="";
	String TheFieldSubject="";
	String sql1="select distinct (unitid),thedate,thetime,location from db_gps.allconnectedunits where thedate ='"+sdt+"' and vehno ='-'  group by unitid order by unitid asc";
	  //System.out.println(sql1);
	ResultSet rst=st.executeQuery(sql1);
	String srno2="";
	int cnt11=1;
	while(rst.next())
	{					
		String Firstdatetime="",DispDate="",user="",disadd="";
		String unitid=rst.getString("unitid");
		String thedate=rst.getString("thedate");
		String thetime=rst.getString("thetime");
		String UpdateDatetime=thedate+" "+thetime;
		String location=rst.getString("location");
		String mobno="";
		String lifeData="0";
		//System.out.println(location);

		if(location.contains("Transworld")==true){

		}else{
			String sql2="select OrderNo,MobNo from db_gps.t_unitmaster where unitid ='"+unitid+"' and status not in('Send','Received')";
			//System.out.println(sql2);
			ResultSet rst2=st1.executeQuery(sql2);
			if(rst2.next()){

				int OrderNo=rst2.getInt("OrderNo");
				//System.out.println(OrderNo);
				mobno=rst2.getString("MobNo");
				//System.out.println(mobno);
				if(OrderNo==0){
					ownername="Dispatch without being entered into system";
				}
				String sql3="select * from t_unitorder where reqno ='"+OrderNo+"'";
				//System.out.println(sql3);
				ResultSet rst3=st2.executeQuery(sql3);
				if(rst3.next()){
					ownername=rst3.getString("cust");
				}
			}
			String sql6="select DispDate,user,disadd from db_gps.t_unitmasterhistory where  UnitID ='"+unitid+"' AND dispdate <> '-' ORDER BY DISPDATE desc limit 1";
			//System.out.println(sql6);
			ResultSet rst6=st1.executeQuery(sql6);
			if(rst6.next()){
				DispDate=rst6.getString("DispDate");
				user=rst6.getString("user");
				disadd=rst6.getString("disadd");
			}
			String sqllifedata="select TO_DAYS('"+UpdateDatetime+"')-TO_DAYS('"+DispDate+"') as days ";
			ResultSet rslifedata=st1.executeQuery(sqllifedata);
			if(rslifedata.next()){
				lifeData=rslifedata.getString("days");

			}
			String sql4="select distinct TheFieldDataDate,TheFieldDataTime,unitid,TheFieldSubject  from db_gps.t_veh0 where unitid ='"+unitid+"'  order by concat(TheFieldDataDate,TheFieldDataTime) asc limit 1";
			//		//System.out.println(sql4);
			ResultSet rst3=st1.executeQuery(sql4);
			if(rst3.next()){
				TheFieldDataDate=rst3.getString("TheFieldDataDate");
				TheFieldDataTime=rst3.getString("TheFieldDataTime");
				TheFieldSubject=rst3.getString("TheFieldSubject");
				Firstdatetime=TheFieldDataDate+" "+TheFieldDataTime;
			}
			String device="",SIMDeactivation="";
			String sqldevicedeactivated="select * from db_gps.t_unitreplacement where OldUnitID='"+unitid+"' and InstDate>='"+DispDate+"' and 103.241.181.36='DeActive'  order by EntDate DESC ";
			//System.out.println("sqldevicedeactivated================>"+sqldevicedeactivated);
			ResultSet rsdeactivated=st1.executeQuery(sqldevicedeactivated);
			if(rsdeactivated.next()){
				String vehcodeofdeactivated=rsdeactivated.getString("VehCode");
				device="Yes";
				//System.out.println(vehcodeofdeactivated+"vehiclecode===========>"+device);
				String sqlsimdeactivation="select * from db_gps.t_simmaster where Mobno='"+mobno+"' and Status='Deactivated'";
				ResultSet rssimdeactivation=st2.executeQuery(sqlsimdeactivation);
				if(rssimdeactivation.next()){
					SIMDeactivation="Yes";
				}else{
					SIMDeactivation="No";
				}
			}else{
				device="No";
				SIMDeactivation="No";
			}
			String receiveDate="";
			String sql5="select rdate from t_unitreceived where unitid ='"+unitid+"' order by rdate desc limit 1";
			//		//System.out.println(sql5);
			ResultSet rst4=st2.executeQuery(sql5);
			if(rst4.next()){
				receiveDate=rst4.getString("rdate");
				//			//System.out.println("receiveDate"+receiveDate);
			}

			srno2=cnt11+"";
			int days=0;										
			String sql7="select TO_DAYS('"+DispDate+"')-TO_DAYS('"+receiveDate+"') as days";
			//     	//System.out.println(sql7);
			ResultSet rst7=st2.executeQuery(sql7);
			if(rst7.next()){
				days=rst7.getInt("days");
				//System.out.println(days);
				if(days>=0){
					String UpdateDatetimeFormat="";
					String FirstdatetimeFormat="";
					String DispDateFormat="";
					try{
						UpdateDatetimeFormat=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(UpdateDatetime));
						FirstdatetimeFormat=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Firstdatetime));
						DispDateFormat=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DispDate));
					}catch (Exception e) {
						e.printStackTrace();
					}
					String arr5[]={srno2,unitid,UpdateDatetimeFormat,location,FirstdatetimeFormat,TheFieldSubject,DispDateFormat,user,disadd,ownername,device,SIMDeactivation,lifeData};
					//int arr1[]={,};
			
					
						%>
						<tr>
							<td><div align="right"><%=cnt11++%></div></td>
							<td><div align="right"><%=unitid%></div></td>
							<td><div align="right"><%=UpdateDatetimeFormat%></div></td>
							<td><%=location%></td>
							<td><%=TheFieldSubject%></td>
							<td><div align="right"><%=DispDate%></div></td>
							<td><%=user%></td>
							<td><%=disadd%></td>
							<td><%=ownername%></td>
							<td><div align="right"><%=FirstdatetimeFormat %></div></td>
							<td><%=device%></td>
							<td><%=SIMDeactivation%></td>
							<td><div align="right"><%=lifeData%></div></td>
						</tr>
						
						<%
					

					cnt11++;
				}
			}

		}

	}
	
}
else
{
%>


<%
String sql="select * from db_CustomerComplaints.t_unconfigueredUnits where DateTime between '"+fromdate+"' and '"+todate+"' ";
//System.out.println(sql);
ResultSet rs=st.executeQuery(sql);
int i=1;
while(rs.next()){
	String DateTime="-",DispDate="-",FirstDateTime="-";
	DateTime=rs.getString("DateTime");
	if(""==DateTime||DateTime.equals("")||"".equals(DateTime)||"null".equals(DateTime)){
		
	}else{
		DateTime=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(DateTime));
	}
	DispDate=rs.getString("DispDate");
	if(""==DispDate||DispDate.equals("")||"".equals(DispDate)||"null".equals(DispDate)){
		
	}else{
		DispDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DispDate));
	}
	FirstDateTime=rs.getString("FirstDateTime");
	if(""==FirstDateTime||FirstDateTime.equals("")||"".equals(FirstDateTime)||"null".equals(FirstDateTime)){
		
	}else{
		FirstDateTime=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(FirstDateTime));
	}
	String TotalDaysData="-",OwnerName="",DispBy,DispTo;
	TotalDaysData=rs.getString("TotalDaysData");
	OwnerName=rs.getString("OwnerName");
	DispBy=rs.getString("DispBy");
	DispTo=rs.getString("DispTo");
	if("null".equals(TotalDaysData)){
		TotalDaysData="-";
	}
	if("null".equals(OwnerName)){
		OwnerName="-";
	}
	if("null".equals(DispBy)||" ".equals(DispBy) ){
		DispBy="-";
	}
	if("null".equals(DispTo)||" ".equals(DispTo) ){
		DispTo="-";
	}
	%><tr>
	<td><div align="right"><%=i++%></div></td>
	<td><div align="right"><%=rs.getString("UnitID")%></div></td>
	<td><div align="right"><%=DateTime%></div></td>
	<td><%=rs.getString("LastLocation") %></td>
	<td><%=rs.getString("FirstLocation")%></td>
	<td><div align="right"><%=DispDate%></div></td>
	<td><%=DispBy%></td>
	<td><%=DispTo%></td>
	<td><%=OwnerName%></td>
	<td><div align="right"><%=FirstDateTime %></div></td>
	<td><%=rs.getString("DeviceDeactivated") %></td>
	<td><%=rs.getString("SIMDeactivated") %></td>
	<td><div align="right"><%=TotalDaysData%></div></td></tr>
	<%
}

}
}catch(Exception e){
	e.printStackTrace();
}
%>
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
