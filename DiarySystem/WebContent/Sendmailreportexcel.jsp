<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<%  
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=\"DaywiseReport.xls\"");
%>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,stQuickTest;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
%>
<html>
<head>
<title>Seven Day Diary System</title>

<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="sorttable.js" type="text/javascript"></script>

</head>

<body>





<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn.createStatement();
    st3=conn1.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("yyyy-MM-dd");
    String sdt = fmt.format(td);
    data1=request.getParameter("data");
    String vehno=request.getParameter("vehno");
    String inputtype=request.getParameter("dataFilter");
    //System.out.println(inputtype);
    String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
%>


 <table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Send mail report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<%
String dd=request.getQueryString();
if(dd==null)
{
%>


<%
}
else
{

%>

<%
                        if(inputtype.equalsIgnoreCase("vehno")){
                        	sql="select * from t_emailmaster where vahno like '%"+vehno+"%' order by UpdatedDateTime Desc";
                        }else if(inputtype.equalsIgnoreCase("token")){
							sql="select * from t_emailmaster where srno='"+data1+"' order by UpdatedDateTime asc";
						}else if(inputtype.equalsIgnoreCase("date")){
							sql="select * from t_emailmaster where UpdatedDateTime>='"+fromdate+"' and UpdatedDateTime<= '"+todate+"' order by UpdatedDateTime asc";
						}else{
							sql="select * from t_emailmaster order by UpdatedDateTime Desc";
						}
                        ResultSet rst1=stQuickTest.executeQuery(sql);
                        //System.out.println(sql);
                        int i=1;
                    

                        
%>

			<table width="100%" border="2" align="center" class="sortable">
				<tr><th  colspan="13" bgcolor="#77D7D4"> <font color="black">Unit History</font></th></tr>
				<tr>
					<td><font color="black"> Sr.</font></td>
					<td><font color="black"> Token</font></td>
           			<td><font color="black"> Vehicle Reg no.</font></td>
					<td><font color="black"> Transporter</font></td>
					<td><font color="black"> UnitID</font></td>
					<td><font color="black"> Subject</font></td>
					<td><font color="black"> Body</font></td>
					<td><font color="black"> Template</font></td>
					<td><font color="black"> From ID</font></td>
            		<td><font color="black"> To ID</font></td>
            		<td><font color="black"> Send Date Time</font></td>
                </tr>
                       	

                         <% while(rst1.next())
                         {
                        %>	
				<tr>
                    <td class="bodyText"><div align="left"><%=i%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("srno")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("vahno")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("transporter")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("UnitID")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("subject")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("body")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("template")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("fromid")%></div></td>
                    <td class="bodyText"><div align="left"><%=rst1.getString("Toid")%></div></td>
					<td class="bodyText"><div align="left"><%=rst1.getString("UpdatedDateTime")%></div></td>
                </tr>
                       
                        <%
                          i++;
                          }
                        
                         %>
                     
                        </table>
			

                        <br>
                        

						
			

                        <br>

			
		
					
			
<%
}}catch(Exception e)
{
    out.print("Exception -->"+e);

}
finally
{
    conn.close();
    conn1.close();

}
%>
<table width="750px" height="350px">
	<tr>
		<td></td>
	</tr>
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
