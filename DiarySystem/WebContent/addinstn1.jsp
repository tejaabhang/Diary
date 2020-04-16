<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5;
String sql,sql1,sql2,sql3,sql4,sql5;
int total,updated,dealy,disconnected,notactive,transid;
%>



<html>
<head>

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
<%@ include file="header1.jsp"%></div>
<div id="gbox1">
<div id="gbox-top1"></div>
<div id="gbox-bg1">
<div id="gbox-grd1"><script type="text/javascript">


           function enable()
           {
           	document.getElementById("transporter").disabled=false;
           	alert("inside enable");
           	//System.out.println("inside ENABLE");
           }


       function checkbox()
       {
           try{
    	   var k= document.getElementsByName("chkbx");
    	   var cnt=0;
    	   var i=1;
    	  // alert(">>>>>"+k.length);
          // var p=k.length;
            // alert(p);
             if(document.getElementById("fst").checked)
             {try{
            	 for( cnt=0;cnt<k.length;cnt++)
            	 {
            		 try{
                	// alert("><><><><>");
            		 document.getElementById("ab"+i).checked=true;
            		 
            		 }catch(e){

                      alert(e);
            		 }
            		 i++;
            	 }
             }catch(e){
                     alert(e);
                 }
             
             }else
                 
             {
   
            	 for( cnt=0;cnt<k.length;cnt++)
            	 {
            		 try{
                	// alert("><><><><>");
            			 
                    	 document.getElementById("ab"+i).checked=false;
            		 
            		 }catch(e){

                      alert(e);
            		 }
            		 i++;
            	 }

                 
            	 
                 
             }
             
           }catch(e){
               alert(e);
           }    
  	     
       }
       
       

           
          function hiddenfield()
          {

         try{
     	     var z=document.getElementById("instruction").value;
  // alert(">>>>>"+z);
     if(z=="select" || z=="other")
     {
  
          //alert("inside 1");
    	 document.getElementById("txt").style.display="";
 
    	 
     }else
     {
    	 document.getElementById("txt").style.display="none";
    	 //alert("inside 2");
     }

             

         }catch(e){

           alert(e);
         }

          }


           
          function mycheckbox()
          {
        	try{
               // var p="";
            	//var p=document.getElementById("ab"+i).value;
            	//alert(p);
        	  var e= document.getElementsByName("chkbx");
        	  var z=e.length;
        	  //alert(z);
        	 // alert("@@@@@@@@@@@@@  "+e.length);
        	  var cnt=0;
              var a="";
                var b;
                var d;
               var i=1;
        	  for( cnt=0;cnt<e.length;cnt++)
        	  {
            	  try
            	  {
        	    //if(document.addinstn.elements("ab"+i).name=="chkbx"){
               try{   
               if((document.getElementById("ab"+i)).checked){
                  
                   a=a+","+document.getElementById("ab"+i).value;

                     }
				
				 }catch(e){
                alert("Exception--------->"+e);
               }
        	    //}
               
        	    i++;
            	  }
            	  catch(e)
            	  {
                	  alert("Exception-----^^^^^---->"+e);
            	  }
        	    }
        	  
        	//  alert("@@@@@@@"+q);          
        	//  alert("111111111"+d);
        	try{
        	 // c=document.getElementById("xyz").value; 
				b=document.getElementById("instruction").value;
      	  
      	  if(b=="select" || b=="other" )
            {
             	d=document.getElementById("txt").value;
            }
            else
                {
         	   d=document.getElementById("instruction").value;
               
            		}
        	}catch(e)
        	{
            	alert(e);
        	}
              // alert(d);
              try{
              //alert(">>>>hi11111" +a+"  8888888     "+d);
        	//  window.location="addcontent.jsp?a="+a+"&d="+d;
        	//alert(a);
        //	alert(d);
            
            var q=a.substring(1,a.length);
           // alert("@@@@@@@"+q);  
             //  alert("###########"+q);
        	//var q=p.replace(",");
           
           
         // alert(q);
          // var dss=document.getElemnentById("transporter").options[document.getElemnentById("transporter").selectedIndex].value;
           //alert(document.getElementById('transporter').options[document.getElementById('transporter').selectedIndex].value);
           //alert(dss);
        	if(q=="" || q==null)
        	{
        		 alert("Please select atleast one checkbox option");
        		return false;
        	}
        	
        	
        	document.addinstn.action="addcontent.jsp?q="+q+"&d="+d;


        	  document.addinstn.submit();
        	  //alert("Please select the atleast one option");
            
              }catch(e){
                alert(e);
            }
        	}catch(e){
                
            }
           	
        	 }
              
          
           </script> <script type="text/javascript">
           function AJAXFunc()
           {
               //alert("In Fun");
               var transporter= document.getElementById("transporter").options[document.getElementById("transporter").selectedIndex].value
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
                               //alert(reslt);   
                            //   document.getElementById("tbvl").innerHTML=reslt;
                               var z=reslt.split("#");
                               document.getElementById("tbvl").innerHTML=z[1];
                               document.getElementById("fnt").innerHTML=z[0];
                              // var z=reslt.split("#");
                              //alert(z[1]);
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
                      var queryString = "?transporter="+transporter;
            	   ajaxRequest.open("GET", "Ajaxinstn.jsp" + queryString, true);
            	   ajaxRequest.send(null); 
           }  

