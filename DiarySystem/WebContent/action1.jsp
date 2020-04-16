<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2;
String sql,sql1,username,userrole,today,olddate,thedate,technician,tno,vehregno,comdate,availdate,instdate;
String discription,prvsact;
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
	</head>
<script language="javascript">
function Validate()
{
	var v1=document.techsolf.act.value;

	if(v1.length < 2)	
	{
		alert("Please enter Action by Tech");
		return false;
	}

	if(document.techsolf.res[1].checked==true)
	{
		var v2=document.techsolf.actsol.value;

		if(v2=="Select")
		{
			alert("Please select Solution Type");
			return false;
		}
	}

	return true;
}

function ValidateRad()
{
	var found_it; //initial value is null because we gave it no other value
	for (i=0; i<document.techsolf.res.length; i++)  
	{
		if (document.techsolf.res[i].checked) 
		{
			found_it = document.techsolf.res[i].value ;//set found_it equal to checked button's value
                }
	} 

	if(found_it=="Solved") //If 'Vehicle' is checked List of vehicle will be visible in Drop down box
	{           
      		document.forms.techsolf.actsol.style.visibility = 'visible'; 
       		document.forms.techsolf.calender.style.visibility = 'visible'; 
		document.forms.techsolf.trigger.style.visibility = 'visible'; 
       	}
         else
	{
       		document.forms.techsolf.actsol.style.visibility = 'hidden';
		document.forms.techsolf.calender.style.visibility = 'hidden';
       		document.forms.techsolf.trigger.style.visibility = 'hidden';
      		document.forms.techsolf.t1.style.visibility = 'hidden';
        	document.forms.techsolf.calender.value = '';
  	      	document.forms.techsolf.t1.value = '';
	} 

}
</script>
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
<form name="techsolf" method="get" action="actioninsert1.jsp" OnSubmit="return Validate();">
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
tno=request.getParameter("tno");
technician=request.getParameter("tech");
vehregno=request.getParameter("vehno");
String thedate=request.getParameter("d1");
String thedate1=request.getParameter("d2");
if(thedate==null && thedate1==null)
{
	thedate=today;
	thedate1=today;
}
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();

	String vehattadd="";

	sql="select * from t_complaints1 where Tno='"+tno+"'";
	ResultSet rst=st.executeQuery(sql);
	if(rst.next())
	{
		comdate=rst.getString("TdyDate");
		availdate=rst.getString("VehAvailDate");
		discription=rst.getString("CDescription");
	}
	%>

<%
	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px">
		  <tr>
			<td> <font color="maroon"> <div align="center"> Successfully Inserted</div> </font> </td>
		  </tr>
		</table>
<%
	}
%>
	<table border="10" width="750px">
	<tr>
		<td colspan="2" align="center"> <font color="maroon" size="2"> <B> Action by Technician (<%=technician%>) </B> </font> </td>
	</tr>
	<tr>
	<td align="center"> <font color="maroon"> Ticket No  </font> </td>
	<td> <B> <%=tno%> </B> </td>
	</tr>
	<tr>
	<td  align="center"> <font color="maroon"> Unit in Warranty </font> </td>
	<td>
	<%
		sql="select InstDate from t_unitreplacement where VehRegNo = '"+vehregno+"' order by InstDate asc limit 1";
		ResultSet rst1=st2.executeQuery(sql);
		if(rst1.next())
		{
			instdate=rst1.getString("InstDate");
		}	
		sql="select (TO_DAYS('"+comdate+"')-TO_DAYS('"+instdate+"'))";
		ResultSet rst3=st1.executeQuery(sql);
		if(rst3.next())
			{
				int ww=rst3.getInt(1);
				if(ww <365)
				{
					out.print("Yes");
				}
				else
				{
					out.print("<font color='red' size='2'>No</font>");
				}
			}
			else
			{
			out.print("-");
			}
			
	%>	
	</td>
	</tr>
<%
	String unitid="";
	String sql4="select * from t_vehicledetails where VehicleRegNumber='"+vehregno+"' ";
	ResultSet rs4=st2.executeQuery(sql4);
	if(rs4.next())
	{
		unitid=rs4.getString("UnitId");
	}
%>
	<tr>
		<td align="center"> <font color="maroon"> Vehicle No. / Unit Id</font> </td>
		<td> <%=vehregno%> / <%=unitid%> </td>

	</tr>
	<tr>
	<td align="center"> <font color="maroon">  Description of a Complaint </font> </td>
	<td><%=discription%>  
	</td>
	</tr>
	<tr>
	<td align="center"> <font color="maroon"> Previous Action </font> </td>
	<td>
		<%
sql="select * from t_complaints1 where Tno='"+tno+"' ";

ResultSet rst4=st1.executeQuery(sql);

if(rst4.next())
 {
   prvsact=rst4.getString("Action"); 
   vehattadd=rst4.getString("VehAttLoc"); 	
 }
 if(null==prvsact || prvsact.equals("null"))
 {
     prvsact="NA";
 }  
 
%>	
<%=prvsact %>
<input type="hidden" name="presaction" value="<%=prvsact%>">
	</td>
	</tr>
	<tr>
	<td align="center"> <font color="maroon"> Action </font> </td>
	<td> <textarea name="act" rows="3" cols="50"> </textarea> </td>
	</tr>
	<tr>
	<td align="center"> <font color="maroon"> Hidden Comment about Complaint </font> </td>
	<td><textarea name="hidcmnt" rows="3" cols="50"> </textarea></td>
	</tr>
	<tr>
	<td align="center"> <font color="maroon"> Result </font> </td>
	<td>
	<input type="radio" name="res" value="Unsolved" onclick="ValidateRad();" checked/> Unsolved<br><input type="radio" name="res" value="Solved" onclick="ValidateRad();"/> Solved
	<select name="actsol" style="visibility:hidden" onChange="OnChangeFunc(this);" class="formElement">
		<option value="Select">Select</option>
       <% sql="select Name as v2 from t_solvedlist order by v2 asc";
				ResultSet rst5=st1.executeQuery(sql);
				while(rst5.next())
				{
					%>
          <option value='<%=rst5.getString("v2")%>'> <%=rst5.getString("v2")%>   </option>  
         <%  
				}	
	
	%>	
	</select>

	<input type="hidden" name="vehattadd" value="<%=vehattadd%>">
	<input type="hidden" name="technician" value="<%=technician%>">
	<input type="hidden" name="alocdate" value="<%=comdate%>">
	<input type="hidden" name="tno" value="<%=tno%>">	
	
	
	<input type="hidden" name="thedate" value="<%=thedate%>">
	<input type="hidden" name="thedate1" value="<%=thedate1%>">
	
	
	</td>
	</tr>
	<tr>
		<td align="center"> <font color="maroon"> Special Report </font> </td>
		<td> <input type="radio" name="sprep" value="Yes">Yes </input> &nbsp;&nbsp;&nbsp;
			<input type="radio" name="sprep" value="No" checked>No </input>
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="Submit" Name="Submit" Value="Submit" class="formElement"></td>
	</div>	
	</tr>
	
	</table>	
	
	
	</form>
	<%
	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		
<table border="0" width="750px" height="350px">
<tr><td></td></tr>
</table>
<!-- code end here --->

 		</div>
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
