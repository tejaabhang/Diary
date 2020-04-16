<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
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

showvoicepar="No";


function validate()
{ 
	//alert("in validate function");
	
	 var own= document.unitaddform.owner.value;  
	//	alert(own);
		if(own=="Select")
	    {
	      alert("Please Select one value from Owner List");
	      return false;
	    }
    var veh=document.unitaddform.vehno.value;
	     if(veh=="")
	     {
	       alert("Please enter Vehicle Registration No.");
	       return false;
	     }
     var vdt=document.unitaddform.calender.value;
     if(vdt.length=="")
     {
       alert("Please enter Date");
       return false;
     }
      var unid=document.unitaddform.uid.value;
      if(unid.length=="")
      {
        alert("Please enter Unit Id");
        return false;
      }
      var mobno=document.unitaddform.mobno.value;  
      if(mobno.length=="")
      {
        alert("Please enter Mobile No.");
        return false;
      }
      var simno=document.unitaddform.simno.value;
      if(simno.length=="")
      {
        alert("Please enter Sim No.");
        return false;
      }
     
       if(mobno.length<10)
      {
        alert("Please enter Proper Mobile No.");
        return false;
      }
      
      if(simno.length<8)
      {
        alert("Please enter Proper Sim No.");
        return false;
      }

      var hour= document.unitaddform.hour.value; 
     // alert(hour) 
      if(hour=="Select")
      {
        alert("Please select Time");
        return false;
      }
      var instat= document.unitaddform.instat.value;  
      if(instat=="Select")
      {
        alert("Please Select Installed Place");
        return false;
      }
      var instby=document.unitaddform.instby.value;
      if(instby=="Select")
      {
        alert("Please Select Technician Name");
        return false;
      }
     
      var limit11=document.getElementById("limit11").value;
    //  alert(limit11);
  	var unitholdby=document.unitaddform.holdby.value;
    //  alert(unitholdby);
      var recby=document.unitaddform.recby.value;
    //  alert(recby);
      var user=document.unitaddform.user.value; 
   //   alert(user);
      var limit=document.getElementById("limit").value;
   //   alert(limit);
var to=document.unitaddform.to.value;
//alert(to);
if(to==""||to==null){
	alert("please enter valid Mail ID's in To field");
	return false;
}
var cc=document.unitaddform.cc.value;
//alert(cc);
if(cc==""||cc==null){
	alert("please enter valid Mail ID's in CC field");
	return false;
}
     unitholdby = unitholdby.replace(/^\s+|\s+$/g,"");//trim
 	recdby = recby.replace(/^\s+|\s+$/g,"");//trim
 	if(limit11=="No")
	{
	alert("Cannot add more units for selected transporter");
	return false;
	}
 	if(limit11=="Yes1")
	{
	alert("Number Of units Installed for transporter are greater than unitlimit");
	return false;
	}
	if(limit=="No")
	{
	alert("Cannot add more units for selected transporter");
	return false;
	}
	var drivarname=document.unitaddform.drivername.value;  
  	// alert(drivarname);
  	 var drivermobno=document.unitaddform.drivermob.value;  
  	// alert(drivermobno);
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
	if(limit=="Yes1")
	{
	alert("Number Of units Installed for transporter are greater than unitlimit");
	return false;
	}
     if(document.unitaddform.instin.checked == false)
     {
       var nwtme;
       nwtme=document.unitaddform.newtme.value;
      
        if(nwtme.length=="")
        {
          alert("Please enter Time");
          return false;
        }
        else { }
     } 
     else { }

    if(showvoicepar=="Yes")
   {
	var voic1=document.unitaddform.voice1.value;
	var voic2=document.unitaddform.voice2.value;

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

   }	
    
	if(document.unitaddform.unitrunon[0].checked==false && document.unitaddform.unitrunon[1].checked==false)
	{
		alert("Please select whether the Unit runs on Battery or Ignition");
		return false;
	}	
	if(unitholdby != instby)
 	{

 		if(instby=="customer")
 		{
 		}
 		else
 		{
 		//alert("Hi"+unitholdby);
 		//alert("Hi"+unitinstalby);
 		
 		if(user=="Manager" || user=="admin" || user=="SuperAdmin" )
 		{
			var ans=confirm("UNIT HOLD BY DIFFERENT TECH/CUST");
			if(ans==true)
			{
				
				if(recby=="NO")
			 	{
				 	var msg=confirm("UNIT NOT RECEIVED BY TECH/CUST. FIRST RECEIVE IT");
				 	if(msg==true)
					 	return true;
				 	else
					 	return false;
			 	}
				else
					return true;
				
			}
			else
				return false;
 		}	 
 		else
 		{
 	 	alert("UNIT HOLD BY DIFFERENT TECH/CUST");
 		return false;
 		}
 		} 
 	}
	 var soldout= document.unitaddform.soldout.value; 
     // alert(hour) 
      if(soldout=="Select")
      {
        alert("Please select (Soldout/Demo/Lease)");
        return false;
      }
		

 	//alert("Hi"+recby);
 	
 	if(recby=="NO")
 	{
 		alert("UNIT NOT RECEIVED BY TECH/CUST. FIRST RECEIVE IT");
 		if(user=="Manager" || user=="admin" || user=="SuperAdmin")
 	 	return true;
 		else
 		return false;
 		
 	}
 	 
  return true;
 }
