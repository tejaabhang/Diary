<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>

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
	var tech=document.techspcomment.tech.value;
	var comment=document.techspcomment.spcomment.value;

	
	if(tech=="Select")
	{
		alert("Please select Technician from the list");
		return false;
	}

	if(comment.length < 2)
	{
		alert("Please enter Comments");
		return false;
	}
	return true;		
}

function AutoSubmit()
{ 
	document.techspcommentclose1.submit();
}

function ShowOpts()
{ 
	if(document.techspcommentclose1.radtype[0].checked==true)
	{
		document.getElementById("techopts").style.display="";
		document.getElementById("unitopts").style.display='none';
		document.getElementById("unitopts1").style.display='none';
		document.getElementById("vehopts").style.display='none';
	} 
	else if(document.techspcommentclose1.radtype[1].checked==true)
	{
		document.getElementById("unitopts").style.display="";
		document.getElementById("unitopts1").style.display="";
		document.getElementById("techopts").style.display='none';
		document.getElementById("vehopts").style.display='none';
	}
	else
	{
		document.getElementById("unitopts").style.display='none';
		document.getElementById("unitopts1").style.display='none';
		document.getElementById("techopts").style.display='none';
		document.getElementById("vehopts").style.display="";
	}
}

function HideOpts(id)
{ 
	if(id==0)
	{
		document.getElementById("unitopts").style.display='none';
		document.getElementById("vehopts").style.display='none';
	}
	else if(id==1)
	{
		document.getElementById("techopts").style.display='none';
		document.getElementById("vehopts").style.display='none';
	}
	else
	{
		document.getElementById("techopts").style.display='none';
		document.getElementById("unitopts").style.display='none';
	}
	
}

function onDelete(type)
{
	//alert("hello"+type);
	var rid="";
	var flag=false;
	if(type=="Tech")
	{
		var cntr=document.getElementById("techcntr").value;
		//alert(cntr);
		var i=1;
	
			for(i=1;i<cntr;i++)
			{
				//alert(document.getElementById("techdel"+i).value);
				if(document.getElementById("techdel"+i).checked)
				{
					//alert("inside if true");
					flag=true;
					//alert(document.getElementById("techid"+i).value);
					rid=rid+document.getElementById("techid"+i).value+",";
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
				//alert(document.getElementById("unitdel"+i).checked);
				if(document.getElementById("unitdel"+i).checked)
				{
					//alert("inside if true");
					flag=true;
					//alert(document.getElementById("unitid"+i).value);
					rid=rid+document.getElementById("unitid"+i).value+",";
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
				//alert(document.getElementById("vehdel"+10).checked);
				if(document.getElementById("vehdel"+i).checked)
				{
					//alert("inside if true");
					flag=true;
					//alert(document.getElementById("vehid"+i).value);
					rid=rid+document.getElementById("vehid"+i).value+",";
				}
				
			}
		//	alert(flag);
			
	}
	if(flag==false)
	{ alert("Please Select atleast one Checkbox");
		return false;
	}
	//alert(rid);
	window.open('ClosingSpComment.jsp?RId='+rid+'&vehno=-&unitid=-','mywindow','width=800, height=250, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no,left=50, top=50 ');
	//var url="closetechspcommentinsrt.jsp";
	//document.techspcommentclose.action=url+"?&totrid="+rid;
	//document.techspcommentclose.submit();
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
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),stmtlatest=con2.createStatement(),streplace=con2.createStatement(),st44=con2.createStatement();
	ResultSet rs1=null, rs3=null, rs4=null;
	String sql1="", sql3="", sql4="";

	String inserted=request.getParameter("result");
	if(inserted==null)
	{
	}
	else if(inserted.equalsIgnoreCase("true"))
	{ %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Closed......... </font> </td>
			</tr>
		</table>
<% 	}

	String nocbselected=request.getParameter("nocbselected");
	if(nocbselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>
				<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box to remove it from Unit Missing list.</font> </div> </td>
			</tr>
		</table>
<%	}
%>
<form name="techspcommentclose1" method="get" action="" >

<%	
	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);

	sql3="select distinct(TechName) as TechName from t_techlist order by TechName asc";
	rs3=stmt1.executeQuery(sql3);
%>
 	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td> <div align="center"><input type="radio" name="radtype" value="Tech"  onClick="ShowOpts(0);" checked /> <font color="black"> <b>Tech</b></font>
			     <input type="radio" name="radtype" value="Unit" onClick="ShowOpts(1);" > <font color="black"/> <b>Unit</b></font>
			    <input type="radio" name="radtype" value="Vehicle" onClick="ShowOpts(2);"> <font color="black" /> <b>Vehicle</b></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
			
		</tr>
		<tr id="techopts" bgcolor="#BDBDBD">	
			<td>
				<font color="black"><b>Tech:</b> </font>
				<select name="techlist" class="formElement">
					<option value="Select">Select</option>
<%				while(rs3.next())
				{ %>
					<option value="<%=rs3.getString("TechName")%>"><%=rs3.getString("TechName")%></option>
<%				}				
%>
				</select>	&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="black"><b>From Date:</b> </font>
		<input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script> &nbsp;&nbsp;&nbsp;
		<font color="black"><b>To Date:</b> </font>
		<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender1",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger1"       // ID of the button
               }
                             );
               </script>
			</td>
		</tr>

		<tr id="unitopts" style="display:none" bgcolor="#BDBDBD">	
			<td>
				<font color="maroon"><b>Unit:</b> </font>
				<input type="text" name="unitid" class="formElement" />	&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="black"><b>From Date: </b></font>
		<input type="text" id="calender2" name="calender2" size="13" class="formElement" value="<%=s%>" readonly  />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender2",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger2"       // ID of the button
               }
                             );
               </script> &nbsp;&nbsp;&nbsp;
		<font color="black"><b>To Date: </b></font>
		<input type="text" id="calender3" name="calender3" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender3",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger3"       // ID of the button
               }
                             );
               </script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="black"><b>Closed:</b> </font>
			<select name="closed" class="formElement">
				<option value="All">All</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>
			</td>
			</tr>
		<tr id="unitopts1" style="display:none"  bgcolor="#BDBDBD">
			<td>  <font color="black">Multiple entries has to be separated by comma only and no comma after single unit id or last unit id</font> </td>	
		</tr>
