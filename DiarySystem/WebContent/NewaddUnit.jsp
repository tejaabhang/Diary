<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1,connERP;
Statement st,st1,st2,st3,st4,sterp1,sterp2,sterp3,sterp4,sterp5,sterp6;
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
		
	 

	
}
	
	function OnChangeFunc4(dropdown)
	{
		alert("i m here");
		
		var Customer= document.getElementById("owner").value;
		alert("Cust :- "+Customer);
	}
	
	function OnChangeFunc3(dropdown)
	{
		//alert("i m here");
		
	 
	 
	 var Customer= document.getElementById("owner").value;
	 
	 //alert("Trans :-"+Customer);
	 
	 Customer=Customer.replace('&','..');
	 
	 //alert("Trans :-"+Customer);
	 
	        if(Customer=="Other")
	        {
	                 
	            window.location = 'newcustadd.jsp';
	        }else
	        	{
	        	window.location = 'addunit.jsp?transporter='+Customer;
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
	String unidchk=request.getParameter("unidchk");
	String limitstring=request.getParameter("limit");
	String countstring=request.getParameter("count");
	StringBuffer InvList=new StringBuffer("(");
%>
<form name="unitaddform" method="get" action="unitaddinsrt.jsp" onsubmit="return validate();">
	<input type="hidden" name="user" id="user" value=<%=userrole %>></input>
	<input type="hidden" name="limit" id="limit" value=<%=userrole %>></input>


 	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td colspan="4" align="center"><font size="3" color="#2A0A12" ><b>Unit Addition</b>  </font></td>
		</tr>
	</table>
	<br></br>
	
	
	
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
			<td><font color="black" ><b>Transporter :</b></font></td>
			<td>
<%if(transporter!=null){%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value="<%=transporter %>"></input>

<%}else{
%>
			<input type="hidden" name="hiddentransp" id="hiddentransp" value=""></input>
<%
}%>
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
			</td>
			
		<tr>
			<!-- <td colspan="4"> <div align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </div> </td> -->
		</tr>
	</table>
</form>

<%

%>

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