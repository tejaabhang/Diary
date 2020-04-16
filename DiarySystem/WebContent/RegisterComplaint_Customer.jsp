
<%@page import="java.util.Date"%>
<%@ include file="headerpopdiary1.jsp"%>


<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>

<%!

String ReportName="",Description="",Entby="",Name="",EmailID="",Email1="",FileName="",Category="";
String Priority="",ClosingComments="",ClosedBy="",Status="";
Date ComplaintDateTime,UpadteDateTime;
String ContactNumber="";

%>
<%

%>
<html>
<head>
<script type="text/javascript">

onload=function resertval()
{
	 //var elems = document.getElementsByName("browser");
	 //	for(var i=0;i<elems.length;i++)
	 	//{
	 	//	elems[i].checked==false;
	 	//}

	 	//document.incident.EmailID.value="";
	 	//document.getElementById("Number").value="";
	 //	document.getElementById("search-text").value="";
	 //	document.getElementById("Category").value="Hardware";
	 	//document.getElementById("Priority").value="Low"; 	
}

function timer()
{
	
	setTimeout("getGroupName(1)", 2000);
}
	
function GetVehicles()
{
	
	
	
	
	
	
	
	}

function getSelectedGpaname(gpname,type)
{
	
	//alert("gpname in getSelectedGpaname==>"+gpname);
	//alert("type in getSelectedGpaname ==>"+type);
	
	
	document.getElementById("companyList").style.visibility="visible";
	try{
	
	
		
		if(type=='transporter')
			{
			
			//alert("IFFFFFFFFFFFF==>");
			document.incident.transporter.value=gpname;
			Getvehlist();
			
			
			}else{
				
			//	alert("ELSEEEEEEEEEEEEEE ==>");
				document.incident.gpname.value=gpname;
				Getvehlist();
				
			}
		
		
		
		
		if(gpname=="" || gpname ==null)
		
		{
		
		
		
		}else{
			
			
			
			//document.getElementById("gpname").value=gpname;
			//alert(document.ledgerDetails.suplierCode.value='');
			//alert("++++++++");
			//document.getElementById('suplierList').style.visibility = 'hidden';
			
			
			//document.getElementById("gpname").innrHTML=gpname;
			
// 			if(type=="transporter")
// 				{
// 				document.getElementById("companyList").style.visibility="visible";
				
// 				}else{
					
// 					document.getElementById("companyList").style.visibility="hidden";
					
// 				}
				document.getElementById("companyList").style.visibility="hidden";
			document.getElementById("comlist").style.display="none";	
			
		}
	
	
	
	
	}catch(e)
	
	{
		
	alert("getSelectedGpaname function ERROR"+e)	
		
	}
	}

function getGroupName(num,type)
{
	//alert("num===>"+num);
	//alert("type===>"+type);
	
	try{
	//alert("type===>"+type);
		document.getElementById("companyList").style.visibility="visible";
		document.getElementById("comlist").style.display="";
	    
		var gpname=document.incident.gpname.value;
		var trns=document.incident.transporter.value;
	
		
		//alert("trns==>"+trns)
		//alert("grp==>"+gpname)
		
		//var company=document.getElementById("gpname").options[document.getElementById("gpname").selectedIndex].value;

		if(type=="transporter")
	{		
		if(trns.length=="")
		{
			
			//alert("ELSE      ########3")
			
			document.getElementById("companyList").style.visibility="hidden";
			
			//document.addFolloUp.custType.value="";
			 
			//document.addFolloUp.assignedBy.value="";
			//document.addFolloUp.leadRef.value="";
		//	document.addFolloUp.addedOnDate.value="";
			//document.getElementById("transactionDetails").style.visibility="hidden";
			//document.getElementById("followupDetails").style.visibility="hidden";
			
		}
		else
		{
			
			
			//alert("ELSE      $$$$$$$$$$")
			document.getElementById("companyList").style.visibility="visible";
		//var name=document.netbanking.benfName.value;
		//company=company.replace(/\W/g, '');
		//company = company.replace(/[^a-zA-Z 0-9]+/g, '');
		//'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')
		trns=trns.replace(".", "");
		trns=trns.replace(",", "");
		trns=trns.replace("$", "");
		trns=trns.replace("#", "");
		trns=trns.replace("?", "");
		trns=trns.replace("-", "");
		trns=trns.replace("_", "");
		trns=trns.replace(" ", "");
		trns=trns.replace("(", "");
		trns=trns.replace(")", "");
		
	    //var counter=document.addFolloUp.counter.value;
    //	alert(">>>>>>>>>>   "+counter);
	/*	if(num>100)
		{
			counter=0;
		}
		*/
		
		
		if(num==1)
		{
			counter=20;
		}
		else if(num==2)
		{
			counter=0;
		}
		
		//var timer=setTimeout("getValue()",10000);
//		alert(timer);
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
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
				
			try{	
				
				var reslt=ajaxRequest.responseText;
				//alert("Transporter==>"+reslt)
				//alert("Transporter==before>"+document.getElementById("companyList").innerHTML)
				
				document.getElementById("companyList").innerHTML=reslt;
				
				//alert("Transporter=AFTER=>"+document.getElementById("companyList").innerHTML)
				
				var b=document.getElementById("element").value;
				
			
				
				document.incident.counter.value=b;
				document.incident.counter.value=b*document.incident.counter.value;
				counter=document.incident.counter.value;
				
				
			}catch(e)
			{
				
				alert(e);
			}
				
			} 
		}
		//alert("val==>"+counter);
		//alert("gpname==>"+gpname);
		
		
		var queryString = "?gpname=" +trns+"&limitcount="+counter+"&type="+type+"";
		
		
		//AjaxGetGroupName.jsp
		//AjaxGetcntprsn.jsp
		//alert("limit count val"+counter);	
		ajaxRequest.open("GET", "AjaxGetcntprsn.jsp" + queryString, true);
		ajaxRequest.send(null); 
		
		
		
		}
		
	}else{
		
		
		
		
		
		if(gpname.length=="" && trns.length=="")
		{
			
			
			//alert("gpname.length==>"+gpname.length);
			//alert("trns.length==>"+trns.length);
			//alert("ELSE      $$$$$$$$$$     ^^^^^");
			
			document.getElementById("companyList").style.visibility="hidden";
			
			//document.addFolloUp.custType.value="";
			 
			//document.addFolloUp.assignedBy.value="";
			//document.addFolloUp.leadRef.value="";
		//	document.addFolloUp.addedOnDate.value="";
			//document.getElementById("transactionDetails").style.visibility="hidden";
			//document.getElementById("followupDetails").style.visibility="hidden";
			
		}
		else
		{
			
			
			//alert("ELSE      $$$$$$$$$$     *****");
			//alert("gpname.length==>"+gpname.length);
			//alert("trns.length==>"+trns.length);
			
			if(gpname.length!=0)
				{
			document.getElementById("companyList").style.visibility="visible";
				}else{
					
					document.getElementById("companyList").style.visibility="hidden";
					
				}
			
			//var name=document.netbanking.benfName.value;
		//company=company.replace(/\W/g, '');
		//company = company.replace(/[^a-zA-Z 0-9]+/g, '');
		//'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')
		gpname=gpname.replace(".", "");
		gpname=gpname.replace(",", "");
		gpname=gpname.replace("$", "");
		gpname=gpname.replace("#", "");
		gpname=gpname.replace("?", "");
		gpname=gpname.replace("-", "");
		gpname=gpname.replace("_", "");
		gpname=gpname.replace(" ", "");
		gpname=gpname.replace("(", "");
		gpname=gpname.replace(")", "");
		
	    //var counter=document.addFolloUp.counter.value;
    //	alert(">>>>>>>>>>   "+counter);
	/*	if(num>100)
		{
			counter=0;
		}
		*/
		
		
		if(num==1)
		{
			counter=20;
		}
		else if(num==2)
		{
			counter=0;
		}
		
		//var timer=setTimeout("getValue()",10000);
//		alert(timer);
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
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
				document.getElementById("companyList").innerHTML=reslt;
				var b=document.getElementById("element").value;
				
				
				document.incident.counter.value=b;
				document.incident.counter.value=b*document.incident.counter.value;
				counter=document.incident.counter.value;
				
			} 
		}
		//alert("val==>"+counter);
		//alert("gpname==>"+gpname);
		
		
		var queryString = "?gpname=" +gpname+"&limitcount="+counter+"&type="+type+"";
		
		
		//AjaxGetGroupName.jsp
		//AjaxGetcntprsn.jsp
		//alert("limit count val"+counter);	
		ajaxRequest.open("GET", "AjaxGetcntprsn.jsp" + queryString, true);
		ajaxRequest.send(null); 
		
		
		
		}//end of else
			
	
			
	}
			
	
	
		
	
	}catch(e)
	{
		
		alert("EXCEPTION===>"+e);
		
	}
			
		
}

