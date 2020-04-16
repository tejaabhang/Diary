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
			Empname = "", Instruction = "", psno = "", pcbno = "", boxno = "",
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
     //alert("HII>>>>.");

  try{
     var a=document.getElementById("chk").value;
  // var b=document.getElementById("stg1").Value;
   //var c=document.getElementById("stg2").Value;
 //  var d=document.getElementById("stg3").Value;
 //  var e=document.getElementById("stg4").Value;
   //var e=document.getElementById("chklength").Value;

   //alert(">>>a>>"+a);
   
   if(a=="ToCheck")
   {
	   alert(">>inside >");

		   a.checked=true;


		   alert(">>YOOOOO >");
		   
   }
    //alert(">>>up to here ");
    //alert(">>>"+a);
  
  }catch(e){
//alert(">>"+e);
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

 			//	alert("&&&&&&&&&&&&&&&"+frmFldId)
 				try
 				{
 				 var obj = document.getElementById(elemId);  
 		         var oFld = document.getElementById(frmFldId); 
 		         oFld.value = obj.innerHTML;  
 		       // alert("&&&&&&&&&&&&&&&")
 		         document.fullfleet1.action = "excel.jsp";
 		         //alert("IIIIIIIIIIIIIIIIIII");
 		        // document.fullfleet1.submit();
 		        // alert("*********************8");
 		        // document.fullfleet.action ="excel.jsp";
 		         document.forms["fullfleet1"].submit();
 				}
 				catch(e)
 				{
 				//	alert(e);
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
 			        //alert("end>>>");
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
	   <%@ include file="headertech.jsp" %>
	   
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
    

	//System.out.println(">>>>>>today >>>>>>>>>>"+today);
	
       
	//System.out.println(">>>>>>abc1 >>>>>>>>>>"+abc1);
	
	fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
      
    
    if(fromdate!=null || todate!=null){
		fromdate=fromdate.trim();
	    todate=todate.trim();
		//System.out.println("fromdate>>>>"+fromdate);
	   // System.out.println("todate>>>>"+todate);
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
	
	//System.out.println("dataDate1>>>> "+dataDate1);
	//System.out.println("dataDate2>>>> "+dataDate2);
	
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

 
 System.out.println(">>>>$$11>");

 
transporter=request.getParameter("owner"); 




//System.out.println(">>>>>>chk >>>>>>>>>>"+chk);
//System.out.println(">>>>>>opentct >>>>>>>>>>"+opentct);


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
  	
  	
  	
  	//System.out.println(">>>>>>username >>>>>>>>>>"+username);
	//System.out.println(">>>>>>userrole1 >>>>>>>>>>"+userrole1);

  	String checkbox="",chk1="";
  	
  	chk1 =request.getParameter("chk1");
  	
  	//System.out.println(">>>>>>check BOXX VALUE@@@@@@@@ >>>>>>>>>>"+chk1);
  	
        
  	 String check="",stg11="",stg22="",stg33="",stg44="",open1="",total="",sqlcnt="",sqlcnt1="",sqlcnt2="",sqlcnt3="",sqlcnt4="",sqlcnt5="",sqlcnt6="",sqlcnt7="",sqlcnt8;
  	 String  closetotal="";
  	 //int sd=1;
    int open =0,close =0;
    int opent=0;
  	
	
  	 
try{
    	
    	String dlt="delete from db_gps.t_vehicledetailscopy ";
    	stvhdt.executeUpdate(dlt);
    	//System.out.println(">>>dlt<<<"+dlt);
    	
    	String insrt="insert into  db_gps.t_vehicledetailscopy(select * from db_gps.t_vehicledetails)  ";
    	stvhdt1.executeUpdate(insrt);
    	//System.out.println(">>>insrt<<<"+insrt);
    	
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
  	
  	//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>>>>>"+sqlcnt);
  	
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
  	
  	
  	
  	
  	//System.out.println(">>>>>>check >>>"+check);

  	//System.out.println(">>>>>>stg11 >>>"+stg11);

  	//System.out.println(">>>>>>stg22 >>"+stg22);

  	//System.out.println(">>>>>>stg33 >>"+stg33);

  	//System.out.println(">>>>>>stg44 >>"+stg44);
  	
	//System.out.println(">>>>>>closedtot >>"+closedtot);
  
  	

    if(userrole1.equalsIgnoreCase("Manager") || userrole1.equalsIgnoreCase("SuperAdmin"))
    {
  	sqlcnt5="select count(*) as cnt5  from db_gps.t_ticketmastertest where  status in ('AutoClosed','Closed') ";
  	
    }else{
    	
    	
    	sqlcnt5="select count(*) as cnt5  from db_gps.t_ticketmastertest where  status in ('AutoClosed','Closed') and vehid in (select vehiclecode from db_gps.t_vehicledetailscopy where ownername in (select transporter from db_CustomerComplaints.t_asgndtranstoreps where Representative = '"+username+"')) ";
    	
    }
  	
  	ResultSet rs155=cnt6.executeQuery(sqlcnt5);
  	
  //	System.out.println(">>>>>>sqlcnt5 >>"+sqlcnt5);
  	
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


%>

<!--<table  width="750px">-->
<!--	<tr>-->
<!--	-->
<!--	<td>-->
<!--			<font color="maroon" ><b>Counts :&nbsp;</b></font>&nbsp; -->
<!--				-->
<!--			-->
<!--			<b> Open:</b>&nbsp; -->
<!--			-->
<!--			<a href="liveticket.jsp?owner=< %=t11%>&opened=< %=t1 %>" "><blink>< %=open1 %></blink></a>&nbsp;-->
<!--			<b> Close:</b>&nbsp; -->
<!--			-->
<!--			<a href="liveticket.jsp?owner=< %=t22%>&closedtot=< %=t2 %>" "><blink>< %=open %></blink></a>&nbsp;-->
<!--			-->
<!--			<b> Check</b>-->
<!--			<input type ="text" name ="open" value="< %=check %>"  >&nbsp; -->
<!--			-->
<!--			<b> Stage1</b>-->
<!--			<input type ="text" name ="open" value="< %=stg11 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->1
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
<!--			</td>-->
<!--			</tr>-->
<!--	-->
<!--	-->
<!--	</table>-->
	<br>
	<form name="fullfleet1"  method="post" action="" onsubmit="return validate();" >
	
 <%
String exportFileName="AutoticketReportSummary.xls"; 
%>
 <div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           </div>
 <div id="table1">	
 
 <table border="0" width="800px" bgcolor="#77D7D4" align="center">
	<tr>
		<td>
			
			
			
			
			<table border="0" width="100%">
				<tr><td colspan="6" align="center"><font color="black" size="3">Auto Ticket Summary  Report </font></td></tr>
				<tr>
	<td  colspan="8" align="right">
		
		
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=< %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
		
                           <div style="text-align:right;margin-left: 50em;"><!--    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> --> 
      
                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>
                           <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
                           </div>
                           
	</td>
	</tr>	
			</table>
			
			
		</td>
	</tr>
</table>
   


<%
//System.out.println(">>>>>>>33333");


String  sqltt="",sqltt1="",sqltt2="",sqltt3="",sqltt4="",sqltt5="";
String ch="0",stt1="0",stt2="",stt3="",stt4="";


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

%>
	




<!--<table border="0" width="800px" bgcolor="#E6E6E6" align="center">-->
<!--<tr>-->
<!--	<th><b>Sr.</b></th>-->
<!--	<th><b>Contact Name</b></th>-->
<!--	<th><b>Phone</b></th>-->
<!--	<th><b>Mobile</b></th>-->
<!--	<th><b>Designation</b></th>-->
<!--	<th><b>Department</b></th>-->
<!--	<th><b>Email</b></th>-->
<!--	<th><b>Location</b></th>-->
<!--	<th><b>Comment</b></th>-->
<!--<%-->
<!--if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))-->
<!--{ -->
<!--%>-->
<!--	<th>Edit</th>-->
<!--< %	-->
<!--}-->
<!--%>-->
<!--</tr>-->
<!--<%-->
<!--sql1="select * from db_CustomerComplaints.t_recieverinfo where Transporter='"+transporter+"' and ActiveStatus='Yes' ";-->
<!--ResultSet rst2=st.executeQuery(sql1);-->
<!--int a=1;-->
<!--while(rst2.next())-->
<!--{-->
<!--	String rname=rst2.getString("RecieverName");-->
<!--%>-->
<!--<tr bgcolor="#BDBDBD">-->
<!--	<td>< %=a%></td>-->
<!--	<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=< %=rst2.getString("RecieverName")%>&trans=< %=transporter%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><b>< %=rst2.getString("RecieverName")%></b></a></td>-->
<!--	<td>< %=rst2.getString("Phone")%></td>-->
<!--	<td>< %=rst2.getString("Mobile")%></td>-->
<!--	<td>< %=rst2.getString("designation")%></td>-->
<!--	<td>< %=rst2.getString("department")%></td>-->
<!--	<td><a href="mailto:< %=rst2.getString("Email")%>?subject=Vehicle%20Complaints%20"><b>< %=rst2.getString("Email")%></b></a></td>-->
<!--	<td>< %=rst2.getString("PlaceName")%></td>-->
<!--	-->
<!--	<td><a href="javascript: flase" onClick="window.open ('addcall1.jsp?reciever=< %=rname%>&trans=< %=transporter%>&loct=< %=rst2.getString("PlaceName")%>&mob=< %=rst2.getString("Mobile") %>&designation=< %=rst2.getString("designation") %>&check=< %=chk %>&stage1=< %=stg1 %>&stage2=< %=stg2 %>&stage3=< %=stg3 %>&stage4=< %=stg4 %> ', 'win1', ' location=0, menubar=0, scrollbars=yes, status=0, toolbar=0, resizable=0')"><b>Click</b></a></td>-->
<!--<%-->
<!--	if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))-->
<!--	{ -->
<!--%>-->
<!--	<td>  -->
<!--		<a href="javascript: flase" onClick="window.open ('editcontdets.jsp?reciever=< %=rname%>&trans=< %=transporter%>&rid=< %=rst2.getString("Rid") %>',-->
<!--				 'win1', 'width=470, height=300, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')"><b>Edit</b></a>-->
<!--	</td>-->
<!--	<td>  -->
<!--		<a href="javascript: flase" onClick="window.open ('addvehicletouser.jsp?reciever=< %=rname%>&trans=< %=transporter%>&rid=< %=rst2.getString("Rid") %>',-->
<!--				 'win1', 'width=670, height=370, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0')"><b>Add/Delete Vehicle</b></a>-->
<!--	</td>-->
<!--< %	-->
<!--	} -->
<!--%>-->
<!--</tr>-->
<!--<%-->
<!--a++;-->
<!--}-->
<!--%>-->
<!--</table>-->





