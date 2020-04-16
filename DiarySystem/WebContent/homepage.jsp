<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
Connection conn;


%>
<%
System.out.println("in homepage");	
final String userName=session.getAttribute("username").toString();
System.out.println("in connection created");	
	final String userRole=session.getAttribute("userrole").toString();
	System.out.println("in connection created");	
	String transporterlist=session.getAttribute("TransporterList").toString();

	//final String us1=userName.toUpperCase();
	System.out.println("in connection created");	
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st=conn.createStatement();
	Statement st1=conn.createStatement();
	Statement st2=conn.createStatement();
	//String selectedvalue="";
	
	String Status=request.getParameter("status");
	if(Status==null){
		Status="All";
	}
	
	System.out.println("in connection created");	
%>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr bgcolor="#BDBDBD"><td align="center"><font color="#2A0A12" size="3"><b>ALL TRANSPORTERS LIST.</b></font></td></tr>
	<tr> 
		<td>
			<div align="left"><font color="red"><B><I>Note:</I></B>Click On Transporter To Go On It's FullFleet Page.</font></div>
		</td>
	</tr>	
	</table>
	
	
	<!-- Added By Veena code for adding drop down list and label 'Status' -->
	<br></br> 
	
	<form action="" method="post" >
	<table width="750px" align="center">
	<tr>
	<td align="center"> 
	   <div align="right" >  <font size="3"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <label>Status</label></b></font> </div>
	   
	</td>
	<td >
	
	
	<select id="status" name="status" style="width: 125px; height: 25px;" >                                
                                
                                <option value="All">All</option>
                                       <%
                                       String sql1="";
                                        		sql1 = "select distinct(OperationalStatus) from db_gps.t_transporter order by  OperationalStatus";
                                        System.out.println("The query is :"+sql1);
                                         ResultSet rs1 = st1.executeQuery(sql1);
                                         while(rs1.next())
                                          { %>
                                          
                                          
                                          <option value="<%=rs1.getString("OperationalStatus") %>" ><%=rs1.getString("OperationalStatus")%></option><%
                                            
                                          
                                          }
                                        
                                    
                                    %>
                                       <option value="All">All</option>
                            </select>
                            <button type="submit" value="Submit">Submit</button>
                            
	
	  <%--  <select name="xyz" id="xyz">
	   
	   <% String sql1="select distinct(OperationalStatus) from db_gps.t_transporter order by  OperationalStatus";
          ResultSet rs1=st1.executeQuery(sql1);
	      while(rs1.next())
	      {
	   %>
	   <option  value="<%=rs1.getString("OperationalStatus")%>" selected="selected" ><%=rs1.getString("OperationalStatus")%></option>
	   
	   <%} %>  
	  </select> --%>
	</td>
	</tr>
	</table>
	</form>
	<!-- Finished with Adding code -->
	
	<br></br>
			
			
			<table>
			<tr>
			<td> <a href="fullfleet.jsp?transporter=Vehall " >Export All Vehicles </a> </td>
			</tr>
			</table>
			<table border="1" width="100%" align="center" class="sortable">
			<tr bgcolor="#BDBDBD">
				<td><b>Sr.</b></td>
				<td><b>Transporter</b></td>
					<td><b>Status</b></td>
			</tr>
<%
	try
	{
		int i=1;
		//String Status=request.getParameter("status");
		/* transporterlist=transporterlist.substring(3,transporterlist.length()-1);
		transporterlist=transporterlist.replace(",","','");
		String sql="select Distinct(OwnerName) from db_gps.t_vehicledetails where Status='-' and OwnerName in ('"+transporterlist+"') order by OwnerName";

		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){ */
		/* String sql2="select distinct(TypeValue) from db_gps.t_transporter where OperationalStatus = 'Active' order by typevalue"; */
		Status=request.getParameter("status");
		System.out.println("selected value >>>>>>>>"+Status);
		
		if(Status==null)
	    {
	    	Status="All";
	    }
	    %>
	    
	    <script>
	    document.getElementById("status").value='<%out.print(Status); %>';
	    
	    </script>
	    
	    <% 
	    /* String fromdate= request.getParameter("data");
	    System.out.println("-------------------------------->"+fromdate);
	    
	    String todate= request.getParameter("data1");
	    System.out.println("-------------------------------->"+todate);
	     */
		
	     if(Status.equals("All"))
		 {
	    	 Status="%%";
		 }
		
		String sql2="select distinct(TypeValue),OperationalStatus from db_gps.t_transporter where OperationalStatus like '"+Status+"' order by typevalue";
		System.out.println("sql2 is-->>" + sql2);
		ResultSet rs2=st2.executeQuery(sql2);
		while(rs2.next())
		{

%>			
	<tr>					
	    	<td width="5%"><div align="right"><%=i%></div></td>
	    	<%
					/* String trans=rs.getString("OwnerName");
	    	        String trans1=rs.getString("OwnerName");
					trans=trans.replace("&","..."); */
					String tvalue=rs2.getString("TypeValue");
					
	    	        //String tvalue1=tvalue.trim(); 
	    	        String tvalue1=rs2.getString("TypeValue");
	    	        tvalue=tvalue.replace("&","...");
	    	        String Status1=rs2.getString("OperationalStatus");
					%>
					
    	    <td width="20%">
    	    
    	    <div align="left">
    	    <%-- <a href="fullfleet.jsp?transporter=<%=trans%>"><%=trans1%></a></div> --%>
    	    <%-- <a href="fullfleet.jsp?transporter=<%=tvalue1%>"><%=tvalue%></a></div> --%>
    	    <a href="fullfleet.jsp?transporter=<%=tvalue%>"><%=tvalue1%></a></div>
    	    </td>
    	    <td width="5%"><div align="left"><%=Status1%></div></td>
    	    
	</tr>
<%
		i++;}
	}catch (Exception e) {
			out.println("<tr><td colspan=2>");
			out.println("Exception :" + e.getMessage());
			out.println("Cause : " + e.getCause());
			out.println("</td></tr>");
			e.printStackTrace();
	}finally{
%>
	</table>
<%

try
{
	conn.close();
}catch(Exception e)
{}
	
	}	
%>
		
		
		



<!-- code end here --->

 		</div>
 						 </div>
 					<div id="gbox-bot1"> </div>
  					</div>
 				 </div>
 			 </div>
 		 </div>
  <table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2017 by Transworld Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>