<%
	sql4="select distinct(TypeValue) as user  from t_security where TypeofUser = 'Transporter' order by TypeValue asc";
	rs4=stmt2.executeQuery(sql4);
	String sql44="select Comment from db_CustomerComplaints.t_commentlist where Modulename='DiarySystem' and Listname='Vehicle'";
	ResultSet rs44=st44.executeQuery(sql44);
%>		
		<tr id="vehopts" style="display:none">	
			<td>
				<font color="black"><b>Cust: </b></font>
				<select name="custlist" class="formElement" onChange="OnChangeFunc3(this);">
					<option value="All">All</option>
<%				while(rs4.next())
				{ %>
					<option value="<%=rs4.getString("user")%>"><%=rs4.getString("user")%></option>
<%				}				
%>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;	
</td><td>
				<font color="black"><b>Comments:</b> </font>
				<select name="commentList" class="formElement" onChange="OnChangeFunc3(this);">
					<option value="All">All</option>
<%				while(rs44.next())
				{ %>
					<option value="<%=rs44.getString("Comment")%>"><%=rs44.getString("Comment")%></option>
<%				}				
%>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;	
				</td><td>
				<font color="black"><b>From Date: </b></font>
		<input type="text" id="calender4" name="calender4" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender4",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger4"       // ID of the button
               }
                             );
               </script>  &nbsp;&nbsp;&nbsp;
               </td><td>
		<font color="black"><b>To Date:</b> </font>
		<input type="text" id="calender5" name="calender5" size="13" class="formElement" value="<%=s%>" readonly class="formElement" />
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender5",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger5"       // ID of the button
               }
                             );
               </script>
               </td><td>
               <font color="black"><b>Closed: </b></font>
			<select name="closedVehicle" class="formElement">
				<option value="All">All</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center"><input type="submit" name="Submit" value="Submit" /> </td>
		</tr>
	</table>
</form>
<form name="techspcommentclose" method="post" action="" >

