<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
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
	function validate()
	{
		var downloadedBy1=document.POST.downloadedBy[0].checked;
		//	alert(downloadedBy1);
		var downloadedBy2=document.POST.downloadedBy[1].checked;
		//	alert(downloadedBy2);
			if(downloadedBy1==false && downloadedBy2==false){
				alert("Please select downloaded by");
				return false;
			}

			var inciRecThr1=document.POST.inciRecThr[0].checked;
			//	alert(inciRecThr1);
			var inciRecThr2=document.POST.inciRecThr[1].checked;
			//	alert(inciRecThr2);
				if(inciRecThr1==false && inciRecThr2==false){
					alert("Please select incident reported through Mail/Sms");
					return false;
				}
			
		//var reconnect=document.getElementById("calender2").value;
	//	alert(reconnect);
		//if(reconnect==""){
		//		alert("Please select 'Reconnect device on' date ");
		//		return false;
		//	}
		
		
		var incidentdate=document.getElementById("calender1").value;
	//	alert(incidentdate);
		if(incidentdate==""){
			alert("Please select Incident Date ");
			return false;
		}
		var incidenthr=document.getElementById("hourincident").value;
	//	alert(incidenthr);
		if(incidenthr=="Select"){
			alert("Please select Hour ");
			return false;
		}
		
		
		var downloadedBy1=document.POST.downloadedBy[0].checked;
		var downloadedBy2=document.POST.downloadedBy[1].checked;
		//	alert(recfrom);
			if(downloadedBy1==false && downloadedBy2==false){
				alert("Please select downloaded by");
				return false;
			}
	}

	function showtab(id)
	{
		if(id == "1")
		{
			var show = document.getElementById("showsummaryB").value;
			if(show=="0")
			{
				  
				document.getElementById("Bplus").style.display = "none";
				document.getElementById("Bminus").style.display = "";
				document.getElementById("summary").style.display = "";
				
				document.getElementById("showsummaryB").value = "1";
			}
			else
			{
				document.getElementById("Bplus").style.display = "";
				document.getElementById("Bminus").style.display = "none";
				document.getElementById("summary").style.display = "none";
		
				document.getElementById("showsummaryB").value = "0";
			}
		}
		if(id == "2")
		{
			var show = document.getElementById("showsummary").value;
			if(show=="0")
			{
				  
				document.getElementById("Tplus").style.display = "none";
				document.getElementById("Tminus").style.display = "";
				document.getElementById("summaryD").style.display = "";
				
				document.getElementById("showsummary").value = "1";
			}
			else
			{
				document.getElementById("Tplus").style.display = "";
				document.getElementById("Tminus").style.display = "none";
				document.getElementById("summaryD").style.display = "none";
		
				document.getElementById("showsummary").value = "0";
			}
		}
	}


function Resetall()
{

	//   
	  

	
document.getElementById("recby").value="";
document.getElementById("recfrom").value="";
document.getElementById("replocation").value="";
document.getElementById("calenderr").value="";
document.getElementById("calenderI").value="";

	

	
}

