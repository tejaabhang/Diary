<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="DelOrRemVehs.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
String fromdate,todate,thename,today;
%>

<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(),stmt5=con2.createStatement();
	Statement stmtrec=con1.createStatement(),stmt4=con2.createStatement(),stmt6=con1.createStatement();
	
	ResultSet rs1=null, rs2=null, rs3=null,rs4=null,rs5=null,rs6=null;
	ResultSet rstrec=null;
	
	String sql1="", sql2="", sql3="",sql4="",sql5="",sql6="";
	String sqlrec="";
	
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	today = formatter.format(defoultdate);
	
	String transp=request.getParameter("transp"); 
	String msg="", radsel="", date1="", date2="", insttype="Del";
	
	fromdate=request.getParameter("calender");
	todate=request.getParameter("calender1");
	thename=request.getParameter("delrem");
	if(null==fromdate)
	{
	fromdate=today;
	todate=today;
	thename="TempRemove";
	}
	
	if(!(null==thename))
	{
	if(thename.equals("TempRemove"))
	{
		%>
		<table border="1" width="750px">
		<tr><td align="center"><font color="brown" size="2">Temparary Removed Units from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></td></tr>
		</table>
		<table border="1" width="100%" class="sortable">
		<tr>
				<td> Sr No</td>
				<td> Transp</td>
				<td> Vehicle No </td>
				<td> Unit Id </td>
				<td> Temp Rem Date</td>
				<td> Removal Commment</td>
				<td> Unit With </td>
				<td> Received Status </td>
				<td> Removed By</td>
				<td> QT Status </td>
				<td> QT Date </td>
				<td> QT Comment </td>
				<td> QT Done By</td>
		</tr>
		<%	
		int i=1;
		String status;
		String qtd="-",qtcmnt="-",qtby="-",qtstatus=null,dispdate="";
		if(transp==null || transp.equals("All"))
		{	
			sql2="select * from t_unitreplacement where InstType='Rem' and EntDate between '"+fromdate+"' and '"+todate+"' order by Ownername asc";
		}
		else
		{
			sql2="select * from t_unitreplacement where InstType='Rem' and Ownername like '"+transp+"%' and EntDate between '"+fromdate+"' and '"+todate+"' order by OwnerName asc ";
		} 
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next())
		{ 
			String owner=rs2.getString("OwnerName");
			owner=owner.substring(0,owner.length()-3);
		%>
			<tr>
				<td> <%=i %></td>
				<td> <%=owner %></td>
				<td> <%=rs2.getString("VehRegNo") %></td>
				<td> <%=rs2.getString("OldUnitId") %></td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate"))) %></td>
				<td> <%=rs2.getString("Comment") %></td>
				<td><%=rs2.getString("OldUnitWith") %></td>
				<%
				sql4="select * from t_unitreceived where UnitId = '"+rs2.getString("OldUnitId")+"' and Rdate >= '"+rs2.getString("EntDate")+"' ";
				rs4 = stmt4.executeQuery(sql4);
				if(rs4.next())
				{
					status = "YES";
				}
				else
				{
					status = "NO";
				}
				
				
				sql6="select DispDate from t_unitmasterhistory where UnitId = '"+rs2.getString("OldUnitId")+"' and Status = 'Dispatched' and DispDate >= '"+rs2.getString("EntDate")+"'";
				rs6 = stmt6.executeQuery(sql6);
				if(rs6.next())
				{
					dispdate=rs6.getString("DispDate"); 
					status="YES";
				}
				
				sql5="select * from hwunittest where UnitID = '"+rs2.getString("OldUnitId")+"' and (TheDate between '"+rs2.getString("EntDate")+"' and '"+dispdate+"' or TheDate > '"+rs2.getString("EntDate")+"')";
				rs5 = stmt5.executeQuery(sql5);
				if(rs5.next())
				{
					qtstatus="YES";
					status="YES";
					qtd=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs5.getString("TheDate")));
					qtcmnt=rs5.getString("SWComment");
					qtby=rs5.getString("User");
					
				}
				else
				{
					qtstatus="NO";
					qtd="-";
					qtcmnt="-";
					qtby="-";
				}
				%>
				<td> <%=status %></td>
				<td> <%=rs2.getString("EntBy") %></td>
				<td> <%=qtstatus %></td>
				<td> <%=qtd %></td>
				<td> <%=qtcmnt %></td>
				<td> <%=qtby %></td>
				
				
				
				
			</tr>	
		<%
			i++;	
		}	
	}
	else
	{
		%>
		<table border="1" width="750px">
		<tr><td align="center"><font color="brown" size="2">Permanent Removed Units from Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromdate))%> to Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todate))%></font></td></tr>
		</table>
		<table border="1" width="100%" class="sortable">
		<tr>
				<td> Sr No</td>
				<td> Transp</td>
				<td> Vehicle No </td>
				<td> Unit Id </td>
				<td> Permanent Rem Date</td>
				<td> Temp Removal Date</td>
				<td> Removal Commment</td>
				<td> Unit With </td>
				<td> Received Status </td>
				<td> Removed By</td>
				<td> QT Status </td>
				<td> QT Date </td>
				<td> QT Comment </td>
				<td> QT Done By</td>
		</tr>
		<%	
		int i=1;
		String status1;
		String trd=null,unid=null,unid1=null,unitid=null;
		String qtd1="-",qtcmnt1="-",qtby1="-",qtstatus1=null,dispdate1="";
		if(transp==null || transp.equals("All"))
		{	
			sql2="select * from t_unitreplacement where InstType='Del' and EntDate between '"+fromdate+"' and '"+todate+"' order by Ownername asc";
		}
		else
		{
			sql2="select * from t_unitreplacement where InstType='Del' and Ownername like '"+transp+"%' and EntDate between '"+fromdate+"' and '"+todate+"' order by OwnerName asc ";
		} 
		rs2=stmt2.executeQuery(sql2);
		while(rs2.next())
		{ 
			String owner=rs2.getString("OwnerName");
			owner=owner.substring(0,owner.length()-3);
			unid=rs2.getString("OldUnitId");
		%>
			<tr>
				<td> <%=i %></td>
				<td> <%=owner %></td>
				<td> <%=rs2.getString("VehRegNo") %></td>
				<%
				sql3="select * from t_unitreplacement where VehRegNo = '"+rs2.getString("VehRegNo")+"' and EntDate < '"+rs2.getString("EntDate")+"' order by EntDate Desc limit 1";
				rs3 = stmt3.executeQuery(sql3);
				if(rs3.next())
				{
					trd= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs3.getString("EntDate")));
					unid1=rs3.getString("OldUnitId");
				}
				else
				{
					trd ="-";
				}
				if(unid.equals("-") || null==unid)
				{
					unitid = unid1;
				}
				else
				{
					unitid = unid;
				}
				%>
				<td><%=unitid %></td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("EntDate"))) %></td>
				<td><%=trd %></td>
				<td> <%=rs2.getString("Comment") %></td>
				<td><%=rs2.getString("OldUnitWith") %></td>
				<%
				sql4="select * from t_unitreceived where UnitId = '"+unitid+"' and Rdate >= '"+rs2.getString("EntDate")+"' ";
				rs4 = stmt4.executeQuery(sql4);
				if(rs4.next())
				{
					status1 = "YES";
				}
				else
				{
					status1 = "NO";
				}
				
				sql6="select DispDate from t_unitmasterhistory where UnitId = '"+rs2.getString("OldUnitId")+"' and Status = 'Dispatched' and DispDate >= '"+rs2.getString("EntDate")+"'";
				rs6 = stmt6.executeQuery(sql6);
				if(rs6.next())
				{
					dispdate1=rs6.getString("DispDate"); 
					status1="YES";
				}
				
				sql5="select * from hwunittest where UnitID = '"+rs2.getString("OldUnitId")+"' and (TheDate between '"+rs2.getString("EntDate")+"' and '"+dispdate1+"' or TheDate > '"+rs2.getString("EntDate")+"')";
				rs5 = stmt5.executeQuery(sql5);
				if(rs5.next())
				{
					qtstatus1="YES";
					status1="YES";
					qtd1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs5.getString("TheDate")));
					qtcmnt1=rs5.getString("SWComment");
					qtby1=rs5.getString("User");
					
				}
				else
				{
					qtstatus1="NO";
					qtd1="-";
					qtcmnt1="-";
					qtby1="-";
				}
				
				
				
				%>
				<td> <%=status1 %></td>
				<td> <%=rs2.getString("EntBy") %></td>
				<td> <%=qtstatus1 %></td>
				<td> <%=qtd1 %></td>
				<td> <%=qtcmnt1 %></td>
				<td> <%=qtby1 %></td>
			</tr>	
		<%
			i++;	
		}	
	
	}
	}
	%>
	</table>
	<%	
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->

 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</body>
</html>
