<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    <%@ page import="java.sql.PreparedStatement"  %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%><html>
<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import ="java.text.DecimalFormat" errorPage="" %>
<%!
	Connection conn;
	
	%>
<head>
<script type="text/javascript">

</script>
</head>

<body> 
<%
System.out.println("====IN UPDATE PAGE *************==service Provider report 3========");
try
{
	int i=0;
	Statement st=null;
try {
	String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
	String MM_dbConn_GPS = "jdbc:mysql://192.168.2.35/airtelnew";
	
	// String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/airtelnew";

	
	String MM_dbConn_USERNAME = "fleetview";
	String MM_dbConn_PASSWORD = "1@flv";


			Class.forName(MM_dbConn_DRIVER);
			conn = DriverManager.getConnection(MM_dbConn_GPS,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			st = conn.createStatement();

} catch (Exception e2) {
	System.out.println("The exception is :"+e2);
}
	
	String mno = request.getParameter("mno");
	String accNo = request.getParameter("accno");
	String totalID = request.getParameter("totalID");
	String payableAmt = request.getParameter("PayableAmt1");
	String reason = request.getParameter("reason1");	
	String thedate = request.getParameter("thedate");	
	String sp = request.getParameter("sp");
	
	
	
	
	 String OneTimeCharge=request.getParameter("OneTimeCharge");
	 String MonthlyCharge=request.getParameter("MonthlyCharge");
	 //String ValueASCharge=request.getParameter("ValueASCharge");
	 String RoamingCharge=request.getParameter("RoamingCharge");
	 String Discounts=request.getParameter("Discount");
	 String Tax=request.getParameter("Tax");
	 String MiscCharge=request.getParameter("MiscCharge");
	 String UsageCharge=request.getParameter("UsageCharge");
	 String MessagingCharges=request.getParameter("MobileInternet");
	 String VAS =request.getParameter("VAS");
	 String TotalAmount =request.getParameter("TotalAmount1");
	 //String PayableAmt =request.getParameter("PayableAmt");
	 String CallCharges =request.getParameter("CallCharges");
	
	
	//System.out.println("The OneTimeCharge no is :"+OneTimeCharge);
	//System.out.println("The sp is==>"+sp);
	
	
	//System.out.println("The reason is==>"+reason);
	
	reason=reason.replace("'","");
//	System.out.println("The reason is=after=>"+reason);
	
//	System.out.println("The MonthlyCharge no is :"+MonthlyCharge);
	//System.out.println("The moValueASChargebile no VAS is :"+VAS);
	//System.out.println("The RoamingCharge no is :"+RoamingCharge);
	//System.out.println("The Discounts no is :"+Discounts);
	
	//System.out.println("The Tax no is :"+Tax);
	//System.out.println("The MiscCharge no is :"+MiscCharge);
	//System.out.println("The UsageCharge no is :"+UsageCharge);
	//System.out.println("The MessagingCharges no is :"+MessagingCharges);
	//System.out.println("The VAS no is :"+VAS);
	//System.out.println("The TotalAmount no is :"+TotalAmount);
	//System.out.println("The PayableAmt no is :"+payableAmt);
	//System.out.println("The CallCharges no is :"+CallCharges);
	
	
	
	
	
	//System.out.println("The accNo no is :"+accNo);
	//System.out.println("The totalID no is :"+totalID);
	//System.out.println("The payableAmt no is :"+payableAmt);
	//System.out.println("The reason no is :"+reason);
	//System.out.println("The sp no is :"+sp);
	
		
	
	try{
		//String sql="update db_simbillstest.t_subsummarydet SET  TWAmt1='"+payableAmt+"',OneTimeCharge1='"+OneTimeCharge+"',MonthlyCharge1='"+MonthlyCharge+"',ValueASCharge1='"+VAS+"',RoamingCharge1='"+RoamingCharge+"',Discounts1='"+Discounts+"',Tax1='"+Tax+"',MiscCharge1='"+MiscCharge+"',UsageCharge1='"+CallCharges+"',MessagingCharges1='"+MessagingCharges+"',comment1='"+reason+"' , 	payableamount='"+payableAmt+"'  where Service_Provider = '"+sp+"' AND DateTime1 = '"+thedate+" 00:00:00' AND Mobno='"+mno+"' and AccNo ='"+accNo+"'";
		
		String sql="update t_subsummarydet SET  TWAmt1='"+payableAmt+"',OneTimeCharge1='"+OneTimeCharge+"',MonthlyCharge1='"+MonthlyCharge+"',ValueASCharge1='"+VAS+"',RoamingCharge1='"+RoamingCharge+"',Discounts1='"+Discounts+"',Tax1='"+Tax+"',MiscCharge1='"+MiscCharge+"',UsageCharge1='"+CallCharges+"',MobileInternet1='"+MessagingCharges+"',comment1='"+reason+"'  where Service_Provider = '"+sp+"' AND DateTime1 = '"+thedate+" 00:00:00' AND Mobno='"+mno+"' and AccNo ='"+accNo+"'";
		
		System.out.println("the no of rows updated is====before=>>"+sql);
		i=st.executeUpdate(sql);
		}catch(Exception e1){
			System.out.println("the exception1 is update query:"+e1);
		}
		
		//System.out.println("the no of rows updated is=====>>"+i);
		
		
		//System.out.println("end of page====>>");
	
		
}
catch(Exception e)
{
	System.out.println("Exception Sms  DAta Insert=====>>"+e);
}
finally{
	//con.close();
	response.sendRedirect("serviceProviderMonthlyReport2.jsp?Msg=1");
}
%>
</body>

</html>