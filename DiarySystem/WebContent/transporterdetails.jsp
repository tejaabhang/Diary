<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5;
String sql,sql1,sql2,sql3,sql4,sql5,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>
<html>
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
function validateEmail(field) {
    var regex=/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
    return (regex.test(field)) ? true : false;
}
function validate()
{
	var v1=document.transporterform.transporter.value;
	var v2=document.transporterform.userlimit.value;
	var v3=document.transporterform.unitlimit.value;
	var v9=document.transporterform.customercode.value;
	var v4=document.transporterform.status.length;
	var v5 = document.transporterform.comment.value;
	var emailAdd=document.transporterform.adminemail.value;
	var customertype=document.transporterform.customertype.value;
	var operationalstatus=document.transporterform.opstatus.value;
	var categorystatus=document.transporterform.category.value;
	
	var invalid=/^[.]+$/;
	 var invalidnumber=/^[0-9]+$/;

	
	if(v1.trim()=="")
	{
		alert("Please Enter Transporter name");
		return false;
	}
	if(v2.trim()=="")
	{
		alert("Please Enter User Limit");
		return false;
	}
	else if(!invalidnumber.test(v2))
	{
		alert("Please Enter User Limit in Valid Digits only");
		return false;
	}
	if(v3=="")
	{
		alert("Please Enter Unit Limit");
		return false;
	}
	else if(!invalidnumber.test(v3))
	{
		alert("Please Enter Unit Limit in Valid  Digits only");
		return false;
	}
	
	
	
	
	
	
	
	
	if(emailAdd.trim()=="") 
    {
		alert("Please Enter transporter Email Id");
		return false;
	}
	else
	{
		 var result = emailAdd.split(",");
		    for(var i = 0;i < result.length;i++)
		    if(!validateEmail(result[i])) {
				alert("please insert valid email id");
	            return false;          
		    }     
	}
	
	 var i=0;
	 var flag=false;
	for(i=0;i<v4;i++)
	{
		var chk=document.transporterform.status[i].checked;
		if(chk==true)
		flag=true;
	}
 	if(flag==false)
 	{
 	 	alert("Please check the Active status");
 	 	return false;
 	}
 	
 	
 	
 	if(categorystatus=="Select")
	{
	alert("Please Select Category");
	return false;
	}
 	
 	
 	if(customertype=="Select")
	{
	alert("Please select Customer Type");
	return false;
	}

   if(operationalstatus=="Select")
	{
	alert("Please Select Operational Status");
	false;
	}
	if(v9=="")
	{
		alert("Please Enter Customer Code");
		return false;
	}
	else if(!invalidnumber.test(v9))
	{
		alert("Please Enter Customer Code in Valid Digits only");
		return false;
	}
	
	if(v5=="")
	{
		alert("Please Enter Comment");
		return false;
	}
	
 	return true;
 }
