<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" import="java.sql.*" import=" java.text.*"%>
    
    <%
    String sp = request.getParameter("sp");
    String theDate = request.getParameter("TheDate");
    String month = request.getParameter("month");
    System.out.println("The month:"+month);
    
    String theDate1=theDate.substring(0,4);
    
    
    System.out.println("The sp i s 1111:"+sp);
    System.out.println("The date is  :"+theDate);
    %>
<% 
	
	String filename=""+sp+"_service_Provider_Monthly_report_for_"+month+" "+theDate1+".xls";
	response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%!
	Connection conn;
	
	%>


<%

System.out.println("filename =============================== :"+filename);

//System.out.println("filename =============================== :"+filename);


DecimalFormat df = new DecimalFormat("0.00");
Statement st=null;

String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
String MM_dbConn_GPS = "jdbc:mysql://192.168.2.35/airtelnew";
String MM_dbConn_USERNAME = "fleetview";
String MM_dbConn_PASSWORD = "1@flv";


		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_GPS,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = conn.createStatement();
		
%>

<SCRIPT LANGUAGE="JavaScript1.2" SRC="js/graph.js"></SCRIPT>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>	
<body>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td >
			<table border="0" width="100%">
				<tr><td colspan="11" align="center"><font color="black" size="3"><%=sp%>_service_Provider_Monthly_report_for_<%=month%> <%=theDate1%></font></td></tr>
			</table>
		</td>
	</tr>
</table>		
<br>

<table border="1" width="100%" CELLPADDING=2 style="background: #f8fcff;" class="mytable">
	<tr bgcolor="#E8EEF7">
	<th align="center">Sr No</th>
	<th  align="center">Mobile NO</th>
	<th align="center">Account NO</th>
	<th  align="center">One Time Charge</th>
	<th  align="center">Monthly Charge</th>
	<th align="center">Call Charges</th>
	<th  align="center">Mobile Internet</th>
	<th  align="center">VAS</th>
	<th  align="center">Roaming Charge</th>
	<th  align="center">Misc Charge</th>
	<th align="center">Discount</th>
	<th  align="center">Tax</th>
	<th  align="center">Total</th>
	<th  align="center">Payable Amt</th>
	<th  align="center">Reason</th>
	
	 <th  align="center">One Time Charge</th>
	<th  align="center">Monthly Charge</th>
	<th align="center">Call Charges</th>
	<th  align="center">Mobile Internet</th>
	<th  align="center">VAS</th>
	<th  align="center">Roaming Charge</th>
	<th  align="center">Misc Charge</th>
	<th align="center">Discount</th>
	<th  align="center">Tax</th>
	
	<th  align="center">Payable Amt</th>
	<th  align="center">Reason</th>
	
	</tr>

<%
//System.out.println(">>>>.:");
String Mobno="-",AccNo="-",OneTimeCharge="-",MonthlyCharge="-",ValueASCharge="-",RoamingCharge="-",Discounts="-",Tax="-",Total="-",BillMonth="-",UsageCharge="";
String MessagingCharges="-",MiscCharge="-",SubTotal="-",twamt="-",reason="-";;


String OneTimeCharge1="-",MonthlyCharge1="-",ValueASCharge1="-",RoamingCharge1="-",Discounts1="-",Tax1="-",Total1="-",BillMonth1="-",UsageCharge1="",MessagingCharges1="-",MiscCharge1="-",SubTotal1="-",twamt1="-",reason1="-" ;

