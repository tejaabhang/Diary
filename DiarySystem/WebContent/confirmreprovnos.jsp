<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.transworld.diary.framework.ConfirmReprovisionNumbers"
		import="com.transworld.diary.framework.UnitDetailsDao"
		import="com.transworld.diary.framework.ActualProblemForReprovision"
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

		function validate()
		{
			var cntr=document.reprovconf.cntr.value;
			cntr=cntr-1;	
			
			for (var v=0;v<cntr;v++)	
			{	
				if(document.getElementById("cb"+v).checked==true)
				{
					var slct=document.getElementById("actprob"+v).value;
					if(slct=="Select")
					{
						alert("Please select Actual Problem for Checked Check-box");
						return false;
					}
				}
				else
				{
					
				}
					
			}
			
			return true;	
		}

		function selectAll()
		{
			var cntr=document.reprovconf.cntr.value;
			cntr=cntr-1;
		
			if(document.reprovconf.maincb.checked==true)
			{
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=true;
				}
			}
			else
			{
				
				for(var j=0;j<=cntr;j++)
				{	
					document.getElementById("cb"+j).checked=false;
				}
			}
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
<form name="reprovconf" method="get" action="reprovisionconfinsrt.jsp" onSubmit="return validate();">
<%
	final String nocbselected=request.getParameter("nocbselected");
	final String closed=request.getParameter("closed");
	int details= 0;
	int detailsOfProblems= 0;
	List<ActualProblemForReprovision> actualProblemForReprovision=null;
	List<ConfirmReprovisionNumbers> confirmReprovisionNumbers=null;
	try{
		confirmReprovisionNumbers = unitDetailsDao.getConfirmReprovisionNumbers();
		actualProblemForReprovision=unitDetailsDao.getActualProblemForReprovision();
		details = confirmReprovisionNumbers.size();
	} catch(Exception e){
		e.printStackTrace();
	}
	
	if(nocbselected!=null)
	{
%>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
			</tr>
		</table>
<%	}
	if(closed!=null)
	{
%>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > Successfully Closed</font> </div> </td>
			</tr>
		</table>
<%	
}
%>
	<table border="0" width="750px">
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Confirm Re-Provision by the Vendor </B> </font> </td>
		</tr>
	</table>
	<table class="sortable">
		<tr> 
			<td> <div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"> </input> </div> </td>
			<td> <div align="center"> <B> Sr.<br/> No.</B> </div> </td>
			<td> <div align="center"> <B> Unit Id</B> </div> </td>
			<td> <div align="center"> <B> Mob. No</B> </div> </td>
			<td> <div align="center"> <B> Sim No.</B> </div> </td>
			<td> <div align="center"> <B> Sent Date-Time</B> </div> </td>
			<td> <div align="center"> <B> Ent. By</B> </div> </td>
			<td> <div align="center"> <B> Actual Prob.</B> </div> </td>
		</tr>
<%
for (int counter = 0; counter < details; counter++) 
	{
		final ConfirmReprovisionNumbers currentRecord = confirmReprovisionNumbers.get(counter);
		int i = counter+1;
		int j=0;
%>
		<tr>
			<td> <div align="center"> <input type="checkbox" name="cb<%=j%>" id="cb<%=j%>"  value="cb<%=j%>"></div> </td>
			<td> <%=i%> <input type="hidden" name="id<%=j%>" value="<%=currentRecord.getSrNo()%>" />          </td>
			<td> <%=currentRecord.getUnitId()%> </td>
			<td> <%=currentRecord.getMobileNo()%> </td>
			<td> <%=currentRecord.getSimNo()%> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(currentRecord.getSendDateTime()))%> </td>
			<td> <%=currentRecord.getEnteredBy()%> </td>
			<td> <div align="center"> <select name="actprob<%=j%>" id="actprob<%=j%>" class="formElement"> <option value="Select">Select</option>  
<%
	for (final ActualProblemForReprovision problem : actualProblemForReprovision) 
	{
 %>
					<option value="<%=problem.getProblem()%>"><%=problem.getProblem()%></option>
<%
	}
%>
				</select> </div> 
		<input type="hidden" name="cntr" value="<%=i%>" /></td>		
		</tr>
<%	
		j++;
	}
%>
		<tr>
			<td colspan="8"> <div align="center"> <input type="submit" name="Submit" value="Re-Provisioning Done" class="formElement" /> </div> </td>
		</tr>
</table>

<!-- code end here --->
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