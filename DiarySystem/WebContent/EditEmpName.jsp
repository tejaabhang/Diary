<%-- 
    Document   : EditEmpName.jsp
    Created on : April 13, 2010, 13:19:52
    Author     : Ayaz A.
    Discroption: Page To Add or Edit The Employee Name And Code For Castrol Emp Vehicles and will update in t_vehjicledetails Table 
    last updated : 
--%>



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
	try
	{
	//alert("Hiiiiii");
	var v1=document.addgrpform.owner.value;
	var v2=document.addgrpform.vehcles.value;
	//alert(v2);
	
	if(v1=="Select")
	{	
		alert("Select Transporter");
		return false;
	}
	else if(v2=="Select")
	{
		alert("Select Vehicle");
		return false;
	}
	else	
	{
		if(document.addgrpform.extAll.checked)
		{
			var v3 = document.addgrpform.email.value;
			if(v3.length=="")
			{
				
			}
			else
			{
				var sss=validateEmail(v3);
				if(!sss)
				{
				    //alert(sss);
					alert("Please enter valid email id");
					return false;
				} 	
			}

			var v4 = document.addgrpform.phno.value;
			if(v4.length=="")
			{
				
			}
			else
			{
				if(isNaN(v4))
				{
					alert("Please valid Mobile No");
					return false;
				}
			}

			var v5 = document.addgrpform.newHOD.value;
			if(v5.length=="")
			{
				
			}
			else
			{
				var sss=validateEmail(v5);
				if(!sss)
				{
				    //alert(sss);
					alert("HOD ID should be an email id");
					return false;
				} 	
			}
			
			var v6=document.addgrpform.empname.value;
			if(v6.length=="")
			{
				alert("Enter Emp Name");
				return false;
			}
			//alert(v3);
			var v7=document.addgrpform.empcode.value;
			if(v7.length=="")
			{
				alert("Enter Emp Code");
				return false;
			}
			//alert(v4);
			
			var v8=document.addgrpform.newempid.value;
			if(v8.length=="")
			{
				alert("Enter Emp Id");
				return false;
			}

			var sss=validateEmail(v8);
			if(!sss)
			{
			    //alert(sss);
				alert("Please enter valid Username");
				return false;
			} 	

			
		}
		else
		{
			var v3=document.addgrpform.empid.value;
			if(v3.length=="")
			{
				alert("Enter Emp Id");
				return false;
			}

			var sss=validateEmail(v3);
			if(!sss)
			{
		   	     //alert(sss);
				 alert("Please enter valid Username");
				 return false;
			} 

			var v4 =  document.addgrpform.oldHOD.value;
			//alert(v4);
             
            if(v4 == "-")
			{
				//alert(v4);
			}
			else
			{
				
				if(v4.length == "")
				{
					var v5 = document.addgrpform.newHOD.value;
					if(v5.length == "")
					{
						
					}
					else
					{
						
						sss=validateEmail(v5);
						if(!sss)
						{
					   	     //alert(sss);
							 alert("HOD ID should be an email id");
							 return false;
						} 
					}
				}
				else
				{
					//alert("&&&&&"+v4);
					
					//alert("&&&&&"+v4);
					sss=validateEmail(v4);
					//alert(sss);
					if(!sss)
					{
				   	     //alert(sss);
						 alert("HOD ID should be an email id");
						 return false;
					} 
				}
			}
		}
		//alert(v5);
		
	}
	return datevalidate();
	return true;
	
	}
	catch(e)
	{
		//alert(e);
	}
}

function datevalidate()
{
	try
	{
	//alert("***");
	var date1=document.getElementById("calender").value;
	var dm1,dd1,dy1;
	var dd11,yy11,mm1,mm11;
	dd11=date1.substring(8,11);
	mm1=date1.substring(5,7);
	//mm11=dateformat(mm1);
	mm11 = mm1;
	yy11=date1.substring(0,4);
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	
	var year=date.getFullYear();
	
   // alert("yy11  "+yy11+"  year   "+year);
  //  alert("mm11  "+mm11+"  month   "+month);
   // alert("dd11  "+dd11+"  day   "+day);
if(date1 == "")
{
	alert("Please Select the Allocation Date");
	return false;
}
else
{
	if(yy11>year)
	{
		alert("selected date should not be greater than todays date");
		//alert("year");
		document.getElementById("calender").value="";
		document.getElementById("calender").focus;
		return false;
	} 
	else if(year==yy11)
	{
		if(mm11>month)
		{
			alert("selected date should not be greater than todays date");
			//alert("month");
			document.getElementById("calender").value="";
			document.getElementById("calender").focus;
			return false;
		}
	}
	if(mm11==month)
	{
		if(dd11>day)
		{
			alert("selected date should not be greater than todays date");
			//alert("day");
			document.getElementById("calender").value="";
			document.getElementById("calender").focus;
			return false;
		}
	}
}
	}
	catch(e)
	{
		//alert(e);
	}
	return true;
}