function GetContactperson(transporter,gpname)
{
	
	
	//alert("transporter in contact person function"+transporter)
	
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

	     	  
	                var reslt=ajaxRequest.responseText;
	              // alert("reslt==>"+reslt);   

	try{
	                reslt=reslt.replace(/^\s+|\s+$/g,"");
	             //   document.getElementById("tbvl").innerHTML=reslt;
	               // var z=reslt.split("#");
	              
	               
	               if(reslt!="")
	            	   {
	            	   
	            	   document.getElementById("cntpersn").innerHTML=reslt;   
	            	   }
	               
	               // document.getElementById("fnt").innerHTML=z[0];
	               // var z=reslt.split("#");
	               //alert("0==>"+z[0]);
	             // alert("1==>"+z[1]);

	               // //System.out.println(datacode[j]);
	                //b++;
	           	 
	}catch(e)  

	{
		
	//alert("ERROR=cntc prsn=>"+e);	
		}
		       
	        }
	        
	//alert("I m fine");
	       var queryString = "?transporter="+transporter+"&gpname="+gpname;
		   ajaxRequest.open("GET", "AjaxGetcntprsn.jsp" + queryString, true);
		   ajaxRequest.send(null); 








}

function Getvehlist()
{
//alert("HI..... function ....");
//var transporter= document.getElementById("owner").options[document.getElementById("owner").selectedIndex].value;
//var gpname= document.getElementById("gpname").options[document.getElementById("gpname").selectedIndex].value;

var transporter= document.getElementById("transporter").value;
var gpname= document.getElementById("gpname").value;


//alert(transporter);
//alert("gpname==>"+gpname);




//  if(transporter!="")
// 	 
	
// 	alert("transporter block==>")
// 	var n="akshay";
// 	alert("n= inside function =>"+n)
	
	
// 	

// alert("n= outside function =>"+n)


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

        	try{
                var reslt=ajaxRequest.responseText;
             //  alert("reslt==>"+reslt);   
               

                reslt=reslt.replace(/^\s+|\s+$/g,"");
                var z=reslt.split("#");
             //   document.getElementById("tbvl").innerHTML=reslt;
               // var z=reslt.split("#");
             // alert("z[0]==>"+z[0]);
            //  alert("z[1]==>"+z[1]);
               
               if(reslt!="")
            	   {
            	   
            	  // document.getElementById("selectvehicleregno").innerHTML=reslt;  
            	   document.getElementById("selectvehicleregno").innerHTML=z[0];  
            	  // GetContactperson(transporter,gpname);
            	   document.getElementById("cntpersn").innerHTML=z[1];  
            	   
            	   }
               
               
               
               
               // document.getElementById("fnt").innerHTML=z[0];
               // var z=reslt.split("#");
               //alert("0==>"+z[0]);
             // alert("1==>"+z[1]);

               // //System.out.println(datacode[j]);
                //b++;
           	 
}catch(e)  

{
	
//alert("ERROR==>"+e);	
	}
	       
        }
        
//alert("I m fine");
       var queryString = "?transporter="+transporter+"&gpname="+gpname;
	   ajaxRequest.open("GET", "AjaxGetVehicles.jsp" + queryString, true);
	   ajaxRequest.send(null); 





	
}


