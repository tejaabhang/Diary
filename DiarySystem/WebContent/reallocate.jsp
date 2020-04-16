
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,stmt3;
String tno,sql,techname,sql1,sql2;
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
	
	
 <script type="text/javascript">
    $(function () {
        $("#attadd").change(function () {
            if ($(this).val() == "Other") {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
        });
    });
</script>

 <script type="text/javascript">
    function ShowHideDiv() {
        var location = document.getElementById("location");
        var dvPassport = document.getElementById("dvPassport");
        dvPassport.style.display = location.value == "Other" ? "block" : "none";
    }
</script>

	<script language="javascript">
	
	function chk()
	{

		
		
		var chkf="";
		var chkt="";
		var objFromDate = document.getElementById("calender").value;
		
		//alert("objFromDate "+objFromDate);
		var fdate=objFromDate.split("-");
		if(fdate[1]=="Jan")
		{
			chkf="01";
		}
		if(fdate[1]=="Feb")
		{
			chkf="02";
		}
		if(fdate[1]=="Mar")
		{
			chkf="03";
		}
		if(fdate[1]=="Apr")
		{
			chkf="04";
		}
		if(fdate[1]=="May")
		{
			chkf="05";
		}
		if(fdate[1]=="Jun")
		{
			chkf="06";
		}
		if(fdate[1]=="Jul")
		{
			chkf="07";
		}
		if(fdate[1]=="Aug")
		{
			chkf="08";
		}
		if(fdate[1]=="Sep")
		{
			chkf="09";
		}
		if(fdate[1]=="Oct")
		{
			chkf="10";
		}
		if(fdate[1]=="Nov")
		{
			chkf="11";
		}
		if(fdate[1]=="Dec")
		{
			chkf="12";
		}
		var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
	    var objToDate = document.getElementById("old2").value;
	    //alert("objToDate "+objToDate);
	    var tdate=objToDate.split("-");
	    if(tdate[1]=="Jan")
		{
	    	chkt="01";
		}
		if(tdate[1]=="Feb")
		{
			chkt="02";
		}
		if(tdate[1]=="Mar")
		{
			chkt="03";
		}
		if(tdate[1]=="Apr")
		{
			chkt="04";
		}
		if(tdate[1]=="May")
		{
			chkt="05";
		}
		if(tdate[1]=="Jun")
		{
			chkt="06";
		}
		if(tdate[1]=="Jul")
		{
			chkt="07";
		}
		if(tdate[1]=="Aug")
		{
			chkt="08";
		}
		if(tdate[1]=="Sep")
		{
			chkt="09";
		}
		if(tdate[1]=="Oct")
		{
			chkt="10";
		}
		if(tdate[1]=="Nov")
		{
			chkt="11";
		}
		if(tdate[1]=="Dec")
		{
			chkt="12";
		}
	    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
	   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
	     
	    var date1 = new Date(objFromDate1);
	    var date2 = new Date(objToDate1);
	    
	    //alert("from > "+date1+" Todate > "+date2);
	    
	    var date3 = new Date();
	    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
	    var currentDate = new Date(date4);
	     
	        if(date2 > date1)
	        {
	            alert("Reallocation Date Should not  be Less Than Today's Date");
	            return false; 
	        }
//	         else if(date1 > currentDate)
//	         {
//	             alert("From Date should be less than current date");
//	             return false; 
//	         }
//	         else if(date2 > currentDate) 
//	         {
//	             alert("To Date should be less than current date");
//	             return false; 
//	         }

	        return true;
		
	}
	
	function validate()
	{
		 
				 	
		 	document.getElementById("contact1").style.display="none";
			document.getElementById("contact2").style.display="none";	
		var name=document.getElementById("contdets").value;
//			var invalid=/[^A-Za-z\s]/;
		var invalid=/^[a-zA-Z  . / ]+$/;
		var oth=name.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
		if(name.trim()=="" || oth==""){
			document.getElementById("contact1").style.display="";
				return false;
			}
		if(!invalid.test(name)){
		 document.getElementById("contact2").style.display="";
			     return false;
			 }
		
		var today = new Date();
		var dd = today.getDate();

		var mm = today.getMonth()+1; 
		var yyyy = today.getFullYear();
		if(dd<10) 
		{
		    dd='0'+dd;
		} 

		if(mm<10) 
		{
		    mm='0'+mm;
		} 
		today = yyyy+'-'+mm+'-'+dd;	//alert(today);
		//alert(document.getElementById("calender").value.trim());
		 
		 if( document.getElementById("calender").value.trim() < today)
			 {
			 alert("Reallocation Date Should not  be Less Than Today's Date");
	            return false; 
			  }
		
		if(document.getElementById('location').value =='Other')
		   {	   var othercolor = document.getElementById('txtPassportNumber').value.trim();
		   
		   if(othercolor==""|| othercolor =="null" || othercolor ==null || othercolor==" "){
			   	 alert("Please fill up Location : ");
					return false;
			        }
		    //return true;
		   } 
			
		
		
		
		
		document.getElementById("phone6").style.display="none";
		document.getElementById("resi1").style.display="none";
		document.getElementById("mob12").style.display="none";
	    
		var mob=document.getElementById("contnum").value;
		var mobtrimmed= mob.trim();
		var invalid=/^[0-9]+$/; 
		var invalid2=/^[0-9]{10,15}$/;
		if(!(mobtrimmed =="" || mobtrimmed =="null" || mobtrimmed ==null))
				{
			if(!invalid.test(mobtrimmed)){
		        document.getElementById("resi1").style.display="";
		                return false;
		            }
			if(!invalid2.test(mobtrimmed)){
		        document.getElementById("mob12").style.display="";
		                return false;
		            }
					
				    }
		else if (mobtrimmed=="" || mobtrimmed =="null" || mobtrimmed ==null)
		{
			document.getElementById("phone6").style.display="";
		    return false;	
		}
		
		document.getElementById("phone10").style.display="none";
		var mob4=document.getElementById("attadddet").value;
		var mob4trimmed=mob4.trim();
		if(mob4trimmed=="" || mob4trimmed =="null" || mob4trimmed ==null ){
			document.getElementById("phone10").style.display="";
		    return false;	
		}
		
		
		var a2,a4,a6,a7;
		//var v3=document.getElementById("calender").value;
		a2=document.reallocate.location.value.trim();
		a4=document.reallocate.calender.value.trim();
		a6=document.reallocate.techname.value.trim();
		a7=document.reallocate.reason.value.trim();
		a8=document.reallocate.contdets.value.trim();
		var cmnt=document.reallocate.comnt.value.trim();	
           
		var vehavail1=document.reallocate.vehavail.value;


		//if(document.reallocate.vehavail[0].checked==true)
	//	{
//alert("alert inside fierst radio value YES if ");
		//}

	//	if(document.reallocate.vehavail[1].checked==true)
		//{
	//		alert("alert 2nd  radio value NO  inside fierst if ");
		//}


		
		//alert("a2===>"+a2);
		//alert("a6===>"+a6);

		//var real=document.reallocate.radio1.value;
		//var vehavail=document.getElementById("vehavail1").value;

//alert("veh vail value ==>"+document.reallocate.vehavail.checked==true);
		
		//alert("vehavail===>"+vehavail);

		// vehavail

		if(document.reallocate.vehavail[0].checked==true)
{

	//alert("control inside vehicle available loop===>");

   /* if(a4<v3)
	   { 
	    
	     alert("Calender date  "+a4);
	     alert("text box date  "+v3);
	     alert(" Available  date should not be less than  current date ");
	     return false;
	   } */

	if(a2=="Select")
	{
		alert("Please select new Location");
		return false;
	}
	
	//var a=chk();
	//alert("a  "+a);
	/* if(a==true)
		{ */
   if(a4=="")
	   {
	   
	   alert("Please select Vehicle Available date");
		return false;
	   }
	   
	if(a6=="Select")
	{
		alert("Please enter new Technician you want to allocate this Complaint to");
		return false;
	}

	if(a7.length < 1)
	{
		
		alert("Please enter reason of Re-Allocation");
		return false;
	}


	

		
		//if(document.reallocate.reason[0].checked==false && document.reallocate.reason[1].checked==false && document.reallocate.reason[2].checked==false && document.reallocate.reason[3].checked==false && document.reallocate.reason[4].checked==false && document.reallocate.reason[5].checked==false && document.reallocate.reason[6].checked==false)	
		//{
		if(a7=="Select")
		{
			alert("Please Select Reason");
			return false;
		}
		/*if(a2=="Select")
		{
			alert("Please select new Location");
			return false;
		}

		if(a6=="Select")
		{
			alert("Please enter new Technician you want to allocate this Complaint to");
			return false;
		}

		if(a7.length < 2)
		{
			
			alert("Please enter reason of Re-Allocation");
			return false;
		}*/

		if(cmnt.length==0)
		{
		      alert("Please Enter Comment");
		      return false;
		}
		if(a8.length == 0)
		{
			
			alert("Please enter Contact Person Name : ");
			return false;
		}
	


		//return false;
		 return true;
		/* }
		else
			{
			
			return false;
			}  */
	}	
}

	function myfunction()
	{
		
		
		if (document.reallocate.CompInsp[0].checked == true)
		{
			
			document.reallocate.MsgSend.checked = true;
			document.reallocate.MsgSend.value = send_msg;
			//alert("document.reallocate.MsgSend.value---->" + document.reallocate.MsgSend.value);
		}
		else
		{
			document.reallocate.MsgSend.checked = false;
			document.reallocate.MsgSend.value = do_not_send;
			//alert("document.reallocate.MsgSend.value---->" + document.reallocate.MsgSend.value);
		}
			
	}
	function showType(id)
	{
		if(id==1)
		{
			document.getElementById("unitrow1").style.display="";
			document.getElementById("unitrow2").style.display="";
			document.getElementById("unitrow3").style.display="";
			document.getElementById("unitrow4").style.display="";
		}
		else
		{
			document.getElementById("unitrow1").style.display='none';
			document.getElementById("unitrow2").style.display='none';
			document.getElementById("unitrow3").style.display='none';
			document.getElementById("unitrow4").style.display='none';
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
          
       <%String para=request.getParameter("parameter");
if(para!=null && para.equalsIgnoreCase("tech"))
{
%>
  <%@ include file="headertech.jsp" %>

<%}
else{%>
                    <%@ include file="header1.jsp" %>
          <%} %>
                     </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
    
               
   
<!--- code start here ------>
<%
tno=request.getParameter("tno");
//out.print(tno);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	stmt3 = conn.createStatement();
	String probsnc=request.getParameter("probsnc");
	
	String  tid=request.getParameter("tid");
	String  vid=request.getParameter("vid");
	
	
	//System.out.println(">>>tid<in reallocation<<"+tid);
	//System.out.println(">>>vid<in reallocation<<"+vid);
	
	
	
	%>
	<table border="0" width="750px" align="center" bgcolor="#77D7D4">
		<tr>
		
		<td colspan="2" align="center"><font color="black" size="3">Complaints Re-Allocation</font>
		<div align="center">
		<% String err=request.getParameter("err");
			if(!(null==err))
			{
				out.print("<br><font color='red' size='2' >Successfully Re-Allocated</font>");
			}						
		%></div>		
		</td>
		</tr>
	</table>
	<br></br>
	<%
	sql="select * from t_complaints1 where Tno='"+tno+"'";
	ResultSet rst=st.executeQuery(sql);
	System.out.println(">>>sql<in sql<<"+sql);
	if(rst.next())
	{
		String cont_details =  rst.getString("ContDets");
		//out.print(rst.getString("ContDets"));
		%>
		<form name="reallocate" action="insertreallocation.jsp" method="post" onSubmit="return validate();">
		<table width="100%" border="1" align="center" class="sortable">
			<tr>
				<td>
					
						<input type="hidden" name="contdetails" value="<%= cont_details %>">
<%
								if(para!=null && para.equalsIgnoreCase("tech"))
								{
%>
									<input type="hidden" name="parameter" value="<%=para%>" />
<%
								}
%>
			
				
			 
					<font><b> Ticket No: </b></font>
				</td>
				<td>
					<font color="black" ><b><%=rst.getString("Tno")%></b></font>
					<input type="hidden" name="tno" value="<%=rst.getString("Tno")%>">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<b><u><a href='reallocatehistory.jsp?tno=<%=rst.getString("Tno")%>'>Show history</a></u></b>
				</td>
			</tr>
			<tr>
				<td> 
					<b>Problem Since:</b>
				</td>
				<td>
					<font color="black" ><b><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(probsnc))%></b></font><input type="hidden" name="probsnc" value="<%=probsnc%>">
				</td>
			</tr>
			<tr>
				<td> 
					<b> Vehicle Reg. No:</b> 
				</td>
				<td>
					<font color="black" ><b><%=rst.getString("VehicleNo")%></b></font><input type="hidden" name="vehno" value="<%=rst.getString("VehicleNo")%>">
				</td>
			</tr>	
			<tr>
				<td><b>  Transporter : </b></td>
				<td>
					<font color="black" ><b><%=rst.getString("Customer")%></b></font><input type="hidden" name="transporter" value="<%=rst.getString("Customer")%>">
				</td>
			</tr>	
			<tr>
				<td> <b>Vehicle Available : </b></td>
				<td> 
					<input type="radio" name="vehavail" id="vehavail1"  value="Yes" onclick="showType(1);"><font color="black" >Yes </font> &nbsp;&nbsp;&nbsp;
			 		<input type="radio" name="vehavail" value="No" onclick="showType(0);" checked><font color="black" >No </font>
			 	</td> 
			</tr>
			<tr id="unitrow1" style="display:none">
				<td> <b> Location :</b> </td>
				<td>
					<input type="hidden" name="oldlocation" value="<%=rst.getString("VehAttLoc")%>">		
<% 
						sql="select distinct(LName) as Location from t_location order by LName asc" ;		
						ResultSet rst2=st1.executeQuery(sql);
%>
						 <select name="location" id="location" class="formElement" onchange = "ShowHideDiv()">			
							<option value="Select">Select</option> 
							
							<!-- <select name="attadd" id="attadd" class="formElement" onchange = "ShowHideDiv()"> 
							<option value="Select">Select</option> -->
<%
							while(rst2.next())
							{
%>
							<option value='<%=rst2.getString("Location")%>' <% if(rst.getString("VehAttLoc").equals(rst2.getString("Location"))){ out.print("Selected");} %>><%=rst2.getString("Location")%></option>			
<% 
							}
%>
<option value="Other">Other</option>
								</select>
								
<div id="dvPassport" style="display: none">
       <input type="text" name="addpass" id="txtPassportNumber" />
</div>	
		
		
		
				</td>
			</tr>	
			
			<tr >
							<td align="center" style="font-size:10pt;"><font color="black"> <b>Attend Address(details) :</b></font> </td>		
							<td> <textarea name="attadddet" style="font-size:10pt;" id="attadddet" class="formElement" onblur="return addressdetails();"><%=rst.getString("VehAttLocDetails")%></textarea>
							<br>
							<label id="phone10"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Attend Address(details) :</font></label>
							
							 </td>
						</tr>		
			<tr id="unitrow2" style="display:none">
				<td> <b> Available Date :</b> </td>
				<td>	
					<input type="hidden" name="oldavaildate" value="<%=rst.getString("VehAvailDate")%>">	
					<%-- <input type="hidden" name="old2" id="old2" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"> --%>
					<input type="text" id="calender" name="calender" size="13" value="<%=rst.getString("VehAvailDate")%>" readonly class="formElement" />
					<input type="button" name="trigger" id="trigger" value="Date" class="formElement">
             		<script type="text/javascript">
             			Calendar.setup(
             			{
                 			inputField  : "calender",         // ID of the input field
                 			ifFormat    : "%Y-%m-%d",     // the date format
                 			button      : "trigger"       // ID of the button
             			}
                           );
             		</script>			
				</td>
			</tr>	
			<tr id="unitrow3" style="display:none">
				<td> <b> Technician : </b> </td>
				<td>
<%
					sql="select * from t_callocation1 where Tno='"+rst.getString("Tno")+"' order by DofAllocation desc";
					ResultSet rst1=st1.executeQuery(sql);
					techname="-";
					if(rst1.next())
					{
						techname=rst1.getString("Technicion");
					}	
					sql="select distinct(TechName) as TechName from t_techlist where Available='Yes' order by techname";
					ResultSet rst3=st1.executeQuery(sql);
%>
					<input type="hidden" name="oldtechnician" value="<%=techname%>">	
						<select name="techname" class="formElement">
							<option value="Select">Select</option>
<%			
					while(rst3.next())
					{
%>
							<option value='<%=rst3.getString("TechName")%>' <% if(techname.equals(rst3.getString("TechName"))){ out.print("Selected");} %>><%=rst3.getString("TechName")%></option>				
<%
					}	
%>
							<option value="Customer">Customer</option>
						</select>
				</td>
			</tr>	
			<tr>
				<td> <b> Reason : </b></td>
				<td>
					<select name="reason" id="reason">
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
			</tr>
			<tr>
				<td align="center"> <b>Comment :</b></td>		
				<td> <textarea name="comnt" class="formElement" ></textarea> </td>
			</tr>
			<tr>
				<td align="center"><b> Contact Person Name :</b></td>		
				<td> <textarea name="contdets" id="contdets" style="font-size:10pt;" class="formElement" ><%=rst.getString("ContDets")%></textarea>
				<br>
				<label id="contact1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Contact Person Name</font></label>  
 				<label id="contact2" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Character Value</font></label> 
 	
				 </td>
			</tr>
			
			<tr>
							<td align="center" style="font-size:10pt;"><font color="black"> <b>Contact Number </b></font> </td>		
							<td> <textarea name="contnum" id="contnum" style="font-size:10pt;" class="formElement" onblur="return contactnumber();" ><%=rst.getString("ContDetsNumber")%></textarea>
							<br>
							<label  id="resi1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
							<br>
							<label id="phone6"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Contact Person Number</font></label>
							<br>
							<label id="mob12" style="display: none;"><font face="Arial" size="2" color="red">Number Should Be Between 10-15 Digits</font></label>
		        
							 </td>
						</tr>
			<tr>
				<td align="center"><b> Complaint/Inspection :</b></td>		
				<td>
			 		<input type="radio" name="CompInsp" value="Complaint" id="radio1" checked onClick="myfunction()"><font color="black" >Complaint </font> &nbsp;&nbsp;&nbsp;
			 	</td>                                    
			 </tr>
			<tr id="unitrow4" style="display:none">
			 	<td></td>
			 	<td>
			 		<input type="checkbox" name="MsgSend" value = "send_msg" checked> <font color="black">Send Message</font>
				</td>
			</tr>
			<tr align="center">
				<td colspan="4" align="right"> <input type="submit" name="Allocate" value="Allocate" class="formElement">
				<input type="hidden" name="tid" value="<%=tid%>" />
				<input type="hidden" name="vid" value="<%=vid%>" />
				
				</td>
			</tr>	
				
		</table>
		</form>	
				
		<%
		/* String Loc=request.getParameter("addpass");
		   System.out.println("Location To add  is  "+Loc);
		   sql2="select * from t_location where LName='"+Loc+"'";
		   ResultSet RS=st.executeQuery(sql2);
		   if(!RS.next())
		   {
		   sql1="insert into t_location (LName) values ('"+Loc+"')";
		   st1.executeUpdate(sql1);
		   } */
		
	}
}catch(Exception e)
{
	out.print("Exception -->"+e);
}
finally
{
	conn.close();
}

%>


<!-- code end here --->
<table border="0" width="350px" height="300px">
		<tr><td></td></tr>
		</table>
 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright" >
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
<html><head></head><body></body></html>