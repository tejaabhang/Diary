<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
<%@ include file="header.jsp" %>
<%! 
	Connection con1;
	Statement stmt1,stmt2;
	String sql1,sql2;
	ResultSet rs1=null,rs2=null;
	String tm;
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
function OnChangeFunc2(dropdown)
{
	//alert("hi");
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
        if(SelValue1=="Other")
        {
             	showothertext="true"; 
             	document.viewunits.othertech.style.visibility="visible";
        }      
        else
	{ 
        	showothertext="false";
        	document.viewunits.othertech.value="";
        	document.viewunits.othertech.style.visibility="hidden";
        }
 }
function onchangecust(dropdown)
{
	var type=document.getElementById("mydiv").value;
	//var custsel=dropdown.selectedIndex;
	//var selcust=dropdown.options[vv1].value;
	if(type=="select")
	{
		alert("please select Type");
		return false;
	}
	return true;
}  
  
function OnChangeFunc3(dropdown)
{	
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
	var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
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
                       	 	// alert(reslt);
                       		document.getElementById("mydiv").innerHTML=reslt;
                        } 
       		}  
        var queryString = "?trans=" +SelValue1;
	ajaxRequest.open("GET", "Ajaxgetcust.jsp" + queryString, true);
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
         <p></p>
<%@ include file="headerStockadmin.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>
<form name="viewunits" method="post" action="delrecievedunit.jsp">
<%
	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);
	tm=td.getHours()+":"+td.getMinutes()+":"+td.getSeconds();
%>

<%
try 
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();
	stmt2=con1.createStatement();
        String sql1="",selectedvalue="",d1="",d2="";
        ResultSet rs1=null;
	String data1=request.getParameter("calender");
        String data2=request.getParameter("calender1");
	String receivefrom=request.getParameter("Recievefrom");
	String Statustype=request.getParameter("Statustype");
	String cust=request.getParameter("cust");
	String techname=request.getParameter("techname");
	String othertech=request.getParameter("othertech");
	String challan=request.getParameter("challan");
	//out.print(othertech);
	//String date3=data1;
	//String date4=data2;

	String typeval="";
	typeval=session.getValue("typevalue").toString();
	
	
String deleted=request.getParameter("deleted");
if(deleted==null)
{
}
else if(deleted.equals("deleted"))
{ %>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  <tr>
	<td align="center"> <font color="maroon"> <B> Successfully Deleted </B> </font> </td>
  </tr>
</table>	
<%
}
else
{ %>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  <tr>
	<td align="center"> <font color="maroon"> <B> Please select one of the checkbox to delete the entry. </B> </font> </td>
  </tr>
</table>
<%
} %>


<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<font size="1" color="">
			<b><blink> Note : Select any of the following to View Reports  </blink></b>
			</font>
	<font color="#2A0A12" size="3">
			<B> Units Received Details </font>
</td>
</tr>
</table>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<tr bgcolor="#BDBDBD">
	<td><div align="left">	
	<b>From Date</b>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" id="calender" name="calender"
				size="13" class="formElement" value="" readonly/>
	
	<script type="text/javascript">
        Calendar.setup(
        {
        	inputField  : "calender",         // ID of the input field
                ifFormat    : "%Y-%m-%d",     // the date format
                button      : "trigger"       // ID of the button
        }
                      );
        </script> 
	</div></td>
	<td><div align="left">
	<b>To Date</b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="calender1" name="calender1" 
			size="13" class="formElement" value="" readonly/>
  		
 	        <script type="text/javascript">
             		Calendar.setup(
             		{
                		 inputField  : "calender1",         // ID of the input field
                		 ifFormat    : "%Y-%m-%d",     // the date format
                 		button      : "trigger1"       // ID of the button
             		}
                     );
        	</script> 
	</div></td>
	<td><div align="left">
		<b> Tech Name :</b><select name="techname" class="formElement" onChange="OnChangeFunc2(this)"; >
          		<option value="Select">Select</option>
		<%
			sql2="select distinct(Techname) from t_techlist order by Techname asc ";
			rs2=stmt2.executeQuery(sql2);
			while(rs2.next())
	   	   	{
				String Tech=rs2.getString("techname");
				int len=Tech.length();
				//out.print(len);
				Tech=Tech.substring(0,len);
		%>
      				<option value="<%=Tech%>"> <%=Tech%> </option>
		<%
			}
		%>
				<option value="None">None</option>
				<option value="Ram Suryawanshi">Ram Suryawanshi</option>
				<option value="Other">  Other </option>
	    		</select>&nbsp;&nbsp;&nbsp;
		<input type="text" name="othertech" class="formElement" style="visibility:hidden">
	</div></td>
	</tr>
	<tr bgcolor="#BDBDBD">
	<td> <b>SendBy Type:</b>
		<select name="Recievefrom" class="formElement" onChange="OnChangeFunc3(this);">
				<option value="Select">Select</option>
				<option value="Customer">Customer</option>
				<option value="Ware House">Ware House</option>
				<option value="Vendor">Vendor</option>
				<option value="Office">Office</option>
		</select>	
	</td>
	<td ><b>SendBy Name  :</b>
	<div id="mydiv" align="left">
		<select name="cust" class="formElement" onChange="onchangecust(this);">
			 <option value="Select">Select </option> 
		</select>
	</div></td>
	<td ><b>Status Type:</b>
		<select name="Statustype" class="formElement">
				<option value="Select">Select</option>
				<option value="Defective">Defective</option>
				<option value="New">New</option>
				<option value="Service"> Service Unit</option>
		</select>
		<input type="hidden" name="lapun" value="1"></input>
	</td></tr>
	<tr bgcolor="#BDBDBD"><td colspan="3">
	<b><font size="2">Challan number / Courier Name/ UnitID :</font></b>
	 <input type="text" name="challan" class="formElement" size="15"></input>
	</td>
	</tr>
	<tr>
	<td colspan="7" align="center">
		<input type="submit" name="submit" value="Submit"
		class="formElement" onClick="viewunits.action='viewrecieved.jsp'; return true" /></input>
	</td>
	</tr>
