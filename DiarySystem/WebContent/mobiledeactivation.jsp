<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
		function getstatus()
		{
			var mobno=document.getElementById("mobno").value;
			var len=document.mobileform.src.length;
			var i=0;
			var src="";
			for(i=0;i<len;i++)
			{
				if(document.mobileform.src[i].checked)
				{
					flag=true;
					src=document.mobileform.src[i].value;
				}
			}
			if(src=="")
			{
				alert("Please Select the checkbox");
				return false;
			}
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
                
          // Create a function that will receive data sent from the server
            ajaxRequest.onreadystatechange = function()
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;

                     /* var stat = document.mobileform.statchk.value;
							if(stat=="Yes")
							{
                      			document.getElementById("simerror").innerHTML=reslt;
                      			document.mobileform.statchk.value="No";
							}
							else
							{*/
            		  
                      var mySplitResult = reslt.split("#");
                    
					// Results from Ajaxmobiledata.jsp are put into fields
					  mySplitResult[0]= mySplitResult[0].replace(/^\s+|\s+$/g,"");
 				//	alert(mySplitResult[0]);
 					if(mySplitResult[0]=="yes")
 					{
 						alert(mySplitResult[1]);
 						 document.getElementById("details").style.display='none';
 						
 					}
 					else
 					{
 						 document.getElementById("details").style.display='block';
 					  mySplitResult[2]= mySplitResult[2].replace(/^\s+|\s+$/g,"");
 		     		  document.mobileform.unitid.value = mySplitResult[0];
                      document.mobileform.vehregno.value = mySplitResult[1];
                      document.mobileform.sim.value = mySplitResult[2];
                      document.mobileform.ownername.value = mySplitResult[3];
                      document.mobileform.lstdate.value = mySplitResult[4];
                      document.mobileform.ftpdump.value = mySplitResult[5];
                      document.mobileform.mobile.value=mySplitResult[6];
					}
                       
 	       }
            }
            
  
           var queryString = "?mobno=" +mobno+"&src="+src;
 	   ajaxRequest.open("GET", "Ajaxmobiledata.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
   
}
// if Type of UNit is 'Voice call', then this will get called

function validate()
{
	 var reason=document.mobileform.reason.value;
	 var mobno=document.mobileform.mobno.value; 

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
	   if(reason=="")
	   {
		 alert("Please enter De-activation Reason");
		 return false;
	   }
		  var ans=confirm("Are you sure to De-activate the Mobile No.");
		  if(ans==true)
			 return true;
		  else
			 return false;
	
	 
	}

	function cancel()
	{
		document.mobileform.reset();
		document.getElementById("details").style.display='none';
		
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
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();

		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today=formatter.format(dte);
		String serviceprovider=request.getParameter("Service_provider");	
		String inserted=request.getParameter("inserted");
		String mobno=request.getParameter("mobileno");
		String flag=request.getParameter("flag");
	//	System.out.println(serviceprovider+ " " +inserted+flag);
%>
<%
	if(serviceprovider==null)
	{	
	}
	else//(serviceprovider!=null && serviceprovider.equals("no"));
	{
%>
  	<table border="0" width="750px">
      <tr> 
      	<td> <div align="center"> <font color="maroon" size="1"> <b> Cannot Deactivate the Mobile No. : <%=mobno %> as Service Provider is not available </b></font> </div> 
      	</td> 
      </tr> 
    </table>
<%
	}
	if(inserted==null)
	{
	
	}
	else
	{
%>
	<table border="0" width="750px">
   		 <tr> 
   		 	<td> <div align="center"> <font color="maroon" size="1"> <b>Successfully Inserted ............... </b></font> </div> 
   		 	</td> 
   		 </tr>
<%
    if(flag!=null && flag.equalsIgnoreCase("true"))
    {
%>
   		 <tr> 
   		 	<td> <div align="center"> <font color="maroon" size="1"> <b>Mail Send to Service Provider ............... </b> </font></div> 
   		 	</td> 
   		 </tr>
<%
	} 
%> 
     </table>
<%
}
%>
<form name="mobileform" method="get" action="addmobiledetails.jsp" onsubmit="return validate();">
	<div id="simerror" align="center"><font color="marron"></font></div>
	<table border="1"  width="750px">
		<tr>
			<td colspan="4" align="center"><font size="3" color="maroon" >Mobile De-activation </font></td>
		</tr>
		<tr>
			<td><font color="maroon" ><input type="radio" name="src" value="mobile"/><B>Mobile No.</B>
				<input type="radio" name="src" value="sim"><B>Sim No.</B></font></td><td>
				<input type="text" name="mobno" id="mobno" class="formElement"> </input> 
			</td>
			<td><input type="button" name="btnstatus" value="Status" onclick="getstatus();"></td>
		</tr>
		<tr> 
			<td><font color="maroon" ><b>Reason to Deactivate:</b></font></td><td>
				<input type="text" name="reason" id="reason" class="formElement"> </input> 
			</td>
			<td><font color="maroon" ><b>Auto Mail:</b></font>
				<input type="checkbox" name="chkmail" id="chkmail" value="yes" class="formElement"> </input> 
			</td>
		</tr>
	</table>

	<table border="1" width="750px" id="details" style="display: none">
		<tr>
			<td colspan="8" align="center"><font size="3" color="maroon" >-----------Details--------------- </font></td>
		</tr>
		<tr>
			<td><font color="maroon" ><b>Mobile No:</b></font></td><td>
				<input type="text" name="mobile" id="mobile" class="formElement" readonly> </input> 
			</td>
			<td><font color="maroon" ><b>Unit Id.</b></font></td><td>
				<input type="text" name="unitid" id="unitid" class="formElement" readonly> </input> 
			</td>
			<td><font color="maroon" ><b>Vehicle Reg.No</b></font></td>
			<td><input type="text" name="vehregno" id="vehregno" value="" class="formElement" readonly></input></td>
			<td><font color="maroon" ><b>Owner Name</b></font></td>
			<td><input type="text" name="ownername" id="ownername" value="" class="formElement" readonly></input></td>
		</tr>
		<tr>
			<td><font color="maroon" ><b>Last Data.</b></font></td><td>
				<input type="text" name="lstdate" id="lstdate" class="formElement" class="formElement" readonly> </input> 
			</td>
			<td><font color="maroon" ><b>Sim Master</b></font></td>
			<td><input type="text" name="sim" id="sim" value="" class="formElement" readonly></input></td>
			<td><font color="maroon" ><b>FTP Dump.</b></font></td><td>
				<input type="text" name="ftpdump" id="ftpdump" class="formElement" readonly> </input> 
			</td>
		</tr>
		<tr> 
		</tr>
	</table>
	<table align="center" width="750px" border=0>
	<tr align="center"><td><input type="button" name="btncancel" value="Cancel" onclick="cancel();"></input><input type="submit" name="btnsubmit" value="Submit"></input></td></tr>
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
	try{
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
		conn1.close();
	}catch(Exception e){
		e.printStackTrace();
	}
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