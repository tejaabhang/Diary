<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" import="java.sql.*" import=" java.text.*"%>
    
    <%
    String mno = request.getParameter("mno");
    String theDate = request.getParameter("TheDate");
    
    System.out.println("The sp i s :"+mno);
    %>
<% 
	
	String filename="Full_Excel_of_service_Provider_Monthly_report_for_mobile No:"+mno+".xls";
	response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%!
	Connection conn;
	
	%>


<%
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

<%
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");


System.out.println("The sp @@@@@@@@@@@@@22i s :"+mno);
%>	
<body>


<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td >
			<table border="0" width="100%">
				<tr><td colspan="11" align="center"><font color="black" size="3">Service Provider Monthly report for mobile No :<%=mno %> </font></td></tr>
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
System.out.println(">>>>.:");
String Mobno="-",AccNo="-",BillNo="-",BillDate="-",TDate="-",TTime="-",CallNo="-",Duration="-",Amount="-",ItemType="-";
int srno=0;
String sqlPagination="SELECT * FROM airtelnew.t_chargedetailsamt WHERE MobNo = '"+mno+"'";
ResultSet rsPagination =  st.executeQuery(sqlPagination);
System.out.println("The query is :"+sqlPagination);
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
	
%>

<tr>
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
 
 </table>