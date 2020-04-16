<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<% response.setContentType("application/vnd.ms-excel");

String filename="SimTrack.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="header.jsp" %>
<%! 


%>

<%	
Connection con1=null;
Statement stmt1=null,st=null,st3=null,stmt2=null, stmt4=null;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null;
String sql1="",sql=null,sql2=null,sql3=null, sql4=null;
try
{
	
	String srchtext="";
	String color="black",status="-";
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	

	String rad=request.getParameter("rad");
	String getunit="";
	getunit=request.getParameter("srchbx");
	if(rad==null)
	{
		
		rad="mobile";
		
	}
	

if(rad==null)
{
}
else
{
	

	java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatter1.format(d);


%>
	
	
<%
 	 String nextstr="";
	 int i=1;

StringTokenizer strtok = new StringTokenizer(getunit,","); 
%>

<table border="1" width="100%" class="sortable">
<tr>
				<td>Sr.</td>
				<td>Sim No.</td>
				<td>Mobile No.</td>
				<td>Sim Status</td>
				<td>DeactiveDate</td>
				<td>ActivationDate</td>
				<td>AirtelMobno</td>
				<td>AirtelIMSINO</td>
				<td>Unitid</td>
				<td>DateOfPurchase</td>
				<td>Service_provider</td>
				<td>LastFTPDump</td>
				<!-- td>Status</td -->
				</tr>	
<%
 while (strtok.hasMoreTokens())
 {
	 
	 
      	
	
	 if(rad.equals("mobile"))	
	   	{	
			nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_simmaster where Mobno like "+nextstr+"  order by DateOfPurchase desc";
	   	}
		 else
			// if(rad.equals("Unit"))
	   	{
				 nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_simmaster where Simno like "+nextstr+"  order by DateOfPurchase desc";
		
		}  	
		 rs1=stmt1.executeQuery(sql1);
		  while(rs1.next())
		  { 
			//String groupname="", vehid="", firstinstdate="", unitwarranty="";
			String simno=rs1.getString("Simno");
			String mobno=rs1.getString("Mobno");
			String DateOfPurchase=rs1.getString("DateOfPurchase");
			String DeactiveDate=rs1.getString("DeactiveDate");
			String Unitid=rs1.getString("Unitid");
			String AccountNo=rs1.getString("AccountNo");
			String PurchaseNo=rs1.getString("PurchaseNo");
			String ActivationDate=rs1.getString("ActivationDate");
			String Service_provider=rs1.getString("Service_provider");
			String Status=rs1.getString("Status");
			String atlmob=rs1.getString("AirtelMobno");
			String atlimsi=rs1.getString("AirtelIMSINO");
			String lstftpdmp=rs1.getString("LastFTPDump");
			if(Status.equalsIgnoreCase("Deactivated") || Status.equalsIgnoreCase("Suspended"))
		{
			color="red";
			status="Deactivated";
			//tdcolor="red";
		}
		else
		{
			color="black";
			status="Active";
			//tdcolor="";
		}
			
	%>
			<tr>
				<td><div align="center"><font color="<%=color%>"> <%=i %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=simno %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=mobno %> </font></div></td>
				 <td><div align="center"><font color="<%=color%>"> <%=Status %></font> </div></td>
				<td><div align="center"><font color="<%=color%>"> <%=DeactiveDate %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=ActivationDate %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=atlmob %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=atlimsi %> </font></div></td>
				<td><div align="center"><font color="<%=color%>"> <%=Unitid %></font> </div></td>
			   <td><div align="center"><font color="<%=color%>"> <%=DateOfPurchase %> </font></div></td>
			   <td><div align="center"><font color="<%=color%>"> <%=Service_provider %> </font></div></td>
			   <td><div align="center"><font color="<%=color%>"> <%=lstftpdmp %></font> </div></td>
			   <!--td><div align="center"><font color="< % =color%>"> < % =Status %></font> </div></td -->
	 	</tr>
	<%
			i++;
		} //close of while
	} //close of string tokenizer
	       
	%>		
				
			</table>
	<%
	} //colse of else


	}catch(Exception e)
	{
		out.print("Exception -->"+e);

	}
	finally
	{
		con1.close();
	}
	%>
	<table width="750px" height="350px" border="0">
			<tr><td></td></tr>
			</table>

	<!-- code end here --->

	 		</div>
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

