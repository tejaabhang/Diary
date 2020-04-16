<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<head>
<style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background:}</style>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"charset="utf-8" />
	
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script src="sorttable.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<link rel="stylesheet" href="css/ajax-tooltip.css" media="screen" type="text/css"/>


<script type="text/javascript">
function validate()
{ 
//alert("hi>>>>");
try{

var e= document.getElementsByName("chkbx");
//alert(">>"+e.length);
var ch=0;
var j=0;
for(var cnt =0;cnt < e.length;cnt++)
{

	if(document.getElementById("cb1"+j).checked==true)
	{
     ch++;
	}

	
}



//alert(">>1235")

var v1=document.callrec.comment.value;

	if(v1.length<=2)
	{
		alert("Please enter Comment");
		return false;
	}
	//var calltype = document.getElementById("calltype").value;
	//if(calltype=='Select'){
		//alert("Please select Call Type");
		//return false;
	//}
	var row7 = document.getElementById("reason").value;
//	alert(row7)
	if(row7=='Select'){
		alert("Please select Reason of call");
		return false;
	}
	var VehicleTracking=document.getElementById("VehicleTracking").value;
//	alert(VehicleTracking);
	//var diary=document.getElementById("diary").value;
//	alert(diary);
	var SalesFollowup=document.getElementById("SalesFollowup").value;
//	alert(SalesFollowup);
	if(row7=='Vehicle Tracking' && VehicleTracking=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='diary' && diary=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='Sales Followup' && SalesFollowup=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}

	if(ch=="0")
	{
	// alert("Please select atleast one checkbox");
	//window.location="addcall.jsp";
	return true;
		}else{
//alert("else loop===============");
			 var e= document.getElementsByName("chkbx");
			   // alert("111")
				  
				    var cnt=0;
				    var j=0;
				  var z=e.length;
				  //alert("else loop==============="+e.length);
				  for( cnt=0;cnt<e.length;cnt++)
				  {
					  //alert("inside for loop==============="+cnt);

						  try{

							  if((document.getElementById("cb1"+j)).checked)
							  {

								 // alert("==inside checkbox checke loop===>"+document.getElementById("vehiclereason"+j).value);
								  
						         if(document.getElementById("vehiclereason"+j).value=="Select")
					         {
					              alert("Please select reason to reallocate");

					      return false;
					              
					         }


							  }
					         }catch(e)
					         {
					//alert("=====>"+e);
					         }


j++;
					         
				  }
			
			mycheckbox();
		} 
	return true;
	
}catch(e)
{
alert(e);
}
	
}

function selectAll()
	{
      // alert("HIIII");
  try{
		var cntr=document.callrec.cntr.value;

			//alert("HIIII11111   ");
		cntr=cntr-1;
	  // alert(document.getElementById("cb1"+j).value)
		if(document.callrec.maincb.checked==true)
		{
			//alert("unside>>>");
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=true;
			}
		}
		else
		{
			
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=false;
			}
		
		}
  }catch(e){
     alert(e); 
		}
		  //alert("HIIII 2222");
		}


