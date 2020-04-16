<%@ include file="header.jsp"%>
<%@page import="com.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bulk Sms</title>

</head>
<body>

<table width="100%" align="center">	
	<tr>
	<td>
	
	
	</td>		
	</tr>
	<tr>
		<td align="center"><B><font size="3">Please select the Excel file to import data and then click on Upload</font></B></td>
	</tr>


<tr><td><form name="registrationform" ENCTYPE="multipart/form-data" action="<%=request.getContextPath()%>/InsertingData" method="get">

<div id="imageDiv" align="center">
<input type="file" name="Filename">
               <a href="javascript:document.registrationform.submit();" class="btnLeft" ><span class="btnRight"><font size="3">UPLOAD</font></span></a>


<br><br>	
</div>
</form>
</td>
</tr>


</table>


<div align="center">
<table>

 <form name="registrationform1" ENCTYPE="multipart/form-data" action="<%=request.getContextPath()%>/SendingMessage" method="get">

<input type="submit" name="send" Value="Send Sms!" >

</form> 

</table>
</div>
</body>
</html>