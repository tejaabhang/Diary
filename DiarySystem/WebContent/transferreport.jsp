<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.UnitTransferReport"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
		
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>

<html>
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
	function fun2()
	{	
		document.form1.submit();
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
<%
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
final String today = formatter.format(new java.util.Date());
final String fromDateRequest=request.getParameter("fromDate");
final String toDateRequest=request.getParameter("toDate");
final String fromDate= (null==fromDateRequest) ? today : fromDateRequest;
final String toDate=(null==toDateRequest) ? today : toDateRequest;
int details= 0;
List<UnitTransferReport> unitTransferReport=null;
try{
	unitTransferReport=unitDetailsDao.getUnitTransferReport(fromDate,toDate);
	details = unitTransferReport.size();
} catch(Exception e){
	e.printStackTrace();
}
%>
			
	<table border="0" width="750px" align="center">
		<tr>
			<td><div align="center"><font color="brown" size="3">Unit Transfer Report</font></div></td>
		</tr>
	</table>
			
	<table border="0" width="750px" align="center">
		<tr>
		  <td>
			<form name="form1" id="form1" action="" method="post">
				<table border="1" width="100%" align="center">
				 <tr>
				   <td>
				   	   <input type="text" id="fromDate" name="fromDate" size="13" class="formElement" value="<%=fromDate%>" readonly/>
                       <input type="button" name="trigger" id="trigger" value="From Date" class="formElement"/>
                       <script type="text/javascript">
			             Calendar.setup(
			             {
			                 inputField  : "fromDate",         // ID of the input field
			                 ifFormat    : "%Y-%m-%d",     // the date format
			                 button      : "trigger"       // ID of the button
			             }
			                           );
			             </script>
			       </td>
				   <td>
				   		<input type="text" id="toDate" name="toDate" size="13" class="formElement" value="<%=toDate%>" readonly/>
           			    <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement"/>
                        <script type="text/javascript">
                        
				             Calendar.setup(
				             {
				                 inputField  : "toDate",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "trigger1"       // ID of the button
				             }
				                           );
				         </script>
				   </td>
				   <td><input type="submit" name="Submit" value="Submit" class="formElement"></td>
				
				   <td colspan="" bgcolor="">  
					   <div align="right">  <a href="transferunitexcel.jsp?d1=<%=fromDate %>&d2=<%=toDate %>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> 
				   </td>	
   			     </tr>
			  </table>	
		   </form>	
	     </td>
	   </tr>
		<tr>
			   	  <td>
			   		<div align="center"><font color="brown" size="2">From Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate))%> To Date <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(toDate))%></font></div>
			   	  </td>
		</tr>	
	   <tr>
		 <td>
    		<table border="1" width="100%" class="sortable">
			   
				<tr>
					<td>Sr No.</td>
					<td>Unit ID</td>
					<td>Transfer Date</td>
					<td>Transfer From</td>
					<td>Transfer To</td>
					<td>Transfer by</td>
				</tr>			
<%
   for (int counter = 0; counter < details; counter++) 
	  {
		final UnitTransferReport currentRecord = unitTransferReport.get(counter);
		int i = counter+1;
%>			
				<tr>
					<td><%=i %></td>
					<td><%=currentRecord.getUnitId()%></td>
					<td><%=currentRecord.getTransferDate() %></td>
					<td><%=currentRecord.getTransferFrom()%></td>
					<td><%=currentRecord.getTransferTo()%></td>
					<td><%=currentRecord.getTransferBy()%></td>
				</tr>
					
<%
		}
%>
			</table>	
		</td>
	</tr>
</table>
							</div>
 						 </div>
 					   <div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>