function validateEmail(emailAdd)
{
     var splitted = emailAdd.match("^(.+)@(.+)$");
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
function enable()
{
	document.getElementById("owner").disabled=false;
	document.getElementById("btnupdate").disabled=false;
	document.getElementById("btnadd").disabled=true;
}
function resetall()
{
	document.transporterform.action="";
	document.transporterform.submit();
}
</script>
<script type="text/javascript">
function AJAXFunc(dropdown)
{
	var v1=dropdown.value;
	v1=encodeURIComponent(v1);
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
                      var mySplitResult =  reslt.split("#");
                      var mySplitResult1=  mySplitResult[0]; 
                      var mySplitResult2=  mySplitResult[1];
     

					mySplitResult[0] = mySplitResult[0].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[1] = mySplitResult[1].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[2] = mySplitResult[2].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[3] = mySplitResult[3].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[4] = mySplitResult[4].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[5] = mySplitResult[5].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[6] = mySplitResult[6].replace(/^\s+|\s+$/g,"");//trim
					mySplitResult[7] = mySplitResult[7].replace(/^\s+|\s+$/g,"");//trim
                    mySplitResult[10] = mySplitResult[10].replace(/^\s+|\s+$/g,"");//trim
					//alert("tddf:"+mySplitResult[10])
					

 		      		document.transporterform.transporter.value = mySplitResult[0];
              		document.transporterform.userlimit.value = mySplitResult[1];
              		document.transporterform.hid_userlimit.value = mySplitResult[1];      
              		document.transporterform.unitlimit.value = mySplitResult[2];
              		document.transporterform.hid_unitlimit.value = mySplitResult[2];
              		document.transporterform.adminemail.value = mySplitResult[7];
              		document.transporterform.adminemail_hidden.value = mySplitResult[7];
                    document.transporterform.customercode.value = mySplitResult[10];
                    document.transporterform.hid_customercode.value = mySplitResult[10];
				 	
					var status=mySplitResult[3];
							if(status=="Yes")
							{
                       			document.transporterform.status[0].checked = true;
								document.transporterform.hid_status.value = status;
								
							}
							else if(status=="No")
							{	
					  			document.transporterform.status[1].checked = true;
								document.transporterform.hid_status.value = status;
									
							}
							
					document.transporterform.hid_comment.value = mySplitResult[4];            
				 	document.transporterform.datetime.value = mySplitResult[5];
				 	document.transporterform.enteredby.value = mySplitResult[6];
                                        
				 	//document.transporterform.customertype.innerHTML = mySplitResult[8];
				 	//document.transporterform.operationalstatus.innerHTML = mySplitResult[9];
				 	 var element = document.getElementById('customertype');
				    element.value =mySplitResult[8] ; 
				      var element1= document.getElementById('opstatus');
				
				     element1.value =mySplitResult[9] ;
				     var category= mySplitResult[11];
				    
				     var element2=document.getElementById('category');
				     element2.value=category;
				     console.log(element1.value); 
				
				   
				
		
                       
 	       } 
     	       }
                     

  //alert("I m fine");
           var queryString = "?transporter="+v1;
 	   ajaxRequest.open("GET", "ajaxtransporterdetails.jsp" + queryString, true);
 	   ajaxRequest.send(null); 


}








// if Type of UNit is 'Voice call', then this will get called

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
	<!-- <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1"> -->
<!--- code start here ------>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st3=conn.createStatement();
	
	st2=conn1.createStatement();
	st5=conn1.createStatement();
	String userrole=session.getAttribute("userrole").toString();
	String insert=request.getParameter("insert");
	String transporter=request.getParameter("transporter");
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
		
%>
<form name="transporterform" method="get" action="addtransporter.jsp" onsubmit="return validate();">
<input type="hidden" name="user" id="user" value=<%=userrole %>></input>
<%
if(transporter==null || transporter=="")
{
	
}
else
{
	%>
	 <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="black" ><b>Transporter already present so cannot insert.........</b>  </font></td>
		</tr>
	</table>
	<%
}
if(insert==null || insert=="")
{
}
else if(insert.equalsIgnoreCase("true"))
{
  //out.println(own);
%>
  <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="black" ><b>Successfully Saved ..........</b>  </font></td>
		</tr>
	</table>
<%}else if(insert.equalsIgnoreCase("false"))
{ %>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="black" ><b>You haven't changed any values ..........</b>  </font></td>
		</tr>
	</table>
<%	
}

%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Transporter Details</b>  </font></td>
		</tr>
</table>
<br></br>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
		<td><font color="black" ><font color="red" size="2">*</font><b>Transporter :</b></font></td><td>
			<input type="text" name="transporter" id="transporter"  class="formElement" size="30"></input>
			<select name="owner" id="owner" onChange="AJAXFunc(this);" class="formElement" disabled="disabled"> 
         		<option value="Select"> Select </option>
<%
				username=session.getAttribute("username").toString();
				sql="select TypeValue from t_transporter order by TypeValue";
				ResultSet rst=st2.executeQuery(sql);
				while(rst.next())
				{
%>
				<option value="<%=rst.getString("TypeValue")%>"><%=rst.getString("TypeValue")%></option>
<%
				}
%>
				<option value="Other"> Other </option>
			</select>
			<input type="button" id="edit" value="EDIT"  class="formElement" onclick="enable()"></input>
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td><font color="black" ><font color="red" size="2">*</font><b>Enter User Limit: </b></font></td>
		<td>
			<input type="text" name="userlimit" class="formElement"> 
			<input type="hidden" name="hid_userlimit" class="formElement"> 
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Enter Unit Limit: </b></font>
		</td>  