</table>


<%
int j=1,q1=0;
//out.print(techname.length());
if(!(challan.equals("")) && receivefrom.equals("Select") && Statustype.equals("Select") && cust.equals("Select") && techname.equals("Select")&& data1.equals("")&& data2.equals(""))
{
	////System.out.println("Challan ---->"+challan);
	selectedvalue=challan;
	//sql1="Select * from t_unitreceived where (DC_NO like '"+challan+"' and TypeValue='Transworld' and Status<>'Deleted' and InTransit<>'Yes') or (UnitID like '"+challan+"' and TypeValue='Transworld' and Status<>'Deleted' and InTransit<>'Yes') or (Courier like '"+challan+"' and TypeValue='Transworld' and Status<>'Deleted' and InTransit<>'Yes') order by Rdate desc";
	sql1="Select * from t_unitreceived where (DC_NO like '"+challan+"' and TypeValue='"+typeval+"' and Status<>'Deleted' and InTransit<>'Yes') or (UnitID like '"+challan+"' and TypeValue='"+typeval+"' and Status<>'Deleted' and InTransit<>'Yes') or (Courier like '"+challan+"' and TypeValue='2' and Status<>'Deleted' and InTransit<>'Yes') and DC_NO != 0 order by Rdate desc";

}
else if(receivefrom.equals("Select") && Statustype.equals("Select") && cust.equals("Select") && techname.equals("Select")&& !(data1.equals("")&& data2.equals("")))
{
	q1=1;
	String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//sql1="Select * from t_unitreceived where Rdate between'"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
    sql1="Select * from t_unitreceived where Rdate between'"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
	selectedvalue=date3+" "+"To"+" "+date4;

//out.print("...only date....");

}
 else if(!(receivefrom.equals("Select"))&& Statustype.equals("Select")&& !(cust.equals("Select"))&& techname.equals("Select")&& data1.equals("")&& data2.equals(""))
{
	q1=2;
	selectedvalue=cust;
//sql1="select * from t_unitreceived where Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
sql1="select * from t_unitreceived where Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' order by Rdate desc";
//out.print("..."+selectedvalue+"....");
}
else if((receivefrom.equals("Select"))&& Statustype.equals("Select")&& (cust.equals("Select"))&&  
!(techname.equals("Select")) && othertech.equals("") && data1.equals("")&& data2.equals(""))
{
	q1=3;
	selectedvalue=techname;
	//out.print("...only Tech....");
	//sql1="select * from t_unitreceived where TechName like '%"+techname+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where TechName like '%"+techname+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
//out.print(sql1);
}

