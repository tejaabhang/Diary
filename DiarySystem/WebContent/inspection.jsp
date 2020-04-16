<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st6,st7,st8;
String sql,sql1,sql2,sql3,sql4,sql9,username,userrole,today,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
String vehcode, transporter, vehregno,displayform,tcategory,VehAttLocDetails2;
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
function validate(){

		var cost=document.regcompform.cost.value;
	//alert(cost);
	if(cost==""){
   	 alert("Please enter cost of inspection");
		return false;
        }else if(isNaN(cost)||cost.indexOf(" ")!=-1){
			alert("Enter numeric value for cost of inspection");
            return false; 
			}else{
			}
	  var v5=document.regcompform.attadd.value;
	//  alert(v5);
	 if(v5=="Select")
	   {
	      alert("Please select address where Vehicle is to be attended");
	      return false;
	   }
	   
	  var v7=document.regcompform.calender1.value;
	//  alert(v7);
	  if(v7=="")
	   {
		alert("Please enter Veh. Avail Date");
		return false;
	   }

	  var v8=document.regcompform.techname.value;
		if(v8=="Select")
	   {
		alert("Please select Tech Name you want to allocate this ticket to");
		return false;
	   }
	   
  if(document.getElementById('attadd').value =='Other')
   {	   var othercolor = document.getElementById('othercolor').value;
   
   if(othercolor==""){
	   	 alert("Please enter address where Vehicle is to be attended");
			return false;
	        }
   } 
		return true;
}
function ValidateRad()
{

	//alert("in validate function");
	var found_it; //initial value is null because we gave it no other value
	for (i=0; i<document.regcompform.res.length; i++)  
	{
		if (document.regcompform.res[i].checked) 
		{
			found_it = document.regcompform.res[i].value ;
			//alert(found_it);//set found_it equal to checked button's value
                }
	} 

	if(found_it=="Solved") //If 'Vehicle' is checked List of vehicle will be visible in Drop down box
	{           
      		document.forms.regcompform.actsol.style.visibility = 'visible'; 
       		document.forms.regcompform.calender.style.visibility = 'visible'; 
		document.forms.regcompform.trigger.style.visibility = 'visible'; 
       	}
         else
	{
       		document.forms.regcompform.actsol.style.visibility = 'hidden';
		document.forms.regcompform.calender.style.visibility = 'hidden';
       		document.forms.regcompform.trigger.style.visibility = 'hidden';
      		document.forms.regcompform.t1.style.visibility = 'hidden';
        	document.forms.regcompform.calender.value = '';
  	      	document.forms.regcompform.t1.value = '';
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
String warranty=request.getParameter("warranty");
////System.out.println(vehcode);
displayform="yes";

tcategory=request.getParameter("category");

String  tid=request.getParameter("tid"); 

String cat="";
if(tcategory.equalsIgnoreCase("tocheck") || tcategory=="tocheck")
{
	
	cat="delay >=6 Hrs and delay < 12 Hrs";
}
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

//System.out.println("tcategory>>>>>"+tcategory);







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
	
	ResultSet rs7=null;
	String sql7="";

	String unitid="", lastdate="", lastloc="";
	String lastdate1="";

	sql="select * from t_vehicledetails where VehicleCode='"+vehcode+"'";
	ResultSet rst=st1.executeQuery(sql);
	if(rst.next())
	{
		transporter=rst.getString("OwnerName");
		vehregno=rst.getString("VehicleRegNumber");
		unitid=rst.getString("UnitId");
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
					<b>Inspection</b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
				<form name="regcompform" method="get" action="inspectioninsert.jsp" onSubmit="return validate()";>
<%
					  	java.util.Date dd=new java.util.Date();
						String dte= "" + (dd.getYear()+1900) + "-" + (1+dd.getMonth()) + "-" + dd.getDate();
					 	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
					   	Format formatterx=new SimpleDateFormat("yyyy-MM-dd");
					   	String nwfrmtdte=formatterx.format(datefrmdb);
					   	Format formatte=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
					   	String today=formatterx.format(dd);
					   	//System.out.println(today);
%>
					<input type="hidden" name="tdydte" value="<%=nwfrmtdte %>" > 
<%
 						String inserted=request.getParameter("inserted");
 						if(inserted==null)
 						{ 
							 sql="select * from t_complaints1 where VehicleNo='"+vehregno+"' and Result='Unsolved' ";
							 ////System.out.println("sql------------->" +  sql);	
							 ResultSet rstx=st.executeQuery(sql);
					   		if(rstx.next())
							{
								displayform="no";
								String tickno=rstx.getString("Tno");
								String contperdets="";
								contperdets=rstx.getString("ContDets");
								////System.out.println("contperdets--->" +contperdets);
								String techname="";	
								String sql6="select * from t_callocation1 where Tno='"+tickno+"' order by DofAllocation Desc";
								////System.out.println("sql6----->" + sql6);
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
  							    <td> 
  							    	<div align="center"> <font color="maroon" size="1"><b> <u><%=msg%></u></b></font></div>
  							    </td>
  							</tr>
						</table>
						<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
							<tr bgcolor="#BDBDBD">
								<td>
									<font color="black"> <b>Transporter :</b></font>
								</td>
								<td><%=rstx.getString("Customer")%></td>
							</tr>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black"><b>Unit Id </font> </td>
								<td> <%=rstx.getString("UnitNo")%> </td>
							</tr>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black">Complaint Type :</font> </td>
								<td><%=rstx.getString("Complaint")%></td>
							</tr>

<%
							try
							{
%>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black">Problem Since :</font> </td>
								<td><%=new SimpleDateFormat("dd-MM-yyyy").format(rstx.getDate("CDate"))%></td>
							</tr>
<%
							}catch(Exception e){
								out.println("-");
							}
%>
							<tr bgcolor="#BDBDBD">
								<td>
									<font color="black"> Description :</font> </td>
								<td><%=rstx.getString("CDescription")%></td>
							</tr>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black">Veh Attend Add :</font> </td>
								<td><%=rstx.getString("VehAttLoc")%></td>
							</tr>
							<tr>
								<td> <font color="black">Veh Avail Date :</font> </td>
								<td>
<%
								try
								{
%>
								<%=new SimpleDateFormat("dd-MMM-yyyy").format(rstx.getDate("VehAvailDate"))%>
								</td>
							</tr>
<%
								}catch(Exception e)
								{
									out.println("No Information");
								}
%>
							<tr bgcolor="#BDBDBD">
								<td> 
									<font color="black">Complaint Status :</font>
								</td>
								<td><%=rstx.getString("Status")%></td>
							</tr>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black">Allocated To: </font></td>
								<td> <%=techname%> </td>
							</tr>
							<tr bgcolor="#BDBDBD">
								<td> <font color="black">Contact Person Dets:</font> </td>
								<td> <%=contperdets%> </td>
							</tr>

							<tr bgcolor="#BDBDBD">
								<td colspan="2" align="center">
									<a href='reallocate.jsp?tid=<%=tid %>&vid=<%=vehcode %>&tno=<%=rstx.getString("Tno")%>&probsnc=<%=rstx.getDate("CDate") %>&parameter=<%=para %>'> <B> Re-Allocate </B></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 <a href="action.jsp?tid=<%=tid %>&vid=<%=vehcode %>&tno=<%=rstx.getString("Tno")%>&tech=<%=techname%>&vehno=<%=rstx.getString("VehicleNo")%>&parameter=<%=para %>"> <B> Action by Tech </B> </a> </td> 
							
							</tr>
					</table>

<% 
						}
 					}
				 else
 				{
   					String tno=request.getParameter("Tno");
%> 
						<table border="0" width="100%">
						  <tr>
						      <td> <div align="center"> <font color="maroon" size="1"><b> <U>Registered Sucessfully. Ticket no. is <%=tno %> </u> </b></font></div> </td>
						  </tr>
						</table>
<%			
				}
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
					<td width="50%" align="center">
						<font color="black">Transporter :</font>
					</td>
					<td>
						<input type="text" name="translist" value="<%=transporter%>" readonly />
						<input type="hidden" name="vehlist" value="<%=vehregno%>" class="formElement" readonly />
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">	
					<td align="center"> 
						<font color="black" > Important Info :</font>
					</td> 
					<td align="center"> 
						<table border="0" width="300px">
		  					<tr>
								<td> <font color="maroon"> Unit Id: <B> <%=unitid %> </B></font></td>
								<td> <font color="maroon">Last Data Date= <B> <%=lastdate1%> </B> </font> 
		  						<input type="hidden" name="unitid" value="<%=unitid%>" /></td>
		  					</tr>
		  					<tr>
								<td colspan="2" align="center"> <font color="maroon"> Last Location= <B> <%=lastloc%> </B> </font> </td>
						    </tr>
						</table>
					</td>
				</tr>
				<tr style="width:50em" bgcolor="#BDBDBD">
					<td align="center">
						<font color="black" >Status of Complaint :</font>
					</td>
					
					<td  > <input type="text" name ="cat" value ="<%=cat%>" readonly="readonly">  
							
							<input type="hidden" name="tid" value="<%=tid%>" />
								<input type="hidden" name="comptype" value="<%=cat%>" />
					
					</td>
				</tr> 
				
	<script>
	function CheckColors(val){
		 var element=document.getElementById('othercolor');
		 if(val=='Other')
		   element.style.display='block';
		 else  
		   element.style.display='none';
		}
	</script>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" >Attend Address :</font></td>
					<td>
						<select name="attadd" id="attadd" onchange='CheckColors(this.value);' > <option value="Select">Select </option>
<%
						sql="select * from t_location order by LName asc";
						ResultSet rst2=st.executeQuery(sql);
						while(rst2.next())
						{
%>
						<option value='<%=rst2.getString("LName")%>'><%=rst2.getString("LName")%></option>
<%
						}
%>

<option value="Other">Other</option>

						</select>
						<input type="text" name="othercolor" id="othercolor" style='display:none;'/>
						
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center">
						<font color="black" >Vehicle Avail. Date :</font>
					</td>
					<td>
						<input type="text" id="calender1" name="calender1" size="13" value="<%=today%>" readonly/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="trigger1" id="trigger1" value="Date" >
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
					<td align="center"><font color="black" >Tech :</font></td>
					<td> 
						<select name="techname"> 
							<option value="Select">Select</option>
<%
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
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" > Vehicle Available </font> </td>
					<td> 
						<input type="radio" name="vehavail" value="Yes" checked>Yes &nbsp;&nbsp;&nbsp;
			 			<input type="radio" name="vehavail" value="No" >No
			 		</td> 
				</tr>
				
				<tr bgcolor="#BDBDBD">
					<td  align="center"> <font color="black"> Unit in Warranty </font> </td>
					<td><%=warranty %></td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"> <font color="black"> Action </font> </td>
					<td> <textarea name="act" rows="3" cols="50"> </textarea> </td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"> <font color="black"> Hidden Comment about Inspection </font> </td>
					<td><textarea name="hidcmnt" rows="3" cols="50"> </textarea></td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"> <font color="black"> Cost of Inspection: </font> </td>
					<td><input type="text" name="cost" value=""/></td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"> <font color="black"> Claim Details: </font> </td>
					<td><textarea name="claimdetails" rows="3" cols="50"> </textarea></td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"> <font color="black">Duration of Closure:</font> </td>
					<td>HH:<select name="hh"> 
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>	
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>	
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>	
							<option value="11">11</option>
							<option value="12">12</option>
		     			</select>
		     			MM: <select name="mm"> 
							<option value="0">0</option>
							<option value="10">10</option>
							<option value="20">20</option>	
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>	
		     			</select></td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" >Device is fixed</font></td>
					<td> 
						<select name="deviceisfixed"> 
							<option value="Select">Select</option>
							<option value="Metal with 4 screws">Metal with 4 screws</option>
							<option value="Plastic with 2 screws">Plastic with 2 screws</option>	
							<option value="No Screws">No Screws</option>
							<option value="Not Fitted Correctly">Not Fitted Correctly</option>
		     			</select>
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" >GPS Placement</font></td>
					<td> 
						<select name="gpsplacement"> 
							<option value="Select">Select</option>
							<option value="With adhesive on dashboard">With adhesive on dashboard</option>
							<option value="Top of device">Top of device</option>	
							<option value="Sticked with Foam Tape on dashboard">Sticked with Foam Tape on dashboard</option>
							<option value="Not Correct at all">Not Correct at all</option>
		     			</select>
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" >Power Connection</font></td>
					<td> 
						<select name="power"> 
							<option value="Select">Select</option>
							<option value="Intact">Intact</option>
							<option value="Connections Change from Bolt to Wire & Connections Done on Fuse Box">Connections Change from Bolt to Wire<br>& Connections Done on Fuse Box</option>	
							<option value="Earth is on Bolt">Earth is on Bolt</option>
		     			</select>
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
					<td align="center"><font color="black" >JRM/Other</font></td>
					<td> 
						<select name="jrm"> 
							<option value="Select">Select</option>
							<option value="Fitted and Connectred Correctly">Fitted and Connectred Correctly</option>
							<option value="Installation incorrect">Installation incorrect</option>	
							<option value="No Special Device">No Special Device</option>
		     			</select>
					</td>
				</tr>
				<tr bgcolor="#BDBDBD">
	<td align="center"> <font color="black"> Result </font> </td>
	<td>
	<input type="radio" name="res" value="Unsolved" onclick="ValidateRad();" /> Unsolved<br><input type="radio" name="res" value="Solved" onclick="ValidateRad();"checked/> Solved
	<select name="actsol" onChange="OnChangeFunc(this);" class="formElement">
		<option value="Select">Select</option>
       <% sql="select Name as v2 from db_CustomerComplaints.t_solvedlist order by v2 asc";
       //System.out.println(sql);
				ResultSet rst5=st1.executeQuery(sql);
				
				while(rst5.next())
				{
					%>
          <option value='<%=rst5.getString("v2")%>'> <%=rst5.getString("v2")%>   </option>  
         <%  
				}	
	
	%>	
	</select>
	</td>
	</tr>
	<tr bgcolor="#BDBDBD">
		<td align="center"> <font color="black"> Special Report </font> </td>
		<td> <input type="radio" name="sprep" value="Yes">Yes  &nbsp;&nbsp;&nbsp;
			<input type="radio" name="sprep" value="No" checked>No 
		</td>
	</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" name="submit" value="Submit" class="formElement"></td>
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