function mycheckbox()
{
	try{
     // var p="";
  	//var p=document.getElementById("ab"+i).value;
  //	alert(">>124515>>");
	  var e= document.getElementsByName("chkbx");
   // alert("111")
	  var z=e.length;
//if (z>1){

	//z=z-1;
//}
     
	  //alert(z);
	  //alert("@@@@@@@@@@@@z@  "+z);
	  var cnt=0;
    var a="";
      var b;
      var d;
      var f;
     var i=1;
     var j=0;
     var a1="";
     var a2="";
     var a3="";
     var a4="";
     var a5="";
     var a6="";
     var a7="";
     var a8="";
     var a9="";
     var a10="";
     var a11="";
   var reason="";
       
var a12="";
var a13="";
     
	  for( cnt=0;cnt<e.length;cnt++)
	  {
  	  try
  	  {
  		  
	    //if(document.addinstn.elements("ab"+i).name=="chkbx"){
     try{   
     if((document.getElementById("cb1"+j)).checked){
  	   //f=document.getElementById("aw"+i).value;
		//  alert("<><<>  vehregno>>>");
        // a=a+","+document.getElementById("cb1"+j).value;
         
         
         
         
          a1=a1+","+document.getElementById("vh"+j).innerHTML;
          a2=a2+","+document.getElementById("td"+j).innerHTML;
         a3=a3+","+document.getElementById("tct"+j).innerHTML;
          a4=a4+","+document.getElementById("dt"+j).innerHTML;
          a5=a5+","+document.getElementById("loc"+j).innerHTML;
          a6=a6+","+document.getElementById("calender"+i).value;
         // a7=document.getElementById("attadd"+j).value;
         
         
        // a12=a12+","+document.getElementById("vhcode"+i).innerHTML;
         
         a13=a13+","+document.getElementById("vhcode"+j).value;
        
          // alert(">>j>>>   "+j)
         
            // a7=document.getElementsByName("attadd");
             if (document.getElementById("attadd"+j).value!="select")
             {
            	//alert("inside");
            	 a7=a7+","+document.getElementById("attadd"+j).value;
            	
            	 
            	 
            }

            
               
             if (document.getElementById("attadd1"+j).value!="select")
             {
            	//alert("inside111");
            	 a8=a8+","+document.getElementById("attadd1"+j).value;
            	
            	 
            	 
            }

 //alert("11111111111");
//alert("====>"+document.getElementById("vehiclereason"+j).value);
             


try{
      if (document.getElementById("vehiclereason"+j).value!="select")
             {
            	//alert("inside111");
            	 reason=reason+","+document.getElementById("vehiclereason"+j).value;
            	
            	 
            	 
            }
             
}catch(e)
{

//alert("exception in getting vehicle reason===>"+e);

}
               //a8=a8+","+document.getElementById("altby"+j).innerHTML;
          a9=a9+","+document.getElementById("cntprsn"+j).value;
          a10=a10+","+document.getElementById("cmnt"+j).value;
          a11=document.getElementById("comment").value;
        
     //alert(">>reason>>>   "+reason);
     //alert(">>a1=======>"+a1);
     //alert(">>a6."+a6);
    // alert(">>a7.>>>>   "+a7);
    // alert(">>a8.>>>>   "+a8);
    // alert(">>a9.>>>>   "+a9);
     //alert(">>a10.>>>>   "+a10);
    // alert(">>strUser"+strUser);
         //alert(">>1"+a1+">>2"+a2+">>3"+a3+">>4"+a4+">>5"+a5+">>>6"+a6+">7"+a7+">>>8"+a8+">>9"+a9+">>10"+a10);
      //  f=f+","+document.getElementById("aw"+i).value;
        
           }
		
		 }catch(e){
      //alert("Exception--------->"+e);
     }
	    //}
		 
	    j++;
	    i++;
  	  }
  	  catch(e)
  	  {
      	 // alert("Exception-----^^^^^---->"+e);
  	  }
	    }
	  
	//  alert("@@@@@@@"+q);          
	//  alert("111111111"+d);
	//alert(f);
	try{
	 // c=document.getElementById("xyz").value; 
		//b=document.getElementById("instruction").value;
  
  
	}catch(e)
	{
  	alert(e);
	}    
   //  alert(f);
    try{
    //alert(">>>>hi11111" +a+"  8888888     "+d);
	//  window.location="addcontent.jsp?a="+a+"&d="+d;
	//alert(a);
	//alert(d);
  
 // var q=a.substring(1,a.length);
 // alert("@@@@@@@"+q);  
   //  alert("###########"+q);
	//var q=p.replace(",");
 
 
// alert(q);
// var dss=document.getElemnentById("transporter").options[document.getElemnentById("transporter").selectedIndex].value;
 //alert(document.getElementById('transporter').options[document.getElementById('transporter').selectedIndex].value);
 //alert(dss);
	//if(q=="" || q==null)
//	{
		// alert("Please select atleast one checkbox option");
		//return false;
	//}
	 //alert(">>>>End of loop");
	// alert(">>a12 vehcode in alert>>>   "+a12);
	// alert(">>a13 vehcode in alert>>>   "+a13);


 //return false;


     document.callrec.action="addcalInsert.jsp?a1="+a1+"&a2="+a2+"&a3="+a3+"&a4="+a4+"&a5="+a5+"&a6="+a6+"&a7="+a7+"&a8="+a8+"&a9="+a9+"&a10="+a10+"&a11="+a11+"&a12="+a13+"&reason11="+reason ;


	  document.callrec.submit();
	  //alert("Please select the atleast one option");
  
    }catch(e){
    //  alert(e);
  }
	}catch(e){
      
  }
 	
	 }





   
