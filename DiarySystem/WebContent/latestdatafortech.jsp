<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1,st;
ResultSet rs1=null;
String sql1="",sql;
String getunit="";
String transporter,instdate,instloc,instby;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>

	
</head> 

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
         <p></p>
<%@ include file="headertech.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	st=con1.createStatement();	
%>		
		<table border="1" width="750px" align="center" class="sortable">
		<tr>
		<td><b> Sr. No.</b></td>
		<td><b> Unit Id</b></td>
		<td><b>Vehicle No.</b></td>
		<td><b>Transporter</b></td>
		<td><b>Last Date</b></td>
		<td><b>Last Location</b></td>
		<td><b>First Inst. Date</b></td>
		<td><b>Inst. By</b></td>
		<td><b>Inst. Place</b></td>
		<td><b>Last Inst. Date</b></td>
		
		</tr>
<% 	
   getunit=request.getParameter("srchbx");
   //out.print(getunit);
 
   int i=1;
   sql1="select * from allconnectedunits where UnitId like'%"+getunit+"%' or VehNo like '%"+getunit+"%' ";
   rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
       %>
         <tr>
              <td> <%=i %> </td>
              <td> <%=rs1.getString("UnitId") %> </td>
              <td> <%=rs1.getString("VehNo") %> </td>
              
					<%
						sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and InstType='New' and VehRegNo not in('-','0','0000') ";
						ResultSet rst=st.executeQuery(sql);
						if(rst.next())
						{
							transporter=rst.getString("OwnerName");
							instdate=rst.getString("InstDate");
							instloc=rst.getString("InstPlace");
							instby=rst.getString("InstBy");
						}	
						else
						{
							transporter="-";
							instdate="-";
							instloc="-";
							instby="-";
						}				
					%>  
					<td>  
					<%=transporter%>          
              </td>
              <td sorttable_customkey="dd-MMM-yyyy"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %> <%=rs1.getString("TheTime") %></td>
              
              <td> <%=rs1.getString("Location") %> </td>
              <td> <%=instdate%>   </td>
              <td> <%=instby%>   </td>
              <td> <%=instloc%>   </td>
              <td> <% 
               sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000')  order by InstDate desc";
						ResultSet rst2=st.executeQuery(sql);
						if(rst2.next())
						{
						out.print(rst2.getDate("InstDate"));
						}
						
						%>   </td>
 
         </tr>
<%  i++;
    } %>
      </table>
      <%
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
}
%>
		
<table width="750px" height='350px">
<tr><td></td></tr>
</table>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  

</body>
</html>
<div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