<%
	
	String radtype=request.getParameter("radtype");
	
	int i=1,i1=1;
	
	if(radtype==null || radtype.equals("Tech"))
	{  

		String techname=request.getParameter("techlist");
		String date=request.getParameter("calender");
		String date1=request.getParameter("calender1");
		String between="", datee="", datee1=""; 
				
		if(techname==null || techname.equals("Select"))
		{ 
			//sql1="select * from t_techspecialrep where TechName not in ('NA','-') and VehRegNo in ('NA','-')  and UnitId in ('NA','-') and cmmt_type not in ('Unit','Vehicle') order by EntDateTime desc";
			sql1="select * from t_techspecialrep where cmmt_type='Technician' order by EntDateTime desc";
			techname="Tech's";
		}
		else
		{
			//sql1="select * from t_techspecialrep where TechName = '"+techname+"' and EntDateTime between '"+date+" 00:00:00' and '"+date1+" 23:59:59'and TechName not in ('NA','-') and VehRegNo in ('NA','-')  and UnitId in ('NA','-') and cmmt_type not in ('Unit','Vehicle') order by EntDateTime desc ";
			sql1="select * from t_techspecialrep where TechName = '"+techname+"' and EntDateTime between '"+date+" 00:00:00' and '"+date1+" 23:59:59'and cmmt_type='Technician' order by EntDateTime desc ";
			
		
			datee=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date));
			datee1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date1));
			between="between "+ datee + " and " + datee1;
		}
	
		rs1=stmt1.executeQuery(sql1);	
%>
		<br></br>
		<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="center"> <font color="black" size="2"> <B> <%=techname%> Special Comments (Report and Close Form) <%=between%> </b> </font> </td>
		</tr>
		<tr>
			<td>  <font color="maroon"> If check-box is missing, that means Comment has already been Closed.</font> </td>	
			<td align="right"> <a href="excelspcomment.jsp?techlist=<%=techname%>&calender=<%=date%>&calender1=<%=date1%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>
		</tr>
	</table>
	<br></br>
		<table border="1" align="center" width="750px" class="sortable">
		 	<tr  bgcolor="#BDBDBD">
				<td> </td>
				<td> <div align="center"> <b> Sr.No  </b></div> </td>	
				<td> <div align="center"> <b> Ent Date Time  </b></div> </td>	
				<td> <div align="center"> <b> Tech.  </b></div> </td>
				<td> <div align="center"> <b> Action to be Taken by </b></div> </td>	
					<td> <div align="center"> <b> Sp. Comment  </b></div> </td>	
				<td> <div align="center"> <b> Extra. Comment  </b></div> </td>	
				<td> <div align="center"> <b> Ent. By  </b></div> </td>	
				<td> <div align="center"> <b> Close By  </b></div> </td>	
				<td> <div align="center"> <b> Closing sp. comment  </b></div> </td>	
				<td> <div align="center"> <b> Closing extra comment  </b></div> </td>	
			</tr>