function OnChangeOs1(dropdwn)
{
	 var vv1=dropdwn.selectedIndex;
	 
}
function OnChangeFunc1(dropdown)
  {
	  
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
 
        if(SelValue1=="Other")
        {                           
            window.location = 'newcustadd.jsp';
        }
        else {
           
        
             }
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
        else { 
         document.getElementById("othinstloc").style.visibility="hidden";   
         document.unitaddform.othinst.value="";
             }
 }    


function OnChangeChkBx()
{
  
  if(document.unitaddform.instin.checked == false)
  {
   
   document.unitaddform.tme.disabled=true;
   document.unitaddform.tme.value="";
   document.getElementById("nwtme").style.visibility="visible";

   }
  else
  {
    document.unitaddform.tme.disabled=false;
   document.unitaddform.tme.value="5.30";
   document.unitaddform.newtme.value="";
   document.getElementById("nwtme").style.visibility="hidden";
  }
}

function OnChangeFunc3(dropdown)
{
	//alert("i m here");
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
 
 
 
        if(SelValue1=="Other")
        {
                 
            window.location = 'newcustadd.jsp';
        }
        else { 

			
        	 var v2=dropdown.value;
             //alert(v2);
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

                               reslt = reslt.replace(/^\s+|\s+$/g,"");//trim
                             //  alert(reslt);
                               document.unitaddform.limit.value=reslt;
                              // document.getElementById("limit").value=reslt;
     
          		   if(reslt=="No")
          		   {
              		   alert("Installations are completed for "+v2 +" as per limit");
              		   return false;
          		   }
          		  if(reslt=="Yes1")
         		   {
             		   alert("Installations are more than allowed limit for "+v2);
             		   return false;
         		   }
          	       } 
                     }
                     
           
                    var queryString = "?transporter=" +v2;
          	   ajaxRequest.open("GET", "gettransporterlimit.jsp" + queryString, true);
          	   ajaxRequest.send(null); 

            }

}

