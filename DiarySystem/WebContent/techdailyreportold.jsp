<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1,con2;
Statement st,st1,st2,st3,st4,st5,st6;
String sql,sql1,sql2,sql3,sql4,sql5,sql6,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
ResultSet rs6=null;
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

var showothprobtext="No";

function validate()
{ 
   var technme=document.Techform.techname.value;
   var intimehours=document.Techform.intime1.value; 
   var outimehours=document.Techform.outtime1.value;
   var transp=document.Techform.owner.value;
   var vehregno=document.Techform.vehno.value;
   var fix=document.Techform.fixed.value;
   var oldun=document.Techform.olduid.value;
   var newuni=document.Techform.NewId.value;
   var probfound=document.Techform.prob.value;

   var acctimehours=document.Techform.accesstime1.value;
   var loc=document.Techform.location.value;
   var sprep=document.Techform.SpecRep.value;
   var supname=document.Techform.Superviser.value;
   var drivname=document.Techform.Driver.value;
  
   if(technme=="Select")
   {
     alert("Please select Technician Name");
     return false;
   }

   if(intimehours=="Select")
   {
     alert("Please select In Time (Hours)");
     return false;
   }

   if(outimehours=="Select")
   {
     alert("Please select Out Time (Hours)");
     return false;
   }
     
   if(transp=="Select")
   {
     alert("Please select the Transporter");
     return false;
   }

   if(vehregno=="Select")
   {
     alert("Please select the Vehicle from the list");
     return false;
   }

   if(fix=="Select")
   {
     alert("Please select option for Fixed");
     return false;
   }

    if(oldun=="")
   {
     alert("Please enter Old Unit ID");
     return false;
   } 
   if(isNaN(oldun))
   {
     alert("Please enter proper number for Old Unit ID");
     return false;
   }

   if(newuni=="")
   {
     alert("Please enter New Unit ID");
     return false;
   } 
   if(isNaN(newuni))
   {
     alert("Please enter proper number for New Unit ID");
     return false;
   }  

   if(probfound=="")
   {
     alert("Please enter the Problem found");
     return false;
   } 
   if(showothprobtext=="Yes")
   {
      var othprobfound=document.Techform.othprob.value;
 
      if(othprobfound=="")
      {
         alert("Please enter Other Problem");
         return false;
      }
 
   }

   if(acctimehours=="Select")
   {
     alert("Please select Access Time (Hours)");
     return false;
   }

   if(loc=="Select")
   {
     alert("Please select the location from the list");
     return false;
   }
   if(loc=="Other")
   {
     var othloc=document.Techform.othinst.value;
     if(othloc=="")
     {
        alert("Please enter the new location");
        return false;
     }
   }

   if(sprep=="")
   {
     alert("Please enter Special Report");
     return false;
   }

   if(supname=="")
   {
     alert("Please enter Supervisor Name ");
     return false;
   }  

   if(drivname=="")
   {
     alert("Please enter Driver Name ");
     return false;
   }  

     if(hour=="0")
     {
       alert("Please select Time");
       return false;
     }

     if(instat=="Select")
     {
       alert("Please Select Installed Place");
       return false;
     } 
     
    return true;

 }

  
        

function OnChangeFunc2(dropdown)
  {
 var vv1=dropdown.selectedIndex;
  var SelValue1 = dropdown.options[vv1].value;
 //alert(SelValue1);
 
        if(SelValue1=="Other")
        {
            
             document.getElementById("othinstloc").style.visibility="visible";
        }      
        else 
        { 
             
             document.getElementById("othinstloc").style.visibility="hidden";   
             document.Techform.othinst.value="";
        }
 }    



function OnChangeFunc3(dropdown)
{
  
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
 
 
       
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
                          // alert(reslt);
                          document.getElementById("mydiv").innerHTML=reslt;
                             // document.Techform.vehno.value=reslt;
                           //var mySplitResult = reslt.split("#");
                           //var mySplitResult1=  mySplitResult[0]; 
                           
 
                           //document.Techform.cellno.value = reslt;
                         } 
         	   }  
               var queryString = "?trans=" +SelValue1;
 
 	      ajaxRequest.open("GET", "Ajaxgetvehs.jsp" + queryString, true);

             

	     ajaxRequest.send(null); 
 

}