function cleareall()
{
	//alert("in clear");
	 document.getElementById("tr1").style.display="none";   
     document.getElementById("tr2").style.display="none"; 
     document.getElementById("tr5").style.display="none"; 
     document.getElementById("tr6").style.display="none"; 
     document.getElementById("tr7").style.display="none"; 
     document.getElementById("tr8").style.display="none"; 
     document.getElementById("tr9").style.display="none"; 
     document.getElementById("tr10").style.display="none";
     document.getElementById("tr11").style.display="none";  
     document.getElementById("tr12").style.display="none"; 
     document.getElementById("tr13").style.display="none"; 
     document.getElementById("tr14").style.display="none"; 
     document.getElementById("tr15").style.display="none"; 
     document.getElementById("tr16").style.display="none";
     document.getElementById("tr17").style.display="none";  
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr18").style.display="none"; 
     document.getElementById("tr20").style.display="none"; 
     document.getElementById("tr21").style.display="none"; 
        document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
		document.incident.Filename10.value="";
}
function validateEmail(email)
{
     var splitted = email.match("^(.+)@(.+)$");
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



function validateform1()
{
	try
	{
	///alert("in validation");
	//var reportname=document.incident.ReportName.value;
	// var username=document.incident.UserName.value;
	 var emailid=document.incident.EmailID.value;
	 var number=document.getElementById("Number").value;
      var desc=document.getElementById("search-text").value;
      var vehicleregno=document.getElementById("selectvehicleregno").options[document.getElementById("selectvehicleregno").selectedIndex].innerHTML;
     // var Transporter=document.getElementById("owner").options[document.getElementById("owner").selectedIndex].innerHTML;
     // var issues=document.getElementById("issues").options[document.getElementById("issues").selectedIndex].innerHTML;

var cntpersn=document.getElementById("cntpersn").options[document.getElementById("cntpersn").selectedIndex].innerHTML;
      //var website=document.getElementById("website").options[document.getElementById("website").selectedIndex].innerHTML;

    //  alert("vehicleregno==>"+vehicleregno)
    //  alert("cntpersn==>"+cntpersn)

      document.getElementById("vehicleregno1").value=vehicleregno;
      document.getElementById("cntctprsn1").value=cntpersn;
     // alert("vehicleregno111==>"+document.getElementById("vehicleregno1").value)
      
      
      
      /*
       if(website=="All")
      {

      	alert("PLease select website from drop down");
      	return false;
      }




      Transporter=Transporter.replace(/\s/g, "");
      
      
     // alert("owner==>"+Transporter)
        //alert(Transporter.replace(/\s/g, "")=="All")

if(Transporter=="All")
{

	alert("PLease select Transporter from drop down");
	return false;
}



    
      issues=issues.replace(/\s/g, "");

      //alert("issues==>"+issues)


      
       

       vehicleregno=vehicleregno.replace(/\s/g, "");

        // alert("vehicleregno==>"+vehicleregno)
if(vehicleregno=="All")
{

	alert("PLease select vehicle from drop down");
	return false;
}
       
       

if(issues=="All")
{

	alert("PLease select issues from drop down");
	return false;
}




*/

//var gpname= document.getElementById("gpname").options[document.getElementById("gpname").selectedIndex].value
//alert(gpname);


//document.getElementById("gpname1").value=gpname;


     // document.getElementById("vehicleregno1").value=vehicleregno;

      
    // alert(document.getElementById("imageDiv").innerHTML.length);
     
	//	alert("report name:",reportname);
	// alert(username);
		//alert(emailid);
	//alert(number);
	 
	
	// if(document.getElementById("tr1").style.display=="" || document.getElementById("tr5").style.display=="" || document.getElementById("tr7").style.display=="" || document.getElementById("tr9").style.display=="" || document.getElementById("tr11").style.display=="" || document.getElementById("tr13").style.display=="" || document.getElementById("tr15").style.display=="" || document.getElementById("tr17").style.display=="" || document.getElementById("tr19").style.display=="" || document.getElementById("tr21").style.display=="")
	//{
		//alert("in if");	
	//}else
	 var cnt=document.incident.counter.value;
	//alert("Count "+cnt);
	//if(cnt>0)
	//{
		//alert(document.incident.Filename1.value);
		/*if(document.incident.Filename1.value == "" || document.incident.Filename2.value=="" || document.incident.Filename3.value=="" || document.incident.Filename4.value=="" || document.incident.Filename5.value=="" || document.incident.Filename6.value=="" || document.incident.Filename7.value=="" || document.incident.Filename8.value=="" || document.incident.Filename9.value=="" || document.incident.Filename10.value=="")
		{
			alert("Please attach the file");
			return false;
		}*/
//alert(cnt);
		//alert(document.getElementById("imageDiv").innerHTML.length);
		/*if(document.getElementById("tr1").style.display=="" && document.getElementById("f1").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr5").style.display=="" && document.getElementById("f2").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr7").style.display=="" && document.getElementById("f3").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr9").style.display=="" && document.getElementById("f4").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr11").style.display=="" && document.getElementById("f5").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr13").style.display=="" && document.getElementById("f5").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr15").style.display=="" && document.getElementById("f7").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr17").style.display=="" && document.getElementById("f8").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr19").style.display=="" && document.getElementById("f9").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}
		if(document.getElementById("tr21").style.display=="" && document.getElementById("f10").innerHTML.length==0)
		{
			alert("Please attach the file");
			return false;
		}*/
	//}
	 if(null==desc || desc.length==0)
     {
         alert("Please enter the Description!!");
         return false;
     }
    
	//if(document.getElementById("tr1").style.display=="" || document.getElementById("tr5").style.display=="" || document.getElementById("tr7").style.display=="" || document.getElementById("tr9").style.display=="" || document.getElementById("tr11").style.display=="" || document.getElementById("tr13").style.display=="" || document.getElementById("tr15").style.display=="" || document.getElementById("tr17").style.display=="" || document.getElementById("tr19").style.display=="" || document.getElementById("tr21").style.display=="")
	if(cnt==0)
	{
		//alert("count");
		if(document.incident.Filename1.value=="" || document.incident.Filename2.value=="" || document.incident.Filename3.value=="" || document.incident.Filename4.value=="" || document.incident.Filename5.value=="" || document.incident.Filename6.value=="" || document.incident.Filename7.value=="" || document.incident.Filename8.value=="" || document.incident.Filename9.value=="" || document.incident.Filename10.value=="")
		{
		//alert("in if");	
	    
		//alert("in else");	
		
		
		document.incident.Filename1.value="";
		document.incident.Filename2.value="";
		document.incident.Filename3.value="";
		document.incident.Filename4.value="";
		document.incident.Filename5.value="";
		document.incident.Filename6.value="";
		document.incident.Filename7.value="";
		document.incident.Filename8.value="";
		document.incident.Filename9.value="";
	    document.incident.Filename10.value="";
		
		
	     }
	 
	}  
    /*if(reportname=="")
    {
      alert("Please enter Report Name");
      return false;
     }*/
    /*else if(username=="")
    {
      alert("Please enter User Name");
      return false;
     }*/
    
   /* else if((document.getElementById("tr3").style.display).equalsIgnoreCase(""))
	{
    	alert("if yes");
    	if(number=="")
		{
			alert("Please enter Number");
			return false;
		}
    	else if(isNaN(number))
    		{
    			alert("Please enter Numeric Value");
    			return false;
    		}
    	else if ((number.length < 8)  || (number.length >12)){
            alert("Please enter valid Mobile Number"); return false;
        }
		
	}*/

     if(emailid!="")
    {
      /*alert("Please enter valid Email ID");
      return false;
     }
    else
	{*/
	        //emai=document.getElementById("email").value;
        var temp=new Array();
        temp=emailid.split(",");
        for(var i=0;i<temp.length;i++)
        {
		var sss=validateEmail(temp[i]);
		//alert(temp[i]);
		if(!sss)
			{
			    //alert(sss);
				alert("Please enter valid Email Id");
				return false;
			} 
        }
	}

	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			//alert("if yes");
	    	if(number=="")
			{
				alert("Please enter Number");
				return false;
			}
	    	 if(isNaN(number))
	    		{

	    	    	//var n1=document.getElementById("no").value;
	    			var n2=number.match("#");
	    			var n4 = number.match("-");
	    			var n3=number.match("[+]");
	    			var splitted3=number.match("[A-Za-z!@$%^&*()_,.<>;:]");
	    			if((n2!=null || n4!=null || n3!=null) && null==splitted3)
	    			{
	    			if(n2=="#" && (number.charAt(0))!="#")
	    				{
	    					alert("Invalid number!!");
	    					return false;
	    				}
	    			else
	    				{
	    				    for(var i=1;i<=number.length;i++)
	    				    	{
	    			 		   	   if(number.charAt(i)=="#")
	    			    			   {
	    			    			        alert("Invalid number!!");
	    			    			        return false;
	    			    			   }
	    			    		}
	    				}
	    		
	    			
	    		//alert(n1.match("[+]"));
	    		if(n3=="+" && (number.charAt(0))!="+")
	    			{
	    				alert("Invalid number!!");
	    			}
	    		else
	    			{
	    			    for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="+")
	    			    		   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    		   }
	    			    	}
	    			}
	    		
	    		
	    		var cnt=1;
	    		//alert(n1.match("-"));
	    		if(number.charAt(0)=="-")
	    			{
	    			 alert("Invalid number!!");
	    			 return false;
	    			}
	    		else
	    			{
	    		 for(var i=1;i<=number.length;i++)
	    			    	{
	    			    	   if(number.charAt(i)=="-")
	    			    		   {
	    			    		   if(cnt>2)
	    			    			   {
	    			    		        alert("Invalid number!!");
	    			    		        return false;
	    			    			   }
	    			    		   cnt++;
	    			    		   }
	    			    	   
	    			    	}
	    			}
	    			}
	    			else
	    			{
	    		    	alert("Please enter Numeric Value");
		    			return false;
	    			}
	    		   
	    		    }
	    	 if((number.length < 4)  || (number.length >15))
	 	    	{
	 	    	//alert("Hii");
	            alert("Please enter valid Mobile Number"); return false;
	            }
			
		}
	
       // alert(number.length);
    return true;
	}
	}catch(e)
	{
		alert(e);
		return false;
	}
    
	//var lnam=document.userinfo.lname.value;
  //  var mob=document.userinfo.mobno.value;
}


