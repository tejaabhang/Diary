<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp"%>
<%!Connection conn, conn1;
	Statement st_user,st, st1, st2, st3, st4, stmtsp1, stmtsp11, stmtsp, stmtsp111,stvhdt,stvhdt1,
			stQuickTest, st5, st6, st9, st11, st23, st01, stmt1, stmt2, st12,
			stamc, stamc1, stwar1, stwar2, stwar3, stwar4, cnt1, cnt2, cnt3,
			cnt4, cnt5, cnt6, cnt7, cnt8 , cnttot,cnttot1,cnttot2,cnttot3,cnttot4,cnttot5,cnttot6,cnttot12;
	String data, data1, fromdate = "", transporter="", Svehlist, today, typeunit;
	String InstalledPlace, InstPlace = "N.A.", username, simno = "-",
			mobno = "-", vehiclecode;
	String sqlamc, sqlamc1, sqlamc2, sqlamc3, sqlamc4, sqlbt;
	String sql, sql1, sql2, sql3, sql4;
	String chk = "-", stg1 = "", stg2 = "", stg3 = "", stg4 = "", status = "",
			status1 = "", close1 = "", opentct = "", opened = "",
			closedtot = "", totaltc = "";
	
	String control_reallocation="-",tranporter_realct="-",tcategory_realct="-";
	String sql5, sql6, sql7, sql8;
	String instdate, warranty, expdate, simcomp = "-", peripherals = "-",
			Empname = "", OwnerName = "" ,Instruction = "", psno = "", pcbno = "", boxno = "",
			batteryno = "", WMSN = "NA", CodeVersion = "NA", UnitType = "NA",
			battrystatus = "NA", battrystatustime = "NA";
	String t1 = "opened", t2 = "closedtot", t3 = "totaltc";
	String t11 = "All", t22 = "All", t33 = "All";%>



<html><head><title>Seven Day Diary System</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"charset="utf-8" />
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css"/>
	
	
	