<%
	while(rs1.next())
	{ 
	
	
	%>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ 
		%>

			 <div align="center">  <input type="checkbox" name="techdel<%=i1%>" id="techdel<%=i1%>" value="techdel<%=i1%>" /> 
			 <input type="hidden" name="techid<%=i1%>" id="techid<%=i1%>" value="<%=rs1.getString("SrNo")%>" /> 
			 
			 </div>  </td>
<%	i1++;	} 
%>
	<td> <div align="center"> <%=i%> </div>
	
			</td>
			<td><div align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			<td> <div align="center"><%=rs1.getString("TechName")%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="center"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("Extra_comment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("CloseBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("ClosingSpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("ClosingExtra_comment")%> </div></td>
		</tr>
<%	
		i++;

		
	}
%>
		<tr>
			<td colspan="11"><input type="hidden" name="techcntr" id="techcntr" value="<%=i1%>" /> <div align="center"> <input type="button" name="techdelete" value="Close" class="formElement" onclick="onDelete('Tech')" /> </div> </td>
		</tr>
		</table>			
<%	} 
	else if(radtype.equals("Unit"))	
	{  int j=1,j1=1;
		String unit=request.getParameter("unitid");
		String closed=request.getParameter("closed");
		//System.out.println(closed);
		//System.out.println(unit);
		String date2=request.getParameter("calender2");
		String date3=request.getParameter("calender3");
		String between="", datee2="", datee3="";
		if("All".equalsIgnoreCase(closed)||closed.equalsIgnoreCase("All"))
		{
		if(unit==null || unit.equals(""))
		{
			//sql1="select * from t_techspecialrep where UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
			sql1="select * from t_techspecialrep where cmmt_type='Unit' order by EntDateTime desc ";
			unit="Unit's";
		}
		else
		{
			sql1="select * from t_techspecialrep where UnitId = '"+unit+"' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
			sql1="select * from t_techspecialrep where UnitId in ("+unit+") and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' and cmmt_type='Unit' order by EntDateTime desc ";
			

			datee2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2));
			datee3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date3));
			between="between "+ datee2 + " and " + datee3;
			
		}
		}else if("Yes".equalsIgnoreCase(closed)||closed.equalsIgnoreCase("Yes")){
			if(unit==null || unit.equals(""))
			{
				//sql1="select * from t_techspecialrep where UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
				sql1="select * from t_techspecialrep where cmmt_type='Unit' and Closed='Yes' order by EntDateTime desc ";
				unit="Unit's";
			}
			else
			{
				sql1="select * from t_techspecialrep where UnitId = '"+unit+"' and Closed='Yes' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
				sql1="select * from t_techspecialrep where UnitId in ("+unit+") and Closed='Yes' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' and cmmt_type='Unit' order by EntDateTime desc ";
				

				datee2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2));
				datee3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date3));
				between="between "+ datee2 + " and " + datee3;
				
			}
		}else{
			if(unit==null || unit.equals(""))
			{
				//sql1="select * from t_techspecialrep where UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
				sql1="select * from t_techspecialrep where cmmt_type='Unit' and Closed='No' order by EntDateTime desc ";
				unit="Unit's";
			}
			else
			{
				sql1="select * from t_techspecialrep where UnitId = '"+unit+"' and Closed='No' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' UnitId not in ('NA','-') and TechName in ('NA','-') and VehRegNo in ('NA','-') and cmmt_type not in ('Technician','Vehicle') order by EntDateTime desc ";
				sql1="select * from t_techspecialrep where UnitId in ("+unit+") and Closed='No' and EntDateTime between '"+date2+" 00:00:00' and '"+date3+" 23:59:59' and cmmt_type='Unit' order by EntDateTime desc ";
				

				datee2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date2));
				datee3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date3));
				between="between "+ datee2 + " and " + datee3;
				
			}
		}
		//System.out.println(sql1);
		rs1=stmt1.executeQuery(sql1);	
%>
		<br></br>
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="center"> <font color="black" size="2"> <B> Unit's Special Comments (Report and Close Form) <%=between%></b> </font> </td>
		</tr>
		<tr>
			<td>  <font color="maroon"> If check-box is missing, that means Comment has already been Closed.</font> </td>	
			<td align="right"> <a href="excelspcomment.jsp?radtype=Unit&unitid=<%=unit%>&calender2=<%=date2%>&calender3=<%=date3%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>
		</tr>
		
	</table>
	<br></br>
		<table border="1" align="center" width="750px" class="sortable">
		 	<tr  bgcolor="#BDBDBD">
				<td> </td>
				<td> <div align="center"> <B> Sr.No  </B></div> </td>	
				<td> <div align="center"> <B> Ent Date Time  </B></div> </td>	
				<td> <div align="center"> <B> Unit Id  </B></div> </td>
				<td> <div align="center"> <B> Vehicle No </B></div> </td>
				<td> <div align="center"> <B>Last Data Date </B></div> </td>
				<td> <div align="center"> <B>Last Data Location </B></div> </td>
				<td> <div align="center"> <B>Transporter</B></div> </td>
				<td> <div align="center"> <B>Peripheral</B></div> </td>
				<td> <div align="center"> <B>Sim Company</B></div> </td>
				<td> <div align="center"> <B>Device Type</B></div> </td>
				<td> <div align="center"> <B>Dispatch Location </B></div> </td>
				<td> <div align="center"> <B>Testing Date and Time</B></div> </td>
				<td> <div align="center"> <B>Technician Name</B></div> </td>
				<td> <div align="center"> <B>Location Name </B></div> </td>
				<td> <div align="center"> <B> Red Light </B></div> </td>
				<td> <div align="center"> <B> Green Light</B> </div> </td>
				<td> <div align="center"> <B> GPS Blue Light </B></div> </td>
				<td> <div align="center"> <B> Ringing </B></div> </td>	
				<td> <div align="center"> <B> Action to be Taken by </B></div> </td>	
				<td> <div align="center"> <B> Sp. Comment  </B></div> </td>	
				<td> <div align="center"> <B> Extra. Comment  </B></div> </td>	
				<td> <div align="center"> <B>Unit Life </B></div> </td>	
				<td> <div align="center"> <B> Ent. By  </B></div> </td>	
				<td> <div align="center"> <B> Close By  </B></div> </td>	
				<td> <div align="center"> <b> Closing sp. comment  </b></div> </td>	
				<td> <div align="center"> <b> Closing extra comment  </b></div> </td>	
			</tr>
