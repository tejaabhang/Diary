<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 

String userrole1="";
%>

<%
 userrole1=session.getAttribute("userrole").toString();

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
	function validate()
	{
	
	}
	function formsubmitt()
	{
	//alert("in formsubmit");	
		var dropdown=document.POST.dropdown.value;
	//	alert(dropdown);
		if(!(dropdown=="Select"))
		{	
			
			document.POST.submit();
			document.addgrpform.dropdown[0].value = "Select";
			document.addgrpform.dropdown[0].selected = true;
			//alert(document.addgrpform.vehcles.value)f;
		}

	}
	function redirect()
	{
		var body=document.POST.body.value;
		var index=body.indexOf("__");
		if(index>=0){
				alert("Please insert details instead of __");
				return false;
			}
	//	document.POST.action="insertSendMail.jsp";
	//	document.POST.submit();
		var transporter=document.POST.transporter.value;
	//	alert(transporter);
		var cntr=document.POST.cntr.value;
	//	alert(cntr);
	//alert("hi"+cntr);
		cntr=cntr-1;
	//alert("hi"+cntr);
		var url="insertSendMail.jsp?transporter="+transporter+"&vehno="+document.getElementById("vehno").value+"&unitid="+document.getElementById("unitid").value;
//alert(url);
//	url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=0;j<=cntr;j++)
	    	{	//alert("j loop");
	    		//alert(document.getElementById("cb"+j).checked);
	    		if(document.getElementById("cb"+j).checked==true)
	    		{
	    			//alert("unitid"+document.getElementById("unitid").value);
	            	 url=url+"&emailid"+i+"="+document.getElementById("email"+j).value;
					 i++;
				//	 alert(i);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
		//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	        document.POST.action=url+"&cntr="+i;
	      	//document.fullfleet.action="Changewarranty1.jsp";
	        //alert(document.fullfleet.action);
	        document.POST.submit();
		
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
          
          
          
        <%
        if(userrole1.equalsIgnoreCase("supertech"))
        {%>
        	
        	<%@ include file="headertech.jsp" %>
        	
       <%  }else{
        %>
    	   <%@ include file="header1.jsp" %>
    	   
    <% 
        }
       %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
 <%
 String vid=request.getParameter("vid");
 String vehno=request.getParameter("vehno");
 String unitid=request.getParameter("unitid");
 String transp=request.getParameter("transp");
 %>
  <form method="POST" name="POST" onsubmit="return validate();">
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Send Mail</b>
				</font>
			</td>
		</tr>
		<tr>
  	<td>
		<font color="maroon" size="1"><b>Please ingore # from mail body</b></font>  	
  	</td>
  </tr>
	</table>
<br></br>
 
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
<%!
Connection conn,conn1;
Statement st,stmt2;
%>
<%
  Class.forName(MM_dbConn_DRIVER);
  conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
  conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	stmt2=conn.createStatement();
	String entby=session.getAttribute("email").toString();
	String dropdown=request.getParameter("dropdown");
	java.util.Date td =new java.util.Date();
	Format fmt = new SimpleDateFormat("yyyy-MM-dd");
	String sdt = fmt.format(td);
	
	
	String  tid=request.getParameter("tid"); 
	//System.out.println(">>>tid<<<"+tid);
	
	
%>
  <tr bgcolor="#BDBDBD">
  <td><b>Template:</b></td>
  <td>
<%

 String str="SELECT distinct(`Template`) FROM db_CustomerComplaints.t_template";
						ResultSet rst=st.executeQuery(str);
%>
				<select name="dropdown" id="dropdown" onchange="formsubmitt();">
						<option value="Select">Select</option>
<%						while(rst.next())
						{
%>
						<option value="<%=rst.getString("Template") %>"><%=rst.getString("Template") %></option>
<%
					} 
%>
					</select>
					
  </tr>
  <tr bgcolor="#BDBDBD">
 	 <td><b>To:</b></td>
 	 <td>
		 <table>
<% 	String  sql1="select * from t_recieverinfo where Transporter='"+transp+"' and ActiveStatus='Yes' ";
	ResultSet rst2=st.executeQuery(sql1);
	int a=0;
	 int i=0; 
	while(rst2.next())
	{
		String Email=rst2.getString("Email");
		String RecieverName=rst2.getString("RecieverName");
		String PlaceName=rst2.getString("PlaceName");
		String designation=rst2.getString("designation");
		%>
		 
		 	<tr><td> <input type="checkbox" name="cb<%=a%>" id="cb<%=a%>" value="cb<%=a%>"><%=Email%> (<%=RecieverName %>)&nbsp;&nbsp;&nbsp;(Location: <%=PlaceName%>)&nbsp;&nbsp;&nbsp;(Designation: <%=designation%>)
		  <input type="hidden" name="email<%=a%>" id="email<%=a%>"  value="<%=Email%>">
		 	</td></tr>
		<%
		i++;a++;}
	 %>
 <input name="cntr" id="cntr" type="hidden" value="<%=i %>">
 <input type="hidden" name="transporter" value="<%=transp%>" />	
  <input type="hidden" name="vehno" id="vehno" value="<%=vehno%>" />	
 
   <input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" />
   <input type="hidden" name="tid" value="<%=tid%>" />	
   <input type="hidden" name="vid" value="<%=vid%>" />	
   
   
   
   
 	</table>
 	</td>
  </tr>
  
  
  <%
  int token=0;
  String sqlmaxno="select max(srno) as token from t_emailmaster";
  ResultSet rsmaxno=stmt2.executeQuery(sqlmaxno);
  if(rsmaxno.next()){
  	token=rsmaxno.getInt("token");
  	token=token+1;
  }
  String str1="SELECT Subject,Body,entby FROM db_CustomerComplaints.t_template where Template='"+dropdown+"'";
  ResultSet rst1=st.executeQuery(str1);
	
  if(rst1.next()){
	  //System.out.println(rst1.getString("Body"));
  
%>
<tr bgcolor="#BDBDBD">
  <td>
  <b>Subject:</b> <input type="hidden" name="template" id="template" value="<%=dropdown%>" /></td>
  <td><textarea name="description" id="description" type="text" cols="90" rows="2">
   <%=token%>&nbsp;&nbsp; <%=rst1.getString("Subject")%>&nbsp;&nbsp;<%=sdt %>&nbsp;&nbsp;&nbsp; <%=vehno %>&nbsp;&nbsp;<%=transp %></textarea></td>
  </tr>
  <tr bgcolor="#BDBDBD">
  <td>
  <b>From:</b></td>
  <td><input type="text" name="entby" id="entby" value="<%=entby%>" readonly></td>
  </tr>
  <tr>
   <tr bgcolor="#BDBDBD">
  <td>
  <b>CC:</b></td>
  <td><textarea name="CC" id="CC" type="text" cols="90" rows="1"></textarea></td>
  </tr>
  <tr bgcolor="#BDBDBD">
  <td><b>Description:</b></td>
  <td><textarea name="body" id="body" type="text" cols="90" rows="15">
 <%=rst1.getString("Body")%> </textarea>
  </td>
  </tr>
  <%
  }
  %>
  <tr>
  <td colspan="2" align="center"><p><input type="button" value="Send Mail" name="sendMail" onclick="redirect();"></td>
  </tr>
  </table>
  </form>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
</body>
</html>