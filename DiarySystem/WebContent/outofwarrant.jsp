<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="outofwarrantyvehs.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%!
Connection con1, con2;
String unitwarranty="";
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement(), stmt4 = con2.createStatement();;
Statement stmtt = con2.createStatement(), stmtt1 = con2.createStatement(), stmtt2 = con2.createStatement();
String sql1="", sql2="", sql3="";
ResultSet rs1=null, rs2=null, rs3=null;
ResultSet  rss=null, rss1=null, rss2=null, rss3=null;

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
	java.util.Date instdate1;

%>
<table border="1" width="100">
	<tr>
		<td colspan="5" align="center"> <B> Out of Warranty Vehicles</B> </td>
	</tr>
	<tr>
		<td> <B> Sr No </B> </td>
		<td> <B> Transporter </B> </td>
		<td> <B> Vehicle No </B> </td>
		<td> <B> Unit Id </B> </td>
		<td> <B> Warranty Expired on </B> </td>
	</tr>
<%
	int i=1;
	sql1="select * from t_vehicledetails where MobilePhNo <> '0' order by OwnerName asc ";
	rs1=stmt2.executeQuery(sql1);
	while(rs1.next())
	{
		java.util.Date instdate=rs1.getDate("InstalledDate");
		

		String sqll="select * from t_amchistory where VehCode = '"+rs1.getString("VehicleCode")+"' order by NewDate desc limit 1";
		rss = stmtt.executeQuery(sqll);
		if(rss.next())
		{

			if(!(null==rss.getDate("WarrantyTill")))
			{
			try{	
			String sqll1="select TO_DAYS('"+rss.getDate("WarrantyTill")+"')-TO_DAYS('"+s+"') as days";
			rss1=stmtt1.executeQuery(sqll1);
			if(rss1.next())
			{
				//out.print(rsamc1.getInt("days"));
				if(rss1.getInt("days") > 0)
				{
					unitwarranty="YES";
				}
				else
				{
					unitwarranty="NO";
					//expdate="NA";
				}
			}
			}
			catch(Exception X)
			{
				unitwarranty="-";

			}
			}
			
			
			else
			{
				
				
				String sqll2="select TO_DAYS('"+s+"')-TO_DAYS('"+instdate+"') as days";
				rss2=stmtt2.executeQuery(sqll2);
				if(rss2.next())
				{
					
					if(rss2.getInt("days") > 365)
							{
						unitwarranty="NO";
							}
					else
					{
						unitwarranty="YES";
					}
				}
			}
		
		}
		else
		{

			
				 instdate1=rs1.getDate("InstalledDate");
				
		String sqll3="select TO_DAYS('"+s+"')-TO_DAYS('"+instdate1+"') as days";
		rss3=stmt3.executeQuery(sqll3);
		if(rss3.next())
		{
			if(rss3.getInt("days") > 365)
					{
				unitwarranty="NO";
					}
			else
			{
				unitwarranty="YES";
			}
		}
		
		
		
	
		}
		
		if(unitwarranty.equals("NO"))
		{
			%>
			<tr>
				<td> <%=i %> </td>
				<td> <%=rs1.getString("OwnerName")%> </td>
				<td> <%=rs1.getString("VehicleRegNumber")%> </td>
				<td> <%=rs1.getString("UnitId")%> </td>
				
				
				<%
				try{
					sql3="select DATE_ADD('"+instdate+"',INTERVAL 1 YEAR)";
					rs3=stmt4.executeQuery(sql3);
						if(rs3.next())
							{
							instdate=rs3.getDate(1);
							}
			   		} catch(Exception e)
			  			{
				
			 			 }	
				
				%>
				
				
				
			
				<td> <%=instdate%> </td>
			</tr>
<%
			i++;
		}
		
		
	}
%>
</table>

<% 
 con1.close();
 con2.close();
  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
     
<br>
<br>
<table border="0" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>