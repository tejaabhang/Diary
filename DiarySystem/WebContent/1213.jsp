<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con;
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

	if(document.spcomment.type[0].checked==true)
	{
		var comm=document.getElementById("techcomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments");
			return false;
		}
	}

	if(document.spcomment.type[1].checked==true)
	{
		var comm=document.getElementById("unitcomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments");
			return false;
		}
	}
	if(document.spcomment.type[2].checked==true)
	{
		var comm=document.getElementById("vehiclecomment").value;
		if(comm=="")
		{
			alert("Please Enter Comments");
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
function showType(id)
{
	if(id==0)
	{
		document.getElementById("techrow").style.display="";
		document.getElementById("techtable").style.display="";
		document.getElementById("unitrow").style.display="none";
		document.getElementById("unittable").style.display="none";
		document.getElementById("vehiclerow").style.display="none";
		document.getElementById("vehicletable").style.display="none";
		
		
	}
	else if(id==1)
	{
		document.getElementById("unitrow").style.display="";
		document.getElementById("unittable").style.display="";
		document.getElementById("techrow").style.display="none";
		document.getElementById("techtable").style.display="none";
		document.getElementById("vehiclerow").style.display="none";
		document.getElementById("vehicletable").style.display="none";
	}
	else if(id==2)
	{
		document.getElementById("vehiclerow").style.display="";
		document.getElementById("vehicletable").style.display="";
		document.getElementById("unitrow").style.display="none";
		document.getElementById("unittable").style.display="none";
		document.getElementById("techrow").style.display="none";
		document.getElementById("techtable").style.display="none";
	}
}
function onSubmit(rid,index,type)
{
	//alert(rid+type);
	var url="updatecmmnt.jsp";
	document.spcomment1.action=url+"?rid="+rid+"&type="+type+"&index="+index;
	document.spcomment1.submit();
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
<form name="spcomment" method="get" action="spcommentinsrt.jsp" onSubmit="return validate();">
<%
try
{
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
//	con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement();
	
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";
	String result=request.getParameter("result");

	String comment=request.getParameter("comment");
	
%>
	<input type="hidden" name="commentfor" value="<%=comment%>" />
	
<%
	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
			</tr>
		</table>
<% 	}
	if(result==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
			<tr>	
				<td align="center"> <font color="maroon"> Comment <%=result %> Successfully</font> </td>
			</tr>
		</table>
<% 	}


	%>


<table border="0" width="750px" >
		<tr>
			<td align="left"> <input type="radio" name="type" value="Tech" checked onClick="showType(0);"><font color="maroon">Tech</font></input> &nbsp;&nbsp;&nbsp;
					<input type="radio" name="type" value="Unit" onClick="showType(1);"><font color="maroon">Unit</font></input>
					<input type="radio" name="type" value="Vehicle" onClick="showType(2);"><font color="maroon">Vehicle</font></input>
					
			 </td>
		</tr>
		<tr>
			<td align="center"> <font color="maroon" size="2"> <B> Enter Special Comments  </b> </font> </td>
		</tr>
	</table>

<table border="0" width="750px">
<tr> <td align="center">
		<table border="10" width="350px">
		<tr id="techrow" >  

				<td align="center"> <font color="maroon"> Techinician Comment</font> </td>
				<td align="left"><input type="text" name="techcomment" id="techcomment"></input>  </td>

			</tr>
		 
<!-- This row wont be visible. This row will come when Unit id radio button will be clicked-->
			<tr id="unitrow" style="display:none">
				<td align="center"> <font color="maroon"> Unit Comment </font> </td>
				<td> <input type="text" name="unitcomment" id="unitcomment"  value="" /> </td>
			</tr>
			<tr id="vehiclerow" style="display:none">
				<td align="center"> <font color="maroon"> Vehicle Comment </font> </td>
				<td> 
				<input type="text" name="vehiclecomment" id="vehiclecomment"  value=""></input>
				
				 </td>
			</tr>
			<tr><td colspan="2" align="center"> 
				<input type="submit" name="submit" value="ADD"></input>
				
				 </td></tr>
		
		</table>
</td> </tr> </table> 
</form>
<form name="spcomment1" method="post" action="">
<br></br><div id="techtable" name="techtable">
<table class="sortable" width="500"  >
<tr><td class="sorttable_nosort"><input type="checkbox" name="maintech" id="maintech" onClick="CheckUncheckAll();"></input></td>
<td><div align="center"> <B> Sr.No </B> </div> </td>
<td><div align="center"> <B> Comment </B></div></td> 
<td>&nbsp;</td></tr>
<%String que="Select * from t_commentlist where Modulename='DiarySystem' and Listname='Technician'";
ResultSet rst=stmt1.executeQuery(que);
int i=1;
while(rst.next())
{
	%>
	
	<tr><input type="hidden" name="techrid<%=i%>" id="techrid<%=i%>" value="<%=rst.getString("Rid")%>" ></input>
							<td><input type="checkbox" name="chktech<%=i %>" id="chktech<%=i%>"></input></td>
							<td><%=i %></td>
	<td><div id="comm<%=i %>"><%=rst.getString("Comment") %></div><input type="text" name="comment<%=i %>" id="comment<%=i%>" value="<%=rst.getString("Comment") %>" style="display:none"></input></td>
	<td><input type="button" name="edit<%=i %>" id="edit<%=i %>" value="Edit" onclick="activate('<%=i %>');"  ></input>
	<input type="submit" name="btnsubmit<%=i %>" id="btnsubmit<%=i %>" value="Submit" onclick="onSubmit('<%=rst.getString("Rid") %>','<%=i%>','Tech')" style="display:none" ></input></td>
	</tr>
	<%
	i++;
}
%>
<input type="hidden" name="techcntr" id="techcntr" value="<%=i %>"></input>
<tr><td colspan="4"><input type="hidden" name="techcntr" id="techcntr" value="<%=i %>"></input>
<input type="button" value="Delete" name="techdelete" id="techdelete" onclick="onDelete('Tech')"></input></td></tr></table></div>
<div id="unittable" name="unittable" style="display: none">
<table class="sortable" width="500"  >
<tr><td class="sorttable_nosort"><input type="checkbox" name="mainunit" id="mainunit"  onClick="CheckUncheckAll1();"></input></td>
<td><div align="center"> <B> Sr.No </B> </div> </td>
<td><div align="center"> <B> Comment </B></div> </td>
<td>&nbsp;</td></tr>
<%String que1="Select * from t_commentlist where Modulename='DiarySystem' and Listname='Unit'";
ResultSet rst1=stmt2.executeQuery(que1);
int j=1;
while(rst1.next())
{
	%>
	
	<tr><input type="hidden" name="unitrid<%=j%>" id="unitrid<%=j%>" value="<%=rst1.getString("Rid")%>" ></input>
							<td><input type="checkbox" name="chkunit<%=j %>" id="chkunit<%=j%>"></input></td>
							<td><%=j %></td>
<td><div id="comm1<%=j %>"><%=rst1.getString("Comment") %></div><input type="text" name="comment1<%=j %>" id="comment1<%=j%>" value="<%=rst1.getString("Comment") %>" style="display:none"></input></td>
	<td><input type="button" name="edit1<%=j %>" id="edit1<%=j %>" value="Edit" onclick="activate1('<%=j %>');"  ></input>
	<input type="submit" name="btnsubmit1<%=j %>" id="btnsubmit1<%=j %>" value="Submit" onclick="onSubmit('<%=rst1.getString("Rid") %>','<%=j%>','Unit')" style="display:none" ></input></td>

	
	</tr>
	<%
	j++;
}
%>
<input type="hidden" name="unitcntr" id="unitcntr" value="<%=j %>"></input>
<tr><td colspan="4"><input type="button" value="Delete" name="vehdelete" onclick="onDelete('Unit')"></input></td></tr>
</table></div>
<div id="vehicletable" name="vehicletable" style="display: none">
<table class="sortable" width="500" >
<tr><td class="sorttable_nosort"><input type="checkbox" name="mainveh" id="mainveh"  onClick="CheckUncheckAll2();"></input></td>
<td><div align="center"> <B> Sr.No </B> </div> </td>
<td><div align="center"> <B> Comment </B></div> </td>
<td>&nbsp;</td></tr>
<%String que2="Select * from t_commentlist where Modulename='DiarySystem' and Listname='Vehicle'";
ResultSet rst2=stmt3.executeQuery(que2);
int k=1;
while(rst2.next())
{
	%>
	
	<tr><input type="hidden" name="vehrid<%=k%>" id="vehrid<%=k%>" value="<%=rst2.getString("Rid")%>" ></input>
							<td><input type="checkbox" name="chkveh<%=k %>" id="chkveh<%=k%>"></input></td>
							<td><%=k %></td>
	<td><div id="comm2<%=k %>"><%=rst2.getString("Comment") %></div><input type="text" name="comment2<%=k %>" id="comment2<%=k%>" value="<%=rst2.getString("Comment") %>" style="display:none"></input></td>
	<td><input type="button" name="edit2<%=k %>" id="edit2<%=k %>" value="Edit" onclick="activate2('<%=k %>');"  ></input>
	<input type="submit" name="btnsubmit2<%=k %>" id="btnsubmit2<%=k %>" value="Submit" onclick="onSubmit('<%=rst2.getString("Rid") %>','<%=k%>','Vehicle')" style="display:none" ></input></td>


	
	</tr>
	<%
	k++;
}
%>


<tr><td colspan="4"><input type="hidden" name="vehcntr" id="vehcntr" value="<%=k %>"></input>
<input type="button" value="Delete" name="vehdelete" onclick="onDelete('Veh')"></input></td></tr>

</table></div></form>

<%
//close of else
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->

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
