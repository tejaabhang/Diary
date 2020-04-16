<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5,st50,st51,stQuickTest,stQuickTest1;
String data,data1;
String sql,sql1,sql2,sql3,sql4;
int count=0,count1=0,count2=0,totalcount=0;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Seven Day Diary System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">


<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Complaint Report',
	                        exportOptions: {
	                            modifier: {
	                                page: 'current'
	                            }
	                        }
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Complaint Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Complaint Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Complaint Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Complaint Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
	    	
	    } );
	} );

</script>
	
<script type="text/javascript">
function ShowHide(id)
		{
       // alert(id)
		if(id==0)
			{

			//alert(id+"dispaly complaint id")
			try{
				document.getElementById("compid").style.display="";			
				document.getElementById("daterange").style.display='none';
				document.getElementById("daterange2").style.display='none';

				
				
			}catch(e){
				alert(e);
			}
				
			}
			else if(id==1)
			{
		         // alert(id+"dispaly status")
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display="";
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';
			}
			else if(id==2)
			{
		//		alert(id+"dispaly daterange")
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display="";
				document.getElementById("trans").style.display='none';
				document.getElementById("website1").style.display='none';
			}
			else if(id==3){
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display="";
				//document.getElementById("website1").style.display='none';
			}
			else if(id==4){
				document.getElementById("compid").style.display="none";			
				document.getElementById("daterange").style.display='';
				document.getElementById("daterange2").style.display='';
			}
			else if(id==5){
				//document.getElementById("website1").style.display="";
				document.getElementById("compid").style.display='none';
				document.getElementById("status").style.display='none';
				document.getElementById("daterange").style.display='none';
				document.getElementById("trans").style.display="none";
				
			}else if(id==7){
				//alert("hi inside radio ");
				
				try{
				
				if((document.getElementById("extAll")).checked)
				{
				  // alert("inside if ");
				
				///hiding all the option
				
				//document.getElementById("status1").style.display="";
				//document.getElementById("website").style.display="";
				

				document.getElementById("to").style.display='none';
				document.getElementById("from").style.display='none';
				
				document.getElementById("calender1").style.display='none';
				
				document.getElementById("calender").style.display='none';
				document.getElementById("reg").style.display='none';
				document.getElementById("close").style.display='none';
				document.getElementById("reg1").style.display='none';
				document.getElementById("close1").style.display='none';



				////for newly added options
				document.getElementById("updated_date").style.display='none';
				document.getElementById("resolution_date").style.display='none';

				document.getElementById("updated_date1").style.display='none';
				document.getElementById("resolution_date1").style.display='none';
				
				}else{
					document.getElementById("to").style.display="";
					document.getElementById("from").style.display="";
					document.getElementById("calender1").style.display="";
					
					document.getElementById("calender").style.display="";
					document.getElementById("reg").style.display='';
					document.getElementById("close").style.display='';
					document.getElementById("reg1").style.display='';
					document.getElementById("close1").style.display='';


					document.getElementById("updated_date").style.display='';
					document.getElementById("resolution_date").style.display='';

					document.getElementById("updated_date1").style.display='';
					document.getElementById("resolution_date1").style.display='';
						
	                 
				}
				}catch(e){
					alert(e);
				}

				
			}else if(id==8)
			{
				if((document.getElementById("hide")).checked)
				{

					// alert("hide is been checked  ");
					  // alert("inside if ");
				//document.getElementById("status1").style.display="";
				//document.getElementById("website").style.display="";
				

						document.getElementById("display").style.display='none';

				


				
				}else{

					alert("Else of  hide is been UNchecked  ");

					

					
	                 
				}

			}else if(id==9){
				//alert("hi inside radio of show ");
				
				try{
				
				if((document.getElementById("show")).checked)
				{
				  // alert("show is been checked  ");
//alert("All radio button"+(document.getElementById("radio").checked==false));


//alert("cmpid===="+(document.getElementById("cmpid").checked==false))

    if(document.getElementById("radio").checked==false && document.getElementById("cmpid").checked==false)
    {

//alert("both checkbox are unchecked")
    	//document.getElementById("radio").checked=true;



    }

//alert(document.getElementById("show").checked==false)
if((document.getElementById("show").checked==false))


	{

	//document.getElementById("show").checked=true;
	//document.getElementById("radio").checked=true;


    }
if((document.getElementById("radio").checked==false))


{

//document.getElementById("radio").checked=true;


}                         

					//document.getElementById("status1").style.display="";
				//document.getElementById("website").style.display="";
				
				document.getElementById("display").style.display='';
				

				
	                // alert(">>>>"+document.getElementById("display").style.visibility==true);

				
				}else{

					// alert("ELSE OF  show is been UNchecked  ");
					//document.getElementById("to").style.display='none';


					
				}
				}catch(e){
					alert(e);
				}

				
			}	
			else{
				//alert("hi inside else ");
				// document.getElementById("daterange").style.display="";
				try{
				if((document.getElementById("radio")).checked){
					//alert("inside if ");
				document.getElementById("compid").style.display='none';
				document.getElementById("abc").style.display="";
				document.getElementById("daterange").style.display="";
				//document.getElementById("trans").style.display='none';

				//document.getElementById("compid").style.display='none';
				//document.getElementById("status").style.display="";
				}
				}catch(e)
				{
					alert(e);
				}
				//document.getElementById("daterange").style.display='none';
				//document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';

				
				//document.getElementById("compid").style.display='none';
				//document.getElementById("status").style.display='none';
				//document.getElementById("daterange").style.display='none';
				//document.getElementById("trans").style.display='none';
				//document.getElementById("website1").style.display='none';
			}
		}




function gotoPrint(divName)  
{  
	  
	  var printContents = document.getElementById(divName).innerHTML; 
	  var originalContents = document.body.innerHTML; 
	  document.body.innerHTML = printContents;  
	  window.print();
	  document.body.innerHTML = originalContents;  
}


function gotoExcel(elemId, frmFldId)  
{  
	try{
         
          alert("HI>>>>>>");
    
          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  

          alert("11111");

           
             document.ComplaintsReport.action ="excel.jsp";

          alert("222222");
          document.forms["ComplaintsReport"].submit();
          alert("33333");


           }catch(e){

               alert("exception>>>"+e);


               }

}

function showMenu(id, show) {
	//show menu
	//alert("++id+"+id+"+++show+"+show+"+++");
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}
function hideMenu(id, show) {
	//show menu
	//alert("++id+"+id+"+++show+"+show+"+++");
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "hidden";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "show";
	}
}

