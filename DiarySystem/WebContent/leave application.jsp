<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transworld - Leave Application</title>
<script type="text/javascript">
function validate(){
	   alert("in validate function");
	 var DaysApplied=document.leave.DaysApplied.value;
	 var name=document.leave.name.value;
	   alert(DaysApplied);
     var FirstDayOfLeave=document.leave.FirstDayOfLeave.value;
     alert(FirstDayOfLeave);
     var reasonForLeave=document.leave.reasonForLeave.value;
    alert(reasonForLeave);
     var DateOfReporting= document.leave.DateOfReporting.value;  
     alert(DateOfReporting);
     var reason1=document.getElementById("reason1");
     var reason2=document.getElementById("reason2");  
     var reason3=document.getElementById("reason3");    
    if(reason1.checked==true){
    	alert(reason1.value);
    }else if(reason2.checked==true){
    	 alert(reason2.value);
       }else if(reason3.checked==true){
        	 alert(reason3.value);
            }else{
					alert("Please select radio button");
					return false;
                }
     var Details= document.leave.Details.value;  
     if(DaysApplied==""){
    	 alert("Please enter Number of days requested");
 		return false;
         }

     if(FirstDayOfLeave==""){
    	 alert("Please enter First day of leave");
 		return false;
         }
     
     if(Details==""){
    	 alert("Please enter phone number");
 		return false;
         }

     
//     alert(Details);
   

     if(DateOfReporting==""){
    	 alert("Please select Date when reporting / reported ");
 		return false;
         }

     if(reasonForLeave==""){
    	 alert("Please enter Reason for leave ");
 		return false;
         }
     
     var emailAdd= document.leave.emailAdd.value;  
     alert(emailAdd);
     if(emailAdd=="") 
     {
		alert("Please enter your Email Id");
		return false;
	}
	else
	{
		var sss=validateEmail(emailAdd);
		if(!sss)
			{
				alert("Please enter valid Email Id");
				return false;
			} 
	}

     var HODemailAdd= document.leave.HODemailAdd.value;  
     alert(HODemailAdd);
     if(HODemailAdd=="") 
     {
		alert("Please enter HOD's Email Id");
		return false;
	}
	else
	{
		var sss=validateEmailHOD(HODemailAdd);
		if(!sss)
			{
				alert("Please enter valid HOD's Email Id");
				return false;
			} 
	}
     if(name==""){
    	 alert("Please enter your full name");
 		return false;
         }
}
function validateEmail(emailAdd)
{
     var splitted = emailAdd.match("^(.+)@(.+)$");
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
return false;
}
function validateEmailHOD(HODemailAdd)
{
     var splitted = HODemailAdd.match("^(.+)@(.+)$");
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
return false;
}
</script>
</head>
<body bgcolor="Silver">

<p></p>
<p></p>
<table bgcolor="White" border="0" height="500" width="750" align="center">
<tr>
<td><b><font size="6" color="#6699ff">Transworld - Leave Application</font></b></td>
</tr>
<tr>
<td><b><font size="3" color="#6699ff"><a href='leaveRequestReport.jsp'>Transworld - Leave Application Report</a></font></b></td>
</tr>
<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
<tr><td>
Please enter your request for leave here. 
Please note that application for leave does not automatically 
mean your request is granted. Provide a reason as detailed as possible. 
Please obtain confirmation in writing from your HOD or person authorised 
to grant leave. In certain circumstances, leave may be revoked or cancelled 
prematurely. Any holiday between two days of leave is counted as leave.
</td></tr>
<tr><td>Please refer to all the applicable rules, they are available on request 
from the Accounts and Personnel department. All sick leave applications 
require to be supported by medical certificates. It should require about 
3 minutes to fill in this form.</td></tr>
<tr></tr>
<tr><td>
<form method="post" name="leave" action="leaveApplicationInsert.jsp" onsubmit="return validate();">
<p></p>

<table bgcolor="White" border="0" height="500" width="600" align="center">
	<tr><td><font  color="#990000">* Required</font></td></tr>
		<tr>
			<td>
				<b>Days applied <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Number of days requested (0.5 for half day)</font></td>
		</tr>
		<tr>
			<td><input type="text" id="DaysApplied" name="DaysApplied" value=""/></td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>First day of leave <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter date DD/MM/YY</font></td>
		</tr>
		<tr>
			<td><input type="text" id="FirstDayOfLeave" name="FirstDayOfLeave"/></td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>Type of leave required <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Medical cert reqd for sick leave</font></td>
		</tr>
		<tr><td><input type="radio" name="reason" id="reason1" value="casual leave"/>Casual Half or 1 day</td></tr>
		<tr><td><input type="radio" name="reason" id="reason2" value="long leave"/>Long leave</td></tr>
		<tr><td><input type="radio" name="reason" id="reason3" value="sick leave"/>Sick leave</td></tr>
		
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		
		<tr>
			<td>
				<b>Reason for leave <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Give details. In case of sick leave, submit medical certificate. </font></td>
		</tr>
		<tr>
			<td><textarea cols="60" rows="10" name="reasonForLeave"></textarea></td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>Date when reporting / reported <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter date when reported back from leave DD/MM/YY</font></td>
		</tr>
		<tr>
			<td><input type="text" name="DateOfReporting"/></td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>Email address<font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter your email address</font></td>
		</tr>
		<tr>
			<td><input type="text" name="emailAdd" id="emailAdd"/></td>
		</tr>
		
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>HOD's Email address<font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter your HOD's email address</font></td>
		</tr>
		<tr>
			<td><input type="text" name="HODemailAdd" id="HODemailAdd"/></td>
		</tr>
		
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>Your full name <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter your name</font></td>
		</tr>
		<tr>
			<td><textarea cols="50" rows="1" name="name"></textarea></td>
		</tr>
		
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<b>Your phone number <font  color="#990000">*</font></b>
			</td>
		</tr>
		<tr>
			<td><font  color="blue">Enter your mobile number</font> </td>
		</tr>
		<tr>
			<td><input type="text" name="Details" id="Details"/></td>
		</tr>
<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
<tr><td align="center"><input type="submit" value="Submit" /></td></tr>
</table>
</form>
</td></tr>

</table>
<p></p>
</body>
</html>