<script src="sorttable.js" type="text/javascript"></script>
<script language="javascript">



    function checkboxvalues(){
     alert("HII>>>>.");

  try{
     var a=document.getElementById("chk").value;
  // var b=document.getElementById("stg1").Value;
   //var c=document.getElementById("stg2").Value;
 //  var d=document.getElementById("stg3").Value;
 //  var e=document.getElementById("stg4").Value;
   //var e=document.getElementById("chklength").Value;

   alert(">>>a>>"+a);
   
   if(a=="ToCheck")
   {
	   alert(">>inside >");

		   a.checked=true;


		   alert(">>YOOOOO >");
		   
   }
    alert(">>>up to here ");
    alert(">>>"+a);
  
  }catch(e){
alert(">>"+e);
  }
    	
    } 

      function validate()
  			{
                           var v1=document.unit.data.value;
                           var validChar='0123456789';   // legal chars
                           var   strlen=v1.length;       // test string length
                          
                           if(strlen==0||strlen>20)
                               {
                               //    alert("Invalid Unit ID length" );
                               //    return false;
                               }
                               
                               v1=v1.toUpperCase(); // case insensitive
                                                             

                           for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
                                {
                                    
                                    if(validChar.indexOf(v1.charAt(ic))<0)
                                        {		
                                            alert("please enter a valid Unit ID!");
                                            return false;
                                        }
                                } // end scanning
                           return true;       
                        }
  				
		
 			function ShowHide(id)
 			{
 				if(id==0)
 				{
 					document.getElementById("uid").style.display="";
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==1){
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display="";
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}else if(id==2)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display="";
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display="";
 				}
 				else if(id==3)
 				{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display="";
 					document.getElementById("submitbutton").style.display="";
 				}else if (id ==7){

                   //alert("HIII");
                    try{

                        //alert(document.getElementById("chk"));
                        //alert("yyyyyyyyyyyyyessssssssssssssssss")
                        
                        //var a=document.getElementById("chk").value;

                        //alert(">>>>"+a);
					if((document.getElementById("chk1")).checked)
 					{


	 					   //alert("inside if ");
 					
 					document.getElementById("to").style.display='none';
 					document.getElementById("from").style.display='none';
 					
 					document.getElementById("calender1").style.display='none';
 					
 					document.getElementById("calender").style.display='none';
 					
 					}else{
                          //alert("else loop");
                         


     						//document.getElementById("hide").style.display="";
 						document.getElementById("to").style.display="";
 						document.getElementById("from").style.display="";
 						document.getElementById("calender1").style.display="";
 						
 						document.getElementById("calender").style.display="";



 						
 					}

                    }catch(e)
                    {
                      alert(e);
                    }
 					

 				}else{
 					document.getElementById("uid").style.display='none';
 					document.getElementById("wmsn").style.display='none';
 					document.getElementById("sim").style.display='none';
 					document.getElementById("mobile").style.display='none';
 					document.getElementById("submitbutton").style.display='none';
 				}
 			}

 			function addgroup()
 			{
 				//alert("in add group function");
 			
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="AddEditGroup.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		
 			    		if(document.getElementById("cb"+j).checked==true)
 			    		{
 			    		//	alert("unitid"+document.getElementById("unitid"+j).value);
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}
 			function deletegroup()
 			{
 				//alert("in delete group function");
 			
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="DeleteGroup.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			    		//	alert("unitid"+document.getElementById("unitid"+j).value);
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}

 			function gotoPrint(divName)  
 			{  
 				  
 		    
 		            alert("HI....");
 				  var printContents = document.getElementById(divName).innerHTML; 
 				  var originalContents = document.body.innerHTML; 
 				  document.body.innerHTML = printContents;  
 				  window.print();
 				  document.body.innerHTML = originalContents;  
 			}


 			function gotoExcel(elemId,frmFldId)  
 			{  
 				try
 				{
 				 var obj = document.getElementById(elemId);  
 		         var oFld = document.getElementById(frmFldId); 
 		         oFld.value = obj.innerHTML;  
 		         alert("&&&&&&&&&&&&&&&")
 		         document.fullfleet1.action = "excel.jsp";
 		         alert("IIIIIIIIIIIIIIIIIII");
 		         document.fullfleet1.submit();
 		         alert("*********************8");
 		        // document.fullfleet.action ="excel.jsp";
 		        // document.forms["fullfleet"].submit();
 				}
 				catch(e)
 				{
 					alert(e);
 				}
 			} 

 			function addeditemp()
 			{
 				alert("in add edit employee function");
 			
 				var transporter=document.fullfleet1.transporter.value;
 				alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				alert(cntr);
 				alert("hi"+cntr);
 				cntr=cntr-1;
 				alert("hi"+cntr);
 				var url="AddEditMultipleEmp.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	alert("j loop");
 			    		
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			    			alert("unitid"+document.getElementById("unitid"+j).value);
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							 alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}
 			function unitmissing()
 			{
 				//alert("in unitmissing function");
 			
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="unitmissingmultiple.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			    			//alert("unitid"+document.getElementById("unitid"+j).value);
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value+"&unitid"+i+"="+document.getElementById("unitid"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}
 			
 			function deactive()
 			{
 				//alert("in deactivation function");
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="multipleDeactivation.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}
 			function permremoval()
 			{
 				//alert("in perm removal function");
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="perremoval.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}

 			function makecall()
 			{
 				alert("in make call function");
 				

              try{
            	  var transporter=document.fullfleet1.transporter.value;
   				alert(transporter);

              }catch(e){
                   alert(">>"+e);
              }
 				var cntr=document.fullfleet1.cntr.value;
 				alert(cntr);
 				alert("hi"+cntr);
 				cntr=cntr-1;
 				alert("hi"+cntr);
 				var url="addcomplaint.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	alert("j loop");
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value+"&tid"+i+"="+document.getElementById("tid"+j).value+"&category"+i+"="+document.getElementById("category"+j).value;
 							 i++;
 							 alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        alert("end>>>");
 			        document.fullfleet1.submit();
 					}



 			
 			function tempremoval()
 			{
 				//alert("in temp removal function");
 				var transporter=document.fullfleet1.transporter.value;
 				//alert(transporter);
 				var cntr=document.fullfleet1.cntr.value;
 				//alert(cntr);
 				//alert("hi"+cntr);
 				cntr=cntr-1;
 				//alert("hi"+cntr);
 				var url="remuittempmultiple.jsp?transporter="+transporter;
 			      	var i=0;
 			   	for(var j=0;j<cntr;j++)
 			    	{	//alert("j loop");
 			    		if(document.getElementById("cb1"+j).checked==true)
 			    		{
 			            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 							 i++;
 							// alert("map"+url);
 			    		}		
 			    	}
 			        //write function to check no of check boxes get value
 			        document.fullfleet1.action=url+"&cntr="+i;
 			      	//document.fullfleet.action="Changewarranty1.jsp";
 			        //alert(document.fullfleet.action);
 			        document.fullfleet1.submit();
 					}
 			
 				function toggleDetails(id, show)
 				{
                     // alert("aaa");
 					var popup = document.getElementById("popup"+id);
 					//alert("aa11");
 					if (show) {
                         // alert("aa22");
 						popup.style.visibility = "visible";
 						//popup.style.visibility = "hidden";
 						popup.setfocus();
 						
 					} else {
 						//alert("aa33");
 						popup.style.visibility = "hidden";
 					}
 				}
 				function toggleDetails1(id, show)
 				{
 					//alert("bbbb");
 					var popupx = document.getElementById("popupx"+id);
 					if (show) {
 						popupx.style.visibility = "visible";
 						popupx.setfocus();
 						
 					} else {
 						popupx.style.visibility = "hidden";
 					}
 				}
 				function showtextarea(a,b,c)
 				{
 					document.getElementById("div"+a).innerHTML="<form action='callinfo.jsp' method='get'><TEXTAREA name='callinfo' id='callinfo'class='formElement'></TEXTAREA><br><input type='Submit' name='Submit' value='Submit' class='formElement'><input type='button' value='Cancel' onclick='canceldiv("+a+");' class='formElement'><br><input type='hidden' name='rname' value='"+b+"'><br><input type='hidden' name='transporter' value='"+c+"'><br><input type='hidden' name='pagename' value='currentdata.jsp'></form>";
 				}mouse;
 				function canceldiv(A)
 				{
 				document.getElementById("div"+A).innerHTML="<a href='javascript:showtextarea("+A+");'>Edit</a>";
 				}

 				function selectAll()
 				{
                       //alert("HIIII");
                  try{
    					var cntr=document.fullfleet1.cntr.value;

     					//alert("HIIII11111   ");
 					cntr=cntr-1;
 				  // alert(document.getElementById("cb1"+j).value)
 					if(document.fullfleet1.maincb.checked==true)
 					{
 						//alert("unside>>>");
 						for(var j=0;j<=cntr;j++)
 						{	
 							document.getElementById("cb1"+j).checked=true;
 						}
 					}
 					else
 					{
 						
 						for(var j=0;j<=cntr;j++)
 						{	
 							document.getElementById("cb1"+j).checked=false;
 						}
 					
 					}
                  }catch(e){
                    // alert(e); 
 					}
 					  //alert("HIIII 2222");
 	 				}

 				function validate()
 				{
 					var cntr=document.fullfleet1.cntr.value;
 					cntr=cntr-1;
 				
 					var flag="False";
 				
 					for(var j=0;j<cntr;j++)
 					{	
 						if(document.getElementById("cb1"+j).checked==true)
 						{
 							flag="True";
 						}		
 					}
 				
 					if(flag=="False")
 					{
 						alert("Please select check-box");
 						return false;	
 					}		
 					return true;
 				}
 				function changeAction()
 				{ //alert("hi");
 					var transporter=document.fullfleet1.transporter.value;
 					var cntr=document.fullfleet1.cntr.value;
 					//alert("hi"+cntr);
 					cntr=cntr-1;
 					//alert("hi"+cntr);
 					var url="changewarranty.jsp?transporter="+transporter;
 				      	var i=0;
 				   	for(var j=0;j<cntr;j++)
 				    	{	//alert("j loop");
 				    		if(document.getElementById("cb1"+j).checked==true)
 				    		{
 				            	 url=url+"&id"+i+"="+document.getElementById("id"+j).value+"&vehno"+i+"="+document.getElementById("vehno"+j).value;
 								 i++;
 								// alert("map"+url);
 				    		}		
 				    	}
 				        //write function to check no of check boxes get value
 				        document.fullfleet1.action=url+"&cntr="+i;
 				      	//document.fullfleet.action="Changewarranty1.jsp";
 				        //alert(document.fullfleet.action);
 				        document.fullfleet1.submit();
 				}
 				

 				function birt(){
 					
 					var transporter=document.getElementById("owner").value;
 					//alert( userid);
 					// var sort=document.getElementById("sort").value;
 					//var chkb=document.getElementById("extAll").checked;
 					
 					var Chk= document.getElementById("chk").checked;
 					if(Chk ==true)

 					{
 						Chk= "ToCheck";				
 					}
 				   else
 					{
 					  Chk="no";
 					} 					
 					var Stg1= document.getElementById("chk").checked;
 					if(Stg1 ==true)

 					{
 						Stg1= "Stage1Ticket";				
 					}
 				   else
 					{
 					  Stg1="no";
 					} 
 					var Stg2= document.getElementById("chk").checked;
 					if(Stg2 ==true)

 					{
 						Stg2= "Stage2Ticket";				
 					}
 				   else
 					{
 					  Stg2="no";
 					} 
 					var Stg3= document.getElementById("chk").checked;
 					if(Stg3 ==true)

 					{
 						Stg3= "Stage3Ticket";				
 					}
 				   else
 					{
 					  Stg3="no";
 					} 
 					var Stg4= document.getElementById("chk").checked;
 					if(Stg4 ==true)

 					{
 						Stg4= "Stage4Ticket";				
 					}
 				   else
 					{
 					  Stg4="no";
 					} 
 					//var date2= document.getElementById("date4").value;
 					//var date2= document.getElementById("data1").value;
 					//alert(transporter);
 					//alert(Chk);
 					//alert(Stg1);
 					//alert(Stg2);
 					//alert(Stg3);
 					//alert(Stg4);
 					
 					document.getElementById("myIframe").src="http://103.241.181.36:8080/ERPTestBirt/frameset?__report=TIC_report.rptdesign&Transporter="+transporter+"&Chk="+chk+"&Stg1="+stg1+"&Stg2="+stg2+"&Stg3="+stg3+"&Stg4="+stg4+"&__showtitle=false";
 					//document.getElementById('myIframe').src="http://103.241.181.36:8080/ERPTestBirt/frameset?__report=Tic_report.rptdesign";
 					document.getElementById("reportData").style.display="";
 					document.getElementById("footer").style.display="none";
 					
 				}  

 				
 			
</script>
<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
		}
		
		</style>
	

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
<P></p>
<%
String   userrole11=session.getAttribute("userrole").toString();
   %>
   <%
   if(userrole11.equalsIgnoreCase("supertech"))
   {%>
	   <%-- <%@ include file="headertech.jsp" %> --%>
	   
   <%}else{
	%>   
	  <%@ include file="header1.jsp" %> 
	   
   <%}
   %> 
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 



<%
try{
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
    Statement stwmsn=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn.createStatement();
    st3=conn1.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();
    st5=conn1.createStatement();
	st6=conn1.createStatement();
	st23=conn1.createStatement();
	st9=conn1.createStatement();
	st11=conn1.createStatement();
	st12=conn1.createStatement();
	stamc=conn1.createStatement();
	stamc1=conn1.createStatement();
	stmtsp1=conn.createStatement();
	stmtsp111=conn.createStatement();
	stmtsp11=conn.createStatement();
	stmtsp=conn.createStatement();
		stwar1=conn1.createStatement();
		stwar2=conn1.createStatement();
	stwar3=conn1.createStatement();
		stwar4=conn1.createStatement();
		stmt1=conn1.createStatement();
		stmt2=conn1.createStatement();
		cnt1=conn1.createStatement();
		cnt2=conn1.createStatement();
		cnt3=conn1.createStatement();
		cnt4=conn1.createStatement();
		cnt5=conn1.createStatement();
		cnt6=conn1.createStatement();
		cnt7=conn1.createStatement();
		cnt8=conn1.createStatement();
		cnttot1 =conn1.createStatement();
		cnttot2 =conn1.createStatement();
		cnttot3 =conn1.createStatement();
		cnttot4 =conn1.createStatement();
		cnttot5 =conn1.createStatement();
		cnttot6 =conn1.createStatement();
		cnttot =conn1.createStatement();
		cnttot12 =conn1.createStatement();
		st_user =conn1.createStatement();
		stvhdt=conn1.createStatement();
		stvhdt1=conn1.createStatement();
		
		
		
		
		
    java.util.Date dte = new java.util.Date();
    Format formatter = new SimpleDateFormat("dd-MM-yyyy");
	String today=formatter.format(dte);
    String abc1 ="";
    
    abc1=today;
	
	String dataDate1="",dataDate2="",transporter_name="-";
    

	System.out.println(">>>>>>today >>>>>>>>>>"+today);
	
       
	System.out.println(">>>>>>abc1 >>>>>>>>>>"+abc1);
	
	fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
      
    
    if(fromdate!=null || todate!=null){
		fromdate=fromdate.trim();
	    todate=todate.trim();
		System.out.println("fromdate>>>>"+fromdate);
	    System.out.println("todate>>>>"+todate);
	DateFormat df123= new SimpleDateFormat("dd-MM-yyyy");
	DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
	dataDate1=df1234.format(df123.parse(fromdate));
	 dataDate2=df1234.format(df123.parse(todate));
	
	//SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
   // SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy");
   // Date date1 = format1.parse("05/01/1999");
   // System.out.println(format2.format(date));

	
	//java.util.Date dt=new java.util.Date();
	//SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	//String  formattedDate = formatter1.format("fromdate");
	
	//String  formattedDate1 = formatter1.format("todate");
	
	System.out.println("dataDate1>>>> "+dataDate1);
	System.out.println("dataDate2>>>> "+dataDate2);
	
	}
    
    

System.out.println(">>>>>>fromdate >>>>>>>>>>"+fromdate);

chk=request.getParameter("chk");
stg1=request.getParameter("stg1");
stg2=request.getParameter("stg2");
stg3=request.getParameter("stg3");
stg4=request.getParameter("stg4");
status=request.getParameter("status");
status1=request.getParameter("status1");
close1=request.getParameter("closed");
opentct=request.getParameter("opentct");
opened=request.getParameter("opened");
closedtot=request.getParameter("closedtot");
totaltc=request.getParameter("totaltc");




 control_reallocation=request.getParameter("control_relct");
 tranporter_realct=request.getParameter("transporter");
 tcategory_realct=request.getParameter("tcategory_realct");

 
  
 
transporter=request.getParameter("owner"); 
if(transporter==null){
	
	transporter="All1";
}

if(tranporter_realct!=null)
{
	 
	 transporter=tranporter_realct;	
	 
	 if(tcategory_realct.equalsIgnoreCase("ToCheck"))
	 {
		 chk=tcategory_realct;
	 	
	 }else if(tcategory_realct.equalsIgnoreCase("stage1ticket"))
	 {
		 stg1=tcategory_realct;
	 	
	 	
	 }else if(tcategory_realct.equalsIgnoreCase("stage2ticket"))
	 {
	 	
		 stg2=tcategory_realct;
	 	
	 }
	 else if(tcategory_realct.equalsIgnoreCase("stage3ticket"))
	 {
	 	
		 stg3=tcategory_realct;
	 	
	 }
	 else if(tcategory_realct.equalsIgnoreCase("stage4ticket"))
	 {
	 	
		 stg4=tcategory_realct;
	 	
	 }else{
	 	
	 	
	 	
	 }
	 
}

System.out.println(">>>>>>chk >>>>>>>>>>"+chk);
System.out.println(">>>>>>stg1 >>>>>>>>>>"+stg1);
System.out.println(">>>>>>stg2 >>>>>>>>>>"+stg2);
System.out.println(">>>>>>stg3 >>>>>>>>>>"+stg3);
System.out.println(">>>>>>stg4 >>>>>>>>>>"+stg4);

System.out.println(">>>>>>control_reallocation >>>>>>>>>>"+control_reallocation);
System.out.println(">>>>>>tranporter_realct >>>>>>>>>>"+tranporter_realct);
System.out.println(">>>>>>tcategory_realct >>>>>>>>>>"+tcategory_realct);

System.out.println(">>>>>>transporter >>>>>>>>>>"+transporter);
System.out.println(">>>>>>chk >>>>>>>>>>"+chk);
System.out.println(">>>>>>opentct >>>>>>>>>>"+opentct);


	java.util.Date defoultdate = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
	miliseconds=miliseconds-1000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	today = formatter.format(defoultdate);
	Svehlist="(0";
  	username=session.getAttribute("username").toString();
  	String userrole1=session.getAttribute("userrole").toString();
  	
  	
  	
  	System.out.println(">>>>>>username >>>>>>>>>>"+username);
	System.out.println(">>>>>>userrole1 >>>>>>>>>>"+userrole1);

  	String checkbox="",chk1="";
  	
  	chk1 =request.getParameter("chk1");
  	
  	System.out.println(">>>>>>check BOXX VALUE@@@@@@@@ >>>>>>>>>>"+chk1);
  	
        
  	 String check="",stg11="",stg22="",stg33="",stg44="",open1="",total="",sqlcnt="",sqlcnt1="",sqlcnt2="",sqlcnt3="",sqlcnt4="",sqlcnt5="",sqlcnt6="",sqlcnt7="",sqlcnt8;
  	 String  closetotal="";
  	 //int sd=1;
    int open =0,close =0;
    int opent=0;
  	
    
    try{
    	
    	String dlt="delete from db_gps.t_vehicledetailscopy ";
    	stvhdt.executeUpdate(dlt);
    	System.out.println(">>>dlt<<<"+dlt);
    	
    	String insrt="insert into  db_gps.t_vehicledetailscopy(select * from db_gps.t_vehicledetails)  ";
    	stvhdt1.executeUpdate(insrt);
    	System.out.println(">>>insrt<<<"+insrt);
    	
    	}catch(Exception e33)
    	{
    		System.out.println(">>>Exception e33<<<"+e33);
    	}
    
    
    
    if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
    {	 
  		sqlcnt="select count(*) as cnt  from db_gps.t_livetickettest  where status = 'Open' group by tcategory ";
  	
    }else{
    	
    	sqlcnt="select count(*) as cnt  from db_gps.t_livetickettest  where status = 'Open' and vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) group by tcategory ";
    	
    	
    }
  	
  	
  	
  	ResultSet rs111=cnt1.executeQuery(sqlcnt);
  	
  	System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>>>>>"+sqlcnt);
  	
  	 if(rs111.next())
  	 {
  		
  		//sd =rs111.getcnt(1);
  		 stg11=rs111.getString("cnt");
  		
  	 }
  	//System.out.println(">>>>>>check >>>"+check);
  	 if(rs111.next())
  	 {
  		 
  		stg22=rs111.getString("cnt");
  		 
  	 }
  	 
  	//System.out.println(">>>>>>stg11 >>>"+stg11);
  	 
  	if(rs111.next())
 	 {
 		 
  		stg33=rs111.getString("cnt");
 		 
 	 }
  	if(rs111.next())
	 {
		 
  		stg44=rs111.getString("cnt");
		 
	 }
   
  	if(rs111.next())
	 {
		 
  		check=rs111.getString("cnt");
		 
	 }
  	
  	
  	
  	
  	System.out.println(">>>>>>check >>>"+check);

  	System.out.println(">>>>>>stg11 >>>"+stg11);

  	System.out.println(">>>>>>stg22 >>"+stg22);

  	System.out.println(">>>>>>stg33 >>"+stg33);

  	System.out.println(">>>>>>stg44 >>"+stg44);
  	
	System.out.println(">>>>>>closedtot >>"+closedtot);
  
  	

    if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
    {
  	sqlcnt5="select count(*) as cnt5  from db_gps.t_ticketmastertest where  status in ('AutoClosed','Closed') ";
  	
    }else{
    	
    	
    	sqlcnt5="select count(*) as cnt5  from db_gps.t_ticketmastertest where  status in ('AutoClosed','Closed') and vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) ";
    	
    }
  	
  	ResultSet rs155=cnt6.executeQuery(sqlcnt5);
  	
  	System.out.println(">>>>>>sqlcnt5 >>"+sqlcnt5);
  	
  	 if(rs155.next())
  	 {
  		open=rs155.getInt("cnt5");
  		 
  		 
  	 }
  	
  	 
  		
  	
  	
  	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
    {
  	sqlcnt6="select count(*) as cnt5  from db_gps.t_livetickettest  where status ='open' ";
	
    }else{
    	
    	sqlcnt6="select count(*) as cnt5  from db_gps.t_livetickettest  where status ='open'  and vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) ";
    	
    	
    }
  	
  	
  	ResultSet rs150=cnttot12.executeQuery(sqlcnt6);
	
	
	if(rs150.next())
	 {
		open1=rs150.getString("cnt5");
		 
		 
	 }
int	open11=Integer.parseInt(open1); 
      
int tot=0;
tot=open+open11;

  	  	

	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
{
        sqlcnt4="select count(tcategory) as cnt7  from db_gps.t_ticketmastertest  ";
  	
}else{
	
    sqlcnt4="select count(tcategory) as cnt7  from db_gps.t_ticketmastertest    where  vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) ";
	
}
  	  	
  	  	ResultSet rs158=cnt8.executeQuery(sqlcnt4);
  	 if(rs158.next())
  	 {
  		total=rs158.getString("cnt7");
  		 
  		 
  	 }
  	 
  	System.out.println(">>>>>>open >>"+open);
	System.out.println(">>>>>>close >>"+close);
	System.out.println(">>>>>>open1 >>"+open1);
  	// opent =open+close;
  	 
  	 
  	/**
  	 System.out.println(">>>>>>close >>>>>>>>>>"+close1);
  	 
  	System.out.println(">>>>>>status >>>>>>>>>>"+status);
  	System.out.println(">>>>>>check >>>>>>>>>>"+chk);
  	System.out.println(">>>>>>stg1 >>>>>>>>>>"+stg1);
  	System.out.println(">>>>>>stg2 >>>>>>>>>>"+stg2);
  	System.out.println(">>>>>>stg3 >>>>>>>>>>"+stg3);
  	System.out.println(">>>>>>sql >>>>>>>>>>"+sqlcnt3+sqlcnt+sqlcnt1+sqlcnt2+sqlcnt4);
  
  **/
  	 
  	 
  	 
  	 

%>

<table  width="750px">
	<tr>
	
	<td>
			<font color="maroon" ><b>Counts :&nbsp;</b></font>&nbsp; 
				
			
			<b> Open:</b>&nbsp; 
			
			<a href="liveticket.jsp?owner=<%=t11%>&opened=<%=t1 %>" "><blink><%=open1 %></blink></a>&nbsp;
			<b> Close:</b>&nbsp; 
			
			<a href="liveticket.jsp?owner=<%=t22%>&closedtot=<%=t2 %>" "><blink><%=open %></blink></a>&nbsp;
			
			<b> Check</b>
			<input type ="text" name ="open" value="<%=check %>" style="width:30px;height:17px; " readonly="readonly">&nbsp; 
			
			<b> Stage1</b>
			<input type ="text" name ="open" value="<%=stg11 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; 
			
			<b> Stage2</b>
			<input type ="text" name ="open" value="<%=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; 
			
			
			&nbsp;
			<b> Stage3</b>
			<input type ="text" name ="open" value="<%=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> 
			
			<b> Stage4</b>
			<input type ="text" name ="open" value="<%=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; 
			
			<b> Total:</b>&nbsp;
			<a href="liveticket.jsp?owner=<%=t33%>&totaltc=<%=t3 %>" "><blink><%=tot %></blink></a>&nbsp;
			</td>
			</tr>
	
	
	</table>
	<br>
 <table border="0" width="850px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			
			
			
			
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Live Ticket Report. </font></td></tr>
			</table>
		</td>
	</tr>
</table>
   
           
<form name="fullfleet" id="fullfleet" method="get" action="" onsubmit=" " >
      <table border="0" width="850px" bgcolor="#77D7D4" align="center">
		<tr >
			
		<td width="500"  id="chklength"  > 
				
					
					
				
				<!-- <input type="radio" name="chk" id ="chk" class="element radio" value="ToCheck"  > -->
				<input type="radio" name="chk"  id ="chk" value="ToCheck" checked/>
				 <font color="black" size="2" >To check</font>
												   	
				<input type="radio" name="chk" id ="stg1"  value="Stage1Ticket" 
				/><font color="black" size="2">Stage 1</font>	
				<input type="radio" name="chk" id ="stg2"   value="Stage2Ticket" 
				 /> <font color="black" size="2">Stage 2</font>	
				 <input type="radio" name="chk" id ="stg3"  value="Stage3Ticket" 
				 /> <font color="black" size="2">Stage 3 </font>
				 <input type="radio" name="chk" id ="stg4"  value="Stage4Ticket" 
				 /> <font color="black" size="2">Stage 4 </font>
				 				 
			</td>
			</tr>
						
						
			

		<tr id="uid">
	        <td>
	 					<font color="maroon" ><b>Transporter :&nbsp;&nbsp;</b></font>
	 				</td>
	 				<td align="left">
						<select name="owner" id="owner">
        					<option value="All"> All </option>
<%
						
String sql="";
                                                     if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
                                                     {	 
                                       sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter  order by TypeValue";
                                                     }else{
                                       
                                       sql="select Distinct(TypeValue) as Transporter from db_gps.t_transporter where typevalue in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')  order by TypeValue";
                                                     }
                                       
                                                     
                                                     
                                       ResultSet rs=st1.executeQuery(sql);
							System.out.println(">>>>>>>111111"+sql);
							while(rs.next()){
								try{
								//System.out.println(">>>>>>>transporter>>>"+transporter);  
								//System.out.println(transporter.equalsIgnoreCase(rs.getString("Transporter")));  
								if(transporter==rs.getString("Transporter") || transporter.equalsIgnoreCase(rs.getString("Transporter"))){
                                    	 //  System.out.println(">IF LOOP>>>>");
%>
							<option value="<%=rs.getString("Transporter")%>" selected="selected"><%=rs.getString("Transporter")%></option>
<%
                                       }else{
                                    	   //System.out.println(">ELSE LOOP>>>>");
                                   %> 	   
                                    	   
                                  <option value="<%=rs.getString("Transporter")%>" ><%=rs.getString("Transporter")%></option>  	   
                                    <%   }
								}catch(Exception e){
								e.printStackTrace();	
									
								}
							}	
%>
						</select>
</td>
	  
	  <td align="center">
					<input type="submit" name="submit" id="submit" value="submit" onclick="birt()" />
				</td>
	   </tr>
	   
	</table>
	<br/>
	
	<br/>
	<script type="text/javascript">
  //checkboxvalues(this);

</script>
<%
if(chk!=null)
{%>
	<script language="javascript">

    document.getElementById("chk").checked=true;
	
	</script>
	
<%}
%>
<%
if(stg1!=null)
{%>
	<script language="javascript">

    document.getElementById("stg1").checked=true;
	
	</script>
	
<%}
%>
<%
if(stg2!=null)
{%>
	<script language="javascript">

    document.getElementById("stg2").checked=true;
	
	</script>
	
<%}
%>

<%
if(stg3!=null)
{%>
	<script language="javascript">

    document.getElementById("stg3").checked=true;
	
	</script>
	
<%}
%>

<%
if(stg4!=null)
{%>
	<script language="javascript">

    document.getElementById("stg4").checked=true;
	
	</script>
	
<%}
%>


</form>

<!-- <form name="fullfleet1"  method="post" action="" onsubmit="return validate();" > -->
<%
System.out.println(">>>>>>>33333");


String  sqltt="",sqltt1="",sqltt2="",sqltt3="",sqltt4="",sqltt5="";
String ch="0",stt1="0",stt2="",stt3="",stt4="";



if(stg1!=null)
{
 if(transporter.equalsIgnoreCase("All")){
	 
	 if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
	 {
	 
	  sqltt="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg1+"' and status ='open'";  

	 }else{
		 
		 sqltt="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg1+"' and status ='open' and vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))"; 
	 }
 
 }else{
	  
	 
	 
	  sqltt="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg1+"' and status ='open' AND vehid 	IN ( SELECT vehiclecode FROM db_gps.t_onlinedata WHERE transporter = '"+transporter+"')";
	 
 }
 
 ResultSet rstt = cnttot6.executeQuery(sqltt);
 System.out.println(">>>>>>>COUNT for selected filters >>"+sqltt);  
 
 
 
 if(rstt.next())
  {
	  stt1= rstt.getString("cnt"); 
	  
	  
  }
 
}
 else{
	  
	  stt1="0";
	  
  }
 

if(stg2!=null)
{
 if(transporter.equalsIgnoreCase("All")){
	  
	  
	 if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
	 {
	 sqltt1="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg2+"' and status ='open'";  
	 }else{
		 
		 sqltt1="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg2+"' and status ='open' and vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))";
		 
	 }
 
 }else{
	  
	 
	  
	  sqltt1="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg2+"' and status ='open' AND vehid 	IN ( SELECT vehiclecode FROM db_gps.t_onlinedata WHERE transporter = '"+transporter+"')";
	  
	  
 }
 
 ResultSet rstt1 = cnttot1.executeQuery(sqltt1);
 System.out.println(">>>>>>>COUNT for selected filters >>"+sqltt1);  
 
 
 
 if(rstt1.next())
  {
	  stt2= rstt1.getString("cnt"); 
	  
	  
  }
 
}
 else{
	  
	  stt2="0";
	  
  }
 

if(stg3!=null)
{
 if(transporter.equalsIgnoreCase("All")){
	  
	 if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
	 {
	 sqltt2="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg3+"' and status ='open'";  
	 }else{
		 
		 sqltt2="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg3+"' and status ='open' and vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))";
		 
	 }

}else{
	  
	 
	  
	  sqltt2="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg3+"' and status ='open' AND vehid 	IN ( SELECT vehiclecode FROM db_gps.t_onlinedata WHERE transporter = '"+transporter+"')";
	  
	  
}

ResultSet rstt2 = cnttot2.executeQuery(sqltt2);
 
 
 
 
  if(rstt2.next())
  {
	  stt3= rstt2.getString("cnt"); 
	  
	  
  }
  
}
  else{
	  
	  stt3="0";
	  
  }
  


if(stg4!=null)
{
if(transporter.equalsIgnoreCase("All")){
	  
	
	 if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
	 {
	sqltt3="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg4+"' and status ='open'";  
	 }else{
		 
		 sqltt3="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg4+"' and status ='open'  and vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))";
		 
	 }
 
 }else{
	  
	 
	  
	  sqltt3="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+stg4+"' and status ='open' AND vehid 	IN ( SELECT vehiclecode FROM db_gps.t_onlinedata WHERE transporter = '"+transporter+"')";
	  
	  
 }
 
 ResultSet rstt3 = cnttot3.executeQuery(sqltt3);
  
  
  
  
  
  if(rstt3.next())
  {
	  stt4= rstt3.getString("cnt"); 
	  
	  
  }
}
  else{
	  
	  stt4="0";
	  
  }
  
if(chk!=null)
	
{
if(transporter.equalsIgnoreCase("All")){
	  

	 if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
	 { 
	sqltt4="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+chk+"' and status ='open'";  
	 }else{
		 sqltt4="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+chk+"' and status ='open' and vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) "; 
		 
	 }
 
 }else{
	  
	 
	  
	  sqltt4="SELECT count( tcategory ) AS cnt  FROM db_gps.t_livetickettest WHERE tcategory = '"+chk+"' and status ='open' AND vehid 	IN ( SELECT vehiclecode FROM db_gps.t_onlinedata WHERE transporter = '"+transporter+"')";
	  
	  
 }
 
 ResultSet rstt4 = cnttot4.executeQuery(sqltt4);
  
  
  
  
  
  if(rstt4.next())
  {
	  ch= rstt4.getString("cnt"); 
	  
	  
  }
  
  if(ch!=null){
		 
		 
  }else{
 	 ch="0";
 	 
  }
  
  
}
  
  else{
	  
	  
	  ch="0";
  }
  
 
  
  
  System.out.println(">>>filters >>"+ch+">>st1>>"+stt1+">>st2>>"+stt2+">>st3>>"+stt3+">>>st4>>"+stt4);
  
  if(stg1!=null )
  {
	  %><table border="0" bgcolor="white" width="800px">
		<tr><td>&nbsp;&nbsp;&nbsp;<b>Transporter :&nbsp;</b><%=transporter%></td></tr>
		
		</table><br> <%	  
  }
  if(chk!=null)
  {
	  %><table border="0" bgcolor="white" width="800px">
		<tr><td>&nbsp;&nbsp;&nbsp;<b>Transporter :&nbsp;</b><%=transporter%></td></tr>
		
		</table><br> <%  
  }
  
  
  if(stg2!=null)
  {
	  %><table border="0" bgcolor="white" width="800px">
		<tr><td><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Stage2Ticket</b><font color="red">&nbsp;<%=stg22%> </font>&nbsp;&nbsp;&nbsp;<b>Stage1Ticket :</b><font color="red">&nbsp;<%=stt1%> </font>&nbsp;&nbsp;&nbsp;<b>Stage2Ticket :</b><font color="red">&nbsp;<%=stt2%></font>&nbsp;&nbsp;&nbsp;<b>Stage3Ticket :</b><font color="red">&nbsp;<%=stt3%></font>&nbsp;&nbsp;&nbsp;<b>Stage4Ticket :&nbsp;</b><font color="red"> <%=stt4%></font>&nbsp;&nbsp;&nbsp;<b>Transporter :&nbsp;</b><%=transporter%></td></tr>
		
		</table><br> <%	  
  }
  if(stg3!=null)
  {
	  %><table border="0" bgcolor="white" width="800px">
		<tr><td><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Stage3Ticket</b><font color="red">&nbsp;<%=stg33%> </font>&nbsp;&nbsp;&nbsp;<b>Transporter :&nbsp;</b><%=transporter%></td></tr>
		
		</table><br> <%	  
  }
  if(stg4!=null)
  {
	  %><table border="0" bgcolor="white" width="800px">
		<tr><td><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Stage4Ticket</b><font color="red">&nbsp;<%=stg44%> </font>&nbsp;&nbsp;&nbsp;<b>Transporter :&nbsp;</b><%=transporter%></td></tr>
		
		</table><br> <%	  
  }
  
 
 
 


System.out.println(">>>>>>>4444444"+transporter);
if(transporter.equalsIgnoreCase(null) ||  transporter.equalsIgnoreCase("All1") )
{
	if(chk.equalsIgnoreCase(null))
	{
		
	chk="-";	
		
	}	
	
}else{
	
	

	
	System.out.println(">>>>>>>chk>>>"+chk);
	
	
	
System.out.println(">>>transporter<<<"+transporter);
int limit=0;
Boolean flag=false;
sql1="select Unitlimit from t_transporter where TypeValue='"+transporter+"' ";
ResultSet rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	limit=rs1.getInt(1);
//out.println("limit--"+limit);
}
else
{
	flag=true;
}
int count=0,rem_unit=0;
String str="select count(*) as count from t_vehicledetails where status <> 'Deleted' and OwnerName='"+transporter+"'";
ResultSet rs2=stmt2.executeQuery(str);
if(rs2.next())
{
	count=rs2.getInt("count");
	//out.println("count--"+count);
}
String alert="";
rem_unit=limit-count;
//out.println("rem_unit--"+rem_unit);
//-----------------------------------------------------------------------------------------------
String userrole=session.getAttribute("userrole").toString();
String inserted=request.getParameter("inserted");
if(inserted==null)
{
}
else
{
	String vehno=request.getParameter("vehno");
%>
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="center"> <font color="maroon"> <U> Special Report for <%=vehno%> has been added successfully </U> </font> </td>
		</tr>
	</table>
<%		}
String nocbselected=request.getParameter("nocbselected");
if(nocbselected==null)
{
}
else
{
%>
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td> <div align="center"> <font color="maroon" > No Check-box was selected. Please select the check-box/es.</font> </div> </td>
		</tr>
	</table>
<%	
}
String amcdone=request.getParameter("amcdone");
if(amcdone==null)
{
}
else
{ 
%>
	<table border="0" width="800px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td> <div align="center"> <font color="maroon" > Successfully changed AMC of selected Vehicles.</font> </div> </td>
		</tr>
	</table>
<%	
}
%>

<div id="reportData">
<div align="right">
<table width ="220%" border="0" >
	<tr align="right">
	
<td align="right" bgcolor="#FFFFFF" color="black"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td>
		
		</tr>
		</table>
		</div>	
<%-- <iframe id="myIframe" width="100%" height="850px" src="http://myfleetview.com:8080/birt/frameset?__report=JRM_report.rptdesign&userid=<%=UserID%>&__showtitle=false"> --%> 
<iframe id="myIframe" width="220%" height="850px" src="http://103.241.181.36:8080/ERPTestBirt/frameset?__report=TIC_report.rptdesign&Transporter=<%=transporter %>&Chk=<%=chk %>&Stg1=<%=chk %>&Stg2=<%=chk %>&Stg3=<%=chk %>&Stg4=<%=chk %>&__showtitle=false";> 
</iframe>
</div>
	<%-- <table border="0" width="800px" bgcolor="#E6E6E6" align="center">
<%
	if(rem_unit!=0 && flag==false && count<limit)
	{
%>
		<tr>
			<td align="center" colspan="2"> 
				<center><font color="red" size="2.8"><b><blink><%=rem_unit %> Pending Installation</blink></b></font></center>
			</td>
		</tr>
<%
	} 
%>
		<tr>
			<td align="center" colspan="2"> 
				<center><font color="black" size="3"><b>Vehicle List of <%=transporter %> .</b></font></center>
			</td>
		</tr>
		<tr  bgcolor="#BDBDBD"> 
			   <td>
		    	<a href="#" onClick="window.open ('last10callinfo1.jsp?trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="#2A0A12" size="2"><b>Last 10 Outgoing Calls</b></font></a> &nbsp;&nbsp;
		    	<a href="#" onClick="window.open ('last3disp.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Last 5 Dispatches </b> </font> </a> &nbsp;&nbsp;
				<a href="#" onClick="window.open ('last5recfrmcust.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Last 5 Receivals </b> </font> </a> &nbsp;&nbsp;
				<a href="#" onClick="window.open ('mydiary.jsp?trans=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Veh Avail </b> </font> </a>&nbsp;&nbsp;
				<a href="#" onClick="window.open ('PendingUnits.jsp?holdername=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Unit/s Pending </b> </font> </a>&nbsp; &nbsp;
				<%
	                String typevalue1=session.getAttribute("typevalue").toString();
	                if(typevalue1.equals("transporter"))
	               {
	            %>
				
				
                <% } 
	                
	               else{
                %>
                    <a href="#" onClick="window.open ('addcontact.jsp?transporter=<%=transporter%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Transporter Contact</b> </font> </a>&nbsp; &nbsp;                       						
				<%     } 
				
				if(rem_unit!=0 && count<limit && rem_unit>0)
				{  %>
				    <a href="#" onClick="window.open ('addunit.jsp?transporter=<%=transporter%>&limit=<%=limit%>&count=<%=count%>','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"> <font color="#2A0A12" size="2"><b> Add Unit</b> </font> </a>
				<%}
				else
				   { %>
				
				<% } %>
			</td>
		</tr>
</table> --%>
<br></br>
<%-- <table border="0" width="800px" bgcolor="#E6E6E6" align="center">
<tr>
	<th><b>Sr.</b></th>
	<th><b>Contact Name</b></th>
	<th><b>Phone</b></th>
	<th><b>Mobile</b></th>
	<th><b>Designation</b></th>
	<th><b>Department</b></th>
	<th><b>Email</b></th>
	<th><b>Location</b></th>
	<th><b>Comment</b></th>
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{ 
%>
	<th>Edit</th>
<%	
}
%>
</tr>
<%
sql1="select * from db_CustomerComplaints.t_recieverinfo where Transporter='"+transporter+"' and ActiveStatus='Yes' ";
ResultSet rst2=st.executeQuery(sql1);
int a=1;
while(rst2.next())
{
	String rname=rst2.getString("RecieverName");
%>
<tr bgcolor="#BDBDBD">
	<td><%=a%></td>
	<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst2.getString("RecieverName")%>&trans=<%=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b><%=rst2.getString("RecieverName")%></b></a></td>
	<td><%=rst2.getString("Phone")%></td>
	<td><%=rst2.getString("Mobile")%></td>
	<td><%=rst2.getString("designation")%></td>
	<td><%=rst2.getString("department")%></td>
	<td><a href="mailto:<%=rst2.getString("Email")%>?subject=Vehicle%20Complaints%20"><b><%=rst2.getString("Email")%></b></a></td>
	<td><%=rst2.getString("PlaceName")%></td>
	
	<td><a href="javascript: flase" onClick="window.open ('addcall1.jsp?reciever=<%=rname%>&trans=<%=transporter%>&loct=<%=rst2.getString("PlaceName")%>&mob=<%=rst2.getString("Mobile") %>&designation=<%=rst2.getString("designation") %>&check=<%=chk %>&stage1=<%=stg1 %>&stage2=<%=stg2 %>&stage3=<%=stg3 %>&stage4=<%=stg4 %> ', 'win1', ' location=0, menubar=0, scrollbars=yes, status=0, toolbar=0, resizable=0')"><b>Click</b></a></td>
<%
	if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
	{ 
%>
	<td>  
		<a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst2.getString("Rid") %>',
				 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')"><b>Edit</b></a>
	</td>
	<td>  
		<a href="javascript: flase" onClick="window.open ('addvehicletouser.jsp?reciever=<%=rname%>&trans=<%=transporter%>&rid=<%=rst2.getString("Rid") %>',
				 'win1', 'width=670, height=370, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0')"><b>Add/Delete Vehicle</b></a>
	</td>
<%	
	} 
%>
</tr>
<%
a++;
}
%>
</table> --%>
<br></br>

<div id="table1">
<%
String exportFileName="LiveticketReport.xls"; 
%>
<%-- <table border="0" width="800px" bgcolor="#E6E6E6" align="center">
<tr bgcolor="#BDBDBD">
	<td colspan="2"><font color="yellow"><b>UNIT MISSING</b></font></td>
	<td colspan="2"><font color="red"><b>UNIT REMOVED</b></font></td>
	<td colspan="2"><font color="green"><b>UNIT DEACTIVATED</b></font></td>
	<td colspan="2"><font color="blue"><b>SPECIAL COMMENT ON VEHICLE</b></font></td>
</tr>		
<tr>
	<td colspan="10"> 
			<div align="left">
		<font color="Black"><b><i>Note:</i></b>Move your mouse to Complaint Date to check more details</font></div>
		<div style="text-align: right;width: 750px;margin-left: 45em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
				   <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                   <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
                   <a href="liveticketexcel.jsp" style="font-weight: bold; color: black; " onclick="">
                   <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                   <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
                   </div>
				</td>	
</tr>

</table> --%>



 
<div id ="frz "> 
<table border="1" align="center" style="width: auto" class="sortable" cellspacing="0">

			
	<%
	 String typevalue=session.getAttribute("typevalue").toString();
	   if(typevalue.equals("transporter")){
	%>
	<!-- <thead>
	<tr  bgcolor="#BDBDBD">
	
	<td><b>Sr.</b></td>
	<td><b>JRM</b></td>
	<td><b>Ticket</b></td>
	<td><b>Warranty</b></td>
	
	
	
	<td><b>Mains Status</b></td>
	<td><b>Mains StatusTime</b></td>
	<td><b>Contact person</b></td>
	<td><b>Vehicle No</b></td>
	<td><b>Employee Name</b></td>
	
	<td><b>Owner Name</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<td><b>Veh Available Date</b> </td>
	<td><b>UnitID</b></td>
	<td><b>MobileNo</b></td>
	<td><b>SimNo</b></td>
	<td><b>Peripheral</b></td>
	<td><b>Sim Comp</b></td>
	
	<td><b>Inst On</b></td>
	<td><b>Inst Location</b></td>
	
	
	<td><b>Ticket ID</b></td>
	
	<td><b>Last Rep. Date</b></td>    
	<td><b>Replacement Location</b></td>    
	<td><b>Sp. Comments</b></td>
	<td><b>Sp. Comment Desc.</b></td>
	<td><b>Extra Comment</b></td>
	<td><b>Date of Entry</b></td>
	<td><b>Entered By</b></td>
	
	
	
</tr>
</thead> -->
	<%	
	}else{
%>
<%-- <thead>
<tr  bgcolor="#BDBDBD">
<%
		if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
{ 
	%><td><div align="center"> <input type="checkbox" name="maincb" value="maincb" onClick="selectAll();"/></div> </td><%
}
%>
	<td><b>Sr.</b></td>
	<!-- <td><b>JRM</b></td> -->
	<td><b>Ticket</b></td>
	
	<!-- <td><b>Warranty</b></td> -->
	
	
	
	
	
	
	<!-- <td><b>Mains Status</b></td>
	<td><b>Mains StatusTime</b></td>
	<td><b>Contact person</b></td> -->
	<td><b>Vehicle No</b></td>
	<td><b>Employee Name</b></td>
	<td><b>Owner Name</b></td>
	<td><b>Updated</b></td>
	<td><b>Location</b></td>
	<!-- <td><b>Veh Available Date</b> </td> -->
	<td><b>UnitID</b></td>
	<!-- <td><b>MobileNo</b></td> -->
	<!-- <td><b>SimNo</b></td>
	
	<td><b>Tx.Intrval<br>(Min)</b></td>
	<td><b>St.Intrval<br>(Min)</b></td>
	
	
	<td><b>CodeVersion</b></td>
	
	<td><b>WMSN</b></td>
	
	<td><b>Tx.Type</b></td>
	
	<td><b>Peripheral</b></td>
	<td><b>Unit Type</b></td>
	<td><b>Sim Comp</b></td>
	
	<td><b>PS No</b></td>
	<td><b>PCB No</b></td>
	<td><b>Box No</b></td>
	<td><b>Battery No</b></td>
	
	
	<td><b>GPName</b></td>                                                                    
	<td><b>Inst On</b></td>
	<td><b>Inst Location</b></td>
	
	<td><b>Ticket ID</b></td>
	
	
	
	<td><b>Last Rep. Date</b></td>    
	<td><b>Replacement Location</b></td>    
	<td><b>Sp. Comments</b></td>
	<td><b>Sp. Comment Desc.</b></td>
	<td><b>Extra Comment</b></td>
	<td><b>Date of Entry</b></td>
	<td><b>Entered By</b></td> -->
	
	
</tr>
</thead> --%>
<%-- <%
	}
try
{
	int i=1, j=0;
	String instdte="-";
	String instdte1="", vhno="";
	Double lat, lon;
	
	Double lat2, lon2; 
	String direction;
	String loc11;
	String msg1="";
	String grp="",insLocation, insdt, insdt1;
	String tctegory ="",tctmsg="No Ticket";
	String tid="";
	String us=username.toUpperCase();
	//System.out.println("transporter--->"+transporter);
	if(transporter.equalsIgnoreCase("Topsline") || transporter.equalsIgnoreCase("HPCL") || transporter.equalsIgnoreCase("Ujjain") )
	{
		System.out.println(">>>@@@@####IF OPTION OF HPCL <<<<<@@@@####");
		int l=0;
		String simno1="-", mobno1="-", peripherals1="-", simcomp1="-",psno1="-",pcbno1="-",boxno1="-",batteryno1="-";
		String drivername="",vehid="";
		int delaydays1=0;
		int amc1=0;
		String sqltuh="select * from db_gps.t_onlinedataotherservers where Transporter like '"+transporter+"' order by TheDate desc";
		//System.out.println(sqltuh);
		ResultSet rsttuh=st4.executeQuery(sqltuh);
		if(rsttuh.next())
		{
			String sqlbt="select * from db_gps.t_onlinedata where Transporter like '"+transporter+"' order by TheDate desc";
			ResultSet battr=st.executeQuery(sql1);
			System.out.println(">>>sqlbt>>>>*******"+sqlbt);
		
			if(battr.next())
			{
				
				battrystatus =battr.getString("bcharging");
				battrystatustime =battr.getString("bdatetime");	
				
			}
		
			
			
			
			vhno=rsttuh.getString("VehicleRegNo");
			vehid=rsttuh.getString("VehicleCode");
		}	
			
			String sqltct="select * from db_gps.t_livetickettest where vehid = '"+vehid+"'  and tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') ";
			ResultSet tct=stwar3.executeQuery(sqltct);
			System.out.println(">>>sqlbt>>*********check query first loop*^^^^^>>*******"+sqltct);
			while(tct.next())
			{
				
				tctegory = 	tct.getString("tcategory");
				tid = 	tct.getString("tid");
			if(tctegory=="-" || tctegory.equalsIgnoreCase("-") || tctegory.contains("-"))	
			{	
				System.out.println(">>>IF LOOP OF CATEGORY>>>>*******");
			
			}else{	
			
			String upddate1=rsttuh.getString("TheDate");
			String bg2="";
			
			if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg2="#FFA500";
			}
			
			
			
			insdt=rsttuh.getString("InstDate");
		//	insLocation=rsttuh.getString("insLocation");
			String war;			
//******************************************For Getting Location******************************************				
//********************************************************************************************************				
		lat=rsttuh.getDouble("LatitudePosition");
		lon=rsttuh.getDouble("LongitudePosition");
		
		String sqlloc="SELECT city,lat,lon,((ACOS(SIN('"+lat+"' * PI() / 180) * SIN(lat * PI() / 180) + COS('"+lat+"' * PI() / 180) * COS(lat * PI() / 180) * COS(('"+lon+"' - lon) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) AS distance FROM t_citylatlong order by  distance ASC limit 1";
		ResultSet rsloc=st2.executeQuery(sqlloc);
		if(rsloc.next())
		{ 
			String dst=""+rsloc.getDouble("distance");
			lat2=rsloc.getDouble("lat");
			lon2=rsloc.getDouble("lon");
			System.out.println(">>>>>latitude>>>>>>>"+lat2);
			if(dst.length() >5)
			{
				dst=dst.substring(0,4);
			}
			double dist1=Double.parseDouble(dst);
			if(lat2 >lat)
			{
				direction="S";
			}
			else
			{
				direction="N";
			}
			if(lon2 > lon)
			{
				direction=direction+"E of";
			}
			else
			{
				direction=direction+"W of";
			}
			loc11=""+dist1+" kms "+direction+" "+rsloc.getString("city");
		}
		else
		{
			loc11="-";
		}

		//System.out.println(">>>>>latitude>>>>>>>"+lat2);
		
		
//******************************************End of Getting Location******************************************

//*************************************For Printing MSG With Location******************************************

	sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+rsttuh.getString("TheDate")+"') as days";
	ResultSet rsdate=st11.executeQuery(sql8);
	if(rsdate.next())
	{
			delaydays1=rsdate.getInt("days");
			if(delaydays1>7)
			{
				msg1="Device Disconnected";					
			}
	}

	String nogpschk="";
	try{
		nogpschk=loc11.substring(0,11);
	} catch(Exception e)
	{
		nogpschk=loc11;
	}
	if(nogpschk.equals("No GPS Data"))
	{
		msg1=msg1+" No GPS Data";
	}
/*		String VehicleCode=rsttuh.getString("VehicleCode");
	if(VehicleCode!=null||VehicleCode!=""){
	String driver="SELECT  "+ 
	"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
    "		( " +
    "			SELECT vehid, startdate" +
    "			FROM t_startedjourney " +
    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
    "			" +
    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
	System.out.println(driver);
	
	ResultSet driver1=st11.executeQuery(driver);
	if(driver1.next()){
		drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
	}
	}*/
	sql8="select status,Empname,Ownername,Instruction from db_gps.t_vehicledetails where vehiclecode='"+rsttuh.getString("VehicleCode")+"'";
	//System.out.println("sql8------>"+sql8);
	ResultSet rstrem=st2.executeQuery(sql8);
	if(rstrem.next())
	{
		Empname=rstrem.getString("Empname");
		OwnerName=rstrem.getString("Ownername");
		Instruction=rstrem.getString("Instruction");
		// System.out.println("status--->"+rstrem.getString("Status"));
		 if(rstrem.getString("Status").equals("Removed"))
		{
			bg2="red";
		}
		if(rstrem.getString("Status").equals("Missing"))
		{
			bg2="yellow";
		}
		if(rstrem.getString("Status").equals("DeActivated"))
		{
			bg2="lightgreen";
		}
		
	}

%> --%>

<%-- <% //---------------------------------------------%>
	<%-- <tbody>
	<tr bgcolor='<%=bg2%>'>
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
{ 
%>
		<td> 
			<div align="center"> <input type="checkbox" name="cb1<%=j%>" id="cb1<%=j%>"  value="cb<%=j%>"> </input> </div> 
		</td>
<%	
}
%>
		<td><div align="right"><%=i%></div><input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=rsttuh.getString("VehicleRegNo")%>" />
		<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=rsttuh.getString("UnitID")%>" /></td> 
		<td align="left"><%=Instruction%></td>
		
		
		<td> <div align="left"><font color=""><%if(tctegory.equalsIgnoreCase("-") || tctegory=="-") { %> <%=tctmsg %><%}else{ %> <%=tctegory %><%} %>	</font> </div> </td>
		
<!--		<td align="left">< %=tid %>-->
		<td align="left"><%=warranty%></td>
		
		<td align="left"><%=battrystatus %>
		<td> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
	
		
		<td width="100px" align="left"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><%=vhno%></b></a>
		<br/>	
			<div class="popup" id="popup<%=i%>">
				<table border="0" >
					<tr>
						<td>
							<a href="addcomplaint.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a>
						</td>
					</tr>
					<tr><td><a href="inspection.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
			   <!-- <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>
					<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr> -->
<%

if(typevalue.equals("transporter")){
%>
 <tr>
	<td>
		<a href="repunit.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
	</td>
</tr>
<tr>
	<td>
		<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=vhno%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a>
	</td>
</tr>
<tr>
	<td> 
		<a href="techspcomment.jsp?transporter=<%=transporter%>&vid=<%=vehid%>&vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
	</td>
</tr>
<tr>


</tr>
<%
}else{

if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
					{  
%>
					<tr>
						<td>
							<a href="repunit1.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
						</td>
					</tr>
<%
					}else{ 
%>
					<tr>
						<td>
							<a href="repunit.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
						</td>
					</tr>
					<tr>
						<td> 
							<a href="remuittemp.jsp?veh=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>"> Temp Removal </a> 
						</td>
					</tr>
<%
					} 
%>
					<tr>
						<td>
							<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vhno%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a>
						</td>
					</tr>
<%
					if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
					{  
%>	 
					<tr>
						<td>
							<a href="editrecs.jsp?vid=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a>
						</td>
					</tr>

					
<%
					}  
					if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
					{  
%>
					<tr>
						<td>
							<a href="removeunits.jsp?veh=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a>
						</td>
					</tr>
					<tr>
						<td>  
							<a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=vhno%>&vehregno=<%=vhno %>&unitid=<%=rsttuh.getString("UnitID")%>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> 
						</td>
					</tr>
<%
					}
%>  
					<tr>
						<td>
							 <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vhno%>&vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID")%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> 
						</td>
					</tr>
					<tr>
							<td> <a href="sendmail.jsp?vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=rsttuh.getString("UnitID")%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
					</tr>
					<tr>
						<td> 
							<a href="techspcomment.jsp?transporter=<%=transporter%>&vid=<%=vehid%>&vehno=<%=vhno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
						</td>
					</tr>
					<%
						if(SUPERADMIN.equalsIgnoreCase(userrole)){
						%>
						<tr>
							<td> <a href="reportincident.jsp?vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID")%>&transp=<%=transporter%>&GPName=<%=grp%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
						</tr>
						<%
						}}
					%> --%> 
					<%-- <tr>
						<td>
							<a href="javascript:toggleDetails(<%=i%>,false);">Close</a>
						</td>
					</tr>
				</table>
			</div>
		</td>
<!-- ----------------------------------------------------------------------------------------- -->		
		 <td align="left"><%=Empname %></td>
		 <td align="left"><%=OwnerName %></td>
		<td align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rsttuh.getString("TheDate"))) %><br><%=rsttuh.getString("TheTime") %></br></td>
		<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=rsttuh.getDouble("LatitudePosition") %>&long=<%=rsttuh.getDouble("LongitudePosition")%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=loc11 %> </font> </b> </a> <font color="red"><%=msg1 %></font></td>
		
		
		 
<%
		
              System.out.println("messege1>>>>>>>>>"+msg1);
        sql5="select * from t_unitmaster where UnitID='"+rsttuh.getString("UnitID")+"'";
		ResultSet rs5=st5.executeQuery(sql5);
		if(rs5.next())
		{	
			try{
					mobno1=rs5.getString("MobNo");
					simno1=rs5.getString("SimNo");
					typeunit=rs5.getString("InstType");
					simcomp1=rs5.getString("SimCompany");
					peripherals1=rs5.getString("Peripherals");
					psno1=rs5.getString("PSNo");
					pcbno1=rs5.getString("PCBNo");
					boxno1=rs5.getString("BoxNo");
					batteryno1=rs5.getString("BatteryNo");
				}catch(Exception e)
				{
					mobno1="-";
					simno1="-";
					simcomp1="-";
					typeunit="-";
					peripherals1="-";
				}
		}
		else
		{
			mobno1="-";
			simno1="-";
			simcomp1="-";
			typeunit="-";
			peripherals1="-";
		}
		String b="NA",stmin="NA";
		String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+rsttuh.getString("UnitID")+"'";
		// System.out.println(sqlFTP);
		ResultSet rsFTP=st5.executeQuery(sqlFTP);
		if(rsFTP.next()){
			WMSN=rsFTP.getString("WMSN");
			int TXInterval=0,StInterval=0;
			if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
				
			}else{
			TXInterval=rsFTP.getInt("TXInterval");
			}
			if(rsFTP.getString("StInterval").equalsIgnoreCase("-")){
				
			}else{
			StInterval=rsFTP.getInt("StInterval");
			}
			CodeVersion=rsFTP.getString("CodeVersion");
			UnitType=rsFTP.getString("UnitType");
			if(CodeVersion.contains("AVL_LITE")){
				int aa=(TXInterval*500)/1000;
				int aSX=(StInterval*500)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
			//	System.out.println("b====>"+b);
			}else{
				int aa=(TXInterval*100)/1000;
				int aSX=(StInterval*100)/1000;
				int bTemp=aa/60;
				int stminTemp=aSX/60;
				b=bTemp+"";
				stmin=stminTemp+"";
			//	System.out.println("b====>"+b);
			}
		}
		String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="";
		sql="select * from db_CustomerComplaints.t_complaints1 where VehicleNo='"+vhno.trim()+"' and Status <> 'Solved' ";
		ResultSet rscomp=st.executeQuery(sql);
		if(rscomp.next())
		{
			compdate=rscomp.getString("TdyDate");
			attloc=rscomp.getString("VehAttLoc");
			availdate=rscomp.getString("VehAvailDate");
			allocatedto=rscomp.getString("Status");
			desc=rscomp.getString("Complaint");
			contpers=rscomp.getString("ContDets");
			entby=rscomp.getString("RegBy");
			if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
			{
				sql="select * from t_callocation1 where Tno='"+rscomp.getString("Tno")+"' ";
				ResultSet rsallocto=st01.executeQuery(sql);
				if(rsallocto.next())
				{
					allocatedto=rsallocto.getString("Technicion");
				}
				else
				{
					allocatedto="Unallocated";
				}
		
			}
%>
		<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>',this);return false" onMouseOut="ajax_hideTooltip();"> <b> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(compdate))%> </b></td>
	   				
<%		
		}
		else
		{ 
%>
		<td> No Complaint</td>		
<%	
		}
%>
		<td align="right"><%=rsttuh.getString("UnitID") %></td>
		<td align="right"><%=mobno1%></td>
		<td align="right"><%=simno1%></td>
		<td align="right"><%=b%></td>
		<td align="right"><%=stmin%></td>
		<td align="left"><%=CodeVersion%></td>
		<td align="right"><%=WMSN%></td>
		<td align="left"><%=UnitType%></td>
		<td align="left"><%=peripherals1%></td>
		<%
		 if(typevalue.equals("transporter")){
			 
		 }else{
		%>
		<td align="left"><%=typeunit %></td>
		<%
		 }
		%>
		<td align="left"><%=simcomp1%></td>
		<%
		 if(typevalue.equals("transporter")){
			 
		 }else{
		%>
		<td align="right"><%=psno1%></td>
		<td align="right"><%=pcbno1%></td>
		<td align="right"><%=boxno1%></td>
		<td align="right"><%=batteryno1%></td>
<%		
		 }	//********************************************For Getting Group***********************************
		String sqlgrp="select * from t_group where VehRegno='"+vhno+"'";
		//out.print(sql6);
		ResultSet rsgrp=st6.executeQuery(sqlgrp);
		if(rsgrp.next())
		{
			try{
					grp=rsgrp.getString("GPName");
				}
				catch(Exception X)
				{
					grp="None";
				}
		}
		else
		{
			grp="None";
		}
/******************column added for inst location by sujata***************************/
		String unitid1=rsttuh.getString("UnitID");
		//System.out.println("unitid1-----?>>"+unitid1);
		String sql23="select * from db_gps.t_vehicledetails where UnitID='"+unitid1+"'";
		ResultSet rs23=st23.executeQuery(sql23);
		if(rs23.next())
		{
			InstalledPlace=rs23.getString("InstalledPlace");
		}else
		{
			InstalledPlace="N.A";
		}
//end of changes
//*******************************************Fro POPUP Men************************************
		if(typevalue.equals("transporter")){
			 
		 }else{
%>
		<td align="left"><%=grp %></td>
		<%
		 }
		%>
		<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(insdt))%></td>
		<td align="left"><%=InstalledPlace%></td>
<%
		sql4="select * from t_onlinedataotherservers where VehicleRegNo='"+vhno+"' ";
		ResultSet rs4=stwar1.executeQuery(sql4);
		if(rs4.next())
		{
			//unitid=rs4.getString("UnitID");
			//vehregno=rs4.getString("VehicleRegNo");
			try{
				instdte=rs4.getString("InstDate");
				}
			catch(Exception X)
			{
				instdte="-";
			}
		sqlamc="select * from t_amchistory where VehNo = '"+vhno+"' order by NewDate desc limit 1";
		ResultSet rsamcc=stwar2.executeQuery(sqlamc);
		System.out.println(">>>2222 >>>>AMACHI HISTORY>>>>>>%% sqlamc 11"+sqlamc);
		if(rsamcc.next())
		{
			if(!(null==rsamcc.getDate("WarrantyTill")))
			{
			try{	
				sqlamc1="select TO_DAYS('"+rsamcc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
				ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
				System.out.println(">>>2222 >>>>>>>%% sqlamc1 11"+sqlamc1);
				if(rsamcc1.next())
				{
					if(rsamcc1.getInt("days") > 0)
					{
						warranty="Yes";
					}
					else
					{
						warranty="No";
					}
				}
				}
				catch(Exception X)
				{
					warranty="-";
				}
			}
			else
			{
				sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt+"') as days";
				ResultSet rst222=stwar3.executeQuery(sql4);
				System.out.println(">>>2222   %%%%%% sql4 11"+sql4);
				if(rst222.next())
				{
					if(rst222.getInt("days") > 365)
						{
							warranty="NO";
						}
					else
					{
						warranty="YES";
					}
				}
			}
		}
		else
		{
		//out.println("Hiiiiiiiiiiiiiiii");
			insdt1=rs4.getString("InstDate");
			sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+insdt1+"') as days";
			ResultSet rst222=stwar4.executeQuery(sql4);
			if(rst222.next())
			{
				if(rst222.getInt("days") > 365)
				{
					warranty="NO";
				}
				else
				{
					warranty="YES";
				}
			}
		}
	}
%> --%>
		
		
		
		<%-- <td align="left"><%=tid %>
		
		
		<td>
<%			//---------- Last replacement date
			//column added for replacement place
			String d1="N.A";
			InstPlace="N.A";
		  	sql="select * from t_unitreplacement where VehRegNo='"+vhno+"' and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
			ResultSet rsgett=st6.executeQuery(sql);
			if(rsgett.next())
			{
				
				InstPlace=rsgett.getString("InstPlace");
				 d1=rsgett.getString("InstDate");
				if(d1=="0000-00-00"||d1=="-")
				{
					out.print(d1);
				}
				else
				{
					String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
					out.print(d2);
				}
			}
			else
			{
				out.print(d1);
			}
%>
		</td>
		<td align="left"><%=InstPlace %></td>
<%
			int spcnt=0,spcnt1=0,k=0;
			String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
			String unitid=rsttuh.getString("UnitID");
			String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+vhno+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc";
			//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
			ResultSet rssp1=stmtsp1.executeQuery(sqlsp1);
			while(rssp1.next())
			{
				spcnt++;
				//System.out.println(spcnt);
				// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------
				String cmntype=rssp1.getString("cmmt_type");
				if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
				{
					spcmmnt=rssp1.getString("SpComment");
					extracmnt=rssp1.getString("Extra_comment");
					Entrydt=rssp1.getString("EntDateTime");
					Enteredby=rssp1.getString("EntBy");
					k++;
				}
		//---------------------------------------
			}
				/*if(rssp1.next())
				{
					spcnt1=0;
					spcnt1=rssp1.getInt("cnt");
				}
					
			String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vhno+"' and cmmt_type='Vehicle' and Closed='No' ";
			//out.print(sql10);
			ResultSet rs10=st.executeQuery(sql10);
			while(rs10.next())
			{
				spcnt=rs10.getInt("cnt");	
			}
			spcnt=spcnt+spcnt1;*/
%>

		<td align="left"> 
			<a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vhno%>&unitid=<%=rsttuh.getString("UnitID") %>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  
		</td>
  	    <td align="left"><%=spcmmnt %></td>
		<td align="left"><%=extracmnt %></td>
<%				if(!Entrydt.equals("N.A"))
		{
%>
		<td align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </td>
<%
		}else{
%>
		<td align="right"><%=Entrydt %></td>
<%
		} 
%>
		<td align="left"><%=Enteredby %>
			
		
		<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=vhno%>" />
		<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" /></td>
	</tr>
</tbody>
		<%
		i++;
        j++;

			
			}
			}
			

}else
{


System.out.println(">>>>@@###IN ELSE statement<<<<@@######");
String drivername="";
if("All".equalsIgnoreCase(transporter))
{
	if(session.getAttribute("userrole").toString().equals("Group"))
	{
		if(us.equals("CASTROL"))
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and Active='Yes'";
		}
		else
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' ";
		}
	}else
	{
		sql="select *  from db_gps.t_vehicledetails  ";
	}
}else{
if(session.getAttribute("userrole").toString().equals("Group"))
{
	if(us.equals("CASTROL"))
	{
		sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
	}
	else
	{
		sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
	}
}else
{
	sql="select *  from db_gps.t_vehicledetails where OwnerName='"+transporter+"' ";
}

}
ResultSet rst=st1.executeQuery(sql);
	System.out.println(">>>>sql111 else"+sql);
	while(rst.next())
	{
		Svehlist=Svehlist+","+rst.getString("VehicleCode");
	}
	Svehlist=Svehlist+")"; 
