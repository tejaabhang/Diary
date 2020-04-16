<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
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
<script type="text/javascript">




</script>
<script type="text/javascript">


/**
 * DHTML email validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */
function validate()
{
	 var servprov=document.servprovider.dropdown.value;
	 var value=document.servprovider.value.value; 
	   if(servprov=="Select")
	   {
		 alert("Please Select drop down value");
		 return false;
	   }
	   if(value=="" || value==null)
	   {
		   alert("Please Enter value");
		  // mail.focus();
			 return false;
	   }
	  

		  var ans=confirm("Do you want to submit");
		  if(ans==true)
			 return true;
		  else
			 return false;
	
	 
}

function cancel()
{
	document.servprovider.reset();
	
	
}
</script>
<script type="text/javascript">
function activate(index)
{
	//alert("hello");
	//alert(document.getElementById("btnsubmit"+index).value);
	document.getElementById("btnsubmit"+index).style.display="block";
	document.getElementById("value"+index).style.display="none";
	document.getElementById("value1"+index).style.display="block";
	document.getElementById("edit"+index).style.display="none";
	
}

function onDelete(type)
{
	//alert(type);
	var rid="";
	var flag=false;
			var cntr=document.getElementById("cntr").value;
	
		var i=1;
	
			for(i=1;i<cntr;i++)
			{
//alert("in for loop");
//alert(document.getElementById("chk"+i).checked);
		//		alert(document.getElementById("chktech"+i).checked);
				if(document.getElementById("chk"+i).checked==true)
				{
				//	alert("inside if true");
					flag=true;
					//alert(document.getElementById("rid"+i).value);
					rid=rid+document.getElementById("rid"+i).value+",";
					//alert(rid);
				}
				
			}

			if(flag==false)
			{ alert("Please Select atleast one Checkbox");
				return false;
			}
			//alert(rid);
			var msg=confirm("Do you want to Delete the records");
			if(msg==true)
			{
			var url="AddDropDownInsert.jsp";
			document.servprovider1.action=url+"?&totrid="+rid+"&type=delete";
			document.servprovider1.submit();
			}
			else
			{
				return false;
			}
			//alert(flag);
			
	}

function onSubmit(rid,index)
{
//	alert(rid+index);
	 var mail=document.getElementById("value1"+index); 
//	 alert(mail.value);
	 var valueChanged=document.getElementById("value1"+index).value;
//	 alert(valueChanged);
	// var dropdown=document.getElementById("dropdown"+index).value; 
	// alert(dropdown);
//	 var value=document.getElementById("value"+index).value; 
//	 alert(value);
	 
//	 alert(valueChanged+"---"+values);
	  if(mail.value=="" || mail.value==null)
	   {
		   alert("Please Enter value");
		   mail.focus();
			 return false;
	   }
	  else{
	var msg=confirm("Do you want to submit");
	if(msg==true)
	{
	var url="AddDropDownInsert.jsp";
	document.servprovider1.action=url+"?rid="+rid+"&valueChanged="+valueChanged+"&type=update&index="+index;
	document.servprovider1.submit();
	}
	else
	{
		return false;
	}
}}
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
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	Statement stmt=conn1.createStatement(),stmt1=conn1.createStatement();

		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today=formatter.format(dte);
		
		String result=request.getParameter("result");
		////System.out.println(serviceprovider+ " " +inserted+flag);
%>
<%
if(result==null)
{
	
}
else
{	%>
	 <table border="0" width="750px">
	    <tr> 
	    	<td> 
	    		<div align="center"> 
	    			<font color="maroon" size="1"> <b> <%=result %> Successfully...........</b></font> 
	    		</div> 
	    	</td> 
	    </tr> 
	  </table>

<%}
%>

<form name="servprovider" method="get" action="AddDropDownInsert.jsp" onsubmit="return validate();">
	<div id="simerror" align="center"><font color="marron"></font></div>
		<table border="1"  width="750px">
			<tr>
				<td colspan="4" align="center"><font size="3" color="maroon" >Add or Edit Drop Down values</font></td>
			</tr>
			<tr>
				<td><font color="maroon" ><B>DropDowns:</B></font>
