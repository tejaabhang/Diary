<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<% response.setContentType("application/vnd.ms-excel");

String filename="ALL_CONTACT.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>

<%@ include file="header.jsp" %>
<%! 


Connection conn,conn1;
Statement st, st1, st2, st3,st4,st5,st6, st9, st11, st01, st12;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,sql7,sql8;
String transporter,today,Svehlist,username,simno,mobno,vehiclecode;
String instdate,warranty, expdate;
%>
<%
username=session.getAttribute("username").toString();
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	st=conn.createStatement();
	
	
} catch(Exception e) {out.println(e);}

%>
<table border="1" width="750px" class="sortable">
<tr>
<td>Sr.</td>
<td>Transporter</td>
<td>Contact Name</td>
<td>Phone</td>
<td>Mobile</td>
<td>Email</td>
<td>Location</td>
<td>Comment</td>
</tr>
<%
sql1="select * from t_recieverinfo where ActiveStatus='Yes' order by Transporter Asc";
ResultSet rst2=st.executeQuery(sql1);
int a=1;

while(rst2.next())
{
String rname=rst2.getString("RecieverName");
%>
<tr>
<td><%=a%></td>
<td><%=rst2.getString("Transporter") %></td>
<td>
<a href="#" onclick="window.open ('last10callinfo.jsp?reciever=<%=rst2.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst2.getString("RecieverName")%></a>
</td>
<td><%=rst2.getString("Phone")%></td>
<td><%=rst2.getString("Mobile")%></td>
<td><a href="mailto:<%=rst2.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst2.getString("Email")%></a></td>
<td><%=rst2.getString("PlaceName")%></td>
<td><a href="javascript: flase" onclick="window.open ('addcall.jsp?reciever=<%=rname%>&trans=<%=transporter%>', 'win1', 'width=400, height=250, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">Click</a></td>
</tr>
<%
a++;
}
%>
</table>

<table border="0" width="750px" height="300px">
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
   Copyright 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