function call(){
	var row7 = document.getElementById("reason").value;
//	alert(row7);
	if(row7=='Vehicle Tracking'){
		document.getElementById("1").style.display="";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
		
		}else if(row7=='FleetView'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="";
			document.getElementById("3").style.display="none";
		
		}else if(row7=='Sales Followup'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="";
		
		}else{
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="none";
				}
	
		
}
</script>

<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
} 
.popupnew { 
	background-color : #98AFC7;
	position: absolute;
	visibility: visible;
} 
.popupx { 
	background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>
</head>
<body style="background-color:#F8FCFF ">

<%!
String reciever,caller,calltype,thedate,thetime,transporter,comment,username,sql,mob,loct,designation;
String chk="",stg1="",stg2="",stg3="",stg4="",q="";
Connection conn,conn1;
Statement st,stmtinsert,st1,stnew,stnew1,stnew2,st_sql;
%>
<%

String grpnm="";
grpnm = request.getParameter("reciever");




transporter=request.getParameter("trans");
reciever=request.getParameter("reciever");
mob=request.getParameter("mob");
loct=request.getParameter("loct");
designation =request.getParameter("designation");
chk=request.getParameter("check");
stg1=request.getParameter("stage1");
stg2=request.getParameter("stage2");
stg3=request.getParameter("stage3");
stg4=request.getParameter("stage4");
q=request.getParameter("q");
//System.out.println(">>q>>"+q);

if(q!=null){
	//System.out.println(">>inside>>"+q);	
%>	

<script type="text/javascript">
//alert("hi>>ss")
alert("Record Inserted Successfully");
window.close();

</script>
	
	
	
<% }else{
%>
<%
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("dd-MM-yyyy");
String today=formatter.format(dte);
//System.out.println(">>111111>>");	
String fromdate=request.getParameter("calender");

//System.out.println(">>2222>");	


System.out.println(">>TCATEGORY#"+chk+">>"+stg1+">>1"+stg2+">>2"+stg3+">>3"+stg4);



thedate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
thetime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
username=session.getAttribute("username").toString();
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
stmtinsert=conn1.createStatement();
stnew=conn1.createStatement();
stnew1=conn1.createStatement();
stnew2=conn1.createStatement();
st_sql=conn1.createStatement();
System.out.println(">>reciever==>"+reciever);	


%>
<!--   <body background="images/green_grad_bot.jpg" onload="focusChild();"> -->



<form name="callrec" action="addcalInsert.jsp" method="post"  onsubmit="return validate();">
  
  
  
  <table  >
<tr bgcolor="#F8FCFF">
<table border="0" width="100%" bgcolor="#E6E6E6">
			<tr >
				<td align="center" colspan="3"> <font color="black"> <B> Call </B> </font> </td>
			</tr>
			
		</table>

<table border="1"   style="width: auto" align="center" class ="mytable">
<tr><td>Transporter :</td><td><%=transporter%><input type="hidden" name="trans" value="<%=transporter%>"/>&nbsp;
 </td> <td>  Location : <%=loct %> 
</td>
</tr>


<tr> 
<td>Mobile NO : <%=mob %>  </td>
<td>Reciever /Caller :</td><td><%=reciever%><input type="hidden" name="reciever" value="<%=reciever%>"/></td>&nbsp;

</tr>
  <tr align="center"><td> Designation:<%=designation %>  </td>  


<td> <input type="checkbox" name ="chhk" id ="chhk" value ="yes" />  

 Send Messege to Technician  </td>  </tr>  

     <tr><td>Call Type :</td>
		<td><select name="calltype" id="calltype">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment="select * from db_CustomerComplaints.t_dropdown where dropdown='CallType'"; 
		ResultSet rstDepartment=st1.executeQuery(sqlDepartment);
		while(rstDepartment.next())
		{
			
			String value=rstDepartment.getString("value");
			////System.out.println(value);
		%><option value="<%=rstDepartment.getString("value")%>"><%=rstDepartment.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr> 		
		
		<tr><td>Reason For Call :</td>
		<td><select name="reason" id="reason" onchange="call();">
		<option value="Select">Select</option>
		<%
		
		String sqlReason="select * from db_CustomerComplaints.t_dropdown where dropdown='ReasonforCall'"; 
		ResultSet rstsqlReason=st1.executeQuery(sqlReason);
		while(rstsqlReason.next())
		{
			
			String value=rstsqlReason.getString("value");
			////System.out.println(value);
		%><option value="<%=rstsqlReason.getString("value")%>"><%=rstsqlReason.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>   
		
		<tr style="display: none" id="1"><td>Vehicle Tracking:</td>
		<td><select name="VehicleTracking" id="VehicleTracking">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment1="select * from db_CustomerComplaints.t_dropdown where dropdown='VehicleTracking'"; 
		ResultSet rstDepartment1=st1.executeQuery(sqlDepartment1);
		while(rstDepartment1.next())
		{
			
			String value=rstDepartment1.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment1.getString("value")%>"><%=rstDepartment1.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
		<tr style="display: none" id="2"><td>FleetView :</td>
		<td><select name="FleetView" id="FleetView">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment2="select * from db_CustomerComplaints.t_dropdown where dropdown='FleetView'"; 
		ResultSet rstDepartment2=st1.executeQuery(sqlDepartment2);
		while(rstDepartment2.next())
		{
			
			String value=rstDepartment2.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment2.getString("value")%>"><%=rstDepartment2.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
			
		
			<tr style="display: none" id="3"><td>SalesFollowup :</td>
		<td><select name="SalesFollowup" id="SalesFollowup">
		<option value="Select">Select</option>
		<%
		
		String sqlDepartment3="select * from db_CustomerComplaints.t_dropdown where dropdown='SalesFollowup'"; 
		ResultSet rstDepartment3=st1.executeQuery(sqlDepartment3);
		while(rstDepartment3.next())
		{
			
			String value=rstDepartment3.getString("value");
		//	//System.out.println(value);
		%><option value="<%=rstDepartment3.getString("value")%>"><%=rstDepartment3.getString("value")%></option><%
		}
		%>	
		
		</select></td></tr>
		
		
<tr><td>Comment :</td><td><TEXTAREA cols="32" rows="4" name="comment" id="comment"></TEXTAREA></td></tr>


</table>


<br>
<br>



<table border="1" align="center"   class="sortable"   >


<tr >
<td><!--   <div align="center"> <input type="checkbox" name="maincb" value="maincb" onclick="selectAll();"/></div>--> </td>
<td><b>Sr.</b></td>
<td><b>Vehicle No</b></td>
<td><b>Ticket ID</b></td>
<td><b>Ticket</b></td>
<td><b>Updated</b></td>
<td><b>Location</b></td>
<td><b>Veh Available Date</b> </td>
<td><b>Available at</b> </td>
<td><b>Allocatd to</b> </td>
<td><b>Contact Person</b> </td>
<td><b>Comment</b> </td>




</tr>
<%
  
String tctegory="",tid="",vhid="",sql22="",upddate="",loc="",VehicleRegNumber="",time="",sql11="";
int i=1,j=0,k=1;
if(transporter.equalsIgnoreCase("All"))
{
sql11=" select * from db_gps.t_livetickettest where tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') and status ='open' ";

}else {
	
	
	//sql11=" select * from db_gps.t_livetickettest where tcategory in ('"+chk+"','"+stg1+"','"+stg2+"','"+stg3+"','"+stg4+"') and status ='open' and vehid in (select VehicleCode from db_gps.t_onlinedata where transporter ='"+transporter+"') ";
	
	sql11="select distinct(a.tcategory) as tcategory ,a.tid as tid,a.vehid as vehid  from db_gps.t_livetickettest a,db_gps.t_onlinedata b,db_gps.t_user_vehicles c  where  a.vehid=b.vehiclecode  and b.Transporter='"+transporter+"'  and c.username='"+reciever+"'  and c.vehiclecode=a.vehid";
	
}
	
System.out.println(">>sql11>>>>"+sql11);

ResultSet tct=stnew.executeQuery(sql11); 
while(tct.next())
{
	
	tctegory = 	tct.getString("tcategory");
	tid =tct.getString("tid");
	vhid=tct.getString("vehid");
	
	
	
	
	if(tctegory.equalsIgnoreCase("ToCheck"))
	{
		tctegory="0";
		
	}else if(tctegory.equalsIgnoreCase("stage1ticket"))
	{
		tctegory="1";
		
		
	}else if(tctegory.equalsIgnoreCase("stage2ticket"))
	{
		
		tctegory="2";
		
	}
	else if(tctegory.equalsIgnoreCase("stage3ticket"))
	{
		
		tctegory="3";
		
	}
	else if(tctegory.equalsIgnoreCase("stage4ticket"))
	{
		
		tctegory="4";
		
	}else{
		
		
		
	}
	

	sql22="select TheDate,Location,VehicleRegNo,TheTime from t_onlinedata where  VehicleCode = "+vhid+" and  VehicleRegNo in (select VehicleRegNumber from db_gps.t_user_vehicles where username='"+grpnm+"' and VehicleRegNumber in (select VehicleRegNumber from db_gps.t_vehicledetails where vehiclecode ="+vhid+"))  order by TheDate desc, TheTime desc";
	
	ResultSet tct1=stnew1.executeQuery(sql22);
	System.out.println(">>>>sql"+sql22);
	if(tct1.next())
	{
		 upddate=tct1.getString("TheDate");
		 loc=tct1.getString("Location");
		 VehicleRegNumber=tct1.getString("VehicleRegNo");
			time=tct1.getString("TheTime");
		
		
		
		
	
	
	
	
	String msg="-";
	boolean reallocate=false;
	 String sql_new="select * from db_CustomerComplaints.t_complaints1 where VehicleNo='"+VehicleRegNumber+"'   and Status='Allocated' and Result='Unsolved'  ";
	    
	    ResultSet rs_new=st_sql.executeQuery(sql_new);
	    System.out.println(">>>>sql_new>>>"+sql_new);  
	    if(rs_new.next())
	    {
	    	
	    	
	    	reallocate=true;
	    	
	    }
	

%>
	<tr bgcolor="#F8FCFF">
	 
	 <%
	 if(reallocate)
	 {%>
		 <td style="width: 500px;"><input type="checkbox" name="chkbx" id="cb1<%=j%>"  value="cb1<%=j%>"> </input> 
	 Reallocate: <select name="vehiclereason<%=j %>" id="vehiclereason<%=j %>" style="width: 150px;">
						<option value="Select">Select</option>
						<option value="Vehicle Not Available">Vehicle Not Available</option>
						<option value="Tech. Not Available">Tech. Not Available</option>
						<option value="Vehicle Left Before Tech. Reaches">Vehicle Left Before Tech. Reaches</option>
						<option value="Not Informed To Tech">Not Informed To Tech</option>
						<option value="Unit Not Available">Unit Not Available</option>
						<option value="Unit Not Working">Unit Not Working</option>
						<option value="Vehicle Showing Current Data">Vehicle Showing Current Data</option>
						<option value="Technician Not Attended Vehicle">Technician Not Attended Vehicle</option>
						<option value="Vehicle not attend due to late information">Vehicle not attend due to late information</option>
						<option value="Battery not available">Battery not available</option>
						<option value="Driver not available">Driver not available</option>
						<option value="Vehicle is in Maintenance">Vehicle is in Maintenance</option>
						<option value="Late Information from Office Executive">Late Information from Office Executive</option>
						<option value="Other">Other</option>
					</select>
	 
	  </td> 
		 
		 
	 <%}else{
		%> 
		 
		 <td> <div align="center"> <input type="checkbox" name="chkbx" id="cb1<%=j%>"  value="cb1<%=j%>"> </input> </div>
	 
	 
	  </td> 
		 
	 <%}
	 %>
	 
     
     
     <td align="right"><%=i%> </td>
      <td align="right"  id ="vh<%=j %>"  ><%=VehicleRegNumber%> </td>
      <input type="hidden" name="vhcode<%=j %>" id="vhcode<%=j %>" value="<%=vhid%>" />	
      <td align="right"  ><div align="right" name ="td<%=j %>" id ="td<%=j %>" > <%=tid%></div> </td>
       <td align="right" ><div align="right" name ="tct<%=j %>" id ="tct<%=j %>"><%=tctegory%></div> </td>
       <td align="right" > <div align="right" name ="dt<%=j %>" id ="dt<%=j %>"><%= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(upddate))%></div> <br><%=time%></br> </td>
       
       

<td align="right" name ="loc<%=j %>" id ="loc<%=j %>"><%=loc%> </td>

<td     style="vertical-align: bottom;width:10em "  id ="dt1<%=j %>"> 
<input type="text"   id="calender<%=i %>" name="calender<%=i %>" size="11" class="formElement" value="<%if(fromdate==null){ %><%=sdt%><%}else{%><%=fromdate%> <%}%>" readonly/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<script type="text/javascript">
  								Calendar.setup(
    							{
      								inputField  : "calender<%=i %>",         // ID of the input field
      								ifFormat    : "%d-%b-%Y",     // the date format
      								button      : "trigger1<%=i %>"       // ID of the button
    							}
  								);
								</script>

</td>
        
       <td name ="avl<%=j %>" id ="avl<%=j %>">
       <select name="attadd<%=j %>" id="attadd<%=j %>" class="formElement"> <option value="Select" >Select </option>
<%
								sql="select * from db_CustomerComplaints.t_location order by LName asc";
								ResultSet rst2=stnew2.executeQuery(sql);
								while(rst2.next())
								{
%>
									<option value='<%=rst2.getString("LName")%>'  id="avl1<%=j %>"><%=rst2.getString("LName")%></option>
<%
								}
%>
								</select>
       
       
       
       </td> 
        
      <td name ="altby<%=j %>" id ="altby<%=j %>">
     <select name="attadd1<%=j %>" id="attadd1<%=j %>" class="formElement"> 
								<option value="Select">Select</option>
<%                               
String  sql7="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
ResultSet rs7=st1.executeQuery(sql7);

                         
								while(rs7.next())
								{ 
%>
									<option value="<%=rs7.getString("TechName")%>"><%=rs7.getString("TechName")%></option>
<%		
								}		
%>
									<option value="Customer">Customer</option>	
		     					</select>
           
      
      </td>  
      
<td >
 <textarea cols="25" rows="3"    name="contdets" id="cntprsn<%=j %>" class="formElement" style="" > </textarea> 

</td>
<td >
 <textarea cols="25" rows="3"  name="contdets" id="cmnt<%=j %>" class="formElement" > </textarea>

</td>

	</tr>
	
	
	
<%
i++;
j++;
k++;

	}
	}


%>






</table>
<br></br>


<table align="center">
<tr><td colspan="2"  align="center"><input type="submit" name="Submit" Value="Submit" onclick=""/></td></tr>
<tr><td colspan="2" align="center"><a href="javascript:window.close();">Close</a></td></tr>

<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="cntr" value="<%=i%>" />	
<input type="hidden" name="" value="cb1<%=i%>" />
<input type="hidden" name="trans" value="cb1<%=transporter%>" />
<input type="hidden" name="reciever" value="cb1<%=reciever%>" />
<input type="hidden" name="mob" value="cb1<%=i%>" />
<input type="hidden" name="" value="cb1<%=i%>" />	
<%

}%>
</table>
</tr>
</table>
</form>
 </body> 
</html>
