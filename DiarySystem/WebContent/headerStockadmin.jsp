<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="menu.html" %>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19595446-3']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<center>
<table border="0" width="750px"  align="center"  bgcolor="#CECEF6">
<tr>
<td><div align="center"><a href="javascript:history.go(-1);" title="Back"><b>BACK</b></a></div></td>
<td><div align="center"><a href="viewrecieved.jsp"><b>View Received</b></a></div></td>
<td><div align="center"><a href="Received.jsp"><b>Unit Received Form</b></a></div></td>
<td><div align="center"><a href="multiplesearch1.jsp"><b>Multiple Search</b></a></div></td>
<td><div align="center"><a href="closetechspcomment1.jsp"><b>Special Comment</b></a></div></td>
<td><div align="center"><a href="confrmunitrec.jsp"><b>Confirm Receipt of Units</b></a></div></td>
<td><div align="center"><a href="viewdispatch.jsp"><b>View Dispatch</b></a></div></td>
<td><div align="center"><a href="mobiledeactive_multiple.jsp"><b>Mobile De-Activation</b></a></div></td>
<td><div align="center"><a href="changepassword.jsp"><b>Change Password</b></a></div></td>
<td><div align="center"><a href="#"><b>WELCOME</b> </a><font color="red"><b><%=session.getAttribute("username").toString()%></b></font></div></td>
<td><div align="center"><a href="logout.jsp"><b>LOGOUT</b></a></div></td>
<td><div align="center"><b>
<%
	final Format dateFormatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	final String currentDate =dateFormatter.format(new java.util.Date());
	out.print(currentDate);
%>
		</b></div></td>
</tr>
</table>
   
<br>  
<br>
<br>
<br>
<br>
<br>
</center>