function addStatus1(RId) 
{
	//alert(type);
	window.open('RespondFleetViewComplaint.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}
function addStatus2(RId) 
{
	//alert(type);
	window.open('EscalationFleetViewComplaint.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}
function addStatus3(RId) 
{
	//alert(type);
	window.open('AttendFleetViewComplaint.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}

function addStatus7(RId) 
{
	//alert(type);
	window.open('QueuedCmpt.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}

function addStatus4(RId) 
{
	//alert(type);
	window.open('SolveFleetViewComplaint.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}
function addStatus5(RId) 
{
	//alert(type);
	window.open('CloseFleetViewComplaint.jsp?RId='+RId ,'mywindow','width=900, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes,left=50, top=50 ');
}
function addStatus6(RId) 
{
	//alert(type);
	window.open('ComplaintHistoryReport.jsp?RId='+RId ,'mywindow','scrollbars=yes,width=1000,height=500');
}

function toggleDetails(id, show)
{
	var popup = document.getElementById("popup"+id);
	if (show) {
		popup.style.visibility = "visible";
		popup.setfocus();
		
	} else {
		popup.style.visibility = "hidden";
	}
}

function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
	}
}

</script>
<script type="text/javascript">
	function getstatus()
	{
		var CompID=document.getElementById("complaintid").value;
		if(document.getElementById("compid").style.display == "")
		{
		  if(CompID=="")
		   {
		  	 alert("Please Enter The Complaint ID To Show The Complaint.");
		  	 return false;
		   }
		}
		return true;
	}
	/*function Validate()
	{ 
	    
		if(document.getElementById("data").value=="") 
		{
			alert("Please Select The from date.");
			return false;
		}
		if(document.getElementById("data1").value =="")
	  	{
			alert("please select To Date");
			return false;
	  	}  		
			return datevalidate();
		return true;
	}*/
	function validate()
		{

		

		if(document.getElementById("calender").value=="")
			{
		  		alert("Please select the from date");
				return false;
			}
			if(document.getElementById("calender1").value=="")
			{
	  		alert("Please select the to date");
				return false;
			}
			return datevalidate();
	  }
	function datevalidate()
	 {
		 
	 	var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
		dd11=date1.substring(0,2);
		dd22=date2.substring(0,2);
		mm1=date1.substring(3,5);
		mm2=date2.substring(3,5);
		yy11=date1.substring(6,10);
		yy22=date2.substring(6,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(yy11>year || yy22>year)
		{
			alert("selected date should not be greater than todays date");
			return false;
		}
		else if(year==yy11 && year==yy22)
		{
 			if(mm1>month || mm2>month)
			{
				alert("selected date should not be greater than todays date");
				return false;
			}
		}
		if(mm1==month && mm2==month)
		{
			if(dd11>day || dd22>day)
			{
				alert("selected date should not be greater than todays date");
				return false;
			}
		}

		if(yy11 > yy22)
		{
			alert("From date year should not be greater than to date year");
			return false;
		}
		else if(year==yy11 && year==yy22)
		{
			 if(mm1>mm2)
		{
			alert("From date month should not be greater than to date month");
			return false;
		}
		}
		if(mm1==month && mm2==month) 
		{
			if(yy11==yy22)
			{
			if(dd11 > dd22)
			{
				alert("From date should not be greater than to date");
				return false;
			}
			}
		}
		else
			if(yy11<yy22)
			{
				return true;
			}
		else
			if(dd11 > dd22)
		{
				if(mm1<mm2)
				{
					return true;
				}
				
			alert("From date should not be greater than to date");
			return false;
		}
		
		return true;
	}
	/*function datevalidate()
	{
		var date1=document.getElementById("calender").value;
		var date2=document.getElementById("calender1").value;
		var dm1,dd1,dy1,dm2,dd2,dy2;
		dy1=date1.substring(0,4);
		dy2=date2.substring(0,4);
		dm1=date1.substring(5,7);
		dm2=date2.substring(5,7);
		dd1=date1.substring(8,10);
		dd2=date2.substring(8,10);
		var date=new Date();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var year=date.getFullYear();
		if(dy1>year || dy2>year)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;

			return false;
		}
		else if(year==dy1 && year==dy2) if(dm1>month || dm2>month)
		{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}

		if(dm1==month){
			if(dd1>day || dd2>day)
			{
			alert("selected date should not be greater than todays date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
			}
		}
		if(dy1>dy2)
		{
			alert("From date year is should not be greater than to date year");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		
		else if(year==dy1 && year==dy2) if(dm1>dm2)
		{
			alert("From date month is should not be greater than to date month");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		if(dm1==dm2) {
		if(dd1 > dd2)
		{
			alert("From date is should not be greater than to date");
			document.getElementById("data").value="";
			document.getElementById("data1").value="";
			document.getElementById("data").focus;
			return false;
		}
		}
		return true;
	}*/
	function getFTPImage(ftpFile)
	{    // var wbsite="";
		try
		{
			//alert(escape(ftpFile));
			//alert(ftpFile);
			window.open('showFTP.jsp?ftpFile='+ftpFile+'','mywindow','width=500, height=500, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
		}
		catch(e)
		{
			alert(e);
		}
	}
	function AJAXFunc(){
        alert("Hi......");
        {
            //alert("In Fun");
           // var transporter= document.getElementById("transporter").options[document.getElementById("transporter").selectedIndex].value
            //alert(transporter);
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
                           // alert(reslt);   
                         //   document.getElementById("tbvl").innerHTML=reslt;
                           // var z=reslt.split("#");
                          //  document.getElementById("mytable").innerHTML=z[0];
                         //  document.getElementById("fnt").innerHTML=z[0];
                           // var z=reslt.split("#");
                           //alert(z[0]);
                           // //System.out.println(datacode[j]);
                            //b++;
                       	 
                          }
                       
                            catch(e){
                             alert(e);
                             }
                              
                              //alert(reslt);   
                            /*  var mySplitResult =  reslt.split("#");
                              alert(mySplitResult[0]);  
                              var data1= mySplitResult[0];
                              var data2= mySplitResult[1];
                             alert(">>>>>"+data1);
                              var datacode=data1.split(",");
                              var datacode1=data2.split(",");
                               
                             	alert(datacode);
                                 var lt=datacode.length;
                                 var lt1=datacode1.length;*/
                            //   //System.out.println(">>>>>>>."+lt);
                         //  int i;
                         
                             
                            //  alert(datacode.length);
                              //alert(datacode[0]);
                        /*  alert(lt1);
                          var i;
                          
                          for(i=0;i<lt;i++){*/
                         	 
                             // alert(i);
                             // alert(datacode[i]);
                            //  //System.out.println(datacode[i]);
                              //b++;
                         	 
                        /*  }

                          var j;
                          
                          for(j=0;j<lt1;j++){*/
                         	 
                             // alert(i);
                             // alert(datacode1[j]);
                             // //System.out.println(datacode[j]);
                              //b++;
                         	 
                         // }
                         
                              
                         
                       //alert(mySplitResult[1]);  
                             
                               
                             


        				
                      		
                      		
        					
        					
                                
         	       
                    }
                    
          //alert("I m fine");
                    // var queryString = "?transporter="+transporter;
         	 //  ajaxRequest.open("GET", "Ajaxdiary.jsp" );
         	  // ajaxRequest.send(null); 
        }  
	}
</script>

<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
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
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 

<%
try{
	//System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn1.createStatement();
	st1=conn1.createStatement();
    st2=conn1.createStatement();
    st3=conn1.createStatement();
    st4=conn1.createStatement();
    st5=conn1.createStatement();
    st50=conn1.createStatement();
    st51=conn1.createStatement();
    
    Statement cnt1=conn1.createStatement();
    Statement cnt2=conn1.createStatement();
    Statement cnt3=conn1.createStatement();
    Statement cnt4=conn1.createStatement();
    Statement	cnt5=conn1.createStatement();
    Statement cnt6=conn1.createStatement();
    Statement cnt7=conn1.createStatement();
    Statement cnt8=conn1.createStatement();
    
    
    Statement cnt9=conn1.createStatement();
    Statement cnt10=conn1.createStatement();
    Statement cnt11=conn1.createStatement();
    Statement cnt12=conn1.createStatement();
    Statement	cnt13=conn1.createStatement();
    Statement cnt14=conn1.createStatement();
    Statement cnt15=conn1.createStatement();
    Statement cnt16=conn1.createStatement();
    Statement cnt17=conn1.createStatement();
    Statement cnt18=conn1.createStatement();
    Statement cnt19=conn1.createStatement();
    Statement cnt20=conn1.createStatement();
    Statement cnt21=conn1.createStatement();
    Statement cnt22=conn1.createStatement();
    Statement cnt23=conn1.createStatement();
    Statement cnt24=conn1.createStatement();
    Statement cnt25=conn1.createStatement();
    Statement cnt26=conn1.createStatement();
    
    Statement cnt27=conn1.createStatement();
    Statement cnt28=conn1.createStatement();
    Statement cnt29=conn1.createStatement();
    Statement cnt30=conn1.createStatement();
    
    
    
    
    stQuickTest=conn1.createStatement();
    stQuickTest1=conn1.createStatement();
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("dd-MM-yyyy");
    Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
    Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
    String sdt = fmt.format(td);
    data1=request.getParameter("data");
    String complaintid=request.getParameter("complaintid");
    String inputtype=request.getParameter("dataFilter");
    ////System.out.println("----------------------------------------------------------------------???<_>"+inputtype);
   
    
    java.util.Date dte = new java.util.Date();
    Format formatter = new SimpleDateFormat("dd-MM-yyyy");
	String today=formatter.format(dte);
    
	java.util.Date dte1 = new java.util.Date();
    Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String today1=formatter.format(dte);
	
	String dataDate11="";
	DateFormat df12344= new SimpleDateFormat("dd-MM-yyyy");
	DateFormat df123444= new SimpleDateFormat("yyyy-MM-dd");
	dataDate11=df123444.format(df12344.parse(today1));
	
	////System.out.println("dataDate11>>>>"+dataDate11);
     // fromdate=fromdate.parse(new SimpleDateFormat("yyyy-MM-dd"));
   // todate= fmt2.format(todate);
    
  
    if(inputtype==null){
    	
    }
	
	//all form parameters
	
	 String chkbx=request.getParameter("chk");
	 String inputype2=request.getParameter("dataFilter1");
	String fromdate=request.getParameter("calender");
    String todate=request.getParameter("calender1");
	
	String  staus=request.getParameter("status1");
	String  web=request.getParameter("website");
	String  department=request.getParameter("dept");
	String  priority=request.getParameter("priority");
	String  ReportName=request.getParameter("reportname");
   
	System.out.println("Report Name : "+ReportName);
	System.out.println("Priority : "+priority);
    
   	
    
  System.out.println("web>>>>"+web);
	////System.out.println("todate>>>>"+todate);
    
    
    String owner=request.getParameter("owner");
    String  exportFileName="FV_ComplaintsReport.xls";
    //System.out.println("Connection Created");
    //System.out.println("staus>>>> "+staus);
    String status="all";
    String status1="all";
    String status2="";
    
	String dataDate1="",dataDate2="";
	System.out.println(">>>>>today>>>>>"+today);
	String chbxAll=null;
	 String abc=request.getParameter("abc");
	System.out.println("fromdate????>>>>1233333"+fromdate);
	System.out.println("fromdate????>>>>1233333"+todate);

	////System.out.println("abc>>>>1233333"+abc);
	//String fromdate1=formatter.format(fromdate);
	//String todate1=formatter.format(todate);
	 chbxAll=request.getParameter("extAll"); 
	  
	 ////System.out.println("chbxAll>>>>4444444>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+chbxAll);
	// try{
	 ////System.out.println(abc==null);
	  
	//  //System.out.println(chbxAll=="yes" || chbxAll.equalsIgnoreCase("yes") );
	  
 /* if(abc==null){
	 //System.out.println("<<<if loop1111>>>>");
	 chbxAll="akshay";
	 
 }
    if(chbxAll==null){
    	 //System.out.println("<<<null  loop>>>>");
    }else if(chbxAll=="yes" || chbxAll.equalsIgnoreCase("yes")){
	 //System.out.println("<<<else if loop>>>>"+chbxAll);
	 chbxAll="yes";
 }else{
	
	 //System.out.println("<<<else  loop>>>>"+chbxAll);
	// chbxAll=null;
 }
	 }catch(Exception e){
		 e.printStackTrace();
	 }*/
 
	
System.out.println("chbxAll>>>>1233333"+chbxAll);
	if(fromdate!=null && todate!=null){
			fromdate=fromdate.trim();
		    todate=todate.trim();
			////System.out.println("fromdate>>>>"+fromdate);
		   // //System.out.println("todate>>>>"+todate);
		DateFormat df123= new SimpleDateFormat("dd-MM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		dataDate1=df1234.format(df123.parse(fromdate));
		 dataDate2=df1234.format(df123.parse(todate));
		
		
		
		////System.out.println("dataDate1>>>> "+dataDate1);
		////System.out.println("dataDate2>>>> "+dataDate2);
		
		}
		
	
		 String userrole1=session.getAttribute("userrole").toString();
		  	
	
    if(request.getParameter("status1")!=null)
	{
		status=request.getParameter("status1");
	}
    if(request.getParameter("website")!=null)
	{
		status1=request.getParameter("website");
	}
    if(request.getParameter("calender")!=null){
    	status2=request.getParameter("calender");
    	
    }
    
  
    
    int pndng=0,pndngl1=0,pndngl2=0,pndngl3=0,respnd=0,respndl1=0,respndl2=0,respndl3=0,escltd=0,escltdl1=0,escltdl2=0,escltdl3=0,slvd=0,slvdl1=0,slvdl2=0,slvdl3=0,attnd=0,attndl1=0,attndl2=0,attndl3=0,ovrdue=0,ovrduel1=0,ovrduel2=0,ovrduel3=0,clsd=0,clsdl1=0,clsdl2=0,clsdl3=0, nwcmptl1=0,nwcmptl2=0,nwcmptl3=0;
    
  	 try{
 
 
 
 
  		 try{
       String 	sqlcnt="select (select count(*)  from db_gps.t_ComplaintDetail  where status = 'pending') as cnt ,(select count(*)  from db_gps.t_ComplaintDetail  where status = 'Responded') as cnt1,(select count(*)  from db_gps.t_ComplaintDetail  where status = 'Attended') as cnt2,(select count(*)  from db_gps.t_ComplaintDetail  where status = 'Solved') as cnt3,(select count(*) as cnt  from db_gps.t_ComplaintDetail  where status = 'Escalated') cnt4 ,(select count(*)  from db_gps.t_ComplaintDetail  where status = 'Queued') as cnt5,(select count(*) as cnt6  from db_gps.t_ComplaintDetail  where status = 'closed') as cnt6   from db_gps.t_ComplaintDetail limit 1";
 	     	  	
 	ResultSet rs111=cnt1.executeQuery(sqlcnt);
 	
 	System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>!!!!!!>>>>>>>"+sqlcnt);
   
 	if(rs111.next())
 	{
 		
 		pndng=rs111.getInt("cnt");

 		respnd=rs111.getInt("cnt1");
 		attnd=rs111.getInt("cnt2");
 		slvd=rs111.getInt("cnt3");
 		escltd=rs111.getInt("cnt4");
 		ovrdue=rs111.getInt("cnt5");
 		clsd=rs111.getInt("cnt6");
 		
 		
 		
 	}
 	
  		 }catch(Exception e23)

  		 {
  			 
  			//System.out.println(">>>>>>Exception !!!>e23>>>>>>"+e23);
  			 
  		 }
    	
 	

		
 
try{
	 String 	sqlcnt_512="Select (select count(*) as cnt  from db_gps.t_ComplaintDetail  where  TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() )    > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' ) and status = 'closed') as cnt,(select count(*)   from db_gps.t_ComplaintDetail  where TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() )    > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' ) and status = 'closed' ) as cnt1,(select count(*) as cnt2  from db_gps.t_ComplaintDetail  where TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' ) and  status = 'closed') as cnt2  from  db_gps.t_ComplaintDetail limit 1 ;";
	  	
		ResultSet rs111_512=cnt28.executeQuery(sqlcnt_512);
		
		System.out.println(">>>>>>sqlcnt_512@@@@@@@@ >>>>>10000>>>>>"+sqlcnt_512);

		if(rs111_512.next())
		{
			
			clsdl1=rs111_512.getInt("cnt");
			clsdl2=rs111_512.getInt("cnt1");
			clsdl3=rs111_512.getInt("cnt2");
		}
		
		
		
}catch(Exception e30)

	 {
		 
		//System.out.println(">>>>>>Exception !!!>e30>>>>>>"+e30);
		 
	 }
		
 



try{
String newcmpt=" SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending'  ) and TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' )  and status = 'pending' ";
		ResultSet rsq=cnt8.executeQuery(newcmpt);
		System.out.println(">>>>>>newcmpt@@@@@@@ >>>>>>>>>13333>"+newcmpt);
		if(rsq.next())
		{
			
			nwcmptl1=rsq.getInt("cnt");
			
			
		}
		
	
}catch(Exception e33)

	 {
		 
		//System.out.println(">>>>>>Exception !!!>e33>>>>>>"+e33);
		 
	 } 	
		
		



try{
		String newcmpt333=" SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) > ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending'  )  and TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) < ( 	SELECT  TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' ) and status = 'pending' ";
		ResultSet rsq333=cnt22.executeQuery(newcmpt333);
		System.out.println(">>>>>>newcmpt333@@@@@@@ >>>>14444>>>>>>"+newcmpt333);
		if(rsq333.next())
		{
			
			nwcmptl2=rsq333.getInt("cnt");
			
			
		}
		
		
}catch(Exception e34)

	 {
		 
		//System.out.println(">>>>>>Exception !!!>e34>>>>>>"+e34);
		 
	 }
		
		

try{
		
		String newcmpt444="SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) > ( 	SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending'  )  and status = 'pending' ";
		ResultSet rsq444=cnt23.executeQuery(newcmpt444);
		
		System.out.println(">>>>>>newcmpt444@@@@@@@ >>>>>>15555>>>>"+newcmpt444);
		if(rsq444.next())
		{
			
			nwcmptl3=rsq444.getInt("cnt");
			
			
		}
		////System.out.println(">>>>>>newcmpt************************** >>>>>>>>>>"+nwcmptl3);
		
		
		
}catch(Exception e35)

	 {
		 
		//System.out.println(">>>>>>Exception !!!>e35>>>>>>"+e35);
		 
	 }	
		
		try{
		String newcmpt1=" Select (SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' ) and status = 'Responded') as cnt, (SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() )  > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' ) and status = 'Responded') as cnt1,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE  TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' ) and status = 'Responded') as cnt2  FROM db_gps.t_ComplaintDetail limit 1;";
		ResultSet rsq1=cnt9.executeQuery(newcmpt1);
		////System.out.println(">>>>>>newcmpt1@@@@@@@ >>>>>>>166666>>>"+newcmpt1);
		if(rsq1.next())
		{
			
			respndl1=rsq1.getInt("cnt");
			respndl2=rsq1.getInt("cnt1");
			respndl3=rsq1.getInt("cnt2");
		}
		
		
		
		
		}catch(Exception e36)

 		 {
 			 
 			//System.out.println(">>>>>>Exception !!!>e36>>>>>>"+e36);
 			 
 		 }
		
		

		try{
		
		String newcmpt4=" select ( SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated'  ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated'  ) and status = 'Escalated') as cnt,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated'  ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated' ) and status = 'Escalated') as cnt1,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated'  ) and status = 'Escalated') as cnt2  from db_gps.t_complaintdetail limit 1";
		ResultSet rsq4=cnt12.executeQuery(newcmpt4);
		////System.out.println(">>>>>>newcmpt4@@@@@@@ >>>>>>>>>>"+newcmpt4);
		if(rsq4.next())
		{
			
			escltdl1=rsq4.getInt("cnt");
			escltdl2=rsq4.getInt("cnt1");
			escltdl3=rsq4.getInt("cnt2");
		}
	
		}catch(Exception e39)

 		 {
 			 
 			//System.out.println(">>>>>>Exception !!!>e39>>>>>>"+e39);
 			 
 		 }
	
		
		
		
		
	
		
		
		try{
		String newcmpt7=" Select (SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and status = 'Attended') as cnt,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' )  and  TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and status = 'Attended') as cnt1,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and status = 'Attended') as cnt2   FROM db_gps.t_ComplaintDetail limit 1";
		ResultSet rsq7=cnt15.executeQuery(newcmpt7);
		////System.out.println(">>>>>>newcmpt7@@@@@@@ >>>>>>>>>>"+newcmpt7);
		
		
		if(rsq7.next())
		{
			
			attndl1=rsq7.getInt("cnt");
			attndl2=rsq7.getInt("cnt1");
			attndl3=rsq7.getInt("cnt2");
			
			
		}
		
		}catch(Exception e42)

 		 {
 			 
 			//System.out.println(">>>>>>Exception !!!>e42>>>>>>"+e42);
 			 
 		 }
		

		
		try{
		String newcmpt10="Select (SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and status = 'Queued') as cnt,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' ) and status = 'Queued') as cnt1,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' ) and status = 'Queued') as cnt2 from db_gps.t_ComplaintDetail limit 1";
		ResultSet rsq10=cnt17.executeQuery(newcmpt10);
		////System.out.println(">>>>>>newcmpt10@@@@@@@ >>>>>>>>>>"+newcmpt10);
		
		
		if(rsq10.next())
		{
			
			ovrduel1=rsq10.getInt("cnt");
			ovrduel2=rsq10.getInt("cnt1");
			ovrduel3=rsq10.getInt("cnt2");
			
		}
		
		
		}catch(Exception e45)

		 {
			 
			//System.out.println(">>>>>>Exception !!!>e45>>>>>>"+e45);
			 
		 }
		
		
		
		
		
		try{
		
		String newcmpt13=" Select (SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' )  and status = 'Solved') as cnt, ( SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and status = 'Solved' ) as cnt1,(SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( SELECT TimeDiffL3 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and status = 'Solved' ) as cnt2  from db_gps.t_ComplaintDetail limit 1 ; ";
		ResultSet rsq13=cnt20.executeQuery(newcmpt13);
		////System.out.println(">>>>>>newcmpt13@@@@@@@ >>>>>>>>>>"+newcmpt13);
		
		if(rsq13.next())
		{
			
			slvdl1=rsq13.getInt("cnt");
			slvdl2=rsq13.getInt("cnt1");
			slvdl3=rsq13.getInt("cnt2");
			
		}
		}catch(Exception e48)

		 {
			 

			 
		 }
		
		

		
		
		
		
		
		
  	 }catch(Exception e12)
  	 {
  		 
  		 
  		//System.out.println(">>>>>Exception>>>in COUNT QUERY>>>>"+e12);
  		 
  	 }
		
	
  	
  	String a="Pending",b="Responded",c="Attended",d="Solved",e="Escalated",g="Queued",l="Closed",nwl1="NewCmpL1",nwl2="NewCmpL2",nwl3="NewCmpL3",rspndl1="RspndL1",rspndl2="RspndL2",rspndl3="RspndL3",esltdl1="EscL1",esltdl2="EscL2",esltdl3="EscL3",attnl1="AttndL1",attnl2="AttndL2",attnl3="AttndL3",quedl1="QuedL1",quedl2="QuedL2",quedl3="QuedL3",svdl1="solvL1",svdl2="solvL2",svdl3="solvL3",cldl1="ClsdL1",cldl2="ClsdL2",cldl3="ClsdL3" ;
  	 
%>



<table  width="750px">
	<tr>
	
	<td>
			<font color="maroon" ><b>Counts :&nbsp;</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				
			
			<b> New:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=a%>&opened=<%=pndng %>" "><font color="red" size="2"  style="size:5em"> <%=pndng %></font>  </a>&nbsp;&nbsp;
		
					
				<b> Responded:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=b%>&closedtot=<%=respnd %>" "> <font color="red" size="2" > <%=respnd %> </font> </a>&nbsp;&nbsp;&nbsp;
			
			
			<b> Escalated:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=e%>&closedtot=<%=escltd %>" "><font color="red" size="2" > <%=escltd %> </font> </a>&nbsp;&nbsp;
			
			
			<b> Attended:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=c%>&closedtot=<%=attnd %>" "><font color="red" size="2">  <%=attnd %></font> </a>&nbsp;&nbsp;&nbsp;
			
			
			<b> Queued:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=g%>&closedtot=<%=g %>" "><font color="red" size="2"> <%=ovrdue %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Solved:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=d%>&closedtot=<%=slvd %>" "> <font color="red" size="2"> <%=slvd %></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Closed:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=l%>&closedtot=<%=l %>" "> <font color="red" size="2"> <%=clsd %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
			</td>
			</tr>
	<tr>
	
	<td>
			<font color="maroon" ><b>Overdue L1 :&nbsp;</b></font>&nbsp; 
				
			
			<b> New:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=nwl1%>&opened=<%=pndng %>" "> <font color="red" size="2"  style="size:5em"> <%=nwcmptl1 %></font>  </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
			
			
			<b> Responded:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=rspndl1%>&closedtot=<%=respnd %>" "> <font color="red" size="2" > <%=respndl1 %> </font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
				<b> Escalated:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=esltdl1%>&closedtot=<%=escltd %>" "> <font color="red" size="2" > <%=escltdl1 %> </font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
				
			
			
			
			<b> Attended:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=attnl1%>&closedtot=<%=attnd %>" "> <font color="red" size="2">  <%=attndl1 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Queued:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=quedl1%>&closedtot=<%=g %>" "> <font color="red" size="2"> <%=ovrduel1 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Solved:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=svdl1%>&closedtot=<%=slvd %>" "> <font color="red" size="2"> <%=slvdl1 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Closed:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=cldl1%>&closedtot=<%=l %>" "> <font color="red" size="2"> <%=clsdl1 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
			</td>
			</tr>
			
			<tr>
	
	<td>
			<font color="maroon" ><b>Overdue L2 :&nbsp;</b></font>&nbsp; 
				
			
			<b> New:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=nwl2%>&opened=<%=pndng %>" "><font color="red" size="2"  style="size:5em"> <%=nwcmptl2 %></font>  </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
			
			
			<b> Responded:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=rspndl2%>&closedtot=<%=respnd %>" "> <font color="red" size="2" > <%=respndl2 %> </font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			
				<b> Escalated:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=esltdl2%>&closedtot=<%=escltd %>" "> <font color="red" size="2" > <%=escltdl2 %> </font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
				
			
			
			
			<b> Attended:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=attnl2%>&closedtot=<%=attnd %>" "> <font color="red" size="2">  <%=attndl2 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Queued:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=quedl2%>&closedtot=<%=g %>" "> <font color="red" size="2"> <%=ovrduel2 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Solved:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=svdl2%>&closedtot=<%=slvd %>" "> <font color="red" size="2"> <%=slvdl2 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Closed:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=cldl2%>&closedtot=<%=l %>" "> <font color="red" size="2"> <%=clsdl2 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
			</td>
			</tr>
			
			<tr>
	
	<td>
			<font color="maroon" ><b>Overdue L3 :&nbsp;</b></font>&nbsp; 
				
			
			<b> New:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=nwl3%>&opened=<%=pndng %>" "> <font color="red" size="2"  style="size:5em"> <%=nwcmptl3 %></font>  </a>&nbsp;&nbsp;
		
			
			
			<b> Responded:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=rspndl3%>&closedtot=<%=respnd %>" "> <font color="red" size="2" > <%=respndl3 %> </font> </a>&nbsp;&nbsp;&nbsp;
			
			
				<b> Escalated:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=esltdl3%>&closedtot=<%=escltd %>" "> <font color="red" size="2" > <%=escltdl3 %> </font> </a>&nbsp;&nbsp;
			
			
				
			
			
			
			<b> Attended:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=attnl3%>&closedtot=<%=attnd %>" "> <font color="red" size="2">  <%=attndl3 %></font> </a>&nbsp;&nbsp;&nbsp;
			
			
			<b> Queued:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=quedl3%>&closedtot=<%=g %>" "> <font color="red" size="2"> <%=ovrduel3 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Solved:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=svdl3%>&closedtot=<%=slvd %>" ">  <font color="red" size="2"> <%=slvdl3 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<b> Closed:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=cldl3%>&closedtot=<%=l %>" "> <font color="red" size="2"> <%=clsdl3 %></font> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
			</td>
			</tr>
	
	</table>
	<br>


<table border="0" width="1060px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Complaint Report</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<form name="unit" method="post" onsubmit="return validate();" >
  
     
      
<!--      <table>-->
<!--      <tr>-->
<!--      -->
<!--      <td colspan="4"> -->
<!--				-->
<!--				<input type="radio"  id="show" name="dataFilter" value="compid1" checked-->
<!--				 onClick="ShowHide(9);"><font color="black" size="2">show</font>	-->
<!--				<input type="radio"   id="hide" name="dataFilter" value="All"  checked-->
<!--				   onClick="ShowHide(8);"   > <font color="black" size="2" >Hide</font>	-->
<!--			  	<input type="" name="dataFilter" value="status1" -->
<!--				 onClick="ShowHide(1);"> <font color="black" size="2">Website</font>	-->
<!--				 <input type="" name="dataFilter" value="daterange1" -->
<!--				 onClick="ShowHide(2);"> <font color="black" size="2">Date Range</font> -->
<!--			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--			</td>-->
<!--      </tr>-->
<!--      -->
<!--      </table>-->
      
      <%
      //System.out.println("inputype2******************>>>> "+inputype2);
      %>
      
<!--      <div style="display: none" id ="display"> -->
      
       <table border="0" width="1060px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
		   <td colspan="6"> 
				
				<input type="radio" name="dataFilter" value="compid1"  id="cmpid"
				 onClick="ShowHide(0);"><font color="black" size="2">Complaint ID</font>	
				<input type="radio" name="dataFilter" value="All" id="radio"  checked
				   onClick="ShowHide(4);"  > <font color="black" size="2" >All</font>	
			<!--  	<input type="" name="dataFilter" value="status1" 
				 onClick="ShowHide(1);"> <font color="black" size="2">Website</font>	
				 <input type="" name="dataFilter" value="daterange1" 
				 onClick="ShowHide(2);"> <font color="black" size="2">Date Range</font> -->
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			</td>
			</tr>
			<tr><td></td></tr>
			        
			         <tr id="daterange"  style=""  bgcolor="#BDBDBD"> 
			         <td  width="40px" id="chk" name="chk"><div> <input type="checkbox" name="extAll" value="yes"  id="extAll"
				   onClick="ShowHide(7);" > <font color="black" size="2" >All</font></div></td></div>
				   
				  <%
				  if(inputype2!=null)
				  {
					  
					 if(inputype2.equalsIgnoreCase("registration_date"))
					 {%>
						 
						<td>
				   <input type="radio" name="dataFilter1" value="registration_date" id="reg" checked
				 onClick="ShowHide(10);">
				 <font color="black" size="2" id="reg1">Registration Date</font></td>
						 
					 <%}else{
						%> 
						 <td>
				   <input type="radio" name="dataFilter1" value="registration_date" id="reg"  onClick="ShowHide(10);">
				 <font color="black" size="2" id="reg1">Registration Date</font></td>
						 
					 <%}
					  
					  
					 if(inputype2.equalsIgnoreCase("clouser_date"))
					 {%>
						 
						 <td style="width:92px ">
				 
				 <input type="radio" name="dataFilter1" value="clouser_date" id="close"  checked
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="close1" >Closure Date</font></td>
						 
					 <%}else{
						%> 
						 <td style="width:92px ">
				 
				 <input type="radio" name="dataFilter1" value="clouser_date" id="close" 
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="close1" >Closure Date</font></td>
						 
					 <%} 
					 
					 
					 if(inputype2.equalsIgnoreCase("updated_date"))
					 {%>
						 
						 <td>
				   
				   <input type="radio" name="dataFilter1" value="updated_date" id="updated_date" checked
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="updated_date1" >Updated Date</font></td>
						 
					 <%}else{
						%> 
						 <td>
				   
				   <input type="radio" name="dataFilter1" value="updated_date" id="updated_date" 
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="updated_date1" >Updated Date</font></td>
						 
					 <%}
					 
					 
					 
					 if(inputype2.equalsIgnoreCase("resolution_date"))
					 {%>
						 
						<td>
				   
				   <input type="radio" name="dataFilter1" value="resolution_date" id="resolution_date"  checked
				   onClick="ShowHide(11);" > 
				   
				   <font color="black" size="2" id="resolution_date1" >Resolution Date</font></td>
						 
					 <%}else{
						%> 
						<td>
				   
				   <input type="radio" name="dataFilter1" value="resolution_date" id="resolution_date"  
				   onClick="ShowHide(11);" > 
				   
				   <font color="black" size="2" id="resolution_date1" >Resolution Date</font></td>
					 <%}
					 
					 
					 
					 
					  
					  
					  
				  }else{
					  %>
					   <td>
				   <input type="radio" name="dataFilter1" value="registration_date" id="reg" checked
				 onClick="ShowHide(10);">
				 <font color="black" size="2" id="reg1">Registration Date</font></td>
				
				
				   <td style="width:92px ">
				 
				 <input type="radio" name="dataFilter1" value="clouser_date" id="close" 
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="close1" >Closure Date</font></td>
				   
				   
				   <td>
				   
				   <input type="radio" name="dataFilter1" value="updated_date" id="updated_date" 
				   onClick="ShowHide(11);" > 
				   
				   
				   <font color="black" size="2" id="updated_date1" >Updated Date</font></td>
				   
				   
				   <td>
				   
				   <input type="radio" name="dataFilter1" value="resolution_date" id="resolution_date" 
				   onClick="ShowHide(11);" > 
				   
				   <font color="black" size="2" id="resolution_date1" >Resolution Date</font></td>
					  
				  <%}
				  
				  %> 
				   
				   
				  
				   
				   
				   
			         
			         <td width="668px" id="frmdt" ><font color="black" size="2" id="from"><b>&nbsp;&nbsp;From :</b> </font>
					<input type="text" id="calender" name="calender" size="07" value="<%if(fromdate==null){ %><%=sdt%><%}else{%><%=fromdate%> <%}%>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly/>
               	    <script type="text/javascript">
		               Calendar.setup(
		               {
		                    inputField  : "calender",         // ID of the input field
		                    ifFormat    : "%d-%m-%Y",     // the date format
		                    button      : "calender"       // ID of the button
		               }
		                             );
	          	    </script>
					&nbsp;
					
				<font color="black" size="2" id="to"><b>To :</b> </font>
					<input type="text" id="calender1" name="calender1" size="07" value="<%if(todate==null){ %><%=sdt%><%}else{%><%=todate%> <%}%>" style="width: 70px; height: 12px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly/>
              		 <script type="text/javascript">
			               Calendar.setup(
			               {
			                    inputField  : "calender1",         // ID of the input field
			                    ifFormat    : "%d-%m-%Y",     // the date format
			                    button      : "calender1"       // ID of the button
			               }
			                             );
              		 </script>
		</td></tr>
<!--		<tr><td></td></tr>-->
		<tr id="daterange2">                    	 
		<td width="275px" id="abc"><font color="black" size="2" id="st"><b>Status:&nbsp;</b></font>
	           <select name="status1" id="status1" onchange="formsubmitt();" style="width: 102px; " >
	           				
	           				
	           				<%
	           				if(status!=null)
	           				{
	           					
	           					
	           					if(status.equalsIgnoreCase("All"))       				
	           					{%>
	           						
	           						<option value="All" selected>All</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="All" ">All</option>
	           						
	           					<%}
	           					
	           					if(status.equalsIgnoreCase("open"))       				
	           					{%>
	           						
	           						<option value="open" selected >Open</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="open" >Open</option>
	           						
	           					<%}
	           					
	           					
	           					if(status.equalsIgnoreCase("pending"))       				
	           					{%>
	           						
	           						<option value="pending" selected >Pending</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="pending" >Pending</option>
	           						
	           					<%}
	           					
	           					
	           					if(status.equalsIgnoreCase("Responded"))       				
	           					{%>
	           						
	           						<option value="Responded" selected >Responded</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Responded" >Responded</option>
	           						
	           					<%}
	           					
	           					
	           					if(status.equalsIgnoreCase("Attended"))       				
	           					{%>
	           						
	           						<option value="open" selected >Attended</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Attended" >Attended</option>
	           						
	           					<%}
	           					
	           					
	           					if(status.equalsIgnoreCase("Queued"))       				
	           					{%>
	           						
	           						<option value="Queued" selected>Queued</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Queued" ">Queued</option>
	           						
	           					<%}
	           					
	           					
	           					
	           					if(status.equalsIgnoreCase("Escalated"))       				
	           					{%>
	           						
	           						<option value="Escalated" selected >Escalated</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Escalated" >Escalated</option>
	           						
	           					<%}
	           					
	           					if(status.equalsIgnoreCase("Solved"))       				
	           					{%>
	           						
	           						<option value="Solved" selected >Solved</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Solved" >Solved</option>
	           						
	           					<%}
	           					
	           					
	           					if(status.equalsIgnoreCase("Closed"))       				
	           					{%>
	           						
	           						<option value="Closed" selected >Closed</option>
	           						
	           					<%}else{
	           						%>
	           							<option value="Closed" >Closed</option>
	           						
	           					<%}
	           					
	           					
	           					
	           					
	           					
	           					
	           					
	           					
	           				}else{
	           					%>
	           					
	           					<option value="All" selected>All</option>
							
							<option value="All" ">All</option>
							<option value="open" >Open</option>
                        	<option value="pending" >Pending</option>
                        	<option value="Responded"  >Responded</option>
                        	<option value="Attended"  >Attended</option>
                        	<option value="Escalated" >Escalated</option>
                        	<option value="Queued" >Queued</option>
						    <option value="Solved" ">Solved</option>
						    <option value="Closed">Closed</option>
	           				          				          				
	           					
	           				<%}
	           				
	           				%>
	           				
								
						                       	 
                        	  </select></td>
	      <td width="320px">  <font color="black" size="2" id="w"><b>Website: &nbsp;</b></font>
	             <select name="website" id="website" onchange="formsubmitt();" style="width: 130px">
						
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
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("Global ERP"))       				
	   					{%>
	   						
	   						<option value="Global ERP" selected >Global ERP</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="Global ERP" >Global ERP</option>
	   						
	   					<%}
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("Transworld"))       				
   					{%>
   						
   						<option value="Transworld" selected >Transworld</option>
   						
   					<%}else{
   						%>
   							<option value="Transworld" >Transworld</option>
   						
   					<%}
			    	  
			    	  if(web.equalsIgnoreCase("Safe And Secure"))       				
	   					{%>
	   						
	   						<option value="Safe And Secure" selected >Safe And Secure</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="Safe And Secure" >Safe And Secure</option>
	   						
	   					<%}
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("Diary"))       				
	   					{%>
	   						
	   						<option value="Diary" selected >Diary</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="Diary" >Diary</option>
	   						
	   					<%}
			    	  
			    	  if(web.equalsIgnoreCase("SmartGrid"))       				
	   					{%>
	   						
	   						<option value="SmartGrid" selected >SmartGrid</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="SmartGrid" >SmartGrid</option>
	   						
	   					<%}
			    	  
			    	  
			    	  
			    	  if(web.equalsIgnoreCase("DragOnDroid"))       				
	   					{%>
	   						
	   						<option value="DragOnDroid" selected >DragOnDroid</option>
	   						
	   					<%}else{
	   						%>
	   							<option value="DragOnDroid" >DragOnDroid</option>
	   						
	   					<%}
			    	  
			    	  
			    	  
			    	  
			      }else{
			    	 
			    	  //System.out.println("********ELSe oF WEB***********>>>>>");
			    	  
			    	  %>
			    	  
			    	 <option value="All" selected >All</option>
						<option value="FleetView" >FleetView</option>
						<option value="ERP" >ERP</option> 
						<option value="Global ERP">Global ERP</option>
						<option value="Transworld" >Transworld</option> 
						<option value="Safe And Secure" >Safe And Secure</option>
						<option value="Diary" >Diary System</option>  
						<option value="SmartGrid" >SmartGrid</option>
			    	  						<option value="DragOnDroid" >DragOnDroid</option>  
			    	  
			    	  
			     <%}
			      
			     
			      //System.out.println("----********--------------department----->"+department);
			      %>			
						
						
	        	
	        	
	        	
	        	</select></td>
	        	
	        <td width="310px">	<font color="black" size="2" id="de"><b>Dept:&nbsp;</b></font>
	             <select name="dept" id="dept" onchange="formsubmitt();" style="width: 145px">
						
						<%
						if(department!=null)
						{%>
							
							<option value="All" selected" <% if(status.equals("all")){ %>Selected<% } %>>All</option>	
							
						<%}else{
						%>	
							
							<option value="All" selected" <% if(status.equals("all")){ %>Selected<% } %>>All</option>	
					<%}
						%>
						
						
						<%
						String query50 = "select distinct(DeptName) from db_leaveapplication.t_department where (status='Active') or (status='active')order by DeptName"; 
			//String query50 = "select distinct(DeptName) from db_leaveapplication.t_department order by RId";
             ResultSet rs50 = st50.executeQuery(query50);
             //System.out.println("----********----inside while --->");
             while(rs50.next())
              {
            	  //System.out.println("----********----inside while --->");
            	
            	  
            	  if(department!=null)
            	  { 
            	  
            	  if(department==rs50.getString("DeptName") || department.equalsIgnoreCase(rs50.getString("DeptName")))
            	 {
            		 //System.out.println("----********----inside if --->");
  
  %>
			
			
			<option value="<%=rs50.getString("DeptName") %>" selected="selected"><%=rs50.getString("DeptName")%></option>
			
			
			
			<%
            	 }else{%>
            		 
            		 <option value="<%=rs50.getString("DeptName") %>"><%=rs50.getString("DeptName")%></option>
            		 
            		 
            	 <%}
              
            	  
            	  }else{
            		  
            		  %>
          			
          			
          			<option value="<%=rs50.getString("DeptName") %>"><%=rs50.getString("DeptName")%></option>
          			
          			
          			
          			<% 
            		  
            		  
            		  
            		  
            	  }
            	  
              
              } %>
	        	</select></td>
	        <td width="310px">	<font color="black" size="2" id="p"><b>Priority: &nbsp;&nbsp;</b></font>
	             <select name="priority" id="priority" onchange="formsubmitt();" style="width: 85px">
						
						
						<%
						if(priority!=null)
						{
							
							 if(priority.equalsIgnoreCase("All"))       				
			   					{%>
			   						
			   						<option value="All" selected >All</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="All" >All</option>
			   						
			   					<%}	
							
							 
							 if(priority.equalsIgnoreCase("Low"))       				
			   					{%>
			   						
			   						<option value="Low" selected >Low</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="Low" >Low</option>
			   						
			   					<%}	
							 
							 
							 if(priority.equalsIgnoreCase("High"))       				
			   					{%>
			   						
			   						<option value="High" selected >High</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="High" >High</option>
			   						
			   					<%}	
							 
							 
							
							
						}else{
							%>
							
						<option value="All" selected>All</option>
						<option value="Low" >Low</option>
						<option value="High" >High</option>	
							
						<%}
						
						%>        	
	        	</select>
	       </td>
	       	    <td width="310px">	<font color="black" size="2" id="p"><b>Report Name: &nbsp;&nbsp;</b></font>
	             <select name="reportname" id="reportname" onchange="formsubmitt();" style="width: 100px">
						
							<%
						if(ReportName!=null)
						{
							
							 if(ReportName.equalsIgnoreCase("All"))       				
			   					{%>
			   						
			   						<option value="All" selected >All</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="All" >All</option>
			   						
			   					<%}	
							
							 
							 if(ReportName.equalsIgnoreCase("Manual"))       				
			   					{%>
			   						
			   						<option value="Manual" selected >Manual</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="Manual" >Manual</option>
			   						
			   					<%}	
							 
							 
							 if(ReportName.equalsIgnoreCase("AutoTicket"))       				
			   					{%>
			   						
			   						<option value="AutoTicket" selected >AutoTicket</option>
			   						
			   					<%}else{
			   						%>
			   							<option value="AutoTicket" >AutoTicket</option>
			   						
			   					<%}	
							 
							 
							
							
						}else{
							%>
							
						
						<option value="All" selected>All</option>
						<option value="Manual" >Manual</option>
						<option value="AutoTicket" >AutoTicket</option>
							
						<%}
						
						%> 
						
						
	        	</select>
	       </td>
	       
	       <td width="250px">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="submit" id="submit" value="submit" onclick="return getstatus();"/>   </td>
		</tr>
		
		<tr id="closedate"  bgcolor="#BDBDBD">
		
			</tr>
			<tr><td></td></tr>
			
			
	                <tr id="compid" style="display:none" bgcolor="#BDBDBD"> 
	        <td><font color="black" size="2"><b>Complaint ID: &nbsp;&nbsp;</b></font>
	             <input type="text" name="complaintid" id="complaintid">&nbsp;
	             <input type="submit" name="complaintid" id="complaintid" value ="submit" onclick="return getstatus();">
	             &nbsp; &nbsp; &nbsp;<b>Enter Multiple Complaint ID's With Comma Seperation</b>
	             <!--  <select name="complaintid" id="complaintid" onchange="formsubmitt();">
						<option value="Select">Select</option>
						
	        	</select>
	        	 -->
	        </td>
	    </tr>	 
                      	 	
                        
                        
                        	
                        	
	        
	       	 
	    
	    
	    <!-- 
	    <tr>
			<td align="center" colspan="2">
			        <input type="submit" name="submit" id="submit" value="submit" />
			</td>
			 -->
		
	</table>
	
<!--	</div>-->
        
    </form>   
        
        
      
	
		
	
	
	
	
	

<%

 
//System.out.println(">>>>>>chbxAll >>>>>>>>>>"+chbxAll);

String dd=request.getQueryString();
//System.out.println(">>>>>>dd >>>>>>>>>>"+dd);





%>
<br></br>
			 <table border="0" width="780px" bgcolor="#77D7D4" align="center">
			<!--  	<tr>
					<td  align="center" class="sorttable_nosort">
						<div id="report_heding"><font color="black" size="3">Mail History Report for Token &nbsp;<%=data1%></font></div>
						<div align="right">
						<a href="Sendmailreportexcel.jsp?dataFilter=<%=inputtype%>&calender=<%=fromdate%>&calender1=<%=todate%>" title="Export to Excel">
						<img src="images/excel.jpg" width="15px" height="15px" border="0"/></a>
						<font color="black" size="2"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
						</font></div>
					</td>
				</tr>
				-->
			</table>
		
<%                   
                 
                        ////System.out.println("------------------output up to here----------------------------sb------>");
                       // //System.out.println("------------------complaint Id----->"+complaintid);
                       // //System.out.println("------------------inputtype----->"+inputtype);
                        
                       // //System.out.println("------------------chbxAll----->"+chbxAll);
                       // //System.out.println("------------------inputype2----->"+inputype2);                       
                       // //System.out.println("------------------fromdate----->"+fromdate);
                        ////System.out.println("------------------today----->"+today);
                        ////System.out.println("------------------todate----->"+todate);
                        ////System.out.println("------------------dataDate1----->"+dataDate1);
                        ////System.out.println("------------------dataDate2----->"+dataDate2);
                        ////System.out.println("------------------staus----->"+staus);
                        ////System.out.println("------------------web----->"+web);
                        ////System.out.println("------------------department----->"+department);
                        ////System.out.println("------------------priority----->"+priority);
                        
                        
                        if(inputtype==null) {
                        	//default query on loading of page
                        	////System.out.println("********1*********inside the default query>>displaying all pending record");
                        	
                   //     	sql="select * from t_ComplaintDetail where Status='pending' order by ComplaintDateTime asc";
                   //     	sql1="select * from t_ComplaintDetail where Status='pending' order by ComplaintDateTime asc";
              String fr=sdt;
		 		fr=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(fr));
		 		String to=sdt;
		 		to=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(to));
 		 		
		 		
                   			sql="select * from t_ComplaintDetail where Status<>'Closed' and ComplaintDateTime between '"+fr+" 00:00:00' and '"+to+" 23:59:59' order by ComplaintDateTime asc";
                        	sql1="select * from t_ComplaintDetail where Status<>'Closed' order by ComplaintDateTime asc";
                        	//System.out.println("the default query is :"+sql);
                        	
                        }
                        else if(inputtype=="compid1" || inputtype.equalsIgnoreCase("compid1")) {
                        	//code for particular complaint
                        	////System.out.println("********2***********inside the complaint specific query>>>displaying record for a particular complaints");
                        	
                        	sql="select * from t_ComplaintDetail where  ComplaintID in ("+complaintid+") order by ComplaintDateTime asc";
                        	sql1="select * from t_ComplaintDetail where ComplaintID in ("+complaintid+") order by ComplaintDateTime asc";
                        	//System.out.println("the default query is :"+sql);
                        	
                        }else if(inputtype=="All" || inputtype.equalsIgnoreCase("All")) {
                        	//code for filters
                        	////System.out.println("********3***********inside the filter>>>>displaying accr to filters");
                        	
                        				if(chbxAll==null) {
                        					//checkbox is null means display date in query
                        							if(inputype2=="registration_date" || inputype2.equalsIgnoreCase("registration_date")) {
                        								// display records with registration dates
                        								
                        								//System.out.println("inside registration_date loop   :");
                        								
                        										String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                        					
                        										if((staus=="All" || staus.equalsIgnoreCase("All")) && (web=="All" || web.equalsIgnoreCase("All")) && (department=="All" || department.equalsIgnoreCase("All")) && (priority=="All" || priority.equalsIgnoreCase("All")) && (ReportName=="All" || ReportName.equalsIgnoreCase("All"))  ) {
                        										//System.out.println("inside if of registration date");                       									
                        										sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
                        										sql1="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
                        					
                        				 						}else{
                        					
                        				
                        													if(!(staus.equalsIgnoreCase("All"))) {
                        														
                        															if(staus.equalsIgnoreCase("Open")) {
                        																str1=" Status<>'Closed' AND ";
                        																str=str.concat(str1);
                        																}else {
                        																	str1=" Status='"+staus+"' AND ";
                        																	str=str.concat(str1);   
                        																}
                        						 							}
                        						 							if(!(web.equalsIgnoreCase("All"))) {
                        														str2="Website='"+web+"' AND ";
                        														str =str.concat(str2);
                        						 							}
                        						 							if(!(department.equalsIgnoreCase("All"))) {
                        														str3="EscalatedDept='"+department+"' AND ";
                        														str =str.concat(str3);
                        						  							}
                        						  							if(!(priority.equalsIgnoreCase("All"))) {
                        														str4="Priority='"+priority+"' AND ";
                        														str =str.concat(str4);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("AutoTicket"))) {
                        														str5="ReportName='AutoTicket' AND ";
                        														str =str.concat(str5);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("Manual"))) {
                        														str6="ReportName not like '%AutoTicket%' AND ";
                        														str =str.concat(str6);
                        						  							}
                        						  	
                        					
                        													System.out.println("the concat string is :"+str);                       				                       				                      						
                        				    								sql="select * from t_ComplaintDetail where "+str+" ComplaintDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
                        				    								sql1="select * from t_ComplaintDetail where "+str+" ComplaintDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
                        				    								//System.out.println("the query is :"+sql);  
                        						
                        											}
                        								
                        								
                        								
                        								
                        							}else if (inputype2=="updated_date" || inputype2.equalsIgnoreCase("updated_date"))
                        							{
                        								

                        								// display records with registration dates
                        								
                        								//System.out.println("inside registration_date loop   :");
                        								
                        										String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                        					
                        										if((staus=="All" || staus.equalsIgnoreCase("All")) && (web=="All" || web.equalsIgnoreCase("All")) && (department=="All" || department.equalsIgnoreCase("All")) && (priority=="All" || priority.equalsIgnoreCase("All")) && (ReportName=="All" || ReportName.equalsIgnoreCase("All"))) {
                        										//System.out.println("inside if of registration date");                       									
                        										sql="select * from t_ComplaintDetail where UpdatedDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        										sql1="select * from t_ComplaintDetail where UpdatedDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        					
                        				 						}else{
                        				
                        													if(!(staus.equalsIgnoreCase("All"))) {
                        														
                        															if(staus.equalsIgnoreCase("Open")) {
                        																str1=" Status<>'Closed' AND ";
                        																str=str.concat(str1);
                        																}else {
                        																	str1=" Status='"+staus+"' AND ";
                        																	str=str.concat(str1);   
                        																}
                        						 							}
                        						 							if(!(web.equalsIgnoreCase("All"))) {
                        														str2="Website='"+web+"' AND ";
                        														str =str.concat(str2);
                        						 							}
                        						 							if(!(department.equalsIgnoreCase("All"))) {
                        														str3="EscalatedDept='"+department+"' AND ";
                        														str =str.concat(str3);
                        						  							}
                        						  							if(!(priority.equalsIgnoreCase("All"))) {
                        														str4="Priority='"+priority+"' AND ";
                        														str =str.concat(str4);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("AutoTicket"))) {
                        														str5="ReportName='AutoTicket' AND ";
                        														str =str.concat(str5);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("Manual"))) {
                        														str6="ReportName not like '%AutoTicket%' AND ";
                        														str =str.concat(str6);
                        						  							}
                        						  	
                        					
                        													//System.out.println("the concat string is :"+str);                       				                       				                      						
                        				    								sql="select * from t_ComplaintDetail where "+str+" UpdatedDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        				    								sql1="select * from t_ComplaintDetail where "+str+" UpdatedDateTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        				    								//System.out.println("the query is :"+sql);  
                        						
                        											}
                        								
                        								
                        								
                        								
                        								
                        								
                        							}
                        							else if (inputype2=="resolution_date" || inputype2.equalsIgnoreCase("resolution_date"))
                        							{

                        								

                        								// display records with registration dates
                        								
                        								//System.out.println("inside registration_date loop   :");
                        								
                        										String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                        					
                        										if((staus=="All" || staus.equalsIgnoreCase("All")) && (web=="All" || web.equalsIgnoreCase("All")) && (department=="All" || department.equalsIgnoreCase("All")) && (priority=="All" || priority.equalsIgnoreCase("All")) && (ReportName=="All" || ReportName.equalsIgnoreCase("All"))) {
                        										//System.out.println("inside if of registration date");                       									
                        										sql="select * from t_ComplaintDetail where ComplaintResolutionTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintResolutionTime asc";
                        										sql1="select * from t_ComplaintDetail where ComplaintResolutionTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintResolutionTime asc";
                        					
                        				 						}else{
                        					
                        				
                        													if(!(staus.equalsIgnoreCase("All"))) {
                        														
                        															if(staus.equalsIgnoreCase("Open")) {
                        																str1=" Status<>'Closed' AND ";
                        																str=str.concat(str1);
                        																}else {
                        																	str1=" Status='"+staus+"' AND ";
                        																	str=str.concat(str1);   
                        																}
                        						 							}
                        						 							if(!(web.equalsIgnoreCase("All"))) {
                        														str2="Website='"+web+"' AND ";
                        														str =str.concat(str2);
                        						 							}
                        						 							if(!(department.equalsIgnoreCase("All"))) {
                        														str3="EscalatedDept='"+department+"' AND ";
                        														str =str.concat(str3);
                        						  							}
                        						  							if(!(priority.equalsIgnoreCase("All"))) {
                        														str4="Priority='"+priority+"' AND ";
                        														str =str.concat(str4);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("AutoTicket"))) {
                        														str5="ReportName='AutoTicket' AND ";
                        														str =str.concat(str5);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("Manual"))) {
                        														str6="ReportName not like '%AutoTicket%' AND ";
                        														str =str.concat(str6);
                        						  							}
                        						  	
                        					
                        													//System.out.println("the concat string is :"+str);                       				                       				                      						
                        				    								sql="select * from t_ComplaintDetail where "+str+" ComplaintResolutionTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintResolutionTime asc";
                        				    								sql1="select * from t_ComplaintDetail where "+str+" ComplaintResolutionTime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by ComplaintResolutionTime asc";
                        				    								//System.out.println("the query is :"+sql);  
                        						
                        											}
                        								
                        								
                        								
                        								
                        								
                        								
                        							
                        							}
                        							else{
                        								//display records with closure date
                        								String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                        					
                        										if((web=="All" || web.equalsIgnoreCase("All")) && (department=="All" || department.equalsIgnoreCase("All")) && (priority=="All" || priority.equalsIgnoreCase("All")) && (ReportName=="All" || ReportName.equalsIgnoreCase("All")) ) {
                        										sql="select * from t_ComplaintDetail where Closeddatetime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        										sql1="select * from t_ComplaintDetail where Closeddatetime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        					
                        					
                        				 						}else{                        					                        			                      													
                        				 									if(!(web.equalsIgnoreCase("All"))) {
                        														str2="Website='"+web+"' AND ";
                        														str =str.concat(str2);
                        						 							}
                        				 									if(!(department.equalsIgnoreCase("All"))) {
                        														str3="EscalatedDept='"+department+"' AND ";
                        														str =str.concat(str3);
                        						  							}
                        				 									if(!(priority.equalsIgnoreCase("All"))) {
                        														str4="Priority='"+priority+"' AND ";
                        														str =str.concat(str4);
                        						  							}
                        				 									if((ReportName.equalsIgnoreCase("AutoTicket"))) {
                        														str5="ReportName='AutoTicket' AND ";
                        														str =str.concat(str5);
                        						  							}
                        						  							if((ReportName.equalsIgnoreCase("Manual"))) {
                        														str6="ReportName not like '%AutoTicket%' AND ";
                        														str =str.concat(str6);
                        						  							}
                        						  	
                        					
                        													//System.out.println("the concat string is :"+str);                       				                       				                      						
                        				    								sql="select * from t_ComplaintDetail where "+str+" Closeddatetime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        				    								sql1="select * from t_ComplaintDetail where "+str+" Closeddatetime between '"+dataDate1+" 00:00:00' AND '"+dataDate2+" 23:59:59' order by UpdatedDateTime asc";
                        					
                        						
                        											}
                        							}
                        					
                        				}else {
                        					//checkbox id yes means dont display date in query
                        					////System.out.println("The value of check box is yes it will not display date");
                        					
                        					String str="",str1="",str2="",str3="",str4="",str5="",str6="";
                        					
                        					if((staus=="ALL" || staus.equalsIgnoreCase("All")) && (web=="All" || web.equalsIgnoreCase("All")) && (department=="All" || department.equalsIgnoreCase("All")) && (priority=="All" || priority.equalsIgnoreCase("All"))  && (ReportName=="All" || ReportName.equalsIgnoreCase("All"))) {
                        					sql="select * from t_ComplaintDetail order by UpdatedDateTime asc";
                        					sql1="select * from t_ComplaintDetail order by UpdatedDateTime asc";
                        					
                        					
                        				 }else{
                        					
                        				
                        					 	if(!(staus.equalsIgnoreCase("All"))) {
                        					 		if(staus.equalsIgnoreCase("Open")) {
														str1=" Status<>'Closed' AND";
														str=str.concat(str1);
														}else {
															str1=" Status='"+staus+"' AND";
															str=str.concat(str1);   
														}   
                        						 }
                        					 	if(!(web.equalsIgnoreCase("All"))) {
                        							str2=" Website='"+web+"' AND";
                        							str =str.concat(str2);
                        						 }
                        					 	if(!(department.equalsIgnoreCase("All"))) {
                        							str3=" EscalatedDept='"+department+"' AND";
                        							str =str.concat(str3);
                        						  }
                        					 	if(!(priority.equalsIgnoreCase("All"))) {
                        							str4=" Priority='"+priority+"' AND";
                        							str =str.concat(str4);
                        						  }
                        					 	if((ReportName.equalsIgnoreCase("AutoTicket"))) {
													str5="ReportName='AutoTicket' AND ";
													str =str.concat(str5);
					  							}
					  							if((ReportName.equalsIgnoreCase("Manual"))) {
													str6="ReportName not like '%AutoTicket%' AND ";
													str =str.concat(str6);
					  							}
          									
          									
                        					 	//System.out.println("the concat string is :"+str); 
                        					 	
                        						  String substr=str.substring(str.lastIndexOf(' ') + 1);
                        						  //System.out.println("The substring is :"+substr);
                        						  if(substr=="AND" || substr.equalsIgnoreCase("AND")) {
                        							str = str.substring(0,str.lastIndexOf(" "))+" ";
                        						  }
                        						//System.out.println("Aftr alter AND the new string is :"+str);

                        					
                        					                      				                       				                      						
                        				    sql="select * from t_ComplaintDetail where "+str+" order by UpdatedDateTime asc";
                        				    sql1="select * from t_ComplaintDetail where "+str+" order by UpdatedDateTime asc";
                        					System.out.println("Sql Query : "+sql);
                        						
                        					}
                        				}
                        }
               
                        try{
                     	   
                            sql4="select count(*) as totalcount from t_ComplaintDetail";
                            ////System.out.println("The string  is  :"+sql4);
                            ResultSet rs20=stQuickTest.executeQuery(sql4);
                            while(rs20.next()) {
                            	totalcount=rs20.getInt("totalcount");
                            }
                           
                            //System.out.println("The number of count is  :"+totalcount);
                         	   
                            }catch(Exception e10) {
                         	   //System.out.println("the exception is :"+e10);
                         	   e10.printStackTrace();
                            }
                        
                        
                        //for count means number of records in table according to the filters
                       try{
                    	   
                       sql1=sql1.replace("*"," count(*) as count ");
                      // //System.out.println("The string  is *********** :"+sql1);
                       ResultSet rs12=stQuickTest.executeQuery(sql1);
                       while(rs12.next()) {
                    	   count=rs12.getInt("count");
                       }
                      
                       ////System.out.println("The number of count is  :"+count);
                    	   
                       }catch(Exception e10) {
                    	   //System.out.println("the exception is :"+e10);
                    	   e10.printStackTrace();
                       }
                      
                       //for count1 means number of all open complaints of all status but not close
                       try{
                    	 
                    	  // //System.out.println("**************555****");
                    	   
                           sql2="select count(*) as count1 from t_ComplaintDetail where Status<>'Pending'";      
                           ResultSet rs13=stQuickTest.executeQuery(sql2);
                           //System.out.println("The string  is  :"+sql2);
                           while(rs13.next()) {
                        	   count1=rs13.getInt("count1");
                           }
                          
                          // //System.out.println("The number of count1 is  :"+count1);
                        	   
                           }catch(Exception e11) {
                        	   //System.out.println("the exception is :"+e11);
                        	   e11.printStackTrace();
                           }
                      //for count2 means number of all closed complaints     
                           try{
                        	   
                        	   sql3="select count(*) as count2 from t_ComplaintDetail where Status='Pending'";
                               //System.out.println("The string  is  :"+sql3);
                               ResultSet rs14=stQuickTest.executeQuery(sql3);
                               while(rs14.next()) {
                            	   count2=rs14.getInt("count2");
                               }
                              
                               //System.out.println("The number of count2 is  :"+count2);
                            	   
                               }catch(Exception e12) {
                            	   //System.out.println("the exception is :"+e12);
                            	   e12.printStackTrace();
                               }
    
       
                        ResultSet rst1=stQuickTest.executeQuery(sql);
                        System.out.println("----------------------------------------------sb------>"+sql);
                        int i=1;

                     //   //System.out.println("chbxAll>>>>"+chbxAll);
                        
                       
