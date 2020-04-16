<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1;
String sql1;
ResultSet rs1=null;
String tm;
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

var showothertext="false";


function validate()
{
	//alert("in validate");
	
	
	if(document.receivedform.radio1[0].checked==false && document.receivedform.radio1[1].checked==false && document.receivedform.radio1[2].checked==false && document.receivedform.radio1[3].checked==false)
	{
		alert("Please select Receive from option");
		return false;
	}
 
	//var v1=document.receivedform.cname.value;
	var v2=document.receivedform.courier.value;
	var v3=document.receivedform.techname.value;	
	var v4=document.receivedform.unitId.value;	
	var v5=document.receivedform.dcno.value;
	
	var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";			
	
	/*if(v1=="")
	{
		alert("Please enter Name");
		return false;
	} */

	if(v2=="")
	{
		alert("Please enter Courier / Person");
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
	

	if(v3=="Select")
	{
		alert("Please select Tech Name");
		return false;
	} 

	if(document.receivedform.radio2[0].checked==false && document.receivedform.radio2[1].checked==false && document.receivedform.radio2[2].checked==false)
	{
		alert("Please select Status of a Unit");
		return false;
	}
 
	if(v4=="")
	{
		alert("Please enter Unit Id");
		return false;
	}
	if(isNaN(v4))
	{
		alert("Please enter valid Unit Id");
		return false;
	}

	if(v5=="")
	{
		alert("Please enter DC No");
		return false;
	}
/*	if(isNaN(v5))
	{
		alert("Please enter valid DC No");
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

	
	document.receivedform.action="addtodatabase.jsp";
	document.receivedform.submit();
	//	addtodatabase.jsp
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
var close="CloseComment.jsp";
document.receivedform.h1.value=""+val1;
var str="<br><table border='0'> <tr> <td> <input type='text' name='unitId"+val+"' id='unitId"+val+"' class='formElement' onblur='Getunitcomment1("+val+")'> "+ 
"<div id='spcommnt"+val1+"' name='spcommnt"+val1+"' style='display: none'><a href='#' onclick='return popitup1("+val+")' ><font color='red'>Click here to close Comment</font></a></div></td> <td> <font color='black'><b>Transporter:</b></font> <div name='transp"+val+"' id='transp"+val+"'> </div></td> <td> <a href='#' onClick='GetTransp1("+val+");'> Click</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' name='"+val+"' onclick='addnew("+val+");' value='Add' class='formElement'>  </div></td></tr> </table> <div name='dd"+val1+"' id='dd"+val1+"'></div> ";
//alert(str);
document.getElementById("dd"+val).innerHTML=str;
}

function OnChangeFunc2(dropdown)
  {
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
        if(SelValue1=="Other")
        {
             showothertext="true"; 
             document.receivedform.othertech.style.visibility="visible";
        }      
        else { 
          showothertext="false";
         document.receivedform.othertech.value="";
         document.receivedform.othertech.style.visibility="hidden";

             }
 }   

function HideTextBox()
{
	if(document.receivedform.radio1[0].checked==true)
	{  
		document.getElementById("custname").style.display='none';
	}
	else if(document.receivedform.radio1[0].checked==true)
	{  
		document.getElementById("custname").style.display='none';
		
	}
	else if(document.receivedform.radio1[0].checked==true)
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
			
                	document.getElementById("div1").innerHTML=reslt;
		  }
            }
           		  
		             var queryString = "?firstfunc=yes&unid=" +unid+"&dte="+dte;
		             ajaxRequest.open("GET", "Ajaxgettransp.jsp"+queryString, true);
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
				var arr=reslt.split("#");
				
				
		
		
            if(arr[0]=="No")
            {

                document.getElementById("commnt").style.display='block';
                //alert("Special Comment for the Unit has not been closed yet");
               // document.getElementById("cmment").value=reslt;
            }  
            else
            {
            	   document.getElementById("commnt").style.display='none';
            }
            
            	  document.getElementById("vehconfg").innerHTML=arr[1];
        		  var chkveh = document.receivedform.vehconfg.value;	
        		                        
        			  if(chkveh=="Yes")
         			  {
        				//alert("hi hjrghehj;ljl;rjejtrljtjrrjtrjtrjkl");
        				document.receivedform.vehconfg.value="";
        				document.receivedform.vehconfg.value="No";
                       }  
            }
              	
			
		  }
            //}
           		  
		             var queryString = "?unid1=" +unid1+"&id=0";
		             ajaxRequest.open("GET", "ajaxcheckunitcomment.jsp"+queryString, true);
		             ajaxRequest.send(null); 			
	
	
}
function Getunitcomment1(id)
{ 
	//alert("hello"+id);
	//var unid1=document.receivedform.
	var unid1=document.getElementById("unitId"+id).value;
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
					var arr=reslt.split("#");
				//	alert(arr);
				//	alert(arr[0]);
    		        if(arr[0]=="No")
            		{
				id=id+1;
                document.getElementById("spcommnt"+id).style.display='';
                //alert("Special Comment for the Unit has not been closed yet");
                // document.getElementById("cmment").value=reslt;
            }  
            else
            {
            	   document.getElementById("spcommnt"+id).style.display='none';
            }
            	  document.getElementById("vehconfg").innerHTML=arr[1];
        		  var chkveh = document.receivedform.vehconfg.value;	
        		                        
        			  if(chkveh=="Yes")
         			  {
        			//	alert("hi hjrghehj;ljl;rjejtrljtjrrjtrjtrjkl");
        				document.receivedform.vehconfg.value="";
        				document.receivedform.vehconfg.value="No";
                       }  
            }
              	
			
		  }
            //}
           		  
		             var queryString = "?unid1=" +unid1+"&id="+id;
		             ajaxRequest.open("GET", "ajaxcheckunitcomment.jsp"+queryString, true);
		             ajaxRequest.send(null); 			
	
	
}
function Getunitcommentonsubmit()
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
		
		var arr=reslt.split("#");
				
				
		
		
            if(arr[0]=="No")
            {

                document.getElementById("commnt").style.display='block';
                //alert("Special Comment for the Unit has not been closed yet");
               // document.getElementById("cmment").value=reslt;
                alert("Please close Unit Comment");
                return false;
            }  
            else
            {
            	   document.getElementById("commnt").style.display='none';
            	   validate();
            }
		
		
		
		
          /*  if(reslt=="No")
            {

                document.getElementById("commnt").style.display='block';
                alert("Please close Unit Comment");
              return false;
            }  
            else
            {
            	   document.getElementById("commnt").style.display='none';
            	   validate();
            }*/
              	
			
		  }
            }
           		  
		             var queryString = "?unid1=" +unid1;
		             ajaxRequest.open("GET", "ajaxcheckunitcomment.jsp"+queryString, true);
		             ajaxRequest.send(null); 			
	
	
}
	
