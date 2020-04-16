<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
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

function Show(i)
{ 


//alert(">>>>>>"+i);
	  

   if(i==1)
   { 
     document.forms.editrecForm.edit3.style.visibility = 'visible';
   }
   if(i==4)
   { 
     document.forms.editrecForm.edit4.style.visibility = 'visible';
   }
}

function load()
{
   
    //document.editrecForm.edit1.SelectedIndex=1;
    //document.editrecForm.edit1[1].selected;
   //document.editrecForm.edit1.value="";
   //document.editrecForm.edit2.value="";
   document.editrecForm.edit3.value="";
}


function validate()
{
try{
//alert("1111111 in validate");
var a=document.getElementById("edit3").value;
//alert("a length>@@@@@>"+a.trim().length);
if(a.trim().length==0)
{

alert("Please enter new vehicle type");
return false;


}
var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
var vehtyp=document.editrecForm.edit3.value;



//alert("vehtyp=****==value=>"+vehtyp);
//alert(isNaN(vehtyp));

//vehtyp=vehtyp.replace(" ","");

vehtyp=vehtyp.replace(/\s/g, "");



//alert("vehtyp=****= AFTER=value=>"+vehtyp);

//alert("vehtyp=****=1111=value=>"+vehtyp);
//alert("vehtyp=44444==length=>"+vehtyp.trim().length);
//alert("vehtyp.length=55555===>"+vehtyp.length);

vehtyp=vehtyp.trim();
//alert("vehtyp.length=66666===>"+vehtyp.length);

if(vehtyp.length > 50)
{
	alert ("Limit exceeded for field ");
  	return false;

}

if(vehtyp.trim().length==0)
{

	alert ("Space can not be entered as a value");
  	return false;

}


if(!(isNaN(vehtyp)))
{

	alert ("Numbers are  not allowed");
  	return false;

}


for (var i = 0; i < vehtyp.length; i++) 
{
		if (iChars.indexOf(vehtyp.charAt(i)) != -1) 
	{
	  	alert ("Special Characters are not allowed");
	  	return false;
		}
	}

//alert("END>>>===>");

  //  return false;
}catch(e)
{
//alert("exception>>>"+e);

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
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<form name="editrecForm" method="get" action="insrtvehtyp.jsp" onsubmit="return validate();"> 
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null, rs4=null;
	String sql1="", sql2="", sql3="", sql4="";
	String vehcode="", ownername="", gpname="None", vehno="", unitid="",soldout="",vehtyp="",updat="";	
	int i=1;

	String updated="";
	
	
	//vehcode=request.getParameter("vid");
	
	
	updat=request.getParameter("updated");
	
	
	////System.out.println("updat>>>>>>"+updat);
	
	
	if(updat!=null)
	{
  if(updat.equalsIgnoreCase("yes"))
  {
	%>
	<script type="text/javascript" >

	
	alert("Record Inserted Successfully ");
	
	window.location="addvehtyp.jsp";
	</script>
	
	<%  
	
  
  }
	
	
	}
	
%>


	 <table border="0" width="750px">
	   <tr>
		<td> <div align="center"> <font color="maroon" size="3"> <B> Add  New Vehicle Type   </B> </font> </div> </td>
	   
	   </tr>	
	
	<tr>
	   <td> <div align="center"> <font color="black" size="2"> <B> Please click on add to insert new vehicle type   </B> </font> </div> </td>
	</tr>
	
	  
	 </table>

<table border="0" width="750px">
  <tr>
      <td> <div align="center">	

	 <table border="1" width="450px">
  	    
  	    
  	    <tr>
			<td>  
				<b> <font color="maroon"> Vehicle Type: </font>&nbsp;&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			</td>
			<td width="10%"> 
				<div align="center">
					<a href="#" onClick="Show(<%=i %>);"> Add </a> 
			</td>
   			 <td>&nbsp;&nbsp;&nbsp;<input type="text" name="edit3" id="edit3"  size="15" style="visibility:hidden" class="formElement"> </input> </div> </td>

	    </tr>
		

		<%
		sql2="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='GROUP' order by TypeValue";
		rs2=stmt1.executeQuery(sql2);
		%>
<!--	<tr>
  	 	<td> <b><font color="maroon">  Group Name: </font>&nbsp;&nbsp;&nbsp;  </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=gpname%>  </td>  
		<td width="10%">  <div align="center"> -->
<!--   <a href="#" onClick="Show(<%=i %>);"> Edit </a> </td>  -->
		<!--   <td>&nbsp;&nbsp;&nbsp; <select name="edit<%=i %>" style="visibility:hidden" class="formElement"> 
                             <option value="Select" "Selected"> Select </option>
                             <option value="None" > None </option>
			<%    while(rs2.next())
      				{  %>
			          <option value="<%=rs2.getString("TypeValue") %>" > <%=rs2.getString("TypeValue") %> </option>
			<%    }  %>    
                                  
			</select> </div>
   		</td> -->
<!--  	</tr> -->

			
	
		
	<tr>
		<td colspan="2"> <b><font color="maroon"> Comment:</font> </td>
		<td> <textarea name="comment" class="formElement"> </textarea> </td>
	</tr>
	<tr>
		  <td colspan="3"><div align="center"> <input type="submit" name="submit" value="submit"  on class="formElement" > </input> </div> </td>
	  </tr> 
	</table> </div>
    </td> 
   </tr>
</table>

</div>
<input type="hidden" name="vehcode" value="<%=vehcode %>" > </input>
<input type="hidden" name="vehno" value="<%=vehno %>" > </input>
<input type="hidden" name="owner" value="<%=ownername %>" > </input>
<input type="hidden" name="unid" value="<%=unitid %>" > </input>
<input type="hidden" name="group" value="<%=gpname %>" > </input>
<input type="hidden" name="soldout" value="<%=soldout %>" > </input>
<input type="hidden" name="oldveh" value="<%=vehno%>" />

<input type="hidden" name="vehtyp" value="<%=vehtyp%>" />

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

</body>
</html>

