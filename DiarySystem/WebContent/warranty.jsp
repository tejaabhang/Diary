
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css">
	<link rel="stylesheet" href="css/ajax-tooltip-demo.css" media="screen" type="text/css">
<title>Insert title here</title>
</head>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3;
String sql,sql1,sql2,sql3;
String today;
%>
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
<%
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn1.createStatement();
	st1=conn1.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
}catch(Exception e)
{
	out.print("Exception --->"+e);
}
%>
<form name="reprov" method="post">
	<table border="1" width="400px" align="center">
			<tr>
			<td>vehicle registration number</td>
			<td>warranty till</td>
			<td>installed date</td>
			<td>warranty</td>
			</tr>

<%
////System.out.println("page started----");
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
////System.out.println("miliseconds"+miliseconds);
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
////System.out.println("page started----"+today);
String Vehcode="",insdt="",warrantytill="",warranty="";
String sqltuh="select * from t_vehicledetails ";

ResultSet rsttuh=st.executeQuery(sqltuh);
////System.out.println(sqltuh);
while(rsttuh.next())
{
	Vehcode=rsttuh.getString("VehicleCode");
	////System.out.println("Vehcode---->"+Vehcode);
	insdt=rsttuh.getString("InstalledDate");
	////System.out.println("insdt---->"+insdt);
	
	sql="select * from t_amchistory where VehCode = '"+Vehcode+"' order by NewDate desc limit 1";
	////System.out.println(sql);
	ResultSet rsamcc=st.executeQuery(sql);
		if(rsamcc.next())
		{
			warrantytill=rsamcc.getString("WarrantyTill");
			////System.out.println(warrantytill);
			if(!(null==rsamcc.getDate("WarrantyTill")))
			{
			//	//System.out.println("now in if");
				try{	
				sql1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
				ResultSet rsamcc1=st1.executeQuery(sql1);
				if(rsamcc1.next())
				{
					if(rsamcc1.getInt("days") > 0)
					{
						warranty="Yes";
					}
					else
					{
						warranty="No";
					}
				}
				}
				catch(Exception X)
				{
					warranty="-";
	
				}
				////System.out.println(Vehcode);
				////System.out.println(warrantytill);
				////System.out.println(insdt);
				////System.out.println(warranty);
				%>
				
				<%
				}
			
			
			else
			{
				////System.out.println("noe in else");
				
				sql2="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt+"') as days";
				ResultSet rst222=st2.executeQuery(sql2);
				////System.out.println("sql2---"+sql2);
				if(rst222.next())
				{
					
					if(rst222.getInt("days") > 365)
							{
						warranty="NO";
							}
					else
					{
						warranty="YES";
					}
				}
				////System.out.println(Vehcode);
				////System.out.println(warrantytill);
				////System.out.println(insdt);
				////System.out.println(warranty);
				
			}
		
		}
}	
%>
	</table>
</form>
</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright Â© 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>