<br></br>
<!--<table width="750px" border="0" align="center" bgcolor="#77D7D4">-->
<!--	<tr>-->
<!--	<th><font size="2" color="maroon" >Reprovision Summary Report from < %=data%> to  < %=data1%> </font> -->
<!--		-->
<!--		-->
<!--		<a href="excel_reprovision.jsp?month=< %=data%>&year=<  %=data1%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>-->
<!--		-->
<!--                           <div style="text-align:right;margin-left: 50em;">    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img>  -->
<!--      -->
<!--                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">-->
<!--                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>-->
<!--                           < %=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>-->
<!--                           </div>-->
<!--                           -->
<!--		</th>-->
<!--	</tr>	-->
<!--	</table>-->
	
	
	

<table border="1" align="center" style="width:800px " class="sortable" cellspacing="0">
<tr bgcolor="#BDBDBD">
	<th><b>Sr.</b></th>
	<th><b>Transporter</b></th>
	<th><b>ToCheck</b></th>
	<th><b>Stage1Ticket</b></th>
	<th><b>Stage2Ticket</b></th>
	<th><b>Stage3Ticket</b></th>
	<th><b>Stage4Ticket</b></th>
	<th><b>Total</b></th>
<!--	<th><b>Unassigned Vehicles</b></th>-->
	</tr>