function Ajaxsave()
{
	
	var trans=document.getElementById("transporter").value;
	var vahno=document.getElementById("vehno").value;
	var unitid=document.getElementById("unitid").value;
	
	var receiveby=document.getElementById("recby").value;
	var receivefrm=document.getElementById("recfrom").value;
	var loc=document.getElementById("replocation").value;
	var Rdate=document.getElementById("calenderr").value;
	var reidate=document.getElementById("calenderI").value;
	
	var othrecby=receiveby.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	var othrecfrm=receiveby.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	var othloc=loc.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	var invalid=/[^A-Za-z\s]/;
		
  

	
	var dd1,yy1,mm1,dd2,yy2,mm2,mm11,mm22,tt1,tt2,min1,min2;

if(receiveby=="" || othrecby=="")
{
	alert("Please enter received by");
	return false;
}
else if(invalid.test(receiveby))
{
    alert('Please enter characters value for received by');  
    return false;
}

else if(receivefrm=="" || othrecfrm=="")
{
	alert("Please enter received from");
	return false;
}
else if(invalid.test(receivefrm)){
    alert('Please enter characters value for received from');  
    return false;
}

else if(loc=="" || othloc=="")
{
	alert("Please enter location ");
	return false;
}
else if(invalid.test(loc)){
    alert('Please enter characters value for location');  
    return false;
}
else if(Rdate=="")
{
	alert('Please enter reported date and time');  
    return false;
}
else if(reidate=="")
{
	alert('Please enter reported incident date and time');  
    return false;
}
else 
{
	dd11=Rdate.substring(0,2);
	dd22=reidate.substring(0,2);
	
	mm1=Rdate.substring(3,6);
	mm2=reidate.substring(3,6);
	
	
	mm11=dateformat(mm1);
	mm22=dateformat(mm2);
	
	

	yy1=Rdate.substring(7,11);
	yy2=reidate.substring(7,11);

	tt1=Rdate.substring(12,14);
	min1=Rdate.substring(15,17);
	
	tt2=reidate.substring(12,14);
	min2=reidate.substring(15,17);


	if(yy1<yy2)
	{
		alert("Reported Date/Time should not be smaller than Reported Incident Date/Time");
		
		return false;
	}
	else if(yy2==yy1)
	{
			if(mm11<mm22)
		{
				alert("Reported Date/Time should not be smaller than Reported Incident Date/Time");
			
			return false;
		}
			else if(mm11==mm22)
			{
				if(dd11<dd22)
				{
					alert("Reported Date/Time should not be smaller than Reported Incident Date/Time");
					
					return false;
				}
				else if(dd11==dd22)
				{


					if(tt1<tt2)
					{
						alert("Reported Date/Time should not be smaller than Reported Incident Date/Time");
						return false;
						}	

					else if(tt1==tt2)
					{
							if(min1<=min2)
						{
								alert("Reported Date/Time should not be smaller than and equal to Reported Incident Date/Time");
							
							return false;
						}
					}




					}
			}
	}



	var ajaxRequest; 
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


	ajaxRequest.onreadystatechange = function()
	{
		
		if(ajaxRequest.readyState == 4)
		{
			try
			{
				
			var reslt=ajaxRequest.responseText;

			reslt=reslt.replace(/^\s+|\s+$/g,'');
alert(reslt);	
if(reslt=="Yes")
{
	alert("Record saved successfully");
}
else{
	alert("Record not inserted");
	
}
         
		
			}catch(e)
			{
			alert(e);
			}
		} 
	};

	

	      
	
	var queryString ="?vehno="+vahno+"&date="+Rdate+"&trans="+trans+"&unitid="+unitid+"&receiveby="+receiveby+"&receivefrm="+receivefrm+"&receiveIdate="+reidate+"&location="+loc;
	ajaxRequest.open("GET", "Ajaxsaveincident.jsp" + queryString, true);
	ajaxRequest.send(null); 

}
}


function dateformat(days)
{
if(days=='Jan')
return(1);
else
if(days=='Feb')
	return(2);
else
	if(days=='Mar')
		return(3);
	else
		if(days=='Apr')
			return(4);
		else
			if(days=='May')
				return(5);
			else
				if(days=='Jun')
					return(6);
				else
					if(days=='Jul')
						return(7);
					else
						if(days=='Aug')
							return(8);
						else
							if(days=='Sep')
								return(9);
							else
								if(days=='Oct')
									return(10);
								else
									if(days=='Nov')
										return(11);
									else
										if(days=='Dec')
											return(12);
}

	
	
	</script>
<title>Mail API</title>
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
 <%
 String vid="",vehno="",unitid="",transp="",msggg="";
 try{
  vid=request.getParameter("vid");
  vehno=request.getParameter("vehno");
  //out.println("vehno:-"+vehno);
  unitid=request.getParameter("unitid");
  //out.println("unitid:-"+unitid);
  transp=request.getParameter("transp");
  //out.println("transp:-"+transp);
  msggg=request.getParameter("msg");
 }catch(Exception e){
	 e.printStackTrace();
 }
 //System.out.println("value of  vehid " +vid);
 
 %>
 <%
 if(msggg !=null)
 {
	 %>
	 <script type="text/javascript">
	 alert("Please first fill basic details");
	 
	 window.location("detailsOfIncidentReport.jsp");
	 
	 </script>
	 <%
 }
 
 
 %>
 
 <%!