//out.print(Svehlist);
       
      
 String Vehcode="",unitid="",group1="", vehregno="",upddate="",time="",loc="";
	String bg="", msg="",VehicleRegNumber="",vhid="";
	int delaydays=0;
	int amc=0;
	Double lat1=0.00,lon1=0.00;
	String sqltct="";
	int p=0;
	String stra="",str1="",str2="",str3="",str4="",str5="",str6="",str7="",str8="",str9="",str10="",newsql="";
	
	
	if("All".equalsIgnoreCase(transporter))
       {
		
		System.out.println(">>>> INSIDE LOOP OF ALL First >>>>.");
		
		
		    if((chk!=null || stg1!=null || stg2!=null || stg3!=null || stg4!=null) && chk1==null)
		    {
		    	
		    	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
		        {
		    	str1=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND";
		        }else{
		        	
		        	 
		        	
		        	str1=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))  AND";
		        	
		        	
		        }
		    	
		    	//str1=str1.concat(str6);
		    	stra =stra.concat(str1);
		    	
		    	
		    }
		    
		    if(chk1!=null)
		    {
		    	
		    	
		    	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
		        {
		    	str2=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND";
		        }else{
		        	str2=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) AND";
		        	
		        }
		    	
		    	
		    	stra =stra.concat(str2);
		    	
		    	
		    	
		    }
		    		        	       
		    
		    
		    if(opened!=null)
		    {
		    	
		    	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
		        {
		    	str3=" status <> 'Autoclosed' AND status <> 'Closed' AND";
		        }else{
		        	
		        	str3=" status <> 'Autoclosed' AND status <> 'Closed' AND vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))  AND";
		        	
		        }
		    	
		    	stra =stra.concat(str3);
		    	
		    	
		    	
		    }
		    
		    if(closedtot!=null)
		    {
		    	
		    	
		    	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
		        {
		    	str4=" status = 'Autoclosed' OR status = 'Closed' AND";
		        }else{
		        	str4=" status = 'Autoclosed' OR status = 'Closed' AND vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))  AND";
		        	
		        }
		    	
		    	stra =stra.concat(str4);
		    	
		    	
		    	
		    }
		    if(totaltc!=null)
		    {
		    	
		    	if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
		        {
		    	str5=" status ='open' OR status ='closed' OR status ='AutoClosed' order by CreationDateTime asc AND";
		        }else{
		        	
		        	str5=" status ='open' OR status ='closed' OR status ='AutoClosed' order by CreationDateTime asc AND vehid in (select vehiclecode from db_gps.t_vehicledetails where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"'))  AND";
		        	
		        }
		    	
		    	stra =stra.concat(str5);
		    	
		    	
		    	
		    }
		
			System.out.println("the concat string is :"+stra); 
		 	
			 
			//System.out.println(stra.substring(stra.lastIndexOf('O')) + 1,"AND");
			
			
			/**
			String substr1=stra.replace(stra.substring(stra.lastIndexOf("OR")),"AND");
			
			System.out.println("the concat string is substr1>> :"+substr1); 
			String substr2=stra.substring(stra.lastIndexOf("OR")+2,stra.length());
			
			System.out.println("<<<>>>>> substr2>> :"+substr2); 
			
			String last=substr1.concat(substr2);
			
			System.out.println("<<<>>>>> last>> :"+last); 
			
			
			String substr=last.substring(last.lastIndexOf(' ') + 1);
			  System.out.println("The substring is :"+substr);
			  if(substr=="AND" || substr.equalsIgnoreCase("AND")) {
				  last = last.substring(0,last.lastIndexOf(" "))+" ";
			  }
			System.out.println("Aftr alter AND the new last string is :"+last);

		    
		    
		    
		    **/
		    
		    String substr=stra.substring(stra.lastIndexOf(' ') + 1);
			  System.out.println("The substring is :"+substr);
			  if(substr=="AND" || substr.equalsIgnoreCase("AND")) {
				stra = stra.substring(0,stra.lastIndexOf(" "))+" ";
			  }
			System.out.println("Aftr alter AND the new string is :"+stra);

		    
		    
		    newsql="select * from db_gps.t_livetickettest where "+stra+"   ";
		    System.out.println("newsql>>1111>>>>. :"+newsql);
		
		
		
       }else{
    	   System.out.println(">>>Else OF NEW LOOP>>>>>>. :");
    	   
    	   
    	   
		   
    	   
    	   if((chk!=null || stg1!=null || stg2!=null || stg3!=null || stg4!=null) && chk1==null)
		    {
		    	str1=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND";
		    	
		    	
		    	str6="  vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') AND";
		    	
		    	str1=str1.concat(str6);
		    	stra =stra.concat(str1);
		    	
		    	
		    	
		    } 
    	   
    	   if(chk1!=null){
		    	
		    	System.out.println(">>>Else OF IF LOOP>>>>>>. :");
		    	str1=" tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') AND Status ='open' AND vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') AND";
		    	
		    	stra =stra.concat(str1);
		    	
		    	
		    	
		    }
    	   
    	   
    	   if(control_reallocation!=null)
    	   {
    		   
    		   System.out.println(">>>Else OF IF LOOP>>>>>>. :");
		    	str1=" tcategory in ('"+tcategory_realct+"') AND Status ='open' AND vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+tranporter_realct+"') AND";
		    	
		    	stra =stra.concat(str1);  
    		   
    	   }
    	   
    	 
		   
		    if(opentct!=null)
		    {
		    	str7=" vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') AND status <> 'AutoClosed' AND Status <> 'Closed' AND";
		    	stra =stra.concat(str7);
		    	
		    	
		    	
		    }   	   
		    if(status!=null)
		    {
		    	str8=" vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') AND status = 'AutoClosed' or Status = 'Closed' AND";
		    	stra =stra.concat(str8);
		    	
		    	
		    	
		    }
		    if(close1!=null)
		    {
		    	str8=" vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') order by CreationDateTime AND";
		    	stra =stra.concat(str8);
		    	
		    	
		    	
		    }
    	   
		    System.out.println("opentct :"+opentct); 
		    System.out.println("status :"+status); 
		    System.out.println("the close1==> :"+close1); 
    	   
			System.out.println("the concat string is :"+stra); 
		 	
			  String substr=stra.substring(stra.lastIndexOf(' ') + 1);
			  System.out.println("The substring is :"+substr);
			  if(substr=="AND" || substr.equalsIgnoreCase("AND")) {
				stra = stra.substring(0,stra.lastIndexOf(" "))+" ";
			  }
			System.out.println("Aftr alter AND the new string is :"+stra);

			if(status!=null || close1!=null)
			{
				 newsql="select * from db_gps.t_livetickettest where "+stra+"   ";

				
			}else{
			 newsql="select * from db_gps.t_livetickettest where "+stra+"   ";
			}
			 
			 System.out.println("newsql>>Check query elsse loop>>>>. :"+newsql);
    	   
    	   
    	   
    	   
       }
		
		
		
		/**
		if(fromdate!=null && chk==null ){
		 sqltct="select tcategory,tid,vehid  from db_gps.t_liveticket where tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') and tdate >='"+dataDate1+"' and tdate <= '"+dataDate2+"'  ";
		 System.out.println(">>>sqlbt>>>>*******"+sqltct);
		}else if(fromdate!=null && chk=="yes" ){
			 sqltct="select tcategory,tid,vehid  from db_gps.t_liveticket where tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') ";
			 System.out.println(">>>sqlbt>>>>*else if******"+sqltct);
			}else{
			
			 sqltct="select tcategory,tid,vehid  from db_gps.t_liveticket where tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') ";	
			
			
		}
		**/
		
		ResultSet tct=stwar3.executeQuery(newsql);
		System.out.println(">>>newsql>>>>*******"+newsql);
		while(tct.next())
		{
			
			tctegory = 	tct.getString("tcategory");
			tid =tct.getString("tid");
			vhid=tct.getString("vehid");
			
		
		
		
		
		sql="select * from t_onlinedata where  VehicleCode = "+vhid+" order by TheDate desc, TheTime desc";
		ResultSet rst1=st1.executeQuery(sql);
		System.out.println(">>>>sql"+sql);
//int i=1, j=0;
	
		
		int d=2;
		
		if(rst1.next())
		{
			
			transporter_name=rst1.getString("Transporter");
			lat1=rst1.getDouble("LatitudePosition");
			lon1=rst1.getDouble("LongitudePosition");
			 upddate=rst1.getString("TheDate");
			battrystatus =rst1.getString("bcharging");
			battrystatustime =rst1.getString("bdatetime");
			 loc=rst1.getString("Location");
			System.out.println(lat1);
			System.out.println(lon1);
			Vehcode=rst1.getString("VehicleCode");
			VehicleRegNumber=rst1.getString("VehicleRegNo");
			time=rst1.getString("TheTime");
			
		
			
		}else{
			lat1=0.00;
			lon1=0.00;
			upddate="-";
			loc="-";
			VehicleRegNumber ="-";
			time="-";
		}
				
				
		String contact_person="-";
		
		String sql_user="select  * 	FROM  db_gps.t_user_vehicles WHERE VehicleRegNumber='"+VehicleRegNumber+"' ";
		System.out.println(">>>sql_user>>>>*******"+sql_user);
		ResultSet rst_user=st_user.executeQuery(sql_user);
		
		System.out.println(">>>sql_user>>>>*******"+sql_user);
		while(rst_user.next())
		{
			
			
			contact_person=contact_person+","+rst_user.getString("UserName");
			
		}
		System.out.println(">>>contact_person>>>>*******"+contact_person);
		try{
		contact_person=contact_person.substring(2,contact_person.length());
		
		}catch(Exception e34)
		{
			
			System.out.println(">>>Exception in substring >>>>*******"+e34);
			contact_person="-";
			
		}
		
		
		System.out.println(">>>contact_person>>>>*******"+contact_person);
		
				
					if(tctegory!="-" || !(tctegory.equalsIgnoreCase("-")))
					{
						
						
				
				System.out.println(">>>tctegory>>>>*******"+tctegory);
			
			
	/*		String VehicleCode=rst1.getString("VehicleCode");
			if(VehicleCode!=null||VehicleCode!=""){
			String driver="SELECT  "+ 
			"  			tsj.DriverName, tsj.DriverCode, tsj.startdate "+
		    "             FROM db_gps.t_startedjourney tsj INNER JOIN " +
		    "		( " +
		    "			SELECT vehid, startdate" +
		    "			FROM t_startedjourney " +
		    "			WHERE JStatus='Running' and vehid='"+VehicleCode+"'" +
		    "			" +
		    "	) tsjd ON (tsj.vehid=tsjd.vehid AND tsj.JStatus='Running' AND tsj.startdate=tsjd.startdate) order by startdate DESC" ;
			System.out.println(driver);
			
			ResultSet driver1=st11.executeQuery(driver);
			if(driver1.next()){
				drivername=driver1.getString("DriverName")+" ("+driver1.getString("DriverCode")+")   Trip StartDate:"+driver1.getString("startdate") ;
			}
			} */
			
			if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg="#FFA500";
			}
			
			
			sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+upddate+"') as days";
			ResultSet rsdate=st11.executeQuery(sql8);
			if(rsdate.next())
			{
					delaydays=rsdate.getInt("days");
					if(delaydays>7)
					{
						msg="Device Disconnected";					
					}
			}
			
	String nogpschk="";
	try{
		nogpschk=loc.substring(0,11);
	} catch(Exception e)
	{
		nogpschk=loc;
	}
	if(nogpschk.equals("No GPS Data"))
	{
		msg=msg+" No GPS Data";
	}
	
 sql8="select status,Empname,Ownername,Instruction from db_gps.t_vehicledetails where vehiclecode='"+vhid+"'";
System.out.println("sql8------>"+sql8);
 ResultSet rstrem=st2.executeQuery(sql8);
 if(rstrem.next())
 {
 	
	 Empname=rstrem.getString("Empname");
	 OwnerName=rstrem.getString("Ownername");
	 Instruction=rstrem.getString("Instruction");
	 if(rstrem.getString("Status").equals("Removed"))
 	{
 		bg="red";
 	}
 	if(rstrem.getString("Status").equals("Missing"))
 	{
 		bg="yellow";
 	}
 	if(rstrem.getString("Status").equals("DeActivated"))
 	{
 		bg="lightgreen";
 	}
 	
 }
 

 
 //--------------------------------------- special comment color for row--------------------
/* int spcnt1=0;
 	String sqlsp="select count(*) as cnt from t_techspecialrep where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and cmmt_type='Vehicle' and Closed='No' ";
	ResultSet rssp=stmtsp.executeQuery(sqlsp);
	if(rssp.next())
	{
		spcnt1=rssp.getInt("cnt");
		
	}
	if(spcnt1 > 0)
	{
		System.out.println("inside vehicle");
	
		bg="lightBlue";
	}
	else
	{
		
	System.out.println("unit id--"+rst1.getString("UnitID"));
	
	int spcnt=0;
	sqlsp="select count(*) as cnt from t_techspecialrep where UnitId = '"+rst1.getString("UnitID")+"' and Closed='No' and cmmt_type='Unit' ";
 	ResultSet rssp1=stmtsp.executeQuery(sqlsp);
	if(rssp1.next())
	{
		
		spcnt=rssp1.getInt("cnt");
	}
	
	if(spcnt > 0)
	{System.out.println("inside unit");
		bg="#F6FDD0";
	}
	}*/
//-------------------------------------------------------------------------------------------------------------
	
	sql4="select * from db_gps.t_vehicledetails where VehicleCode ='"+vhid+"' ";
	
	ResultSet rs4=st4.executeQuery(sql4);
	System.out.println("<<<<sql 4>>>>"+sql4);
	if(rs4.next())
	{
		unitid=rs4.getString("UnitID");
	//	System.out.println("unitid-->"+unitid);
		vehregno=rs4.getString("VehicleRegNumber");
		try{
		instdte=rs4.getString("InstalledDate");
	//	System.out.println("InstalledDate---->"+instdte);
		InstalledPlace=rs4.getString("InstalledPlace");
	//	System.out.println("InstalledPlace---->"+InstalledPlace);
		}
		catch(Exception X)
		{
			instdte="-";
			InstalledPlace="-";
		}
		
		sqlamc="select * from t_amchistory where VehCode = '"+vhid+"' order by NewDate desc limit 1";
		ResultSet rsamc=stamc.executeQuery(sqlamc);
		if(rsamc.next())
		{
			if(!(null==rsamc.getDate("WarrantyTill")))
			{
			try{	
			sqlamc1="select TO_DAYS('"+rsamc.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
			ResultSet rsamc1=stamc1.executeQuery(sqlamc1);
			if(rsamc1.next())
			{
				if(rsamc1.getInt("days") > 0)
				{
					warranty="Yes";
				}
				else
				{
					warranty="No";
				}
			}
			}
			catch(Exception X)
			{
				warranty="-";

			}
			}
			else
			{
				
				
				sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte+"') as days";
				ResultSet rst222=st4.executeQuery(sql4);
				if(rst222.next())
				{
					
					if(rst222.getInt("days") > 365)
							{
						warranty="NO";
							}
					else
					{
						warranty="YES";
					}
				}
			}
		}
		else
		{
				try{
					instdte1=rs4.getString("InstalledDate");
					}
					catch(Exception X)
					{
						instdte1="-";
					}	
			sql4="select TO_DAYS('"+today+"')-TO_DAYS('"+instdte1+"') as days";
			ResultSet rst222=st4.executeQuery(sql4);
			if(rst222.next())
			{
				if(rst222.getInt("days") > 365)
						{
					warranty="NO";
						}
				else
				{
					warranty="YES";
				}
			}
			
			
			
		}	

	}else{
		
		unitid="-";
		
		
	}
	
	
	sql5="select * from t_unitmaster where UnitID='"+unitid+"'";
	ResultSet rs5=st5.executeQuery(sql5);
	if(rs5.next())
	{
		simno=rs5.getString("MobNo");
		mobno=rs5.getString("SimNo");
		typeunit=rs5.getString("InstType");
		simcomp=rs5.getString("SimCompany");
		peripherals=rs5.getString("Peripherals");
		psno=rs5.getString("PSNo");
		pcbno=rs5.getString("PCBNo");
		boxno=rs5.getString("BoxNo");
		batteryno=rs5.getString("BatteryNo");
		
	} 
	 String b="NA",stmin="NA";
	String sqlFTP="select * from db_gps.t_ftplastdump where UnitID='"+unitid+"'";
	ResultSet rsFTP=st5.executeQuery(sqlFTP);
	if(rsFTP.next()){
		WMSN=rsFTP.getString("WMSN");
		int TXInterval=0,StInterval=0;
		if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
			
		}else{
			TXInterval=rsFTP.getInt("TXInterval");
		}
		if(rsFTP.getString("TXInterval").equalsIgnoreCase("-")){
			
		}else{
			StInterval=rsFTP.getInt("StInterval");
		}
		CodeVersion=rsFTP.getString("CodeVersion");
		UnitType=rsFTP.getString("UnitType");
		if(CodeVersion.contains("AVL_LITE")){
			int aa=(TXInterval*500)/1000;
			int aSX=(StInterval*500)/1000;
			int bTemp=aa/60;
			int stminTemp=aSX/60;
			b=bTemp+"";
			stmin=stminTemp+"";
			System.out.println("b====>"+b);
		}else{
			int aa=(TXInterval*100)/1000;
			int aSX=(StInterval*100)/1000;
			int bTemp=aa/60;
			int stminTemp=aSX/60;
			b=bTemp+"";
			stmin=stminTemp+"";
			System.out.println("b====>"+b);
		}
	} else{
		
		CodeVersion ="-";
		WMSN ="";
		UnitType="-";
		
	}
	
	
	
	sql6="select * from t_group where VehCode='"+vhid+"' ";
	System.out.println(sql6);
	//out.print(sql6);
	ResultSet rs6=st6.executeQuery(sql6);
	if(rs6.next())
	{
		group1=rs6.getString("GPName");
	}
	else
	{
		group1="None";
	}
	
	
	 //---------------------------------------------------------------------------------------------------------
	 String  spcnmttype="",spcmnt="";
	 String sqlsp="select * from t_techspecialrep where ((VehRegNo='"+VehicleRegNumber+"' and cmmt_type='Vehicle') or(UnitId='"+unitid+"' and cmmt_type='Unit')) and Closed='No' order by EntDateTime desc Limit 1";
	//String sqlsp="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//	System.out.println(sqlsp);
	ResultSet rssp=stmtsp.executeQuery(sqlsp);
	if(rssp.next())
	{
		spcnmttype=rssp.getString("cmmt_type");
	}
	if(spcnmttype.equalsIgnoreCase("Vehicle"))
	{
	//	System.out.println("inside vehicle");
	
		bg="lightBlue";
	}
	else if(spcnmttype.equalsIgnoreCase("Unit"))
	{
		if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
		{
			
			bg="#FFA500";
		}else{
		
		
		bg="#F6FDD0";
		}
		
	}

	String sqlrepdis="select SpComment from t_techspecialrep where cmmt_type='Vehicle'  and Closed='No' order by EntDateTime desc";
	System.out.println("aaaaaaaaaaa^^^^^^^^^^^^^");
	System.out.println(sqlrepdis);
	ResultSet rsrepdis=stmtsp.executeQuery(sqlrepdis);
	System.out.println("bbbbbbbbbb^^^^^^^");
	if(rsrepdis.next()){
		spcmnt=rsrepdis.getString("SpComment");
		System.out.println("spcmnt^^^^^^^^^^^^^"+spcmnt);
		if(spcmnt.contains("System disconnection detected")){
			if(battrystatus.equalsIgnoreCase("OFF") || battrystatus=="OFF" || battrystatus.contains("OFF"))
			{
				
				bg="#FFA500";
			}else{
			
			bg="#E2A9F3";
			
			}
		}
	}
	
	System.out.println("ccccccccccc^^^^^^^^^^^^^");
