<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
    
    <link href="css/style.css" rel="stylesheet" type="text/css"  />
<script src="js/sorttable.js" type="text/javascript"></script>
<%@page import="com.transworld.diary.framework.OutgoingIncomingCalls"
		import="com.transworld.diary.framework.UnitDetailsDao"
		import="com.transworld.diary.framework.Representative"
%>
		
<jsp:useBean id="unitDetailsDao" 
			 type="com.transworld.diary.framework.UnitDetailsDao"
			 scope="application">
</jsp:useBean>


    
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
		
		
		function toggleDetails(id, show)
		{
			var popup = document.getElementById("popup"+id);
			if (show) {
				popup.style.visibility = "visible";
				popup.setfocus();
				
			} else {
				popup.style.visibility = "hidden";
			}
		}
		function chk()
		{

			
			
			var chkf="";
			var chkt="";
			
			var objFromDate = document.getElementById("fromDate").value;
			
			
			var fdate=objFromDate.split("-");
			
			if(fdate[1]=="01")
			{
				chkf="01";
			}
			if(fdate[1]=="02")
			{
				chkf="02";
			}
			if(fdate[1]=="03")
			{
				chkf="03";
			}
			if(fdate[1]=="04")
			{
				chkf="04";
			}
			if(fdate[1]=="05")
			{
				chkf="05";
			}
			if(fdate[1]=="06")
			{
				chkf="06";
			}
			if(fdate[1]=="07")
			{
				chkf="07";
			}
			if(fdate[1]=="08")
			{
				chkf="08";
			}
			if(fdate[1]=="09")
			{
				chkf="09";
			}
			if(fdate[1]=="10")
			{
				chkf="10";
			}
			if(fdate[1]=="11")
			{
				chkf="11";
			}
			if(fdate[1]=="12")
			{
				chkf="12";
			}
			var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
			
			//alert("obj--From Date-> "+objFromDate1);
		    var objToDate = document.getElementById("toDate").value;
		    
		    var tdate=objToDate.split("-");
		    if(tdate[1]=="01")
			{
		    	chkt="01";
			}
			if(tdate[1]=="02")
			{
				chkt="02";
			}
			if(tdate[1]=="03")
			{
				chkt="03";
			}
			if(tdate[1]=="04")
			{
				chkt="04";
			}
			if(tdate[1]=="05")
			{
				chkt="05";
			}
			if(tdate[1]=="06")
			{
				chkt="06";
			}
			if(tdate[1]=="07")
			{
				chkt="07";
			}
			if(tdate[1]=="08")
			{
				chkt="08";
			}
			if(tdate[1]=="09")
			{
				chkt="09";
			}
			if(tdate[1]=="10")
			{
				chkt="10";
			}
			if(tdate[1]=="11")
			{
				chkt="11";
			}
			if(tdate[1]=="12")
			{
				chkt="12";
			}
		    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
		    
		    //alert("Obj TO DAte ----> "+objToDate1);
		   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
		     
		   /*  var date1 = new Date(objFromDate1);
		    var date2 = new Date(objToDate1); */
		    
		    //alert("from > "+date1+" Todate > "+date2);
		    
		   /*  var date3 = new Date();
		    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
		    var currentDate = new Date(date4); */
		    
		    
		     
		        if(objFromDate1 > objToDate1)
		        {
		            alert("From Date Should be Less Than To Date");
		            return false; 
		        }
//		         else if(date1 > currentDate)
//		         {
//		             alert("From Date should be less than current date");
//		             return false; 
//		         }
//		         else if(date2 > currentDate) 
//		         {
//		             alert("To Date should be less than current date");
//		             return false; 
//		         }

		        return true;
			
		}
		
