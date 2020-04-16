<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1,con;
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

	var commentfor=document.techspcomment.commentfor.value;

	if(commentfor=="veh")
	{
		var comment=document.techspcomment.spcomment.value;
		
		if(comment=="Select")
		{
			alert("Please Select Comments");
			return false;
		}
	}
	else
	{
	
		var tech=document.techspcomment.tech.value;
		var unitid=document.techspcomment.unitid.value;	
		var unitcomment=document.techspcomment.unitcomment.value;
		var techcomment=document.techspcomment.techcomment.value;
		var rep=document.techspcomment.replist.value;
		

		if(document.techspcomment.type[0].checked==true)
		{
			if(tech=="Select")
			{	
				alert("Please select Technician from the list");
				return false;
			}
			if(techcomment=="Select")
			{
				alert("Please Select Comments");
				return false;
			}
		}
	
		if(document.techspcomment.type[1].checked==true)
		{
			if(unitid=="")
			{	
				alert("Please enter Unit Id from the list");
				return false;
			}
			if(unitcomment=="Select")
			{
				alert("Please Select Comments");
				return false;
			}
			//alert(unitid);
			if(unitid=="-"){
				alert("UnitID - is not allowed.Please enter valid UnitID");
			}
		}
			
		

		if(rep=="Select")
		{
			alert("Please Select Representative Name");
			return false;
		}

		
		return true;
	}		
}	

