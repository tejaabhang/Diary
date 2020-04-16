<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1,connERP;
Statement st,st1,st2,st3,st4,st5,sterp1,sterp2,sterp3,sterp4,sterp5,sterp6;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist,sqlerp1;
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

function validate()
{ 
	//alert("in validate function");
var countinv="0";
var chk1="";
try{
           countinv = document.unitaddform.count123.value;
//alert("in validate countinv"+countinv);
}catch(e){
}
	//alert("in validate function"+countinv);
	
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
// } // else loop closed
	
	 
      
      /* if( ((((chk1!=true) && (chk2!=true)) && ((chk3!=true) && (chk4!=true))) && (((chk5!=true) && (chk6!=true)) && ((chk7!=true) && (chk8!=true)))) && ((((chk9!=true) && (chk10!=true)) && ((chk11!=true) && (chk12!=true))) && (((chk13!=true) && (chk14!=true)) && ((chk15!=true) && (chk16!=true)))) && ((chk17!=true) && (chk18!=true)) && ((chk19!=true) && (chk20!=true)))
	{
		alert("2");
	if(chk1==false || chk2==false || chk3==false || chk4==false || chk5==false || chk6==false || chk7==false || chk8==false || chk9==false || chk10==false || chk11==false || chk12==false || chk13==false || chk14==false || chk15==false || chk16==false || chk17==false || chk18==false || chk19==false || chk20==false) 
    {
      alert("Please Select Invoice..");
      return false;
    }
  } */
	
	/* for(var i=0;i<countinv.length;i++){
		  alert("in validate function 123");
		//var chk1=document.unitaddform.check+i.value;
		//var chk1=document.getElementById("check"+i).value;
		 var chk1=document.getElementById("check"+i+"").value;
		alert("in validate function chk1"+chk1);
	     if(chk1.length=="")
	     {
	       alert("Please select invoice");
	       return false;
	     }
	} */
		
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
     
      var vehcat=document.unitaddform.vehtypenew.value;

   //alert("category>>>>>"+vehcat)

       if(vehcat=="Select")
      {
        alert("Please Select vehicle Category");
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
var whyoption=document.unitaddform.whyoption.value;
//alert(whyoption);
if(whyoption==""||whyoption==null){
	alert("please enter 'Why you are using this option'");
	return false;
}
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
							//	alert(reslt);
                                var mySplitResult = reslt.split("#");
                              mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//trim
                              //alert(mySplitResult[0]);
      						mySplitResult[1] = mySplitResult[1].replace(/^\s+|\s+$/g,"");//trim
      						mySplitResult[2] = mySplitResult[2].replace(/^\s+|\s+$/g,"");//trim
      						mySplitResult[3] = mySplitResult[3].replace(/^\s+|\s+$/g,"");//trim
      						mySplitResult[4] = mySplitResult[4].replace(/^\s+|\s+$/g,"");//trim
      						mySplitResult[5] = mySplitResult[5].replace(/^\s+|\s+$/g,"");//trim
                               document.unitaddform.limit.value=mySplitResult[0];
                               document.getElementById("ST").value=mySplitResult[1];
                               document.getElementById("TX").value=mySplitResult[2];
                               document.getElementById("RA").value=mySplitResult[3];
                               document.getElementById("RD").value=mySplitResult[4];
                               document.getElementById("OS").value=mySplitResult[5];
                              // document.getElementById("limit").value=reslt;
     
          		   if(mySplitResult[0]=="No")
          		   {
              		   alert("Installations are completed for "+v2 +" as per limit");
              		   return false;
          		   }
          		  if(mySplitResult[0]=="Yes1")
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
  //alert("in ajax function");
  var v1=document.unitaddform.uid.value;
 //alert(v1);
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
					//alert(reslt);
                      var mySplitResult = reslt.split("#");
                      var mySplitResult1=  mySplitResult[0]; 
                      var mySplitResult2=  mySplitResult[1];

						// Results from Ajaxunitadd.jsp are put into fields
						mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//trim   Mobile No
						mySplitResult[1] = mySplitResult[1].replace(/^\s+|\s+$/g,"");//trim   Sim No
						mySplitResult[2] = mySplitResult[2].replace(/^\s+|\s+$/g,"");//trim   Unit TYpe
						mySplitResult[3] = mySplitResult[3].replace(/^\s+|\s+$/g,"");//trim  Received Status
						mySplitResult[4] = mySplitResult[4].replace(/^\s+|\s+$/g,"");//trim  hold By
						mySplitResult[5] = mySplitResult[5].replace(/^\s+|\s+$/g,"");//trim  software version
						mySplitResult[6] = mySplitResult[6].replace(/^\s+|\s+$/g,"");//trim  FTP Invalide software version
						mySplitResult[7] = mySplitResult[7].replace(/^\s+|\s+$/g,"");//trim   unitid already exists in other vehicle
						mySplitResult[8] = mySplitResult[8].replace(/^\s+|\s+$/g,"");//JRM
						mySplitResult[9] = mySplitResult[9].replace(/^\s+|\s+$/g,"");//trim   Device xxxx can not be installed in a vehicle because it has wrong firmware.

//////
						mySplitResult[10] = mySplitResult[10].replace(/^\s+|\s+$/g,"");////mobile dactivated
						mySplitResult[11] = mySplitResult[11].replace(/^\s+|\s+$/g,"");////got the peripheral from unitmaster

						//alert("mySplitResult[9]==>"+mySplitResult[9]);
						//alert("mySplitResult[10]==>"+mySplitResult[10]);
                  //  alert("mySplitResult[11]==>"+mySplitResult[11]);

                    
                    if(mySplitResult[11]=="Noperi")
                    {

                      
                       //alert(""+mySplitResult1+" ");
                    	//document.repunitform.newunid.value="";
                       document.unitaddform.typeunit.value="-";
                    }else{
//alert("else loop==> "+mySplitResult[11])
                    	document.unitaddform.typeunit.value=mySplitResult[11];

                    }

                    if(mySplitResult[10]=="MobNoFlush")
                    {

                       alert("Mobile No."+mySplitResult1.trim()+" for unit " +v1+" is been deactivated. ");
                       //alert(""+mySplitResult1+" ");
                    	//document.repunitform.newunid.value="";
                       document.unitaddform.uid.value="";
                    }

                 //   if(mySplitResult[10]=="MobNoFlush")
                   // {

  // alert("insid flush"+document.unitaddform.uid.value);
                    //	document.unitaddform.uid.value="";
                
                    //}
	 		      		  document.unitaddform.mobno.value = mySplitResult[0];
                      document.unitaddform.simno.value = mySplitResult[1];
                      document.unitaddform.recby.value = mySplitResult[3];
                      document.unitaddform.holdby.value = mySplitResult[4];
                      document.unitaddform.InstType.value = mySplitResult[2];
                      var swver=mySplitResult[5];
                      var invalide=mySplitResult[6];
                       var available=mySplitResult[7];
                       var isCodeVerValid=mySplitResult[9];
                      //   alert("isCodeVerValid-------------->"+isCodeVerValid);
                     // alert(swver);
						if(
							(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Castrol")!=-1))
							||(((swver.indexOf("AVL_LITE")!=-1)||(swver.indexOf("SIMARM")!=-1))&&(owner.indexOf("Praxair")!=-1))
							)
							{
							 	alert("AVL_LITE unit is not allowed in "+owner);
									return false;
                       		}
						if(isCodeVerValid=="No"){
                     		 alert("Device "+v1+" can not be installed in a vehicle because it has wrong firmware.");
                            return false;
                           }
						if(invalide=="Yes"){
							alert("Invalide software version in "+v1);
							return false;
                  		}
                  		 if(available=="Yes"){
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
	connERP = DriverManager.getConnection(MM_dbConn_STRINGERP,MM_dbConn_USERNAMEERP,MM_dbConn_PASSWORDERP);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	st3=conn1.createStatement();
	st4=conn1.createStatement();
	st5=conn1.createStatement();
	sterp1=connERP.createStatement();
	sterp2=connERP.createStatement();
	sterp3=connERP.createStatement();
	sterp4=connERP.createStatement();
	sterp5=connERP.createStatement();
	sterp6=connERP.createStatement();

	String userrole=session.getAttribute("userrole").toString();
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
	String transporter=request.getParameter("transporter");
	transporter=transporter.replace("..", "&");
	System.out.println("Transporter :- "+transporter);
	String unidchk=request.getParameter("unidchk");
	String limitstring=request.getParameter("limit");
	String countstring=request.getParameter("count");
	StringBuffer InvList=new StringBuffer("(");
%>
<form name="unitaddform" method="get" action="unitaddinsrt.jsp" onsubmit="return validate();">
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
	
	<%
	String customerCode="";
	try{
	//String sqlCustomerCode="select distinct(ERPCode) from db_GlobalERP.100000fv_erp_relation where Transporter='"+transporter+"' ";
	String sqlCustomerCode="select ERPCode from db_gps.t_transporter where ActiveStatus='Yes' and TypeValue='"+transporter+"' ";
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
		
		String todaysDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
        System.out.println("todaysdate is" + todaysDate);
        todaysDate=todaysDate+" 23:59:59";
        
		String year11="SELECT  DATE (CURDATE() - INTERVAL 60 DAY) ";
        
        
		System.out.println("year :- "+year11);
		ResultSet rsyear12=st5.executeQuery(year11);
		rsyear12.next();
		String yester=rsyear12.getString(1);
		yester=yester+" 00:00:00";
		System.out.println("Date is :- "+rsyear12.getString(1));
		
		
	
	sqlerp1="select InvoiceNo,InvoiceDate,TWEmpName,invoiceRefNo from db_GlobalERP.100000invoicedet where customercode = "+customerCode+" and InvoiceCancelled=0  and TWEmpName  NOT IN ('Autogenerated','PhysicalDamage')  and InvoiceDate >='"+yester+"' and InvoiceDate <='"+todaysDate+"' order by InvoiceDate desc limit 20";
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
	
	<br><br>
	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Transporter :</b></font></td>
			<td>
<%if(transporter!=null){
	
	System.out.println("In Transporter");
%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value="<%=transporter %>"></input>
			
			<select name="owner" id="owner" width="100%"; onChange="OnChangeFunc3(this);" class="formElement">
			 <option value="<%=transporter%>"  <%if(transporter!=null && transporter.equalsIgnoreCase(transporter)){ %> selected <%} %>><%=transporter%></option> 

<%}else{
%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value=""></input>

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
			<%
}%>
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
				<input type="text" name="mobno" size="13" class="formElement"  onblur="AJAXFunc()" readonly/> 
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
			
			
			
			<input type="text" name="typeunit" size="20" class="formElement" readonly>
	<!--		<select name="typeunit" class="formElement" onChange="voicecall(this);">
		        
		        		        <option value="NORMAL" >NORMAL  </option>
		        <option value="TEMPSENSOR" >TEMPSENSOR  </option>
		        <option value="FUELFLOW" >FUELFLOW  </option>
				<option value="VOICECALL" >VOICE CALL  </option>
				<option value="BUZZER" >BUZZER  </option> 
				<option value="JRM" >JRM</option> 
				<option value="GENSETTRACK" >GENSET TRACK</option> 
				<option value="SMARTCARD" >SMARTCARD</option> 
				<option value="FM2200" >FM2200</option>
			</select>   -->
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
					 <option value="Mahindra TUV 300" >Mahindra TUV 300</option>
					 
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
		
	<!--   Added the vehtype option in the form   -->
	
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Vehicle Category: </b></font></td>
			<td><select name="vehtypenew" class="formElement">
 				<option value="Select"> Select </option>
<% 
				sql="select distinct(VehType) as vehtype from db_gps.t_vehtypmaster  order by VehType asc" ;
   				
System.out.println("sql in veh BEFORE type>>>>"+sql);
           ResultSet rst33=st.executeQuery(sql);
   				System.out.println("sql in veh type>>>>"+sql);
   				
   				
   			    while(rst33.next())
			    { 
%>
     			<option value="<%=rst33.getString("vehtype") %>"> <%=rst33.getString("vehtype") %> </option>
<%  } %>
     			
        		</select> 
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
		<%
							if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
							{  
%>
		<tr bgcolor="#BDBDBD">
		<td colspan="2"><font color="maroon" ><b>Why you are using this option?</b></font></td>
		<td colspan="3"><textarea rows="2" cols="50" name="whyoption"
			id="whyoption" class="formElement"></textarea></td>
	</tr>
		<%
							}else{
							%>
							<input type="hidden" name="whyoption" id="whyoption" value="-" />
							<%
							}
		if(transporter!=null){
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

			String sqlDefault="select ST,TX,AccelerationSpeedVarLimit,DecelerationSpeedVarLimit,Overspeedlimit from db_gps.t_defaultvals where OwnerName='"+transporter+"'";
			ResultSet rsDefault=st2.executeQuery(sqlDefault);
			if(rsDefault.next()){
				defaultST=rsDefault.getInt("ST");
				defaultTX=rsDefault.getInt("TX");
				defaultRA=rsDefault.getInt("AccelerationSpeedVarLimit");
				defaultRD=rsDefault.getInt("DecelerationSpeedVarLimit");
				defaultOS=rsDefault.getInt("Overspeedlimit");
			}
			%>
			<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>ST. Interval </b><input name="ST" id="ST"  size="13" class="formElement" value="<%=defaultST%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--	<a style="color: #491FE2" onclick="showwarcom('dispST');"><u>Change for this vehicle</u></a> -->
			<div id="dispST" style="display: none;" align="right">
			<input name="getST" id="getST" class="formElement"  size="13">
			</div>
			</td>
		
			<td colspan="2"><b>TX. Interval</b> <input name="TX" id="TX"  size="13" class="formElement" value="<%=defaultTX%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--	<a style="color: #491FE2" onclick="showwarcom('dispTX');"><u>Change for this vehicle</u></a> -->
			<div id="dispTX" style="display: none;" align="right">
			<input name="getTX" id="getTX" class="formElement"  size="13">
			</div>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>RA. Interval </b><input name="RA" id="RA" size="13" class="formElement" value="<%=defaultRA%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--	<a style="color: #491FE2" onclick="showwarcom('dispRA');"><u>Change for this vehicle</u></a> -->
			<div id="dispRA" style="display: none;" align="right">
			<input name="getRA" id="getRA" class="formElement"  size="13">
			</div>
			</td>
			<td colspan="2"><b>RD. Interval </b><input name="RD" id="RD"  size="13" class="formElement" value="<%=defaultRD%>" readonly> &nbsp;&nbsp;&nbsp;
		<!--	<a style="color: #491FE2" onclick="showwarcom('dispRD');"><u>Change for this vehicle</u></a> -->
			<div id="dispRD" style="display: none;" align="right">
			<input name="getRD" id="getRD" class="formElement"  size="13">
			</div>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>OS. Interval </b><input name="OS" id="OS"  size="13" class="formElement" value="<%=defaultOS%>" readonly> &nbsp;&nbsp;&nbsp;
			<!-- <a style="color: #491FE2" onclick="showwarcom('dispOS');"><u>Change for this vehicle</u></a> -->
			<div id="dispOS" style="display: none;" align="right">
			<input name="getOS" id="getOS" class="formElement"  size="13">
			</div>
			</td>
			<td colspan="2"></td>
		</tr>
			<%
		}
		else{
		%>
		
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>ST. Interval </b><input name="ST" id="ST"  size="13" class="formElement" readonly> &nbsp;&nbsp;&nbsp;
			<!-- <a style="color: #491FE2" onclick="showwarcom('dispST');"><u>Change for this vehicle</u></a>-->
			<div id="dispST" style="display: none;" align="right">
			<input name="getST" id="getST" class="formElement"  size="13">
			</div>
			</td>
		
			<td colspan="2"><b>TX. Interval</b> <input name="TX" id="TX"  size="13" class="formElement" readonly> &nbsp;&nbsp;&nbsp;
			<!--<a style="color: #491FE2" onclick="showwarcom('dispTX');"><u>Change for this vehicle</u></a> -->
			<div id="dispTX" style="display: none;" align="right">
			<input name="getTX" id="getTX" class="formElement"  size="13">
			</div>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>RA. Interval </b><input name="RA" id="RA" size="13" class="formElement" readonly> &nbsp;&nbsp;&nbsp;
			<!--<a style="color: #491FE2" onclick="showwarcom('dispRA');"><u>Change for this vehicle</u></a> -->
			<div id="dispRA" style="display: none;" align="right">
			<input name="getRA" id="getRA" class="formElement"  size="13">
			</div>
			</td>
			<td colspan="2"><b>RD. Interval </b><input name="RD" id="RD"  size="13" class="formElement" readonly> &nbsp;&nbsp;&nbsp;
			<!--<a style="color: #491FE2" onclick="showwarcom('dispRD');"><u>Change for this vehicle</u></a> -->
			<div id="dispRD" style="display: none;" align="right">
			<input name="getRD" id="getRD" class="formElement"  size="13">
			</div>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="2"><b>OS. Interval </b><input name="OS" id="OS"  size="13" class="formElement" readonly> &nbsp;&nbsp;&nbsp;
			<!--  <a style="color: #491FE2" onclick="showwarcom('dispOS');"><u>Change for this vehicle</u></a>-->
			<div id="dispOS" style="display: none;" align="right">
			<input name="getOS" id="getOS" class="formElement"  size="13">
			</div>
			</td>
			<td colspan="2"></td>
		</tr>
		<%
		}
		%>
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