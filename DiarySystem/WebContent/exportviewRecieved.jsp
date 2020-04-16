<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%@ include file="header.jsp"%>
<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
    response.addHeader("Content-Disposition", "attachment;filename=\"viewrecieved.xls\"");
%>
<%!
	Connection con1;
%>
<%
try 
{
	Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();
 	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
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
  	<table class="stats">
  	<tr><td align="center" colspan="8">
	<font size="3"> <b> Unit Received Report of <%=selvalue %></b></font>
	</td></tr> 
	<tr> 
        	<td> </td>
        	<td> <div align="center"> Sr. No. </div> </td>
        	<td> <div align="center"> Unit Id </div> </td>
		<td> <div align="center"> DC NO </div> </td>        
        	<td> <div align="center"> Date </div> </td> 
        	<td> <div align="center"> From </div> </td> 
        	<td> <div align="center"> Type </div> </td> 
        	<td> <div align="center"> Tech Name </div> </td> 
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
		 <input type="checkbox" name="del<%=j %>" value="del<%=j %>"> </input>
	</td>
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
              <td> <div align="center">' <%=date5 %> </div> </td>
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

<table border="0" width="750px" height="450px">
   <tr>
 	<td> </td>	
   </tr>
</table>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</form>
</body>
</html>

