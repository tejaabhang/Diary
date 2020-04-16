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

	var courier=document.receivedform.courier.value;
	var courierdcno=document.receivedform.courierdcno.value;
	var techname=document.receivedform.techname.value;
	var locname=document.receivedform.locname.value;
	var unitId=document.receivedform.unitId.value;
	var dcno=document.receivedform.dcno.value;
	var cmnt=document.receivedform.cmnt.value;	

	var spcmmt=document.getElementById("cmment").value;
	var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
	
 		if(spcmmt=="No")
 		{
 	 		alert("Cannot receive as Special comment for the unit has not been closed yet");
 	 		return false;
 		}

	if(courier=="")
	{
		alert("Please enter Courier Name details");
		return false;
	}	
	for (var i = 0; i < document.receivedform.courier.value.length; i++) 
	{
  		if (iChars.indexOf(document.receivedform.courier.value.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
  		}
  	}
	
         if(courierdcno=="")
	{
		alert("Please enter Courier Docket details");
		return false;
	}
	/*if(isNaN(courierdcno))
	{
		alert("Please enter valid Courier Docket details");
		return false;
	}*/
	for (var i = 0; i < document.receivedform.courierdcno.value.length; i++) 
	{
  		if (iChars.indexOf(document.receivedform.courierdcno.value.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
  		}
  	}

	if(techname=="Select")
	{
		alert("Please select Tech from the list");
		return false;
	}

	if(locname=="Select")
	{
		alert("Please select Location from the list");
		return false;
	}	

	if(document.receivedform.radio2[0].checked==false && document.receivedform.radio2[1].checked==false && document.receivedform.radio2[2].checked==false)
	{
		alert("Please select Status of a Unit");
		return false;
	}	
	
	if(unitId=="")
	{
		alert("Please enter Unit Id");
		return false;
	}
	if(isNaN(unitId))
	{
		alert("Please enter valid Unit Id");
		return false;
	}
	

	if(dcno=="")
	{
		alert("Please enter DC No.");
		return false;
	}
	/*if(isNaN(dcno))
	{
		alert("Please enter valid DC No.");
		return false;	
	}*/
	for (var i = 0; i < document.receivedform.dcno.value.length; i++) 
	{
  		if (iChars.indexOf(document.receivedform.dcno.value.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
  		}
  	}
	
	if(cmnt.length < 2)
	{
		alert("Please enter Comment");
		return false;
	}
	return true;
}

function getDateObject(dateString,dateSeperator)
{
	//This function return a date object after accepting 
	//a date string ans dateseparator as arguments
	var curValue=dateString;
	var sepChar=dateSeperator;
	var curPos=0;
	var cDate,cMonth,cYear;

	//extract day portion
	curPos=dateString.indexOf(sepChar);
	cYear=dateString.substring(0,curPos);
	
	//extract month portion				
	endPos=dateString.indexOf(sepChar,curPos+1);			
	cMonth=dateString.substring(curPos+1,endPos);

	//extract year portion				
	curPos=endPos;
	endPos=curPos+5;			
	cDate=curValue.substring(curPos+1,endPos);
	
	//Create Date Object
	dtObject=new Date(cYear,cMonth-1,cDate);	
	return dtObject;
}

function updateClock ()
{
  var currentTime = new Date ();

  var currentHours = currentTime.getHours ();
  var currentMinutes = currentTime.getMinutes ();
  var currentSeconds = currentTime.getSeconds ();
  // Compose the string for display
  var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds;

  // Update the time display
  document.document.receivedform.ctime.value = currentTimeString;
}




function addnew(th)
{

var val=parseInt(th)+1;
var val1=val+1;
document.receivedform.h1.value=""+val1;
var str="<br><table border='0'> <tr> <td> <input type='text' name='unitId"+val+"' id='unitId"+val+"' class='formElement'> </td> <td> <font color='maroon'>Transporter:</font> <div name='transp"+val+"' id='transp"+val+"'> </div></td> <td> <a href='#' onClick='GetTransp1("+val+");'> Click</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' name='"+val+"' onclick='addnew("+val+");' value='Add' class='formElement'>  </div></td></tr> </table> <div name='dd"+val1+"' id='dd"+val1+"'> ";
document.getElementById("dd"+val).innerHTML=str;
}


function HideTextBox()
{
	if(document.receivedform.rd[0].checked==true && document.receivedform.radio1[0].checked==true)
	{  
		document.getElementById("custname").style.display='none';
	}
	else if(document.receivedform.rd[0].checked==true && document.receivedform.radio1[0].checked==true)
	{  
		document.getElementById("custname").style.display='none';
		
	}
	else if(document.receivedform.rd[1].checked==true && document.receivedform.radio1[0].checked==true)
	{	
		document.getElementById("custname").style.display="";

		var str="<input type='text' name='cname' id='cname' class='formElement' />";
		document.getElementById("vend").innerHTML=str;
	}
	
	else
	{  
		if(document.receivedform.radio1[1].checked==true)
		{
			 document.getElementById("custname").style.display="";		
			 
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

			   //  document.getElementById("mydiv").innerHTML="<select name='vehreg' id='vehreg'> " ;
                          // Create a function that will receive data sent from the server
               		     ajaxRequest.onreadystatechange = function()
               		     {
		    		 if(ajaxRequest.readyState == 4)
                		  {
                		 	var reslt=ajaxRequest.responseText;
                		        //alert(reslt);
                		         document.getElementById("vend").innerHTML=reslt;
				  }
               		     }
           		  
		             //var queryString = "?owname=" +SelValue1;
		             ajaxRequest.open("GET", "Ajaxgetvendors.jsp", true);
		             ajaxRequest.send(null); 
		}	
		else if(document.receivedform.radio1[3].checked==true)
		{
			 document.getElementById("vend").innerHTML="<input type='text' name='cname' class='formElement'>";
			document.getElementById("custname").style.display="";
		}
		
		//else
		//{
		//	document.getElementById("custname").style.display="";
		//}
	}
} 

function GetTransp()
{	
	var unid=document.receivedform.unitId.value;
	var dte= document.receivedform.calender.value;
	
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
			//alert(reslt);
                	//document.receivedform.transp.value=reslt;
			document.getElementById("div1").innerHTML=reslt;
		  }
            }
           		  
		            // var queryString = "?firstfunc=yes&unid=" +unid;
			     var queryString = "?firstfunc=yes&unid=" +unid+"&dte="+dte;	
		             ajaxRequest.open("GET", "Ajaxgetcustofunit.jsp"+queryString, true);
		             ajaxRequest.send(null); 		
}

