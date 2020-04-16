
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4;
String sql,sql1,sql2,sql3,sql4,username,userrole,olddate,Svehlist;
int total,updated,dealy,disconnected,notactive,transid;
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet"	href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 -->
<link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script
	src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

 	
	
	
	
	
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<script type="text/javascript">
   $(document).ready(function() {
	 	   	   	   
     $('#example').DataTable( {
	    "pagingType": "full_numbers", 
  	
	    	
	        dom: 'Blfrtip',
	        responsive:true,
	        scrollY:	"500px",
	        scrollX:true,
	        scrollCollapse:true,
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: "Transporter Master" +" " + "Report for Active Status "+ " "+ $("#radio2").val(),
	                        
	                        	                        
	                    },
	                    {
	                        	extend : 'pdfHtml5',
	                        title : function() {
	                            return "Transporter Master" +" " + "Report for Active Status "+ " "+ $("#radio2").val();
	                        },
	                        orientation : 'landscape',
	                        pageSize : 'A0',
	                        text : '<i class="fa fa-file-pdf-o"> PDF</i>',
	                        titleAttr : 'PDF'
	                    },
	                    
	                    {
	                        extend: 'csv',
	                        title: "Transporter Master" +" " + "Report for Active Status "+ " "+ $("#radio2").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title:  "Transporter Master" +" " + "Report for Active Status "+ " "+ $("#radio2").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title:  "Transporter Master" +" " + "Report for Active Status "+ " "+ $("#radio2").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All",10, 25, 50, 100 ]],
	        
	    	
	    	
	    	
	    } );
	} );


</script>
 <!-- <style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

 #example td, #example th {
    border: 1px solid #ddd;
    padding: 8px;
} 

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>  -->
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

<!-- code end here --->
<form name="remdelvehs" method="get" action="" onSubmit="return validate();">
<body style="background-color: #FFFFFF;">

<!-- <table width="850px" height="350px" border="0"> -->
<tr align="left">
<td>
<font color="#f2f2f2" size="2" >
<a href="transporterdetails.jsp"><b>Add/Edit Transporter Details</b></a>

</font>

</td>
</tr>

<br>
<br>
<table  width="1099px">
<tr>
<td></td>
<td></td>
<td></td>
	<td align="right" ><font color="brown" size="4"><b>Transporter Master</b></font></td>
	<td align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td>	
</tr>
</table>
<br>
	<table border="0" width="1090px" style="background-color:#cfcfcf;">
		
		<tr align="center">&nbsp;&nbsp;<td>
		<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st3=conn.createStatement();
	
	st2=conn1.createStatement();
	
	String transp=request.getParameter("activestatus"); 
	if(transp ==null)
	{
	transp="All";
	}
	String userrole=session.getAttribute("userrole").toString();
	String insert=request.getParameter("insert");
	String transporter=request.getParameter("transporter");
	java.util.Date dte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today=formatter.format(dte);
		
%>	


<input type="hidden" name="radio2" id="radio2"  value="<%=transp%>">
		

<font color="black" size="2"><b>Active Status : </b></font>
		 <select class="formElement" id="activestatus" name="activestatus" style="width: 75px;font-size:14px; height: 20px;">
		      <option value="All" selected="selected">All</option>
		         <option value="Yes" >Yes</option>
		            <option value="No" >No</option>
		            
		            
		       			</select>
		       	&nbsp; &nbsp;<input type="submit" name="submit" id="submit" align="center" onclick="birt()" value="Submit">
		</td>
	
	<%-- 	<td align="right" >
<font size="2">
			<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
			</font>
			</td> --%>
			</tr>		
		       	</table>		
		       			<br>
		       			<br>
		
		<div class="form" style="width:1091px;color: black;">
		<table id="example" class="display" a style="width: 100%"
				cellspacing="0" border="1" >
				<thead  >
				
		    <tr >
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Sr No</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;" > Transporter</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> TCode </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Userlimit</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Unitlimit</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> ERPCode</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> MapType</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> VehicleLimit </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Active Status</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> SLA Status </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> AMC Status </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> AMC Exp Date </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Comment</th>
		         <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Entered By</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Jcode</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Admin Email</th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> JRM </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Address </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Note </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Customer Type </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> Operational Status </th>
				<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #e6e6e6 ; color: black;"> DateTime</th>
	
		
		</tr>
		</thead>
		<tbody>
		<%	
		int i=1;
		String status;
		String qtd="-",qtcmnt="-",qtby="-",qtstatus=null,dispdate="";
		if(transp ==null)
		{
		transp="All";
		}
		%>
		 <script>
		    document.getElementById("activestatus").value='<%out.print(transp); %>';
		    
		    </script>
