<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
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
<script type="text/javascript">




</script>
<script type="text/javascript">


/**
 * DHTML email validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */

function echeck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }

 		 return true;					
	}

function validate()
{
	 var servprov=document.servprovider.serv_prov.value;
	 var mail=document.servprovider.mail; 

	  /*if(isNaN(mobno))
	   {
	     alert("Enter valid Mobile No");
	     return false;
	   } 
	 /* else if(mobno.length<10 || mobno.length>10)
	   {
	     alert("Please enter Ten Digit Mobile No");
	     return false;
	   }*/
	   if(servprov=="Select")
	   {
		 alert("Please Select Service Provider");
		 return false;
	   }
	   else if(mail.value=="" || mail.value==null)
	   {
		   alert("Please Enter E-mail ID");
		   mail.focus();
			 return false;
	   }
	   if (echeck(mail.value)==false){
		   mail.value="";
			   mail.focus();
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
	document.getElementById("mail"+index).style.display="none";
	document.getElementById("mailid"+index).style.display="block";
	document.getElementById("edit"+index).style.display="none";
	
}

function onDelete(type)
{
	//alert(type);
	var rid="";
	var flag=false;
			var cntr=document.getElementById("cntr").value;
		//alert(cntr);
		var i=1;
	
			for(i=1;i<cntr;i++)
			{
				//alert(document.getElementById("chktech"+i).checked);
				if(document.getElementById("chk"+i).checked)
				{
					//alert("inside if true");
					flag=true;
					//alert(document.getElementById("techrid"+i).value);
					rid=rid+document.getElementById("rid"+i).value+",";
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
			var url="addserv_prov_mailid.jsp";
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
	//alert(rid+type);
	 var mail=document.getElementById("mailid"+index); 
	
	  if(mail.value=="" || mail.value==null)
	   {
		   alert("Please Enter E-mail ID");
		   mail.focus();
			 return false;
	   }
	  else if (echeck(mail.value)==false){
		   mail.value="";
			   mail.focus();
		   		return false;
		   	}
	  else{
	var msg=confirm("Do you want to submit");
	if(msg==true)
	{
	var url="addserv_prov_mailid.jsp";
	document.servprovider1.action=url+"?rid="+rid+"&type=update&index="+index;
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
	    <tr> <td> <div align="center"> <font color="maroon" size="1"> <b> <%=result %> Successfully...........</b></font> </div> </td> </tr> </table>

<%}
%>

<form name="servprovider" method="get" action="addserv_prov_mailid.jsp" onsubmit="return validate();">

<div id="simerror" align="center"><font color="marron"></font></div>
<table border="1"  width="750px">
<tr>
<td colspan="4" align="center"><font size="3" color="maroon" >Service Provider Mail-Id Entry Form</font></td>
</tr>
<tr>
<td><font color="maroon" ><B>Service Provider</B></input>
<%String str="SELECT distinct(`Service_provider`) FROM `t_simmaster`";
	ResultSet rst=st2.executeQuery(str);
	

	%>
		
	</td>
	<td><select name="serv_prov" id="serv_prov">
	<option value="Select">Select</option>
	<%while(rst.next())
			{
			%>
	<option value="<%=rst.getString("Service_provider") %>"><%=rst.getString("Service_provider") %></option>
	<%} %>
</select></td>
</tr>
<tr> 
<td><font color="maroon" ><b>Email ID:</b></font></td><td>
<input type="text" name="mail" id="mail" class="formElement" size="25"> </input> 
</td>

</tr>
</table>


<table align="center" width="750px" border=0>
<tr align="center"><td><input type="submit" name="btnsubmit" value="Save"></input><input type="button" name="btncancel" value="Cancel" onclick="cancel();"></input></td></tr>
</table>
</form>
<br></br>

<form name="servprovider1" method="post" action="">
<table>
<tr><td><font color="maroon" ><b>Select Service Provider:</b></font>
<select name="serv_prov" id="serv_prov">
<option value="ALL" selected>ALL</option>
<%String que="Select Distinct(ServiceProvider) from t_serviceprovidermailID";
ResultSet rsget=stmt1.executeQuery(que);
while(rsget.next())
{
%>
<option value="<%=rsget.getString("ServiceProvider") %>"><%=rsget.getString("ServiceProvider") %></option>
<%} %>
</select>&nbsp;&nbsp;
<input type="submit" name="btngo" value="GO"></input></td></tr>
</table>
<table class="sortable" width="500"  >
<tr><td class="sorttable_nosort"><input type="checkbox" name="mainunit" id="mainunit"  onClick="CheckUncheckAll1();"></input></td>
<td><div align="center"> <B> Sr.No </B> </div> </td>
<td><div align="center"> <B> Service Provider </B> </div> </td>
<td><div align="center"> <B> Mail Id </B></div> </td>
<td>&nbsp;</td></tr>
<%
String servprov=request.getParameter("serv_prov");
////System.out.println(servprov);
String que1="";
if(servprov!=null && servprov.equalsIgnoreCase("ALL"))
{
 que1="Select * from t_serviceprovidermailID";
}
else if(servprov!=null && !(servprov.equalsIgnoreCase("ALL")))
{
 que1="Select * from t_serviceprovidermailID where ServiceProvider='"+servprov+"'";
}
else
	 que1="Select * from t_serviceprovidermailID";
ResultSet rst1=stmt.executeQuery(que1);
int j=1;
while(rst1.next())
{
	%>
	
	<tr><input type="hidden" name="rid<%=j%>" id="rid<%=j%>" value="<%=rst1.getString("RID")%>" ></input>
							<td><input type="checkbox" name="chk<%=j %>" id="chk<%=j%>"></input></td>
							<td><%=j %></td>
							<td><%=rst1.getString("ServiceProvider") %></td>
<td><div id="mail<%=j %>"><%=rst1.getString("Mail_Id") %></div><input type="text" name="mailid<%=j %>" id="mailid<%=j%>" value="<%=rst1.getString("Mail_Id") %>" style="display:none" size="35"></input></td>
	<td><input type="button" name="edit<%=j %>" id="edit<%=j %>" value="Edit" onclick="activate('<%=j %>');"  ></input>
	<input type="submit" name="btnsubmit<%=j %>" id="btnsubmit<%=j %>" value="Submit" onclick="return onSubmit('<%=rst1.getString("RID") %>','<%=j%>')" style="display:none" ></input></td>

	
	</tr>
	<%
	j++;
}
%>
<input type="hidden" name="cntr" id="cntr" value="<%=j %>"></input>
<tr><td colspan="5"><input type="button" value="Delete" name="vehdelete" onclick="onDelete('Unit')"></input></td></tr>
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