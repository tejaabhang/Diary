<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String vid, vehno;
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

<script language="javascript" >
showvoicepar="No";

var state = 'none';

function showwarcom(layer_ref) {
//alert(layer_ref);
if (state == 'block') {
state = 'none';
}
else {
state = 'block';
}
if (document.all) { //IS IE 4 or 5 (or 6 beta)
eval( "document.all." + layer_ref + ".style.display = state");
}
if (document.layers) { //IS NETSCAPE 4 or below
document.layers[layer_ref].display = state;
}
if (document.getElementById &&!document.all) {
hza = document.getElementById(layer_ref);
hza.style.display = state;
}
}
UnitDamaged="No";
NewDamage="No";
	function OnChangeFunc2(dropdown)
  	{
 		var vv1=dropdown.selectedIndex;
 		var SelValue1 = dropdown.options[vv1].value;
 
        	if(SelValue1=="Other")
       		{
             		document.getElementById("othinstloc").style.visibility="visible";
        	}      
        	else 
		{ 
         		document.getElementById("othinstloc").style.visibility="hidden";   
         		document.repunitform.othinst.value="";
             	}
 	}    
	function OnChangeChkBx()
	{

  		if(document.repunitform.instin.checked == false)
  		{
   
   			document.repunitform.tme.disabled=true;
   			document.repunitform.tme.value="";
   			document.getElementById("nwtme").style.visibility="visible";

   		}
  		else
  		{
    			document.repunitform.tme.disabled=false;
   			document.repunitform.tme.value="5.30";
   			document.repunitform.newtme.value="";
   			document.getElementById("nwtme").style.visibility="hidden";
  		}
	}