<%
		 /* if(transp.equals("All"))
			 {
		    	 transp="%%";
			 } */



		if( transp.equals("All"))
		{	
			sql2="select  trim( TypeValue ) as Transporter1 ,TCode,Userlimit,Unitlimit,ERPCode,MapType,VehicleLimit,ActiveStatus,SLAStatus,AMCStatus,AMCExpDate,comment,EnteredBy,Jcode,AdminEmail,JRM,address,note,CustomerType,OperationalStatus,DateTime from db_gps.t_transporter where ActiveStatus like '%%' order by DateTime desc";
		}
		else if(transp.equalsIgnoreCase("Yes"))
		{
			sql2="select  trim( TypeValue ) as Transporter1 ,TCode,Userlimit,Unitlimit,ERPCode,MapType,VehicleLimit,ActiveStatus,SLAStatus,AMCStatus,AMCExpDate,comment,EnteredBy,Jcode,AdminEmail,JRM,address,note,CustomerType,OperationalStatus,DateTime from db_gps.t_transporter where ActiveStatus like '%Yes%' order by DateTime desc";
		} 
		else if(transp.equalsIgnoreCase("No"))
		{
			sql2="select  trim( TypeValue ) as Transporter1 ,TCode,Userlimit,Unitlimit,ERPCode,MapType,VehicleLimit,ActiveStatus,SLAStatus,AMCStatus,AMCExpDate,comment,EnteredBy,Jcode,AdminEmail,JRM,address,note,CustomerType,OperationalStatus,DateTime from db_gps.t_transporter where ActiveStatus like '%No%' order by DateTime desc";
			
		}
		ResultSet rs2=st.executeQuery(sql2);
		while(rs2.next())
		{ 
			String Transporter1=rs2.getString("Transporter1");
			String TCode=rs2.getString("TCode");
			String Userlimit=rs2.getString("Userlimit");
			String Unitlimit=rs2.getString("Unitlimit");
			String ERPCode=rs2.getString("ERPCode");
			String MapType=rs2.getString("MapType");
			
			String VehicleLimit= rs2.getString("VehicleLimit");
			String ActiveStatus= rs2.getString("ActiveStatus");
			String SLAStatus= rs2.getString("ActiveStatus");
			String AMCStatus= rs2.getString("ActiveStatus");
			String AMCExpDate= rs2.getString("ActiveStatus");
			
			String comment= rs2.getString("comment");
			String EnteredBy= rs2.getString("EnteredBy");
			String Jcode= rs2.getString("Jcode");
			String AdminEmail= rs2.getString("AdminEmail");
			String JRM= rs2.getString("JRM");
			String address= rs2.getString("address");
			if(address==null){
				address="-";
			}
			String note= rs2.getString("note");
			String CustomerType= rs2.getString("CustomerType");
			String OperationalStatus= rs2.getString("OperationalStatus");
		String 	DateTime= rs2.getString("DateTime");
		
		String datetimefinal[]=DateTime.split("\\s");
		 String datefinal= datetimefinal[0];
		 datefinal=  new SimpleDateFormat("dd-MMM-yyyy")
					.format(new SimpleDateFormat("yyyy-MM-dd")
							.parse(datefinal));
		 
		 System.out.println("Date is:- " + datefinal);
		 String timefinal=datetimefinal[1] ;
		 System.out.println("timefinal:- " + timefinal);
			
			DateTime=datefinal + " " + timefinal;
			System.out.println("Final DateTime is:- " + DateTime);
			 	
		%>
			<tr>
				<td style="font-size: 14px; border: 1px solid #ddd; color: black"
							align="right" > <%=i %></td>
				<td style="font-size: 14px;border: 1px solid #ddd; color: black"
							align="left"> <%=Transporter1%></td>
				<td style="font-size: 14px; border: 1px solid #ddd; color: black"
							align="right"> <%=TCode%></td>
				<td style="font-size: 14px;border: 1px solid #ddd; color: black"
							align="right"> <%=Userlimit%></td>
				<td style="font-size: 14px; border: 1px solid #ddd; color: black"
							align="right"> <%=Unitlimit%></td>
				<td style="font-size: 14px;border: 1px solid #ddd;  color: black"
							align="right"> <%=ERPCode %></td>
				<td style="font-size: 14px; border: 1px solid #ddd; color: black"
							align="left"><%=MapType%></td>
				
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="right"> <%=VehicleLimit%></td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd;color: black"
							align="left"> <%=ActiveStatus%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=SLAStatus%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=AMCStatus%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=AMCExpDate%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=comment%></td>
				
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=EnteredBy%></td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd;color: black"
							align="right" > <%=Jcode%></td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd;color: black"
							align="left"> <%=AdminEmail%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=JRM%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=address%></td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd;color: black"
							align="left" > <%=note%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="left"> <%=CustomerType%></td>
				<td style="font-size: 14px; face: san-serif; border: 1px solid #ddd;color: black"
							align="left"> <%=OperationalStatus%></td>
				<td style="font-size: 14px; face: san-serif;border: 1px solid #ddd; color: black"
							align="right"> <%=DateTime%></td>
				
				
				
				
			</tr>	
			
		<%
			i++;	}
			%>
			
		
			
		</tbody>
			</table>
	</div>
		
			
			
		<%
}
catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>
		<!-- <script>
		
		window.onload=birt1;
</script> -->		
		
		<!-- </td></tr> -->
		
		</body>
		</form>
 	<!-- 	</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div> -->
  
 <!--  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div> -->

</body>
</html>

<%--  <%@ include file="footer.jsp" %> --%>