int srno=0;
String sqlPagination="SELECT * FROM airtelnew.t_subsummarydet WHERE Service_Provider = '"+sp+"' AND DateTime1='"+theDate+" 00:00:00'  order by total desc ";
ResultSet rsPagination =  st.executeQuery(sqlPagination);
System.out.println("The query is :"+sqlPagination);
while(rsPagination.next()){
	Mobno=rsPagination.getString("Mobno");
	AccNo=rsPagination.getString("AccNo");
	OneTimeCharge=rsPagination.getString("OneTimeCharge");
	MonthlyCharge=rsPagination.getString("MonthlyCharge");
	ValueASCharge=rsPagination.getString("ValueASCharge");
	RoamingCharge=rsPagination.getString("RoamingCharge");
	Discounts=rsPagination.getString("Discounts");
	Tax=rsPagination.getString("Tax");
	Total=rsPagination.getString("Total");
	UsageCharge=rsPagination.getString("UsageCharge");
	MessagingCharges=rsPagination.getString("MessagingCharges");	
	MiscCharge=rsPagination.getString("MiscCharge");
	twamt=rsPagination.getString("TWAmt");
	reason=rsPagination.getString("comment");
	
	
	OneTimeCharge1=rsPagination.getString("OneTimeCharge1");
	MonthlyCharge1=rsPagination.getString("MonthlyCharge1");
	ValueASCharge1=rsPagination.getString("ValueASCharge1");
	RoamingCharge1=rsPagination.getString("RoamingCharge1");
	Discounts1=rsPagination.getString("Discounts1");
	Tax1=rsPagination.getString("Tax1");
	Total1=rsPagination.getString("Total1");
	UsageCharge1=rsPagination.getString("UsageCharge1");
	MessagingCharges1=rsPagination.getString("MessagingCharges1");	
	MiscCharge1=rsPagination.getString("MiscCharge1");
	twamt1=rsPagination.getString("TWAmt1");
	reason1=rsPagination.getString("comment1");
	
	
	//System.out.println("The reason1 is==>"+reason1);
	//System.out.println("The MonthlyCharge1==>"+MonthlyCharge1);
	
	
	if(MonthlyCharge1.equalsIgnoreCase("0"))
	{
		
		//System.out.println("The if loop==>");
		OneTimeCharge1=OneTimeCharge;
		MonthlyCharge1=MonthlyCharge;
		ValueASCharge1=ValueASCharge;
		RoamingCharge1=RoamingCharge;
		Discounts1=Discounts;
		Tax1=Tax;
		twamt1=Total;
		reason1=reason;
		
		
	}else{
		
		//System.out.println("The else loop==>");
		
		
	}
	
	MonthlyCharge=df.format(Double.parseDouble(MonthlyCharge));
	UsageCharge=df.format(Double.parseDouble(UsageCharge));
	MessagingCharges=df.format(Double.parseDouble(MessagingCharges));
	Discounts=df.format(Double.parseDouble(Discounts));
	RoamingCharge=df.format(Double.parseDouble(RoamingCharge));
	Total=df.format(Double.parseDouble(Total));
	Tax=df.format(Double.parseDouble(Tax));
	twamt=df.format(Double.parseDouble(twamt));
	
	
	MonthlyCharge1=df.format(Double.parseDouble(MonthlyCharge1));
	UsageCharge1=df.format(Double.parseDouble(UsageCharge1));
	MessagingCharges1=df.format(Double.parseDouble(MessagingCharges1));
	Discounts1=df.format(Double.parseDouble(Discounts1));
	RoamingCharge1=df.format(Double.parseDouble(RoamingCharge1));
	Total1=df.format(Double.parseDouble(Total1));
	Tax1=df.format(Double.parseDouble(Tax1));
	twamt1=df.format(Double.parseDouble(twamt1));
	
	if(reason ==null) {
		reason="-";
	}
	//System.out.println(">>>>.:");
%>

<tr>
		<td align="right">			
			<div align="right" style="overflow: auto;"><%=++srno %></div>	
	    </td>
	  	<td align="right">			
			<div align="right"><a href="serviceProviderMonthlyReport1.jsp?mno=<%=Mobno %>" target="_blank"><%=Mobno %></a></div>
			
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=AccNo %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=OneTimeCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MonthlyCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=UsageCharge %></div>
	  	</td>	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MessagingCharges %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=ValueASCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=RoamingCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MiscCharge %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Discounts %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Tax %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Total %></div>
	  	</td>
	  	<td align="right">			
			<div align="right"><%= twamt%></div>
	  	</td>
	  	<td align="right">			
			<div align="left" style="overflow: auto; width: 100px;"><%=reason %></div>
	  	</td>	
	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=OneTimeCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MonthlyCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=UsageCharge1 %></div>
	  	</td>	  	
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MessagingCharges1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=ValueASCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=RoamingCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=MiscCharge1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Discounts1 %></div>
	  	</td>
	  	<td align="right">			
			<div align="right" style="overflow: auto;"><%=Tax1 %></div>
	  	</td>
<!--	  	<td align="right">			
			<div align="right" style="overflow: auto;">< %=Total1 %></div>
	  	</td> -->
	  	<td align="right">			
			<div align="right"><%=twamt1 %>  </div>
	  	</td>
	  	<td align="right">			
			<div align="left" style="overflow: auto; width: 100px;"><%=reason1 %></div>
	  	</td>	  	
	  	
	  	  	
	</tr> 
	
 <%} 
//System.out.println("srno is" +srno);
 %>	
 
 </table>