// if Type of UNit is 'Voice call', then this will get called

</script> <%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	String userrole=session.getAttribute("userrole").toString();
	
	String transporter=request.getParameter("transporter");
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
		
%>


<br/>
<br/>


<form name="addinstn" method="post" action=""
	onsubmit="return validate();">
<div style="width:43em;"   align="center"></div>
<table border="0" width="500px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td align="center" ><font  color="black" size="2"><b>Transporter
		:</b></font></td>
		<td align="center" ><!-- <input type="text" name="addinstn" id="instn"  class="formElement" size="30"></input> -->
		<select style="width:120px;"   name="transporter" id="transporter"  class="formElement"
			onChange="AJAXFunc();">
			<option   value="select"> select </option>

			<%

				
				sql="select distinct(OwnerName) as Transporter FROM db_gps.t_vehicledetails ";
				ResultSet rst=st2.executeQuery(sql);
				//System.out.println(sql);
				while(rst.next())
				{
					try{
					//System.out.println("inside rst");
%>
			<option value="<%=rst.getString("Transporter")%>"><%=rst.getString("Transporter") %></option>
			<%            }catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}

				}
%>
			<option value="other">Other</option>
		</select></td>
	</tr>


</table>
</div>
<br/>

<br/>
<table align="center">
<tr>
<td align="Center">
<h2  size="4" align="center" ><font color="black"  id="fnt" size="3" style="margin-left:08em; "> </font>  </h2>
</td>
</tr>
</table>

<br>
<div style="width:43em;"   align="center" id=tbvl>
<!-- <table border="0" width="500px" bgcolor="#E6E6E6" align="center" style=>
	<tr bgcolor="#BDBDBD">
		<td align="right"><b>Sr.No.</b></td>
		<td align="center"><b>Vehicle RegNo.</b></td>
		
		<td  align="center"><b>Instruction</b></td>
		
	</tr>
</table>-->




</div>
<br />

<table border="0" width="500px" bgcolor="#E6E6E6" align="center"
	id="instn">

	<tr align="center" bgcolor="#BDBDBD">
		<td align="left"><font color="black" size="2"><b>Instruction
		:</b></font></td>
		<td align="left">
			 <select name="instruction"
			id="instruction" class="formElement"    onchange="hiddenfield();" >
			<option value="-" selected> - </option>
			



			<%

				
				sql5="select distinct(Instruction)  FROM db_gps.t_vehicledetails where Instruction <>'-' ";
				ResultSet rst1=st2.executeQuery(sql5);
				//System.out.println(sql5);
				while(rst1.next())
				{
					try{
					//System.out.println("inside rst");
%>
			<option value="<%=rst1.getString("Instruction")%>"><%=rst1.getString("Instruction") %></option>
			<%            }catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}

				}
%>
			<option value="other">other </option>



		</select> 
		 &nbsp;&nbsp;<input type="text" id="txt" name="addinstn" style ="position:absolute;display:none;"     "
			class="formElement" size="15"></input></td>
		
	</tr>
</table>



<div id="bttn">

<table border="0" width="500px" bgcolor="#E6E6E6" align="center">


	<tr bgcolor="#BDBDBD">

		<td align="center" colspan="2"><input type="submit" id="btnadd"
			name="btn" value="submit" class="formElement" onclick="mycheckbox();" />


		</td>

	</tr>



</table>
</div>
</form>
</div>
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>
<%
}
catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>

</html>