%>
<tbody>
<tr bgcolor='<%=bg%>' style="width:auto">
<%
	if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
	{ %>
			<td> <div align="center"> <input type="checkbox" name="cb1<%=j%>" id="cb1<%=j%>"  value="cb1<%=j%>"> </input> </div> </td>
<%	}
%>
<td align="right"><div  align="right"> <%=i%> </div> 	 </td> 
<td align="right"><div  align="left"> <%=Instruction%></div>  </td>


<%

System.out.println("tctegory^^**********^"+tctegory);
if(tctegory.equalsIgnoreCase("ToCheck"))
{
	tctegory="0";
	
}else if(tctegory.equalsIgnoreCase("stage1ticket"))
{
	tctegory="1";
	
	
}else if(tctegory.equalsIgnoreCase("stage2ticket"))
{
	
	tctegory="2";
	
}
else if(tctegory.equalsIgnoreCase("stage3ticket"))
{
	
	tctegory="3";
	
}
else if(tctegory.equalsIgnoreCase("stage4ticket"))
{
	
	tctegory="4";
	
}else{
	
	
	
}


try{
	  	%>
	  <td> <div align="right"><font color=""><%if( tctegory.equalsIgnoreCase("-") ||  tctegory=="-") { %> <%=tctmsg %><%}else{ %> <%=tctegory %><%} %>	</font> </div> </td>
		
	<% }catch (Exception e)
	
	{
		   e.printStackTrace();
		} %>


