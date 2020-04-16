<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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

<script language="javascript" >

function Show(i)
{ 
   if(i==1)
   { 
     document.forms.editrecForm.edit1.style.visibility = 'visible';
   }

   if(i==2)
   { 
     document.forms.editrecForm.edit2.style.visibility = 'visible';
   }

   if(i==3)
   { 
     document.forms.editrecForm.edit3.style.visibility = 'visible';
   }
   if(i==4)
   { 
     document.forms.editrecForm.edit4.style.visibility = 'visible';
   }
}

function load()
{
   
    //document.editrecForm.edit1.SelectedIndex=1;
    //document.editrecForm.edit1[1].selected;
   //document.editrecForm.edit1.value="";
   //document.editrecForm.edit2.value="";
   document.editrecForm.edit3.value="";
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
        <%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
<!--- code start here ------>

<form name="editrecForm" method="get" action="cnfrmedit.jsp"> 
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null, rs4=null;
	String sql1="", sql2="", sql3="", sql4="";
	String vehcode="", ownername="", gpname="None", vehno="", unitid="",soldout="",vehtyp="";	
	int i=1;

	String tcategory=request.getParameter("category");

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


	//System.out.println("tcategory>>>>>"+tcategory);
	
	
	
	vehcode=request.getParameter("vid");
	
	sql3="select * from t_vehicledetails where VehicleCode='"+vehcode+"' ";
	rs3=stmt1.executeQuery(sql3);
	if(rs3.next())
	{
		ownername=rs3.getString("OwnerName");
		vehno=rs3.getString("VehicleRegNumber");
		unitid=rs3.getString("UnitId");
		soldout=rs3.getString("SoldOut");
		
		vehtyp=rs3.getString("vehtype");
	}
	sql4="select * from t_group where VehCode='"+vehcode+"' ";
	rs4=stmt1.executeQuery(sql4);
	if(rs4.next())
	{
		 gpname=rs4.getString("GPName");
	}	
	
	//sql1="select distinct(TypeValue) as TypeValue from t_security order by TypeValue asc";
	sql1="select distinct(TypeValue) as TypeValue from db_gps.t_transporter where ActiveStatus='Yes' order by TypeValue asc";
	//out.println(sql1);
	rs1=stmt1.executeQuery(sql1);
%>


	 <table border="0" width="750px">
	   <tr>
		<td> <div align="center"> <font color="maroon" size="2"> <B> Edit Records </B> </font> </div> </td>
	   </tr>	
	   <tr>
		<td> <div align="center"> <font color="maroon" size="1">If OwnerName is not available in list create user for owner</font> </div> </td>
	   </tr>
	 </table>

<table border="0" width="750px">
  <tr>
      <td> <div align="center">	

	 <table border="1" width="450px">
  	    <tr>
			<td>  
				<b> <font color="maroon"> Owner Name: </font>&nbsp;&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=ownername%> 
			</td>
			<td width="10%"> 
				<div align="center">
					<a href="#" onClick="Show(<%=i %>);"> Edit </a> 
			</td>
   			<td>&nbsp;&nbsp;&nbsp; 
   					<select name="edit<%=i %>" style="visibility:hidden" class= "formElement">
                             <option value="Select" "Selected"> Select </option>
                             <option value="None" > None </option>
<%
							   while(rs1.next())
   								{ 
%>
						      <option value="<%=rs1.getString("TypeValue") %>" > <%=rs1.getString("TypeValue") %> </option>
<% 
								} 
%>
 					</select> </iv>
   			</td>

	    </tr>
		<%
 		 i++;
		%>

		<%
		sql2="select distinct(TypeValue) as TypeValue from t_security where TypeofUser='GROUP' order by TypeValue";
		rs2=stmt1.executeQuery(sql2);
		%>
<!--	<tr>
  	 	<td> <b><font color="maroon">  Group Name: </font>&nbsp;&nbsp;&nbsp;  </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=gpname%>  </td>  
		<td width="10%">  <div align="center"> -->
<!--   <a href="#" onClick="Show(<%=i %>);"> Edit </a> </td>  -->
		<!--   <td>&nbsp;&nbsp;&nbsp; <select name="edit<%=i %>" style="visibility:hidden" class="formElement"> 
                             <option value="Select" "Selected"> Select </option>
                             <option value="None" > None </option>
			<%    while(rs2.next())
      				{  %>
			          <option value="<%=rs2.getString("TypeValue") %>" > <%=rs2.getString("TypeValue") %> </option>
			<%    }  %>    
                                  
			</select> </div>
   		</td> -->
<!--  	</tr> -->

		<%
  			//i++;
		%>

	<tr> 
   		<td>  <b><font color="maroon">  Vehicle No: </font> &nbsp;&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%=vehno%> </td>
		<td><div align="center">
			<a href="#" onClick="Show(3);"> Edit  </a> </div> </td>
		   <td>&nbsp;&nbsp;&nbsp; <input type="text" name="edit3" size="15" style="visibility:hidden" class="formElement"> </input> </div> </td>
	</tr>
	
	<tr >
			<td>
			<b> <font color="maroon"> Vehicle Category: </font>&nbsp;&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=vehtyp%> 
			 </td>	
			<td width="10%"> 
				<div align="center">
					<a href="#" onClick="Show(<%=i %>);"> Edit </a> 
			</td>
		
			<td>&nbsp;&nbsp;&nbsp; 
			
			<select name="edit<%=i %>"  id="vhtyp" style="visibility:hidden" class= "formElement">
                             <option value="Select" "Selected"> Select </option>
                            
<% 
			String	sql="select distinct(VehType) as vehtype from db_gps.t_vehtypmaster  order by VehType asc" ;
   				
         //System.out.println("sql in veh BEFORE type>>>>"+sql);
           ResultSet rst33=stmt1.executeQuery(sql);
   				//System.out.println("sql in veh type>>>>"+sql);
   				
   				
   			    while(rst33.next())
			    { 
%>
     			<option value="<%=rst33.getString("vehtype") %>"> <%=rst33.getString("vehtype") %> </option>
<%  } %>
     			
        		</select> 
			</td>
			
		</tr>
		
	
	
	</tr>
		<tr>
   		<td>  <b><font color="maroon"> SoldOut:</font>&nbsp;&nbsp;&nbsp; </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=soldout%>   </td>
		<td width="10%">  <div align="center">
<a href="#" onClick="Show(4);"> Edit </a> </td>
		 <td>&nbsp;&nbsp;&nbsp; <select name="edit4" style="visibility:hidden" class="formElement">
                             <option value="Select" "Selected"> Select </option>
                             <option value="Yes" > SoldOut </option>
			          		<option value="No" > Demo </option>
			</select> </div>
   		</td>
		 
	</tr>
	<%
			i++;
		%>	
	<tr>
   		<td>  <b><font color="maroon"> Unit Id:</font>&nbsp;&nbsp;&nbsp; </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=unitid%>   </td>
		<td> &nbsp;</td>
		   <td>  &nbsp;</td>
	
	<tr>
		<td colspan="2"> <b><font color="maroon"> Comment:</font> </td>
		<td> <textarea name="comment" class="formElement"> </textarea> </td>
	</tr>
	<tr>
		  <td colspan="3"><div align="center"> <input type="submit" name="submit" value="Update" class="formElement"> </input> </div>
		  <input type="hidden" name="tid" value="<%=tid%>" />
								<input type="hidden" name="comptype" value="<%=cat%>" />
		   </td>
	  </tr> 
	</table> </div>
    </td> 
   </tr>
</table>

</div>
<input type="hidden" name="vehcode" value="<%=vehcode %>" > </input>
<input type="hidden" name="vehno" value="<%=vehno %>" > </input>
<input type="hidden" name="owner" value="<%=ownername %>" > </input>
<input type="hidden" name="unid" value="<%=unitid %>" > </input>
<input type="hidden" name="group" value="<%=gpname %>" > </input>
<input type="hidden" name="soldout" value="<%=soldout %>" > </input>
<input type="hidden" name="oldveh" value="<%=vehno%>" />

<%
}
catch(Exception e)
{
	out.print("Exception --->"+e);
}
finally
{
	con1.close();
}
%>
<!-- code end here --->

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

