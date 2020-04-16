<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
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
	var date1=document.reprov.calender.value;
	var date2=document.reprov.calender1.value;

	if(date1=="")
	{
		alert("Please select Warranty From Date");
		return false;
	}	

	
	if(date2=="")
	{
		alert("Please select Warranty Till Date");
		return false;
	}		
	return true;
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
<form name="reprov" method="get" action="amcchange1.jsp" onSubmit="return validate();">
<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	
	String sql1="";
	int chkdcntr=0;
	String flag="true", year1date="", year2date="";
	String transporter=request.getParameter("transporter");

	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);
	
	sql1="SELECT DATE_ADD( '"+s+"', INTERVAL 1 YEAR )";
	ResultSet rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		year1date=rs1.getString(1);
	}
	
	sql1="SELECT DATE_ADD( '"+s+"', INTERVAL 2 YEAR )";
	ResultSet rs2=stmt1.executeQuery(sql1);
	if(rs2.next())
	{
		year2date=rs2.getString(1);
	}
	%>
		<table border="0" width="750px" >
			<tr>
				<td align="center"> <B> Change AMC of <%=transporter %>'s Vehicle</B> </td>
			</tr>
		</table>
		
		
	<table border="0" width="750px">
	<tr> <td align="center">  
		
		<table border="1" width="350px" align="center" bgcolor="white">
			<tr>
				<th> Sr No</th>
				<th> Vehicle </th>
				<th> Date Range </th>
			</tr>
<%
	int cntr=Integer.parseInt(request.getParameter("cntr"));
	int l=1, m=0 ;
	
	String[] chkbox=new String[cntr];
	String[] id = new String[cntr];
	String[] vehno = new String[cntr];
	

	for(int i=0;i<cntr;i++)
	{
		 chkbox[i] = request.getParameter("cb"+i );
		 if(chkbox[i]==null)
   		{
       	}
   		else
   		{
			chkdcntr++;
			flag="false";
   		} 	
	}

	if(flag.equals("true"))
	{
   					        
	}
	else
	{
		String[] x = new String[cntr];
		
		for(int k=0;k<cntr;k++)
		{
			int c=0;
			x[k] = request.getParameter("cb"+k );

				
			if(x[k]==null)
       			{
    	
     		    }
       			else
       			{
					id[k] = request.getParameter("id"+k );
					vehno[k] = request.getParameter("vehno"+k );
				%>	
					<tr>
						<td> <%=l %> <input type="hidden" name="vehcode<%=m %>" value="<%=id[k] %>" /> </td>
						<td > <%=vehno[k] %> </td>
					
			
			
		
			<td> 
			
			<table border="0" width="400px" align="center">
				<tr>
				<td>
				
								
			<input type="text" id="calender<%=m %>" name="calender<%=m %>" size="13" class="formElement" value="" />
             <input type="button" name="trigger<%=m %>" id="trigger<%=m %>" value="From Date" class="formElement">
             
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender<%=m %>",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger<%=m %>"       // ID of the button
             }
                           );
             </script></td>
				<td><input type="text" id="calender1<%=m %>" name="calender1<%=m %>" size="13" class="formElement" value="" />
             <input type="button" name="trigger1<%=m %>" id="trigger1<%=m %>" value="To Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1<%=m %>",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1<%=m %>"       // ID of the button
             }
                           );
             </script></td>
			
								

					</tr>
					
				</table>
			</td>
			
		</tr>
		
		
		<%	
					l++;
					m++;
					
					
					
       			}
		}
		

	}	%>
		<tr>
			<td colspan="3" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
		</tr>
</td> </tr> 
</table>	
	</table>
	
	<input type="hidden" name="cntr" value="<%=l %>"></input>
	<input type="hidden" name="transporter" value="<%=transporter %>"></input>
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
</form>
</body>
</html>