<%



%>


<!--<td align="right"><div  align="right"><%= tid %></div>	  </td>-->

<td> <div  align="left"><%=warranty%></div> </td>
<td align="left"> <div  align="left"> <%=battrystatus%>	</div>  </td>
   <%try{
	  	%>
	   <td> <%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	 </td>
		
	<% }catch(Exception  e){
	
		System.out.println(">>>>>>Exception>>>>"+e);
		
	}
	System.out.println(">>>>>>UP to here HIIII>>>>");
%>

<td align="left"> <div  align="left"> <%=contact_person%>	</div>  </td>
<td width="100px" align="right"><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><b><div align="right"> <%=VehicleRegNumber%></div> </b>
</a>
<br/>	
<div class="popup" id="popup<%=i%>">
<table border="0" >

<%

if(tctegory.equalsIgnoreCase("0"))
{
	tctegory="ToCheck";
	
}else if(tctegory.equalsIgnoreCase("1"))
{
	tctegory="stage1ticket";
	
	
}else if(tctegory.equalsIgnoreCase("2"))
{
	
	tctegory="stage2ticket";
	
}
else if(tctegory.equalsIgnoreCase("3"))
{
	
	tctegory="stage3ticket";
	
}
else if(tctegory.equalsIgnoreCase("4"))
{
	
	tctegory="stage4ticket";
	
}else{
	
	
	
}



