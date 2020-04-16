
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>

 <jsp:useBean id="diary" class="com.diary.beans.classes" scope="page">
<%@ include file="header.jsp" %>
<%
diary.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
diary.getConnection1(MM_dbConn_DRIVER,MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
%>


<%!Connection conn, conn1;
	Statement st, st1, st2, st3, st4,sterp1,sterp2,sterp3,sterp4,sterp5,sterp6;
	String sql, sql1, sql2, sql3, sql4, username, userrole, olddate, Svehlist;
	int total, updated, dealy, disconnected, notactive, transid;
	String vid, vehno;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Seven Day Diary System.</title>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<style type="text/css">
@import url(jscalendar-1.0/calendar-win2k-1.css);
</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script language="javascript">
showvoicepar="No";

var state = 'none';

function showwarcom1(layer_ref) {
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
warcommentt="No";
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
            {
     	       if(ajaxRequest.readyState == 4)
                {
                      var reslt=ajaxRequest.responseText;
					 // alert(reslt);
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

                      mySplitResult[10] = mySplitResult[10].replace(/^\s+|\s+$/g,"");
                      mySplitResult[11] = mySplitResult[11].replace(/^\s+|\s+$/g,"");////got the peripheral from unitmaster

                      //alert("mySplitResult[10]=UNIT REPlacement=>"+mySplitResult[10]);


                      if(mySplitResult[11]=="Noperi")
                      {

                        
                         //alert(""+mySplitResult1+" ");
                      	//document.repunitform.newunid.value="";
                         document.repunitform.typeunit.value="-";
                      }else{
 // alert("else loop==> "+mySplitResult[11])
                      	document.repunitform.typeunit.value=mySplitResult[11];

                      }

                      if(mySplitResult[10]=="MobNoFlush")
                      {

                         alert("Mobile No."+mySplitResult1.trim()+" for unit " +v1+" is been deactivated. ");
                      	document.repunitform.newunid.value="";
                  
                      }
					  // Results from Ajaxunitadd.jsp are put into fields
					  var swver=mySplitResult6;
					  var invalide=mySplitResult7;
					  var available=mySplitResult8;
 		              document.repunitform.mobno.value = mySplitResult1;
                      document.repunitform.simno.value = mySplitResult2;
                      document.repunitform.InstType.value = mySplitResult3;
                      document.repunitform.jrm.value = mySplitResult9;
                     // document.repunitform.recby.value = mySplitResult5;
                      
                      
                     // alert("software version is"+swver);
      					if(
      						(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Castrol")!=-1))
      						||(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Praxair")!=-1))
      						)
      						{
      						 alert("AVL_LITE unit is not allowed in "+owner);
      								return false;
                        		}else{
								//	alert("condition is not matched");
                            		}
      					if(invalide=="Yes"){
							alert("Invalide software version in "+v1);
							return false;
                  		}
                  		if(available=="Yes"){
									alert("Unit ID "+v1+" already available in other vehicle.");
                      		}
                  		
 	       }
            }
            
  
           var queryString = "?unid=" +v1;
 	   ajaxRequest.open("GET", "Ajaxunitadd.jsp" + queryString, true);
 	   ajaxRequest.send(null); 
}

function validate()
{
	//alert("in validate function")
	var waranty=document.getElementById("warranty").value;
	if(waranty=="No")
		{
	var chk1="";
	try{
	try{
	    //alert("chk1");
	chk1=document.getElementById("check1").checked;
	//alert("chk1"+chk1);
	}catch(e){
	}
	try{
	var chk2=document.getElementById("check2").checked;
	//alert("chk2"+chk2);
	}catch(e){
	}
	try{
	var chk3=document.getElementById("check3").checked;
	//alert("chk3"+chk3);
	}catch(e){
		
	}
	try{
	var chk4=document.getElementById("check4").checked;
	//alert("chk4"+chk4);
	}catch(e){
		
	}
	try{
	var chk5=document.getElementById("check5").checked;
	//alert("chk5"+chk5);
	}catch(e){
		
	}
	try{
	var chk6=document.getElementById("check6").checked;
	}catch(e){
		
	}
	try{
	var chk7=document.getElementById("check7").checked;
	}catch(e){
		
	}
	try{
	var chk8=document.getElementById("check8").checked;
	}catch(e){
		
	}
	try{
	var chk9=document.getElementById("check9").checked;
	}catch(e){
		
	}
	try{
	var chk10=document.getElementById("check10").checked;
	//alert("chk10:-"+chk10);
	}catch(e){
		
	}
	try{
	var chk11=document.getElementById("check11").checked;
	}catch(e){
		
	}
	try{
	var chk12=document.getElementById("check12").checked;
	}catch(e){
		
	}
	try{
	var chk13=document.getElementById("check13").checked;
	}catch(e){
		
	}
	try{
	var chk14=document.getElementById("check14").checked;
	}catch(e){
		
	}
	try{
	var chk15=document.getElementById("check15").checked;
	}catch(e){
		
	}
	try{
	var chk16=document.getElementById("check16").checked;
	}catch(e){
		
	}
	try{
	var chk17=document.getElementById("check17").checked;
	}catch(e){
		
	}
	try{
	var chk18=document.getElementById("check18").checked;
	}catch(e){
		
	}
	try{
	var chk19=document.getElementById("check19").checked;
	   }catch(e){
	}
	   
	try{
	var chk20=document.getElementById("check20").checked; 
	}catch(e){
		
	}

	try{
		var chk21=document.getElementById("check21").checked; 
	    }catch(e){
			
		}
	    
	    try{
	    	var chk22=document.getElementById("check22").checked; 
	        }catch(e){
	    		
	    	}
	        
	        try{
	        	var chk23=document.getElementById("check23").checked; 
	            }catch(e){
	        		
	        	}
	            
	            try{
	            	var chk24=document.getElementById("check24").checked; 
	                }catch(e){
	            		
	            	}
	                
	                try{
	                	var chk25=document.getElementById("check25").checked; 
	                    }catch(e){
	                		
	                	}
	                    
	                    try{
	                    	var chk26=document.getElementById("check26").checked; 
	                        }catch(e){
	                    		
	                    	}

	}catch(e){
		
	}
	/* for(var i=0;i<countinv.length;i++){

		var chk1=document.getElementById("check"+i).value;
		alert("chk1:-"+chk1);
	} */

	//if(chk1.length==false || chk2.length==false || chk3.length=="" || chk4.length=="" || chk5.length=="" || chk6.length=="" || chk7.length=="" || chk8.length=="" || chk9.length=="" || chk10.length=="" || chk11.length=="" || chk12.length=="" || chk13.length=="" || chk14.length=="" || chk15.length=="" || chk16.length=="" || chk17.length=="" || chk18.length=="" || chk19.length=="" || chk20.length=="")
		//alert( &&  &&  &&  &&  &&  &&  &&  &&  && );
	/* alert("chk3:-"+chk3);
	alert("chk4:-"+chk4);
	alert("chk5:-"+chk5);
	alert("chk6:-"+chk6);
	alert("chk7:-"+chk7);
	alert("chk8:-"+chk8);
	alert("chk9:-"+chk9);
	alert("chk10:-"+chk10); */

	/* if(countinv=="1"){


	}else{ */
	//alert(" not here");
	if( (chk1!=true || chk1=="undefined") && (chk2!=true || chk2=="undefined")  ){
		
		if( (chk3!=true || chk3=="undefined") && (chk4!=true || chk4=="undefined") ){
			
			if( (chk5!=true || chk5=="undefined") && (chk6!=true || chk6=="undefined") ){
				
				if( (chk7!=true || chk7=="undefined") && (chk8!=true || chk8=="undefined" )){
					
					if( (chk9!=true || chk9=="undefined" ) && (chk10!=true || chk10=="undefined") ){
						
						if( (chk11!=true || chk11=="undefined" ) && (chk12!=true || chk12=="undefined") ){
						
							if( (chk13!=true || chk13=="undefined") && (chk14!=true || chk14=="undefined") ){
								
								if( (chk15!=true || chk15=="undefined") && (chk16!=true || chk16=="undefined") ){
									
									if( (chk17!=true || chk17=="undefined") && (chk18!=true || chk18=="undefined") ){
										
										if( (chk19!=true || chk19=="undefined") && (chk20!=true || chk20=="undefined") ){
											alert("Please Select Invoice..");
										      return false;
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
		
	  }
	}
	var jrm=document.repunitform.jrm.value;
	//alert(jrm);
	var instruction=document.repunitform.instruction.value;
	//alert(instruction);
	if(jrm==instruction||instruction=="-"){
			//alert("right decision!!!!!!!!");
		}else{
			alert("Only JRM units are valide for this vehicle.Please use JRM unit");
			}
	var mob=document.repunitform.mobno.value;
	//alert(mob);
	var unitholdby=document.repunitform.holdby.value;
	//alert(unitholdby);
	var unitinstalby=document.repunitform.instby.value;
//	alert(unitinstalby);
	var recby=document.repunitform.recby.value;
//	alert(recby);
	var adminoption=document.repunitform.whyoption.value;
	//alert(adminoption);
    if(adminoption=="-"){
			alert("Please enter proper details instead of - in Why you are using this option?");
			return false;
        }
    if(adminoption==""||adminoption==null){
    	alert("Please enter proper details in Why you are using this option?");
		return false;
            }
	unitholdby = unitholdby.replace(/^\s+|\s+$/g,"");//trim
	//alert("unitholdby"+unitholdby)
	recdby = recby.replace(/^\s+|\s+$/g,"");//trim
	//alert("unitinstalby"+unitinstalby)
	if(unitholdby != unitinstalby)
	{

		if(unitinstalby=="customer")
		{
		}
		else
		{
		//alert("Hi"+unitholdby);
		//alert("Hi"+unitinstalby);
		//alert("UNIT HOLD BY DIFFERENT TECH/CUST");
		//return false;
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
		alert("Please Select Special Comment");
		return false;
	}
	if(document.repunitform.oldunitwith[0].checked==false && document.repunitform.oldunitwith[1].checked==false)
	{
		alert("Please select whether the Unit is with Cust / Tech / Company");
		return false;
	}

	var drivarname=document.repunitform.drivername.value;  
//  	alert(drivarname);
  	 var drivermobno=document.repunitform.drivermob.value;  
//  	alert(drivermobno);
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



function showwarcom(ind)
{ 
	if(ind==0)
	{ 
		//document.getElementById("unitdamagedopt").style.visibility="visible";
		document.getElementById("warcomment").style.display="";
		warcommentt="Yes";
	}
	else
	{ 
		//document.getElementById("unitdamagedopt").style.visibility="hidden";

		document.getElementById("warcomment").style.display='none';
		document.repunitform.newdamageoption.style.visibility='hidden';

		warcommentt="No";
	}
}

function NewDamageOpt()
{ 
	document.repunitform.newdamageoption.style.visibility="visible";
	NewDamage="Yes";
	
}

function tallyInvoice(ival,actqunty){
	//alert("ival"+ival);
	var checkInvorefNo=document.getElementById("check"+ival).value;
	//alert("checkInvorefNo:-"+checkInvorefNo);
	//alert("actqunty:-"+actqunty);
	
	try
	{
//alert("ajax 222");
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
			//alert(reslt);
			//reslt=reslt.replace(/^\s+|\s+$/g,'');
			 var reslt1 = reslt.split("#");
			 //
			 var myid="check"+reslt1[1];
			 //myid="+\""check"+reslt1[1]+\"";
			 //myid="\"check+reslt1[1]+";
			 myid='"'+myid+'"'
			 //alert("myid:-"+myid);
			 //disableidval
			 //alert("abc:-"+document.getElementById(myid).disabled);
			 //alert("reslt1[0]:-"+reslt1[0]);
			 //alert("reslt1[1]"+reslt1[1]);
			 //alert("check"+reslt1[1]);
			 var myresl=reslt1[0];
			 reslt1[1]=reslt1[1].trim();
			 //alert("myiddd:-"+'"check'+reslt1[1]+'"');
			 
			 if( myresl!=null && myresl=="Yes" ){
			    //alert("heer");
				//document.getElementById('"check'+reslt1[1]+'"').disabled = true;
				if(reslt1[1]=="1"){
					alert("Please Select different Invoice");
					document.getElementById("check1").checked = false; 
				}else if(reslt1[1]=="2"){
					alert("Please Select different Invoice");
					document.getElementById("check2").checked = false;
				}else if(reslt1[1]=="3"){
					alert("Please Select different Invoice");
					document.getElementById("check3").checked = false;
				}else if(reslt1[1]=="4"){
					alert("Please Select different Invoice");
					document.getElementById("check4").checked = false;
				}else if(reslt1[1]=="5"){
					alert("Please Select different Invoice");
					document.getElementById("check5").checked = false;	
				}else if(reslt1[1]=="6"){
					alert("Please Select different Invoice");
					document.getElementById("check6").checked = false;
				}else if(reslt1[1]=="7"){
					alert("Please Select different Invoice");
					document.getElementById("check7").checked = false;
				}else if(reslt1[1]=="8"){
					alert("Please Select different Invoice");
					document.getElementById("check8").checked = false;
				}else if(reslt1[1]=="9"){
					alert("Please Select different Invoice");
					document.getElementById("check9").checked = false;
				}else if(reslt1[1]=="10"){
					alert("Please Select different Invoice");
					document.getElementById("check10").checked = false;
				}else if(reslt1[1]=="11"){
					alert("Please Select different Invoice");
					document.getElementById("check11").checked = false;
				}else if(reslt1[1]=="12"){
					alert("Please Select different Invoice");
					document.getElementById("check12").checked = false;
				}else if(reslt1[1]=="13"){
					alert("Please Select different Invoice");
					document.getElementById("check13").checked = false;
				}else if(reslt1[1]=="14"){
					alert("Please Select different Invoice");
					document.getElementById("check14").checked = false;
				}else if(reslt1[1]=="15"){
					alert("Please Select different Invoice");
					document.getElementById("check15").checked = false;
				}else if(reslt1[1]=="16"){
					alert("Please Select different Invoice");
					document.getElementById("check16").checked = false;
				}else if(reslt1[1]=="17"){
					alert("Please Select different Invoice");
					document.getElementById("check17").checked = false;
				}else if(reslt1[1]=="18"){
					alert("Please Select different Invoice");
					document.getElementById("check18").checked = false;
				}else if(reslt1[1]=="19"){
					alert("Please Select different Invoice");
					document.getElementById("check19").checked = false;
				}else if(reslt1[1]=="20"){
					alert("Please Select different Invoice");
					document.getElementById("check20").checked = false;
				}
				
				 
				
			}else{
				//document.getElementById("myid").checked = false;
			}
			//alert(reslt);
			//document.getElementById("thisdaydiv").innerHTML = reslt;
			//window.location.reload();
			//document.getElementById("element_3_1").value='';
			//document.getElementById("element_3_2").value='';
			//document.getElementById("element_3_3").value='';
			
			}
			catch(e)
			{
				alert(e);
			}
		}
	};
	
	var queryString ="?checkInvorefNo="+checkInvorefNo+"&actqunty="+actqunty+"&ival="+ival;
	//alert(queryString);
	ajaxRequest.open("POST", "matchitemcodeadunit.jsp" + queryString, true);
	ajaxRequest.send(null); 
	}
	catch(e)
	{
		alert(e);
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
<%@ include file="header1.jsp"%></div>
<div id="gbox1">
<div id="gbox-top1"></div>
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------>
<form name="repunitform" method="get" action="repunitinsrt.jsp"
	onsubmit="return validate();">
<%



	try {
		vid = request.getParameter("vid");
		%>
		<input type="hidden" name="vid" id="vid" value="<%=vid%>" />
		<%
		//out.print(vid);
	//	Class.forName(MM_dbConn_DRIVER);
		
		
		conn = diary.ReturnConnection();
		conn1 = diary.ReturnConnection1();
		
		//conn = DriverManager.getConnection(MM_dbConn_STRING,
		//		MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	//	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,
			//	MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = conn.createStatement();
		st1 = conn.createStatement();
		st2 = conn1.createStatement();
		st3 = conn1.createStatement();
		sterp1=conn.createStatement();
		sterp2=conn.createStatement();
		sterp3=conn.createStatement();
		sterp4=conn.createStatement();
		sterp5=conn.createStatement();
		sterp6=conn.createStatement();

		Statement stmt2 = conn.createStatement();

		String userrole = session.getAttribute("userrole").toString();

		String email = "", unid = "", status = "", owner = "",Instruction="";
		StringBuffer InvList=new StringBuffer("(");
		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(dte);
		System.out.println("Today date :- "+today);
		
		String  tid=request.getParameter("tid"); 
		sql = "select * from t_vehicledetails where VehicleCode='"
				+ vid + "' ";

		ResultSet rst = st2.executeQuery(sql);
		if (rst.next()) {
			status = rst.getString("Status");
			owner = rst.getString("OwnerName");
			vehno = rst.getString("VehicleRegNumber");
			email = rst.getString("TheFieldFromEmailAddress");
			Instruction=rst.getString("Instruction");
			String sql5 = "select * from t_unitreplacement where VehCode='"
					+ vid
					+ "' or VehregNo='"
					+ vehno
					+ "' order by InstDate desc limit 1";
			//out.print(sql5);
			ResultSet rs5 = st2.executeQuery(sql5);
			if (rs5.next()) {
				unid = rs5.getString("NewUnitId");

			} else {
				//email=rst.getString("TheFieldFromEmailAddress");
				int pos = email.indexOf('@');
				unid = email.substring(2, pos);
			}

		}
%> <%
 	String send = request.getParameter("send");
 		if (send == null) {
 		} else {
 			String veh = "", unitidnew = "";
 			String sql6 = "select * from t_vehicledetails where VehicleCode='"
 					+ vid + "' ";
 			ResultSet rs6 = st2.executeQuery(sql6);
 			if (rs6.next()) {
 				veh = rs6.getString("VehicleRegNumber");
 				unitidnew = rs6.getString("UnitID");

 			}
 %>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
		<div align="center"><font color="maroon"><B>
		Successfuly Replaced ( Vehicle No <%=veh%> with Unit Id <%=unitidnew%>
		) </B></font></div>
		</td>
	</tr>
</table>
<%
	}

		String unidchk = request.getParameter("unidchk");
		if (unidchk == null) {
		} else {
			String own = request.getParameter("own");
			String vehnumb = request.getParameter("vehnumb");
%>
<table border="0" width="750px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
		<div align="center"><font color="maroon"> <b>
		Unit Id <%=unidchk%> is already in Use in Vehicle no. <%=vehnumb%> of
		<%=own%> </b></font></div>
		</td>
	</tr>
</table>

<%
	}
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>Unit Replacement</b></font></td></tr>
</table>

<%
	String warranty=request.getParameter("warranty");
%>
<input type="hidden" name="warranty" id="warranty" value="<%=warranty %>">
<% 
	System.out.println("Warranty :- "+warranty);
	if(warranty.equals("No"))
	{
	String customerCode="";
	try{
	//String sqlCustomerCode="select distinct(ERPCode) from db_GlobalERP.100000fv_erp_relation where Transporter='"+transporter+"' ";
	String sqlCustomerCode="select ERPCode from db_gps.t_transporter where ActiveStatus='Yes' and TypeValue='"+owner+"' ";
	ResultSet rsCustomerCode=sterp1.executeQuery(sqlCustomerCode);
	if(rsCustomerCode.next())
	{
	 customerCode=rsCustomerCode.getString(1);
	}
	//rsCustomerCode=null;
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
	String sqlInvList="SELECT InvRefNo ,InvValue,SUM(AmountPaidAgainstThisInvoice), (InvValue-SUM(AmountPaidAgainstThisInvoice)) as balance  from 100000custpymtagainstinv where CustomerCode ="+customerCode+" group by InvRefNo having (InvValue-SUM(AmountPaidAgainstThisInvoice)) = 0" ;
	ResultSet rsInvList=sterp2.executeQuery(sqlInvList);
	System.out.println("query==>"+sqlInvList);
	while(rsInvList.next())
	InvList.append("'"+rsInvList.getString(1)+"',");
	InvList.append("'0')");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	int i=1;
	try{
	
	String sqlerp1="select InvoiceNo,InvoiceDate,TWEmpName,invoiceRefNo from db_GlobalERP.100000invoicedet where customercode = "+customerCode+" and InvoiceCancelled=0  and TWEmpName  NOT IN ('Autogenerated','PhysicalDamage')  order by InvoiceDate desc limit 20";
System.out.println("sqlerp1==>"+sqlerp1);
	//sqlerp1="SELECT *  from 100000customerledgeraccount where CustomerCode ="+customerCode+" and TransactionType='Invoice' and TransactionDetail not in "+InvList+" order by TransactionDate desc limit 20 ";
	ResultSet rserp=sterp3.executeQuery(sqlerp1);
	
	
	%>
	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">Check</div></th>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">Inv No</div></th>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">Inv Date</div></th>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">Qty</div></th>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">ItemDescription</div></th>
	<th style='border: ; border-color: ; background-color: ;'><div align="center">Sign</div></th>
	</tr>
	
	<% 
	while(rserp.next())
	   {
		//String sqlqty="select Quantity,ItemDescription from db_GlobalERP.100000salesinv_items where InvoiceNo = '"+rserp.getString("InvoiceNo")+"' and (ItemDescription like '%Vechicle Tracking System%' OR ItemDescription like '%GPS%' OR ItemDescription LIKE '%One Time Installation and Setup Charges%' OR ItemDescription like '%Consingment Tracker%') limit 1";
		//String sqlqty="select Quantity,ItemDescription from db_GlobalERP.100000salesinv_items where InvoiceNo = '"+rserp.getString("InvoiceNo")+"' and (ItemDescription like '%Vechicle Tracking System%' OR ItemDescription like '%GPS%' OR ItemDescription LIKE '%One Time Installation and Setup Charges%' OR ItemDescription like '%Consingment Tracker%' OR ItemDescription like '%DEMO CHARGES FOR MOBILE EYE STANDARD%') limit 1";
		String sqlqty="select Quantity,ItemDescription from db_GlobalERP.100000salesinv_items where InvoiceNo = '"+rserp.getString("InvoiceNo")+"' limit 1";
       System.out.println("sqlqty==>"+sqlqty);
		ResultSet rssqlqty=sterp4.executeQuery(sqlqty);
		if(rssqlqty.next()){
			
		
	%>
	<tr bgcolor="#BDBDBD">
	
	<td><input type="radio" name='check' id='check<%=i%>' value=<%=rserp.getString("invoiceRefNo") %> onclick='tallyInvoice(<%=i%>,<%=rssqlqty.getString("Quantity") %>)'></td>
	<input type="hidden" name="invoiceno" id="invoiceno" value="<%=rserp.getString("invoiceRefNo") %>">
	<input type="hidden" name="vid" id="vid" value="<%=vid %>">
	<td><div align="right"><%=rserp.getString("invoiceRefNo")%></div></td>
	<td><div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rserp.getString("InvoiceDate")))%></div></td>
	<td><div align="right"><%=rssqlqty.getString("Quantity") %></div></td>
	<td><%=rssqlqty.getString("ItemDescription") %></td>
	<td><%=rserp.getString("TWEmpName")%><input type='hidden' name='amt"+i+"' id='amt"+i+"' value='0' /></td>
	</tr>
	<%i++;} } }catch(Exception e){e.printStackTrace();}
	%>
    <input type="hidden" name="count123" id="count123" value="<%=i%>">
 	
    <!-- <input type="hidden" style="display: none;" name="disableidval" id="disableidval" value="" ></input> -->
	</table>
	
	<%} %>
	
<br></br>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td><b>Transporter:</b></td>
		<td>
			<input type="text" name="owner" value='<%=owner%>'
			class="formElement" readonly />
			<input type="hidden" name="instruction" class="formElement" value="<%=Instruction%>"/>
		</td>
		<td><b>Vehicle Reg. No.:</b></td>
		<td><input type="text" name="vehreg" class="formElement"
			value='<%=vehno%>' readonly /></td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td><b>Old Unit Id:</td>
		<td><input type="text" name="oldunid" class="formElement"
			value='<%=unid%>' /></td>
		<td><b>New Unit Id:</b></td>
		<td>
			<input type="text" name="newunid" class="formElement" />
			<input type="hidden" name="jrm" class="formElement" />
		</td>
	</tr>

	<%
		//out.print(userrole);
			if (userrole.equalsIgnoreCase("service") || userrole.equalsIgnoreCase("Manager")) {
	%>

	<tr bgcolor="#BDBDBD">
		<td rowspan="2"><b>Mobile No.:</b></td>
		<td rowspan="2"><input type="text" name="mobno" size="13"
			onClick="AJAXFunc1()" ; class="formElement" readonly></td>
		<td><b>Sim No.:</td>
		<td><input type="text" name="simno" size="13" class="formElement"
			readonly></td>

	</tr>
	<tr bgcolor="#BDBDBD">
		<td><b>Unit Type:</b></td>
		<td><input type="text" name="InstType" size="13"
			class="formElement" readonly></td>
	</tr>


	<tr bgcolor="#BDBDBD">
		<td><b> Hold By:</b> <br>
		<b>Received Status:</b><br>
		</td>
		<td><input type="text" name="holdby" size="20"
			class="formElement" readonly /> <input type="text" name="recby"
			size="20" class="formElement" readonly /></td>
	</tr>
	<%
		} else {
	%>

	<tr bgcolor="#BDBDBD">
		<td><b>Mobile No.:</b></td>
		<td><input type="text" name="mobno" size="13"
			onClick="AJAXFunc1()" ; class="formElement" readonly></td>
		<td><b>Sim No.:</b></td>
		<td><input type="text" name="simno" size="13" class="formElement"
			readonly>
			<input type="hidden" name="holdby" size="20"
			class="formElement" readonly /> <input type="hidden" name="recby"
			size="20" class="formElement" readonly /></td>

	</tr>
	<tr bgcolor="#BDBDBD">
		<td><b>Unit Type:</b></td>
		<td><input type="text" name="InstType" size="13"
			class="formElement" readonly></td>
		<td></td>
		<td></td>
	</tr>



	<%
		}
	%>
	<tr bgcolor="#BDBDBD">
		<td><b>Installation Date:</b></td>
		<td><input type="text" id="calender" name="calender" size="13"
			class="formElement" value="<%=today%>" readonly class="formElement" />
		<script type="text/javascript">
               Calendar.setup(
               {
                    inputField  : "calender",         // ID of the input field
                    ifFormat    : "%Y-%m-%d",     // the date format
                    button      : "trigger"       // ID of the button
               }
                             );
               </script></td>
		<td><b>Installation Time:</b></td>
		<td><b>HH : <select name="hour" class="formElement">
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
		</select> <b>MM : </b><select name="minutes" class="formElement">

			<option value="00">00</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
		</select></td>
	</tr>

	<%
		sql = "select Distinct(LName) as LName from t_location order by LName";
			ResultSet rst2 = st.executeQuery(sql);
	%>
	<tr bgcolor="#BDBDBD">
		<td><b>Installed at:</b></td>
		<td><select name="instat" onChange="OnChangeFunc2(this);"
			class="formElement">

			<option value="Select">Select</option>
			<%
				while (rst2.next()) {
			%>
			<option value="<%=rst2.getString("LName")%>"><%=rst2.getString("LName")%>
			</option>
			<%
				}
			%>
			<option value="Other"><b>Other</b></option>
		</select>
		<div id="othinstloc" style="visibility: hidden">
		<center><input type="text" name="othinst" size="20"
			class="formElement"> </input></center>
		</div>
		</td>
		<td><input type=checkbox name="instin" value="instin" checked
			onChange="OnChangeChkBx(this);" /> <b>Installed in India</b></td>
		<td><b>Time </b><input type="text" name="tme" value="5:30" size="5"
			readonly class="formElement"> </input>
		<div id="nwtme" style="visibility: hidden">
		<center><input type="text" name="newtme" size="5"
			class="formElement"> </input></center>
		</div>
		</td>
	</tr>

	<!-- When Voice Call will be selected, two text boxes will get appeared to enter two Mobile No's which is mandatory-->
	<tr bgcolor="#BDBDBD">
		<td><b>Type of Unit:</b></td>
		<td>
		<input type="text" name="typeunit" size="20" class="formElement" readonly>
<!--		
		<select name="typeunit" class="formElement"
			onChange="voicecall(this);">
			<option value="SELECT">SELECT</option>
			<option value="NORMAL">NORMAL</option>
			<option value="TEMPSENSOR">TEMPSENSOR</option>
			<option value="FUELFLOW">FUELFLOW</option>
			<option value="VOICECALL">VOICE CALL</option>
			<option value="BUZZER">BUZZER</option>
			<option value="JRM">JRM</option>
			<option value="GENSETTRACK">GENSET TRACK</option>
			<option value="SMARTCARD">SMARTCARD</option>
			<option value="FM2200">FM2200</option>
			<option value="AVLLITE">AVL LITE</option>
		</select>   -->
		
		<div id="voiceparam" style="display: none"><br>

		<label for="voic1" name="voic1" id="voic1" style="visibility: visible">
		<font color="maroon">Voice Call no.1 </font></label> <input type="text"
			name="voice1" class="formElement" style="visibility: visible" /> <br>
		<label for="voic2" style="visibility: visible"> <font
			color="maroon">Voice Call no.2 </font> </label> <input type="text"
			name="voice2" class="formElement" style="visibility: visible" /></div>

		</td>
		<td><b>Installed By:</b></td>
		<td><select name="instby" class="formElement">
			<option value="Select">Select</option>
			<%
				sql = "select distinct(TechName) as tech from t_techlist where Available='Yes' order by TechName asc";
					ResultSet rst4 = st.executeQuery(sql);
					while (rst4.next()) {
			%>
			<option value="<%=rst4.getString("tech")%>"><%=rst4.getString("tech")%>
			</option>
			<%
				}
			%>

		</select></td>
	</tr>

	<tr bgcolor="#BDBDBD">
		<td><b>Old Unit Condition </b><br>
		(Physically Damaged):</td>
		<td><input type="radio" name="phydamaged" value="Yes"
			onClick="showDamageOpt(0);" />Yes <input type="radio"
			name="phydamaged" value="No" checked onClick="showDamageOpt(1);" />No
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
		<div id="damagedoption" style="display: none">

		<table border="0" width="100%">
			<tr>
				<td><input type="checkbox" name="gpsantcut"
					value="GPS Antenna Cut"> GPS Antenna Cut</td>
				<td><input type="checkbox" name="greenlightoff"
					value="Green Light Off"> Green Light Off</td>
				<td><input type="checkbox" name="loosecon"
					value="Loose Connection"> Loose Connection</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="powharndam"
					value="Power Harness Damage"> Power Harness Damage</td>
				<td><input type="checkbox" name="unitfndop"
					value="Unit Found Open"> Unit Found Open</td>
				<td><a href="#" onClick="NewDamageOpt();"> Other </a></td>
			</tr>
		</table>
		</div>
		<br>
		<input type="text" name="newdamageoption" style="visibility: hidden" />
		</td>
		<td><b>New Unit Run on:</b></td>
		<td><input type="radio" name="unitrunon" value="Battery">Battery
		<input type="radio" name="unitrunon" value="Ignition">Ignition
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td><b>LED Status:</b></td>
		<td>Red Light: <input type="radio" name="redlight" value="On">On
		<input type="radio" name="redlight" value="Off">Off <br></br>
		Green Light: <input type="radio" name="greenlight" value="Stable">Stable
		<input type="radio" name="greenlight" value="Blinking">Blinking
		<input type="radio" name="greenlight" value="Off">Off <br></br>
		GPS Blue Light: <input type="radio" name="gpslight" value="Stable">Stable
		<input type="radio" name="gpslight" value="Blinking">Blinking
		<input type="radio" name="gpslight" value="Off">Off <br></br>
		Ringing: <input type="radio" name="ringing" value="Yes">Yes <input
			type="radio" name="ringing" value="No">No</td>

		<td><b>Warranty Comment:</b></font></td>
		<td><input type="radio" name="warcom" value="Yes"
			onClick="showwarcom(0);">Yes <input type="radio"
			name="warcom" value="No" onClick="showwarcom(1);">No
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
		<div id="warcomment" style="display: none">

		<table border="0" width="100%">
			<tr>
				<td><textarea name="comment" class="formElement"> </textarea></td>
			</tr>


		</table>

		</div>
	</tr>

	<tr bgcolor="#BDBDBD">
		<td align="center"><b>Special Comment:</b></td>
		<td>
		<%
			String que = "select Comment from t_commentlist where Modulename='DiarySystem' and Listname='Unit'";
				ResultSet rsget = stmt2.executeQuery(que);
		%> <select name="spcomment" id="spcomment" class="formElement">
			<option value="Select">Select</option>
			<%
				while (rsget.next()) {
			%>
			<option value="<%=rsget.getString("Comment")%>"><%=rsget.getString("Comment")%></option>
			<%
				}
			%>
		</select></td>

		<td align="center"><b>Old Unit with:</b></td>
		<td><input type="radio" name="oldunitwith" value="Cust">Cust
		<input type="radio" name="oldunitwith" value="Tech">Tech</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td align="center"><b>Extra Comment:</b></td>
		<td><textarea name="extracomment" class="formElement"> </textarea>
		</td>
		<td colspan="2"></td>

	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="4" align="center"><B> <I> Driver Details </I> </B></td>
	</tr>
	<!-- Below 3 fileds are not mandatory to fill -->
	<tr bgcolor="#BDBDBD">
		<td><b>Driver Name:</b></td>
		<td><input type="text" name="drivername" class="formElement" /></td>
		<td><b>Driver Code:</b></td>
		<td><input type="text" name="drivercode" class="formElement" /></td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="4" align="center"><b>Driver Mob. No.:</b>&nbsp;&nbsp; <input
			type="text" name="drivermob" class="formElement" /></td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>Why you are using this option?</b></td>
		<td colspan="3"><textarea rows="2" cols="50" name="whyoption"
			id="whyoption"></textarea></td>
	</tr>
	<%
	int defaultST=0,defaultTX=0,defaultRA=0,defaultRD=0,defaultOS=0;
	String sqlDefault1="select ST,TX,AccelerationSpeedVarLimit,DecelerationSpeedVarLimit,Overspeedlimit from db_gps.t_defaultvals where OwnerName='Default'";
	ResultSet rsDefault1=st2.executeQuery(sqlDefault1);
	System.out.println("sqlDefault1==>"+sqlDefault1);
	
	
	if(rsDefault1.next()){
	defaultST=rsDefault1.getInt("ST");
	defaultTX=rsDefault1.getInt("TX");
	defaultRA=rsDefault1.getInt("AccelerationSpeedVarLimit");
	defaultRD=rsDefault1.getInt("DecelerationSpeedVarLimit");
	defaultOS=rsDefault1.getInt("Overspeedlimit");
	}

	System.out.println("defaultST==>"+defaultST);
	System.out.println("defaultTX==>"+defaultTX);
	System.out.println("defaultRA==>"+defaultRA);
	System.out.println("defaultRD==>"+defaultRD);
	System.out.println("defaultOS==>"+defaultOS);
	
	
	
	String sqlDefault="select ST,TX,RA,RD,OS from db_gps.t_vehicledetails where vehicleCode='"+vid+"'";
	ResultSet rsDefault=st2.executeQuery(sqlDefault);
	System.out.println("sqlDefault==>"+sqlDefault);
	if(rsDefault.next()){
		defaultST=rsDefault.getInt("ST");
		defaultTX=rsDefault.getInt("TX");
		defaultRA=rsDefault.getInt("RA");
		defaultRD=rsDefault.getInt("RD");
		defaultOS=rsDefault.getInt("OS");
	}
	System.out.println("defaultST11==>"+defaultST);
	System.out.println("defaultTX11==>"+defaultTX);
	System.out.println("defaultRA11==>"+defaultRA);
	System.out.println("defaultRD11==>"+defaultRD);
	System.out.println("defaultOS11==>"+defaultOS);
	
	
	
	
	%>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>ST. Interval </b><input name="ST" id="ST"  size="13" class="formElement" value="<%=defaultST%>" readonly> &nbsp;&nbsp;&nbsp;
		<!-- <a style="color: #491FE2" onclick="showwarcom1('dispST');"><u>Change for this vehicle</u></a> -->
		<div id="dispST" style="display: none;" align="right">
		<input name="getST" id="getST" class="formElement"  size="13">
		</div>
		</td>
	
		<td colspan="2"><b>TX. Interval</b> <input name="TX" id="TX"  size="13" class="formElement"  value="<%=defaultTX%>" readonly> &nbsp;&nbsp;&nbsp;
		<!-- <a style="color: #491FE2" onclick="showwarcom1('dispTX');"><u>Change for this vehicle</u></a> -->
		<div id="dispTX" style="display: none;" align="right">
		<input name="getTX" id="getTX" class="formElement"  size="13">
		</div>
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>RA. Interval </b><input name="RA" id="RA" size="13" class="formElement"  value="<%=defaultRA%>" readonly> &nbsp;&nbsp;&nbsp;
		<!-- <a style="color: #491FE2" onclick="showwarcom1('dispRA');"><u>Change for this vehicle</u></a> -->
		<div id="dispRA" style="display: none;" align="right">
		<input name="getRA" id="getRA" class="formElement"  size="13">
		</div>
		</td>
		<td colspan="2"><b>RD. Interval </b><input name="RD" id="RD"  size="13" class="formElement"  value="<%=defaultRD%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--<a style="color: #491FE2" onclick="showwarcom1('dispRD');"><u>Change for this vehicle</u></a> -->
		<div id="dispRD" style="display: none;" align="right">
		<input name="getRD" id="getRD" class="formElement"  size="13">
		</div>
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="2"><b>OS. Interval </b><input name="OS" id="OS"  size="13" class="formElement"  value="<%=defaultOS%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--<a style="color: #491FE2" onclick="showwarcom1('dispOS');"><u>Change for this vehicle</u></a> -->
		<div id="dispOS" style="display: none;" align="right">
		<input name="getOS" id="getOS" class="formElement"  size="13">
		</div>
		</td>
		<td colspan="2"></td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td colspan="4">
		<div align="center"><input type="submit" name="submit"
			value="Submit" class="formElement"></div>
		</td>
	</tr>
</table>

</form>


<%
	} catch (Exception e) {
		out.print("Exception --->" + e);
	} finally {
		//conn.close();
		//conn1.close();
		
		try
		{
			conn.close();
		}catch(Exception e)
		{}
		
		try
		{
			conn1.close();
		}catch(Exception e)
		{}
		
		
		try{

		diary.closeConnection();
		}catch(Exception e)
		{


		}

		
		try{

		diary.closeConnection1();
		}catch(Exception e)
		{


		}

		
		
		
		
		
	}
%> <!-- code end here --->

<table width="750px" height="350px" border="0">
	<tr>
		<td></td>
	</tr>
</table>

</div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>

</body>
</html>

</jsp:useBean>
