<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st6,st7,st8,st9;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String vehcode, transporter, vehregno,displayform,tcategory;
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
	
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
	
<script language="javascript">
//var othcomp="No";
function validate()
{
	//alert ("hello i am in validate");
	
		 
	if(document.getElementById('attadd').value =='Other')
	   {	   var othercolor = document.getElementById('txtPassportNumber').value.trim();
	   
	   if(othercolor==""|| othercolor =="null" || othercolor ==null || othercolor==" "){
		   	 alert("Please fill up Attend Address(city) :");
				return false;
		        }
	    //return true;
	   } 
		
	var problemd = document.getElementById("probdesc").value.trim();
	 if(problemd=="" || problemd =="null" || problemd ==null || problemd==" "){
	   	 alert("Please fill up Problem Description :");
			return false;
	        }
	

}
	 
	
	/* var v1=document.regcompform.translist.value;
   var v2=document.regcompform.vehlist.value;
   var v3=document.regcompform.comptype.value;

   var v4=document.regcompform.calender.value;
   var v5=document.regcompform.attadd.value;
   var v6=document.regcompform.probdesc.value;	
   var v7=document.regcompform.calender1.value;
  //alert ("v7------------->" + v7);
   var v8=document.regcompform.techname.value;
    
	var v9=document.getElementbyId("contdets").value;
	
	
	
	 if(v9.trim()=="")
	   {
	      alert("Please enter Contact Person Name");
	      return false;
	   }
	
   if(v1=="Select")
   {
      alert("Please select Transporter from the list");
      return false;
   }

   if(v2=="Select")
   {
      alert("Please select Vehicle from the list");
      return false;
   }

   
	if(v3.length=="")
	{ 
		if(othcomp=="Yes")
		{
			if(v6.length=="")
			{
        			alert("Please Enter your Other complaint ");
        			return false;
			}
		}
		else
		{
       			alert("Please select complaint from the list");
       			return false;
   		}
	}
   if(v4.length==0)
   {
      alert("Please enter Problem Since");
      return false;
   }

  if(v6.length <= 2)	
   {
        alert("Please enter Problem Description");
	return false;
   }	
	
   if(v5=="Select")
   {
      alert("Please select address where Vehicle is to be attended");
      return false;
   }

  if(v7=="")
   {
	alert("Please enter Veh. Avail Date");
	return false;
   }

   if(v8=="Select")
   {
	alert("Please select Tech Name you want to allocate this ticket to");
	return false;
   }
 */