%>


	
	





<form id="ComplaintsReport" name="ComplaintsReport" action="" method="post">
<div id="table1"> 
<% 

if(inputtype==null) {
	////System.out.println("---1------>");
	%>
<!--	<table border="0" bgcolor="white" width="1200px">-->
<!--	<tr><td style="font-size: 15px"><b>Total Complaints :</b>&nbsp;&nbsp;< %=totalcount%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total open complaints :</b>&nbsp;< %=count1%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total closed complaints :</b>&nbsp;< %=count2%></td></tr>-->
<!--	<tr><td style="font-size: 15px"><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Status :</b>&nbsp;Open&nbsp;&nbsp;||&nbsp;&nbsp;<b>Website :</b>&nbsp;All&nbsp;&nbsp;||&nbsp;&nbsp;<b>Department :</b>&nbsp;All&nbsp;&nbsp;||&nbsp;&nbsp;<b>Priority :</b>&nbsp;All&nbsp;&nbsp;||&nbsp;&nbsp;<b>Registration Date :</b>&nbsp;All</td></tr>-->
<!--	<tr><td style="font-size: 15px"><b>Report Result :</b>&nbsp;&nbsp;< %=count%></td></tr>-->
<!--	</table> -->
	
	<%
}
else if(inputtype=="compid1" || inputtype.equalsIgnoreCase("compid1")) {
	////System.out.println("---2------>");
	%>
<!--	<table border="0" bgcolor="white" width="1200px">-->
<!--		<tr><td style="font-size: 15px"><b>Total Complaints :</b>&nbsp;&nbsp;<%=totalcount%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total open complaints :</b>&nbsp;<%=count1%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total closed complaints :</b>&nbsp;<%=count2%></td></tr>-->
<!--		<tr><td style="font-size: 15px"><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Complaint ID :</b>&nbsp;<%=complaintid%></td></tr>-->
<!--		<tr><td style="font-size: 15px"><b>Report Result :</b>&nbsp;&nbsp;<%=count%></td></tr>-->
<!--	</table>-->
	 <%
}
else if(inputtype=="All" || inputtype.equalsIgnoreCase("All")) { 
	////System.out.println("---3------>");
					if(chbxAll==null)
					{////System.out.println("---4------>");
						// display dates
						if(inputype2=="registration_date" || inputype2.equalsIgnoreCase("registration_date"))
						{//System.out.println("---5------>");
							//all filters with reg date
							%>
<!--							<table border="0" bgcolor="white" width="1200px">-->
<!--							<tr><td style="font-size: 15px"><b>Total Complaints :</b>&nbsp;&nbsp;< %=totalcount%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total open complaints :</b>&nbsp;< %=count1%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total closed complaints :</b>&nbsp;< %=count2%></td></tr>-->
<!--							<tr><td style="font-size: 15px"><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Status :</b>&nbsp;<%=staus%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Website :</b>&nbsp;<%=web%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Department :</b>&nbsp;< %=department%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Priority :</b>&nbsp;< %=priority%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Registration From :</b>&nbsp;< %=fromdate%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Registration To :&nbsp;</b>< %=todate%></td></tr>-->
<!--							<tr><td style="font-size: 15px"><b>Report Result :</b>&nbsp;&nbsp;<%=count%></td></tr>-->
<!--							</table> -->
							<%
						}
						else
						{////System.out.println("---6------>");
						//all filter with closure date and without status	
							%>
							
<!--							<table border="0" bgcolor="white" width="1200px">-->
<!--							<tr><td style="font-size: 15px"><b>Total Complaints :</b>&nbsp;&nbsp;< %=totalcount%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total open complaints :</b>&nbsp;< %=count1%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total closed complaints :</b>&nbsp;< %=count2%></td></tr>-->
<!--							<tr><td style="font-size: 15px"><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Website :</b>&nbsp;< %=web%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Department :</b>&nbsp;< %=department%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Priority :</b>&nbsp;< %=priority%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Closure From :</b>&nbsp;< %=fromdate%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Closure To :&nbsp;</b>< %=todate%></td></tr>							-->
<!--							<tr><td style="font-size: 15px"><b>Report Result :</b>&nbsp;&nbsp;< %=count%></td></tr>-->
<!--							</table> -->
							
							<%
							
						}
					
						
					}
					else
					{////System.out.println("---7------>");
						//all filter without date
						%>
<!--						<table border="0" bgcolor="white" width="1200px">-->
<!--						<tr><td style="font-size: 15px"><b>Total Complaints :</b>&nbsp;&nbsp;< %=totalcount%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total open complaints :</b>&nbsp;< %=count1%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Total closed complaints :</b>&nbsp;< %=count2%></td></tr>-->
<!--						<tr><td style="font-size: 15px"><b>Selected Filters :</b>&nbsp;&nbsp;&nbsp;<b>Status :</b>&nbsp;< %=staus%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Website :</b>&nbsp;< %=web%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Department :</b>&nbsp;< %=department%>&nbsp;&nbsp;||&nbsp;&nbsp;<b>Priority :</b>&nbsp;< %=priority%></td></tr>-->
<!--						<tr><td style="font-size: 15px"><b>Report Result :</b>&nbsp;&nbsp;< %=count%></td></tr>-->
<!--						</table>-->
						
						 <%
					}

	
	
	
}




