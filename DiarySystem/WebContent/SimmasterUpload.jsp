<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
	<%@ include file="header.jsp"%>
<%!
Connection conn;
Statement st,st1;
String sql,sql1;
%>
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>Upload excel in Simmaster</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
window.onload= function crosscountry(){
//alert("coucou");
//alert("hello");


var alertone= document.getElementById("allu").value;
//alert(alertone);



if(alertone==null || alertone==""|| alertone==="" || alertone=="null"){
	//alert("i am null");
}
else
	{
	
	//var str="Welcome to plus2net";

	//var a1 = new Array();

	//a1=alertone.split("");

	/// display elements  ///
	//var a1 = alertone.split(",");
	//alert(a1);
	var formattedString = alertone.split(",").join("\n");
/// display elements  ///
swal("Duplicate Sim. No's are: \n\n"+formattedString);
//alert("There are duplicate sims. Click Ok to view duplicate sim nos.");
	
	
//alert(formattedString);
	//alert("There are duplicate sims! Click Ok to view duplicate sim nos!");
	 //var formattedString = alertone.split(",").join("\n");
	//alert(formattedString); 
	}

}
</script>



<script type="text/javascript">

function showhidefields()
{
	
	var category=document.getElementById("Category").value;
	
	if(category=="Sim")
		{
		
		document.getElementById("sim0").style.display="";
		document.getElementById("sim1").style.display="";
		document.getElementById("sim2").style.display="";
		document.getElementById("sim3").style.display="";
		}
		
	else
		{document.getElementById("sim0").style.display="none";
		document.getElementById("sim1").style.display="none";
		document.getElementById("sim2").style.display="none";
		document.getElementById("sim3").style.display="none";
		
		
		}
	


}




function confirmSubmit()
{
	//alert("hi");
	var user= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	
	var category=document.getElementById("Category").options[document.getElementById("Category").selectedIndex].value;
	if(category=="Select")
		{
		swal("Please Select Category");
		return false;
		
		}
	
	
	
	if(category=="Sim")
		{
		var Driver= document.getElementById("pon").value.trim();
		
		
	/* 	var regEx=/(?:\d+(?:\.\d*)?|\.\d+)/; */
	var regEx=/^[\d]*$/;
	    
	       bValid1= Driver.match(regEx);
	       if(!bValid1){
	         alert('Please enter Integer Value for Purchase No! ex 1,2,3,9');
	         return false;        
	       }
	if(user=="select") {
			
swal("Please select Service Provider!");
		return false;
		}
	var pon = document.unit.pon.value;
	if(pon=="") {
		swal("Enter Purchase No!");
		return false;
		}
	var plan = document.unit.plan.value;
	if(plan=="") {
		swal("Enter Plan!");
		return false;
		}
		}
	try{
	var fup = document.unit.file.value;
	var ext = fup.substring(fup.lastIndexOf('.') + 1);
	}catch(e)
	{
		alert(e);
	}

	//alert(">>"+fup+">>>>"+ext);
	
	if(fup=="") {
	swal("Please browse file!");
	return false;
	}
    if(ext =="xls")
    {
      // return true;
    }
    else
    {
        swal("Upload Excel file only");
        return false;
    }
	
var agree=confirm("Are you sure you wish to submit this List?");
if (agree)
	return true ;
else
	return false ;
}

function downloadExcelFormat()  
{  
	     window.location = "Format_For_Uploading_sim.xls";
         
}
function downloadExcelFormat1()  
{  
	     window.location = "Format_For_Uploading_Other.xls";
         
}



</script>
</head>


<body>
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
	System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    
    System.out.println("Connection Created");
    
    }catch(Exception E){
    	System.out.println(""+E);
    }
  
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
    String sdt = fmt.format(td);
    System.out.println("The todays date is :"+sdt);
%>

