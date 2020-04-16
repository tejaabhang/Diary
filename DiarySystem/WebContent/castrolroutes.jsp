<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection con, con2;
Statement stmt1,stmt2,stmt3,s;
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	
<script language="javascript">

function fun2()
{
	document.addgrpform.submit();
}

function formsubmit()
{
	var aa=document.addgrpform.StartPlace.value;
	if(!(aa=="Select"))
	{	
		document.addgrpform.submit();
		document.addgrpform.StartPlace[0].value = "Select";
		document.addgrpform.StartPlace[0].selected = true;
		//alert(document.addgrpform.vehcles.value)f;
	}

}
function formsubmitt()
{
	
	var OwnerName=document.addgrpform.OwnerName.value;
	
	if(!(OwnerName=="Select"))
	{	
		
		document.addgrpform.submit();
		document.addgrpform.OwnerName[0].value = "Select";
		document.addgrpform.OwnerName[0].selected = true;
		//alert(document.addgrpform.vehcles.value)f;
	}

}
function formsubmit1()
{
	var cc=document.addgrpform.EndPlace.value;
	if(!(cc=="Select"))
	{	
		document.addgrpform.submit();
		document.addgrpform.EndPlace[0].value = "Select";
		document.addgrpform.EndPlace[0].selected = true;
	}

}


function redirect()
{
	
	document.addgrpform.action="deleteconnect.jsp";
	document.addgrpform.submit();
	
}