<%


int total_chk=0,unassignedveh=0,Totalcnt=0,finalcnt=0,totalcnt=0,totalcnt1=0,totalcnt2=0,totalcnt3=0,totalcnt4=0,chkcnt=0,stg1cnt=0,stg2cnt=0,stg3cnt=0,stg4cnt=0;
String ownrtct="-",tctgry="-",vehid="-";

 int  a=1;
try{

	String swq="select ownername  from db_gps.t_vehicledetails where Status ='-'  group by ownername order by ownername  ";
	ResultSet rst12_new1=st23.executeQuery(swq);
	System.out.println("swq--->"+swq);
	while(rst12_new1.next())
	{
		
		int rstcnt=0;
		
		total_chk=0;
		unassignedveh=0;
		totalcnt=0;
		totalcnt1=0;
		totalcnt2=0;
		totalcnt3=0;
		totalcnt4=0;
		
		String swe="select count(distinct(a.tcategory))  as total  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode  and b.instruction not in('remove','recall')  and b.ownername='"+rst12_new1.getString("ownername")+"' ";
		ResultSet rst12_new11=st9.executeQuery(swe);
		System.out.println("swe--->"+swe);
		if(rst12_new11.next())
		{
			
			rstcnt=rst12_new11.getInt("total");	
			
		}
		System.out.println("NO OF ROWS -in resultset-->"+rstcnt);
		
		
		String newsql="select count(*) as total,a.tcategory as category,b.ownername as ownername,a.vehid as vehid  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode and b.instruction not in('remove','recall') and b.ownername='"+rst12_new1.getString("ownername")+"' group by a.tcategory  ";
		
	// String newsql="select count(*) as total,a.tcategory as category,b.ownername as ownername  from db_gps.t_livetickettest a,db_gps.t_vehicledetails b  where a.vehid=b.vehiclecode  and b.ownername='Agility' group by a.tcategory ";
	ResultSet rst12_new=st9.executeQuery(newsql);
		System.out.println("newsql--->"+newsql);
		if(rst12_new.next())
		{
			
			System.out.println("NO OF ROWS -in resultset-inside loop->"+rstcnt);
			
			//vehid=rst12_new.getString("vehid");
			/*
			String ser="";
			
			 ser="select vehiclecode from db_gps.t_user_vehicles where  VehicleCode='"+vehid+"' ";
			 ResultSet rst12_new22=st6.executeQuery(ser);
			System.out.println("ser--->"+ser);
			if(rst12_new22.next())
			{
				
				
				
			}else{
				
				unassignedveh++;
				
			}
			
			*/
			tctgry=rst12_new.getString("category");
			totalcnt=rst12_new.getInt("total");	
			if(tctgry.equalsIgnoreCase("ToCheck"))
			{
				totalcnt=totalcnt;	
				total_chk=totalcnt;
			}
			if(tctgry.equalsIgnoreCase("Stage1Ticket"))
			{
				totalcnt1=totalcnt;	
				
			}
			if(tctgry.equalsIgnoreCase("Stage2Ticket"))
			{
				totalcnt2=totalcnt;	
				
			}
			if(tctgry.equalsIgnoreCase("Stage3Ticket"))
			{
				totalcnt3=totalcnt;	
				
			}
			if(tctgry.equalsIgnoreCase("Stage4Ticket"))
			{
				totalcnt4=totalcnt;	
				
			}
			
			
			for(int a1=0;a1<rstcnt;a1++)
			{
				
					
				
				tctgry=rst12_new.getString("category");
				totalcnt=rst12_new.getInt("total");	
				System.out.println("category--^^^^^->"+rst12_new.getString("category"));
				if(tctgry.equalsIgnoreCase("ToCheck"))
				{
					totalcnt=totalcnt;
					total_chk=totalcnt;
					
				}
				if(tctgry.equalsIgnoreCase("Stage1Ticket"))
				{
					totalcnt1=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage2Ticket"))
				{
					totalcnt2=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage3Ticket"))
				{
					totalcnt3=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage4Ticket"))
				{
					totalcnt4=totalcnt;	
					
				}
				
				System.out.println("totalcnt1--^^^^^->"+totalcnt1);
				
				if(rst12_new.next()==true)
				{
					
					
				
					
				System.out.println("category--->"+rst12_new.getString("category"));
				
				tctgry=rst12_new.getString("category");
				
				totalcnt=rst12_new.getInt("total");	
				System.out.println("totalcnt--->"+totalcnt);	
				
				if(tctgry.equalsIgnoreCase("ToCheck"))
				{
					totalcnt=totalcnt;
					total_chk=totalcnt;
					
				}
				if(tctgry.equalsIgnoreCase("Stage1Ticket"))
				{
					totalcnt1=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage2Ticket"))
				{
					totalcnt2=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage3Ticket"))
				{
					totalcnt3=totalcnt;	
					
				}
				if(tctgry.equalsIgnoreCase("Stage4Ticket"))
				{
					totalcnt4=totalcnt;	
					
				}
				
				
				}else{
					
					
					
				continue;	
					
				}
				
				
				
				
			}
			
			Totalcnt=total_chk+totalcnt1+totalcnt2+totalcnt3+totalcnt4;
			
			%>
			<tr>
			<td align="right"><b><div  align="right"><%=a%></b></td>
			<td align="left"><b> <div  align="left"><a href="TransCntwisereport.jsp?transporter=<%=rst12_new1.getString("ownername") %>"><%=rst12_new1.getString("ownername")%></a> </div></b></td>
			<td align="right"><b><div  align="right"><%=total_chk%> </div></b></td>
			<td align="right"><b><div  align="right"><%=totalcnt1%> </div></b></td>
			<td align="right"><b><div  align="right"><%=totalcnt2%> </div></td>
			<td align="right"><b><div  align="right"><%=totalcnt3%> </div></b></td>
			<td align="right"><b><div  align="right"><%=totalcnt4%> </div></b></td>
			<td align="right"><b><div  align="right"><%=Totalcnt%> </div></b></td>
<!--			<td><b><div  align="right">< %=unassignedveh%> </div></b></td>-->
			</tr>
			<%
			

		a++;

		
			
		
		
		
		
		
		
		
		
		}
		
		
		
	}
	
}catch(Exception e22)
{
	System.out.println("e33--exception in query ->"+e22);	
	
}	
	



}catch(Exception e22)
{
	System.out.println("e33--exception in query ->"+e22);	
	
}finally{
	
	
	
}



%>

	

</table>
</div>
<%






%>

</form>




<!-- code end here --->

	</div>
	 </div>
	 
<div id="gbox-bot1"> </div></div>
</div>
</div>
</div>

</div>


</body>


<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>



