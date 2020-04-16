<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>


<%! 
Connection con1, con2;
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

<script language="javascript" >
function validate()
{
     
     var veh=document.removeunitform.vehreg.value;
    var ownname=document.removeunitform.owner.value;
     var unid=document.removeunitform.unid.value;
	var tech=document.removeunitform.techname.value;
	var cmnt=document.removeunitform.cmnt.value;
     
     
 if(ownname=="Select")
     {
       alert("Please select Owner Name from the List");
       return false;
     }
     if(veh=="Select")
     {
       alert("Please select Vehicle Registration No.");
       return false;
     }

     if(unid.length=="")
     {
       alert("Please enter Unit Id");
       return false;
     }     
     
    
     if(entby.length=="")
     {
       alert("Please enter your Name");
       return false;
     }

	if(tech=="Select")
	{
		 alert("Please select Tech Name");
	       return false;
	}

	if(document.removeunitform.oldunitwith[0].checked==false && document.removeunitform.oldunitwith[1].checked==false && document.removeunitform.oldunitwith[2].checked==false)
	{
		alert("Please select whether the Unit is with Cust / Tech / Company");
		return false;
	}

	if(cmnt.length<2)
	{
		 alert("Please enter your Comments");
	       return false;
	}
	return true;
     
}

function OnChangeFunc3(dropdown)
{
   var vv1=dropdown.selectedIndex;
   var SelValue1 = dropdown.options[vv1].value;
// alert(SelValue1);
   
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

        //  document.getElementById("mydiv").innerHTML="<select name='vehreg' id='vehreg'> " ;
                 // Create a function that will receive data sent from the server
               ajaxRequest.onreadystatechange = function()
               {
    		 if(ajaxRequest.readyState == 4)
                  {
                 	var reslt=ajaxRequest.responseText;
                         //alert(reslt);
                         document.getElementById("mydiv").innerHTML=reslt;
		  }
               }
           var queryString = "?owname=" +SelValue1;
	   ajaxRequest.open("GET", "Ajaxrepunit1.jsp" + queryString, true);
	   ajaxRequest.send(null); 
}



function AJAXFunc()
{
    
     var vehregno=document.removeunitform.vehreg.value;
//alert(vehregno);
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
   			   document.removeunitform.unid.value = reslt;
                           
			}
        	}
        var queryString = "?vehregno=" +vehregno;
	ajaxRequest.open("GET", "Ajaxrepunit.jsp" + queryString, true);
	ajaxRequest.send(null); 

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
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
  <form name="removeunitform" method="get" action="cnfirmperremoval.jsp" onsubmit="return validate();">

<%
try
{	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null;
	String sql1="", sql2="", sql3="";

	sql1="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='Transporter' order by TypeValue";
	
	rs1=stmt1.executeQuery(sql1);

	String send=request.getParameter("send");
	if(send==null)
	{
	}
	else
	{%>
		<table border="0" width="750px">	
		<tr>
		<td align="center"> <font color="red"> <b>
			Successfully Removed (Temporary) </b>
		</td> </tr> </table>
<%
	}
%>

	

<center>
<table border="0" width="800px" >
<tr>
			<td colspan="12"><div align="center"><font color="brown" size="3"> <B> Permanant Unit Removal </B> </font></div></td>
		</tr>
<tr>
   <td> <div align="center">
	<table border="1" width="800px" >
		
<%
int cntr=Integer.parseInt(request.getParameter("cntr"));
String transporter=request.getParameter("transporter");
int l=1, m=0 ;

String[] chkbox=new String[cntr];
String[] id = new String[cntr];
String[] vehno = new String[cntr];
String[] x = new String[cntr];

for(int k=0;k<cntr;k++)
{
	int c=0;
	
			id[k] = request.getParameter("id"+k );
			vehno[k] = request.getParameter("vehno"+k );
		//	//System.out.println(vehno[k]);
		String transp="", unitid="";
		sql3="select * from t_vehicledetails where VehicleRegNumber='"+vehno[k]+"' ";
		////System.out.println("sql3"+sql3);
		rs3=stmt1.executeQuery(sql3);
		if(rs3.next())
		{
			transp=rs3.getString("OwnerName");
			unitid=rs3.getString("UnitId");
		}
		
 %>
		<tr>
			<td><font size="2"><b>srno <%=k+1 %></b></font></td> 
			
			<td> <font size="2"><b>
		 Transporter: </b></font>
 			</td>
  			<td>
				<input type="text" name="owner<%=k%>" value="<%=transp%>" class="formElement" readonly />		
			</td>
		
			<td> <font size="2"><b> Vehicle Reg. No.:  </b></font>
			</td>
			<td>
				<input type="text" name="vehreg<%=k%>" value="<%=vehno[k]%>" class="formElement" readonly />		
			</td>
		
			<td colspan="14" align="center">  <font size="2"><b>
		      Unit Id: </b></font> </td>
		 	<td>
  		      <input type="text" name="unid<%=k%>" size="8" value="<%=unitid%>" class="formElement" readonly> </input> </div>
  		  	</td>

		
<%	

	sql2="select distinct(TechName) as techname from t_techlist where Available='Yes' order by TechName asc";
	rs2=stmt2.executeQuery(sql2);
%>
	
			<td colspan="6" align="center"> <font size="2"> <b>Old Unit with: </b></font> </td>
			<td> <select name="techname<%=k%>" class="formElement"> 
				<option value="Select">Select</option>
<%
				while(rs2.next())
				{ %>
					<option value="<%=rs2.getString("techname")%>"><%=rs2.getString("techname")%></option>
<%				} 
%>
					<option value="Customer">Customer</option> 
					<option value="Company">Company</option> 
			     </select>	
			</td>
	
		<!-- <tr>
			<td> <font color="maroon"> Old Unit with: </font> </td>
			<td>
		 <input type="radio" name="oldunitwith" value="Cust">Cust</input>
		 <input type="radio" name="oldunitwith" value="Tech">Tech</input>
		 <input type="radio" name="oldunitwith" value="Company">Company</input>
			</td>
		</tr> -->
	
			<td colspan="4"> <font size="2"><b> Comment: </b></font> </td>
			<td> <textarea name="cmnt<%=k%>" class="formElement"> </textarea> </td>
		
		
		

	
	
<%

			l++;
			m++;
			
			
			
			}
	%>
	</tr>
	<tr><input type="hidden" name="cntr" value="<%=l%>"></input>
	 <td colspan="14" align="center"> <div align="center"> <input type="submit" name="submit" value="Confirm" class="formElement"> </input> </div> </td> 
		</tr>
	
	</table>

 </div> </td>	
 </tr>
</table>
	<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</form>
</body>
</html>