function AJAXFunc1()
{
var vv1=document.Techform.techname.selectedIndex;
 var SelValue1 = document.Techform.techname.options[vv1].value;
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
  
                           //var mySplitResult = reslt.split("#");
                           //var mySplitResult1=  mySplitResult[0]; 
                           
 
                           document.Techform.cellno.value = reslt;
                         } 
         	   }  
               var queryString = "?techname=" +SelValue1;
 
 	      ajaxRequest.open("GET", "AjaxTech.jsp" + queryString, true);

              ajaxRequest.send(null); 
 
 
}

function OnChangeFunc4(dropdown)
{
  var vv1=document.Techform.vehno.selectedIndex;
  var SelValue1 = document.Techform.vehno.options[vv1].value;
  
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
                          // alert(reslt);
  
                           var mySplitResult = reslt.split("#");
                           var mySplitResult1=  mySplitResult[1]; 
                           var mySplitResult2=  mySplitResult[2]; 
                           //alert(mySplitResult1); alert(mySplitResult2);
 
                           document.Techform.olduid.value =mySplitResult1;
                           document.Techform.NewId.value = mySplitResult2;
                         } 
         	   }  
               var queryString = "?vehic=" +SelValue1;
 
 	      ajaxRequest.open("GET", "Ajaxgetunits.jsp" + queryString, true);

              ajaxRequest.send(null); 
}

function DontShowNewProbText(dropdown)
{ 
    
       showothprobtext="No";
       document.Techform.othprob.value="";
       document.Techform.othprob.style.visibility="hidden";
    
    
}