function AJAXFunc()
{
 // alert("in ajax function");
  var v1=document.unitaddform.uid.value;
 // alert(v1);
  var v2=document.unitaddform.owner.value;
//  alert(v2);
  var v3=document.unitaddform.hiddentransp.value;
 
  //alert(v3);
  
  if(v3!=""||v3!=null)
  {
	owner=v2;
	  }else{
		owner=v3;
		  }
  //alert(owner);

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
				//	alert(reslt);
                      var mySplitResult = reslt.split("#");
                      var mySplitResult1=  mySplitResult[0]; 
                      var mySplitResult2=  mySplitResult[1];

// Results from Ajaxunitadd.jsp are put into fields
mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[1] = mySplitResult[1].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[2] = mySplitResult[2].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[3] = mySplitResult[3].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[4] = mySplitResult[4].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[5] = mySplitResult[5].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[6] = mySplitResult[6].replace(/^\s+|\s+$/g,"");//trim
mySplitResult[7] = mySplitResult[7].replace(/^\s+|\s+$/g,"");//trim
 		      		  document.unitaddform.mobno.value = mySplitResult[0];
                      document.unitaddform.simno.value = mySplitResult[1];
                      document.unitaddform.recby.value = mySplitResult[3];
                      document.unitaddform.holdby.value = mySplitResult[4];
                      document.unitaddform.InstType.value = mySplitResult[2];
                      var swver=mySplitResult[5];
                      var invalide=mySplitResult[6];
                       var available=mySplitResult[7];
                  //  alert(invalide);
                     // alert(swver);
						if(
							(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Castrol")!=-1))
							||(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Praxair")!=-1))
							)
							{
							 	alert("AVL_LITE unit is not allowed in "+owner);
									return false;
                       		}
						if(invalide=="Yes"){
							alert("Invalide software version in "+v1);
							return false;
                  		}
                  		 if(available=="No"){
                  		 alert("unitid already exists in other vehicle");
                         return false;

                          }
 	       } 
            }
            
  
           var queryString = "?unid=" +v1;
 	   ajaxRequest.open("GET", "Ajaxunitadd.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
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
	st3=conn1.createStatement();
	String userrole=session.getAttribute("userrole").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
	String transp=request.getParameter("transp");
	String transporter=request.getParameter("transporter");
	String unidchk=request.getParameter("unidchk");
	String unitid=request.getParameter("unitid");
	String limitstring=request.getParameter("limit");
	String countstring=request.getParameter("count");
	String vehno=request.getParameter("vehno");
	String mobno=request.getParameter("mobno");
	String simno=request.getParameter("simno");
	String grp=request.getParameter("grp");
	
%>
<form name="unitaddform" method="get" action="insertVehExchangeNew.jsp" onsubmit="return validate();">
	<input type="hidden" name="user" id="user" value=<%=userrole %>></input>
	<input type="hidden" name="limit" id="limit" value=<%=userrole %>></input>
<%
	if(unidchk==null)
	{
	}
	else
	{
	  String own=request.getParameter("own");
	  String vehnumb=request.getParameter("vehnumb");
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
   	<tr> 
   		<td> 
   			<div align="center">
     			<font size="2"> 
     				<b> <I><U>CAUTION:</U></I> This Unit Id <%=unidchk %> is already in use in Vehicle no. <%=vehnumb %> of <%=own %> </b> 
     			</font>
     		</div> 
     	</td> 
     </tr> 
<%
	}
	if(limitstring==null||countstring==null){
%>
	<input type="hidden" name="limit11" id="limit11" value="-" />
<%
	}
	else{
	int limit1=Integer.parseInt(limitstring);
	//out.println(limit1);
	int count=Integer.parseInt(countstring);
	//out.println(count);
	String limit11="";
	if(count!=0 && limit1!=0 && count==limit1)
	{	
		limit11="NO";
%>
	<tr> 
		<td> 
			<div align="center">
				<font size="3"> <b> Installations are completed for <%=transporter %> as per limit</b> </font>
			</div> 
		</td> 
	</tr>
<%
	}
	else if(count!=0 && limit1!=0 && count>limit1)
	{
		out.println("Yes1");limit11="Yes1";
%>	
	<tr> 
		<td> 
			<div align="center">
				<font size="3"> <b>Installations are more than allowed limit for <%=transporter %></b> </font>
			</div> 
		</td> 
	</tr>

<%}else{
	//out.println("Yes");limit11="Yes";
}
%>
</table>
<input type="hidden" name="limit11" id="limit11" value=<%=limit11 %>></input>
<%
}String send=request.getParameter("send");
if(send==null)
{
}
else
{
	String newunitid=request.getParameter("unitidnew");
	String veh="";
	
	String sql5="select * from t_vehicledetails where UnitId='"+newunitid+"' ";
	ResultSet rs5=st2.executeQuery(sql5);
	if(rs5.next())
	{
		veh=rs5.getString("VehicleRegNumber");
	}	
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
    <tr> <td> <div align="center"> <font color="black" size="1"> <b> Successfully Inserted ( Vehicle No <%=veh%> with Unit Id <%=newunitid %> ) </b></font> </div> </td> </tr> </table>
<%
}

String dupveh=request.getParameter("dupveh");
String unidindupveh=request.getParameter("unidinveh");
String ownnam=request.getParameter("ownernam");
if(dupveh==null)
{
}
else
{%>
  <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
    <tr> <td> <div align="center"> <font color="black" size="1"> <b> <I><U> CAUTION:</U></I> Vehicle <%=dupveh %> is already running for <%=ownnam %> with UnitId = <%=unidindupveh %> </b></font> </div> </td> </tr> </table>
<%}%>



 	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Unit Addition</b>  </font></td>
		</tr>
	</table>
	<br></br>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Old Transporter: </b></font></td>
			<td><%=transp%><input type="hidden" name="oldtransp" class="formElement" value="<%=transp%>" readonly/> </td>
			<td>
				<font color="black" ><b> Old Group:</b></font>
			</td>
			<td><%=grp%>
				<input type="hidden" name="oldgroup" size="10" class="formElement" value="<%=grp%>" readonly/>
			</td>
		</tr>
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Old Vehicle Reg. No.: </b></font></td>
			<td><%=vehno%><input type="hidden" name="oldvehno" class="formElement" value="<%=vehno%>" readonly/> </td>
			<td>
				<font color="black" ><b> Old Unit Id:</b></font>
			</td>
			<td><%=unitid%>
				<input type="hidden" name="olduid" size="10" class="formElement" value="<%=unitid%>" readonly/>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Old mobile no: </b></font></td>
			<td><%=mobno%><input type="hidden" name="oldmobno" class="formElement" value="<%=mobno%>" readonly/> </td>
			<td>
				<font color="black" ><b> Old simno:</b></font>
			</td>
			<td><%=simno%>
				<input type="hidden" name="oldsimno" size="10" class="formElement"  value="<%=simno%>" readonly/>
			</td>
		</tr>
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Transporter :</b></font></td>
			<td>
<%if(transporter!=null){%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value="<%=transporter %>"></input>

<%}else{
%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value=""></input>
<%
}%>
			<select name="owner" id="owner" onChange="OnChangeFunc3(this);" class="formElement"  <%if(transporter!=null){%> disabled <%} %>>
        		<option value="Select"> Select </option>
<%
				username=session.getAttribute("username").toString();
				sql="select Distinct(TypeValue) as Transporter from t_transporter order by TypeValue";
				ResultSet rst=st3.executeQuery(sql);
				while(rst.next())
				{
					String Transporter=rst.getString("Transporter");
%>
				<option value="<%=rst.getString("Transporter")%>"  <%if(transporter!=null && transporter.equalsIgnoreCase(Transporter)){ %> selected <%} %>><%=rst.getString("Transporter")%></option>
<%
				}
%>
			    <option value="Other"> Other </option>
			</select>
			</td>
			<td><font color="black" ><b>Group: </b></font></td>
			<td>
   				 <select name="cust" onChange="OnChangeFunc1(this);" class="formElement"> 
         			<option value="None" > None </option>
<% 
					sql="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='GROUP' order by TypeValue";
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

			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Vehicle Reg. No.: </b></font></td>
			<td><input type="text" name="vehno" class="formElement" /> </td>
			<td>
				<font color="black" ><b>Unit Id:</b></font>
			</td>
			<td>
				<input type="text" name="uid" size="10" class="formElement" onblur="AJAXFunc()" />
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td>
				<font color="black" ><b>Mobile No.: </b></font>
			</td>
<!-- When mobno textbox will be clicked, AJAXFunc() in javascript will be called which again calls Ajaxunitadd.jsp and MobNo and SIM No wil be put automatically in their respective fields.  -->
			<td>
				<input type="text" name="mobno" size="13" class="formElement" readonly/> 
			</td>
			<td>
				<font color="black" ><b>Sim No.:</b></font>
			</td>
			<td>
				<input type="text" name="simno" size="13" class="formElement" readonly>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td>
				<font color="black" ><b>Unit Type:</b></font>
			</td>
			<td>
				<input type="text" name="InstType" size="13" class="formElement" readonly> 
			</td>
			<td>
				<font color="black" ><b>OS Duration In Sec:</b></font>
			</td>
			<td>
				<select name="osdur" onChange="OnChangeOs1(this);" class="formElement"> 
        		 <option value="1" > 1 </option>
         		 <option value="10" selected> 10 </option>
         		</select>
				<!--<input type="text" name="osdur" size="13" class="formElement" readonly>--> 
			</td>
		</tr>
		<tr id="holdby"  bgcolor="#BDBDBD">	
				<td><font color="black"><b>Hold By:</b></font></td><td><input type="text" name="holdby" id="holdby" size="20" class="formElement" readonly /></td>
				<td><font color="black"><B>Received Status:</B></font></td>
				<td>
					<input type="text" name="recby" id="recby" size="20" class="formElement"  readonly/>	
				</td>
		</tr> 
		<tr bgcolor="#BDBDBD">
			<td>
				<font color="black" ><b>Installation Date:</b></font>
			</td>
			<td>
				 <input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=today %>" readonly/>
            	 <input type="button" name="trigger" id="trigger" value="Inst Date" class="formElement">
             	 <script type="text/javascript">
		             Calendar.setup(
		             {
		                 inputField  : "calender",         // ID of the input field
		                 ifFormat    : "%Y-%m-%d",     // the date format
		                 button      : "trigger"       // ID of the button
		             }
		                           );
             	</script>
			</td>
			<td>
				<font color="black" ><b>Installation Time:</b></font>
			</td>
			<td>       
				<font color="black" >HH : </font> 
				<select name="hour" class="formElement">
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
             </select>  <font color="black">
         	MM :</font> <select name="minutes" class="formElement">
            
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
			<td>
				<font color="black" ><b>Installed at: </b></font>
			</td>
			<td>
				<select name="instat" onChange="OnChangeFunc2(this);" class="formElement">
        		<option value="Select"> Select </option>
<%
  					sql="select LName from t_location order by LName";
  					ResultSet rst2=st.executeQuery(sql);
  					while(rst2.next())
  					{ 
%>
     			<option value="<%=rst2.getString("LName") %>" > <%=rst2.getString("LName") %> </option>
<% 
					} 
%>
			    <option value="Other"> Other </option>
                </select>
				<div id="othinstloc" style="visibility:hidden"> <center><input type="text" name="othinst" size="20"> </center> </div> 
			</td>
			<td>
				<font color="black" ><b>Type of Unit:</b></font></td>
				<!-- When Voice Call will be selected, two text boxes will get appeared to enter two Mobile No's which is mandatory-->
			<td>
			<select name="typeunit" class="formElement" onChange="voicecall(this);">
		        <option value="NORMAL" >NORMAL  </option>
		        <option value="TEMPSENSOR" >TEMPSENSOR  </option>
		        <option value="FUELFLOW" >FUELFLOW  </option>
				<option value="VOICECALL" >VOICE CALL  </option>
				<option value="BUZZER" >BUZZER  </option> 
				<option value="JRM" >JRM</option> 
				<option value="GENSETTRACK" >GENSET TRACK</option> 
				<option value="SMARTCARD" >SMARTCARD</option> 
				<option value="FM2200" >FM2200</option>
			</select>
			<div id="voiceparam" style="display:none">
  			<br>
				<label for="voic1" name="voic1" id="voic1" style="visibility:visible"> <font color="maroon">Voice Call no.1 </font></label>
     			<input type="text" name="voice1" class="formElement" style="visibility:visible" />
			<br>
				<label for="voic2" style="visibility:visible"> <font color="maroon">Voice Call no.2 </font> </label>
    			 <input type="text" name="voice2" class="formElement" style="visibility:visible" />
 			</div>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Installed By: </b></font></td>
			<td><select name="instby" class="formElement">
 				<option value="Select"> Select </option>
<% 
				sql="select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc" ;
   				ResultSet rst3=st.executeQuery(sql);
   			    while(rst3.next())
			    { 
%>
     			<option value="<%=rst3.getString("tech") %>"> <%=rst3.getString("tech") %> </option>
<%  } %>
     			<option value="Customer">Customer</option> 
        		</select> 
			</td>
			<td><input type="checkbox" name="instin" value="instin" checked onChange="OnChangeChkBx(this);" class="formElement"><font color="black" ><b> Installed in India</b></font></td>
			<td><font color="black" ><b>Time</b></font>  &nbsp;&nbsp;<input type="text" name="tme" value="5:30" size="5" readonly class="formElement"> 
							<div id="nwtme" style="visibility:hidden"> <center><input type="text" name="newtme" size="5">  </center> </div> 
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Vehicle Model</b></font></td>
			<td>
				<select name="vehmodel" class="formElement" >
        			 <option value="Select">Select</option>
       				 <option value="TATA" >TATA</option>
        			 <option value="ASHOK LEYLAND" >ASHOK LEYLAND</option>
       				 <option value="EICHER" >EICHER</option>
					 <option value="VOLVO" >VOLVO</option>
  	   			 </select>
			</td>
			<td><font color="black" ><b>Vehicle Type</b></font></td>
			<td>
				<select name="vehtype" class="formElement" >
         			<option value="Select">Select</option>
       				<option value="AC" >AC</option>
       				<option value="NONAC" >NON AC</option>
  	           </select>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Vehicle Desc</b></font></td>
 			<td> <input type="text" name="vehdesc" class="formElement" /></td>
 			<td><font color="black" ><b>Soldout/Demo</b></font></td>
			<td>
				<select name="soldout" class="formElement" >
        			 <option value="Select">Select</option>
        			 <option value="Lease" >Lease</option>
        			 <option value="Yes" >Soldout</option>
        			 <option value="No" >Demo</option>
  	    		</select>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="2" align="center"> <font color="black" ><b>  New Unit Run on: </B> </font> </td>
			<td colspan="2" align="left"> <input type="radio" name="unitrunon" value="Battery" >Battery
	  			<input type="radio" name="unitrunon" value="Ignition">Ignition
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
  			 <td colspan="4" align="center"> <font color="brown"> <B>  Driver Details </B> </font> </td>
		</tr>
<!-- Below 3 fileds are not mandatory to fill -->
		<tr bgcolor="#BDBDBD">
		  <td> <font color="black" > <b> Driver Name: </b> </font> </td>
		  <td> <input type="text" name="drivername" class="formElement" /></td>
		  <td> <font color="black" > <b> Driver Code: </b> </font></td>
		  <td> <input type="text" name="drivercode" class="formElement" /></td>
		</tr>
		<tr bgcolor="#BDBDBD">
		  <td colspan="4" align="center"> <font color="black" > <b> Driver Mob. No.: </b> </font> &nbsp;&nbsp;
				<input type="text" name="drivermob" class="formElement" /> </td>
		</tr>
		
		<tr bgcolor="#BDBDBD">
		  <td colspan="4" align="center"> <font color="black" > <b> To(enter comma seperated mail id):</b> </font> &nbsp;&nbsp;
				<textarea rows="1" cols="70" name="to"  class="formElement"></textarea> </td>
		</tr>
		<tr bgcolor="#BDBDBD">
		  <td colspan="4" align="center"> <font color="black" > <b> CC(enter comma seperated mail id):</b> </font> &nbsp;&nbsp;
				<textarea rows="1" cols="70" name="cc"  class="formElement"></textarea> </td>
		</tr>
		<tr bgcolor="#BDBDBD">
		  <td colspan="1" align="center"> <font color="black" > <b> Reason for vehicle exchange:</b> </font></td>
			<td>	<textarea rows="1" cols="30" name="reasonForExch"  class="formElement"></textarea> </td>
		  <td colspan="1" align="center"> <font color="black" > <b> Comment :</b> </font> </td>
				<td><textarea rows="1" cols="30" name="commentForExchange"  class="formElement"></textarea> </td>
		</tr>
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