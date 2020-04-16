<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="menu.html" %>
<%!
String userrole22="";

%>
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
<%
userrole22=session.getAttribute("userrole").toString();
if(userrole22.equalsIgnoreCase("supertech"))
{
	%>
	<table border="0" width="750px"  align="center"  bgcolor="#A9D0F5">
    <tr>
    <td><div align="center"><a href="javascript:history.go(-1);" title="Back"><b>BACK</b></a></div></td>
    <td><div align="center"><a href="chkdatafortech.jsp"><b>HOME</b></a></div></td>
    <td><div align="center"><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu13, '150px')" onMouseout="delayhidemenu()" title="Forms"><b>DATA ENTRY</b></a></div></td>
     <td><div align="center"><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu15, '150px')" onMouseout="delayhidemenu()" title="Forms"><b>My Diary</b></a></div></td>
    
    <td><div align="center"><a href="changepassword.jsp?parameter=tech"><b>CHANGEPASSWORD</b></a></div></td>
    <td><div align="center"><a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu14, '150px')" onMouseout="delayhidemenu()" title="Forms"><b>REPORTS</b></a></div></td>
    <td><div align="center"><a href="#"><b>WELCOME</b> </a><font color="red"><b><%=session.getAttribute("username").toString()%></b></font></div></td>
    <td><div align="center"><a href="logout.jsp"><b>LOGOUT</b></a></div></td>
	<%
}
else
{
	%>
	<table border="0" width="750px"  align="center"  bgcolor="#A9D0F5">
    <tr>
    <td><div align="center"><a href="javascript:history.go(-1);" title="Back"><b>BACK</b></a></div></td>
    <td><div align="center"><a href="chkdatafortech.jsp"><b>HOME</b></a></div></td>
    <td><div align="center"><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu10, '150px')" onMouseout="delayhidemenu()" title="Forms"><b>DATA ENTRY FORMS</b></a></div></td>
    <td><div align="center"><a href="#"><b>WELCOME</b> </a><font color="red"><b><%=session.getAttribute("username").toString()%></b></font></div></td>
    <td><div align="center"><a href="logout.jsp"><b>LOGOUT</b></a></div></td>
    <td><div align="center"><a href="changepassword.jsp?parameter=tech"><b>CHANGEPASSWORD</b></a></div></td>
	<%
}
%>
<td><div align="center"><b>
<%
	final Format dateFormatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	final String currentDate =dateFormatter.format(new java.util.Date());
	out.print(currentDate);
%>
		</b></div></td>
</tr>
</table>
    <table border="0" width="750px"  align="center"  bgcolor="#A9D0F5">
       <tr> 
          <td>
            <div align="center"> <font color="maroon"> Enter Unit Id to search for its last data</font>
            	<form name="srch" method="get" action="chkdatafortech.jsp">
                	<input type="radio" name="VehUnit" value="Vehicle" checked><B>Vehicle</B>
					<input type="radio" name="VehUnit" value="Unit"><B>Unit Id</B>
 					<input type="text" name="srchbx" class="formElement" />
                	<input type="submit" name="submit" value="Look Up!" class="formElement" />
				</form>      
            </div>
          </td>
       </tr>
     </table>
<br>
<br>
<br>
<br>
<br>
<br>
</center>