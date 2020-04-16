<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seven Day Diary System</title>
</head>
<body>

<%
String s1=request.getParameter("imageName");
/*
System.out.println(s1);
System.out.println(s1+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+s1.replace("%"," ")); 
s1=s1.replace("%"," ");
*/
System.out.println(s1);

%>
<%-- <img src="http://myfleetview.com:8080/images1/ProcessedCameraImages/<%=s1%>"></img> --%>
<img src="http://twtech.in/DiarySystem/IncidentImage/<%=s1%>"></img> 


</body>
</html>