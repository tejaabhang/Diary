<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con2;
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">

function validate()
{
	
}



</script>
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
         <%@ include file="header1.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="reprovmail" method="post" action="" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	Statement stmtinsert=con1.createStatement();
	ResultSet rs1=null;
	String sql1="";
	String ss="";
	String[] mobs=new String[100];
	String[] units=new String[100];	
	
	String mobnos=request.getParameter("mobsend");	
	String ids=request.getParameter("id");
	String unitids=request.getParameter("units");

	     
 %>
<input type="hidden" name="mailsent" value="yes" />


<%
	int i=0, j=0;
	String mailsent=request.getParameter("mailsent");
	if(mailsent==null)
	{ 
		StringTokenizer st1 = new StringTokenizer(mobnos, ",");
	     	while (st1.hasMoreTokens()) 
		{
        		mobs[i]=st1.nextToken();
			i++;
		}
		
		StringTokenizer st2 = new StringTokenizer(unitids, ",");
	     	while (st2.hasMoreTokens()) 
		{
        		units[j]=st2.nextToken();
			j++;
		}
			
%>
		<table border="0" width="750px">
<tr>
	<td> <font color="maroon"> Send these numbers for re-provisioning and click on Sent Mail.</font></td>
</tr>
<tr> <td align="center">
	<table border="10" width="350px">
<%
		for(int k=0; k<i; k++)
		{ %>

			<tr>
				<td align="center"> <%=units[k]%>-- <%=mobs[k]%> <input type="hidden" name="mobsend" value="<%=mobnos%>" />
				<input type="hidden" name="id" value="<%=ids%>" />
				</td> 
			</tr>
<%
		} %>
			<tr>
				<td align="center"> <input type="submit" name="submit" value="Sent Mail" class="formElement" /> </td>
			</tr>	
	</table>
</td> </tr> </table>	
<%	}
	else
	{
		StringTokenizer st = new StringTokenizer(ids, ",");
	     	while (st.hasMoreTokens()) 
		{
        		ss=st.nextToken();
			sql1="update t_reprovisionnos set MailSent='Yes' where SrNo='"+ss+"' ";
			//Query for t_sqlquery
   			String abcd=sql1.replace("'","#");	
   			abcd=abcd.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");

			stmt1.executeUpdate(sql1);

		}
%>			<table border="0" width="750px">
				<tr>
					<td align="center"> <font color="maroon" > <B> Sent for Re-Provisioning. Click <a href="reprovisionrep.jsp"> here </a>  </B> </font> </td>
				</tr>
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