<%
	
	while(rs1.next())
	{ %>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ %>

			 <div align="center">  <input type="checkbox" name="unitdel<%=j1%>" id="unitdel<%=j1%>"  /> </div> 
			 	<input type="hidden" name="unitid<%=j1%>" id="unitid<%=j1%>" value="<%=rs1.getString("SrNo")%>" /> 
			  </td>
<%		j1++;} %>
			<td> <div align="right"> <%=j%> </div>

			</td>
			<td><div align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			
			<td> <div align="right"><%=rs1.getString("UnitId")%> </div></td>
			<%
			//System.out.println(rs1.getString("VehRegNo"));
			if(rs1.getString("VehRegNo").equalsIgnoreCase("-")||"-".equalsIgnoreCase(rs1.getString("VehRegNo")))
			{%>
			<td> <div align="left">Not Configured </div></td>
			<%
			}else{
				%>
					<td> <div align="left"><%=rs1.getString("VehRegNo")%> </div></td>
				<%
			}
			String LastDataDate="",LastDataTime="",LastDataTimeboth="";
			String latest="select * from db_gps.allconnectedunits where UnitID='"+rs1.getString("UnitId")+"'";
			//System.out.println(latest);
			ResultSet rslatest=stmtlatest.executeQuery(latest);
			if(rslatest.next()){
				LastDataDate=rslatest.getString("TheDate");
				LastDataTime=rslatest.getString("TheTime");
				//LastDataTimeboth=LastDataDate+" "+LastDataTime;
			String LastDataDate1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rslatest.getString("TheDate")));
			String LastDataTime1=new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("HH:mm:ss").parse(rslatest.getString("TheTime")));
			%>
			<%-- <td> <div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(LastDataTimeboth))%></div></td> --%>
			<td> <div align="right"><%=LastDataDate1%> <%=LastDataTime1%></div></td>
			<td> <div align="left"><%=rslatest.getString("Location")%></div></td>
			<%
			}else{
				%>
				<td> <div align="center">-</div></td>
				<td> <div align="center">-</div></td>
				<%
			}
			%>
			<td> <div align="left"><%=rs1.getString("Transp")%> </div></td>
			<%
			String unitmaster="select * from db_gps.t_unitmaster where UnitID='"+rs1.getString("UnitId")+"'";
			//System.out.println(unitmaster);
			ResultSet rsunitmaster=stmtlatest.executeQuery(unitmaster);
			if(rsunitmaster.next()){
			%>
			<td> <div align="left"><%=rsunitmaster.getString("Peripherals")%></div></td>
			<td> <div align="left"><%=rsunitmaster.getString("SimCompany")%></div></td>
			<td> <div align="left"><%=rsunitmaster.getString("typeunit")%></div></td>
			<td> <div align="left"><%=rsunitmaster.getString("DisAdd")%></div></td>
			<%
			}else{
				%>
				<td> <div align="center">-</div></td>
				<td> <div align="center">-</div></td>
				<td> <div align="center">-</div></td>
				<td> <div align="center">-</div></td>
				<%
			}
			%>
			<td> <div align="right"><%=rs1.getString("TestingDateTime")%> </div></td>
			<td> <div align="left"><%=rs1.getString("TechName")%> </div></td>
			<td> <div align="left"><%=rs1.getString("Location")%> </div></td>
			<td> <div align="left"><%=rs1.getString("RedLight")%> </div></td>
			<td> <div align="left"><%=rs1.getString("GreenLight")%> </div></td>
			<td> <div align="left"><%=rs1.getString("GPSLight")%> </div></td>
			
			<td> <div align="left"><%=rs1.getString("Ringing")%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="left"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="left"><%=rs1.getString("Extra_comment")%> </div></td>
			
			<%
			String replace="SELECT * FROM `t_unitreplacement` WHERE NewUnitID='"+rs1.getString("UnitId")+"' order by InstDate DESC limit 1";
			//System.out.println(replace);
			ResultSet rsreplace=streplace.executeQuery(replace);
			String replacementdate="";
			if(rsreplace.next()){
				replacementdate=rsreplace.getString("InstDate");
			}
			String unitlife="select TO_DAYS('"+LastDataDate+"')-TO_DAYS('"+replacementdate+"') as days";
			//System.out.println(unitlife);
			 int days=0;
			ResultSet rsunitlife=streplace.executeQuery(unitlife);
			if(rsunitlife.next()){
			
			 days=rsunitlife.getInt("days");
			 if(days>=0){
				 %>
					<td> <div align="right"><%=days%></div></td>
					<%
			 }else{
				 %>
					<td> <div align="center">-</div></td>
					<%
			 }
			}else{
				%>
				<td> <div align="center">-</div></td>
				<%
			}
			%>
			<td> <div align="left"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="left"><%=rs1.getString("CloseBy")%> </div></td>
			<td> <div align="left"><%=rs1.getString("ClosingSpComment")%> </div></td>
			<td> <div align="left"><%=rs1.getString("ClosingExtra_comment")%> </div></td>
		</tr>