function AJAXFunc1()
{
  
  var v1=document.repunitform.newunid.value;
 // alert(v1);
  var owner=document.repunitform.owner.value;
 // alert(owner);
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
            {if(ajaxRequest.readyState == 4)
            {
                var reslt=ajaxRequest.responseText;
				//alert(reslt);
                var mySplitResult = reslt.split("#");
                var mySplitResult1=  mySplitResult[0].replace(/^\s+|\s+$/g,"");//Mobile Number
                var mySplitResult2=  mySplitResult[1].replace(/^\s+|\s+$/g,"");//Sim Number
                var mySplitResult3=  mySplitResult[2].replace(/^\s+|\s+$/g,"");//Inst Type
                var mySplitResult4=  mySplitResult[3].replace(/^\s+|\s+$/g,"");//Recieve by tech/cust
                var mySplitResult5=  mySplitResult[4].replace(/^\s+|\s+$/g,"");//Hold By
                var mySplitResult6=  mySplitResult[5].replace(/^\s+|\s+$/g,"");//Swr Ver
                var mySplitResult7=  mySplitResult[6].replace(/^\s+|\s+$/g,"");//code Version
                var mySplitResult8=  mySplitResult[7].replace(/^\s+|\s+$/g,"");//available
                var mySplitResult9=  mySplitResult[8].replace(/^\s+|\s+$/g,"");//JRM
                var mySplitResult10= mySplitResult[9].replace(/^\s+|\s+$/g,"");//trim   Device xxxx can not be installed in a vehicle because it has wrong firmware.
//Results from Ajaxunitadd.jsp are put into fields

	      		document.repunitform.mobno.value = mySplitResult1;
                document.repunitform.simno.value = mySplitResult2;
                document.repunitform.InstType.value = mySplitResult3;
                document.repunitform.holdby.value = mySplitResult5;
                document.repunitform.recby.value =mySplitResult4;
                document.repunitform.jrm.value = mySplitResult9;
                var swver=mySplitResult[5];
                var invalide=mySplitResult[6];
                var available=mySplitResult8;
                var isCodeVerValid=mySplitResult[9];
             //   alert(invalide);
                //alert(owner);
					if(
						(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Castrol")!=-1))
						||(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Praxair")!=-1))
						)
						{
               			   alert("AVL_LITE unit is not allowed in "+owner);
								return false;
                  		}else{
						//	alert("condition does not match");
                      		}
              		if(invalide=="Yes"){
							alert("Invalide software version in "+v1);
							return false;
                  		}
              
              		if(available=="Yes"){
						alert("Unit ID "+v1+" already available in other vehicle.");
          			}

              		if(isCodeVerValid=="No"){
                		 alert("Device "+v1+" can not be installed in a vehicle because it has wrong firmware.");
                       return false;
                      }
          			
      				}
            	}
        	//	alert("EOF")  
           var queryString = "?unid=" +v1;
 	   ajaxRequest.open("GET", "Ajaxunitadd.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}

function validate()
{
	var mob=document.repunitform.mobno.value;
	var unitholdby=document.repunitform.holdby.value;
	var unitinstalby=document.repunitform.instby.value;
	var recby=document.repunitform.recby.value;
	var jrm=document.repunitform.jrm.value;
	var instruction=document.repunitform.instruction.value;
	if(jrm==instruction||instruction=="-"){
			//alert("right decision!!!!!!!!");
		}else{
			alert("Only JRM units are valide for this vehicle.Please use JRM unit");
			}

	unitholdby = unitholdby.replace(/^\s+|\s+$/g,"");//trim
	recdby = recby.replace(/^\s+|\s+$/g,"");//trim
	unitinstalby=unitinstalby.replace(/^\s+|\s+$/g,""); 
	
	if(unitholdby != unitinstalby)
	{

		if(unitinstalby=="customer")
		{
		}
		else
		{
		//alert("Hi"+unitholdby);
		//alert("Hi"+unitinstalby);
		alert("UNIT HOLD BY DIFFERENT TECH/CUST");
		return false;
		} 
	}

	//alert("Hi"+recby);
	
	if(recby==" NO")
	{
		alert("UNIT NOT RECEIVED BY TECH/CUST. FIRST RECEIVE IT");
		return false;
		
	}
	
	if(document.repunitform.instat.value=="Select")
	{
		alert("Please Select Installed Place");
		return false; 
	}
	if(document.repunitform.hour.value=="Select")
	{
		alert("Please Select Installed Time");
		return false; 
	}
	if(document.repunitform.typeunit.value=="SELECT")
	{
		alert("Please Select Unit Type");
		return false; 
	}
	if(document.repunitform.instby.value=="Select")
	{
		alert("Please Select Technician Name");
		return false; 
	}

	
	if(document.repunitform.newunid.value=="")
	{ 
		alert("Please Enter New UnitId");
		return false; 
	}
	if(document.repunitform.mobno.value=="")
	{	
		alert("The Mobile number not available");
		return false;
	}
	if(document.repunitform.simno.value=="")
	{	
		alert("The sim number not available");
		return false;
	}
	/*if(!(mob.length==10))
	{
		alert("Not Valid Mobile Number");
		return false;		
	}*/

	if(showvoicepar=="Yes")
   {
	var voic1=document.repunitform.voice1.value;
	var voic2=document.repunitform.voice2.value;

	if(voic1=="" || voic2=="")
	{
		alert("Please enter both Voice Call No's");
	        return false;
	}
	if(voic1.length<10 || voic1.length>10) 
	{
		alert("Please enter proper 10 digit Voice Call No. 1");
	        return false;
	}
	if(voic2.length<10 || voic2.length>10) 
	{
		alert("Please enter proper 10 digit Voice Call No. 2");
	        return false;
	}
	if(isNaN(voic1))
	{
		alert("Please enter proper Voice Call No. 1");
		return false;
	}
	if(isNaN(voic2))
	{
		alert("Please enter proper Voice Call No. 2");
		return false;
	}


       // return false;
   }	

	if(UnitDamaged=="Yes")
	{
		if(document.repunitform.gpsantcut.checked==false && document.repunitform.greenlightoff.checked==false && document.repunitform.loosecon.checked==false && document.repunitform.powharndam.checked==false && document.repunitform.unitfndop.checked==false)
		{
			alert("Please select damage of Old Unit");
			return false;
		}
		  /*if(document.repunitform.unitdamagedopt.value=="Select")	
  		{
			alert("Please select damage of Old Unit");
			return false;
  		}*/	
	}
	var comm=document.repunitform.comment.value;
	if(warcommentt=="Yes")
	{
		if(comm.length < 2)
		{
			alert("Please Enter Warranty Comment");
			return false;
		}
		  /*if(document.repunitform.unitdamagedopt.value=="Select")	
  		{
			alert("Please select damage of Old Unit");
			return false;
  		}*/	
	}
	

	if(NewDamage=="Yes")
	{
		 if(document.repunitform.newdamageoption.value=="")	
  		{
			alert("Please enter new Unit damage option");
			return false;
  		}	
	}

	if(document.repunitform.unitrunon[0].checked==false && document.repunitform.unitrunon[1].checked==false)	
	{
		alert("Please select whether the Unit runs on Battery or Ignition");
		return false;
	}

	if(document.repunitform.redlight[0].checked==false && document.repunitform.redlight[1].checked==false)
	{
		alert("Please Select The RED LIGHT condition");
		return false;
	}
	if(document.repunitform.greenlight[0].checked==false && document.repunitform.greenlight[1].checked==false && document.repunitform.greenlight[2].checked==false)
	{
		alert("Please Select The GREEN LIGHT Condition");
		return false;
	}
	if(document.repunitform.gpslight[0].checked==false && document.repunitform.gpslight[1].checked==false && document.repunitform.gpslight[2].checked==false)
	{
		alert("Please Select The GPS LIGHT Condition");
		return false;
	}
	if(document.repunitform.ringing[0].checked==false && document.repunitform.ringing[1].checked==false )
	{
		alert("Please Select The RINGING Status");
		return false;
	}

	
	if(document.repunitform.warcom[0].checked==false && document.repunitform.warcom[1].checked==false )
	{
		alert("Please Select The Warranty Comment");
		return false;
	}


	var spcomt=document.repunitform.spcomment.value;	
	if(spcomt=="Select")
	{
		alert("Please Enter Special Comment");
		return false;
	}
	
	if(document.repunitform.oldunitwith[0].checked==false && document.repunitform.oldunitwith[1].checked==false)//&& document.repunitform.oldunitwith[2].checked==false
	{
		alert("Please select whether the Unit is with Cust / Tech / Company");
		return false;
	}
	var drivarname=document.repunitform.drivername.value;  
	  //	alert(drivarname);
	  	 var drivermobno=document.repunitform.drivermob.value;  
	  //	alert(drivermobno);
	    	
		
	 if(drivarname==""){
			alert("Please enter Driver Name");
			return false;
	   	 }
	if(drivermobno==""){
		alert("Please enter Driver mobile no");
		return false;
	   	 }else{
			if(drivermobno.length==10){
			}else{
					alert("Please enter drivers valid mobile number");
					return false;
				}
				if(isNaN(drivermobno))
				{
					alert("Please enter proper driver mobile no.Alfabets are not valid");
					return false;
				}
		   	 }
	
  return true;
	 
}

// if Type of UNit is 'Voice call', then this will get called

function voicecall(dropdown)
{
	var vv1=dropdown.selectedIndex;
 	var SelValue1 = dropdown.options[vv1].value;
	//alert(SelValue1);
 
       	if(SelValue1=="VOICECALL")
       	{
		document.getElementById("voiceparam").style.display="";
		showvoicepar="Yes";
	}   
	else
	{
		document.getElementById("voiceparam").style.display='none';
		document.unitaddform.voice1.value="";
		document.unitaddform.voice2.value="";
		showvoicepar="No";
	}   
}

function showDamageOpt(ind)
{ 
	if(ind==0)
	{ 
		//document.getElementById("unitdamagedopt").style.visibility="visible";
		document.getElementById("damagedoption").style.display="";
		UnitDamaged="Yes";
	}
	else
	{ 
		//document.getElementById("unitdamagedopt").style.visibility="hidden";

		document.repunitform.gpsantcut.checked=false;
		document.repunitform.greenlightoff.checked=false;
		document.repunitform.loosecon.checked=false;
		document.repunitform.powharndam.checked=false; 			
		document.repunitform.unitfndop.checked==false;	

		document.getElementById("damagedoption").style.display='none';
		document.repunitform.newdamageoption.style.visibility='hidden';

		UnitDamaged="No";
	}
}

function NewDamageOpt()
{ 
	document.repunitform.newdamageoption.style.visibility="visible";
	NewDamage="Yes";
	
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
<form name="repunitform" method="post" action="repunitinsrt.jsp" onsubmit="return validate();"> 

<%
try
{
	vid=request.getParameter("vid");
	%>
	<input type="hidden" name="vid" id="vid" value="<%=vid%>" />
	<%
	//out.print(vid);
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	Statement stmt2=conn.createStatement();

	String userrole=session.getAttribute("userrole").toString();

	
	String email="", unid="", status="", owner="",Instruction="";

	java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today=formatter.format(dte);	

		String  tid=request.getParameter("tid"); 
		String tcategory=request.getParameter("category");
	sql="select * from t_vehicledetails where VehicleCode='"+vid+"' ";
		
   	ResultSet rst=st2.executeQuery(sql);
	if(rst.next())
	{
		status=rst.getString("Status");
		owner=rst.getString("OwnerName");
		vehno=rst.getString("VehicleRegNumber");
		email=rst.getString("TheFieldFromEmailAddress");	
		Instruction=rst.getString("Instruction");		
			//if(status.equals("Removed"))
			//{ 
				String sql5="select * from t_unitreplacement where VehCode='"+vid+"' order by InstDate desc limit 1";
				//out.print(sql5);
				ResultSet rs5=st2.executeQuery(sql5);
				if(rs5.next())
				{
					unid=rs5.getString("NewUnitId");
				} 
				else
				{		 	
				 	//email=rst.getString("TheFieldFromEmailAddress");
 				 	int pos=email.indexOf('@');
				 	unid=email.substring(2,pos);
				}  
			//}
		
				
		
	  }	

	%>


<%  
 String send=request.getParameter("send");
 if(send==null)
 {
 }
 else
   {  
	String veh="", unitidnew="";
	String sql6="select * from t_vehicledetails where VehicleCode='"+vid+"' ";
	ResultSet rs6=st2.executeQuery(sql6);
	if(rs6.next())
	{
		veh=rs6.getString("VehicleRegNumber");
		unitidnew=rs6.getString("UnitID");
		
	}
%>
        <table border="0" width="750px" >
          <tr>
                 <td> <div align="center"> <font color="maroon"><B> Successfuly Replaced ( Vehicle No <%=veh%> with Unit Id <%=unitidnew %> ) </B></font> </div> </td>
          </tr>
        </table>  
<% }
  
  String unidchk=request.getParameter("unidchk");
  if(unidchk==null)
  {
  }
  else
  {  
    String own=request.getParameter("own");
    String vehnumb=request.getParameter("vehnumb");
  
%>
   <table border="0" width="750px" >
          <tr>
                 <td> <div align="center"> <font color="maroon"> <b> Unit Id <%=unidchk %> is already in Use in Vehicle no. <%=vehnumb %> of <%=own %> </b></font></div></td>
          </tr>
        </table>  

<% }

String sql6="select * from t_complaints1 where VehicleNo='"+vehno.trim()+"' and Status in('UnAllocated', 'Allocated', 'Attended') ";	

ResultSet rs6=st.executeQuery(sql6);
if(rs6.next())
{
	String actnbytech=rs6.getString("Action");
	String tickno=rs6.getString("Tno");
	String tech="";

	String sql7="select * from t_callocation1 where Tno='"+tickno+"' ";
	ResultSet rs7=st1.executeQuery(sql7);
	if(rs7.next())
	{
		tech=rs7.getString("Technicion");
	}

	if(null==actnbytech || actnbytech.equals("-"))
	{ 
%>
		<table border="0" width="750px">
		  <tr>
			<td align="center"> <font color="maroon" > <B> Please add Action by Technician for Complaint lodged for this Vehicle, then you can replace its Unit. </b><br><a href="action.jsp?tno=<%=tickno%>&tech=<%=tech%>&vehno=<%=vehno%>&parameter=<%=para %>"><b> Click Here </b></a><b>  to add Action by Technician </B> </font> </td>
		</tr>
	</table>
<%	}
	else
	{  
 %>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>Unit Replacement</b></b></td></tr>
</table>
<br></br>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
	<td><b>Transporter:</b></td>
	<td><input type="text" name="owner" value='<%=owner%>' class="formElement" readonly /></td>
	<td><b>Vehicle Reg. No.:</b></td>
	<td><input type="text" name="vehreg" class="formElement" value='<%=vehno%>' readonly />
	<input type="hidden" name="instruction" class="formElement" value="<%=Instruction%>"/>
	<input type="hidden" name="whyoption" value="-" /></td>
</tr>
<tr bgcolor="#BDBDBD">
	<td><b> Old Unit Id:</b></td>
	<td><input type="text" name="oldunid" class="formElement" value='<%=unid%>'  /></td>
	<td><b> New Unit Id:</b></td>
	<td>
		<input type="text" name="newunid"  class="formElement" />
		<input type="hidden" name="jrm" class="formElement" />
	</td>
</tr>

<tr bgcolor="#BDBDBD">
	<td rowspan="2"><b> Mobile No.:</b></td>
	<td rowspan="2"><input type="text" name="mobno" size="13" onClick="AJAXFunc1()"; class="formElement" readonly /></td>
	<td><b> Sim No.:</b></td>
	<td><input type="text" name="simno" size="13" class="formElement" readonly /></td>

</tr>
<tr bgcolor="#BDBDBD">
<td><b> Unit Type:</b></td>
	<td><input type="text" name="InstType" size="13" class="formElement" readonly /></td>
</tr>
<tr bgcolor="#BDBDBD">
	<td><b><b> Hold By:</b></b>
	<br><B>Received Status:</B></br></td>
	<td><input type="text" name="holdby" size="20" class="formElement" readonly /><br></br>
	<input type="text" name="recby" size="20" class="formElement" readonly />	
	</td>
</tr> 
	
<tr bgcolor="#BDBDBD">
	<td><b> Installation Date:</b></td>
	<td><input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=today%>" readonly class="formElement" />
  
            
               <input type="button" name="trigger" id="trigger" value="Inst Date" class="formElement"/>
               <script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script></td>
	<td><b> Installation Time:</b></td>
	<td><b>HH : </b> <select name="hour" class="formElement">
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
             </select>  <b>
         MM :</b> <select name="minutes" class="formElement">
            
                  <option value="00">00</option>
                  <option value="10">10</option>
                  <option value="20">20</option>
                  <option value="30">30</option>
                  <option value="40">40</option> 
                  <option value="50">50</option>
</select>
        </td>
</tr>
<tr bgcolor="#BDBDBD">
	<td><b> Installed at:</b></td>
	<td><select name="instat" onChange="OnChangeFunc2(this);" class="formElement">
	 <option value="Select">Select</option>
<%
  sql="select LName from t_location order by LName";
  ResultSet rst2=st.executeQuery(sql);
  while(rst2.next())
  { %>
     <option value="<%=rst2.getString("LName") %>"> <%=rst2.getString("LName") %> </option>
<% } %>
     <option value="Other"> Other </option>
   </select>
<div id="othinstloc" style="visibility:hidden"> <center><input type="text" name="othinst" size="20" class="formElement"> </input> </center> </div></td>
	<td><input type=checkbox name="instin" value="instin" checked onChange="OnChangeChkBx(this);" /> <b>Installed in India</b></td>
	<td><b>
Time  </b>
<input type="text" name="tme" value="5:30" size="5" readonly  class="formElement"> </input>
<div id="nwtme" style="visibility:hidden"> <center><input type="text" name="newtme" size="5"  class="formElement"> </input> </center> </div> </td>
</tr>

<!-- When Voice Call will be selected, two text boxes will get appeared to enter two Mobile No's which is mandatory-->
<tr bgcolor="#BDBDBD">
	<td><b> Type of Unit:</b></td>
	<td>
	<select name="typeunit" class="formElement" onChange="voicecall(this);">
       <option value="SELECT" >SELECT  </option>
        <option value="NORMAL" >NORMAL  </option>
        <option value="TEMPSENSOR" >TEMPSENSOR  </option>
        <option value="FUELFLOW" >FUELFLOW  </option>
	<option value="VOICECALL" >VOICE CALL  </option>
	<option value="BUZZER" >BUZZER  </option>
	<option value="JRM" >JRM</option> 
		<option value="GENSETTRACK" >GENSET TRACK</option> 
		<option value="SMARTCARD" >SMARTCARD</option> 
		<option value="FM2200" >FM2200</option>
	    	<option value="AVLLITE" >AVL LITE</option>
    </select>
<div id="voiceparam" style="display:none">
  <br>
  
	<label for="voic1" name="voic1" id="voic1" style="visibility:visible"> <font color="maroon">Voice Call no.1 </b></label>
     <input type="text" name="voice1" class="formElement" style="visibility:visible" />

<br>
	<label for="voic2" style="visibility:visible"> <font color="maroon">Voice Call no.2 </b> </label>
     <input type="text" name="voice2" class="formElement" style="visibility:visible" />
 </div>

	</td>
	<td><b>Installed By:</b></td>
	<td> <select name="instby" class="formElement">
	<option value="Select">Select</option>
<% sql="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc" ;
   ResultSet rst4=st.executeQuery(sql);
    while(rst4.next())
    { %>
     <option value="<%=rst4.getString("tech") %>"> <%=rst4.getString("tech") %> </option>
<%  } %>
<!-- 		<option value="Customer">Customer</option>  -->
        </select>
		
	 </td>
</tr>

<tr bgcolor="#BDBDBD">
	<td> <b> Old Unit Condition <br> (Physically Damaged):</b> </td>
	<td> <input type="radio" name="phydamaged" value="Yes" onClick="showDamageOpt(0);">Yes</input>
             <input type="radio" name="phydamaged" value="No" checked onClick="showDamageOpt(1);">No</input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br> 
<div id="damagedoption" style="display:none"> 

	<table border="0" width="100%">
	<tr> 
	   <td>
		<input type="checkbox" name="gpsantcut"	value="GPS Antenna Cut"> GPS Antenna Cut  </td>
	   <td>
		<input type="checkbox" name="greenlightoff" value="Green Light Off"> Green Light Off  </td>
	   <td>
		<input type="checkbox" name="loosecon" value="Loose Connection"> Loose Connection  </td>
	</tr>
	<tr>
	  <td>	
		<input type="checkbox" name="powharndam" value="Power Harness Damage"> Power Harness Damage  </td>
	  <td>
		<input type="checkbox" name="unitfndop" value="Unit Found Open"> Unit Found Open     </td>
	  <td>
		<a href="#" onClick="NewDamageOpt();" > Other </a>
	  </td>
	 </tr>
	</table>
</div>	
<br>
	<input type="text" name="newdamageoption" style="visibility:hidden"/>
	</td>
	<td> <b> New Unit Run on: </b> </td>
	<td> <input type="radio" name="unitrunon" value="Battery" >Battery
	    <input type="radio" name="unitrunon" value="Ignition">Ignition	
	</td>
</tr>

<tr bgcolor="#BDBDBD">
				<td> <b>LED Status: </b> </td>
				<td><font>Red Light: </font> 
				 <input type="radio" name="redlight" value="On" >On
				<input type="radio" name="redlight" value="Off">Off
	
	<br></br>	<font>Green Light: </font>
				<input type="radio" name="greenlight" value="Stable" >Stable
				<input type="radio" name="greenlight" value="Blinking">Blinking
				<input type="radio" name="greenlight" value="Off">Off
	<br></br>		
				 <font> GPS Blue Light: </font> 
				 <input type="radio" name="gpslight" value="Stable" >Stable
				 <input type="radio" name="gpslight" value="Blinking">Blinking
				 <input type="radio" name="gpslight" value="Off">Off
				
	<br></br>
				 <font> Ringing: </font> 
				 <input type="radio" name="ringing" value="Yes" >Yes
				 <input type="radio" name="ringing" value="No">No
				 </td>
				 
				 <td> <b> Warranty Comment:</b> </td>
				<td> <input type="radio" name="warcom" value="Yes" onClick="showwarcom1(0);">Yes
             <input type="radio" name="warcom" value="No" onClick="showwarcom1(1);">No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br> 
<div id="warcomment" style="display:none"> 

	<table border="0" width="100%">
	<tr> 
	   <td> <textarea name="comment" class="formElement"> </textarea> </td>
	 </tr>
	 
	
	</table>
	 
</div>	
</tr>


<tr bgcolor="#BDBDBD">		
				<td> <b>Special Comment: </b></td>
				<td><%String que="select Comment from t_commentlist where Modulename='DiarySystem' and Listname='Unit'";
				ResultSet rsget=stmt2.executeQuery(que);
				
				%>
				<select name="spcomment" id="spcomment" class="formElement">
				<option value="Select">Select</option>
				<%while(rsget.next())
					{%>
				<option value="<%=rsget.getString("Comment") %>"><%=rsget.getString("Comment") %></option>
				<%} %>
				</select></td>
	<td> <b> Old Unit with: </b></td>
		 <td><input type="radio" name="oldunitwith" value="Cust">Cust</input>
		 <input type="radio" name="oldunitwith" value="Tech">Tech</input>
	  </td>
</tr>
<tr bgcolor="#BDBDBD">		
				<td> <b>Extra Comment: </b></td>
				 <td><textarea name="extracomment" class="formElement"> </textarea> 
				 </td>
		
	
</tr>
<tr bgcolor="#BDBDBD">
   <td colspan="4" align="center"> <B> <I> Driver Details </I> </B>  </td>
</tr>
<!-- Below 3 fileds are not mandatory to fill -->
<tr bgcolor="#BDBDBD">
  <td> <b>  Driver Name:  </b> </td>
  <td> <input type="text" name="drivername" class="formElement" /></td>
  <td> <b> Driver Code: </b></td>
  <td> <input type="text" name="drivercode" class="formElement" /></td>
</tr>
<tr bgcolor="#BDBDBD">
  <td colspan="4" align="center"> <b>  Driver Mob. No.:  </b> &nbsp;&nbsp;
<input type="text" name="drivermob" class="formElement" /> </td>
</tr>
<%
	int defaultST=0,defaultTX=0,defaultRA=0,defaultRD=0,defaultOS=0;
	String sqlDefault1="select ST,TX,AccelerationSpeedVarLimit,DecelerationSpeedVarLimit,Overspeedlimit from db_gps.t_defaultvals where OwnerName='Default'";
	ResultSet rsDefault1=st2.executeQuery(sqlDefault1);
	if(rsDefault1.next()){
	defaultST=rsDefault1.getInt("ST");
	defaultTX=rsDefault1.getInt("TX");
	defaultRA=rsDefault1.getInt("AccelerationSpeedVarLimit");
	defaultRD=rsDefault1.getInt("DecelerationSpeedVarLimit");
	defaultOS=rsDefault1.getInt("Overspeedlimit");
	}

	String sqlDefault="select ST,TX,RA,RD,OS from db_gps.t_vehicledetails where vehicleCode='"+vid+"'";
	ResultSet rsDefault=st2.executeQuery(sqlDefault);
	if(rsDefault.next()){
		defaultST=rsDefault.getInt("ST");
		defaultTX=rsDefault.getInt("TX");
		defaultRA=rsDefault.getInt("RA");
		defaultRD=rsDefault.getInt("RD");
		defaultOS=rsDefault.getInt("OS");
	}
	%>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>ST. Interval </b><input name="ST" id="ST"  size="13" class="formElement" value="<%=defaultST%>" readonly> &nbsp;&nbsp;&nbsp;
		<!-- <a style="color: #491FE2" onclick="showwarcom('dispST');"><u>Change for this vehicle</u></a> -->
		<div id="dispST" style="display: none;" align="right">
		<input name="getST" id="getST" class="formElement"  size="13">
		<input type="hidden" name="vid" id="vid" class="formElement"  value="<%=vid %>" size="13">
		</div>
		</td>
	
		<td colspan="2"><b>TX. Interval</b> <input name="TX" id="TX"  size="13" class="formElement"  value="<%=defaultTX%>" readonly> &nbsp;&nbsp;&nbsp;
		<!-- <a style="color: #491FE2" onclick="showwarcom('dispTX');"><u>Change for this vehicle</u></a> -->
		<div id="dispTX" style="display: none;" align="right">
		<input name="getTX" id="getTX" class="formElement"  size="13">
		</div>
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>RA. Interval </b><input name="RA" id="RA" size="13" class="formElement"  value="<%=defaultRA%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--<a style="color: #491FE2" onclick="showwarcom('dispRA');"><u>Change for this vehicle</u></a> -->
		<div id="dispRA" style="display: none;" align="right">
		<input name="getRA" id="getRA" class="formElement"  size="13">
		</div>
		</td>
		<td colspan="2"><b>RD. Interval </b><input name="RD" id="RD"  size="13" class="formElement"  value="<%=defaultRD%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--<a style="color: #491FE2" onclick="showwarcom('dispRD');"><u>Change for this vehicle</u></a> -->
		<div id="dispRD" style="display: none;" align="right">
		<input name="getRD" id="getRD" class="formElement"  size="13">
		</div>
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>OS. Interval </b><input name="OS" id="OS"  size="13" class="formElement"  value="<%=defaultOS%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--<a style="color: #491FE2" onclick="showwarcom('dispOS');"><u>Change for this vehicle</u></a> -->
		<div id="dispOS" style="display: none;" align="right">
		<input name="getOS" id="getOS" class="formElement"  size="13">
		</div>
		</td>
		<td colspan="2"></td>
	</tr>
<tr bgcolor="#BDBDBD">
<td colspan="4"><div align="center"><input type="submit" name="submit" value="Submit" class="formElement"></div></td>
</tr>
	</table>
<%
    } //close of inner else
} 
else
{  
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="center"> <font> <B> Please add Complaint for this Vehicle, then you can replace its Unit. <br><a href="addcomplaint.jsp?vid=<%=vid%>&parameter=<%=para %>&tid=<%=tid %>&tcategory=<%=tcategory %>"> Click Here </a>  to lodge Complaint. </B> </font> </td>
		</tr>
	</table>

  	
<%
}
		


if(para!=null && para.equalsIgnoreCase("tech"))
	{
%>
<input type="hidden" name="parameter" value="<%=para%>" />
<%} %>
<input type="hidden" name="page" value="repunit" />
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