if(bg.equals("red"))
{
	
String remdate="", oldunitwith="", withtech="";
// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
String sql9="select * from t_unitreplacement where  InstType='Rem' order by EntDate desc";	
ResultSet rs9=st9.executeQuery(sql9);	
if(rs9.next())
{
	unitid=rs9.getString("OldUnitId");
	remdate=rs9.getString("EntDate");
	oldunitwith=rs9.getString("OldUnitWith");
	withtech=rs9.getString("InstBy");
	//out.println("unitid");
	String sql11="select * from t_unitreplacement where  NewUnitID='"+unitid.trim()+"' ";
	
	ResultSet rs11 = st11.executeQuery(sql11);
	
	if(rs11.next())
	{
		simno=rs11.getString("MobNo");
		mobno=rs11.getString("SimNo");
		//remdate=rs11.getString("EntDate");
	}
	
} 
else
{
	String sql11="select * from t_unitreplacement  order by InstDate desc limit 1";
	
	ResultSet rs11 = st11.executeQuery(sql11);
	
	if(rs11.next())
	{
		unitid=rs11.getString("NewUnitId");
		oldunitwith="Not Avail";
		//remdate=rs11.getString("EntDate");
	}
}
}


if(bg.equals("lightgreen"))
{
	
	String sql9="select * from t_unitreplacement where  InstType='DeActive' order by EntDate desc";	
	ResultSet rs9=st9.executeQuery(sql9);	
	if(rs9.next())
	{
		unitid=rs9.getString("OldUnitId");
						
		String sql11="select * from t_unitreplacement where  NewUnitID='"+unitid.trim()+"' ";
		ResultSet rs11 = st11.executeQuery(sql11);
		//out.println(sql11);
		if(rs11.next())
		{
			simno=rs11.getString("MobNo");
			mobno=rs11.getString("SimNo");
		}
	}
	
}