function OnChangeFunc2(dropdown)
{
       othcomp="No";
       document.regcompform.othcomp.value="";
       document.regcompform.othcomp.style.visibility="hidden";
}
function ShowNewProbText1()
{ 
       	
      othcomp="Yes";
      document.regcompform.othcomp.style.visibility="visible";
    
}
function datevalidate()
{ 
   var date1=document.regcompform.tdydte.value;
   var prbsndte=document.regcompform.calender.value;
   var vehattdte=document.regcompform.calender1.value;
 
   var dm1,dd1,dy1,dm2,dd2,dy2,dy3,dm3,dd3;
   
   dy1=date1.substring(0,4);
   dy2=prbsndte.substring(0,4);
   dy3=vehattdte.substring(0,4);
//alert(dy1);
//alert(dy1);
   dm1=date1.substring(5,7);
   dm2=prbsndte.substring(5,7);
   dm3=vehattdte.substring(5,7);

   dd1=date1.substring(8,10);
   dd2=prbsndte.substring(8,10);
   dd3=vehattdte.substring(8,10);
   
   if(dy2>dy1 || dy3<dy1)
	{
		alert("Please select proper Date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		
		return false;
	
	}
  else if(dm2>dm1 || dm3<dm1)
	{
		alert("Please select proper Date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";

		return false;
	
	}

  if(dm2==dm1)
 {
		if(dd2>dd1 || dd3<dd1)
		{
		alert("Please select proper date");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";

		return false;
	
		}
 }

    if(dy2>dy3)
	{
		alert("Problem since year cannot be greater than Vehicle available year");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}
  else if(dm2>dm3)
	{
		alert("Problem since month cannot be greater than Vehicle available month");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}

  if(dm2==dm3) {
	if(dd2 > dd3)
	{
		alert("Problem since day cannot be greater than Vehicle available day");
		document.regcompform.calender.value="";
		document.regcompform.calender1.value="";
		return false;
	}
	}
   

   return true;
}

function myfunction()
{
	

	if (document.regcompform.CompInsp[0].checked == true)
	{
		document.regcompform.MsgSend.checked = true;
		document.regcompform.MsgSend.value = send_msg;
		
	}
	else
	{
		document.regcompform.MsgSend.checked = false;
		document.regcompform.MsgSend.value = do_not_send;
	}
		
}

function contactname(){
	
	
	document.getElementById("phone8").style.display="none";
	var mob2=document.getElementById("contdets").value;
	var mob2trimmed=mob2.trim();
	if(mob2trimmed=="" || mob2trimmed =="null" || mob2trimmed ==null ){
		document.getElementById("phone8").style.display="";
	    return false;	
	}
	
	return true;
}

function addressdetails(){
	
	document.getElementById("phone10").style.display="none";
	var mob4=document.getElementById("attadddet").value;
	var mob4trimmed=mob4.trim();
	if(mob4trimmed=="" || mob4trimmed =="null" || mob4trimmed ==null ){
		document.getElementById("phone10").style.display="";
	    return false;	
	}
	
	return true;
}


function contactnumber(){
	
	
	document.getElementById("phone6").style.display="none";
	document.getElementById("resi1").style.display="none";
	document.getElementById("mob12").style.display="none";
    
	var mob=document.getElementById("contnum").value;
	var mobtrimmed= mob.trim();
	var invalid=/^[0-9]+$/; 
	var invalid2=/^[0-9]{1,15}$/;
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
	
	return true;
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
//System.out.println(">>>>HIIIIIIIIII>>>>>");


java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
vehcode=request.getParameter("vid");
String  tid="";

String cat="";
tcategory=request.getParameter("tcategory");

//System.out.println(">>>>##########>tcategory>>11111>>"+tcategory);
if(tcategory!=null)
{
	
	
}else{
	
	tcategory="-";
}


tid=request.getParameter("tid"); 	
//System.out.println(">>>>HIIIIIIIIII>tcategory>>11111>>"+tcategory);

////System.out.println(">>>>HIIIIIIIIII>tid>>11111>>"+tid);

if(tcategory==null || tcategory.equals("null")){}else{
	

if(tcategory.equalsIgnoreCase("tocheck") || tcategory=="tocheck")
{
	
	cat="delay >=6 Hrs and delay < 12 Hrs";
}
//System.out.println(">>>>HIIIIIIIIII>33333333>>>>");

if(tcategory.equalsIgnoreCase("Stage1Ticket") || tcategory=="Stage1Ticket")
{
	cat="delay >=12 Hrs and delay < 24 Hrs";
	
}
if(tcategory.equalsIgnoreCase("Stage2Ticket") || tcategory=="Stage2Ticket")
{
	cat="delay >=24 Hrs and delay < 48 Hrs";
	
}
if(tcategory.equalsIgnoreCase("Stage3Ticket") || tcategory=="Stage3Ticket")
{
	cat="delay >=48 Hrs and delay < 7 Days";
	
}
if(tcategory.equalsIgnoreCase("Stage4Ticket") || tcategory=="Stage4Ticket")
{
	
	cat="> 7 Days ";
}



if(tcategory.equals("-")){
	cat="No Ticket";
	
}
}
//System.out.println("tcategory>>>>>"+tcategory);
displayform="yes";
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn1.createStatement();
	st6=conn.createStatement();
	st7=conn.createStatement();
	st8=conn.createStatement();
	st9=conn.createStatement();
	ResultSet rs7=null;
	
	String sql7="",sql9="";
	String unitid="", lastdate="", lastloc="";
	String lastdate1="";
	String locationcity ="",locationcity1="";

	sql="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
	ResultSet rst=st1.executeQuery(sql);
	//System.out.println(">>>>sql<<<<@@######"+sql);
	if(rst.next())
	{
		transporter=rst.getString("OwnerName");
		vehregno=rst.getString("VehicleRegNumber");
		unitid=rst.getString("UnitId");
		locationcity=rst.getString("InstalledPlace");
	}

	String sql5="select * from t_onlinedata where VehicleCode='"+vehcode+"' ";
	ResultSet rs5=st1.executeQuery(sql5);
	if(rs5.next())
	{
		lastdate=rs5.getString("TheDate");
		lastloc=rs5.getString("Location");
	}
	

	
						
%>

	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Add Complaint</b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td >
				<form name="regcompform" method="get" action="compinsert.jsp" onsubmit="return addressdetails() && contactnumber() && contactname() && validate()">
<%
			  	java.util.Date dd=new java.util.Date();
				String dte= "" + (dd.getYear()+1900) + "-" + (1+dd.getMonth()) + "-" + dd.getDate();
			 	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
			   	Format formatterx=new SimpleDateFormat("yyyy-MM-dd");
			   	String nwfrmtdte=formatterx.format(datefrmdb);String contperdets="";String contperdets2="";String ContDetsNumber2="";String VehAttLocDetails2="";
			   	String inserted=request.getParameter("inserted");
%>

				<input type="hidden" name="tdydte" value="<%=nwfrmtdte %>" >
<%
 				
 				if(inserted==null)
 				{ 
					 sql="select * from t_complaints1 where VehicleNo='"+vehregno+"' and Result='Unsolved' ";
 					System.out.println("sql------------->********" +  sql);	
 					ResultSet rstx=st.executeQuery(sql);
					if(rstx.next())
					{
						displayform="no";
						String tickno=rstx.getString("Tno");
						
						contperdets=rstx.getString("ContDets");
						System.out.println("contperdets--->**********" +contperdets);
						String techname="";	
						String sql6="select * from t_callocation1 where Tno='"+tickno+"' order by DofAllocation Desc";
						//System.out.println("sql6----->" + sql6);
						ResultSet rs6=st6.executeQuery(sql6);
						if(rs6.next())
						{
							techname=rs6.getString("Technicion");
						}
						String msg="";	
						String showinsrtmsg=request.getParameter("showinsrtmsg");
						if(showinsrtmsg==null)
						{
							msg="Complaint for this Vehicle has already been registered. Ticket no. is "+tickno; 
						}
						else
						{
							msg="Complaint for this Vehicle registered successfuly. Ticket no. is "+tickno;
						}
%>
						<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  							<tr>
      							<td> <div align="center"> <font color="maroon" size="1"><b> <U><%=msg%></u> </b></font></div> </td>
  							</tr>
						</table>
						
						<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
							<tr>
								<td><font color="black"> Transporter : </font> </td><td><%=rstx.getString("Customer")%></td>
							</tr>
							<tr>
								<td> 
									<font color="black"> Veh Reg No. : </font> </td><td><%=rstx.getString("VehicleNo")%>
								</td>
							</tr>
							<tr>
								<td> <font color="black"> Unit Id </font> </td>
								<td> <%=rstx.getString("UnitNo")%> </td>
							</tr>
							<tr>
								<td> <font color="black">Complaint Type : </font> </td><td><%=rstx.getString("Complaint")%></td>
							</tr>
<%
							try
							{
%>
							<tr>
								<td> <font color="black">Problem Since : </font> </td><td><%=new SimpleDateFormat("dd-MM-yyyy").format(rstx.getDate("CDate"))%></td>
							</tr>
<%
							}catch(Exception e){
								out.println("-");
	
							}
%>
							<tr>
								<td><font color="black"> Description : </font> </td><td><%=rstx.getString("CDescription")%></td>
							</tr>
							<tr>
								<td> <font color="black">Veh Attend Add : </font> </td><td><%=rstx.getString("VehAttLoc")%></td>
							</tr>
							<tr>
								<td> <font color="black">Veh Avail Date :</font> </td>
								<td>
<%
								try
								{
%>
									<%=new SimpleDateFormat("dd-MMM-yyyy").format(rstx.getDate("VehAvailDate"))%>
<%
								}catch(Exception e)
								{
									out.println("No Information");
								}
%>
								</td>
							</tr>
							<tr>
								<td> <font color="black">Complaint Status : </font></td><td><%=rstx.getString("Status")%></td>
							</tr>
							<tr>
								<td> <font color="black"> Allocated To: </font></td>
								<td> <%=techname%> </td>
							</tr>
							<tr>
								<td> <font color="black"> Contact Person Dets: </font></td>
								<td> <%=contperdets%> </td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<a href='reallocate.jsp?tid=<%=tid %>&tcategory=<%=tcategory %>&vid=<%=vehcode %>&tno=<%=rstx.getString("Tno")%>&probsnc=<%=rstx.getDate("CDate") %>&parameter=<%=para %>'> <B> Re-Allocate </B>
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    <a href="action.jsp?tid=<%=tid %>&vid=<%=vehcode %>&tcategory=<%=tcategory %>&tno=<%=rstx.getString("Tno")%>&tech=<%=techname%>&vehno=<%=rstx.getString("VehicleNo")%>&parameter=<%=para %>"> <B> Action by Tech </B> 
								    </a> 
								 </td> 
							</tr>
					</table>

<% 
					}

 				}
 				else
 				{
   					String tno=request.getParameter("Tno");
%> 
					<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  						<tr>
      						<td> <div align="center"> <font color="maroon" size="1"><b> <U>Registered Sucessfully. Ticket no. is <%=tno %> </u> </b></font></div> </td>
  						</tr>
					</table>
				
<% 				}
				if(displayform.equals("yes"))
				{
					try
					{
						//out.println(lastdate);
						lastdate1=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(lastdate));
						//out.println(lastdate1);
					}
					catch(Exception e)
					{
						lastdate1=lastdate;
					}
 %>

						<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
						<tr bgcolor="#BDBDBD">
							<td width="50%" align="center" style="font-size:10pt;" ><font color="black" ><b>Transporter :</b></font></td>
							<td><input type="text" name="translist" value="<%=transporter%>" class="formElement" style="font-size:10pt;"readonly /></td>
						</tr>
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;" ><font color="black" ><b>Vehicle :</b></font></td>
							<td><input type="text" name="vehlist" value="<%=vehregno%>" class="formElement" style="font-size:10pt;" readonly /></td>
						</tr>
						<tr bgcolor="#BDBDBD">	
							<td  align="center" style="font-size:10pt;"> <font color="black" ><b> Important Info :</b> </font></td> 
							<td align="left"> 
								<table border="0" width="300px">
		  							<tr>
										<td style="font-size:10pt;"> <font color="brown"><b> Unit Id: <B><%=unitid %></b></B> </font> </td>
										<td style="font-size:10pt;"> <font color="brown"> <b>Last Data Date= <B><%=lastdate1%></b></B> </font> 
											<input type="hidden" name="unitid" value="<%=unitid%>" />
										</td>
		  		   					 </tr>
									 <tr>
											<td colspan="2" align="center" style="font-size:10pt;"> <font color="brown"> Last Location= <B><%=lastloc%></B></font></td>
		  							 </tr>
								</table>
							</td>
						</tr>
						
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Status of Complaint :  </b> </font></td>
							<td> <input type="text" name ="cat" value ="<%=cat%>" readonly="readonly">  
							<input type="hidden" name="tid" value="<%=tid%>" />
								<input type="hidden" name="comptype" value="<%=cat%>" />
							  </td>
							
						</tr> 
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Problem Since :</b></font></td>
							<td>
								<input type="text" id="calender" name="calender" size="13" style="font-size:10pt;"class="formElement" value="<%=lastdate%>" readonly/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" name="trigger" id="trigger" style="font-size:10pt;" value="Date" class="formElement">
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
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Problem Description :</b></font></td>
							<td>
								<textarea name="probdesc" id="probdesc" style="font-size:10pt;" class="formElement" ></textarea>
							</td>
						</tr>
						
						
<%
 				
sql9 ="select * from db_CustomerComplaints.t_complaints1 where VehicleNo='"+vehregno+"' order by TdyDate asc ";
		 					System.out.println("sql9------------->" +  sql9);
		 					ResultSet rstxm = st.executeQuery(sql9);
							while (rstxm.next())
							{
						
								contperdets2=rstxm.getString("ContDets").trim();
								VehAttLocDetails2=rstxm.getString("VehAttLocDetails").trim();
								ContDetsNumber2=rstxm.getString("ContDetsNumber").trim();
								locationcity1=rstxm.getString("VehAttLoc").trim();
								} %>	
								
		<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Attend Address(city) :</b></font></td>
							<td>
							
						<select name="attadd" id="attadd" style="font-size:10pt;" class="formElement"><option value="<%=locationcity1%>"><%=locationcity1%></option>
                            <!-- <option value="Select">Select</option> -->
<%								sql="select * from t_location order by LName asc";
								ResultSet rst2=st.executeQuery(sql);
								while(rst2.next())
								{
%>									<option value='<%=rst2.getString("LName")%>'><%=rst2.getString("LName")%></option>
									<%
								}
								
%>
<option value="Other">Other</option>
								</select>
								
					  <div id="dvPassport" style="display: none">
       <input type="text" name="attadd1" id="txtPassportNumber"  />
</div>			
							</td>
						</tr>				
			<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black"> <b>Attend Address(details) :</b></font> </td>		
							<td> <textarea name="attadddet" style="font-size:10pt;" id="attadddet" class="formElement" onblur="return addressdetails();"><%=VehAttLocDetails2 %></textarea>
							<br>
							<label id="phone10"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Attend Address(details) :</font></label>
							
							 </td>
						</tr>			
						
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Vehicle Avail. Date :</b></font></td>
							<td>
								<input type="text" id="calender1" name="calender1" style="font-size:10pt;" size="13" class="formElement" value="" readonly/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" name="trigger1" id="trigger1" style="font-size:10pt;" value="Date" class="formElement">
								<script type="text/javascript">
  								Calendar.setup(
    							{
      								inputField  : "calender1",         // ID of the input field
      								ifFormat    : "%Y-%m-%d",     // the date format
      								button      : "trigger1"       // ID of the button
    							}
  								);
								</script>
							</td>
						</tr>
<%
								sql7="select distinct(TechName) as TechName from t_techlist where Available='Yes' order by TechName asc";
								rs7=st6.executeQuery(sql7);
%>
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Tech :</b></font></td>
							<td> 
							<select name="techname" style="font-size:10pt;" class="formElement"> 
								<option  style="font-size:10pt;" value="Select">Select</option>
<%
								while(rs7.next())
								{ 
%>
									<option style="font-size:10pt;" value="<%=rs7.getString("TechName")%>"><%=rs7.getString("TechName")%></option>
<%		
								}		
%>
<!-- 									<option value="Customer">Customer</option>	 -->

		     					</select>
		     					
							</td>
						</tr>
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black" ><b>Vehicle Available </b></font></td>
							<td> 
								<input type="radio" name="vehavail" value="Yes">Yes </b>&nbsp;&nbsp;&nbsp;
			 					<input type="radio" name="vehavail" value="No" checked>No </b>
			 				</td> 
						</tr>
					
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black"> <b>Contact Person Name </b></font> </td>		
							<td > <textarea name="contdets" id="contdets" style="font-size:10pt;align-content:left;" class="formElement" onblur="return contactname();" ><%=contperdets2 %></textarea> 
						    <br>
							<label id="phone8"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Contact Person Name</font></label>
							</td>
						 </tr>
						
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black"> <b>Contact Number </b></font> </td>		
							<td> <textarea name="contnum" id="contnum" style="font-size:10pt;" class="formElement" onblur="return contactnumber();" ><%=ContDetsNumber2 %></textarea>
							<br>
							<label  id="resi1" style="display: none;"><font face="Arial" size="2" color="red">Please Enter Numeric Value</font></label> 
							<br>
							<label id="phone6"  style="display: none;"><font face="Arial" size="2" color="red">Please Enter Contact Person Number</font></label>
							<br>
							<label id="mob12" style="display: none;"><font face="Arial" size="2" color="red">Number Should Be 10-15 Digits</font></label>
		        
							 </td>
						</tr>
						<tr bgcolor="#BDBDBD">
							<td align="center" style="font-size:10pt;"><font color="black"><b>Complaint/Inspection</b></font></td>		
							<td>
			 					<input type="radio" name="CompInsp" value="Complaint" style="font-size:10pt;" id="radio1" checked onClick="myfunction()"><b>Complaint </b>
			 					 &nbsp;&nbsp;&nbsp;
								 <input type="checkbox" name="MsgSend" id= "MsgSend" style="font-size:10pt;" value = "send_msg" checked><font color="maroon" ><b>Send Message</b></font>
							</td>
						</tr>
		
						<tr>
							<td colspan="2" align="center">
								<input type="submit" name="submit" style="font-size:12pt;" value="Submit" class="formElement">
							</td>
						</tr>
						
						
					</table>
<%  
					}
%>

					<input type="hidden" name="vid" value="<%=vehcode%>" />
<%
					if(para!=null && para.equalsIgnoreCase("tech"))
					{
%>
					<input type="hidden" name="parameter" value="<%=para%>" />
<%
					} 
%>
			</form>
		</td>
	</tr>
</table>
<%
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		

<!-- code end here --->
<table border="0" width="750px" height="350px">
   <tr> <td> </td> </tr>
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