else if((receivefrom.equals("Select"))&& Statustype.equals("Select")&& (cust.equals("Select"))&&  
!(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("")&& data2.equals(""))
{
	q1=4;
	//out.print("...only otherTech....");
	selectedvalue=othertech;
	//sql1="select * from t_unitreceived where TechName like '%"+othertech+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld'  order by Rdate desc";
	sql1="select * from t_unitreceived where TechName like '%"+othertech+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"'  and DC_NO != 0 order by Rdate desc";
}

else if(receivefrom.equals("Select")&& !(Statustype.equals("Select")) && cust.equals("Select") && techname.equals("Select") && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=5;
	//out.print("...only status....");
	selectedvalue=Statustype +"  Units";
	//sql1="select * from t_unitreceived where Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}
else if(!(receivefrom.equals("Select"))&& (Statustype.equals("Select"))&& !(cust.equals("Select"))&& ((techname.equals("Select")) && othertech.equals("")) && !(data1.equals("")&& data2.equals("")))
{
	q1=6;
	String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust && date....");
	selectedvalue=cust+" for period from"+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}
else if(receivefrom.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && techname.equals("Select") && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=7;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status && date....");
	selectedvalue=Statustype+" for period from"+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}
else if((receivefrom.equals("Select"))&& (Statustype.equals("Select"))&& (cust.equals("Select"))&& !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("") && data2.equals("")))
{
	q1=8;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Tech & date....");
	selectedvalue=techname+" for period from"+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}

else if((receivefrom.equals("Select"))&& !(Statustype.equals("Select"))&& cust.equals("Select") && !(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=9;
	//out.print("...Tech & Status....");
	selectedvalue=techname+" for "+Statustype+"Units";
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}

else if(receivefrom.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=10;
	//out.print("...OtherTech & Status....");
	selectedvalue=othertech+" for "+Statustype+"Units";
	//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}
else if(!(receivefrom.equals("Select")) && Statustype.equals("Select") && !(cust.equals("Select")) && !(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=11;
	//out.print("...Tech & Cust....");
	selectedvalue=cust+" for Techanician as"+techname+"Units";
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld'  order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}

else if(!(receivefrom.equals("Select"))&& Statustype.equals("Select") && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=12;
	//out.print("...otherTech & Cust....");
	selectedvalue=othertech+" for "+cust+"Units";
	//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";

}

else if(!(receivefrom.equals("Select"))&& !(Statustype.equals("Select")) && !(cust.equals("Select"))&& techname.equals("Select") && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=13;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & status & date....");
	selectedvalue=Statustype+"Units of"+cust+"for period from"+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && techname.equals("Select") && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=14;
	//out.print("...cust & status ...");
	selectedvalue=Statustype+"  Units of "+cust;
	//sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%'  and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%'  and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select"))&& (Statustype.equals("Select")) && !(cust.equals("Select"))&& !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=15;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & Tech & date....");
	selectedvalue=techname+" for "+cust+" for period from "+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where TechName like '%"+techname+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where TechName like '%"+techname+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select"))&& (Statustype.equals("Select")) && !(cust.equals("Select"))&& !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=16;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & Othertech & date....");
	selectedvalue=othertech+" for "+cust+" for period from "+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(receivefrom.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=17;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status & tech & date....");
	selectedvalue=techname+" for "+Statustype+" for period from "+date3+" TO "+date4;
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(receivefrom.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=18;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status & othertech & date....");
	selectedvalue=othertech+" for "+Statustype+" for period from "+data1+" TO "+data2;
	//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Rdate between '"+data1+"' and '"+data2+"' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=19;
	//out.print("...Status & tech & cust....");
	selectedvalue=techname+" for "+cust+" 's  "+Statustype+"Units ";
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=20;
	//out.print("...Status & othertech & cust....");
	selectedvalue=othertech+" for "+cust+" 's  "+Statustype+"Units ";
	//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}


else if(!(receivefrom.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=20;
	//out.print("...Status & tech & cust & date....");
	selectedvalue=techname+" for "+cust+" 's  "+Statustype+"Units for in period from "+data1+" To "+data2;
	//sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"'and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
	sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"'and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=20;
	//out.print("...Status & tech & cust & date....");
selectedvalue=othertech+" for "+cust+" 's  "+Statustype+"Units in period from "+data1+" To "+data2;
//sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"'and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='Transworld' order by Rdate desc";
sql1="select * from t_unitreceived where  TechName like '%"+othertech+"%' and Utype like '%"+Statustype+"%' and Transporter like '%"+cust+"%' and Rdate between '"+data1+"' and '"+data2+"'and Status<>'Deleted' and InTransit<>'Yes' and TypeValue='"+typeval+"' and DC_NO != 0 order by Rdate desc";
}

else if(!(receivefrom.equals("Select")) && cust.equals("Select"))
	{
%>
	<script language="javascript">
		alert("Please You have to select both Sender Name and Sender Type");
	</script>
<%

	}

session.setAttribute("sql1", sql1);
//System.out.println("ssql-->"+sql1);
rs1=stmt1.executeQuery(sql1);
%>


<%
	String del=request.getParameter("deleted");
	if(null==del)
	{
	}
	else if(del.equals("yes"))
	{
%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
        		<td><div align="center">
				<font color="blue" ><B><U>Deleted Successfully </U> </B></font>
			</div></td>
        	</tr>
		</table>
<%
	}
	else if(del.equals("warning"))
        {
%>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
                <tr>
	                <td><div align="center">
				<font color="blue">
					<B><U> Please select  checkbox which you want to delete
					</U></B>
				</font>
			</div></td>
		</tr>
        	</table>
<% 	} 
  	else
	{
	}
%>
<br></br>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
        	<td> <div align="center"> 
			<font color="#2A0A12" size="3">
				<B> Units Received  Details of 
			</font>
			<font color="maroon" size="3"><%=selectedvalue %> </B></font>
		</div></td>
	</tr>
</table>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<tr bgcolor="#BDBDBD"> 
	<td><div align="left">
		<input type="submit" name="submit" value="Delete" class="formElement"/>
	</div>
	<div align="right">
		<a href="exportviewRecieved.jsp?selvalue=<%=selectedvalue %>" title="Export to Excel">
		<img src="images/excel.jpg" width="17px" height="17px" border="0"/></a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="printviewrecieved.jsp?selvalue=<%=selectedvalue %>" title="Print">
			<img src="images/print.jpg" width="20px" height="20px"border="0"/>
		</a>
	</div></td>
</tr>
</table>
<br>
<table border="0" width="750px" align="center" class="sortable">
<tr bgcolor="#BDBDBD"> 
         <td> </td>
         <td> <div align="center"><b> Sr. No.</b> </div> </td>
         <td> <div align="center"><b> Unit Id </b></div> </td>
         <td> <div align="center"><b> Status of Unit </b></div> </td>
         <td> <div align="center"><b> Date </b></div> </td> 
         
		 <td> <div align="center"><b> DC NO </b></div> </td>        
         <td> <div align="center"><b> Recieved From </b></div> </td> 
         <td> <div align="center"><b> Type </b></div> </td> 
         <td> <div align="center"><b> Tech Name </b></div> </td> 
         <td> <div align="center"><b> Location </b></div></td>
</tr>
<tr>
<%
	while(rs1.next())
        { 
		String unitid=rs1.getString("UnitID");
        	String rdte=rs1.getString("Rdate");
		String date5=new SimpleDateFormat("dd-MMM-yyyy").format
				(new SimpleDateFormat("yyyy-MM-dd").parse(rdte));
	        String tech=rs1.getString("TechName");
		//out.print(tech);
        	String ent=rs1.getString("EntBy");
        	String dcno=rs1.getString("DC_NO");
        	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rdte);
        	Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
        	String nwfrmtdte=formatter.format(datefrmdb);   
%>
	<input type="hidden" name="unitid<%=j %>" value="<%=unitid %>" > </input>
	<input type="hidden" name="dte<%=j %>" value="<%=rdte %>" > </input>
<tr>
		<td> <input type="checkbox" name="del<%=j %>" value="del<%=j %>"> </input></td>
              	<td> <div align="center"> <%=j %> </div> </td> 
              	<td> <div align="center"> <%=rs1.getString("UnitID") %> </div></td>
              	<td> <%=rs1.getString("Utype")%> </td>
              	<td> <div align="center"><%=date5 %> </div> </td>
	<%
               	if(dcno==null || dcno.equals("")) 
		{
	 %>
 		<td> <div align="center"> - </div> </td>
	<%
		} 
		else
		{
	%>
              		<td><div align="center"><%=rs1.getString("DC_NO") %></div></td>
	<%
		}
	%>
              	<td> <div align="center"><%=rs1.getString("transporter") %> </div> </td>
              	<td> <div align="center"><%=rs1.getString("Utype") %> </div> </td>
		<td> <div align="center"> <%=tech %> </div> </td>
		<td> <div align="center"> <%=rs1.getString("Lname") %> </div> </td>
</tr>
<%
		j++; 
	}
%>
</table>
<input type="hidden" name="cntr" value="<%=j %>" />

<%
}
catch(Exception e)
{
	//out.print("Exception --->"+e);
}
finally
{
	con1.close();
}
%>
<!-- code end here --->
<table border="0" width="750px" height="450px">
<tr>
	<td> </td>	
</tr>
</table>
</div>
</div>
<div id="gbox-bot1">
</div>
</div>
</div>
</div>
</div>
<div id="copyright">
 	Copyright © 2008 by Compressor Technologies Ltd. All Rights Reserved.
</div>
</form>
</body>
</html>