function getradio()
{
	//alert("Hii in radio 1");
	var elems = document.getElementsByName("browser");
	for(var i=0;i<elems.length;i++)
	{
		if(elems[i].checked==true)
		{
			document.incident.Number.value="";
		       document.getElementById("tr3").style.display="";   
		}
		else
			if(elems[i].checked==false)
		{
				document.incident.Number.value="";
			       document.getElementById("tr3").style.display="none"; 
		}
	}
	
}
function getradio1()
{
	//alert("Hii");
	
       document.getElementById("tr3").style.display="none";   	
}
function attach()
{
	try{
	//alert("Hii");
	//alert("in attach ");
	
		
var cnt=document.incident.counter.value;
//alert("351 count "+cnt);
if(cnt>0)
{
	//alert("count "+cnt);
}
else 
{
cnt=1;
var flagvalue=document.incident.flagvalue.value;
flagvalue++;
document.incident.flagvalue.value=flagvalue;
//alert(cnt);
document.incident.counter.value=cnt;

       document.getElementById("tr1").style.display="";   	
       document.incident.Filename1.style.display="";
      // document.incident.Filename1.value="";
      //document.getElementById("imageDiv").innerHTML="";
       document.getElementById("imageDiv").style.display="none";
     //  document.incident.Upload.style.display="";  
       document.getElementById("tr2").style.display="";   
}
	}catch(e)
	{
		alert(e);
	}
}