<table border="0" width="750px" bgcolor="#BDBDBD" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Sim Upload</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br/>
<form name="unit" method="post" onsubmit="return confirmSubmit();" enctype="multipart/form-data" action="SimmasterUpload1.jsp">
      <table border="0" width="750px" bgcolor="" align="center">     
      		
      		 <tr>
			 	<td align="right"  colspan="2"><font size="2"><b>Download Excel Format For Sim </b></font>	
			 	<a href="#" style="font-weight: bold; color: black; " onclick="downloadExcelFormat();">
	                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none" title="download excel format"></img></a>
	                
	                          						
			</tr> 
			
			<tr>
			 
	                 <td align="right"  colspan="2"><font size="2"><b>Download Excel Format for Others </b></font>	
			 	<a href="#" style="font-weight: bold; color: black; " onclick="downloadExcelFormat1();">
	                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none" title="download excel format"></img></a>
	                 </td>
			</tr>
			 <tr bgcolor="#E6E6E6">
			 	<td align="right" width ="300px"><font size="2"><b>Category:</b></font></td>
			     <td align ="left" width ="450px">			     			    
			     	
							<select class="element select medium" id="Category" name="Category"    onchange="showhidefields()" style="width: 125px; height: 25px;" > 																
									<option value="Select" >Select</option>
									<option value="Sim">Sim</option>
									<option value="Router">Router</option>
                                                                        <option value="GPS">GPS</option>
									<option value="NUC">NUC</option>
									<option value="Module">Module</option>
									
							</select>
				
				</td>							
			</tr>
			
			
			
			
			<tr></tr>
			
			 <tr id="sim0" style="display: none;"   bgcolor="#E6E6E6">
			 	<td align="right" width ="300px"><font size="2"><b>Service Provider :</b></font></td>
			     <td align ="left" width ="450px">			     			    
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 																
									<option value="select" >select</option>
									<%
					            	sql = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-'";
									System.out.println("The query is :"+sql);
					             	ResultSet rs = st.executeQuery(sql);
					             	while(rs.next())
					              	{
									%>
									<option value="<%=rs.getString("operator") %>" ><%=rs.getString("operator")%></option>
									<%}%>
							</select>
					</div> 
				</td>							
			</tr>
			<tr></tr>
			
			
			<tr id="sim1" style="display:none;"  bgcolor="#E6E6E6"> 
				<td align ="right"><font size="2"><b>Purchase No :</b></font></td>
	        	<td align ="left">	        
	        	<input type ="text" name ="pon" id ="pon" value= ""/>
	        	</td>
			</tr>
			<tr></tr>
			<tr id="sim2" style="display:none;"   bgcolor="#E6E6E6"> 
				<td align ="right"><font size="2"><b>Activation Date :</b></font></td>
	        	<td align ="left">	        
	        	<div>
					<input type="text" id="activation_date" name="activation_date" size="12"  value="<%=sdt %>"
					style="width: 70px; height: 18px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />
						<script type="text/javascript">
						  Calendar.setup(
						    {
						      inputField  : "activation_date",         // ID of the input field
						      ifFormat    : "%d-%b-%Y",    // the date format
						      button      : "activation_date"       // ID of the button
						    }
						  );
						</script>
				</div>
	        	</td>
			</tr>
			<tr></tr>
			<tr id="sim3" style="display: none;"   bgcolor="#E6E6E6"> 
				<td align ="right"><font size="2"><b>Plan :</b></font></td>
	        	<td align ="left">	        
	        	<input type ="text" name ="plan" id ="plan" value= ""/>
	        	</td>
			</tr>
			<tr>
			<td align ="right"><font size="2"><b>Browse excel file :</b></font></td>
			<td>
			<INPUT NAME="file" id ="file" TYPE="file" size="20">
			</td>
			</tr>
	</table>

<br/>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td align ="center">
				<input type="submit" name="submit" id="submit" value="submit" style="background: #E6E6E6;"/>
			</td>
		</tr>  
	</table>
	
	<%
	String msg=request.getParameter("msg");
	String alertone= request.getParameter("alertone");
	System.out.println("ALERTONe is:---->>>>" + alertone);
	%>
	<input type="hidden" id="allu" name="allu" value="<%=alertone%>">
	<%
	//alert("alerttone---->>>>>"+alertone);
	//System.out.println("The msg is :"+msg);
	 if(msg !=null && (alertone==null|| alertone.equals(null) || alertone.equals("null") || alertone=="")){ %>
	<table border="0" width="750px" align="center"> 
	<tr>
		<td  align="center" bgcolor=""><font size="2"><b>File Uploaded successfully</b></font></td>
	</tr>
</table>
<%} else if(msg !=null && (alertone!=null|| alertone!="" || alertone!="null" )) {
 	%>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor="#f5f5f5"><font size="2"><b>File Uploaded successfully but duplicate values not inserted</b></font></td>
		</tr>
	</table>
	<%}else{ %>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor=""><font size="2"><b>Please upload only excel files with proper format And do not include the column of Serial No.</b></font></td>
		</tr>
	</table>
<%} %>
	
</form>
<br/>			
</div>

<div id="gbox-bot1"></div>
</div>
</div>
</div>
</div>

<div id="copyright">Copyright \A9 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>