function redirect1()
{
	
	document.addgrpform.action="updateconnect.jsp";
	document.addgrpform.submit();
	
}
function redirect2()
{
	
	document.addgrpform.action="entryconnect.jsp";
	document.addgrpform.submit();
	
}
function redirect3()
{
	
	document.addgrpform.action="savedelete.jsp";
	document.addgrpform.submit();
	
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
         <%@ include file="header1.jsp" %>
         </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
 
   
<form name="addgrpform" method="post" action=""><br><br> 
<%
   try
{
	    Class.forName(MM_dbConn_DRIVER);
	    con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	    s=con.createStatement();
	    stmt1=con.createStatement();
        stmt2=con.createStatement();
	    stmt3=con.createStatement();
        String sql,sql1,sql2,sql3; 
	    ResultSet rs1,rs2,rs3;
        String StartPlace=request.getParameter("StartPlace");
        String EndPlace=request.getParameter("EndPlace"); 
        String thename=request.getParameter("radio1");
        String OwnerName=request.getParameter("OwnerName");
        if(thename==null)
        {
       	 thename="add";
        }
          

%>

        <!--<input type="radio" name="radio1" value="add" onClick="">--> 
        <!--<input type="radio" name="radio1" value="delete"  onClick="">--> 
        <table>
          
        <tr>
        <table border="2" width="750px" >
	
	<tr>
		<td><div align="left">
        <input type="radio" name="radio1" value="add" <% if(thename.equals("add")) { out.print("CHECKED"); } %> onclick="fun2();">ADD Route</input>
		<input type="radio" name="radio1" value="delete" <% if(thename.equals("delete")) { out.print("CHECKED"); } %> onclick="fun2();">Delete Route</input>
		<input type="radio" name="radio1" value="update" <% if(thename.equals("update")) { out.print("CHECKED"); } %> onclick="fun2();">Update Route</input>
		</div></td>
		</tr>
		</table>
		</tr>
		<tr>
		
<%
 
   
  
      if(!(null==thename))
       {
        	 if(thename.equals("add"))
        	{    
        		 %>
        		
        		<table border="1" width="275px" class="sortable">
        		<tr><td>OwnerName</td>
        		<td>
        		 <select name="OwnerName" id="OwnerName" onchange="formsubmitt();"> 
         		 <option value="Select">Select</option>
         	  <%
 				if(!(null==OwnerName))
 				{
 	  %>
 		       
 					<option value="<%=OwnerName %>" selected="selected"><%=OwnerName %></option>
 	 <%
 				}
 	 %>
      	  
      <%
        		sql="select distinct(OwnerName) as OwnerName from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";
        		rs1=stmt2.executeQuery(sql);
      			  while(rs1.next())
   	  			 { %>
      					<option value="<%=rs1.getString("OwnerName") %> "> <%=rs1.getString("OwnerName") %> </option>
				<% 
				} 
				%>
         		 
         		 
         		 </select>
         		 </td>
         		 </tr>
        		<tr><td>Start Code  	</td><td><input type=text name=StartCode><br></td>	</tr>
        		<tr><td>Start Place  	</td><td><input type=text name=StartPlace><br></td>	</tr>
        		<tr><td>End Code    	</td><td><input type=text name=EndCode><br></td>	</tr>
        		<tr><td>End Place    	</td><td><input type=text name=EndPlace><br></td>	</tr>
        		<tr><td>Km           	</td><td><input type=text name=Km><br></td>	</tr>
        		<tr><td>TTime        	</td><td><input type=text name=TTime><br></td>	</tr>
        		<tr><td>Start Latitude  </td><td><input type=text name=Startlat><br></td>	</tr>
        		<tr><td>Start Longitude </td><td><input type=text name=Startlong><br></td>	</tr>
        		<tr><td>End Latitude   	</td><td><input type=text name=Endlat><br></td>	</tr>
        		<tr><td>End Longitude 	</td><td><input type=text name=EndLong><br></td>	</tr>
        		<tr><td>Route Type		</td><td><div align="left">
        		<input type="radio" name="radio2" value="Normal" checked>Normal Normal</input>
				<input type="radio" name="radio2" value="Fixed">Fixed Route</input>
				</div></td></tr>
				<tr><td>Zone</td>
        		<td>
        		<select name="zone" id="zone"> 
         		<option value="Select">Select</option>
         		<option value="East Zone">East Zone</option>
         		<option value="West Zone">West Zone</option>
         		<option value="North Zone">North Zone</option>
         		<option value="South Zone">South Zone</option>
        		</select>
         		</td>
         		</tr>

        	<tr><td colspan="4" ><div align="center"><input type="button" name="Submit" value="add"  onclick="redirect2();"></input></div></td></tr>
        		
        	</table>
        
        	
         
      <% 
        	} 
     else if(thename.equals("delete"))
     {  
     %>
    	 
          		 <table border="1" width="275px" class="sortable" >
        		 <tr >
       			 <td> <font color="maroon"> StartPlace</font> </td>
      			 <td colspan="3">
       
      			 <select name="StartPlace" id="StartPlace" onchange="formsubmit();"> 
         		 <option value="Select">Select</option>
      <%
 				if(!(null==StartPlace))
 				{
 	  %>
 		       
 					<option value="<%=StartPlace %>" selected="selected"><%=StartPlace %></option>
 	 <%
 				}
 	 %>
      <%
        		sql="select distinct(StartPlace) as StartPlace from t_castrolroutes where StartPlace not like '%del' order by StartPlace Asc";
        		rs1=stmt2.executeQuery(sql);
      			  while(rs1.next())
   	  			 { %>
      					<option value="<%=rs1.getString("StartPlace") %> "> <%=rs1.getString("StartPlace") %> </option>
				<% 
				} 
				%>
			</select> 
		
   	  		 </td>
 			</tr>
 
   				<tr><td>  <font color="maroon">EndPlace : </font> </td>
     			 <td> <select name="EndPlace" onchange="formsubmit1();" >
     	      <option value="Select" id="EndPlace">Select</option>
   			    <%
 				if(!(null==EndPlace))
 				{
 			  %>
 		       
 					<option value="<%=EndPlace %>" selected="selected"><%=EndPlace%></option>
 				 <%
 				}
 			 %>
	  			 <%
	   			sql="select Distinct(EndPlace) from t_castrolroutes where StartPlace='"+StartPlace+"' order by EndPlace";
	  			 rs2=stmt2.executeQuery(sql);
	  			 while(rs2.next())
   	  			 { 
   	  			 %>
      			<option value="<%=rs2.getString("EndPlace") %> "> <%=rs2.getString("EndPlace") %> </option>
				<% } %>
				
              	 	
	  			</select></td></tr>
	  			<%
	  			  sql3= "select StartCode,EndCode,Km,TTime,Startlat,Startlong,Endlat,EndLong from t_castrolroutes where  Startplace='"+StartPlace+"' and EndPlace='"+EndPlace+"'";
			     // //System.out.println(sql3);
	  			 rs3=  stmt3.executeQuery(sql3); 
			      
			      if(rs3.next())
			      {
			      %>
			       
 					<input type="hidden" id="startcode1" name="startcode1" value="<%=rs3.getString("StartCode")%>"></input>
 					<input type="hidden" id="endcode1" name="endcode1" value="<%=rs3.getString("EndCode")%>"></input>
 					<tr><td>Km </td><td><input type="text" name="Km" value="<%=rs3.getDouble("Km")%>" readonly/></td></tr>								
					<tr><td>TTime </td><td> <input type="text" name="TTime" value="<%=rs3.getDouble("TTime")%>" readonly/></td></tr>
					<tr><td>Start Latitude </td><td><input type="text" name="Startlat" value="<%=rs3.getDouble("Startlat")%>" readonly/></td></tr>      
					<tr><td>Start Longitude </td><td> <input type="text" name="Startlong" value="<%=rs3.getDouble("Startlong")%>" readonly/></td></tr>
 
					<tr><td>End Latitude   </td><td> <input type="text" name="Endlat" value="<%=rs3.getDouble("Endlat")%>" readonly/></td></tr>
					<tr><td>End  Longitude </td><td> <input type="text" name="EndLong" value="<%=rs3.getDouble("EndLong")%>" readonly/></td></tr>
               <%  }%>
     		<tr><td colspan="4" ><div align="center"><input type="button" name="Submit" value="Delete"  onclick="redirect3(),redirect();"  readonly></input></div></td></tr>
	    </table> 
  	  <% 
  	}
        	
 		else if(thename.equals("update"))
   {
 			%>
  
 		 <table border="1" width="275px" class="sortable" >
        		 <tr >
       			 <td> <font color="maroon"> StartPlace</font> </td>
      			 <td colspan="3">
       
      			 <select name="StartPlace" id="StartPlace" onchange="formsubmit();"> 
         		 <option value="Select">Select</option>
      <%
 				if(!(null==StartPlace))
 				{
 	  %>
 		       
 					<option value="<%=StartPlace %>" selected="selected"><%=StartPlace %></option>
 	 <%
 				}
 	 %>
      <%
        		sql="select distinct(StartPlace) as StartPlace from t_castrolroutes where StartPlace not like '%del' order by StartPlace Asc";
        		rs1=stmt2.executeQuery(sql);
      			  while(rs1.next())
   	  			 { %>
      					<option value="<%=rs1.getString("StartPlace") %> "> <%=rs1.getString("StartPlace") %> </option>
				<% 
				} 
				%>
			</select> 
		
   	  		 </td>
 			</tr>
 
   				<tr><td>  <font color="maroon">EndPlace : </font> </td>
     			 <td> <select name="EndPlace" onchange="formsubmit1();" >
     	      <option value="Select" id="EndPlace">Select</option>
   			    <%
 				if(!(null==EndPlace))
 				{
 			  %>
 		       
 					<option value="<%=EndPlace %>" selected="selected"><%=EndPlace%></option>
 				 <%
 				}
 			 %>
	  			 <%
	   			sql="select Distinct(EndPlace) from t_castrolroutes where StartPlace='"+StartPlace+"' order by EndPlace";
	  			 rs2=stmt2.executeQuery(sql);
	  			 while(rs2.next())
   	  			 { 
   	  			 %>
      			<option value="<%=rs2.getString("EndPlace") %> "> <%=rs2.getString("EndPlace") %> </option>
				<% } %>
				
              	 	
	  			</select></td></tr>
	  			<%
	  			  sql3= "select StartCode,EndCode,Km,TTime,Startlat,Startlong,Endlat,EndLong from t_castrolroutes where  Startplace='"+StartPlace+"' and EndPlace='"+EndPlace+"'";
			   //   //System.out.println(sql3);
	  			 rs3=  stmt3.executeQuery(sql3); 
			      
			      if(rs3.next())
			      {
			      %>
			         <input type="hidden" id="startcode2" name="startcode2" value="<%=rs3.getString("StartCode")%>"></input>
 					<input type="hidden" id="endcode2" name="endcode2" value="<%=rs3.getString("EndCode")%>"></input>
 					 <tr><td>Km </td><td><input type="text" name="Km" value="<%=rs3.getDouble("Km")%>"/></td></tr>								
					<tr><td>TTime </td><td> <input type="text" name="TTime" value="<%=rs3.getDouble("TTime")%>" /></td></tr>
					<tr><td>Start Latitude </td><td><input type="text" name="Startlat" value="<%=rs3.getDouble("Startlat")%>"/></td></tr>      
					<tr><td>Start Longitude </td><td> <input type="text" name="Startlong" value="<%=rs3.getDouble("Startlong")%>" /></td></tr>
 
					<tr><td>End Latitude   </td><td> <input type="text" name="Endlat" value="<%=rs3.getDouble("Endlat")%>" /></td></tr>
					<tr><td>End  Longitude </td><td> <input type="text" name="EndLong" value="<%=rs3.getDouble("EndLong")%>"/></td></tr>
               <%  }%>
     		<tr><td colspan="4" ><div align="center"><input type="button" name="Submit" value="update"  onclick="redirect1();"></input></div></td></tr>
	    </table> 
  	  <% 
  	
   }
 } 
}
catch(Exception e)
{
	out.println(e);
}
finally
{
  con.close();	
}
%>
</tr>
</table>
</div>
</form>
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>	</div>
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