function GetTransp1(val)
{ 
	var unid1=document.getElementById("unitId"+val).value;

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
			//alert(reslt);
                	//document.receivedform.transp.value=reslt;
			document.getElementById("transp"+val).innerHTML=reslt;
		  }
            }
           		  
		             var queryString = "?unid1=" +unid1+"&val="+val;
		             ajaxRequest.open("GET", "Ajaxgetcustofunit.jsp"+queryString, true);
		             ajaxRequest.send(null); 			
	
	
}



function Getunitcomment()
{ 
	//alert("hello");
	var unid1=document.getElementById("unitId").value;
	//alert(unid1);
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
               	 reslt= reslt.replace(/^\s+|\s+$/g,"");             		        
			//alert(reslt);
            if(reslt=="No")
            {
                alert("Special Comment for the Unit has not been closed yet");
                document.getElementById("cmment").value=reslt;
            }    	
			
		  }
            }
           		  
		             var queryString = "?unid1=" +unid1;
		             ajaxRequest.open("GET", "ajaxcheckunitcomment.jsp"+queryString, true);
		             ajaxRequest.send(null); 			
	
	
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
         <%@ include file="headertech.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="receivedform" method="get" action="insertsingleunittransfer1.jsp" onSubmit="return validate();">
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql="", sql1="", sql2="", sql3="";
	String tm="";

	
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("HH:mm:ss");
	tm=formatter.format(tdydate);
	
	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);

	//tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Successfully Inserted </font> </td>
			</tr>
		</table>
 	

<%
} 

	String alrdyentered=request.getParameter("alrdyentered");
	if(alrdyentered==null)
	{
	}
	else
	{ 
		String unitalrdyinrted=request.getParameter("unitid");
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Unit Id <%=unitalrdyinrted%> has already been received. </font> </td>
			</tr>
		</table>
		
		
<% 	} 

	String firstentered=request.getParameter("firstentered");
	if(firstentered==null)
	{
	}
	else
	{ 
		String unitfirstentered=request.getParameter("unitid");
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Unit Id <%=unitfirstentered%> has been received first time. Successfully Entered </font> </td>
			</tr>
		</table>
<% 	} 
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
         	<tr>
             	  	<td> <div align="center"> <font color="black" size="3"> <B> Unit Transfer By Courier</B></font></div> </td>
         	</tr>
      </table> 
