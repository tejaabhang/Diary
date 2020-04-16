<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1,con;
%>

<%
try {
    
          
    Class.forName(MM_dbConn_DRIVER);
 	con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement st1=con.createStatement(),st2=con1.createStatement(),st3=con1.createStatement(),st4=con.createStatement();
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
    String sql1=""; 
    String unid1=request.getParameter("unid1");
    String id=request.getParameter("id");
  //  //System.out.println(unid1);
    Boolean flag=false;
    String closed="",comments="Yes";
    sql1="Select * FROM t_techspecialrep where UnitId='"+unid1+"' and Closed='No'";
    //System.out.println(sql1);
    rs1=st1.executeQuery(sql1);
    if(rs1.next())
    {
    	closed="No";
    }else{
    	closed="Yes";
    }
    out.println(closed+"#");
    
    //String str="Select * from t_techspecialrep
    
    String vehno="";
    String sql2="Select VehRegNo,VehCode from db_gps.t_unitreplacement where NewUnitID ='"+unid1+" and EntDate>=(Select EntDate  from db_gps.t_unitreplacement where `OldUnitID` ='"+unid1+" order by EntDate desc limit 1) order by EntDate desc limit 1";
    	//"Select * from db_gps.t_unitreplacement where NewUnitID='"+unid1+"' order by EntDate desc limit 1";
    rs2=st2.executeQuery(sql2);
    if(rs2.next())
    {
    	vehno=rs2.getString("VehRegNo");
    	%>
    	<table border="0" width="100%" >
		<tr>
			<td align="center"> <font color="maroon"> <b>Unit ID: <%=unid1 %> was configured in Vehicle : <%=vehno %></b></font> </td>
		</tr> <input type="hidden" name="vehconfg" value="Yes" />
	</table> 
    	
    <%}
   else
   {%>
	   <table border="0" width="100%">
		<tr>
			<td align="center"> <font color="maroon"> <b>Unit ID: <%=unid1 %> came without configuration</b></font> </td>
		</tr> <input type="hidden" name="vehconfg" value="No"/>
	</table> 
   <%}
    
   // vehno="N.A";
    
   // //System.out.println(vehno);

   String DispDate="-",holdby="-";
    String str="select * from t_unitmaster where UnitID='"+unid1+"' and Status in ('Dispatched','InterDisp' ) order by DispDate Desc limit 1";
	ResultSet rst1=st3.executeQuery(str);
	if(rst1.next())
	{
		DispDate=rst1.getString("DispDate");
		holdby=rst1.getString("HoldBy");
	}
	  out.println("#"+holdby+"#");
    String str1="Select * FROM t_techspecialrep where UnitId='"+unid1+"' and EntDateTime >= '"+DispDate+"'";
    ResultSet rst2=st4.executeQuery(str1);
    if(rst2.next())
    {
    	if("0".equalsIgnoreCase(id)){
    		%>
    		
    	<table border="0" width="100%" >
		<tr>
			<td align="center"> <font color="maroon"> <b></b></font> </td>
		</tr> <input type="hidden" name="comments" value="Yes" />
	</table> 
    		<%
    	}else{
    	
    	%>
    	
    	<table border="0" width="100%" >
		<tr>
			<td align="center"> <font color="maroon"> <b></b></font> </td>
		</tr> <input type="hidden" name="comments<%=id%>" value="Yes" />
	</table> 
    	
    	<%}
    }
    else
    {
    	comments="No";
    	if("0".equalsIgnoreCase(id)){
    		%>
    		<table border="0" width="100%" >
		<tr>
			<td align="center"> <font color="maroon"> <b>Special Comment is Not Entered for UnitID: <%=unid1 %></b></font> </td>
		</tr> <input type="hidden" name="comments" value="No" />
	</table> 
    		<%
    	}else{
    	%>
    	<table border="0" width="100%" >
		<tr>
			<td align="center"> <font color="maroon"> <b>Special Comment is Not Entered for UnitID: <%=unid1 %></b></font> </td>
		</tr> <input type="hidden" name="comments<%=id%>" value="No" />
	</table> 
    	
   <%}
    }
  //  //System.out.println(comments+"ffdgd"+holdby);
   
    
    }catch(Exception e)
    {
    }
    %>
