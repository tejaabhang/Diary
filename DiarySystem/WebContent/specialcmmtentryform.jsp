<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.transworld.diary.framework.SpecialCommentEntryForm"
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
	<script language="javascript">

	function validate()
	{ 
		//alert("in validation");
		//alert(document.getElementById("radioSelected").value);
		var radioSelected=document.getElementById("radioSelected").value;
		if(radioSelected=="tech")
		{
			var comm=document.getElementById("techcomment").value;
			if(comm=="")
			{
				alert("Please Enter Comments for technician");
				return false;
			}
		}

		if(radioSelected=="unit")
		{
			var comm=document.getElementById("unitcomment").value;
			if(comm=="")
			{
				alert("Please Enter Comments for unit");
				return false;
			}
		}
		if(radioSelected=="vehicle")
		{
			var comm=document.getElementById("vehiclecomment").value;
			if(comm=="")
			{
				alert("Please Enter Comments for Vehicle");
				return false;
			}
		}
		if(radioSelected=="ClosingVehicle")
		{
			var comm=document.getElementById("closingvehiclecomment").value;
			if(comm=="")
			{
				alert("Please Enter Closing Comments for Vehicle");
				return false;
			}
		}

		
			
			return true;
			
	}	

	function activate(index)
	{
		//alert("hello");
		//alert(document.getElementById("btnsubmit"+index).value);
		document.getElementById("btnsubmit"+index).style.display="block";
		document.getElementById("comm"+index).style.display="none";
		document.getElementById("comment"+index).style.display="block";
		document.getElementById("edit"+index).style.display="none";
		
	}
	function activate1(index)
	{
		//alert("hello");
		//alert(document.getElementById("btnsubmit1"+index).value);
		document.getElementById("btnsubmit1"+index).style.display="block";
		document.getElementById("comm1"+index).style.display="none";
		document.getElementById("comment1"+index).style.display="block";
		document.getElementById("edit1"+index).style.display="none";
		
	}
	function activate2(index)
	{
		//alert("hello");
		//alert(document.getElementById("btnsubmit2"+index).value);
		document.getElementById("btnsubmit2"+index).style.display="block";
		document.getElementById("comm2"+index).style.display="none";
		document.getElementById("comment2"+index).style.display="block";
		document.getElementById("edit2"+index).style.display="none";
		
	}
	function activate3(index)
	{
		//alert("hello");
		//alert(document.getElementById("btnsubmit2"+index).value);
		document.getElementById("btnsubmit3"+index).style.display="block";
		document.getElementById("comm3"+index).style.display="none";
		document.getElementById("comment3"+index).style.display="block";
		document.getElementById("edit3"+index).style.display="none";
		
	}
	function showType(id)
	{
		//alert(id);
		if(id==0)
		{
			document.getElementById("radioSelected").value="tech";
			document.getElementById("techrow").style.display="";
			document.getElementById("unitrow").style.display="none";
			document.getElementById("vehiclerow").style.display="none";
			document.getElementById("closingvehiclerow").style.display="none";
		}
		else if(id==1)
		{
			document.getElementById("radioSelected").value="unit";
			document.getElementById("unitrow").style.display="";
			document.getElementById("techrow").style.display="none";
			document.getElementById("vehiclerow").style.display="none";
			document.getElementById("closingvehiclerow").style.display="none";
		}
		else if(id==2)
		{
			document.getElementById("radioSelected").value="vehicle";
			document.getElementById("vehiclerow").style.display="";
			document.getElementById("unitrow").style.display="none";
			document.getElementById("techrow").style.display="none";
			document.getElementById("closingvehiclerow").style.display="none";
		}
		else if(id==3)
		{
			document.getElementById("radioSelected").value="ClosingVehicle";
			document.getElementById("unitrow").style.display="none";
			document.getElementById("techrow").style.display="none";
			document.getElementById("vehiclerow").style.display="none";
			document.getElementById("closingvehiclerow").style.display="";
		}
		//document.spcomment1.submit();
	}
	function onSubmit(rid,index,type)
	{
		alert(rid+type);
		var url="updatecmmnt.jsp";
		document.spcomment11.action=url+"?rid="+rid+"&type="+type+"&index="+index;
		alert("i hope executed");
		document.spcomment11.submit();
		alert("Form submitted");
	}
	function onDelete(type)
	{
		//alert(type);
		var rid="";
		var flag=false;
		if(type=="Tech")
		{
			var cntr=document.getElementById("techcntr").value;
			//alert(cntr);
			var i=1;
		
				for(i=1;i<cntr;i++)
				{
					//alert(document.getElementById("chktech"+i).checked);
					if(document.getElementById("chktech"+i).checked)
					{
						//alert("inside if true");
						flag=true;
						//alert(document.getElementById("techrid"+i).value);
						rid=rid+document.getElementById("techrid"+i).value+",";
					}
					
				}
				//alert(flag);
				
		}
		if(type=="Unit")
		{
			var cntr=document.getElementById("unitcntr").value;
			//alert(cntr);
			var i=1;
		
				for(i=1;i<cntr;i++)
				{
					//alert(document.getElementById("chkunit"+i).checked);
					if(document.getElementById("chkunit"+i).checked)
					{
						//alert("inside if true");
						flag=true;
						//alert(document.getElementById("unitrid"+i).value);
						rid=rid+document.getElementById("unitrid"+i).value+",";
					}
					
				}
				//alert(flag);
				
		}
		if(type=="Veh")
		{
			var cntr=document.getElementById("vehcntr").value;
			//alert(cntr);
			var i=1;
		
				for(i=1;i<cntr;i++)
				{
					//alert(document.getElementById("chkveh"+i).checked);
					if(document.getElementById("chkveh"+i).checked)
					{
						//alert("inside if true");
						flag=true;
						//alert(document.getElementById("vehrid"+i).value);
						rid=rid+document.getElementById("vehrid"+i).value+",";
					}
					
				}
				//alert(flag);
				
		}
		if(flag==false)
		{ alert("Please Select atleast one Checkbox");
			return false;
		}
		//alert(rid);
		var url="updatecmmnt.jsp";
		document.spcomment1.action=url+"?btn=Delete&totrid="+rid;
		document.spcomment1.submit();
	}
	</script>
	<script type="text/javascript">
	function CheckUncheckAll()
	{
		//alert("hello");
		var techcntr=parseInt(document.getElementById("techcntr").value);
		//alert(techcntr);
		
		for (i = 1; i < techcntr; i++)
		{ 
			if(document.spcomment1.maintech.checked==true)
			{
				//alert("hi");
				document.getElementById("chktech"+i).checked = true;
			}
			else
			{//alert("Bye");
				document.getElementById("chktech"+i).checked = false;
			}
		} 
		
		
		
	}
	function CheckUncheckAll1()
	{
			var unitcntr=parseInt(document.getElementById("unitcntr").value);
		//alert(unitcntr);
		
		for (i = 1; i < unitcntr; i++)
		{ 
			if(document.spcomment1.mainunit.checked==true)
			{
				document.getElementById("chkunit"+i).checked = true;
			}
			else
			{
				document.getElementById("chkunit"+i).checked = false;
			}
		} 
		
		
	}
	function CheckUncheckAll2()
	{
			var vehcntr=parseInt(document.getElementById("vehcntr").value);

		
		for (i = 1; i < vehcntr; i++)
		{ 
			if(document.spcomment1.mainveh.checked==true)
			{
				document.getElementById("chkveh"+i).checked = true;
			}
			else
			{
				document.getElementById("chkveh"+i).checked = false;
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

<%
	final String TECH="Tech";
	final String UNIT="Unit";
	final String VEHICLE="Vehicle";
	final String result=request.getParameter("result");
	final String comment=request.getParameter("comment");
	final String inserted=request.getParameter("inserted");
	final String listNameIfTechnicianOrUnitOrVehicleRequest=request.getParameter("type");
	//System.out.println("Type++++++++++++++>"+listNameIfTechnicianOrUnitOrVehicleRequest);
	final String listNameIfTechnicianOrUnitOrVehicle=(null==listNameIfTechnicianOrUnitOrVehicleRequest) ? null: listNameIfTechnicianOrUnitOrVehicleRequest;
	int numRecords = 0;
	List<SpecialCommentEntryForm> specialCommentEntryForm= null;
	try{
		specialCommentEntryForm = unitDetailsDao.getSpecialCommentEntryForm(listNameIfTechnicianOrUnitOrVehicle);       	
	   	numRecords = specialCommentEntryForm.size();	 
	} catch(Exception e){
		e.printStackTrace();
	}
	if(inserted!=null)
	{
 %>
		<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
			</tr>
		</table>
<% 	}
	if(result!=null)
	{ 
%>
		<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Comment <%=result %> Successfully</font> </td>
			</tr>
		</table>
<% 	
	}
%>
<form name="spcomment11" method="get" >
	<input type="hidden" name="commentfor" value="<%=comment%>" />
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr  bgcolor="#BDBDBD"> 
			<td align="center"> <div align="center"><input type="radio" name="type" value="Tech" checked onClick="showType(0);"><font><b>Tech</b></font>&nbsp;&nbsp;&nbsp;
					<input type="radio" name="type" value="Unit" onClick="showType(1);"><font><b>Unit</b></font>
					<input type="radio" name="type" value="Vehicle" onClick="showType(2);"><font><b>Vehicle</b></font>
					<input type="radio" name="type" value="ClosingVehicle" onClick="showType(3);"><font><b>Vehicle Closing Comment</b></font>
					</div>
					<!--  <div align="center"><input type="submit" name="submit" value="submit" class="formElement"></input></div>-->
			 </td>
		</tr>
		<tr>
			<td align="center"> <font size="2"> <b> Enter Special Comments  </b> </font> </td>
		</tr>
	</table>
</form>
<form name="spcomment" method="get" action="spcommentinsrt.jsp" onSubmit="return validate();">
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr> 
			<td align="center">
			<input type="hidden" name="radioSelected" id="radioSelected" value="tech">
				<table border="0" width="350px" bgcolor="#E6E6E6" align="center">
					<tr id="techrow"  bgcolor="#BDBDBD">  
						<td align="center"><b>Techinician Comment</b> </td>
						<td align="left"><input type="text" name="techcomment" id="techcomment"></input> 
						 </td>
					</tr>
					<tr id="unitrow" style="display:none"  bgcolor="#BDBDBD">
						<td align="center"> <b> Unit Comment </b> </td>
						<td> <input type="text" name="unitcomment" id="unitcomment"  value="" /> </td>
					</tr>
					<tr id="vehiclerow" style="display:none" bgcolor="#BDBDBD">
						<td align="center"><b>Vehicle Comment </b> </td>
						<td> 
							<input type="text" name="vehiclecomment" id="vehiclecomment"  value=""></input>
						 </td>
					</tr>
					<tr id="closingvehiclerow" style="display:none" bgcolor="#BDBDBD">
						<td align="center"><b>Vehicle Closing Comment </b> </td>
						<td> 
							<input type="text" name="closingvehiclecomment" id="closingvehiclecomment"  value=""></input>
						 </td>
					</tr>
					<tr>
						<td colspan="2" align="center" bgcolor="#BDBDBD"> 
							<input type="submit" name="submit" value="ADD" class="formElement"></input>
						</td>
					</tr>
				</table>
			</td> 
		</tr> 
	</table> 
</form>
<form name="spcomment11" method="post" action="">
	<br></br>
	<div id="techtable" name="techtable">
		<table border="1" width="800px" bgcolor="#E6E6E6" align="center" class="sortable">
			<tr><td colspan="4" align="center"><b>Special Comments</b></td></tr>
			<tr bgcolor="#BDBDBD">
				<td><div align="center"> <B> Sr.No </B> </div> </td>
				<td><div align="center"> <B> Comment </B></div></td> 
				
			</tr>
<%
		for (int counter = 0; counter < numRecords; counter++) 
		{
			final SpecialCommentEntryForm record = specialCommentEntryForm.get(counter);
			int i = counter+1;
%>
	
			<tr>
				<!-- <td><input type="hidden" name="techrid<%=i%>" id="techrid<%=i%>" value="<%=record.getRowIdToEditComment()%>" >
					 <input type="checkbox" name="chktech<%=i %>" id="chktech<%=i%>">
				 </td>-->
				<td><%=i %></td>
	            <td><div id="comm<%=i %>"><%=record.getSpecialCommentForTechnicianOrUnitOrVehicle() %></div>
	            	<input type="text" name="comment<%=i %>" id="comment<%=i%>" value="<%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%>" style="display:none"></td>
				<!-- <td>
					<input type="button" name="edit<%=i %>" id="edit<%=i %>" value="Edit" onclick="activate('<%=i %>');"  >
					<input type="submit" name="btnsubmit<%=i %>" id="btnsubmit<%=i %>" value="Submit" onclick="onSubmit('<%=record.getRowIdToEditComment()%>','<%=i%>','Tech')" style="display:none" >
					<input type="hidden" name="techcntr" id="techcntr" value="<%=i %>">
					<input type="hidden" name="techcntr" id="techcntr" value="<%=i %>">
				</td> -->
			</tr>
			
<%
		}
	
%>	<!--<tr>
			 <td colspan="4">
					<input type="button" value="Delete" name="techdelete" id="techdelete" onclick="onDelete('Tech')">
				</td> 
			</tr>-->
		</table>
	</div>
	<!-- 
	<div id="unittable" name="unittable" style="display: none">
		<table border="1" width="800px" bgcolor="#E6E6E6" align="center" class="sortable">
		<tr><td colspan="4" align="center"><b>Special Comments For Unit</b></td></tr>
		<tr bgcolor="#BDBDBD">
			<td class="sorttable_nosort">
				<input type="checkbox" name="mainunit" id="mainunit"  onClick="CheckUncheckAll1();">
			</td>
			<td><div align="center"> <B> Sr.No </B> </div> </td>
			<td><div align="center"> <B> Comment </B></div> </td>
			<td></td>
		</tr>
<%

		for (int counter = 0; counter < numRecords; counter++) 
		{
			final SpecialCommentEntryForm record = specialCommentEntryForm.get(counter);
			int j = counter+1;
%>
	
		<tr>
			<td>
				<input type="hidden" name="unitrid<%=j%>" id="unitrid<%=j%>" value="<%=record.getRowIdToEditComment()%>" >
				<input type="checkbox" name="chkunit<%=j%>" id="chkunit<%=j%>">
			</td>
			<td><%=j%></td>
			<td>
				<div id="comm1<%=j%>"><%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%></div>
				<input type="text" name="comment1<%=j%>" id="comment1<%=j%>" value="<%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%>" style="display:none">
			</td>
			<td>
				<input type="button" name="edit1<%=j%>" id="edit1<%=j%>" value="Edit" onclick="activate1('<%=j%>');"  ></input>
				<input type="submit" name="btnsubmit1<%=j %>" id="btnsubmit1<%=j%>" value="Submit" onclick="onSubmit('<%=record.getRowIdToEditComment()%>','<%=j%>','Unit')" style="display:none" >
				<input type="hidden" name="unitcntr" id="unitcntr" value="<%=j %>">
			</td>
		</tr>
<%
		}
	
%>
		<tr>
			<td colspan="4">
				<input type="button" value="Delete" name="vehdelete" onclick="onDelete('Unit')">
			</td>
		</tr>
	</table>
</div>
<div id="vehicletable" name="vehicletable" style="display: none">
	<table border="1" width="800px" bgcolor="#E6E6E6" align="center" class="sortable">
		<tr><td colspan="4" align="center"><b>Special Comments For Vehicle</b></td></tr>
		<tr bgcolor="#BDBDBD">
			<td class="sorttable_nosort">
				<input type="checkbox" name="mainveh" id="mainveh"  onClick="CheckUncheckAll2();">
			</td>
			<td><div align="center"> <B> Sr.No </B> </div> </td>
			<td><div align="center"> <B> Comment </B></div> </td>
			<td></td>
		</tr>
<%
		for (int counter = 0; counter < numRecords; counter++) 
		{
			final SpecialCommentEntryForm record = specialCommentEntryForm.get(counter);
			int k = counter+1;
%>
	
		<tr>
			<td>
				<input type="hidden" name="vehrid<%=k%>" id="vehrid<%=k%>" value="<%=record.getRowIdToEditComment()%>" >
				<input type="checkbox" name="chkveh<%=k %>" id="chkveh<%=k%>">
			</td>
			<td><%=k %></td>
			<td>
				<div id="comm2<%=k %>"><%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%></div>
				<input type="text" name="comment2<%=k %>" id="comment2<%=k%>" value="<%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%>" style="display:none">
			</td>
			<td>	
				<input type="button" name="edit2<%=k %>" id="edit2<%=k %>" value="Edit" onclick="activate2('<%=k %>');"  >
				<input type="submit" name="btnsubmit2<%=k %>" id="btnsubmit2<%=k %>" value="Submit" onclick="onSubmit('<%=record.getRowIdToEditComment()%>','<%=k%>','Vehicle')" style="display:none" >
				<input type="hidden" name="vehcntr" id="vehcntr" value="<%=k %>">
			</td>
		</tr>
<%
		}
	
%>
		<tr>
			<td colspan="4">
				<input type="button" value="Delete" name="vehdelete" onclick="onDelete('Veh')">
			</td>
		</tr>
	</table>
</div>
<div id="closingvehicletable" name="closingvehicletable" style="display: none">
	<table border="1" width="800px" bgcolor="#E6E6E6" align="center" class="sortable">
		<tr><td colspan="4" align="center"><b>Closing Special Comments For Vehicle</b></td></tr>
		<tr bgcolor="#BDBDBD">
			<td class="sorttable_nosort">
				<input type="checkbox" name="mainveh" id="mainveh"  onClick="CheckUncheckAll3();">
			</td>
			<td><div align="center"> <B> Sr.No </B> </div> </td>
			<td><div align="center"> <B> Comment </B></div> </td>
			<td></td>
		</tr>
<%
		for (int counter = 0; counter < numRecords; counter++) 
		{
			final SpecialCommentEntryForm record = specialCommentEntryForm.get(counter);
			int k = counter+1;
%>
	
		<tr>
			<td>
				<input type="hidden" name="vehrid<%=k%>" id="vehrid<%=k%>" value="<%=record.getRowIdToEditComment()%>" >
				<input type="checkbox" name="chkveh<%=k %>" id="chkveh<%=k%>">
			</td>
			<td><%=k %></td>
			<td>
				<div id="comm2<%=k %>"><%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%></div>
				<input type="text" name="comment3<%=k %>" id="comment3<%=k%>" value="<%=record.getSpecialCommentForTechnicianOrUnitOrVehicle()%>" style="display:none">
			</td>
			<td>	
				<input type="button" name="edit3<%=k %>" id="edit3<%=k %>" value="Edit" onclick="activate3('<%=k %>');"  >
				<input type="submit" name="btnsubmit3<%=k %>" id="btnsubmit3<%=k %>" value="Submit" onclick="onSubmit('<%=record.getRowIdToEditComment()%>','<%=k%>','ClosingVehicle')" style="display:none" >
				<input type="hidden" name="closevehcntr" id="closevehcntr" value="<%=k %>">
			</td>
		</tr>
<%
		}
	
%> 
		<tr>
			<td colspan="4">
				<input type="button" value="Delete" name="closevehdelete" onclick="onDelete('CloseVeh')">
			</td>
		</tr>-->
	
</div>
</form>

<!-- code end here --->

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