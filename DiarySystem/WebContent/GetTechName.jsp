<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn;
Statement st;
String sql,transporter,location,intval;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	transporter=request.getParameter("tran");
	location=request.getParameter("loc");
	intval=request.getParameter("intval");
	sql="select * from t_techlist where Location='"+location+"'";
	ResultSet rst=st.executeQuery(sql);
	%>
	<select name="tech<%=intval %>" class="formElement"> <option value="Select" > Select </option>
	<%
	while(rst.next())
	{
	%><option value='<%=rst.getString("TechName")%>'><%=rst.getString("TechName")%></option><%
	}
	%>
	</select>	
	<%
	}catch(Exception e)
	{
		out.print("EXCEPTION--->" + e);
	}
	finally
	{
		conn.close();
	}
%>