function ShowNewProbText()
{ 
       
      showothprobtext="Yes";
      document.Techform.othprob.style.visibility="visible";
    
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
        st6=conn.createStatement();


%>
<form name="Techform" method="get" action="TechInsert.jsp" onsubmit="return validate();"> 

<%
   String inserted=request.getParameter("inserted");
   if(inserted==null)
   {
   }
   else
   { %>
        <table border="1" width="750px">
           <tr>
                <td> <div align="center"> <font color="maroon" size="1"> Successfully Done</font> </div> </td>
           </tr>
        </table>  
<% }
%>

<table border="1" width="750px">
<tr>
<td colspan="4" align="center"><font size="3" color="maroon" >Technician's Daily Report  </font></td>
</tr>
<tr>
<td><font color="maroon" ><b>Technician Name :</b></font></td><td>
<select name="techname" onChange="AJAXFunc1();" class="formElement" > 
         <option value="Select"> Select </option>
	<%
	username=session.getAttribute("username").toString();
	sql5="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc";
		ResultSet rst5=st.executeQuery(sql5);
		while(rst5.next())
		{
		%>
			<option value="<%=rst5.getString("tech")%>"><%=rst5.getString("tech")%></option>
		<%
		}
		%>
			
</select>
</td>
<td><font color="maroon" ><b>Contact Number :</b></font></td>
<td><input type="text" name="cellno" class="formElement" readonly> </input> </td>
</tr>
<tr>
<td>
	<font color="maroon" ><b>In Time :</b></font>
</td>
<td>
	<!--<input type="text" name="Intime" class="formElement"> </input> -->
        <font color="maroon">
            HH : </font> <select name="intime1" class="formElement">
                   <option value="Select">Select</option>
                   <option value="00">00</option>
                   <option value="01">01</option>
                   <option value="02">02</option>
                   <option value="03">03</option>
                   <option value="04">04</option>
                   <option value="05">05</option>
                   <option value="06">06</option>
                   <option value="07">07</option>
                   <option value="08">08</option>
                   <option value="09">09</option>
                   <option value="10">10</option>
                   <option value="11">11</option> 
                   <option value="12">12</option>
                   <option value="13">13</option>
                   <option value="14">14</option>
                   <option value="15">15</option>
                   <option value="16">16</option>
                   <option value="17">17</option>
                   <option value="18">18</option>
                   <option value="19">19</option>
                   <option value="20">20</option>
                   <option value="21">21</option> 
                   <option value="22">22</option>
                   <option value="23">23</option>
             </select>

                   <font color="maroon">
         MM :</font> <select name="intime2" class="formElement">
            
                  <option value="00">00</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option> 
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
               <%
                   for(int i=10;i<=59;i++)
                   {
               %>
                     <option value='<%=i%>'><%=i%></option>
               <%
                   }
               %>
            </select>
</td>
<td>
	<font color="maroon" ><b>Out Time :</b></font>
</td>
<td>
	<!-- <input type="text" name="outTime" class="formElement"> </input> </td> -->

        <font color="maroon">
            HH : </font> <select name="outtime1" class="formElement">
                   <option value="Select">Select</option>
                   <option value="00">00</option>
                   <option value="01">01</option>
                   <option value="02">02</option>
                   <option value="03">03</option>
                   <option value="04">04</option>
                   <option value="05">05</option>
                   <option value="06">06</option>
                   <option value="07">07</option>
                   <option value="08">08</option>
                   <option value="09">09</option>
                   <option value="10">10</option>
                   <option value="11">11</option> 
                   <option value="12">12</option>
                   <option value="13">13</option>
                   <option value="14">14</option>
                   <option value="15">15</option>
                   <option value="16">16</option>
                   <option value="17">17</option>
                   <option value="18">18</option>
                   <option value="19">19</option>
                   <option value="20">20</option>
                   <option value="21">21</option> 
                   <option value="22">22</option>
                   <option value="23">23</option>
             </select>

                   <font color="maroon">
         MM :</font> <select name="outtime2" class="formElement">
            
                  <option value="00">00</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option> 
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
               <%
                   for(int i=10;i<=59;i++)
                   {
               %>
                     <option value='<%=i%>'><%=i%></option>
               <%
                   }
               %>
            </select>
</td>
</tr>
<tr>
<td colspan="2"> <div align="right"> <font color="maroon" ><b>Transporter :</b></font> </div> </td>
<td colspan="2">
<select name="owner" onChange="OnChangeFunc3(this);" class="formElement" > 
         <option value="Select"> Select </option>
	<%
	username=session.getAttribute("username").toString();
	sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where Representative='"+username+"' order by Transporter";
		ResultSet rst=st.executeQuery(sql);
		while(rst.next())
		{
		%>
			<option value="<%=rst.getString("Transporter")%>"> <%=rst.getString("Transporter")%> </option>
		<%
		}
		%>
			
</select>
</td>
<!-- <td><font color="maroon" ><b>Group: </b></font></td>
<td>
<select name="cust" onChange="OnChangeFunc1(this);" class="formElement"> 
         <option value="None" > None </option>
<% 

	sql="select TypeValue from t_security where TypeofUser='GROUP' order by TypeValue";
     	ResultSet rst1=st2.executeQuery(sql);
   	while(rst1.next())
   	{
     		String chk=rst1.getString("TypeValue");
     		out.println(chk);
    
	%>
        	<option value="<%=rst1.getString("TypeValue") %>" >  <%=rst1.getString("TypeValue") %> </option>
   	<%
   	} 
	%>
         <option value="Other"> Other </option>
         </select>

</td> -->
</tr>
<tr>
<td><font color="maroon" ><b>Vehicle Reg. No.: </b></font></td>
<td> <div id="mydiv">
        <select name="vehno" onChange="OnChangeFunc4(this);" class="formElement"> 
            <option value="Select">Select </option> 
        </select> 
     </div> 
</td>
<td>
<font color="maroon" ><b>
Fixed (Y/N).:
</b></font>
</td>
<td>
<select name="fixed"  class="formElement"> 
        <option value="Select"> Select </option>
	<option value="Yes"> Yes </option>
	<option value="No"> No </option>
</select>
</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
 Old Unit Id: 
</b></font>
</td>
<td>
<input type="text" name="olduid" class="formElement" > </input> 
</td>
<td><font color="maroon" ><b>
New Unit Id</b></font>  &nbsp;&nbsp;
</td>
<td>
<input type="text" name="NewId" class="formElement"> </input>
</td>
</tr>

<%
  sql6="select * from t_complainttype order by ComplaintType asc";
  rs6=st6.executeQuery(sql6);
%>
<tr>
<td>
<font color="maroon" ><b>
 Prob. Found:
</b></font>
</td>
<td>
 <select name="prob" multiple="select-multiple" onChange="DontShowNewProbText(this);" class="formElement" size="3">
    <%
        while(rs6.next())
        { %>
             <option value="<%=rs6.getString("ComplaintType") %>" >  <%=rs6.getString("ComplaintType")%> </option>   
    <%  }  
    %>   
            <!-- <option value="Other">Other </option> -->
 </select>  
   <a href="#" onClick="ShowNewProbText();"> Other</a> 
   <input type="text" id="othprob" name="othprob" class="formElement"  style="visibility:hidden"> 
  
</td>
<td>
<font color="maroon" ><b>
 Access Time:
</b></font>
</td>
<td>
    <font color="maroon">
            HH : </font> <select name="accesstime1" class="formElement">
                   <option value="Select">Select</option>
                   <option value="00">00</option>
                   <option value="01">01</option>
                   <option value="02">02</option>
                   <option value="03">03</option>
                   <option value="04">04</option>
                   <option value="05">05</option>
                   <option value="06">06</option>
                   <option value="07">07</option>
                   <option value="08">08</option>
                   <option value="09">09</option>
                   <option value="10">10</option>
                   <option value="11">11</option> 
                   <option value="12">12</option>
                   <option value="13">13</option>
                   <option value="14">14</option>
                   <option value="15">15</option>
                   <option value="16">16</option>
                   <option value="17">17</option>
                   <option value="18">18</option>
                   <option value="19">19</option>
                   <option value="20">20</option>
                   <option value="21">21</option> 
                   <option value="22">22</option>
                   <option value="23">23</option>
             </select>

                   <font color="maroon">
         MM :</font> <select name="accesstime2" class="formElement">
            
                  <option value="00">00</option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option> 
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
               <%
                   for(int i=10;i<=59;i++)
                   {
               %>
                     <option value='<%=i%>'><%=i%></option>
               <%
                   }
               %>
            </select>

</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
Location: 
</b></font>
</td>
<td>
<select name="location" onChange="OnChangeFunc2(this);" class="formElement">
        <option value="Select"> Select </option>

<%
  sql="select LName from t_location order by LName";
  ResultSet rst2=st.executeQuery(sql);
  while(rst2.next())
  { %>

     <option value="<%=rst2.getString("LName") %>" > <%=rst2.getString("LName") %> </option>
<% } %>

     <option value="Other"> Other </option>
   </select>
<div id="othinstloc" style="visibility:hidden"> <center><input type="text" name="othinst" size="20" class="formElement"> </input> </center> </div> 
</td>
<td>
<font color="maroon" ><b>
 Special Report:
</b></font>
</td>
<td>
	<input type="text" name="SpecRep" class="formElement">
</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
Supervisor Name: 
</b></font>
</td>
<td>
		<input type="text" name="Superviser" class="formElement">
</td>
<td><font color="maroon" ><b>
Driver Name</b></font>  &nbsp;&nbsp;
</td>
<td>
<input type="text" name="Driver" class="formElement"> </input>
</td>
</tr>

<!--<tr>
    <td> 
         <select name="mySelect" multiple="select-multiple" onChange="test(this);">
    <option value="Item 1">Item 1</option>
    <option value="Item 2">Item 2</option>
    <option value="Item 3">Item 3</option>
    <option value="Item 4">Item 4</option>
    <option value="Item 5">Item 5</option>
</select>
    </td>
</tr> -->

<tr>
<td colspan="4"> <div align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </div> </td>
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


