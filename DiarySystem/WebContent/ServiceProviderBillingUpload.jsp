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
<title>Upload Zip File of Service Provider Billing</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>

<script type="text/javascript">
function confirmSubmit()
{
	//alert("hi");
	var user= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	if(user=="select") {
			
			alert("Please select Service Provider!");
		return false;
		}
	var pon = document.unit.pon.value;
	if(pon=="") {
		alert("Enter Purchase No!");
		return false;
		}
	var plan = document.unit.plan.value;
	if(plan=="") {
		alert("Enter Plan!");
		return false;
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
	alert("Please browse file!");
	return false;
	}
    if(ext =="xls")
    {
      // return true;
    }
    else
    {
        alert("Upload Excel file only");
        return false;
    }
	
var agree=confirm("Are you sure you wish submit this List?");
if (agree)
	return true ;
else
	return false ;
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
    String month="";
    String year="";
    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
    String sdt = fmt.format(td);
    System.out.println("The todays date is :"+sdt);
%>

<table border="0" width="750px" bgcolor="#BDBDBD" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3">Service Provider Bill Upload</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br/>
<form name="unit" method="post" onsubmit="return confirmSubmit();"  action="SimBillnsert.jsp" enctype="multipart/form-data">
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">      
			 <tr bgcolor="#E6E6E6">
			 	<td align="right" width ="300px"><font size="2"><b>Service Provider :</b></font></td>
			     <td align ="left" width ="450px">			     			    
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 125px; height: 25px;" > 																
									<option value="select" >select</option>
									<%
					            	sql = "select DISTiNCT(Service_provider) as operator  from db_gps.t_simmaster where Service_provider <> '-' and Service_provider <> ''  ";
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
			<tr style="background: #E6E6E6">
		<td align="right" width ="300px">			
			<b>Month</b> 		
	  </td>
	  <td align ="left" width ="450px">			
			<div>
		<select class="element select medium" id="mnth" name="mnth" style="width: 100px; height: 25px;" >
		
		
			<%
					if((month==null)) {
						System.out.println(">>");
						month="-";
						%>
						<option value="select" selected>select</option>
						<%
					}else{
						%>
						<option value="select">select</option>
						<%
					}
			%>
			<%
					if(month.equals("01")) {
						%>
						<option value="01" selected>JAN</option>
						<%
					}else{
						%>
						<option value="01">JAN</option>
						<%
					}
			%>
			<%
					if(month.equals("02")) {
						%>
						<option value="02" selected>FEB</option>
						<%
					}else{
						%>
						<option value="02">FEB</option>
						<%
					}
			%>
			<%
					if(month.equals("03")) {
						%>
						<option value="03" selected>MAR</option>
						<%
					}else{
						%>
						<option value="03">MAR</option>
						<%
					}
			%>
			<%
					if(month.equals("04")) {
						%>
						<option value="04" selected>APR</option>
						<%
					}else{
						%>
						<option value="04">APR</option>
						<%
					}
			%>
			<%
					if(month.equals("05")) {
						%>
						<option value="05" selected>MAY</option>
						<%
					}else{
						%>
						<option value="05">MAY</option>
						<%
					}
			%>
			<%
					if(month.equals("06")) {
						%>
						<option value="06" selected>JUNE</option>
						<%
					}else{
						%>
						<option value="06">JUNE</option>
						<%
					}
			%>
			<%
					if(month.equals("07")) {
						%>
						<option value="07" selected>JULY</option>
						<%
					}else{
						%>
						<option value="07">JULY</option>
						<%
					}
			%>
			<%
					if(month.equals("08")) {
						%>
						<option value="08" selected>AUG</option>
						<%
					}else{
						%>
						<option value="08">AUG</option>
						<%
					}
			%>
			<%
					if(month.equals("09")) {
						%>
						<option value="09" selected>SEPT</option>
						<%
					}else{
						%>
						<option value="09">SEPT</option>
						<%
					}
			%>
			<%
					if(month.equals("10")) {
						%>
						<option value="10" selected>OCT</option>
						<%
					}else{
						%>
						<option value="10">OCT</option>
						<%
					}
			%>
			<%
					if(month.equals("11")) {
						%>
						<option value="11" selected>NOV</option>
						<%
					}else{
						%>
						<option value="11">NOV</option>
						<%
					}
			%>
			<%
					if(month.equals("12")) {
						%>
						<option value="12" selected>DEC</option>
						<%
					}else{
						%>
						<option value="12">DEC</option>
						<%
					}
			%>		
		</select>
	</td>
	
	</tr>
	
	<tr>
	<td align="right" width ="300px">			
			<b>Year</b> 		
	  </td>
	<td align ="left" width ="450px">
	<div>		  
		<select class="element select medium" id="yr" name="yr" style="width: 100px; height: 25px;" >
			
			<%
					if((year==null)) {
						year="-";
						System.out.println(">>>>");
						%>
						<option value="select" selected>select</option>
						<%
					}else{
						%>
						<option value="select">select</option>
						<%
					}
			%>
			<%
					if(year.equals("2006")) {
						%>
						<option value="2006" selected>2006</option>
						<%
					}else{
						%>
						<option value="2006">2006</option>
						<%
					}
			%>	
			<%
					if(year.equals("2007")) {
						%>
						<option value="2007" selected>2007</option>
						<%
					}else{
						%>
						<option value="2007">2007</option>
						<%
					}
			%>
			<%
					if(year.equals("2008")) {
						%>
						<option value="2008" selected>2008</option>
						<%
					}else{
						%>
						<option value="2008">2008</option>
						<%
					}
			%>
			
			<%
					if(year.equals("2009")) {
						%>
						<option value="2009" selected>2009</option>
						<%
					}else{
						%>
						<option value="2009">2009</option>
						<%
					}
			%>
			<%
					if(year.equals("2010")) {
						%>
						<option value="2010" selected>2010</option>
						<%
					}else{
						%>
						<option value="2010">2010</option>
						<%
					}
			%>
			<%
					if(year.equals("2011")) {
						%>
						<option value="2011" selected>2011</option>
						<%
					}else{
						%>
						<option value="2011">2011</option>
						<%
					}
			%>	
			<%
					if(year.equals("2012")) {
						%>
						<option value="2012" selected>2012</option>
						<%
					}else{
						%>
						<option value="2012">2012</option>
						<%
					}
			%>
			<%
					if(year.equals("2013")) {
						%>
						<option value="2013" selected>2013</option>
						<%
					}else{
						%>
						<option value="2013">2013</option>
						<%
					}
			%>
			<%
					if(year.equals("2014")) {
						%>
						<option value="2014" selected>2014</option>
						<%
					}else{
						%>
						<option value="2014">2014</option>
						<%
					}
			%>
			<%
					if(year.equals("2015")) {
						%>
						<option value="2015" selected>2015</option>
						<%
					}else{
						%>
						<option value="2015">2015</option>
						<%
					}
			%>
			<%
					if(year.equals("2016")) {
						%>
						<option value="2016" selected>2016</option>
						<%
					}else{
						%>
						<option value="2016">2016</option>
						<%
					}
			%>
			<%
					if(year.equals("2017")) {
						%>
						<option value="2017" selected>2017</option>
						<%
					}else{
						%>
						<option value="2017">2017</option>
						<%
					}
			%>
			<%
					if(year.equals("2018")) {
						%>
						<option value="2018" selected>2018</option>
						<%
					}else{
						%>
						<option value="2018">2018</option>
						<%
					}
			%>
			<%
					if(year.equals("2019")) {
						%>
						<option value="2019" selected>2019</option>
						<%
					}else{
						%>
						<option value="2019">2019</option>
						<%
					}
			%>
			<%
					if(year.equals("2020")) {
						%>
						<option value="2020" selected>2020</option>
						<%
					}else{
						%>
						<option value="2020">2020</option>
						<%
					}
			%>				
		
			
		</select>
	  </div> 		
	  </td>
	  </tr>
			
			<tr></tr>
<!--			<tr bgcolor="#E6E6E6"> -->
<!--				<td align ="right"><font size="2"><b>Purchase No :</b></font></td>-->
<!--	        	<td align ="left">	        -->
<!--	        	<input type ="text" name ="pon" id ="pon" value= ""/>-->
<!--	        	</td>-->
<!--			</tr>-->
			<tr></tr>
<!--			<tr bgcolor="#E6E6E6"> -->
<!--				<td align ="right"><font size="2"><b>Activation Date :</b></font></td>-->
<!--	        	<td align ="left">	        -->
<!--	        	<div>-->
<!--					<input type="text" id="activation_date" name="activation_date" size="12"  value="<%=sdt %>"-->
<!--					style="width: 70px; height: 18px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF;" readonly />-->
<!--						<script type="text/javascript">-->
<!--						  Calendar.setup(-->
<!--						    {-->
<!--						      inputField  : "activation_date",         // ID of the input field-->
<!--						      ifFormat    : "%d-%b-%Y",    // the date format-->
<!--						      button      : "activation_date"       // ID of the button-->
<!--						    }-->
<!--						  );-->
<!--						</script>-->
<!--				</div>-->
<!--	        	</td>-->
<!--			</tr>-->
			<tr></tr>
			<tr bgcolor="#E6E6E6"> 
				<td align ="right"><font size="2"><b>Plan :</b></font></td>
	        	<td align ="left">	        
	        	<input type ="text" name ="plan" id ="plan" value= ""/>
	        	</td>
			</tr>
			<tr>
			<td align ="right"><font size="2"><b>Browse  Zip File :</b></font></td>
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
	//System.out.println("The msg is :"+msg);
	if(msg !=null) {
 	%>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor="#f5f5f5"><font size="2"><b>Zip File Uploaded successfully</b></font></td>
		</tr>
	</table>
	<%}else{ %>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor=""><font size="2"><b>Please upload only zip files with proper format </b></font></td>
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

<div id="copyright">Copyright Â© 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
</body>
</html>