function dateformat(days)
{
	 if(days=='Jan')
		return(1);
	 else
		if(days=='Feb')
			return(2);
		else
			if(days=='Mar')
				return(3);
			else
				if(days=='Apr')
					return(4);
				else
					if(days=='May') //timeformat: "%M:%S"
						
						return(5);
					else
						if(days=='Jun')
							return(6);
						else
							if(days=='Jul')
								return(7);
							else
								if(days=='Aug')
									return(8);
								else
									if(days=='Sep')
										return(9);
									else
										if(days=='Oct')
											return(10);
										else
											if(days=='Nov')
												return(11);
											else
												if(days=='Dec')
													return(12);
 }
function validateEmail(email)
{
   /*  var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;*/

var flag = false;
var pattern=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+\.([a-zA-Z])+([a-zA-Z])+/;
var pattern1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;  

if(pattern1.test(email))
{
	flag = true;
}
else
{
	if(pattern.test(email))
	{
		flag = true;
	}
	else
	{
		flag = false;
	}
}
if(flag)
{
	return true;
}
else
{
	return false;
}

}

function formsubmit()
{
	var aa=document.addgrpform.owner.value;
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
	}
}
function formsubmit1()
{
	var bb=document.addgrpform.owner.value;
	if(!(bb=="Select"))
	{	
		document.addgrpform.submit();
	}
}
function redirect()
{
	var check=validate();
	//alert(check);
	if(check==true)
	{
	document.addgrpform.action="cnfrmempname.jsp";
	document.addgrpform.submit();
	}
	
}

function allSelected()
{
	if(document.addgrpform.extAll.checked)
	{
		document.getElementById("checkstatus").value = "Yes"; 
		document.getElementById("tr3").style.display = "none";
		document.getElementById("tr5").style.display = "none";
		document.getElementById("empid").value = ""; 
		document.getElementById("HOD").innerHTML = "";
		document.getElementById("oldHOD").value = "";
		document.getElementById("tr1").style.display = "";
		document.getElementById("tr2").style.display = "";
		document.getElementById("tr4").style.display = "";
		document.getElementById("tr6").style.display = "";
		document.getElementById("tr7").style.display = "";
		document.getElementById("tr8").style.display = "";
		document.getElementById("tr9").style.display = "";
		document.getElementById("tr10").style.display = "";
	}
	else
	{
		document.getElementById("checkstatus").value = "No"; 
		document.getElementById("tr3").style.display = "";
		document.getElementById("tr1").style.display = "none";
		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr4").style.display = "none";
		document.getElementById("tr6").style.display = "none";
		document.getElementById("empname").value = ""; 
		document.getElementById("empcode").value = ""; 
		document.getElementById("newempid").value = ""; 
		document.getElementById("newHOD").value = "";
		document.getElementById("tr7").style.display = "none";
		document.getElementById("tr8").style.display = "none";
		document.getElementById("tr9").style.display = "none";
		document.getElementById("tr10").style.display = "none";
		document.getElementById("email").value = ""; 
		document.getElementById("phno").value = ""; 
		document.getElementById("deg").value = ""; 
		document.getElementById("loc").value = ""; 
		
	}
}

function showtext()
{
	document.getElementById("tr5").style.display = "none";
	document.getElementById("HOD").innerHTML = "";
	document.getElementById("oldHOD").value = "";
	document.getElementById("tr6").style.display = "";
	document.getElementById("newHOD").value = "";
}