<%						String str="SELECT distinct(`dropdown`) FROM db_CustomerComplaints.t_dropdown";
						ResultSet rst=st2.executeQuery(str);
%>
				</td>
				<td><select name="dropdown" id="dropdown">
						<option value="Select">Select</option>
<%						while(rst.next())
						{
%>
						<option value="<%=rst.getString("dropdown") %>"><%=rst.getString("dropdown") %></option>
<%
						} 
%>
					</select>
				</td>
			</tr>
			<tr> 
				<td>
					<font color="maroon" ><b>Value</b></font>
				</td>
				<td>
					<input type="text" name="value" id="value" class="formElement" size="25"> </input> 
				</td>
			</tr>
	</table>
	<table align="center" width="750px" border=0>
		<tr align="center">
			<td>
				<input type="submit" name="btnsubmit" value="Save"></input>
				<input type="button" name="btncancel" value="Cancel" onclick="cancel();"></input>
			</td>
		</tr>
	</table>
</form>
<br></br>
<form name="servprovider1" method="post" action="">
	<table>
		<tr>
			<td>
				<font color="maroon" ><b>Select drop down:</b></font>
					<select name="dropdown" id="dropdown">
						<option value="ALL" selected>ALL</option>
<%							String que="Select Distinct(dropdown) from db_CustomerComplaints.t_dropdown";
							ResultSet rsget=stmt1.executeQuery(que);
							while(rsget.next())
							{
%>
						<option value="<%=rsget.getString("dropdown") %>"><%=rsget.getString("dropdown") %></option>
<%
							}
%>
					</select>&nbsp;&nbsp;
					<input type="submit" name="btngo" value="GO"></input>
			</td>
		</tr>
	</table>
	<table class="sortable" width="500"  >
		<tr>
			<td class="sorttable_nosort">
				
			</td>
			<td><div align="center"> <B> Sr.No </B> </div> </td>
			<td><div align="center"> <B> Drop Down </B> </div> </td>
			<td><div align="center"> <B> Value</B></div> </td>
			<td>&nbsp;</td>
		</tr>
<%
			String servprov=request.getParameter("dropdown");
			////System.out.println(servprov);
			String que1="";
			if(servprov!=null && servprov.equalsIgnoreCase("ALL"))
			{
				 que1="Select * from db_CustomerComplaints.t_dropdown";
			}
			else if(servprov!=null && !(servprov.equalsIgnoreCase("ALL")))
			{
				 que1="Select * from db_CustomerComplaints.t_dropdown where dropdown='"+servprov+"'";
			}
			else
				 que1="Select * from db_CustomerComplaints.t_dropdown";
			ResultSet rst1=stmt.executeQuery(que1);
			int j=1;
			while(rst1.next())
			{
%>
	
		<tr><input type="hidden" name="rid<%=j%>" id="rid<%=j%>" value="<%=rst1.getString("rowid")%>" ></input>
			<td>
				<input type="checkbox" name="chk<%=j %>" id="chk<%=j%>" ></input>
			</td>
			<td><%=j %></td>
			<td id="dropdown<%=j %>"><div id="dropdown<%=j %>"><%=rst1.getString("dropdown") %></div></td>
			<td>
				<div id="value<%=j %>" value="value<%=j %>"><%=rst1.getString("value") %></div>
				<input type="text" name="value1<%=j %>" id="value1<%=j%>" value="<%=rst1.getString("value") %>" style="display:none" size="35"></input>
				</td>
			<td>
				<input type="button" name="edit<%=j %>" id="edit<%=j %>" value="Edit" onclick="activate('<%=j %>');"  ></input>
				<input type="submit" name="btnsubmit<%=j %>" id="btnsubmit<%=j %>" value="Submit" onclick="return onSubmit('<%=rst1.getString("rowid") %>','<%=j%>')" style="display:none" ></input>
			</td>

	
	</tr>
	<%
	j++;
}
%>

		<tr>
			<td colspan="5">
				<input type="hidden" name="cntr" id="cntr" value="<%=j %>"></input>
				<input type="button" value="Delete" name="vehdelete" onclick="onDelete('Unit');"></input>
			</td>
		</tr>
</table>
</form>
<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
<!-- code end here --->
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>