Connection con1;
 String receiveby="",receivefrm="",loc="",reptime="",repdate="",repidate="";
 String IncidentTimenew[];
 String DataDownloadedBy="",IncidentDate="",IncidentTime="",Incidentdatetime="",DriverTrainingDetails="",ObservationOFIncident1="",ObservationOFIncident2="",ObservationOFIncident3="",ObservationOFIncident4="",ReportedThrough="";
%>
<%
          Class.forName(MM_dbConn_DRIVER);
		   con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		   Statement st=con1.createStatement();
		   Statement st1=con1.createStatement();
		   ResultSet rscknew=null;
		   
		   
		   %>
 
 
  <form method="post" name="POST" action="insertDetailsOfIncident.jsp" enctype="multipart/form-data" onsubmit="return validate();">
  
<table border="0" width="175%" bgcolor="#E6E6E6" align="center">

  <tr align="center">
  	<td>
		<font color="#2A0A12" size="3"><b>Incident Report</b></font>  	
  	</td>
  	</tr>
  	<tr>
  	<td align="right">
  	<font face="Arial" size="2" color="black" >(<font color="red"> *</font> indicates mandatory fields)</font> 
  	
  	</td>
  	</tr>
  	</table>
  	
  
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	
	
	
	<tr bgcolor="#BDBDBD">
  		
			
			   <td  align="left" style="cursor:pointer;"  onclick="javascript: try{showtab('1');}catch(e){alert(e);}" ><font  color="#025570" style="font-size: 15px;"> <b>
			  <img alt="" src="images/minusicon.jpeg" style="width: 12px;height: 12px;" id="Bminus" />
			    <img alt="" src="images/plusicon1.jpeg" style="width: 12px;height: 12px;display: none;" id="Bplus" />
			   
			   Basic Details</b></font></td><td></td></tr>
			   
			   <tr id="summary">
			   <td>
			   			  <input id= "showsummaryB" value="1" type="hidden"></input>
			   
			 <%
			 try{
			   String sqlck="select * from db_gps.t_incidentreport where Transporter='"+transp+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime  DESC limit 1 ";
                rscknew=st.executeQuery(sqlck);
               
               //out.println("query is " +sqlck);
               
               if(rscknew.next())
               {
            	   receiveby=rscknew.getString("ReceivedBy");
            	   receivefrm=rscknew.getString("ReceivedFrom");
            	   loc=rscknew.getString("ReportedLocation");
            	   
            	   repdate=rscknew.getString("IncidentRecievedByMailDate");
            	   reptime=rscknew.getString("IncidentRecievedByMailTime");
            	   
            	   repidate=rscknew.getString("ReportedInciDate");
            	   
            	   DataDownloadedBy=rscknew.getString("DataDownloadedBy");
            	   ReportedThrough=rscknew.getString("ReportedThrough");
            	   IncidentDate=rscknew.getString("IncidentDate");
            	   IncidentTime=rscknew.getString("IncidentTime");
            	   IncidentTimenew=IncidentTime.split(":");
            	   Incidentdatetime=IncidentDate+" "+IncidentTime;
            	   //out.println("Incidentdatetime:-"+Incidentdatetime);
            	   DriverTrainingDetails=rscknew.getString("DriverTrainingDetails");
            	   //out.println("DriverTrainingDetails:-"+DriverTrainingDetails);
            	   ObservationOFIncident1=rscknew.getString("ObservationOFIncident1");
            	   //out.println("ObservationOFIncident1:-"+ObservationOFIncident1);
            	   ObservationOFIncident2=rscknew.getString("ObservationOFIncident2");
            	   //out.println("ObservationOFIncident2:-"+ObservationOFIncident2);
            	   ObservationOFIncident3=rscknew.getString("ObservationOFIncident3");
            	   //out.println("ObservationOFIncident3:-"+ObservationOFIncident3);
            	   ObservationOFIncident4=rscknew.getString("ObservationOFIncident4");
            	   //out.println("ObservationOFIncident4:-"+ObservationOFIncident4);
               }
			 }catch(Exception e)
			 {
				 e.printStackTrace();
			 }
			 //System.out.println("value is " +receiveby);
			 //System.out.println("value is " +receivefrm);
			 //System.out.println("value is " +loc);
			 //System.out.println("value is " +repdate);
			 //System.out.println("value is " +repidate);

			 
			 
			 
			 %>
			  
			  	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
			  
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Transporter :</b></font>
  			</td>
  			<td>
  				<font color="black" size="2"><%=transp%></font>
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Vehicle Registration Number:</b></font>
  			</td>
  			<td>
  				<font color="black" size="2"><%=vehno%></font>
  				<input type="hidden" name="transporter" id="transporter" value="<%=transp%>" />	
 				<input type="hidden" name="vehno" id="vehno" value="<%=vehno%>" />	
   				<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" />
  			</td>
  			
  			
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Unit Id :</b></font>
  			</td>
  			<td>
				<font color="black" size="2"><%=unitid%></font>
  			</td>
  		</tr>
  		   	<tr bgcolor="#BDBDBD">
  			<td> 
  				<font color="black" size="2"><b>Received By :</b><font color="red"> *</font></font>
  			</td>
  			<td>
  			
  			<%
  			if(receiveby.equals(""))
  			{
  				%>
  				  				 <input type="text" name="recby" id="recby" style="width: 250px">
  				
  				<%
  			}
  			else if(receiveby.equals("-"))
  			{%>
  				<input type="text" name="recby" id="recby" style="width: 250px">
  			<% }
  			else{
  				%>
  				<input type="text" name="recby" id="recby" value="<%=receiveby %>" style="width: 250px">
  				
  				<%
  			}
  			%>
  				
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Received From :<font color="red"> *</font></b></font>
  			</td>
  			<td>
  				<%
  			if(receivefrm.equals(""))
  			{
  				%>
  				<input type="text" name="recfrom" id="recfrom" style="width: 250px">
  				
  				<%
  			}
  			else if(receivefrm.equals("-"))
  			{%>
  				<input type="text" name="recfrom" id="recfrom" style="width: 250px">
  			<% }
  			else{
  				%>
  				<input type="text" name="recfrom" id="recfrom" value="<%=receivefrm %>" style="width: 250px">
  				
  				<%
  			}
  			%>
  			</td>
  		</tr>
  		   <tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Reported Location :<font color="red"> *</font></b></font>
  			</td>
  			
  			<td>
  			
  			<%
  			if(loc.equals(""))
  			{
  				%>
  				<input type="text" name="replocation" id="replocation" style="width: 250px">
  				
  				<%
  			}
  			else if(loc.equals("-"))
  			{%>
  				<input type="text" name="replocation" id="replocation" style="width: 250px">
  			<% }
  			else{
  				%>
  				
  				<input type="text" name="replocation" id="replocation" value="<%=loc %>" style="width: 250px">
  				
  				<%
  			}
  			%>
  			
    				
  			</td>
  			
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Reported DateTime :<font color="red"> *</font></b></font>
  			</td>
  			<td> 
  			<%
  			if(repdate=="")
  			{
  				%>
  				<input type="text" id="calenderr" name="calenderr" size="13" value="" style="width: 170px" readonly/>
  				
  				<%
  			}
  			else{
  				
  				if(repdate.equals("-")){
  					repdate="";
  				}else{
  				repdate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(repdate));
  				}
  				//repdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(repdate));
                 
  				if(reptime.equals("00:00")){
  					reptime=""; %>
  					<input type="text" id="calenderr" name="calenderr" size="13" value="<%=repdate %> <%=reptime %>" style="width: 170px" readonly/>
  				<% }else{
  				%>
  				 
  				<input type="text" id="calenderr" name="calenderr" size="13" value="<%=repdate %> <%=reptime %>" style="width: 170px" readonly/>
  				
  				<%
  				}
  			}
  			%>   
            	<script type="text/javascript">
			     Calendar.setup(
			     {
			        inputField  : "calenderr",         // ID of the input field
			    	ifFormat : "%d-%b-%Y %H:%M", // the date format
					button : "calenderr",
					showsTime	: "true"       // ID of the button
			      }
			    );
            	</script>
            	</td>
            	</tr>   
            	<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Reported Incident DateTime :<font color="red"> *</font></b></font>
  			</td>
  			<td> 
  			
  			
  			<%
  			if(repidate=="")
  			{
  				%>
  				<input type="text" id="calenderI" name="calenderI" size="13" value="" style="width: 170px" readonly/>
  				
  				<%
  			}
  			else{
  				if(repidate.equals("-")){
  					repidate="";
  				}else{
  				repidate=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(repidate));
  				}
  				%>
  				
  				<input type="text" id="calenderI" name="calenderI" size="13" value="<%=repidate %>" style="width: 170px" readonly/>
  				
  				<%
  			}
  			%>   
  			
            	<script type="text/javascript">
			     Calendar.setup(
			     {
			        inputField  : "calenderI",         // ID of the input field
			    	ifFormat : "%d-%b-%Y %H:%M", // the date format
					button : "calenderI",
					showsTime	: "true"       // ID of the button
			      }
			    );
            	</script>
            	</td>
            	</tr>  
            	<tr bgcolor="#BDBDBD">
            	<td></td>
            	<td align="right">
            	<input type="button" id="Save" name="Save" value="Save" onclick="Ajaxsave();" />
            	<input type="button" id="Reset" name="Reset" value="Reset" onclick="Resetall();" >
            	</td>
            	
            	</tr>
  		   
  		   </table>
  		   </td>
  		    </tr>
  		    <tr><td></td></tr>
  		    
  		  <tr bgcolor="#BDBDBD">
  		
			 <br></br>
			   <td  align="left" style="cursor:pointer;"  onclick="javascript: try{showtab('2');}catch(e){alert(e);}" ><font  color="#025570" style="font-size: 15px;"> <b>
			  <img alt="" src="images/minusicon.jpeg" style="width: 12px;height: 12px;" id="Tminus" />
			    <img alt="" src="images/plusicon1.jpeg" style="width: 12px;height: 12px;display: none;" id="Tplus" />
			   
			   Fill All Details</b></font></td><td></td></tr>
			 
  		   <tr id="summaryD">
  		   <td>
  		   			  <input id= "showsummary" value="1" type="hidden"></input>
  		   
  		   	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
  		   
  		
			
  		
  		
  		
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Incident data downloaded by :</b><font color="red"> *</font></font>
  			</td>
  			
  			<td>
  			<%
  			if(DataDownloadedBy.equals("Remote"))
  			{
  				%>
				<input type="radio" name="downloadedBy" value="Remote" checked="checked"><b>Remote</b>
				<input type="radio" name="downloadedBy" value="Locally"><b>Locally</b>
				
				<%
  			}else if(DataDownloadedBy.equals("Locally")){ %>
  			    <input type="radio" name="downloadedBy" value="Remote" ><b>Remote</b>
				<input type="radio" name="downloadedBy" value="Locally" checked="checked"><b>Locally</b>
				
  			
  			<%} else{%>
  			    <input type="radio" name="downloadedBy" value="Remote" ><b>Remote</b>
				<input type="radio" name="downloadedBy" value="Locally"><b>Locally</b>
				
  			<%} %>
			</td>
			
		</tr>
		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Incident reported through Mail/Sms :</b><font color="red"> *</font></font>
  			</td>
  			<td>
				<%
  			if(ReportedThrough.equals("Mail"))
  			{
  				%>
                                <input type="radio" name="inciRecThr" value="Mail" checked="checked"><b>Mail</b>
				<input type="radio" name="inciRecThr" value="Sms"><b>Sms</b>
				
				<%
  			}else if(ReportedThrough.equals("Sms")){ %>
  			   <input type="radio" name="inciRecThr" value="Mail"><b>Mail</b>
				<input type="radio" name="inciRecThr" value="Sms" checked="checked"><b>Sms</b>
  			
  			<%} else{%>
  			    <input type="radio" name="inciRecThr" value="Mail"><b>Mail</b>
			    <input type="radio" name="inciRecThr" value="Sms"><b>Sms</b>
				
  			<%} %>
			</td>
		</tr>
		
		
		
	
	
	
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Incident DateTime :</b><font color="red"> *</font></font>
  			</td>
  			<td>   
  			
  			<%
  			if(IncidentDate.equalsIgnoreCase("-"))
  			{
  				%> 
  				<input type="text" id="calender1" name="calender1" size="13" value="" readonly/>
            				
			<%}else{
				
				IncidentDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(IncidentDate));
				%>
				<input type="text" id="calender1" name="calender1" size="13" value="<%=IncidentDate %>" readonly/>
			<% }%>
			<script type="text/javascript">
			     Calendar.setup(
			     {
			        inputField  : "calender1",        // ID of the input field
			        ifFormat    : "%d-%b-%Y",        // the date format
			        button      : "trigger1"        // ID of the button
			      }
			    );
            	</script>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				
				 <%
  			if(IncidentTime.equalsIgnoreCase("00:00"))
  			{
  				%>
				
				<b>HH :</b><font color="red"> *</font><select name="hourincident" id="hourincident">
			    <option value="Select">Select</option>
			    <option value="00">00</option>
			    <option value="01">01</option>
			    <option value="02">02</option>
			    <option value="03">03</option>
			    <option value="04">04</option>
			    <option value="05">05</option>
			    <option value="06">06</option>
			    <option value="07">07</option>
			    <option value="08">08</option>
			    <option value="09">09</option>
			    <option value="10">10</option>
			    <option value="11">11</option> 
			    <option value="12">12</option>
			    <option value="13">13</option>
			    <option value="14">14</option>
			    <option value="15">15</option>
			    <option value="16">16</option>
			    <option value="17">17</option>
			    <option value="18">18</option>
			    <option value="19">19</option>
			    <option value="20">20</option>
			    <option value="21">21</option> 
			    <option value="22">22</option>
			    <option value="23">23</option>
           		</select>  
        		<b>MM :</b><select name="minutesincident" id="minutesincident">
                <option value="00">00</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option> 
                <option value="50">50</option>
			</select>
			<%}else{%>
				
				<b>HH :</b><font color="red"> *</font><select name="hourincident" id="hourincident">
			    <option value="<%=IncidentTimenew[0]%>"><%=IncidentTimenew[0]%></option>
			    <option value="Select">Select</option>
			    <option value="00">00</option>
			    <option value="01">01</option>
			    <option value="02">02</option>
			    <option value="03">03</option>
			    <option value="04">04</option>
			    <option value="05">05</option>
			    <option value="06">06</option>
			    <option value="07">07</option>
			    <option value="08">08</option>
			    <option value="09">09</option>
			    <option value="10">10</option>
			    <option value="11">11</option> 
			    <option value="12">12</option>
			    <option value="13">13</option>
			    <option value="14">14</option>
			    <option value="15">15</option>
			    <option value="16">16</option>
			    <option value="17">17</option>
			    <option value="18">18</option>
			    <option value="19">19</option>
			    <option value="20">20</option>
			    <option value="21">21</option> 
			    <option value="22">22</option>
			    <option value="23">23</option>
           		</select>  <%-- <select name="hourincident" id="hourincident">
			    <option value="<%=IncidentTimenew[0]%>"><%=IncidentTimenew[0]%></option>
			    </select>  --%> 
        		<b>MM :</b><select name="minutesincident" id="minutesincident">
        		<option value="<%=IncidentTimenew[1]%>"><%=IncidentTimenew[1]%></option>
                <option value="00">00</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option> 
                <option value="50">50</option>
			</select>
        		<%-- <b>MM :</b><select name="minutesincident" id="minutesincident">
                <option value="<%=IncidentTimenew[1]%>"><%=IncidentTimenew[1]%></option>
                </select> --%>
			<% }%>
			
			</td>
		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Incident Location(Satelite view) :</b></font>
  			</td>
  			<td>
  				<input type="file" name="MyFileSat" id="MyFileSat" />
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Incident Location(Map view) :</b></font>
  			</td>
  			<td>
  				<input type="file" name="MyFileMap" id="MyFileMap" />
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Last Trip Journey on map :</b></font>
  			</td>
  			<td>
  				<input type="file" name="MyFile4lasttrip" id="MyFile4lasttrip" />
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Driver Training Details :</b></font>
  			</td>
  			<td>
  			<%
  			//if(DriverTrainingDetails.equals("null"))
  				if(DriverTrainingDetails==null)
  			{
  				%> 
  				<textarea name="training" id="training" cols="60" rows="2"></textarea>
  				
  				<%}else{ %>
  					
  					<textarea name="training" id="training" cols="60" rows="2"><%=DriverTrainingDetails%></textarea>
  					
  				<% }%>
  			</td>
  		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>Observations from Incident Data :</b></font>
  			</td>
  			<td>
  				<table>
  					<tr>
  						<td>
  						<%
  			      //if(ObservationOFIncident1.equals("null"))
  			    	  if(ObservationOFIncident1==null)
  			          {
  				         %> 
  							<b>1.</b><textarea name="observation1" id="observation1" cols="60" rows="1"></textarea>
  							<%}else{ %>
  								<b>1.</b><textarea name="observation1" id="observation1" cols="60" rows="1"><%=ObservationOFIncident1%></textarea>
  							<% }%>
  						</td>
  					</tr>
  					<tr>
  						<td>
  						<%
  			      //if(ObservationOFIncident2.equals("null"))
  			    	  if(ObservationOFIncident2==null)
  			          {
  				         %> 
  							<b>2.</b><textarea name="observation2" id="observation2" cols="60" rows="1"></textarea>
  							<%}else{ %>
  							<b>2.</b><textarea name="observation2" id="observation2" cols="60" rows="1"><%=ObservationOFIncident2%></textarea>
  							<%} %>
  						</td>
  					</tr>
  					<tr>
  						<td>
  						<%
  			      //if(ObservationOFIncident3.equals("null"))
  			    	  if(ObservationOFIncident3==null)
  			          {
  				         %> 
  							<b>3.</b><textarea name="observation3" id="observation3" cols="60" rows="1"></textarea>
  							
  							<%}else{ %>
  							<b>3.</b><textarea name="observation3" id="observation3" cols="60" rows="1"><%=ObservationOFIncident3%></textarea>
  							<%} %>
  						</td>
  					</tr>
  					<tr>
  						<td>
  						<%
  			      //if(ObservationOFIncident4.equals("null"))
  			    	  if(ObservationOFIncident4==null)
  			          {
  				         %>
  							<b>4.</b><textarea name="observation4" id="observation4" cols="60" rows="1"></textarea>
  							<%}else{ %>
  							<b>4.</b><textarea name="observation4" id="observation4" cols="60" rows="1"><%=ObservationOFIncident4%></textarea>
  							<%} %>
  						</td>
  					</tr>
  					</table>
			</td>
		</tr>
  		<tr bgcolor="#BDBDBD">
  			<td>
  				<font color="black" size="2"><b>TrackFile :</b></font>
  			</td>
  			<td>
  				<input type="file" name="trackfile" id="trackfile" />
  			</td>
  		</tr>
  		<tr>
  			<td colspan="2" align="center">
			<div class="buttonHolder">
    			<input  type="submit" id="submitButton1" value="Save" onclick="return validate()">
 			</div>
 			</td>
  		</tr>
  	</table>
  	</td>
  	</tr>
  	</table>
  <br></br>
<input type="hidden" name="flag" id="flag" value="false"></input>
<input type="hidden" name="path" id="path" value="<%=request.getContextPath()%>">
  </form>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>