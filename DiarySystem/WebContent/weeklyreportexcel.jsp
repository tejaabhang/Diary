<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="weeklyreport.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st6;
String radio,today,unitno,unitno1,today1,date;
%>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
today=formatter1.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds - 1000 * 60 * 60 *24;

defoultdate.setTime(miliseconds);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	st4=conn.createStatement();
	st5=conn1.createStatement();
	st6=conn.createStatement();
	
	radio=request.getParameter("r1");
				

if(radio.equals("Technician"))
		{
		
		%>
		
		<table border="0" width="750px">
		<tr>	
			<td align="center"> <font color="maroon" size="3"> 7 Day Report.  </font> </td>
		</tr>
	</table>
		
		<table border="2" width="">
			<tr>
				<td><font color="Red">Date --></font></td></td>
				<td bgcolor="Black"></td>
				<%
				for(int i=1;i <= 7 ;i++)
				{
				miliseconds=miliseconds + 1000 * 60 * 60 *24;
				defoultdate.setTime(miliseconds);
				String today1=formatter1.format(defoultdate);
				%>
				<td align="center" colspan="6"><font color="Red"><%=today1 %></font></td>
				<td bgcolor="Black"></td>
				<%
				}
				%>
				</tr>
			<tr>
				<td><font color="Red">Technician</font></td>
				<td bgcolor="Black"></td>
				<%
				for(int l=0;l<7;l++)
				{
				%>
				<td><font color="Red">Vehicle Available</font></td>
				<td><font color="Red">OK Unit</font></td>
				<td><font color="Red">Faulty Unit</font></td>
				<td><font color="Red">In-Transit</font></td>
				<td><font color="Red">Faulty Transit</font></td>
				<td><font color="Red">Unit Required</font></td>
				<td bgcolor="Black"></td>
				<%
				}
				%>
			</tr>
			<%
		String sql="select distinct(TechName)as TechName from t_techlist where Available='Yes'";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{
		%>
		<tr>	
		<td><%=rs.getString("TechName") %></td>
		<td bgcolor="Black"></td>
		<%
		int countavail=0, countunit=0, countreq=0, totcount=0;;
		java.util.Date todaysdate=new java.util.Date();
		Format formatter2=new SimpleDateFormat("yyyy-mm-dd");
		String todayis=formatter2.format(todaysdate);
		long todaysmiliseconds=todaysdate.getTime();
		todaysmiliseconds =	todaysmiliseconds - 1000 * 60 * 60*24;
		for(int m=0;m<7;m++)
		{
			todaysmiliseconds = todaysmiliseconds + 1000 * 60 * 60 *24;
			todaysdate.setTime(todaysmiliseconds);
			String today2=formatter.format(todaysdate);
		%>
		<td align="center">
		<%
		String sql1="select  count(Distinct VehRegNo) as count from t_callocation1 where VehAvaildate ='"+today2+"' and Technicion='"+rs.getString("TechName")+"' and Status='UnSolved'";
		ResultSet rs1=st1.executeQuery(sql1);
		while(rs1.next())
		{
			countavail = rs1.getInt("count");
			%>
				<%=rs1.getString("count")%>
			<%
			
		}
		%>
		</td>
		<td align="center">
		<%
		String nextstr="";
		int k=0;
		String sql2="select OkayUnitsToday from t_techattendance where TechName = '"+rs.getString("TechName")+"' and AttendDateTime like '"+today2+"%'";
		ResultSet rs2=st2.executeQuery(sql2);
		if(rs2.next())
		{
			unitno=rs2.getString("OkayUnitsToday");
			if(unitno.equals("0") || unitno.equals("00") || unitno.equals(" 0"))
			{
				%>
					<%=k %>
				<%
			}
			else
			{
			StringTokenizer strtok= new StringTokenizer(unitno,",");
			while(strtok.hasMoreTokens())
			{
				nextstr=strtok.nextToken();
				k++;
			}
			%>
				<%=k %>
			<%
			}
			countunit=k;
		}
		else
		{
			%>
				<%=k %>
			<%
			countunit=k;
		}
		%>
		</td>
		<td align="center">
		<%
		String nextstr1="";
		int j=0;
		String sql3="select * from t_techattendance where TechName = '"+rs.getString("TechName")+"' and AttendDateTime like '"+today2+"%'";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			unitno1=rs3.getString("FaultyUnitsToday");
			if(unitno1.equals("0") || unitno1.equals("00") || unitno1.equals(" 0"))
			{
				%>
					<%=j %>
				<%
			}
			else
			{
			StringTokenizer strtok1= new StringTokenizer(unitno1,",");
			while(strtok1.hasMoreTokens())
			{
				nextstr1=strtok1.nextToken();
				j++;
			}
			%>
				<%=j %>
			<%
			}
		}
		else
		{
			%>
			 	<%=j %>
			<%
		}
		%>
		</td>
		<%
		int cnt=0;
		String sql4="select * from t_unitorder where Tech like '"+rs.getString("TechName")+"' and ReqDate ='"+today2+"' and Status <> 'Open' order by ReqDate desc ";
		ResultSet rs4=st4.executeQuery(sql4);
		while(rs4.next())
		{
			String orderno=rs4.getString("Reqno");
			String sql5="select * from t_unitmasterhistory where OrderNo='"+orderno+"' and RecByTech='No' ";
			ResultSet rs5=st5.executeQuery(sql5);
			while(rs5.next())
			{
				cnt++;
			}
			totcount=totcount+cnt;
		}
		%>
		<td align="center"><%=totcount %></td>
		<td align="center">
		<%
		String sql6="select count(*) as count  from t_unitreceived where InTransit='Yes' and TechName='"+rs.getString("TechName")+"' and RDate = '"+today2+"'";
		ResultSet rs6=st6.executeQuery(sql6);
		while(rs6.next())
		{
			%>
			<%=rs6.getString("count")%>
			<%
		}
		%>
		</td>
		<%
		countreq = countavail - countunit;
		if(countreq== 0)
		{
			%>
				<td align="center">
				<%=countreq %>
				</td>
			<%
		}
		else
		{
			%>
				<td align="center">
				<b><blink>
				<%=countreq %>
				</blink>
				</b>
				</td>
			<%
		}
		%>
				<td bgcolor="Black"></td>
		<%
		}
		}
		%>
		</tr>
		</table>
		<%
		}
		else
			if(radio.equals("Representative"))
		{
		%>
		<table border="2" width="750px">
				<tr>
					<td><b><font color="Red">Representative</font></b></td>
					<td><b><font color="Red">Total Calls</font></b></td>
					<td><b><font color="Red">Total Customers</font></b></td>
					<td><b><font color="Red">Comp. Allocated</font></b></td>
					<td><b><font color="Red">Com Re-Allocated</font></b></td>
					<td><b><font color="Red">Vehicle Available</font></b></td>
					<td><b><font color="Red">Pending Complaints</font></b></td>
				</tr>
		</table>
		<%
		}
	

}catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
conn.close();
conn1.close();
}
%>
		
<!-- code end here --->
 	     </div>
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