function showType(id)
{
	if(id==0)
	{
		document.getElementById("techrow").style.display="";
		document.getElementById("techrow333").style.display="";
		document.getElementById("unitrow").style.display='none';
		document.getElementById("unitrow1").style.display='none';
		document.getElementById("unitrow2").style.display='none';
		document.getElementById("unitrow22").style.display='none';
		document.getElementById("unitrow3").style.display='none';
		document.getElementById("techrow33").style.display="";
		document.getElementById("unitrow33").style.display='none';
		document.getElementById("unitrow333").style.display='none';
		document.getElementById("unitrow3333").style.display='none';
		document.getElementById("unitrow33333").style.display='none';
	}
	else
	{
		document.getElementById("techrow").style.display="";
		document.getElementById("unitrow").style.display="";
		
		document.getElementById("unitrow1").style.display="";
		document.getElementById("unitrow2").style.display="";
		document.getElementById("unitrow22").style.display="";
		document.getElementById("unitrow3").style.display="";
		document.getElementById("unitrow33").style.display="";
		document.getElementById("unitrow333").style.display="";
		document.getElementById("unitrow3333").style.display="";
		document.getElementById("unitrow33333").style.display="";
		document.getElementById("techrow33").style.display='none';
		document.getElementById("techrow333").style.display='none';
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
<form name="techspcomment" method="get" action="techspcommentinsrt.jsp" onSubmit="return validate();">
<%
try
{
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
//	con=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement();
	
	ResultSet rs1=null, rs2=null;
	String sql1="", sql2="";

	String comment=request.getParameter("comment");
	String  tid=request.getParameter("tid"); 
	
	String  vid=request.getParameter("vid"); 
	String  transp=request.getParameter("transporter"); 
	System.out.println(">>>tid<<<"+tid);
	System.out.println(">>>transp<#####<<"+transp);
	
	
	if(para!=null && para.equalsIgnoreCase("tech"))
	{
%>
<input type="hidden" name="parameter" value="<%=para%>" />
<%} %>
	<input type="hidden" name="commentfor" value="<%=comment%>" />
	<input type="hidden" name="tid" value="<%=tid%>" />
	<input type="hidden" name="vid" value="<%=vid%>" />
				<input type="hidden" name="transporter" value="<%=transp%>" />
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
%>
	
<%

if(comment.equals("veh"))
{ 
	String veh=request.getParameter("vehno");
%>
<input type="hidden" name="veh" value="<%=veh%>" />
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="3"><div align="center">
				<font color="#2A0A12" ><b>Special Comment for <%=veh%> </b></font>
			</div></td>
		</tr>
		<tr bgcolor="#BDBDBD"> 
			<td align="center">
		 		<font color="black"><b> Comment</b> </font> 
		 	</td>
			<td>
<%
			String que="select Comment from t_commentlist where Modulename='DiarySystem' and Listname='Vehicle' order by Comment";
			ResultSet rsget=stmt2.executeQuery(que);
%>
			<select name="spcomment" id="spcomment">
				<option value="Select">Select</option>
<%
				while(rsget.next())
				{
%>
				<option value="<%=rsget.getString("Comment") %>"><%=rsget.getString("Comment") %></option>
<%
				}
%>
			</select>
		</tr>
		<tr bgcolor="#BDBDBD">		
			<td align="center"> <font color="black"><b>Extra Comment</b> </font> </td>
			<td><textarea name="extracomment" id="extracomment"></textarea></td>
		</tr>
<%
		sql2="select distinct(Name) as uname from t_admin where URole='service' and Name not like '% del' order by Name asc ";
		rs2=stmt1.executeQuery(sql2);
%>
		<tr bgcolor="#BDBDBD">		
			<td align="center"> <font color="black"><b> Action to be taken by</b> </font> </td>
			<td> 
				<select name="replist">
					<option value="Select">Select</option>
<%
					while(rs2.next())
					{
%>
					<option value="<%=rs2.getString("uname")%>"><%=rs2.getString("uname")%> </option>
<%
					}			
%>
			    </select>
			 </td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td align="center"><font color="black"><b>Visible in diary</b></font></td>
			<td>
				<input type="checkbox" name="visible" value = "Yes">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" />
			<input type="hidden" name="tid" value="<%=tid%>" />
			<input type="hidden" name="vid" value="<%=vid%>" />
				<input type="hidden" name="transporter" value="<%=transp%>" />
			
			
			 </td>
		</tr>
	</table>

<%}
else
{
	sql1="select distinct(TechName) as TechName from t_techlist where Available='Yes' order by TechName asc ";
	rs1=stmt1.executeQuery(sql1);
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td align="center"> <font color="black" size="2"> <B> Special Comments </b> </font> </td>
		</tr>
		<tr>
			<td align="center"> 
				<input type="radio" name="type" value="Tech" checked onClick="showType(0);">
					<font color="black"><b>Tech</b></font> &nbsp;&nbsp;&nbsp;
				<input type="radio" name="type" value="Unit" onClick="showType(1);">
					<font color="black"><b>Unit</b></font>
			 </td>
		</tr>
		
	</table>

<br></br>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		 	<tr id="techrow"  bgcolor="#BDBDBD">  

				<td align="left"> <font color="black"> <b>Tech:</b></font> </td>
				<td align="left"> 
					<select name="tech" onChange="GetLocForTech();">
						<option value="Select">Select</option>
<%
				while(rs1.next())
				{ 
	
%>
						<option value="<%=rs1.getString("TechName")%>"><%=rs1.getString("TechName")%></option>		
<%	
				}
%>
					</select> 
				</td>
			</tr>
<!-- This row wont be visible. This row will come when Unit id radio button will be clicked-->
			<tr id="unitrow33333" style="display: none"  bgcolor="#BDBDBD">
  				<td align="left"> <font color="black"> <b>Location Name:</b> </font> </td>
  				<td>
	  				 <select name="locname">
             			 <option value="Select">Select</option>
<%
							String sql="select Distinct(LName) from t_location order by LName";
  							ResultSet rst2=stmt1.executeQuery(sql);
  							while(rst2.next())
  							{ 
%>
    					 <option value="<%=rst2.getString("LName") %>"> <%=rst2.getString("LName") %> </option>
<% 
							} 
%>
     
	    			</select>
		
				</td>
   			</tr>
<%
			String tm="";
			java.util.Date td =new java.util.Date();
			Format fmt = new SimpleDateFormat("yyyy-MM-dd");
			String sdt = fmt.format(td);
			tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();
%>
			<tr id="unitrow3333" style="display: none"  bgcolor="#BDBDBD">
      			 <td align="left"> <font color="black"><b>Testing Date & Time:</b> </font> </td>
      			 <td> <input type="text" id="calender" name="calender" size="13"  value=<%=sdt%>>
         			   <script type="text/javascript">
				              Calendar.setup(
				              {
				                inputField  : "calender",         // ID of the input field
				                ifFormat    : "%Y-%m-%d",     // the date format
				                button      : "trigger"       // ID of the button
				              }
           					 );
          			  </script>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="rtime" size="10" value="<%=tm%>" >
   				</td>
 			</tr>
			<tr id="unitrow" style="display:none"  bgcolor="#BDBDBD">
				<td align="left"> <font color="black"> <b>Unit Id</b> </font> </td>
				<td> <input type="text" name="unitid"/> </td>
			</tr>
			<tr id="unitrow1" style="display:none" bgcolor="#BDBDBD">
				<td align="left"> <font color="black"><b> Red Light Status</b> </font> </td>
				<td> <input type="radio" name="redlight" value="On" checked>On
				<input type="radio" name="redlight" value="Off">Off
				
				 </td>
			</tr>
			<tr id="unitrow2" style="display:none" bgcolor="#BDBDBD">
				<td align="left"> <font color="black"> <b>Green Light Status </b></font> </td>
				<td> <input type="radio" name="greenlight" value="Stable" checked>Stable
				<input type="radio" name="greenlight" value="Blinking">Blinking
				<input type="radio" name="greenlight" value="Off">Off
				 </td>
			</tr>
			<tr id="unitrow22" style="display:none" bgcolor="#BDBDBD">
				<td align="left"> <font color="black"><b>GPS Blue Light Status</b>  </font> </td>
				<td> <input type="radio" name="gpslight" value="Stable" checked>Stable
				<input type="radio" name="gpslight" value="Blinking">Blinking
				<input type="radio" name="gpslight" value="Off">Off
				 </td>
			</tr>
			
			<tr id="unitrow3" style="display:none" bgcolor="#BDBDBD">
				<td align="left"> <font color="black"><b> Ringing </b></font> </td>
				<td> <input type="radio" name="ringing" value="Yes" checked>Yes
				<input type="radio" name="ringing" value="No">No
				 </td>
			</tr>
			
			<tr id="unitrow33" style="display: none" bgcolor="#BDBDBD">		
				<td align="left"> <font color="black"><b> Comment </b></font> </td>
				<%String que="select Comment from t_commentlist where Modulename='DiarySystem' and Listname='Unit'";
				ResultSet rsget1=stmt3.executeQuery(que);
				%>
				<td><select name="unitcomment" id="unitcomment">
				<option value="Select">Select</option>
				<%while(rsget1.next()) 
				{%>
				<option value="<%=rsget1.getString("Comment") %>"><%=rsget1.getString("Comment") %></option>
				<%} %>
				</select>
				<!--  <textarea name="spcomment" class="formElement"> </textarea>  --></td>
			</tr>
			
			<tr id="unitrow333" style="display: none" bgcolor="#BDBDBD">		
				<td align="left"> <font color="black"><b>Extra Comment</b> </font> </td>
				<td><textarea name="unitextracomment" id="unitextracomment" ></textarea></td>
			</tr>
			
			<tr id="techrow33"  bgcolor="#BDBDBD">		
				<td align="left"> <font color="black"> <b>Comment</b> </font> </td>
				<%String que1="select Comment from t_commentlist where Modulename='DiarySystem' and Listname='Technician'";
				ResultSet rsget2=stmt4.executeQuery(que1);
				%>
				<td><select name="techcomment" id="techcomment">
				<option value="Select">Select</option>
				<%while(rsget2.next()) 
				{%>
				<option value="<%=rsget2.getString("Comment") %>"><%=rsget2.getString("Comment") %></option>
				<%} %>
				</select>
				<!--  <textarea name="spcomment" class="formElement"> </textarea>  --></td>
			</tr>
			
			<tr id="techrow333" bgcolor="#BDBDBD">		
				<td align="left"> <font color="black"><b>Extra Comment</b> </font> </td>
				<td><textarea name="techextracomment" id="techextracomment"></textarea></td>
				</tr>
<%
				sql2="select distinct(Name) as uname from t_admin where URole='service' order by Name asc ";
				rs2=stmt1.executeQuery(sql2);
%>
			<tr  bgcolor="#BDBDBD">		
				<td align="left"> <font color="black"> <b>Action to be taken by </b></font> </td>
				<td> <select name="replist">
					<option value="Select">Select</option>
<%
			while(rs2.next())
			{%>
				<option value="<%=rs2.getString("uname")%>"><%=rs2.getString("uname")%> </option>
<%			}			
%>
				     </select>
				 </td>
			</tr>
			
			
 
			<tr>
				<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit"  class="formElement" /> 
				<input type="hidden" name="tid" value="<%=tid%>" />
				<input type="hidden" name="vid" value="<%=vid%>" />
				<input type="hidden" name="transporter" value="<%=transp%>" />
				
				</td>
			</tr>
		</table>
<%
} //close of else
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