<br></br>

<center>
	<table border="0" width="750px">
 		<tr>
   			 <td align="center">

  <table border="1" width="750px" align="center" class="sortable">
 <tr>
       <td><input type="hidden" name="cmment" id="cmment" value="" /> Book Date :  </td>
       <td> <input type="text" id="calender" name="calender" size="13"  value=<%=sdt%>  readonly/>
         
            <script type="text/javascript">
              Calendar.setup(
              {
                inputField  : "calender",         // ID of the input field
                ifFormat    : "%Y-%m-%d",     // the date format
                button      : "trigger"       // ID of the button
              }
            );
           </script>
		</td><td>Time :</td> <td><input type="text" name="rtime" size="10" value="<%=tm%>" readonly></td>

 </tr>
 
   <tr>
      <td> Courier Name :  </td>
      <td> 
      		<select name="courierlist" onchange="updateClock();" > 	
			<option value="Select">Select</option>	
<%
						String sqltech1="select distinct(courier) as courier from db_CustomerComplaints.t_courierlist where Available='Yes' order by courier asc";
						ResultSet rstechname1=stmt2.executeQuery(sqltech1);
						while(rstechname1.next())
						{ %>
			<option value="<%=rstechname1.getString("courier")%>"><%=rstechname1.getString("courier")%></option>
<%						}
%>
							
		   </select> 
		   </td>
		   <td>
       Courier Docket No :   </td><td><input type="text" name="courierdcno" ></td>
  </tr>
  <tr>
		<td align="center"> Booking Ref No: </td><td><input type="text" id="refno" name="refno" size="13" /></td>
  		<td align="center">	 Courier Account: </td>
		<td>	
			<input type="radio" name="unittype" value="Transworld">Transworld
			<input type="radio" name="unittype" value="Customer">Customer
			<input type="radio" name="unittype" value="Technician">Technician
		</td>
  </tr>
  <tr>
  		<td>Pickup Date :</td>
		<td><input type="text" id="calender1" name="Calender1" size="13" value="<%=sdt%>" readonly/>
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
  		<td align="center"> Pickup Delay Reason: </td><td><textarea name="rsndelay"> </textarea> </td>
  </tr>
  <tr>
	<td>  Tech Name :  </td>
  
	<td><input type="text" name="techname" id="techname" value="<%=session.getAttribute("username").toString()%>" readonly>
	    </td>
		<td>Status of Unit: </td> 
	<td>
	        <input type=radio name="radio2" value="Defective" checked>  Defective 
		<input type=radio name="radio2" value="Ok" > New
		<input type=radio name="radio2" value="Service Unit" > Service Unit
	</td>
   </tr>
   <tr>
	<td>Location :</td>
		<td><select name="locname"  >
              <option value="Select">Select</option>
  <%
  sql="select Distinct(LName) from t_location order by LName";
  ResultSet rst2=stmt.executeQuery(sql);
  while(rst2.next())
  { %>
     <option value="<%=rst2.getString("LName") %>"> <%=rst2.getString("LName") %> </option>
<% } %>
     
	    </select></td>
	
	<td> Unit ID: </td>
        <td>
		<table border="0"> <tr> <td>
		<div name="dd" id="dd">
		 <input type="text" name="unitId" id="unitId"  onblur="Getunitcomment()">  
</div>
		</td>
		<td>	
		 Transporter: 
	
<div name="div1"  id="div1">
			
</div>   
	</td> <td>

			<a href="#" onClick="GetTransp();"> Click</a>	
  	
		<input type="button" name="0" onclick="addnew(0);" value="Add" >
	</td> </tr> </table> 
		<div name="dd1" id="dd1">
		</div>
		
		<input type="hidden" name="h1" value="1">
			 
	
  </tr>

  <tr> 
	 <td> DC NO: </td>
        <td> <input type="text" name="dcno"  />  </td>
       <td> Comment: </td><td><textarea name="cmnt"  > </textarea> </td>
  </tr>


  <tr>
	<td colspan="4" align="center"><input type="submit" name="Submit" value="Submit"  /></td>
  </tr>
</table>

</td>
</tr>
</table>
 

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
</center>
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