<%	
		
		j++;
	}
%>
		<tr>
			<td colspan="27"> <div align="center"><input type="hidden" name="unitcntr" id="unitcntr" value="<%=j1%>" /> <input type="button" name="unitdelete" value="Close" class="formElement" onclick="onDelete('Unit');"/> </div> </td>
		</tr>
		</table>
<%	}
	else
	{  
		int k=1,k1=1;;
		String cust=request.getParameter("custlist");
		String closedVehicle=request.getParameter("closedVehicle");
		String commentList=request.getParameter("commentList");
		String date4=request.getParameter("calender4");
		String date5=request.getParameter("calender5");
		//System.out.println("closedVehicle-->"+closedVehicle+" commentList--->"+commentList);
		//System.out.println("date4-->"+date4+" date5--->"+date5);
		String between="", datee4="", datee5="";
		String transp="";	
		
		if(cust.equals("All")&& commentList.equals("All") && closedVehicle.equals("All") )
		{		
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
			cust="Vehicle's";
		}
		else if(cust.equals("All")&& commentList.equals("All") && !(closedVehicle.equals("All")) ){
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and Closed='"+closedVehicle+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
		}else if(cust.equals("All")&& !(commentList.equals("All")) && closedVehicle.equals("All") ){
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and SpComment='"+commentList+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
		}else if(!(cust.equals("All"))&& commentList.equals("All") && closedVehicle.equals("All") ){
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and Transp='"+cust+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
		}else if(!(cust.equals("All"))&& commentList.equals("All") && !(closedVehicle.equals("All")) ){
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and Transp='"+cust+"' and Closed='"+closedVehicle+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
		}else if(!(cust.equals("All"))&& !(commentList.equals("All")) && closedVehicle.equals("All") ){
			sql1="select * from t_techspecialrep where cmmt_type='Vehicle' and SpComment='"+commentList+"' and Transp='"+cust+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59'  order by EntDateTime desc ";
		}else
		{
			sql1="select * from t_techspecialrep where Transp = '"+cust+"' and SpComment='"+commentList+"' and Closed='"+closedVehicle+"' and EntDateTime between '"+date4+" 00:00:00' and '"+date5+" 23:59:59' and  cmmt_type='Vehicle' order by EntDateTime desc ";
		}
		datee4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date4));
		datee5=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(date5));
		between="between "+ datee4 + " and " + datee5;
		//System.out.println("sql1============>"+sql1);
		//System.out.println("sql1============>"+sql1);
		rs1=stmt1.executeQuery(sql1);	