%>



<tr><td><a href="addcomplaint.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&tcategory=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
<tr><td><a href="inspection.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>&warranty=<%=warranty%>" onclick="toggleDetails(<%=i%>,false);">Inspection</a></td></tr>
<!--  <tr><td><a href="addcontact.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Transporter Contact</a></td></tr>

<tr><td><a href="addunit.jsp?transporter=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Add Unit</a></td></tr>-->


<%

if(typevalue.equals("transporter"))
{
	%>
     <tr>
		<td>
			<a href="repunit.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a>
		</td>
	</tr>
	<tr>
		<td> 
			<a href="techspcomment.jsp?transporter=<%=transporter%>&vid=<%=Vehcode%>&vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> 
		</td>
	</tr>
	
 <%
}else{

if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  

%>
<tr><td><a href="repunit1.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
<%
	}else
	{ 
%>
<tr><td><a href="repunit.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>

<%
} %>
<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('rep_history.jsp?vid=<%=Vehcode%>','win1','width=800,height=600,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > View History</a></td></tr>
 <tr>
	<td> <a href="remuittemp.jsp?veh=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>"> Temp Removal </a> </td>
</tr>
 
<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("MiddleWare"))
{  %>	 
<tr>
	<td><a href="editrecs.jsp?vid=<%=Vehcode%>&tid=<%=tid %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Edit Records</a></td>
</tr>


<%
}  
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
<tr>
	<td><a href="removeunit.jsp?veh=<%=vehregno%>&unitid=<%=unitid%>&tid=<%=tid %>&transporter=<%=transporter %>&category=<%=tctegory %>" onclick="toggleDetails(<%=i%>,false);">Perm Removal</a></td>
</tr>
<!-- 	<tr>
	<td>  <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('unitmissingofveh.jsp?vid=<%=Vehcode%>&vehregno=<%=vehregno %>&unitid=<%=unitid %>&transporter=<%=transporter %>','win1','width=500,height=200,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Unit Missing</a> </td>
</tr>
-->
<%
}
%>  
<tr>
<td> <a href="javascript: toggleDetails(<%=i%>,false);" onclick="window.open ('reprovisionnos.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td>
</tr>

<tr>
	<td> <a href="techspcomment.jsp?transporter=<%=transporter%>&vid=<%=Vehcode%>&vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
</tr>
<tr>
	<td> <a href="sendmail.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&transp=<%=transporter%>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
</tr>


<tr>
	<td> <a href="vehexchange.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Vehicle Exchange </a> </td>
</tr>

<%
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
{  %>
<tr>
	<td> <a href="unitmissing.jsp?vid=<%=Vehcode%>&vehno=<%=vehregno%>&tid=<%=tid %>&category=<%=tctegory %>&unitid=<%=unitid%>&simno=<%=simno%>&mobno=<%=mobno%>&transp=<%=transporter%>&grp=<%=group1 %>" onclick="toggleDetails(<%=i%>,false);">Unit Missing</a> </td>
</tr>
<%
}%>
<%
							if(SUPERADMIN.equalsIgnoreCase(userrole)){
							%>
							<tr>
								<td> <a href="reportincident.jsp?vehno=<%=vehregno%>&tid=<%=tid %>&unitid=<%=unitid%>&transp=<%=transporter%>&GPName=<%=group1%>" onclick="toggleDetails(<%=i%>,false);">Report Incident</a> </td>
							</tr>
							<%
							}}
						

String remdate="", oldunitwith="", withtech="";
String sql10="select * from t_unitreplacement   order by EntDate desc";

System.out.println(sql10);
ResultSet rs22=st9.executeQuery(sql10);	
System.out.println("12456");
if(rs22.next())
{    
	//unitid=rs22.getString("OldUnitId");
	remdate=rs22.getString("EntDate");
	oldunitwith=rs22.getString("OldUnitWith");
	//withtech=rs22.getString("InstBy");
	System.out.println(">>>>>>>>remdate>>>>"+remdate);		
	System.out.println("22222145");
//String sql11="select * from t_unitreplacement where VehRegNo='"+rst1.getString("VehicleRegNo")+"' and NewUnitID='"+unitid.trim()+"' ";
	
	//ResultSet rs11 = st11.executeQuery(sql11);
	
	//if(rs11.next())
	//{
		//simno=rs11.getString("MobNo");
		//mobno=rs11.getString("SimNo");
		//remdate=rs11.getString("EntDate");
	//}
}
System.out.println("77777777777777>>>");		
String abc="";
try{


 abc="<font color='yellow' size='2'> In-Active Unit Removed on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+ " Unit with:"+oldunitwith+"</font>";
System.out.println("123>>>"+abc);		
}catch(Exception e){
	e.printStackTrace();
	
	//out.print(" <font color='yellow' size='2'>In-Active UNIT REMOVED on (date not available)</font>");
}