%>


<%
	
	 String exportFileName1="ComplaintReport.xls";  
	
	
	
	
	%>
	
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName1%>" /> 
     
                           </div>
	


<table  border="0" bgcolor="white" width="750px">


	<tr>
		<td>
	 <table width=100%>
			<tr>
					<td id="excel"><div align="right">
                    <a href="excelFleetViewComplaintReport.jsp?checkbox=<%=request.getParameter("extAll")%>&abc=<%=abc%>&website=<%=web%>&dept=<%=department%>&priority=<%=priority%>&dataFilter1=<%=inputype2%>&dataFilter=<%=inputtype%>&calender=<%=fromdate%>&calender1=<%=todate%>&Status=<%=staus%>&complaintid=<%=complaintid%>&website=<%=web%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
<!--                    <div style="text-align:right;margin-left: 50em;">    <img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img>  -->
<!--      -->
<!--                           <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">-->
<!--                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a>-->
<!--                           -->
<!--                           < %=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>-->
<!--                           </div>-->
                    
                    </div></td>
			</tr>
		</table> 
		<div id="mytable">

			<table  id="example" border="1" width="750px" class=sortable style="background: #E8EEF7">
			<thead>
		
				<tr bgcolor="#BDBDBD">
				
					<td ><b> Sr.</b></td>
					<td style="width: 5px;"><b>CompID</b></td>
					<td><b>EntryDateTime</b></td>
					           			<td><b>Transporter</b></td>
					
					<td><b>Name</b> </td>
					<td style="width: 200px;"><b>EmailID</b></td>
					<td><b>Contact</b></td>
				    <td><b>Category</b></td>
           			<td><b>SubCategory</b></td>			
					<td><b>Report Name</b> </td>
           			<td style="width: 250px;"><b>Description</b></td>
					<td><b>VehicleNo</b></td>
           			<td><b>VehOwner</b></td>
           			           			<td style="width: 300px;"><b>Date</b></td>
           			
           			<td><b>Status</b></td>
           			<td><b>Department</b></td>
           			
           			<td><b>ResolutionDate&Time</b></td>
           								<td><b>UpdatedDate&Time</b></td>
           			
           			<td><b>Website</b> </td>
           			<td><b>Priority</b></td>
					<td><b>Closed Date</b></td>
					<td><b>ClosedBy</b></td>
					<td><b>Closing Comment</b></td>
					<td style="width: 200px;"><b>FileName</b></td>
					
					
					</tr>
					</thead>
					<tbody>
                      <% while(rst1.next())
                         {
                        String File=rst1.getString("filename");
                        String wbsite="";
    				    wbsite= rst1.getString("Website");
                       // int filelt=File.length();
                         File=File+",";
                       String   File1=File.substring(File.lastIndexOf("/")+1,File.length());
                       //File1=File1+",";
                       // //System.out.println("---file------>"+File1);
                        String[] token=File1.split(",");
                        String[] token1=File.split(",");
                        ////System.out.println("*****   token *****     "+token[0]);
                        for(int k=0; k<token.length; k++)
                    	{
                    		////System.out.println("*****    "+k+"  ********     "+token[k]);
                    		////System.out.println("*****    length ********     "+token.length);
                    		////System.out.println("*****    file ********     "+File);
                    	}
                        
                        
                       // //System.out.println("---filelt------>"+filelt);
                        
                       String vehnno="",trans="";
                       
                        System.out.println("Veh Details :- "+rst1.getString("ComplaintID"));
						String vehdetails="select * from t_ComplaintVehDetail where ComplaintID='"+rst1.getString("ComplaintID")+"'";
						ResultSet rst10=stQuickTest1.executeQuery(vehdetails);
						
						System.out.println("Veh Details :- "+vehdetails);
						if(!rst10.next())
						{
							vehnno="-";
							trans="-";
							
							System.out.println("Veh no:- "+vehnno+" trans :- "+trans);
						}
						 else
						{
							
							 vehnno=rst10.getString("VehRegNo");
							trans=rst10.getString("OwnerName");
													} 
                       
                       %>	
				<tr>
                    <td colspan="1"><div align="right"><%=i%></div></td>
                    <td colspan="1" style="width: 10px;">
                    <div align="right">
                    <%
				    if(rst1.getString("Status").contains("Pending") || rst1.getString("Status").contains("Responded") || rst1.getString("Status").contains("Escalated") || rst1.getString("Status").contains("Attended") || rst1.getString("Status").contains("Solved") ||  rst1.getString("Status").contains("Queued"))
					{
					                 %>
                    <a href="#" onmouseover="showMenu(<%=i%>,true);" onmouseout="hideMenu(<%=i%>,true);"><%=rst1.getString("ComplaintID")%>
                    <div class="popup" id="popup<%=i%>">
						<table border="1" style="background: #E8EEF7" cellpedding=4 class=mytable onmouseover="showMenu(<%=i%>,true);" onmouseout="hideMenu(<%=i%>,true);">
							
								
							<tr style="width: 10px"><td><a href="#" onclick="addStatus1('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Respond</a></td></tr>
					        <tr style="width: 10px"> <td><a href="#" onclick="addStatus2('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Escalate</a></td></tr>
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus5('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Close</a></td></tr>
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus3('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Attend(Dept)</a></td></tr>
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus7('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Queue</a></td></tr>
					        
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus4('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">Solve(Dept)</a></td></tr>
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus6('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">CompHistory</a></td></tr>
					                    
								
							
						</table>
				    </div>
				    </a>
				    </div>
				    <%}else{ 
				    	%>
	                    <a href="#" onmouseover="showMenu(<%=i%>,true);" onmouseout="hideMenu(<%=i%>,true);"><%=rst1.getString("ComplaintID")%>
                    <div class="popup" id="popup<%=i%>">
						<table border="1" cellpedding=4 class=mytable onmouseover="showMenu(<%=i%>,true);" onmouseout="hideMenu(<%=i%>,true);">
					        <tr style="width: 10px"><td><a href="#" onclick="addStatus6('<%=rst1.getString("ComplaintID")%>');toggleDetails(<%=i%>,false);">CompHistory</a></td></tr>
						</table>
				    </div>
				    </a>
				    </div>
				   <%} %>
				    </td>
				 <%
				 String cdt=rst1.getString("ComplaintDateTime");
				 if(cdt==null){ 
					 %> <td colspan="1"><div align="left">-</div></td> <%
				 }else {
					%> <td colspan="1"><div align="right"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("ComplaintDateTime")))%></div></td> <%
				 }
				 
				 %>
				 	 	<% 
					String blockcust=" select * from db_gps.t_usermessage where UserTypeValue='"+rst1.getString("Transporter")+"' and MessageID in (4,5)";
					System.out.println("Block Query :-"+blockcust);
					ResultSet rsblockcust=st5.executeQuery(blockcust);
					
					if(!rsblockcust.next())
					{
						
						System.out.println("in block if ");
						%>
						<td colspan="1"><div align="left"><%=rst1.getString("Transporter")%></div></td>
						
						<% 
					}
					else
					{
						
						System.out.println("in else");
					%>
					<td colspan="1" > <div align="left"><font  color=red><%=rst1.getString("Transporter")%></font></div></td>
					<% 
					}
					%>
				 					<td colspan="1"><div align="left" style="overflow: auto;" ><%=rst1.getString("Name")%></div></td>
				 					<td colspan="1"><div align="left" style="overflow: auto; width: 200px;height: 50px"><%=rst1.getString("Email1")%></div></td>
				 					<td colspan="1"><div align="right"><%=rst1.getString("ContactNumber")%></div></td>
				 					<td colspan="1"><div align="left"><%=rst1.getString("Category")%></div></td>
										<td colspan="1"><div align="left"><%=rst1.getString("SubCategory")%></div></td>
				 					<td colspan="1"><div align="left"><%=rst1.getString("ReportName")%></div></td>
				 					<td colspan="1"><div align="left" style="overflow: auto; width: 250px;height: 50px"><%=rst1.getString("Description")%></div></td>
				 <td colspan="1"><div align="left"><%=vehnno%></div></td>
					<td colspan="1"><div align="left"><%=trans%></div></td>
					
					<%
					String Datet=rst1.getString("Date");
										
						if(Datet.equals("Select"))
						{
							Datet="-";
						}
					
					
					%>
									 	<td colspan="1"><div align="left"><%=Datet%></div></td>
					
									 	<td colspan="1"><div align="left"><%=rst1.getString("Status") %></div></td>
					<%
				 	String de=rst1.getString("EscalatedDept");
				 	if(de==null){ 
						 %> <td colspan="1"><div align="left">-</div></td> <%
					 }else {
						%> <td colspan="1"><div align="left"><%=rst1.getString("EscalatedDept") %></div></td>   <%
					 }
				 	%> 		
			
				 	
				 	<%
				 	if(rst1.getString("ComplaintResolutionTime")!=null)
				 	{%>
				 		<td colspan="1"><div align="right" ><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("ComplaintResolutionTime")))%></div></td>
				 		
				 	<%}else{
				 		%>
				 		
				 		<td colspan="1"><div alig
				 		n="center">- </div> </td>
				 	<%}
				 	%>
				 					 	<td colspan="1"><div align="right"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("UpdatedDateTime")))%></div></td>
				 	
				 	
				 	
				 	
				 		 	
					
					
					
					
					
					
					<td colspan="1"><div align="left"><%=wbsite%></div></td>
					<td colspan="1"><div align="left"><%=rst1.getString("Priority")%></div></td>
					<%
					String dt =rst1.getString("Closeddatetime");
					////System.out.println("---------------------------->"+dt);
					if(dt == null)
					{
				    %>
				    <td colspan="1"><div align="left">-</div></td>
				    <%
					}
					else
					{
					%>
	
						<td colspan="1"><div align="left"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("Closeddatetime")))%></div></td>
					<%
					}
					%>
					<td colspan="1"><div align="left"><%=rst1.getString("ClosedBy")%></div></td>
					<td colspan="1"><div align="left" style="overflow: auto; width: 200px;height: 50px"><%=rst1.getString("ClosingComment")%></div></td>
					
					
					
						 
						 <td colspan="1" >
						 
						 <%
						// //System.out.println("********output up to here...... ****");
						 for(int k=0; k<token.length; k++)
                	{    
							             	
							System.out.println("************token     "+token[k]);
							// //System.out.println("************token1    "+token1[k]);
                	%>
						 <div align="left" style="overflow: auto; width: 150px;height: 50px">
	 <a href=Downloadtaskattachment.jsp?filename=<%=File1%> target="_blank"><%=File1%></a>
				<% %>
				      <%--   <a href="#" onclick="getFTPImage('<%=token[k]+","+wbsite%>')">
						<%=token[k]%></a> --%>
						</div>
					
						<%
						// //System.out.println("************token     "+token[k]+","+wbsite);		
                	}
							 
					
						 %>
					
						 </td>
					                            
                                
                </tr>
                        <%
                          i++;
                          }
                        
                         %>
                     </tbody>
                        </table>
			

                        <br>
                        <br>
<%

   }catch (NullPointerException e)
{
	   //System.out.println("bar.couldReturnNull() returned null");
	   e.printStackTrace();
	}
finally
{
    conn.close();
    conn1.close();
}

%>
<!-- <table width="750px" height="350px">
	<tr>
		<td></td>
	</tr>
</table>
 -->
<!-- code end here ---></div>
</td></tr></table>



</div>
</form>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>
</div>


<script>
//alert("hi");

//alert("***1111***"+((document.getElementById("hide")).checked));
//alert("***2222***"+((document.getElementById("show")).checked));



//try{
//if(document.getElementById("hide").checked==false && document.getElementById("show").checked==false)
//{

	//alert("both radio buttons are UNCHECKED");
	//document.getElementById("hide").checked=true;
	//document.getElementById("radio").checked=true;
	//alert("got the value")
	
//}
//if(document.getElementById("show").checked==true)/
//{
	//alert("show   radio buttons is UNCHECKED");
	//document.getElementById("radio").checked=true;
//}
//}catch(e){alert(">>>>"+e);}




//AJAXFunc();
    </script>

</body>

<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</html>