function popitup(url)
{
//	alert("in pop up function");
	var unitid=document.getElementById("unitId").value;
	url=url+"?unitid="+unitid;
	newwindow=window.open(url,'name','height=300,width=800');
	if (window.focus) {newwindow.focus()}
	return false;
	
}
function popitup1(val)
{
	//alert("in pop up function");
	//alert(val);
	var unitid=document.getElementById("unitId"+val).value;
	var url="CloseComment.jsp?unitid="+unitid;
	newwindow=window.open(url,'name','height=300,width=800');
	if (window.focus) {newwindow.focus()}
	return false;
	
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
			                       
			document.getElementById("transp"+val).innerHTML=reslt;
		  }
            };
           		   var queryString = "?unid1=" +unid1+"&val="+val;
		             //var queryString = "?unid1=" +unid1;
		             ajaxRequest.open("GET", "Ajaxgettransp.jsp"+queryString, true);
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
<%@ include file="headerStockadmin.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<form name="receivedform" action="" method="post" >

<%
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

java.util.Date tdydate = new java.util.Date();
Format formatter = new SimpleDateFormat("HH:mm:ss");
tm=formatter.format(tdydate);

//tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();
%>

<%
try 
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	stmt1=con1.createStatement();
 
        String sql1="";
        ResultSet rs1=null;

        String presentinveh=request.getParameter("presentinveh");
   //     //System.out.println("presentinveh---->"+presentinveh);
        if(presentinveh==null||presentinveh.equalsIgnoreCase("")){
        	
        }else{
        	%>
            <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
              <tr> 
                <td> <div align="center"> <font color="maroon"><B>Unit ids <%=presentinveh %> are not received as already present in vehicle.</B></font></div> </td>
              </tr>
           </table>
<%    
        }
        String inserted=request.getParameter("inserted");
        if(inserted==null)
        {
        }
        else
        { %>
            <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
              <tr> 
                <td> <div align="center"> <font color="maroon"><B> <U>  Successfuly Inserted  </U> </B></font></div> </td>
              </tr>
           </table>
<%      } 

	String alrdyentered=request.getParameter("notreceived");
	if(alrdyentered==null || alrdyentered.equals(""))
	{
	}
	else
	{ 
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Unit Id <%=alrdyentered%> are not received. </font> </td>
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
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			<tr>	
				<td align="center"> <font color="maroon"> Unit Id <%=unitfirstentered%> has been received first time. Successfully Entered </font> </td>
			</tr>
		</table>
<% 	} 
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Unit Receive</b>  </font></td>
		</tr>
