<%@ include file="Connections/conn1.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<%!
	Connection con1;
%>
<%
try 
{
	Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();
 con1 =DriverManager.getConnection("jdbc:mysql://192.168.2.55/db_CustomerComplaints","diary","d@1ry");
	Statement stmt1=con1.createStatement();
 	String sql1=session.getAttribute("sql1").toString();
	//sql1="'"+'"+sql1+";
	//out.print(sql1);
	String selvalue=request.getParameter("selvalue"); 
	//out.print("hi"+selvalue);
        ResultSet rs1=null;
        int j=1;
	//sql1="select * from t_unitreceived where Status='True' order by Rdate desc";
  	rs1=stmt1.executeQuery(sql1);
%>
	<br>
	<table width="75%" align="center" border="2">
	<tr><td>
  	<table class="stats" align="center" width="100%">
  	<tr><td align="center" colspan="8">
	<font size="3" color="maroon"> <b> Unit Received Report of <%=selvalue %></b></font>
	</td></tr> 
	<tr> 
        	
        	<td> <div align="center"><b> Sr. No. </div> </td>
        	<td> <div align="center"><b> Unit Id </div> </td>
		<td> <div align="center"><b> DC NO </div> </td>        
        	<td> <div align="center"><b> Date </div> </td> 
        	<td> <div align="center"><b> From </div> </td> 
        	<td> <div align="center"><b> Type </div> </td> 
        	<td> <div align="center"><b> Tech Name </div> </td> 
	</tr>
        <tr>
<%
	while(rs1.next())
        { 
		String unitid=rs1.getString("UnitID");
		String rdte=rs1.getString("Rdate");
		String date5=new SimpleDateFormat("dd-MMM-yyyy").format
						(new SimpleDateFormat("yyyy-MM-dd").parse(rdte));

              	String tech=rs1.getString("TechName");
             	String ent=rs1.getString("EntBy");
              	String dcno=rs1.getString("DC_NO");
              	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rdte);
              	Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
              	String nwfrmtdte=formatter.format(datefrmdb);   
%>
		<input type="hidden" name="unitid<%=j %>" value="<%=unitid %>" > </input>
		<input type="hidden" name="dte<%=j %>" value="<%=rdte %>" > </input>
       
        <td>
		<div align="center"> <%=j %> 
		</div>
	</td>
	<td><div align="center">
		 <%=rs1.getString("UnitID") %> 
	</div> </td>
<%
	        if(dcno==null || dcno.equals("")) 
		{
%>
			<td> <div align="center"> - </div> </td>
<%
		} 
		else
		{
%>
              <td> <div align="center"><%=rs1.getString("DC_NO") %> </div> </td>
<%
		}
%>
              <td> <div align="center"><%=date5 %> </div> </td>
              <td> <div align="center"><%=rs1.getString("Name") %> </div> </td>
              <td> <div align="center"><%=rs1.getString("Utype") %> </div> </td>
<%
		if(tech==null || tech.equals("-"))
   		{
%>
			<td><div align="center"> Not Avail </div> </td>
<%
		}  
		else
		{
%>
	     		<td><div align="center"> <%=tech %> </div> </td>
<% 
		}
%>
		</tr>
<%
		j++;
	}
%>
	    
	</table>
	<input type="hidden" name="cntr" value="<%=j%>" />
<%
}
catch(Exception e)
{
	//////out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->
</td></tr>
<tr><td colspan="8" align="center">
<div id="copyright"><font color="maroon" size="1">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</font>
  </div>
</td></tr>
<tr><td colspn="8" align="center">
<input type="button" class="formElement" name="print" value="Print" onclick="javascript:window.print();" title="Print">
</td></tr>
</table>
</form>

</body>
</html>