<!-- When mobno textbox will be clicked, AJAXFunc() in javascript will be called which again calls Ajaxunitadd.jsp and MobNo and SIM No wil be put automatically in their respective fields.  -->
		<td>
			<input type="text" name="unitlimit" size="13" class="formElement"> 
			<input type="hidden" name="hid_unitlimit" size="13" class="formElement"> 
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Admin Email ID: </b></font>
		</td>  
		<td>
			<input type="text" name="adminemail" size="40" class="formElement"> 
			<input type="hidden" name="adminemail_hidden" size="13" class="formElement"> 
		</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Active Status: </b></font>
		</td>
<!-- When mobno textbox will be clicked, AJAXFunc() in javascript will be called which again calls Ajaxunitadd.jsp and MobNo and SIM No wil be put automatically in their respective fields.  -->
		<td>
			<input type="radio" name="status" value="Yes" class="formElement">Yes
			<input type="radio" name="status" value="No" class="formElement">No
			<input type="hidden" name="hid_status" id="hid_status" class="formElement"> 
		</td>
	</tr>
	
	
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Category: </b></font>
		</td>

		<td>
  		
		     <select class="formElement" id="category" name="category" style="width: 150px; height: 20px;">
		      <option value="Select" selected="selected">Select</option>
				<%
			String sql6 = "select distinct(TransporterStatus) from db_gps.transportercategory";
			ResultSet rs6 = st3.executeQuery(sql6);
			
			while(rs6.next())
			{
				%>
				<option value="<%=rs6.getString("TransporterStatus") %>" ><%=rs6.getString("TransporterStatus") %></option>
				<%
			}
			%>
			</select>


		</td>
	</tr>
	
	
	
	
	
	
	
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Customer Type: </b></font>
		</td>
<!-- When mobno textbox will be clicked, AJAXFunc() in javascript will be called which again calls Ajaxunitadd.jsp and MobNo and SIM No wil be put automatically in their respective fields.  -->
		<td>
    
<!-- <label class="description" for="element_2" style="width: 150px;"><font size="2">Vehicle type</font></label>
 -->		
		     <select class="formElement" id="customertype" name="customertype"  style="width: 150px; height: 20px;">
		      <option value="Select" selected="selected">Select</option>
		     
			<%
			String sql1 = "select distinct(CustomerType) from  db_gps.t_customertypemaster";
			ResultSet rs1 = st.executeQuery(sql1);
			
			while(rs1.next())
			{
				%>
				<option value="<%=rs1.getString("CustomerType") %>" ><%=rs1.getString("CustomerType") %></option>
				<%
			}
			%>
			</select>


		</td>
	</tr>
	
	<tr bgcolor="#BDBDBD">
		<td>
			<font color="black" ><font color="red" size="2">*</font><b>Operational Status: </b></font>
		</td>

		<td>
  		
		     <select class="formElement" id="opstatus" name="opstatus" style="width: 150px; height: 20px;">
		      <option value="Select" selected="selected">Select</option>
				<%
			String sql5 = "select distinct(OperationalStatus) from db_gps.t_operationalstatusmaster";
			ResultSet rs5 = st3.executeQuery(sql5);
			
			while(rs5.next())
			{
				%>
				<option value="<%=rs5.getString("OperationalStatus") %>" ><%=rs5.getString("OperationalStatus") %></option>
				<%
			}
			%>
			</select>


		</td>
	</tr>
	
	<tr bgcolor="#BDBDBD">
		<td><font color="black" ><font color="red" size="2">*</font><b>Customer Code: </b></font></td>
		<td>
			<input type="text" name="customercode" class="formElement"> 
			<input type="hidden" name="hid_customercode" class="formElement"> 
		</td>
	</tr>
	
	
	<tr bgcolor="#BDBDBD">
		<td><font color="black" ><font color="red" size="2">*</font><b>Comment: </b></font></td>  
		<td>
			<textarea name="comment" id="comment" rows="2" cols="50" class="formElement"></textarea>
			<textarea name="hid_comment" id="hid_comment" rows="2" cols="50" class="formElement" style="display:none;" ></textarea>
			<input type="hidden" name="datetime" id="datetime" size="13" class="formElement"> 
			<input type="hidden" name="enteredby" id="enteredby" size="13" class="formElement"> 
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" id="btnadd" name="btn" value="ADD" class="formElement" />
			<input type="submit" id="btnupdate" name="btn" value="UPDATE" class="formElement" disabled />
			<input type="button" id="cancel" value="CANCEL" class="formElement" onclick="resetall()" />
		</td>
	</tr>
</table>

</form>

 
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


</body>
</html>

<%@ include file="footer.jsp" %>