%>

<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
</table>
</div>
</td>




	<td align="left"><div  align="left"> <%=Empname %></div>  </td>
	<td align="left"><div  align="left"> <%=OwnerName %></div>  </td>
<%
try{
%>
<td align="right"><div  align="right"> <%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(upddate))%> <br><%=time%></div> </td>
<%
}catch(Exception e){
	
	
	
}

if(bg.equals("red")){
	System.out.println(">>>>>>>>if loop>>>>");	
%>	

<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=lon1%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=loc%> </font> </b> </a> <br/> <font color="red"><div  align="left"> <%= abc %></div> </font></td>
<% }else{
	System.out.println(">>>>>>>>else loop>akshay>>>");
%>
<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=lat1 %>&long=<%=lon1%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=loc%> </font> </b> </a> <font color="red"><div  align="left"> <%= msg %></div> </font></td>
<% 
}

System.out.println(">>>>>>>>messege>>>>"+msg);	
System.out.println(">>>>>>>>UP to here akshay>>>>");

if(bg.equals("yellow"))
{ %>
	<font color="red" >UNIT MISSING </font>
<%	}




if(bg.equals("red"))
{
		
	
	// out.print(" <font color='yellow' size='2'>UNIT REMOVED</font>");
	String sql9="select * from t_unitreplacement where  InstType='Rem' order by EntDate desc";	
	ResultSet rs10=st9.executeQuery(sql9);	
	if(rs10.next())
	{
		unitid=rs10.getString("OldUnitId");
		remdate=rs10.getString("EntDate");
		oldunitwith=rs10.getString("OldUnitWith");
		withtech=rs10.getString("InstBy");
		//out.println("unitid");
		String sql11="select * from t_unitreplacement where  NewUnitID='"+unitid.trim()+"' ";
		
		ResultSet rs11 = st11.executeQuery(sql11);
		
		if(rs11.next())
		{
			simno=rs11.getString("MobNo");
			mobno=rs11.getString("SimNo");
			//remdate=rs11.getString("EntDate");
		}
		
	} 
	else
	{
		String sql11="select * from t_unitreplacement order by InstDate desc limit 1";
		
		ResultSet rs11 = st11.executeQuery(sql11);
		
		if(rs11.next())
		{
			unitid=rs11.getString("NewUnitId");
			oldunitwith="Not Avail";
			
			//remdate=rs11.getString("EntDate");
		}
	}
	
	
	if(oldunitwith.equals("Tech"))
	{
		oldunitwith=withtech;			
	}
	try{
//	out.print(" <font color='yellow' size='2'> on "+new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(remdate))+" Unit with:"+oldunitwith+"</font>");
	} catch(Exception e)
	{
	//	out.print(" <font color='yellow' size='2'> on (date not available)</font>");			
	}

 } %>  --%></td>

<%-- <%
System.out.println(">>>>>>>>UP to here 3333>>>>");
	String compdate="", attloc="", availdate="", allocatedto="", desc="", contpers="", entby="", DetDesc="";
	sql="select * from db_CustomerComplaints.t_complaints1 where  Status <> 'Solved' and 	VehicleNo ='"+VehicleRegNumber+"' ";
	System.out.println(">>>>>>>>BEFORE>>>>"+sql);
	ResultSet rscomp=st.executeQuery(sql);
	System.out.println(">>>>>>>>AFTEr>>>>");
	if(rscomp.next())
	{
		System.out.println(">>>>>>>>inside>>>>");
		attloc=rscomp.getString("VehAttLoc");
		availdate=rscomp.getString("VehAvailDate");
		allocatedto=rscomp.getString("Status");
		desc=rscomp.getString("Complaint");
		contpers=rscomp.getString("ContDets");
		entby=rscomp.getString("RegBy");
		DetDesc=rscomp.getString("CDescription");
		compdate=rscomp.getString("TdyDate");
		
		if(allocatedto.equals("Allocated") || allocatedto.equals("Attended"))
		{
			sql="select * from db_CustomerComplaints.t_callocation1 where Tno='"+rscomp.getString("Tno")+"' order by DofAllocation Desc";
			ResultSet rsallocto=st.executeQuery(sql);
			if(rsallocto.next())
			{
				allocatedto=rsallocto.getString("Technicion");
				//compdate=rsallocto.getString("DofAllocation");
			}
			else
			{
				allocatedto="Unallocated";
			}
				
		}
		System.out.println(">>>>>>>>55555555>>>");
//--------------------------------------------------------	
		
		if(availdate.equals(""))
		{
			availdate="No Information";
	
			%>
			
			<td align="left"> <div  align="left"><%=availdate %></div> </td>
			<% 
		}
		
		else
		{
		
		try
		{
		%>
			
			<td a href="" onmouseover="ajax_showTooltip(window.event,'showCompDetails.jsp?compdate=<%=compdate %>&attloc=<%=attloc %>&availdate=<%=availdate %>&allocatedto=<%=allocatedto %>&desc=<%=desc %>&contpers=<%=contpers %>&entby=<%=entby %>&DetDesc=<%=DetDesc %>',this);return false" onMouseOut="ajax_hideTooltip();"> <B><div  align="left"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(availdate))%></div> </B></td>
			   
		<%	
		}catch(Exception e){
			
		out.println("-");
			
			
		}
		}
//--------------------------------------------------	
		
	}
	else
	{ %>
		<td> No Complaint</td>		
<%	}
	
	System.out.println(">>>>>>>>UP to here 454545454>>>>");
%>

<td align="right"> <div  align="right"><%=unitid%></div>  </td>
<td align="right"><div  align="right"> <%=simno%> </div></td>
<td align="right"> <div  align="right"><%=mobno%> </div> </td>

<!--<td align="right"><div  align="right"> < %=b%> </div></td>-->


<!--<td align="right"> <div  align="right">< %=stmin%> </div></td>-->
<td align="left"><div  align="left"> <%=CodeVersion%> </div></td>
<!--<td align="right"><div  align="right"> < %=WMSN%> </div> </td>-->
<!-- <td align="left"><div  align="left"> < %=UnitType%> </div></td>-->
<td align="left"><div  align="left"> <%=peripherals %></div>  </td>
<%
if(typevalue.equals("transporter")){
	 
 }else{
%>
<td align="left"><div  align="left"><%=typeunit %></div>  </td>
<%
 }
%>
<td align="left"> <div  align="left"><%=simcomp %></div> </td>
<%
if(typevalue.equals("transporter")){
	 
 }else{
%>
<!--<td align="right"> <div  align="left">< %=psno %></div> </td>-->
<!--<td align="right"> <div  align="left">< %=pcbno %></div> </td>-->
<!--<td align="right"> <div  align="left">< %=boxno %> </div></td>-->
<!--<td align="right"> <div  align="left">< %=batteryno %></div> </td>-->
<td> <div  align="left"><%=group1%> </div> </td>
<%
 }
 	System.out.println(" >>>here 1111---->"); 
 	System.out.println(" >>>here instdte---->"+instdte); 

%>
<%
try{
%>
<td> <div  align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdte))%> </div></td>
 
 <%
}catch(Exception e)
{
	
	e.printStackTrace();
	
}
 
 %>
 
 <td><div  align="left"> <%=InstalledPlace%></div> </td>





<td align="right"><div  align="right"><%= tid %></div>	  </td>





<td>
<%	
System.out.println(" >>>here 2222---->"); 
//---------- Last replacement date
String d1="N.A";
InstPlace="N.A";
	sql="select * from t_unitreplacement where  VehCode ='"+vhid+"' and  InstType='Rep'  order by InstDate desc";
//	System.out.println("sql---->"+sql); 
	ResultSet rsgett=st6.executeQuery(sql);
if(rsgett.next())
{
	InstPlace=rsgett.getString("InstPlace");
	d1=rsgett.getString("InstDate");
	//System.out.println("date---->"+d1); 
	//System.out.println("InstPlace----"+InstPlace); 
	if(d1=="0000-00-00"||d1=="-")
	{
		out.print(d1);
	}
	else
	{
		String d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
		out.print(d2);
	}
}
else
{
	out.print(d1);
}

%>
</td>

<%
//String sql23="select * from t_unitreplacement where VehRegNo='"+vehregno+"'and VehRegNo not in('-','0','0000') and InstType='Rep'  order by InstDate desc";
//ResultSet rst23=st23.executeQuery(sql23);
//while(rst23.next())
//{
//	InstPlace=rst23.getString("InstPlace");
	
//}
// %>
<td> <div  align="left"><%=InstPlace%></div> </td>
<%

//System.out.println("query-----");
int spcnt=0,spcnt2=0,k=0;
String spcmmnt="N.A",extracmnt="N.A",Entrydt="N.A",Enteredby="N.A";
String sqlsp1="select * from t_techspecialrep where ((VehRegNo='"+VehicleRegNumber+"' and `cmmt_type`='Vehicle') or(`UnitId`='"+unitid+"' and  `cmmt_type`='Unit')) and Closed='No' order by `EntDateTime` desc";
//String sqlsp1="select * from t_techspecialrep where (VehRegNo='"+rst1.getString("VehicleRegNo")+"' or UnitId='"+rst1.getString("UnitID")+"') and (cmmt_type='Vehicle' or `cmmt_type`='Unit') and Closed='No' order by `EntDateTime` desc Limit 1";
//String sqlsp1="select count(*) as cnt from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' ";
ResultSet rssp2=stmtsp111.executeQuery(sqlsp1);
while(rssp2.next())
{
	//System.out.println("INside while");

	spcnt++;

	// new requirement on 2010-09-07 by Ajay to show latest spcomment on vehicle if any------------

	String cmntype=rssp2.getString("cmmt_type");
	
	if(cmntype!=null && cmntype.equalsIgnoreCase("Vehicle") && k==0)
	{
		spcmmnt=rssp2.getString("SpComment");
		extracmnt=rssp2.getString("Extra_comment");
		Entrydt=rssp2.getString("EntDateTime");
		Enteredby=rssp2.getString("EntBy");
		k++;
	}
	//---------------------------------------
	
}
//System.out.println("OUTside while");
/*if(rssp1.next())
{
spcnt2=0;
spcnt2=rssp1.getInt("cnt");
}
String sql10="select count(*) as cnt from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' ";
//out.print(sql10);
ResultSet rs10=st.executeQuery(sql10);
while(rs10.next())
{
	spcnt=rs10.getInt("cnt");	
}
spcnt=spcnt+spcnt2;*/
%>

<td> <a href="#" onClick="window.open ('spcmntabtveh.jsp?vehno=<%=vehregno%>&unitid=<%=unitid%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2"> Click (<%=spcnt%>)</font></a>  </td>
<td><div  align="left"> <%=spcmmnt %> </div></td>
	<td> <div  align="left"><%=extracmnt %></div> </td>
	<%if(!Entrydt.equals("N.A"))
	{%>
	<td align="right"><div  align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(Entrydt))%> </div></td>
	<%}else{%>
	<td align="right"><div  align="left"> <%=Entrydt %></div> </td>
	<%} %>
	<td><div  align="left"><%=Enteredby %></div> </td>
	
			
	
</tr>
</tbody>
			<input type="hidden" id="id<%=j%>" name="id<%=j%>" value="<%=vhid%>" />
			<input type="hidden" id="vehno<%=j%>" name="vehno<%=j%>" value="<%=VehicleRegNumber%>" />
			<input type="hidden" id="unitid<%=j%>" name="unitid<%=j%>" value="<%=unitid%>" />
    <%
i++;
    j++;
				}
		
					p++;
		
		System.out.println(">>>>END OF WHILE LOOP 2>>>>");
		}   
    	   
		System.out.println(">>>>END OF WHILE LOOP 1>>>>");   
       
    	   System.out.println(">>>><><><><<><<><><><><>INSIDE ELSE LOOP OF TRANSPORTER>>>>");   
	
    	  
    	   
    	   String vhhid="",vhregno="",tm="";     
    	   
          	   
          	  
          	   
          	  
          	   
          	   ResultSet rst1=st1.executeQuery(sql);
      	System.out.println(">>>>sql"+sql);
      //int i=1, j=0;

      	
      	
%>--%>

<%-- <input type="hidden" name="cntr" value="<%=i%>" /> --%>	

<%-- <% 
}
} catch(Exception e)
{
e.printStackTrace();
}
finally
{
conn.close();
conn1.close();
}
%> --%>
<%-- <%
if(typevalue.equals("transporter")){

}else{
if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole)|| userrole.equals("sales"))
{ %>	
<tr>
<td align="center" colspan="38"> 
	<div align="center"> 
		
		
		<input type="submit" name="submit" value="Change AMC" class="formElement" onclick="changeAction();"/>
		<input type="submit" name="submit" value="Per Removal" class="formElement" onclick="permremoval();"/>
		 <input type="submit" name="submit" value="Temporary Remove" class="formElement" onclick="tempremoval();"/> 
		 <input type="submit" name="submit" value="Deactivation" class="formElement" onclick="deactive();"/>
		 <input type="submit" name="submit" value="UnitMissing" class="formElement" onclick="unitmissing();"/>
		  <input type="submit" name="submit" value="AddEditEmp" class="formElement" onclick="addeditemp();"/>
		   <input type="submit" name="submit" value="AddGroup" class="formElement" onclick="addgroup();"/>
		   <input type="submit" name="submit" value="DeleteGroup" class="formElement" onclick="deletegroup();"/>
	</div> </td>
</tr>--%>
<%  } }


}
 




catch(Exception e)
{
	e.printStackTrace();
	
}

finally
{
conn.close();
conn1.close();
}
%>	
</table>

</div>
</div>

</form>




<!-- code end here --->

	</div>
	
	 </div>
	 
	 
<div id="gbox-bot1"> </div>


			
</div>



</div>

</div>
</div>


</div>


</body>


<!-- <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table> -->
</html>


