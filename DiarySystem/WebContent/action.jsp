<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2;
String sql,sql1,username,userrole,today,olddate,thedate,technician,tno,vehregno,comdate,availdate,instdate;
String discription,prvsact;
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
	</head>
<script language="javascript">
function Validate()
{
	var v1=document.techsolf.act.value;
	var v3=document.techsolf.cost.value;
	//alert(v3);
	if(v1.length < 2)	
	{
		alert("Please enter Action by Tech");
		return false;
	}
	//alert(document.techsolf.res[1].checked);
	if(document.techsolf.res[1].checked==true)
	{
		var v2=document.techsolf.actsol.value;

		if(v2=="Select")
		{
			alert("Please select Solution Type");
			return false;
		}
	}
	//alert(v3);
	if(v3==""){
			alert("please enter cost of inspection");
			return false;
		}
	 if(isNaN(v3)||v3.indexOf(" ")!=-1){
    	 alert("Enter numeric value for Days Applied");
         return false; 
         }
     var device=document.techsolf.deviceisfixed.value;
     var gpsplacement=document.techsolf.gpsplacement.value;
     var power=document.techsolf.power.value;
     var jrm=document.techsolf.jrm.value;
     if(device=="Select"){
			alert("Plase select Device is fixed");
			return false;
         }
     if(gpsplacement=="Select"){
			alert("Plase select GPS PLACEMENT");
			return false;
      }
     if(power=="Select"){
			alert("Plase select POWER CONNECTION");
			return false;
      }
     if(jrm=="Select"){
			alert("Plase select JRM/OTHER");
			return false;
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
          
                  <%String para=request.getParameter("parameter");
if(para!=null && para.equalsIgnoreCase("tech"))
{
%>
  <%@ include file="headertech.jsp" %>

<%}
else{%>
                    <%@ include file="header1.jsp" %>
          <%} %>
          
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="techsolf" method="get" action="actioninsert.jsp" OnSubmit="return Validate();">
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

String  tid=request.getParameter("tid"); 
String  vid=request.getParameter("vid"); 
//System.out.println(">>>tid  in action <<<"+tid);
//System.out.println(">>>vid in action<<<"+vid);


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
			<td>  <div align="center"> <font color="maroon"> Successfully Inserted </font></div>  </td>
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
		<td align="center"><font color="maroon"> Contact Person Details </font> </td>		
		<td> <textarea name="contdets" class="formElement" > </textarea> </td>
	</tr>
	
	<tr>
					<td align="center"> <font color="maroon"> Cost of Inspection: </font> </td>
					<td><input type="text" name="cost" value=""/></td>
				</tr>
				<tr>
					<td align="center"> <font color="maroon"> Claim Details: </font> </td>
					<td><textarea name="claimdetails" rows="3" cols="50"> </textarea></td>
				</tr>
				<tr>
					<td align="center"> <font color="maroon">Duration of Closure:</font> </td>
					<td>HH:<select name="hh"> 
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>	
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>	
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>	
							<option value="11">11</option>
							<option value="12">12</option>
		     			</select>
		     			MM: <select name="mm"> 
							<option value="0">0</option>
							<option value="10">10</option>
							<option value="20">20</option>	
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>	
		     			</select></td>
				</tr>
				<tr>
					<td align="center"><font color="maroon" >Device is fixed</font></td>
					<td> 
						<select name="deviceisfixed"> 
							<option value="Select">Select</option>
							<option value="Metal with 4 screws">Metal with 4 screws</option>
							<option value="Plastic with 2 screws">Plastic with 2 screws</option>	
							<option value="No Screws">No Screws</option>
							<option value="Not Fitted Correctly">Not Fitted Correctly</option>
		     			</select>
					</td>
				</tr>
				<tr>
					<td align="center"><font color="maroon" >GPS Placement</font></td>
					<td> 
						<select name="gpsplacement"> 
							<option value="Select">Select</option>
							<option value="With adhesive on dashboard">With adhesive on dashboard</option>
							<option value="Top of device">Top of device</option>	
							<option value="Sticked with Foam Tape on dashboard">Sticked with Foam Tape on dashboard</option>
							<option value="Not Correct at all">Not Correct at all</option>
		     			</select>
					</td>
				</tr>
				<tr>
					<td align="center"><font color="maroon" >Power Connection</font></td>
					<td> 
						<select name="power"> 
							<option value="Select">Select</option>
							<option value="Intact">Intact</option>
							<option value="Loose">Loose</option>	
							<option value="Earth is on Bolt">Earth is on Bolt</option>
		     			</select>
					</td>
				</tr>
				<tr>
					<td align="center"><font color="maroon" >JRM/Other</font></td>
					<td> 
						<select name="jrm"> 
							<option value="Select">Select</option>
							<option value="Fitted and Connectred Correctly">Fitted and Connectred Correctly</option>
							<option value="Installation incorrect">Installation incorrect</option>	
							<option value="No Special Device">No Special Device</option>
		     			</select>
					</td>
				</tr>
	<tr>
	<td align="center"> <font color="maroon"> Result </font> </td>
	<td>
	<input type="radio" name="res" value="Unsolved" onclick="ValidateRad();" checked/> Unsolved<br>
	<input type="radio" name="res" value="Solved" onclick="ValidateRad();"/> Solved
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
		<td> <input type="radio" name="sprep" value="Yes">Yes  &nbsp;&nbsp;&nbsp;
			<input type="radio" name="sprep" value="No" checked>No 
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" Name="Submit" Value="Submit" class="formElement">
	<input type="hidden" name="vid" value="<%=vid%>" />
	<input type="hidden" name="tid" value="<%=tid%>" />
	
	
	</td>
	</div>	
	</tr>
	<%if(para!=null && para.equalsIgnoreCase("tech"))
	{
%>
<input type="hidden" name="parameter" value="<%=para%>" />
<%} %>
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
