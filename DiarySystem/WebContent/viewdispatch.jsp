<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
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


function validate()
  			{
                           var v1=document.viewunits.challan.value;
                           var validChar='0123456789,';   // legal chars
                           var   strlen=v1.length;       // test string length
                          
                           if(!(strlen==0||strlen>20))
                               {
                                v1=v1.toUpperCase(); // case insensitive
                               	for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
                                	{
					if(validChar.indexOf(v1.charAt(ic))<0)
                                        	{		
                                           	 alert("please enter a valid Unit ID!");
                                            	 return false;
                                       		 }
                                	} // end scanning
				}
                           return true;       
                        }
    
    
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
<form Name="viewunits" method="post" action="deldispatchunit.jsp" onSubmit="return validate();">
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
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();
	stmt2=con1.createStatement();
        String sql1="",selectedvalue="",d1="",d2="";
        ResultSet rs1=null;
	sql2="select distinct(Techname) as tech from t_techlist order by TechName asc ";

 rs2=stmt2.executeQuery(sql2);

	String data1=request.getParameter("calender");
        String data2=request.getParameter("calender1");
	String dispatchto=request.getParameter("DispatchTo");
	String Statustype=request.getParameter("Statustype");
	String cust=request.getParameter("cust");
	String techname=request.getParameter("techname");
	String othertech=request.getParameter("othertech");
	String challan=request.getParameter("challan");
	//out.print(othertech);
	//String date3=data1;
	//String date4=data2;
	

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
	
        <td > <font size="1" color=""><b><blink> Note : Select any of the following to View Reports  </blink></b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2A0A12" size="3">
        <B> Units Dispatch Details</B> </font></td>
</tr>
</table>
<br></br>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD">
	<td width="250px"><div align="left">	
	<b>From Date:</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" id="calender" Name="calender" size="13" 
		class="formElement" value="" readonly/>
	
		
	
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
	<td width="250px">
		<div align="left">
		<b>To Date:</b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="calender1" Name="calender1" size="13" class="formElement" value="" readonly/>
          	<script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
        	</script> 
	</div>
	</td>
	<td width="250px"><div align="left">	
                <b> Tech Name : </b>
  	   <select Name="techname" class="formElement" onChange="OnChangeFunc2(this);" >
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
	<% } %>
		<option value="Ram Suryawanshi">Ram Suryawanshi</option>
		<option value="None">None</option>
      		<option value="Other">  Other </option>
	    </select>&nbsp;&nbsp;&nbsp;
		<input type="text" Name="othertech" class="formElement" style="visibility:hidden">
	</div></td>
	</tr>
	<tr bgcolor="#BDBDBD">
            <td width="250px"> <b>Send To Type:</b>
		<select Name="DispatchTo" class="formElement" onChange="OnChangeFunc3(this);">
				<option value="Select">Select</option>
				<option value="Customer">Customer</option>
				<option value="Ware House">Ware House</option>
				<option value="Vendor">Vendor</option>
				<option value="Office">Office</option>
		</select>	
	</td>
        <td width="300px"><b><font size="2">SendTo Name  :</font></b>
	<div id="mydiv" align="left">
		<select Name="cust" class="formElement" onChange="onchangecust(this);">
			 <option value="Select">Select </option> 
		</select>
	</div>
	</td>
        <td width="200px"><b>Status Type:</b>
		<select Name="Statustype" class="formElement">
				<option value="Select">Select</option>
				<option value="-">-</option>
				<option value="New">New</option>
				<option value="Repaired">Repaired</option>
		</select>
		<input type="hidden" Name="lapun" value="1"></input>
	</td>
	</tr>
	<tr bgcolor="#BDBDBD"><td colspan="3">
                <b><font size="2">Challan number / UnitID :</font></b>
	 <input type="text" name="challan" class="formElement" size="15"></input>
	</td>
	</tr>
	<tr>
	<td colspan="7" align="center">
	<input type="submit" Name="submit" value="Submit" class="formElement" onClick="viewunits.action='viewdispatch.jsp'; return true"></input>
	</td>
	</tr>
</table>
<br></br>
<%
int j=1,q1=0;
if(!(challan.equals("")) && dispatchto.equals("Select") && Statustype.equals("Select") && cust.equals("Select") && techname.equals("Select")&& data1.equals("")&& data2.equals(""))
{
	selectedvalue=challan;
        sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.Status,m.DisName,m.ChalanNo,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and  (m.DisName in ("+challan+") or m.UnitID in ("+challan+") or m.ChalanNo in ("+challan+") ) group by m.unitid order by m.Dispdate desc ";
	//sql1="Select * from db_gps.t_unitmasterhistory where (DisName in '"+challan+"' or UnitID in '"+challan+"' or ChalanNo in '"+challan+"') and Status like 'Dispatched' order by DispDate desc";
//out.print(sql1);
}