function changehod()
{
	try
	{
		
	var username = document.getElementById("empid").value; 
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			try
			{
			var reslt=ajaxRequest.responseText;
		      reslt = reslt.replace(/\s+/g,'');
			//alert(reslt);
			document.getElementById("tr6").style.display = "none";
			document.getElementById("newHOD").value = "";
			document.getElementById("tr5").style.display="";
			document.getElementById("HOD").innerHTML=reslt;
			document.getElementById("oldHOD").value = reslt;
			}
			catch(e)
			{
				//alert(e);
			}
		} 
	};
	
	var queryString = "?username="+username;
	ajaxRequest.open("GET", "AjaxGetHOD.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		//alert(e);
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
<form name="addgrpform" method="get" action="" onSubmit="return validate();">
<%
try
{//1 gps 
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql="", sql1="", sql2="", sql3="";
	String tm="";

	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);

	tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();

	
	 String OwnerName=request.getParameter("owner");
	 String Vehicle=request.getParameter("vehcles");
	 String id=request.getParameter("id");
	 String updated=request.getParameter("updated");
	 String empname = request.getParameter("empname");
	 %>
	 <input type="hidden" name="err1" id="err1" value="<%=id %>"/>
	 <input type="hidden" name="err2" id="err2" value="<%=empname %>"/>
	 <%
	 
	 if(updated==null)
	 {
		 
	 }
	 else
		 if(updated == "1" || updated.equals("1"))
	 {
			 %>
			 <script>
				var err = document.getElementById("err1").value;
			    alert("User ID "+err+" already exist !!");
			 </script>
			 <%
	 }
		 else
			 if(updated == "2" || updated.equals("2"))
		 {
			 %>
			 
			 <script>
				var err = document.getElementById("err1").value;
			    alert("Record updated successfully for ID "+err);
			 </script>
			 			
			 <%
		 }
			 else
				 if(updated == "3" || updated.equals("3"))
			 {
				 %>
				 <script>
				var err = document.getElementById("err1").value;
			    alert("User ID "+err+" does not exist !! Please create new user.");
			     </script>
				 			
				 <%
			 }
				 else
					 if(updated == "4" || updated.equals("4"))
				 {
					 %>
					 <script>
					  var err = document.getElementById("err2").value;
			   		  alert(err+" already exist !!");
			    	 </script>
					 			
					 <%
				 }
					 else
						 if(updated == "5" || updated.equals("5"))
					 {
						 %>
						 <script>
						  var err = document.getElementById("err2").value;
				   		  alert(err+" is blocked !!");
				    	 </script>
						 			
						 <%
					 }
	
	 
	%>
	 <table border="0" width="750px" align="center">
   <tr align="center">
   <td align="center">
<table border="0" width="500px" bgcolor="#E6E6E6" align="center">
		<tr align="center">
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>ADD/EDIT EMPLOYEE NAME</b>  </font></td>
		</tr>
</table>
</td>
		</tr>
</table>

<br></br>
   <table border="0" width="750px" align="center">
   <tr align="center">
   <td align="center">
    <div align="center" style="width: 500px;">
   <table border="0" width="500px" bgcolor="#BDBDBD" align="center">
	<tr bgcolor="#BDBDBD">
       <td> <font color="black"> <b>Owner Name: </b></font> </td>
       <td>
       
      	 <select name="owner" id="owner" onchange="formsubmit();"> 
         <option value="Select">Select</option>
          <%
 			if(!(null==OwnerName))
 			{
 				%>
 		       
 					<option value="<%=OwnerName %>" selected="selected"><%=OwnerName %></option>
 				 <%
 			}
 		%>
        <%
        sql="select Distinct(OwnerName) as Transporter from t_vehicledetails where OwnerName in ('Castrol East','Castrol West','Castrol North','Castrol South','Castrol ILS','ALD Automotive','LeasePlan India Private Limited') and OwnerName not like '%del' order by OwnerName";
        rs1=stmt2.executeQuery(sql);
        while(rs1.next())
   	   { %>
      		<option value="<%=rs1.getString("Transporter") %> "> <%=rs1.getString("Transporter") %> </option>
	<% } %>
		</select> 
		
   	   </td>
 </tr>
  <tr bgcolor="#BDBDBD">

      <td>  <font color="black"><b>Vehicles : </b></font> </td>
      <td> <select name="vehcles" id="vehcles" onchange="formsubmit1();">
           <option value="Select">Select</option>
           <%
 			if(!(null==Vehicle))
 			{
 				%>
 		       
 					<option value="<%=Vehicle %>" selected="selected"><%=Vehicle %></option>
 				 <%
 			}
 		%>
	   <%
	  // String OwnerName=request.getParameter("owner");
		////System.out.println(OwnerName);
	   sql="select Distinct(VehicleRegNumber) from t_vehicledetails where OwnerName='"+OwnerName+"'";
	   rs2=stmt2.executeQuery(sql);
	   while(rs2.next())
   	   { %>
      		<option value="<%=rs2.getString("VehicleRegNumber") %> "> <%=rs2.getString("VehicleRegNumber") %> </option>
	<% } %>
     		
	    </select></td>
  </tr>
  <%
 			if(!(null==Vehicle))
 			{
 				%>
  <tr bgcolor="#BDBDBD">
  	<td>  <font color="black"><b> Old EMP Name And Code : </b></font> </td>
     <td> 
	   <%
	  // String OwnerName=request.getParameter("owner");
		////System.out.println(OwnerName);
	   sql="select Empname,Empcode from t_vehicledetails where VehicleRegNumber = '"+Vehicle+"'";
	   rs2=stmt2.executeQuery(sql);
	   while(rs2.next())
   	   { %>
      		<%=rs2.getString("Empname") %> &nbsp;&nbsp;&nbsp; <%=rs2.getString("Empcode") %>
      		
      		<input type="hidden" name="oldempname" value="<%=rs2.getString("Empname")%>" />	
      		<input type="hidden" name="oldempcode" value="<%=rs2.getString("Empcode")%>" />	
      			<% } %>
     		
     		
	 </td>   
  	
  </tr>
   <tr bgcolor="#BDBDBD">
   <td colspan="2">
   <font color="black"><b>
   Create New User Id <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected();"></input>
   </b></font>
   </td>
   </tr>
  	
  	           
 		       <tr bgcolor="#BDBDBD" style="display: none;" id="tr1">
  				<td>  <font color="black"><b>New EMP Name : </b></font> </td>
 					<td> <input type="text" name="empname" id="empname"></input>
    				</td>
    			</tr>
    			<tr bgcolor="#BDBDBD" style="display: none;" id="tr2">
  				<td> <font color="black"><b>New EMP Code : </b></font> </td>
 					<td> <input type="text" name="empcode" id="empcode"></input>
    				</td>
    			</tr>
    			<tr bgcolor="#BDBDBD" id="tr3">
	  			     <td><font color="black"><b>Fleetview ID :</b> </font> </td>
	   				 <td> <input type="text" name="empid" id="empid" onblur="changehod()"> </input><div>Please enter email id as username</div></td>
     			 </tr>
    			 <tr bgcolor="#BDBDBD" style="display: none;" id="tr4">
	  			     <td><font color="black"><b>New Fleetview ID :</b> </font> </td>
	   				 <td> <input type="text" name="newempid" id="newempid" > </input><div>Please enter email id as username</div></td>
     			 </tr>
     			 <tr bgcolor="#BDBDBD" id="tr5" style="display: none;">
      			<td><font color="black"><b>HOD:</b> </font> </td>
      			<td><font color="black" id="HOD"></font> 
     			  &nbsp;&nbsp;&nbsp;
     		 <input type="hidden" name="oldHOD" id="oldHOD" value="">
       <a href = "#"  onclick = "showtext()"> <font color="blue" size="2">Change HOD</font> </a>
       
      </td>
      </tr>
      <tr bgcolor="#BDBDBD" id="tr6" style="display: none;">
      			<td><font color="black"><b>HOD:</b> </font> </td>
      			<td><input type="text" name="newHOD" id="newHOD"></input> 
      </td>
      </tr>
      <tr bgcolor="#BDBDBD" id="tr7" style="display: none;">
      			<td><font color="black"><b>Email:</b> </font> </td>
      			<td><input type="text" name="email" id="email"></input> 
      </td>
      </tr>
      <tr bgcolor="#BDBDBD" id="tr8" style="display: none;">
      			<td><font color="black"><b>Mobile No:</b> </font> </td>
      			<td><input type="text" name="phno" id="phno"></input> 
      </td>
      </tr>
      <tr bgcolor="#BDBDBD" id="tr9" style="display: none;">
      			<td><font color="black"><b>Designation:</b> </font> </td>
      			<td><input type="text" name="deg" id="deg"></input> 
      </td></tr>
      <tr bgcolor="#BDBDBD" id="tr10" style="display: none;">
      			<td><font color="black"><b>Location:</b> </font> </td>
      			<td><input type="text" name="loc" id="loc"></input> 
      </td>
      </tr>
    			<tr bgcolor="#BDBDBD">
	  				<td> <font color="black"><b>Allocation Date : </b></font> </td>
	 				<td>  
	 					<input type="text" id="calender" name="calender" size="13" value="<%=sdt%>" readonly/>
	             	 	<script type="text/javascript">
			            	 Calendar.setup(
			             	{
			               	    inputField  : "calender",         // ID of the input field
			                	ifFormat    : "%Y-%m-%d",     // the date format
			                 	button      : "trigger"       // ID of the button
			             	}
			            );
	             		</script>
	             		<input type="hidden" name="checkstatus" id="checkstatus" value="No">
	    			</td>
    			</tr>
    			
 				 <%
 			}
 		%>
    
      
   <tr>
  
   
	<td colspan="2" align="center"><input type="button" name="Submit" value="Submit" class="formElement" onclick="redirect();"></td>
	
  </tr>
</table>
 </div>
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
