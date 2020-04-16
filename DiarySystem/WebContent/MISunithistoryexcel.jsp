<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="Unit_History.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 

Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
%>
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




%>


<table border="0" width="750px" >
<tr>
<td>
<table border="2" width="100%">
<tr><td align="center"><font color="brown" size="3">UNIT HISTORY DETAIL. </font></td></tr>
</table>

</td>
</tr>

      

<%

data1=request.getParameter("data1");


%>



</td></tr>
			<tr>
			<td  align="center" class="sorttable_nosort">
			
			</td>
			</tr>
			</table>


<%
                          sql="select * from t_unitmasterhistory where UnitID='"+data1+"' order by EntDate asc";
                        ResultSet rst1=st.executeQuery(sql);
                        int i=1;
                    

                        
%>

			<table width="100%" border="2" align="center" class="sortable">
			<tr><th  colspan="13" bgcolor="#2696B8"> Unit History</th></tr>
			<tr>
			<td><font color="black"> Sr.</td>
			<td><font color="black"> Date</td>
            <td><font color="black"> Unit ID</td>
			<td><font color="black"> Sim No</td>
			<td><font color="black"> Mobile No</td>
			<td><font color="black"> InstallationType</td>
			<td><font color="black"> WMSN</td>
			<td><font color="black"> SimCompany</td>
			
            <td><font color="black"> Module</td>
            <td><font color="black"> GPS</td>
            <td><font color="black"> Unit Type</td>
            <td><font color="black"> Software Version</td>
            <td><font color="black"> Peripherals</td>
            <td><font color="black"> Status</td>
                    
            <td><font color="black"> FirmwareChanged </td>
            <td><font color="black"> ModulePCBChanged </td>
            <td><font color="black"> PCBmodification </td>
            <td><font color="black"> PowerSupplyChanged </td>
            <td><font color="black"> GPSMouseChanged </td>
            <td><font color="black"> GSMAntennaChanged </td>
            <td><font color="black"> SoftwareSimCorrections </td>
            <td><font color="black"> OtherCorrections </td>
            <td><font color="black"> Ent. By </td>
                       
                        </tr>
                       	

                         <% while(rst1.next())
                         {
                        %>	
			<tr>
                        <td class="bodyText"><div align="left"><font color="black"><%=i%></font></div></td>
						<%
					    try{
                        %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("EntDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                       <td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("UnitID")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("SimNo")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("MobNo")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("InstType")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("WMSN")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("SimCompany")%></div></td>
						
						
                        <td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("Module")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("GPS")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("typeunit")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("SwVer")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("Peripherals")%></div></td>
						<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("Status")%></div></td>
                       
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("FirmwareChanged")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("ModulePCBChanged")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("PCBmodification")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("PowerSupplyChanged")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("GPSMouseChanged")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("GSMAntennaChanged")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("SoftwareSimCorrections")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("OtherCorrections")%></div></td>
                       	<td class="bodyText"><div align="left"><font color="black"><%=rst1.getString("EntBy")%></div></td>
                       
                       </tr>
                        <%
                          i++;
                          }
                        
                         %>
                     
                        </table>
			

                        <br>
                         <%
                          sql1="select * from t_unitreplacement where NewUnitID='"+data1+"'order by EntDate asc";
                        ResultSet rst2=st1.executeQuery(sql1);
                        int j=1;
                    

                       
%>

			<table width="100%" border="1" align="center" class="sortable" >
			<tr><th class="hed" colspan="20" bgcolor="#2696B8">New Unit Installations</th></tr>
			<tr>
			<td class="hed"><font color="black"> Sr.</td>
			<td class="hed"><font color="black"> Date</td>
                        <td class="hed"><font color="black"> Installation Time</td>
                        <td class="hed"><font color="black">Vehical No.</td>
			<td class="hed"><font color="black"> Transporter</td>
			<td class="hed"><font color="black"> Installation type</td>
			<td class="hed"><font color="black"> Old Unit ID</td>
			<td class="hed"><font color="black"> New Unit ID</td>
                       	<td class="hed"><font color="black"> Installation By</td>
                        <td class="hed"><font color="black"> Installation Place</td>
			<td class="hed"><font color="black"> Entry By</td>
			<td class="hed"><font color="black"> Sim No.</td>
                        <td class="hed"><font color="black"> Mobile No.</td>
                        <td class="hed"><font color="black">Type Unit </td>
                        <td class="hed"><font color="black"> Voice Call No.1 </td>
			<td class="hed"><font color="black"> Voice Call No.2</td>
                        <td class="hed"><font color="black"> Old Unit Damaged</td>
			<td class="hed"><font color="black"> New Unit Run On</td>
                        <td class="hed"><font color="black"> Old Unit With</td>
			<td><font color="black"><font color="black">Entry Date</font> </td>
                        </tr>
                       	

                         <% while(rst2.next())
                         {
                            %>	
			<tr>
                        <td class="bodyText"><div align="left"><font color="black"><%=j%></div></td>
			 <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("InstDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("InstTime")%></div></td>
		        <td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("VehRegNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("OwnerName")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("InstType")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("OldUnitID")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("NewUnitID")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("InstBy")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("InstPlace")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("EntBy")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("SimNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("MobNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("TypeUnit")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("VoiceCallNo1")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("VoiceCallNo2")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("OldUnitDamaged")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("NewUnitRunOn")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst2.getString("OldUnitWith")%></div></td>
                        
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("EntDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                               
			</tr>	
			<%
                          j++;
                          }
                        
                         %>
                        </table>
			

                        <br>

			<!-- body part come here -->
                      <%
                          sql2="select * from t_unitreceived where UnitID="+data1+" order by Rdate asc";
                        ResultSet rst3=st2.executeQuery(sql2);
                        int k=1;
                        
                            
                         %>


                        <table width="100%" border="1" align="center" class="sortable">
			<tr><th class="hed" colspan="14" bgcolor="#2696B8">Units Received</th></tr>
			<tr>
			<td class="hed"><font color="black"> Sr.</td>
			<td class="hed"><font color="black"> Date</td>
                        <td class="hed"><font color="black"> Time</td>
                        <td class="hed"><font color="black"> Receive From </td>
			<td class="hed"><font color="black"> Courier</td>
                        <td class="hed"><font color="black"> Courier DC No</td>
			<td class="hed"><font color="black"> Unit Type </td>
			<td class="hed"><font color="black"> Unit ID</td>
                        <td class="hed"><font color="black"> Transporter</td>
                        <td class="hed"><font color="black"> Location</td>
                        <td class="hed"><font color="black"> Faulty</td>
                        <td class="hed"><font color="black"> Technician Name</td>
                        <td class="hed"><font color="black"> Entred By</td>
                        <td class="hed"><font color="black"> DC_NO</td>
                       	</tr>
  
                         <% while(rst3.next())
                         {
                        %>	
			<tr>
                        <td class="bodyText"><div align="left"><font color="black"><%=k%></div></td>
                        
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst3.getDate("Rdate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Rtime")%></div></td>
                  	<td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("ReceiveFrom")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Courier")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("CourierDCNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Utype")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("UnitID")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Transporter")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Location")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("Faulty")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("TechName")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("EntBy")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst3.getString("DC_NO")%></div></td>
                      	</tr>	
			<%
                          k++;
                          }
                         
                         %>	
			</table>
			
                        <br>
			<%
                          sql3="select * from t_unitmasterhistory where UnitId='"+data1+"' order by DispDate asc";
                        ResultSet rst4=st3.executeQuery(sql3);
                        int n=1;
                        
                        %>
 <table width="100%" border="1" align="center" class="sortable">
<tr><th class="hed" colspan="12" bgcolor="#2696B8">Units Dispatched</th></tr>
			<tr>
			<td class="hed"> Sr.</td>
                        <td class="hed"><font color="black"> Dispatch Date</td>
                        <td class="hed"><font color="black"> Unit ID</td>
                        <td class="hed"><font color="black"> Dispatch Address</td>
                        <td class="hed"><font color="black"> Order No</td>
                        <td class="hed"><font color="black"> Mode of Dispatch</td>
                        <td class="hed"><font color="black"> Dispatch Name</td>
                        <td class="hed"><font color="black"> Courier Date</td>
                        <td class="hed"><font color="black"> Chalan No.</td>
                        <td class="hed"><font color="black"> Dispatch Id</td>
                        <td class="hed"><font color="black"> User</td>
                        <td class="hed"><font color="black"> Entry By</td>
                       
                        </tr>
                       	
                         
                          <% while(rst4.next())
                         {
                        %>	
			<tr>
                        <td class="bodyText"><div align="left"><font color="black"><%=n%></div></td>
			
                    
                                               
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("DispDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
                        <td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("UnitID")%></div></td>     
                        <td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("DisAdd")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst4.getInt("OrderNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("ModeofDispatch")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("DisName")%></div></td>
                        
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><font color="black"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("CourierDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
                        
			<td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("ChalanNo")%></div></td>
			<td class="bodyText"><div align="left"><font color="black"><%=rst4.getInt("DispId")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("User")%></div></td>
                        <td class="bodyText"><div align="left"><font color="black"><%=rst4.getString("EntBy")%></div></td>
			    
			</tr>	
			<%
                          n++;
                          }
                               
			%>
                        
			</table>





<%
}catch(Exception e)
{
    out.print("Exception -->"+e);

}
finally
{
    conn.close();
    conn1.close();

}
%>


<div id="copyright">Copyright © 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>