else if(dispatchto.equals("Select") && Statustype.equals("Select") && cust.equals("Select") && techname.equals("Select")&& !(data1.equals("")&& data2.equals("")))
{
	q1=1;
	String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

        sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.Status,m.ChalanNo,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and m.DispDate between'"+data1+"' and '"+data2+"'  group by m.unitid order by m.Dispdate desc ";
	//sql1="Select * from t_unitmasterhistory where DispDate between'"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
       // out.print(sql1);
	selectedvalue=" "+date3+" "+"To"+" "+date4;

//out.print("...only date....");

}
 else if(!(dispatchto.equals("Select"))&& Statustype.equals("Select")&& !(cust.equals("Select")) && techname.equals("Select")&& data1.equals("")&& data2.equals(""))
{
	q1=2;
	selectedvalue=cust;
        sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust like'"+cust+"'  group by m.unitid order by m.Dispdate desc ";
        //out.print(sql1);
        //out.print("..."+selectedvalue+"....");
}
else if((dispatchto.equals("Select")) && Statustype.equals("Select") && (cust.equals("Select"))&&  
!(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=3;
	selectedvalue=techname;
	//out.print("...only Tech....");
         sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+techname+"'  group by m.unitid order by m.Dispdate desc ";
	//sql1="select * from t_unitmasterhistory where HoldBy like '%"+techname+"%' and Status='Dispatched' order by DispDate desc";
}

else if((dispatchto.equals("Select"))&& Statustype.equals("Select")&& (cust.equals("Select"))&&  
!(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("")&& data2.equals(""))
{
	q1=4;
	//out.print("...only otherTech....");
	selectedvalue=othertech;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+othertech+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where HoldBy like '%"+othertech+"%' and Status='Dispatched' order by DispDate desc";
}

else if(dispatchto.equals("Select")&& !(Statustype.equals("Select")) && cust.equals("Select") && techname.equals("Select") && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=5;
	//out.print("...only status....");
	selectedvalue=Statustype +"  Units";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where InstType like '%"+Statustype+"%' and Status='Dispatched' order by DispDate desc";
}
else if(!(dispatchto.equals("Select"))&& (Statustype.equals("Select"))&& !(cust.equals("Select"))&& ((techname.equals("Select")) && othertech.equals("")) && !(data1.equals("")&& data2.equals("")))
{
	q1=6;
	String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust && date....");
	selectedvalue=cust+" for period from"+date3+" TO "+date4;
        sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust like '"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"'  group by m.unitid order by m.Dispdate desc ";
	//sql1="select * from t_unitmasterhistory where  HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
        //out.print(sql1);
}
else if(dispatchto.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && techname.equals("Select") && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=7;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status && date....");
	selectedvalue=Statustype+" for period from"+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and m.InstType like'"+Statustype+"'  and m.DispDate between'"+data1+"' and '"+data2+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  InstType like '%"+Statustype+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";

} 
else if((dispatchto.equals("Select"))&& (Statustype.equals("Select"))&& (cust.equals("Select"))&& !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("") && data2.equals("")))
{
	q1=8;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Tech & date....");
	selectedvalue=techname+" for period from"+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+techname+"' and m.DispDate between'"+data1+"' and '"+data2+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+techname+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";

}

else if((dispatchto.equals("Select"))&& !(Statustype.equals("Select"))&& cust.equals("Select") && !(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=9;
	//out.print("...Tech & Status....");
	selectedvalue=techname+" for "+Statustype+"Units";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+techname+"' and  m.InstType like'"+Statustype+"'   group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  techname like '%"+techname+"%' and InstType like '%"+Statustype+"%' and Status='Dispatched' order by DispDate desc";

}

else if(dispatchto.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=10;
	//out.print("...OtherTech & Status....");
	selectedvalue=othertech+" for "+Statustype+"Units";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+othertech+"' and  m.InstType like'"+Statustype+"'   group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and InstType like '%"+Statustype+"%' and Status='Dispatched' order by DispDate desc";

}
else if(!(dispatchto.equals("Select"))&& Statustype.equals("Select") && !(cust.equals("Select")) && !(techname.equals("Select")) && (othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=11;
	//out.print("...Tech & Cust....");
	selectedvalue=cust+" for Techanician as"+techname+"Units";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and o.Tech like'"+techname+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitreceived where  TechName like '%"+techname+"%' and DName like '%"+cust+"%' and Status='Dispatched' order by DispDate desc";

}

else if(!(dispatchto.equals("Select"))&& Statustype.equals("Select") && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=12;
	//out.print("...otherTech & Cust....");
	selectedvalue=othertech+" for "+cust+"Units";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and o.Tech like'"+othertech+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and HoldBy like '%"+cust+"%' and Status='Dispatched' order by DispDate desc";

}

else if(!(dispatchto.equals("Select"))&& !(Statustype.equals("Select")) && !(cust.equals("Select"))&& techname.equals("Select") && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=13;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & status & date....");
	selectedvalue=Statustype+"Units of"+cust+"for period from"+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && techname.equals("Select") && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=14;
	//out.print("...cust & status ...");
	selectedvalue=Statustype+"  Units of "+cust;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%'  and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select"))&& (Statustype.equals("Select")) && !(cust.equals("Select"))&& !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=15;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & Tech & date....");
	selectedvalue=techname+" for "+cust+" for period from "+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"' and o.Tech like'"+techname+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where HoldBy like '%"+techname+"%' and HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select"))&& (Statustype.equals("Select")) && !(cust.equals("Select"))&& !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=16;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...cust & Othertech & date....");
	selectedvalue=othertech+" for "+cust+" for period from "+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"' and o.Tech like'"+othertech+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(dispatchto.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && othertech.equals("") && !(data1.equals("")) && !(data2.equals("")))
{
	q1=17;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status & tech & date....");
	selectedvalue=techname+" for "+Statustype+" for period from "+date3+" TO "+date4;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+techname+"' and m.DispDate between'"+data1+"' and '"+data2+"' and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+techname+"%' and InstType like '%"+Statustype+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(dispatchto.equals("Select") && !(Statustype.equals("Select")) && cust.equals("Select") && !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=18;
String date3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data1));
	String date4=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(data2));
	//out.print(date3);

	//out.print("...Status & othertech & date....");
	selectedvalue=othertech+" for "+Statustype+" for period from "+data1+" TO "+data2;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Tech like'"+othertech+"' and m.DispDate between'"+data1+"' and '"+data2+"' and m.InstType like'"+Statustype+"' group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and InstType like '%"+Statustype+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && othertech.equals("") && data1.equals("") && data2.equals(""))
{
	q1=19;
	//out.print("...Status & tech & cust....");
	selectedvalue=techname+" for "+cust+" 's  "+Statustype+"Units ";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and o.Tech like'"+techname+"' and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+techname+"%' and InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%' and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && data1.equals("") && data2.equals(""))
{
	q1=20;
	//out.print("...Status & othertech & cust....");
	selectedvalue=othertech+" for "+cust+" 's  "+Statustype+"Units ";
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and o.Tech like'"+othertech+"' and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%' and Status='Dispatched' order by DispDate desc";
}
else if(!(dispatchto.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && (othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=21;
	//out.print("...Status & tach & cust && date....");
	selectedvalue=techname+" for "+cust+" 's  "+Statustype+"Units in period from"+data1+" To "+data2;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"' and o.Tech like'"+techname+"' and m.InstType like'"+Statustype+"' group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+techname+"%' and InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}
else if(!(dispatchto.equals("Select")) && !(Statustype.equals("Select")) && !(cust.equals("Select")) && !(techname.equals("Select")) && !(othertech.equals("")) && !(data1.equals("")) && !(data2.equals("")))
{
	q1=22;
	//out.print("...Status & othertech & cust & Date....");
	selectedvalue=othertech+" for "+cust+" 's  "+Statustype+"Units in period from"+data1+" To "+data2;
	sql1="select m.DispDate,m.InstType,m.UnitID,m.ModeofDispatch,m.ChalanNo,m.Status,m.DisName,o.DispatchAdd,o.Cust,o.Tech from db_CustomerComplaints.t_unitorder o,db_gps.t_unitmasterhistory m where o.Reqno=m.OrderNo and o.Cust='"+cust+"' and m.DispDate between'"+data1+"' and '"+data2+"' and o.Tech like'"+othertech+"' and m.InstType like'"+Statustype+"'  group by m.unitid order by m.Dispdate desc ";
        //sql1="select * from t_unitmasterhistory where  HoldBy like '%"+othertech+"%' and InstType like '%"+Statustype+"%' and HoldBy like '%"+cust+"%' and DispDate between '"+data1+"' and '"+data2+"' and Status='Dispatched' order by DispDate desc";
}

else if(!(dispatchto.equals("Select")) && cust.equals("Select"))
	{
	%>
		<script language="javascript">
			alert("Please You have to select both Sender DDName and Sender Type");
		</script>
	<%

	}
	
else
{
}
session.setAttribute("sql1", sql1);
rs1=stmt1.executeQuery(sql1);                    
%>

<% String del=request.getParameter("deleted");
   if(null==del)
   {
   }
   else if(del.equals("yes"))
   { %>
         <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
              <tr>
                  <td> <div align="center"> <font color="blue" > <B> <U> Deleted Successfully </U> </B></font></div>       </td>
            </tr>
         </table>
<% }  else if(del.equals("warning"))
        {  %>
		<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
                  <tr>
                  <td> <div align="center"> <font color="blue" > <B> <U> Please select  checkbox which you want to delete </U> </B></font></div>       </td>            
            </tr>
         </table>
<% } 
   else
   {
   } %>
    <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
     <tr>
         <td> <div align="center"> 
		<font color="maroon" size="3">
                <B> Units Dispatch Details of  </B></font><font color="green" size="3"><B><%=selectedvalue %> </B></font></div></td>
	
     </tr>
  </table>

<table border="0" width="750px"> 
<tr bgcolor="#BDBDBD"> 
         <!-- del functionality commented-->
<!--td> <div align="left"><input type="submit" Name="submit" value="Delete" class="formElement"/>
      </div>
</td--> 
<td> <div align="right"> <a href="exportviewdispatch.jsp?selvalue=<%=selectedvalue %>" title="Export to Excel"><img src="images/excel.jpg" width="17px" height="17px" border="0"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="printviewdispatch.jsp?selvalue=<%=selectedvalue %>" title="Print">
<img src="images/print.jpg" width="20px" height="20px"border="0"/>
</a>
</div></td>
</tr>
  </table>

<br>
  <table border="1" width="750px"  class="sortable">
     <tr bgcolor="#BDBDBD">
         <!--td> </td-->
         <td> <div align="center"> <b>Sr. No.</b> </div> </td>
          <td> <div align="center"><b>Dispatch Date </b></div> </td> 
         <td> <div align="center"> <b>Unit Id</b></div> </td>
          <td> <div align="center"><b>Unit Type </b></div> </td> 
          <td> <div align="center"> <b>Chalan No. </b></div> </td>
         <td> <div align="center"><b> Dispatch TO </b></div> </td> 
	 <td> <div align="center"> <b>Dispatch Details </b></div> </td>        
         <td> <div align="center"><b> Technician</b> </div> </td> 
	 <td> <div align="center"> <b>Courier Details </b></div> </td> 
         
     </tr>
     
    
         <% 
               String date5;     
         while(rs1.next())
            { 
            
              String unitid=rs1.getString("m.UnitID");
              String rdte=rs1.getString("m.DispDate");
             try{date5=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rdte));}catch (Exception ex) {date5="-";}
              String tech=rs1.getString("o.Tech");
             // String =rs1.getString("EntBy");
              String dname=rs1.getString("m.DisName");
              String cust1=rs1.getString("o.Cust");
              String instype=rs1.getString("m.InstType");
              String mode=rs1.getString("m.ModeofDispatch");
              String chal=rs1.getString("m.ChalanNo");
             // java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(rdte);
             // Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             // String nwfrmtdte=formatter.format(datefrmdb); 
               
         %>
<input type="hidden" Name="unitid<%=j %>" value="<%=unitid %>" > </input>
        <input type="hidden" Name="dte<%=j %>" value="<%=rdte %>" > </input>
        <!--td> <input type="checkbox" Name="del<%=j %>" value="del<%=j %>"> </input></td-->
         <tr>
              <td> <div align="center"> <%=j %> </div> </td> 
              <td> <div align="center"><%=date5 %> </div> </td>
              <td> <div align="center"> <%=unitid%> </div> </td>
              <td> <div align="center"><%=instype %> </div> </td>
                <td> <div align="center"><%=chal %> </div> </td>
	      <td> <div align="center"><%=cust1 %> </div> </td>
              <td> <div align="center"><%=dname %> </div> </td>
              <td> <div align="center"> <%=tech %> </div> </td>
	      <td> <div align="center"> <%=mode %> </div> </td>
	</tr>
       <% j++;   }  %>


    
    
   
  </table>
<input type="hidden" Name="cntr" value="<%=j %>" />

<%
}
catch(Exception e)
{
	//////out.print("Exception --->"+e);
}
finally
{
	con1.close();
	
}
%>
<!-- code end here -->
</form>
<table border="0" width="750px" height="450px">
   <tr>
 	<td> </td>	
   </tr>
</table>
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

