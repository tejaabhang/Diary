<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.transworld.diary.framework.AssignTransporterToRepresentative"
		import="com.transworld.diary.framework.Representative"
		import="com.transworld.diary.framework.UnitDetailsDao"
%>
				
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application"></jsp:useBean>

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

	<script language="javascript" >
		var showdate="false";
		function validate()
		{
			var rep=document.assigntrans.reps.value;
		
		 	if(rep=="Select")
			{
				alert("Select representative name to allocate");
				return false;	
			}
			if(document.assigntrans.permtemp[0].checked==false && document.assigntrans.permtemp[1].checked==false)
			{
				alert("Select one of the option (Permanent / Temporary Allocation) ");
				return false;
			}	
			if(showdate=="true")
			{
				var date=document.assigntrans.calender.value;
				if(date=="")
				{
					alert("Select Temp allocation date");
					return false;
				}
			}	
		
			return true;
				
		}
		
		function CheckUncheckAll()
		{
			var cntr=parseInt(document.assigntrans.cntr.value);
		
			for (i = 0; i < cntr; i++)
			{ 
				if(document.assigntrans.main.checked==true)
				{
					document.getElementById("dis"+i).checked = true;
				}
				else
				{
					document.getElementById("dis"+i).checked = false;
				}
			} 
		}
		
		function ShowDate(id)
		{
			//alert(id);
			if(id==0)
			{ 
				document.getElementById("tilldate").style.display='none';
				showdate="false";
			}	
			else
			{ 
				document.getElementById("tilldate").style.display="";	
				showdate="true";		
			}
		}
	</script>
</head>

<body>
  <div id="outer" >
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1" >
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1" align ="center">

 <form name="assigntrans" method="post" action="assigntransinsrt.jsp" onsubmit="return validate();"> 
 <div  style="width: 500px;text-align: center;">
 <table align="center">
	<tr align="center">
	<td align="center">
<!--- code start here ------>
<%
final String userName=session.getAttribute("username").toString();
//System.out.println("in connection created");	
	final String userRole=session.getAttribute("userrole").toString();


final String received=request.getParameter("received");
final String nounitselected=request.getParameter("nounitselected");
int number = 0;
String today ="";
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
List<AssignTransporterToRepresentative> assignTransporterToRepresentative=null;
List<Representative> representative=null;
try{
	assignTransporterToRepresentative = unitDetailsDao.getAssignTransporterToRepresentative();       	
   	representative=unitDetailsDao.getRepresentative();
   	number = assignTransporterToRepresentative.size();	 
} catch(Exception e){
	e.printStackTrace();
}
   if(received!=null)
   {
%>
	<table border="0"   width="500px" bgcolor="#77D7D4"  style="text-align: center;" >
          <tr>
              <td> <div align="center"> <font color="black"><B> <U> Successfully Allocated </U> </B></font> </div></td>
          </tr>
    </table>
<% 
   }
   if(nounitselected!=null)
   { 
%>
   <table border="0" width="500px" bgcolor="#77D7D4" style="text-align: center;">
          <tr>
              <td> <div align="center"> <font color="black"><B> No check-box was selected. Please select to allocate.</B></font> </div></td>
          </tr>
        </table>
<% 
	}  
%>
	
	<table border="0" width="500px" bgcolor="#77D7D4" style="text-align: center;" >
		<tr>
			<td align="center"> <font color="black" size="3"> Customer Allocated to Representative</font> </td>
		</tr>
	</table>
	
	<br></br>
	<table class="sortable" style="width: 500px;text-align: center;">
		<tr>
			<td> <div align="center"> <input type="checkbox" name="main" value="main" onClick="CheckUncheckAll();" /></div> </td>
			<td> <div align="center"> <b> Sr. No </b> </div> </td>
			<td> <div align="center"> <b> Customer </b></div> </td>
			<td> <div align="center"> <b> Representative </b></div> </td>
		</tr>
<%
int i=0,j=1;
		try{
			for (int counter = 0; counter < number; counter++) 
			{
				final AssignTransporterToRepresentative record = assignTransporterToRepresentative.get(counter);
%>

			<tr>
				<td align="right"> <div align="right"> <input type="checkbox" id="dis<%=i%>" name="dis<%=i%>" value="dis<%=i%>"></div> </td>
				<td align="right"> <div align="right"> <%=j %> </div> </td>
				<td align="left"> <div align="left"> <%=record.getTransporter()%> </div> </td>
				<td align="left"> <div align="left"> <%=record.getRepresentative()%> </div> 
				<input type="hidden" name="cust<%=i %>" value="<%=record.getTransporter()%>" /></td>
				
				
			</tr>
<%
			i++;j++; }
		}catch(Exception e)
		{
			out.println("<tr><td colspan=3>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
		}
%>
	<input type="hidden" name="cntr" value="<%=i%>" />
	</table>
	
	<Br>
	<table border="0" width="750px" bgcolor="#77D7D4" >
	   <tr>
		<td align="center">
			<table border="1" width="350px" class="sortable" bgcolor="white">
			   <tr>
					<td align="center" colspan="2"> 
						<input type="radio" name="permtemp" value="Perm" checked onClick="ShowDate(0);"/>permanent &nbsp;&nbsp;&nbsp;
				    	<input type="radio" name="permtemp" value="Temp" onClick="ShowDate(1);"/>Temporary 
				    </td>
			  </tr>
			  <tr>
					<td align="center"> Representative </td>
					<td> <select name="reps" class="formElement"> 
				   		<option value="Select">Select</option>
<%
			for (final Representative name : representative) 
			{
%>	
					<option value="<%=name.getName()%>"> <%=name.getName()%> </option>
<%		
			}
%>
	    			     </select>	
		   		    </td>
			  </tr>	
			  <tr id="tilldate" style="display:none">
					<td align="center"> Till Date</td>
					<td> 
						<input type="text" id="calender" name="calender" size="13" value="<%=today %>" class="formElement" readonly/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             			
             			<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "calender",         // ID of the input field
				                 ifFormat    : "%Y-%m-%d",     // the date format
				                 button      : "calender"       // ID of the button
				             }
				                           );
            			</script>
            		</td>
			  </tr>	
			  <tr>
					<td align="center" colspan="2"> <input type="submit" name="Submit" value="Allocate" class="formElement" /> </td>
			  </tr>	
  			</table>	
		</td>
	   </tr>
	</table>
</td>
	</tr>
	</table>
<!-- code end here --->
</div>
</form>
 
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