function birt(){
			
			//alert("Hi");
			//var vehicle1=document.getElementById("vehlist").value;
			var a=chk();
			//alert("GetValidate------->"+a);
			if(a==true)
				{
				
				
			
			 var type=document.getElementById("recievertype").value;
			 var caller=document.getElementById("caller").value;
			var dt= document.getElementById("fromDate").value;
			var dt1= document.getElementById("toDate").value;
			
			
			
			//var date2= document.getElementById("date4").value;
			//var date2= document.getElementById("data1").value;
			
				
			var date = dt.split("-");
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			for(var j=0;j<months.length;j++)
			{
			    if(date[1]==months[j])
			    {
			         date[1]=months.indexOf(months[j])+1;
			    }                      
			} 
			if(date[1]<10)
			{
			    date[1]='0'+date[1];
			}                        
			var formattedDate1 = date[2]+'-'+date[1]+'-'+date[0];
			formattedDate1=formattedDate1+" 00:00:00";
			//alert(date[1]);
			//alert(date[0]);
			
			var dat = dt1.split("-");
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			for(var j=0;j<months.length;j++){
			    if(dat[1]==months[j]){
			         dat[1]=months.indexOf(months[j])+1;
			     }                      
			} 
			if(dat[1]<10){
			    dat[1]='0'+dat[1];
			}                        
			var formattedDate2 = dat[2]+'-'+dat[1]+'-'+dat[0];
			formattedDate2=formattedDate2+" 23:59:59";
			
//			alert(vehicle);
		//alert(date1);
		//alert(formattedDate2);
		//alert(formattedDate1);
			//alert(date2);
			
			document.getElementById("myIframe").src="http://103.241.181.36:8080/birt/frameset?__report=CallLog.rptdesign&type="+type+"&caller="+caller+"&Date="+formattedDate1+"&Date1="+formattedDate2+"&dt="+dt+"&dt1="+dt1+"&__showtitle=false";
//			document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
			document.getElementById("reportData").style.display="";
			//document.getElementById("footer").style.display="none";
			return true;
				}
			else
				{
					return false;
				}
		}
	</script>
	<style>
		.popup {
		background-color: #98AFC7;
		position: absolute;
		visibility: hidden;
	</style>
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
<%!
final String TRANSWORLD="Transporter";

%>
<%
try
{
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
final String today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime() - 7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
final String oldDate=formatter.format(defoultdate);
final String userName=session.getAttribute("username").toString();
final String userrole=session.getAttribute("userrole").toString();
final String fromDateRequest=request.getParameter("fromDate");
final String toDateRequest=request.getParameter("toDate");
final String fromDate = (fromDateRequest == null) ? oldDate : fromDateRequest.toString();
final String toDate = (toDateRequest == null) ? today : toDateRequest.toString();
final String callerNameRequest=request.getParameter("callername");
final String caller = (null == callerNameRequest) ? userName : callerNameRequest;
final String callerTypeRequest=request.getParameter("recievertype");
final String callerType = (null == callerTypeRequest) ? TRANSWORLD : callerTypeRequest;
final String callTypeForOutgoing="OutGoing";
final String callTypeForIncoming="";

System.out.println("TODAte=="+toDate);

String dt="";
String dt1="";
int number= 0;
int representativeRecords= 0;
List<OutgoingIncomingCalls> outgoingIncomingCalls=null;
List<Representative> representative=null;
try{
    outgoingIncomingCalls = unitDetailsDao.getOutgoingIncomingCalls(fromDate,toDate,caller,callerType,callTypeForOutgoing,callTypeForIncoming);          
       number = outgoingIncomingCalls.size();
       representative = unitDetailsDao.getRepresentative();          
       representativeRecords = representative.size();
} catch(Exception e){
    e.printStackTrace();
} 


%>
<%




Format df1= new SimpleDateFormat("dd-MMM-yyyy");
String dtoday=df1.format(new java.util.Date());

DateFormat df= new SimpleDateFormat("dd-MMM-yyyy");
DateFormat d1= new SimpleDateFormat("yyyy-MM-dd"); %>






		<hr width="750px"/>
		<table border="0" width="750px" align="center">
			<tr>
				<td >
					<center><b>Outgoing Call To <%=callerType%>, By <%=caller%> Since <%=fromDate %> Till <%=toDate%></b></center>
					<input	type="hidden" id="caller" name="caller" value="<%=caller%>" />
				</td>
			</tr>
			<tr>
			
				<td><div align="right">
					<form action="" name="form1" id="form1" method="get">
						<select name="recievertype" id="recievertype" class="formElement">
							<option value="All">All</option>
							<option value="Transporter">Transporter</option>		
							<option value="Technician">Technician</option>
						</select>
						
					<input type="text" id="fromDate" name="fromDate" size="13" class="formElement" value="<%=fromDate%>" readonly/>
					<input type="button" name="trigger" id="trigger" value="From Date" class="formElement"/>
            	    <script type="text/javascript">
		  Calendar.setup(
		    {
		      inputField  : "fromDate",         // ID of the input field
		      ifFormat    : "%Y-%m-%d",      // the date format
		      button      : "trigger"       // ID of the button
		    }
		  );
		</script>
             
          		    <input type="text" id="toDate" name="toDate" size="13" class="formElement" value="<%=toDate%>" readonly/>
					<input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement"/>
            	    <script type="text/javascript">
		  Calendar.setup(
		    {
		      inputField  : "toDate",         // ID of the input field
		      ifFormat    : "%Y-%m-%d",     // the date format
		      button      : "trigger1"       // ID of the button
		    }
		  );
		</script>
            		 <select name="callername" class="formElement">
<%
for (int counter = 0; counter < representativeRecords; counter++) 
	{
		final Representative currentRecord = representative.get(counter);
		int i = counter+1;
%>
				<option value='<%=currentRecord.getName()%>' <% if(currentRecord.getName().equals(caller)) { out.print("Selected"); }%>><%=currentRecord.getName()%></option>				
<%
 
 
 	}
%>
</select>
<% 
//dt=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(fromDate);
//dt1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(toDate);


  dt = new SimpleDateFormat("dd-MMM-yyyy")
.format(new SimpleDateFormat("yyyy-MM-dd")
		.parse(fromDate));

 dt1 = new SimpleDateFormat("dd-MMM-yyyy")
.format(new SimpleDateFormat("yyyy-MM-dd")
		.parse(toDate));
%>		
						</select>
            		 <!-- <input type="Submit" name="Submit" Value="Submit" class="formElement"> -->
            		 
            		 <input type="submit" name="button" value="Submit" onclick="return birt()">
            	 </form>
				</div></td>
			</tr>
		</table>
		
		<div id="reportData1">
 <iframe id="myIframe" width="180%" height="500px" src="http://103.241.181.36:8080/birt/frameset?__report=CallLog.rptdesign&dt=<%=dt%> &dt1=<%=dt1%>&type=<%=callerType%>&caller=<%=caller%>&Date=<%=fromDate%>&Date1=<%=toDate%> &__showtitle=false">
<!-- <iframe id="myIframe" width="180%" height="500px" src="http://103.241.181.36:8080/NewBirtTestERP/frameset?__report=CallLog.rptdesign&__showtitle=false"> --> 
<!-- <iframe id="myIframe" width="100%" height="850px" src=""> --> 
</iframe> 

 </div>
 
 <%
		String Bt=request.getParameter("button");
 
 System.out.println("Button "+Bt);
		if(Bt=="null")
		{
%>
 	<div id="reportData">
<%-- <iframe id="myIframe" width="100%" height="850px" src="http://myfleetview.com/birt/frameset?__report=JRM_report.rptdesign&userid=<%=UserID%>&__showtitle=false"> --%> 
<iframe id="myIframe" width="100%" height="500px" src=""> 
</iframe> 

 </div>
 <%
		}
%>
		
			
		
<%
	
}catch(Exception e)
{
	e.printStackTrace();
}
%>
	
</table>

<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
<table border="1" width="100%" align="center">
	<tr>
		<td bgcolor="#98AFC7" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</body>
</html>
