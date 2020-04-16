<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>

<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<%@ include file="header.jsp" %>
<% response.setContentType("application/vnd.ms-excel");
    response.addHeader("Content-Disposition", "attachment;filename=\"viewrecieved.xls\"");
%>

<%!
Connection con1;
%>

<%
try 
{
    Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      //con1 = DriverManager.getConnection("jdbc:mysql://192.168.2.55/db_CustomerComplaints","diary","d@1ry");
	Statement stmt2=con1.createStatement();
	String sql1=session.getAttribute("sql1").toString();
	String selvalue=request.getParameter("selvalue"); 
        ResultSet  rs1=null;
        int j=1;
%>
<table border="1">
<tr>
<td>
  <table border="1" width="100%"> 
     <tr>
         <td colspan="9" align="Center"><font color="maroon" size="3"> <B> Units  Dispatched Details of <%=selvalue %> </B></font></td>
	
</tr>
    

     
  </table>
<br>

  <table class="stats" border="1">
     <tr bgcolor="lightgrey" > 
         <!--td> </td-->
          <th> <div align="center"> Sr. No. </div> </th>
          <th> <div align="center"> Dispatch Date </div> </th> 
          <th> <div align="center"> Unit Id </div> </th>
          <th> <div align="center"> Unit Type </div> </th> 
          <th> <div align="center"> Chalan No. </div> </th>
          <th> <div align="center"> Dispatch TO </div> </th> 
	  <th> <div align="center"> Dispatch Details </div> </th>        
          <th> <div align="center"> Technician </div> </th> 
	  <th> <div align="center"> Courier Details </div> </th> 
     </tr>
     
<%
    // sql2="select * from t_unitdispatch where Status='True' order by Ddate desc";
     rs1=stmt2.executeQuery(sql1);
     String date5;
     while(rs1.next())
     { 
              String unitid=rs1.getString("m.UnitID");
              String rdte=rs1.getString("m.DispDate");
             try{date5=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rdte));}catch (Exception ex) {date5="-";}
              String tech=rs1.getString("o.Tech");
             // String =rs1.getString("EntBy");
              String dname=rs1.getString("m.DisName");
              String cust1=rs1.getString("o.Cust");
              String instype=rs1.getString("m.InstType");
              String mode=rs1.getString("m.ModeofDispatch");
              String chal=rs1.getString("m.ChalanNo");
             // java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rdte);
             // Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             // String nwfrmtdte=formatter.format(datefrmdb); 
%>
        <tr >
              <td> <%=j%> </td>
              <td>'<%=date5 %> </td>
              <td>  <%=unitid%>  </td>
              <td><%=instype %>  </td>
              <td><%=chal %>  </td>
	      <td><%=cust1 %> </td>
              <td><%=dname %></td>
              <td> <%=tech %>  </td>
	      <td> <%=mode %> </td>
	</tr>
 <%  j++; } 
%>
  
  </table>
  <tr><td>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</td></tr>
</td>
</tr>
</table>

<%
}catch(Exception e)
{
out.print("Exception"+e);
}
finally
{
con1.close();

}
%>
