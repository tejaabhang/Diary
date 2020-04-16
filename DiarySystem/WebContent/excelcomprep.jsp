<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="comprep.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement();
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";

	String trans=request.getParameter("trans");

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
%>	
<table border="0" width="750px">
         	<tr>
             	  	<td> <div align="center"> <font color="maroon" size="2"> <B> Complaint  Report of <%=trans%> </B></font></div> </td>
         	</tr>
      </table> 
<%
	String date1=request.getParameter("calender");

	if(date1==null)
	{
	}
	else
	{ 
		String date2=request.getParameter("calender1");
%>
		<table border="0" width="750px">
			<tr>
				<td align="center"> <B> From <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2))%> </B> 
				</td>
				<td align="right"> <a href="excelcomprep.jsp?trans=<%=trans%>&calender=<%=date1%>&calender1=<%=date2%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a>
				</td> 
			</tr>
		</table>
		<table class="sortable">
			<tr>
				<td> <div align="center"> <B> Sr.<br> No </B> </div> </td>
				<td> <div align="center"> <B> Tick No. </B> </div> </td>
				<td> <div align="center"> <B> Veh. No </B> </div> </td>
				<td> <div align="center"> <B> Lodged Date </B> </div> </td>	
				<td> <div align="center"> <B> Complaint </B> </div> </td>
				<td> <div align="center"> <B> Alloc.<br> To </B> </div> </td>
				<td> <div align="center"> <B> Alloc. Date </B> </div> </td>
				<td> <div align="center"> <B> Status </B> </div> </td>
				<td> <div align="center"> <B> Solved Date </B> </div> </td>
				<td> <div align="center"> <B> Reg. By </B> </div> </td>
			</tr>
<%
	int i=1;
	sql1="select * from t_complaints1 where Customer='"+trans+"' and TdyDate between '"+date1+
"' and '"+date2+"' order by Tno desc ";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String tickno=rs1.getString("Tno");
		String status=rs1.getString("Status");	
		String soldate="";
		
		if(status.equals("Solved"))
		{
			soldate=rs1.getString("PSolDate");
		}
		else
		{
			soldate="NA";
		}
	
		String allocto="", allocdate="";

		sql2="select * from t_callocation1 where Tno='"+tickno+"' ";
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			allocto=rs2.getString("Technicion");
			allocdate=rs2.getString("DofAllocation");

		}
		else	
		{
			allocto="UnAllocated";	
			allocdate="NA";
		}	
 %>
			<tr>
				<td> <%=i%> </td>
				<td> 
					<%=tickno%>
					
				</td>	
				<td> <%=rs1.getString("VehicleNo")%> </td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("TdyDate")))%> </td>		
				<td> <%=rs1.getString("Complaint")%> </td>	
				<td> <%=allocto%> </td>	
				<td>
<%	
			try { %>
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(allocdate))%> 
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
				</td>	  	
				<td> <%=status%> </td>	
				<td> 
<%	
			try { %>	
				 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(soldate))%>
<%			    } catch(Exception e)	
			    { %>
				 NA
<%			    } %>
 				</td>	
				<td> <%=rs1.getString("RegBy")%> </td>	
			</tr>
<%
		i++;
	}
%>
		</table>

<%	}
%>


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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>