</table>
<br></br>
     
<%
 sql1="select distinct(Techname) as tech from t_techlist where Available='Yes' order by TechName asc ";

 rs1=stmt1.executeQuery(sql1);
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
       <td> <font color="black"><b>Date : </b> </font> </td>
       <td> <input type="text" id="calender" name="calender" size="13" class="formElement" value=<%=sdt%>  readonly/>
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
			Time : &nbsp;&nbsp;
			<input type="text" name="rtime" size="10" value="<%=tm%>" class="formElement" readonly>
   		</td>
 	</tr>
 	<tr bgcolor="#BDBDBD">
    	 <td> <font color="black"> <b>Received From :</b> </font></td>
    	 <td>
        	<div>
	             <input type=radio name="radio1" value="Customer" onClick="HideTextBox()"/> <font color="maroon"><b>Customer</b> </font>
	             <input type=radio name="radio1" value="Ware House" onClick="HideTextBox()"/> <font color="maroon"><b>Ware House</b> </font>
	             <input type=radio name="radio1" value="Vendor" onClick="HideTextBox()"/> <font color="maroon"><b>Vendor</b> </font>
	             <input type=radio name="radio1" value="Office" onClick="HideTextBox()"/> <font color="maroon"><b>Office</b>  </font>
       		 </div>
     	</td>
 	</tr>
  	<tr div id="custname" style=""  bgcolor="#BDBDBD">
    	 <td>  <font color="black"><b>Name:</b> </font> </td>	
     	<td> 
     		<div id="vend" style=""><input type="text" name="cname" class="formElement"> </div>
    	 </td> 
  	</tr>
   	<tr bgcolor="#BDBDBD">
    	<td>  <font color="black"><b>Courier /Person : </b></font> </td>
      	<td> <input type="text" name="courier" class="formElement"  onChange="updateClock();"></td>
  	</tr>
  	<tr bgcolor="#BDBDBD">
		<td> <font color="black"><b>Tech Name :</b> </font> </td>
		<td>
		   <select name="techname" class="formElement"  >
              <option value="Select">Select</option>
<% 
		while(rs1.next())
   	   	{ 
%>
      		<option value="<%=rs1.getString("tech") %> "> <%=rs1.getString("tech") %> </option>
<% 
		} 
%>
      		<option value="Cust">Cust</option>
      		<option value="None">None</option>
	   	 </select>
		</td>
   </tr>
	<tr bgcolor="#BDBDBD">
  		<td> <font color="black"><b> Location : </b></font> </td>
  		<td>
	  		 <select name="locname" class="formElement"  >
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
   <tr bgcolor="#BDBDBD">
		<td>  <font color="black"><b> Status of Unit:</b> </font></td> 
		<td>
		        <input type=radio name="radio2" value="Defective" />  <font color="maroon"> <b>Defective</b> </font>
				<input type=radio name="radio2" value="Ok" />  <font color="maroon"> <b>New</b> </font>
				<input type=radio name="radio2" value="Service Unit" />  <font color="maroon"><b> Service Unit </b></font>
		</td>
   </tr>
   <tr bgcolor="#BDBDBD">
	    <td>  
	    	<font color="black"> <b>Unit ID:</b> </font> 
	    </td>
        <td>
			<table border="0"> 
				<tr> 
					<td>
						<div id="dd" name="dd">
			 				<input type="text" name="unitId" id="unitId" class="formElement" onblur="Getunitcomment()"> 
		  					<div id="commnt" name="commnt" style="display: none"> 
		  						<a href="#" onclick="return popitup('CloseComment.jsp')" ><font color="red">Click here to close Comment</font></a>
		  				    </div>
		  				</div>
					</td>
					<td>	
						<font color="black"> <b>Transporter: </b></font>
						<div id="div1" name="div1">
	 							
						</div>   
					</td> 
					<td>
						<a href="#" onClick="GetTransp();"> Click</a>	
						<input type="button" name="0" onclick="addnew(0);" value="Add" class="formElement">
					 </td> 
				</tr> 
			</table> 
			<div id="dd1" name="dd1">
			</div>
			<input type="hidden" name="h1" value="1">
 	 </tr>
	  <tr bgcolor="#BDBDBD">
	 		<td> <font color="black"><b>DC NO:</b> </font></td>
        	<td> <input type="text" name="dcno" class="formElement" /> </td>
  	  </tr>
  	  <tr>
			<td colspan="2" align="center"><input type="button" name="Submit" value="Submit" onclick="Getunitcommentonsubmit()" class="formElement"></td>
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
</form>
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
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>


</body>
</html>