function attach1()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach1 ");
	
	document.getElementById("tr5").style.display="";  
	document.incident.Filename2.style.display="";
	//document.getElementById("imageDiv1").innerHTML="";
    document.getElementById("imageDiv1").style.display="none" 	
    document.getElementById("tr2").style.display="none"; 
    document.getElementById("tr6").style.display="";  
}
function attach2()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach2 ");
	document.getElementById("tr7").style.display="";   
	document.incident.Filename3.style.display="";
	//document.getElementById("imageDiv2").innerHTML="";
    document.getElementById("imageDiv2").style.display="none"	
    document.getElementById("tr6").style.display="none"; 
    document.getElementById("tr8").style.display="";  
}
function attach3()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach3 ");
	document.getElementById("tr9").style.display="";   
	document.incident.Filename4.style.display="";
	//document.getElementById("imageDiv3").innerHTML="";
    document.getElementById("imageDiv3").style.display="none"	
    document.getElementById("tr8").style.display="none"; 
    document.getElementById("tr10").style.display="";  
}
function attach4()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach4 ");
	document.getElementById("tr11").style.display="";
	document.incident.Filename5.style.display="";
	//document.getElementById("imageDiv4").innerHTML="";
    document.getElementById("imageDiv4").style.display="none"   	
    document.getElementById("tr10").style.display="none"; 
    document.getElementById("tr12").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach5()
{
	var cnt=document.incident.counter.value;
	cnt++;
//	alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach5 ");
	document.getElementById("tr13").style.display="";  
	document.incident.Filename6.style.display="";
	//document.getElementById("imageDiv5").innerHTML="";
    document.getElementById("imageDiv5").style.display="none" 	
    document.getElementById("tr12").style.display="none"; 
    document.getElementById("tr14").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach6()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach6 ");
	document.getElementById("tr15").style.display="";   
	document.incident.Filename7.style.display="";
	//document.getElementById("imageDiv6").innerHTML="";
    document.getElementById("imageDiv6").style.display="none"	
    document.getElementById("tr14").style.display="none"; 
    document.getElementById("tr16").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach7()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach7 ");
	document.getElementById("tr17").style.display="";  
	document.incident.Filename8.style.display="";
	//document.getElementById("imageDiv7").innerHTML="";
    document.getElementById("imageDiv7").style.display="none" 	
    document.getElementById("tr16").style.display="none"; 
    document.getElementById("tr18").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach8()
{
	var cnt=document.incident.counter.value;
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach8 ");
	document.getElementById("tr19").style.display="";   
	document.incident.Filename9.style.display="";
	//document.getElementById("imageDiv8").innerHTML="";
    document.getElementById("imageDiv8").style.display="none"	
    document.getElementById("tr18").style.display="none"; 
    document.getElementById("tr20").style.display="";  
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}
function attach9()
{
	var cnt=document.incident.counter.value;
	
	cnt++;
	//alert(cnt);
	document.incident.counter.value=cnt;
	//alert("in attach9 ");
	document.getElementById("tr21").style.display="";  
	document.incident.Filename10.style.display="";
	//document.getElementById("imageDiv9").innerHTML="";
    document.getElementById("imageDiv9").style.display="none" 	
    document.getElementById("tr20").style.display="none"; 
    
   // document.write("<tr align='center' id='tr23' style='' bgcolor='#FFF6F7'><td><div id='imageDiv' align='center'><font color='maroon' size='2'><b></b></font></div></td><td><input type='file' cols='40' name='Filename' value=''></td></tr>");
}

function upload()
{
	try{
	var file1=document.incident.Filename1.value;
	//alert(file1);
	
	document.incident.Filename1.style.display="none";
	document.getElementById("imageDiv").style.display="";
	document.getElementById("f1").innerHTML=file1;
	//document.incident.Upload.style.display="none";
	
	}catch(e)
	{
		alert(e);
	}
}

function upload1()
{
	try{
		var file1=document.incident.Filename2.value;
		//alert(file1);
		
		document.incident.Filename2.style.display="none"
		document.getElementById("imageDiv1").style.display="";
		document.getElementById("f2").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload2()
{
	try{
		var file1=document.incident.Filename3.value;
		//alert(file1);
		
		document.incident.Filename3.style.display="none"
		document.getElementById("imageDiv2").style.display="";
		document.getElementById("f3").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload3()
{
	try{
		var file1=document.incident.Filename4.value;
		//alert(file1);
		
		document.incident.Filename4.style.display="none"
		document.getElementById("imageDiv3").style.display="";
		document.getElementById("f4").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload4()
{
	try{
		var file1=document.incident.Filename5.value;
		//alert(file1);
		
		document.incident.Filename5.style.display="none"
		document.getElementById("imageDiv4").style.display="";
		document.getElementById("f5").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload5()
{
	try{
		var file1=document.incident.Filename6.value;
		//alert(file1);
		
		document.incident.Filename6.style.display="none"
		document.getElementById("imageDiv5").style.display="";
		document.getElementById("f6").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload6()
{
	try{
		var file1=document.incident.Filename7.value;
		//alert(file1);
		
		document.incident.Filename7.style.display="none"
		document.getElementById("imageDiv6").style.display="";
		document.getElementById("f7").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload7()
{
	try{
		var file1=document.incident.Filename8.value;
		//alert(file1);
		
		document.incident.Filename8.style.display="none"
		document.getElementById("imageDiv7").style.display="";
		document.getElementById("f8").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload8()
{
	try{
		var file1=document.incident.Filename9.value;
		//alert(file1);
		
		document.incident.Filename9.style.display="none"
		document.getElementById("imageDiv8").style.display="";
		document.getElementById("f9").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function upload9()
{
	try{
		var file1=document.incident.Filename10.value;
		//alert(file1);
		
		document.incident.Filename10.style.display="none"
		document.getElementById("imageDiv9").style.display="";
		document.getElementById("f10").innerHTML=file1;
		//document.incident.Upload.style.display="none";
		
		
		}catch(e)
		{
			alert(e);
		}
}

function cancel()
{
	//alert("in cancel");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
 		cleareall();
 		document.getElementById("f1").innerHTML=""; 	
 		
    }
    else
    {

    document.incident.counter.value=cnt;
	 document.incident.Filename1.value="";

	 document.incident.Filename2.value="";
	     document.getElementById("tr1").style.display="none";   
       document.getElementById("tr2").style.display="none"; 
       document.getElementById("f1").innerHTML=""; 	
}
}
function cancel1()
{//alert("in cancel 1");
	var cnt=document.incident.counter.value;
   
    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f2").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
		  document.incident.Filename2.value="";
	       document.getElementById("tr5").style.display="none";   
	       document.getElementById("f2").innerHTML=""; 
}
}
function cancel2()
{//alert("in cancel 2");
	var cnt=document.incident.counter.value;
   
    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f3").innerHTML=""; 
    }
    else
    {
 
    document.incident.counter.value=cnt;
	
	 document.incident.Filename3.value="";
	document.getElementById("tr7").value=""; 
       document.getElementById("tr7").style.display="none"; 
       document.getElementById("f3").innerHTML=""; 
}
}
function cancel3()
{
	//alert("in cancel 3");
	var cnt=document.incident.counter.value;

    cnt--;
  // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f4").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename4.value="";
	document.getElementById("tr9").value=""; 
    document.getElementById("tr9").style.display="none";
    document.getElementById("f4").innerHTML=""; 
   
}
}
function cancel4()
{//alert("in cancel 4");
	var cnt=document.incident.counter.value;

    cnt--;
   //alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f5").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename5.value="";
	document.getElementById("tr11").value=""; 
       document.getElementById("tr11").style.display="none";  
       document.getElementById("f5").innerHTML=""; 
  	
}
}
function cancel5()
{//alert("in cancel 5");
	var cnt=document.incident.counter.value;

    cnt--;
//  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f6").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename6.value="";
       document.getElementById("tr13").style.display="none"; 
       document.getElementById("f6").innerHTML=""; 
}
}
function cancel6()
{//alert("in cancel 6");
	var cnt=document.incident.counter.value;

    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f7").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename7.value="";
       document.getElementById("tr15").style.display="none";  
       document.getElementById("f7").innerHTML=""; 
}
}
function cancel7()
{//alert("in cancel 7");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f8").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename8.value="";
       document.getElementById("tr17").style.display="none"; 
       document.getElementById("f8").innerHTML=""; 
}
}
function cancel8()
{//alert("in cancel 8");
	var cnt=document.incident.counter.value;
   
    cnt--;
  //  alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f9").innerHTML=""; 
    }
    else
    {

    document.incident.counter.value=cnt;
	
	 document.incident.Filename9.value="";
       document.getElementById("tr19").style.display="none";  
       document.getElementById("f9").innerHTML=""; 
}
}
function cancel9()
{//alert("in cancel 9");
	var cnt=document.incident.counter.value;

    cnt--;
   // alert(cnt);
    if(cnt==0)
    {
    	document.incident.counter.value=cnt;
		cleareall();
		document.getElementById("f10").innerHTML=""; 
    }
    else
    {
  
    document.incident.counter.value=cnt;
	
	 document.incident.Filename10.value="";
     document.getElementById("tr21").style.display="none";  
     document.getElementById("f10").innerHTML=""; 
}
}




</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="background-color: #F5F5F5">
<%!
//String  MM_dbConn_STRING1="jdbc:mysql://192.168.2.55/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://192.168.1.55/db_gps";
//String  MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";

//String MM_dbConn_USERNAME="fleetview";
//String MM_dbConn_PASSWORD="d@1ry";

%>
<%!

String  MM_dbConn_STRING12,MM_dbConn_DRIVER2, MM_dbConn_USERNAME2, MM_dbConn_PASSWORD2 ;

%>



<%

MM_dbConn_STRING12="jdbc:mysql://192.168.2.55/db_gps";
MM_dbConn_DRIVER2 ="org.gjt.mm.mysql.Driver";

 MM_dbConn_USERNAME2="diary";
 MM_dbConn_PASSWORD2="d@1ry";
Connection conn1=null;
Statement strno1=null;

try
{
  System.out.println(">>>>>>>>>> in try");
 //String user=session.getAttribute("user").toString();
 String userrole=session.getAttribute("userrole").toString();
 String user=session.getAttribute("DisplayName").toString();
 String uname=session.getAttribute("userid").toString();
 String name=session.getAttribute("username").toString();
 System.out.println(">>>>>>>>>> in try2");
 System.out.println(">>>>>>>>>uname>>>>>>>>>"+uname);
 
 
 
 
 try
 {
 Class.forName(MM_dbConn_DRIVER2);
 }
 catch(Exception e)
 {
	 System.out.println("*********    "+e);
 }
	System.out.println("00000000......");
	
	System.out.println("<<><><><>1......");
	conn1 = DriverManager.getConnection(MM_dbConn_STRING12,MM_dbConn_USERNAME2,MM_dbConn_PASSWORD2);
	System.out.println("<><><><>222......");
	//sessionst = sessionconn.createStatement();
	//sessionst1 = sessionconn.createStatement();
	//Statement stqueryy=sessionconn.createStatement();
	 strno1 = conn1.createStatement();
 
	 System.out.println(">>>>>>>>>>11111111");
 
 
 String Msg=request.getParameter("Msg");
 System.out.println("******** " +Msg);
 String desc="";
 String EmailID="";
 String Number="";
 String category="";
 String priority="";
 String PageName="";
 String  web="";
 System.out.println(">>>>>>>>>>2222222......");
	if(Msg!=null && Msg.equalsIgnoreCase("1"))
	{
		  System.out.println("Msg "+Msg);
		     desc=request.getParameter("desc");
		     PageName=request.getParameter("PageName");
		      EmailID=request.getParameter("email");
		      Number=request.getParameter("Number");
		      category=request.getParameter("Category");
		      priority=request.getParameter("Priority");
		      
		        web=request.getParameter("website");
		   if(EmailID.equalsIgnoreCase("-"))
		   {
			   EmailID="";
		   }
		   System.out.println("Number "+Number);
		     System.out.println("desc "+desc);
		     System.out.println("PageName "+PageName);
		     System.out.println("EmailID "+EmailID);
		     
	     %>
	     <script type="text/javascript">
	     try{
	      alert("Error was occured while inserting the complaint. Please reattach your attachments and resubmit  your complaint.....");
	     }catch(e)
	     {
		     alert(e);
	     }
	     </script>
	     <%
	}
	else
	{
		System.out.println(">>>>>>>>>>33333333......");
 PageName=request.getParameter("PageName");
 System.out.println("####PageName####### "+PageName);
 desc="";
 EmailID="";
	}
	System.out.println("$$$$$$$$$$$  "+desc);
	System.out.println("$$$$$$$$$$$  "+EmailID);
 String ReportName="-";
 //System.out.println("\n\n session id-->>"+session.getId().toString()); 
 //String fname=(String)session.getAttribute("fname");
 //String lname=(String)session.getAttribute("lname");
 String email=(String)session.getAttribute("email");
 Class.forName(MM_dbConn_DRIVER); 
	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement s = conn1.createStatement();
	Statement s1 = conn1.createStatement();
	Statement s2 = conn1.createStatement();
	Statement s3 = conn1.createStatement();
	String today11=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
	//System.out.println("fname-->>"+fname);
	
	String sql2="select * from db_gps.t_reportnumberdiary where PageName='"+PageName+"'";
	ResultSet rs3=s2.executeQuery(sql2);
	System.out.println(sql2);
	if(rs3.next())
	{
		ReportName = rs3.getString("ReportName");
		System.out.println("ReportName>>>>>"+ReportName);
	}
	
	
//	String sql1="select * from t_sessions where SessionId='"+session.getId().toString()+"' AND ActiveStatus='Yes'";
	//System.out.println("Sessiupon id"+session.getId().toString());
   // ResultSet rs=s.executeQuery(sql1);
    //System.out.println("\n\n sql-->>"+sql1);
    int counter=0;
   // if(rs.next())
   // {
    
	%>


	
		<form name="incident" style="background: #F5F5F5;" method="post"  onsubmit="return validateform1();"  action="ComplaintInsert_Customer.jsp" enctype="multipart/form-data" >
		
	<div
		style="background: #E6E6E6; font-size: 1.5em; text-align: center; font-family: Arial; color: Red; width: 50%; margin-left: 18%;">
	Customer Complaint Registration Form</div>
	
	<div style="float:left;width:50%;">
	
	<table align="center"  style="background: #F5F5F5;width: 50%; margin-left: 17%;">
	<tr>
	<td align="right">
	<table align="right"  style="background: #F5F5F5">
	<tr>
	<td colspan="5" align="right" style="width: 100%;font-family: Arial;">
	<div align="left"><font size="2" color="black">
	  <b><br><%=user %> 
	 <br><%=email %></b></font>
	 </div>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td>
	<table align="center" style="background: #F5F5F5">

		<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left" style="width:50px"><font color="black" size="2" face="Arial">Description</font></td>
			
			<td valign="top" align="left">:</td>
			<td >
			
			<%
			System.out.println("^^^^^^^^^^^ "+desc);
			%>
				<textarea  name="desc" rows="3" id="search-text"  style='width: 230px; height: auto; border-color: activeborder;'><%=desc %></textarea>
				
				<input type="hidden" name="PageName" id="PageName" value="<%=PageName %>"/>
			</td>
		</tr>
			<tr><td valign="top"><font  color="#990000"></font></td>
			
			<td valign="top" align="left"  style="width:50px "><font color="black" size="2" face="Arial">Report Name </font></td>
			
			<td valign="top" align="left">:</td>
			<td>
			    <font color="black" size="2" face="Arial"> <%=ReportName %></font>
				<input type="hidden" name="ReportName" id="ReportName" style="width:230px; height: auto; border-color: white;"  value="<%=ReportName %>" readonly /> 
			</td>
			</tr>
		<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left"  style="width:50px "><font color="black" size="2" face="Arial">Category</font></td>
			<td valign="top" align="left">:</td>
			
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Category" id="Category" style="
				  	width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						>
					
			 	<%
                    String sqlcomplaint="select * from t_complaintcategory";
			 	    ResultSet rsc=s1.executeQuery(sqlcomplaint);
			 	    while(rsc.next())
			 	    {
			 	     %>
			 	       <option><%=rsc.getString("category") %></option>
			 	 	
			 	 	<%} %>
			 </select></font>
			</td>
		 
			</tr>
			<tr>
			
			
			<td valign="top"><font  color="#990000" size="2"></font></td>
			 <td   valign="top" align="left"  style="width:50px ">  <font color="black" size="2" id="w">Website &nbsp;</font></td>
	             
	             <td valign="top" align="left">:</td>
	             
	             <td align="left">
	             <select name="website" id="website" onchange="formsubmitt();" style="width: 90px">
						
			      <%
			      if(web!=null)
			      {
			    	  if(web.equalsIgnoreCase("All"))       				
     					{%>
     						
     						<option value="All" selected >All</option>
     						
     					<%}else{
     						%>
     							<option value="All" >All</option>
     						
     					<%}
			    	  
			    	  if(web.equalsIgnoreCase("FleetView"))       				
   					{%>
   						
   						<option value="FleetView" selected >FleetView</option>
   						
   					<%}else{
   						%>
   							<option value="FleetView" >FleetView</option>
   						
   					<%}
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("ERP"))       				
   					{%>
   						
   						<option value="ERP" selected >ERP</option>
   						
   					<%}else{
   						%>
   							<option value="ERP" >ERP</option>
   						
   					<%}
			    	  
			    	  if(web.equalsIgnoreCase("Transworld"))       				
   					{%>
   						
   						<option value="Transworld" selected >Transworld</option>
   						
   					<%}else{
   						%>
   							<option value="Transworld" >Transworld</option>
   						
   					<%}
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("Diary"))       				
	   					{%>
	   						
	   						<option value="Diary" selected >Diary</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="Diary" >Diary</option>
	   						
	   					<%}
			    	  
			    	  
			      }else{
			    	 
			    	  //System.out.println("********ELSe oF WEB***********>>>>>");
			    	  
			    	  %>
			    	  
			    	 <option value="All" selected >All</option>
						<option value="FleetView" >FleetView</option>
						<option value="ERP" >ERP</option> 
						<option value="Transworld" >Transworld</option> 
						
						<option value="Diary" >Diary System</option>  
			    	  
			    	  
			     <%}
			      
			     
			      //System.out.println("----********--------------department----->"+department);
			      %>			
						
						
	        	
	        	
	        	
	        	</select></td>
			
			</tr>
			
			
			<tr>
			<%
			String sr="group";
			%>
			
			<td valign="top"><font  color="#990000" size="2"></font></td>
			<td valign="top" align="left" style="width:50px " >
	 					<font color="black"  size="2" >Group&nbsp;&nbsp;</font>
	 				</td>
	 				<td valign="top" align="left">:</td>
<!-- 	 				<td   > -->
	 				
	 				
	 				<td align="left">	
							<input type="text" name="gpname"
								id="gpname" value="" style='width: 280px; font-size: 15px;' onkeyup="getGroupName('1','group')"   />						
						</td>
						
						
						
						
	 				
<!-- 						<select name="gpname" id="gpname" onchange="Getvehlist(this)"> -->
<!--         					<option value="-"> - </option> -->
<%
						


   String sql="";
                                                    // if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
                                                     //{	 
                                       //sql="select Distinct(GPName) as GPName from db_gps.t_group  order by GPName";
                                                    // }else{
                                       
                                       //sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter where typevalue in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')  order by TypeValue";
                                                  //   }
                                       
                                       //ResultSet rs2=strno1.executeQuery(sql);
							//System.out.println(">>>>>>>111111"+sql);
							//while(rs2.next()){
								//try{
								
                                %> 	   
                                    	   
<%--                                   <option value="<%=rs2.getString("GPName")%>" ><%=rs2.getString("GPName")%></option>  	    --%>
                                    <%   
								//}catch(Exception e){
								//e.printStackTrace();	
									
								//}
							//}	
%>
<!-- 						</select> -->


<!-- </td> -->
			
			
			</tr>
			
			
						
						
			
			<tr>
			
			
			<td valign="top"><font  color="#990000" size="2"></font></td>
			<td valign="top" align="left"  style="width:50px ">
	 					<font color="black"  size="2" >Transporter&nbsp;&nbsp;</font>
	 				</td>
	 				
	 				<td valign="top" align="left">:</td>
	 				
	 				<td align="left">	
							<input type="text" name="transporter"
								id="transporter" value="" style='width: 280px; font-size: 15px;' onkeyup="getGroupName('1','transporter');"   />						
						</td>
	 				
	 				
	 				
<!-- 	 				<td align="left"> -->
<!-- 						<select name="owner" id="owner" onchange="Getvehlist(this)"> -->
<!--         					<option value="All"> - </option> -->
<%
						
 sql="";
                                                    // if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
                                                     //{	 
                                      // sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter  order by TypeValue";
                                                    // }else{
                                       
                                       //sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter where typevalue in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')  order by TypeValue";
                                                  //   }
                                       
                                      // ResultSet rs=strno1.executeQuery(sql);
							//System.out.println(">>>>>>>111111"+sql);
						//	while(rs.next()){
							//	try{
								
                                %> 	   
                                    	   
<%--                                   <option value="<%=rs.getString("Transporter")%>" ><%=rs.getString("Transporter")%></option>  	    --%>
                                    <%   
								//}catch(Exception e){
								//e.printStackTrace();	
									
							//	}
						//	}	
%>
<!-- 						</select> -->
<!-- </td> -->
			
			
			
			
			</tr>
			
			
			
			<tr >
			
			
			<td valign="top"></td>
			
			
			<td valign="top" align="left"  style="width:50px ">
	 					<font color="black"  size="2" >VehicleList  &nbsp;&nbsp;</font>
	 				</td>
			<td valign="top" align="left">:</td>
			
			<td align='left'>
		<select name='vehicleregno' id='selectvehicleregno'   style="width:300px;"  >
			
			
			
			
			</select>
			</td>
			
			<td align='left'> </td>
			
			
			
			
<!--			<td valign="top" align="left">-->
<!--			-->
<!--			<div   id="allveh"  style="width: auto;">-->
<!--			-->
<!--			-->
<!--			-->
<!--			</div>-->
<!--			-->
<!--			-->
<!--			</td>-->
			
						
			</tr>
			
			<tr >
			
			
			<td valign="top"></td>
			
			
			<td valign="top" align="left" style="width:50px " >
	 					<font color="black"  size="2" >ContactList&nbsp;&nbsp;</font>
	 				</td>
			<td valign="top" align="left">:</td>
			
			<td align='left'>
		<select name='cntpersn' id='cntpersn'   style="width:300px;" >
			
			
			
			
			</select>
			</td>
			
			<td align='left'> </td>
			
			
			
			
<!--			<td valign="top" align="left">-->
<!--			-->
<!--			<div   id="allveh"  style="width: auto;">-->
<!--			-->
<!--			-->
<!--			-->
<!--			</div>-->
<!--			-->
<!--			-->
<!--			</td>-->
			
						
			</tr>
			<tr>
			
			
			<td valign="top"><font  color="#990000" size="2"></font></td>
			<td valign="top" align="left" style="width:50px "  onclick="">
	 					<font color="black" size="2" >Issues &nbsp;&nbsp;</font>
	 				</td>
	 				<td valign="top" align="left">:</td>
	 				<td align="left">
						<select name="issues" id="issues" >
        					<option value="All"> - </option>
<%
						
 sql="";
                                                    // if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
                                                     //{	 
                                       sql="select Distinct(issues) as issues from db_gps.t_stndrdIssues  order by issues";
                                                    // }else{
                                       
                                       //sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter where typevalue in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')  order by TypeValue";
                                                  //   }
                                       
                                       ResultSet rs1=strno1.executeQuery(sql);
							//System.out.println(">>>>>>>111111"+sql);
							while(rs1.next()){
								try{
								
                                %> 	   
                                    	   
                                  <option value="<%=rs1.getString("issues")%>" ><%=rs1.getString("issues")%></option>  	   
                                    <%   
								}catch(Exception e){
								e.printStackTrace();	
									
								}
							}	
%>
						</select>
</td>
			
			
			</tr>
			
			<tr>
			
			
			<td valign="top"><font  color="#990000" size="2"></font></td>
			<td valign="top" align="left" style="width:50px "  onclick="">
	 					<font color="black" size="2" >Complaint Media&nbsp;&nbsp;</font>
	 				</td>
	 				<td valign="top" align="left">:</td>
	 				<td align="left">
						<select name="cmplntype" id="cmplntype" >
        					<option value="-"> - </option>

                              
						<option value="Mail" >Mail</option>
						<option value="Phone Call" >Phone Call</option> 
						

						</select>
</td>
			
			
			</tr>
			
			
			<tr>
			<td valign="top"><font  color="#990000" size="2"></font></td>
			<td valign="top" align="left" style="width:50px "  onclick="Getvehlist(this)">
	 					<font color="black" size="2" >Date &nbsp;&nbsp;</font>
	 				</td>
	 				<td valign="top" align="left">:</td>
	 				
	 				<td  width="668px" id="frmdt" ><font color="black" size="2" id="trigger">&nbsp;&nbsp;From :</font>
				  <input type="text" id="data" name="data1" class="formElement" value="<%= today11%>" size="10" readonly/>
				  
<!--					<input type="button" name="From Date" value="From Date" id="trigger" />-->
					<script type="text/javascript">
	  				Calendar.setup(
	    			{
	      			inputField  : "data",         // ID of the input field
	      			ifFormat    : "%d-%b-%Y",     // the date format
	      			button      : "calender"       // ID of the button
	    			}
	  				);	
					</script>
				 &nbsp;
					
				<font color="black" size="2" id=trigger1>To :</font>
				 
				 
				 
 <input type="text" id="data1" name="data2" class="formElement" value="<%=today11%>" size="10" readonly/>
<!--									 	<input type="button" name="data2" value="To Date" id="trigger1" "/>-->
										<script type="text/javascript">
						  				Calendar.setup(
						    			{
						      			inputField  : "data1",         // ID of the input field
						      			ifFormat    : "%d-%b-%Y",    // the date format
						      			button      : "calender1"       // ID of the button
						    			}
						  				);
										</script>
								</td>
	 				
	 				
	 				
	 				
			
			
			</tr>
			
			
			<tr><td valign="top"><font  color="#990000" size="2">*</font></td>
			<td valign="top" align="left"  style="width:50px "><font color="black" size="2" face="Arial">Priority </font></td>
			<td valign="top" align="left">:</td>
			<td align="left"><font color="black" size="2" face="Arial">
			 <select name="Priority" id="Priority" style="
				  	width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"
						>
			 	<option value="Low">Low</option>
			 	<option value="High">High</option>
			 	
			 </select></font>
			</td>
		</tr>
			<!-- <tr><td valign="top"><font  color="#990000">*</font></td>
		
			<td valign="top" align="left"><font color="black"><b>User Name : </b></font></td>
			<td>
				<input type="text" name="UserName" id="UserName" style="width:230px; border-color: activeborder;" autocomplete="off"  value=""  /> 
			</td>
			</tr>-->
		<tr><td valign="top"><font  color="#990000"></font></td>
			
			<td valign="top" align="left"  style="width:50px "><font color="black" size="2" face="Arial">Email recepients</font></td>
			<td valign="top" align="left">:</td>
			
			<td>
			<%
			System.out.println("^^^^^^^^^^^ "+EmailID);
			%>
				<input  type="text"  name="EmailID"  value="<%=EmailID%>"  id="EmailID"  style="width:230px; border-color: activeborder;" autocomplete="off" /> 
				<br><font size="1" face="Arial">Please enter comma separated email ids.</font>
			</td>
			</tr>
			<!-- </table>
			<table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5">-->
			
			<tr><td valign="top"><font  color="#990000"></font></td>
			<td valign="top" align="left" colspan="1"><font color="black" size="2" face="Arial">Call me back</font>
			<!-- <td>
			<input type="radio" name="browser" value="No"   onclick="getradio1();" checked >No
            <input type="radio" name="browser" value="Yes"  onclick="getradio();">Yes
              </td>-->
              
              &nbsp;&nbsp;&nbsp;<input type="checkbox" name="browser" id="browser"  value="1"  onclick="getradio();"><font size="1" face="Arial">Yes </font>
              </td>
              <td  align="left" style="display: none;" id="tr3"> <input type="text" name="Number" id="Number" style="width:230px; border-color: activeborder;" autocomplete="off"  value="" /><input type="hidden" name="Number1" id="Number1" ></td>
              </tr></table>
			
              <!--  <div id="div2" position="absolute" style="width: 40%; margin-left: 50%">
		              <table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5">
			         <tr align="center" id="tr3" style="display: none;" bgcolor="#F5F5F5">
		    			   <td  align="center"> <font   size="2" color="black"> <b>Number: </b></font> </td>
			 			   <td  align="center"> <input type="text" name="Number" id="Number" style="width:230px; border-color: activeborder;" autocomplete="off"  value="" /><input type="hidden" name="Number1" id="Number1" ></td>
		     			</tr>
		     			</table>
		     			</div>-->
		     			
		     			  
			<table align="center" style="background: #F5F5F5">
			
		<tr>
			<input type="hidden"  name="counter" id="counter" value="<%=counter%>"></input>
			<input type="hidden"  name="flagvalue" id="flagvalue" value="<%=counter%>"></input>
			<td valign="top" align="left" colspan="1"><b>&nbsp;&nbsp; <a href="#" onclick="attach();"><font size="2" face="Arial">Attach File</font></a>
		</b>
		                <div><font size="1" color="black" face="Arial">&nbsp;&nbsp;(You can attach a screen shot of the error page <br>&nbsp;&nbsp;or a file which you would like to link with this complaint entry.)</font> </div>
			           <div id="div2" position="absolute" style="width: 30%;" align="center">
		                <table border="0" align="center" >
		       			<tr align="center" id="tr1" style="display: none;">
		       		    <input type="hidden" id="ip1" name="ip1" value=""></input>
		       		    
		       			<!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>name-->
                       <td align="right">&nbsp;&nbsp;<input type="file" cols="40" name="Filename1" value="" onchange="upload();"/></td>
                      <td style="display: none;width: 20%;" id="imageDiv" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f1"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                       
                        <tr align="center" id="tr2" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach1();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr5" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename2" value="" onchange="upload1();"/></td>
                       <td style="display: none;width: 20%;" id="imageDiv1" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f2"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel1();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                        
                         <tr align="center" id="tr6" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach2();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr7" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename3" value="" onchange="upload2();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv2" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f3"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel2();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                         
                         
                         <tr align="center" id="tr8" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach3();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr9" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename4" value="" onchange="upload3();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv3" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f4"></font></td>
                        <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel3();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>
                          
                           <tr align="center" id="tr10" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach4();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr11" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename5" value="" onchange="upload4();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv4" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f5"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel4();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr12" style="display: none;" >                        
                        <td valign="top" align="left"><b>&nbsp;&nbsp; <a href="#" onclick="attach5();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr13" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename6" value="" onchange="upload5();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv5" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f6"></font></td>
                       <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel5();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr14" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach6();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr15" style="display: none;" >
		             <!--  <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename7" value="" onchange="upload6();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv6" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f7"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel6();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr16" style="display: none;" >                        
                        <td valign="top" align="left"><b>  &nbsp;&nbsp;<a href="#" onclick="attach7();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr17" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename8" value="" onchange="upload7();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv7" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f8"></font></td>
                          <td>&nbsp;&nbsp;&nbsp;<b><a href="#" onclick="cancel7();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr18" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach8();"><font size="2" face="Arial">AttachMoreFiles </font></a></td></tr>
		               <tr align="center" id="tr19" style="display: none;" >
		               <!--<td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename9" value="" onchange="upload8();"/></td>
                         <td style="display: none;width: 20%;" id="imageDiv8" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f9"></font></td>
                       <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel8();"><font size="2" face="Arial">Remove</font></a></b></td>
                        </tr>  
                        
                          <tr align="center" id="tr20" style="display: none;" >                        
                        <td valign="top" align="left"><b> &nbsp;&nbsp;<a href="#" onclick="attach9();"><font size="2" face="Arial">AttachMoreFiles</font> </a></td></tr>
		               <tr align="center" id="tr21" style="display: none;" >
		               <!-- <td><div id="imageDiv" align="center"><font color="maroon" size="2"><b></b></font></div></td>-->
                        <td>&nbsp;&nbsp;<input type="file" cols="40" name="Filename10" value="" onchange="upload9();"/></td>
                        <td style="display: none;width: 20%;" id="imageDiv9" align="left" colspan="2"><font size="2" face="Arial" color="black" id="f10"></font></td>
                        <td>&nbsp;&nbsp;&nbsp; <b><a href="#" onclick="cancel9();"><font size="2" face="Arial">Remove</font></a></b></td>
                       
                       <input type="hidden" name="vehicleregno1"  id="vehicleregno1" value="" >  </input>
                       <input type="hidden" name="cntctprsn1"  id="cntctprsn1" value="" >  </input>
                       
                        </tr>  
                                             
                      
		                
                        </table>
                        </div>
			
			</td>
		</tr>
		</table>
			<table align="center" border="0" cellpadding="3" width="40%" style="background: #F5F5F5; margin-left: 18%;">
			
		<tr><td> </td></tr><tr><td> </td></tr>
		<tr>
			<td valign="bottom" align="center" colspan="2">
			<div><input type="submit" id="submit" name="submit" value="Submit" /></div>
			</td>
		</tr>
 
<%
if(Msg!=null && Msg.equalsIgnoreCase("1"))
{
	if(!(Number.equalsIgnoreCase("")) && !(Number.equalsIgnoreCase("-")))
	{
		System.out.println("in number "+Number);
		%>
		<input type="hidden" id="Number2" value="<%=Number %>"></input>
		
		<script>
		try
		{
		
		var elems = document.getElementsByName("browser");
		 	for(var i=0;i<elems.length;i++)
		 	{
		 		elems[i].checked=true;
		 	}
		 	document.getElementById("tr3").style.display="";
		 	//alert("Number2 "+document.getElementById("Number2").value);
		 
		 	document.getElementById("Number").value=document.getElementById("Number2").value;
		 	
		 	//alert("Number "+document.getElementById("Number").value);
		}catch(e)
		{
			alert(e);
		}
		</script>
		<%
		System.out.println("in number1");
	}
	%>
	<input type="hidden" id="Category1" value="<%=category %>"></input>
		<input type="hidden" id="priority1" value="<%=priority %>"></input>
		<script>
		//alert("Category1 "+document.getElementById("Category1").value);
	 //	alert("priority1 "+document.getElementById("priority1").value);
		document.getElementById("Category").value=document.getElementById("Category1").value;
	 	document.getElementById("Priority").value=document.getElementById("priority1").value;
		</script>
	<%
}

%>
 
	</table>
	</td></tr>
	</table>
	
	</div>
	<div  style="float:left;height:100%   ">
<table align="center"  style="background: #F5F5F5;width: 50%;">
	
	<tr style="height:175px ">
	</tr>
	
<tr>
	</tr>
	
<tr>
	</tr>
<tr>
	</tr>
	

						
						
						
						<tr id = "comlist"  style="display:none;" >
						<td></td>
						
						
						
						
						<td valign="top"    style="text-align: ;" >
						
						
<!-- 						<div id=companyList> -->
<!-- 							<div style="height: 10px; width: 400px; overflow: auto;"> -->
<!-- 							<table style="display: none;"> -->

<!-- 							</table> -->

<!-- 							</div> -->
<!-- 							</div> -->
						
						
						
						<div align="left" style="border: thin;"> 
						<div id='companyList' style="background-color: white;height: 150px; width: 350px; overflow: auto; border:solid inset;" align="center">
						
						</div>
							<input type="hidden" name="counter" id="counter" value="10" />
							</div>
						
						
						
						</td>
						
						
						
						</tr>
					
						
						
						
	
	
	
	</table>
	
	</div>
	
	
<br>
	<br>
	<br>
	
	</form>

	
	
	
	<%

//}
    //    else
    //{
    	//System.out.println(">>>>>>>>>>else......");
    	//session.invalidate();
    	%>
    	<script>
    	//window.close();
    	</script>
    	<%
    	//response.sendRedirect("index.jsp");
    //}
    
    
}

catch (NullPointerException e)
{
	   System.out.println("bar.couldReturnNull() returned null");
	} 

 %></body>
	</html>