%>
		<br></br>
		<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
			<tr>
				<td align="center"> <font color="black" size="2"> <B> <%=cust%> Special Comments (Report and Close Form) <%=between%> </b> </font> </td>
			</tr>
		<tr>
			<td>  <font color="maroon"> If check-box is missing, that means Comment has already been Closed.</font> </td>	
			<td align="right"> <a href="excelspcomment.jsp?radtype=Vehicle&calender4=<%=date4%>&calender5=<%=date5%>&custlist=<%=cust%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>
		</tr>
	</table>
	<br></br>
		<table border="1" align="center" width="750px" class="sortable">
		 	<tr  bgcolor="#BDBDBD">
				<td> </td>
				<td> <div align="center"> <b> Sr.No  </b></div> </td>	
				<td> <div align="center"> <b> Ent Date Time  </b></div> </td>	
				<td> <div align="center"> <b> Veh. No </b></div> </td>
				<td> <div align="center"> <b> Transporter </b></div> </td>
				<td> <div align="center"> <b> Action to be Taken by </b></div> </td>	
				<td> <div align="center"> <b> Sp. Comment  </b></div> </td>	
				<td> <div align="center"> <b> Extra. Comment  </b></div> </td>	
				<td> <div align="center"> <b> Ent. By  </b></div> </td>	
				<td> <div align="center"> <b> Close By  </b></div> </td>	
				<td> <div align="center"> <b> Closing sp. comment  </b></div> </td>	
				<td> <div align="center"> <b> Closing extra comment  </b></div> </td>	
			</tr>
<%
////System.out.println("&&&&&&&&&&&&&&&&&7");	
while(rs1.next())
	{
		////System.out.println("skhsghdflghldfkglkfgjsdlkgjslkdgjsdklgjsdglk");
		String sql2="select * from t_vehicledetails where VehicleRegNumber='"+rs1.getString("VehRegNo")+"' ";
	//	//System.out.println("sql2============>"+sql2);
		ResultSet rs2=stmt2.executeQuery(sql2);
	//	//System.out.println("sql2============>"+sql2);
		if(rs2.next())
		{
			transp=rs2.getString("OwnerName");
		}
 %>
		<tr>
			<td>
<%
		if(rs1.getString("Closed").equals("Yes"))
		{
		}
		else
		{ %>

			 <div align="center">  <input type="checkbox" name="vehdel<%=k1%>" id="vehdel<%=k1%>" /> </div> 
			 <input type="hidden" name="vehid<%=k1%>" id="vehid<%=k1%>" value="<%=rs1.getString("SrNo")%>" />  </td>
<%		k1++;} %>
			<td> <div align="center"> <%=k%> </div>
	
			</td>
			<td><div align="center"> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("EntDateTime")))%> </div></td>
			
			<td> <div align="center"><%=rs1.getString("VehRegNo")%> </div></td>
			<td> <div align="center"><%=transp%> </div></td>
			<td> <div align="center"><%=rs1.getString("ActionToBeTakenBy")%> </div></td>
		
			<td> <div align="center"><%=rs1.getString("SpComment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("Extra_comment")%> </div></td>
			<td> <div align="center"><%=rs1.getString("EntBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("CloseBy")%> </div></td>
			<td> <div align="center"><%=rs1.getString("ClosingSpComment")%> </div></td>
			<td> <div align="center"><% if(rs1.getString("ClosingExtra_comment")==null){%>-<%}else{ %><%=rs1.getString("ClosingExtra_comment")%> <%} %></div></td>
		</tr>
<%	
		k++;
		
	}
%>
		<tr  bgcolor="#BDBDBD">
			<td colspan="12"> <div align="center"><input type="hidden" name="vehcntr" id="vehcntr" value="<%=k1%>" /> <input type="button" name="vehdelete" value="Close" class="formElement" onclick="onDelete('Veh')"/> </div> </td>
		</tr>
		</table>	
<%	}
%>
	


<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	con2.close();
}
%>
<!-- code end here --->
</form>
 	<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
