<%-- 
    Document   : data delay
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: this page is shows the login users transporters vehicle having data dealy greater than 24 hour.
    					and from the same palce user can see the transporters contact details and
    					capture the incomming / outgoing calls or he/she can allocate or reallocate the complaint.
    last updated : Jan 13, 2009.
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" 
import="java.sql.*" import=" java.text.*" import=" java.util.*" 
errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5, st6,stx;
String 
sql,sql1,sql2,sql3,sql4,sql5,username,userrole,today,olddate,Svehlist, vehattloc, technician,transporter;
int total,updated,dealy,disconnected,notactive,transid;
int instcount,currcount,delcount,discount,notacount,unallocated, unallocatedall, tno;
String newtrans, oldtrans;
String attloc,tech,dt;
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 
    <title>Seven Day Diary System.</title>
    <link rel="stylesheet" href="style.css" type="text/css" 
charset="utf-8" />
    <link rel="stylesheet" href="css/css.css" type="text/css" 
charset="utf-8" />
    <script src="sorttable.js" type="text/javascript"></script>

     <script laguage="javascript">
		function hidediv(aa)
		{
			if(document.getElementById("condiv"+aa).style.display == 'none')
			{
				document.getElementById("condiv"+aa).style.display = '';
				document.getElementById("link"+aa).innerHTML="<font color='brown'>Click To Hide Contact Details</font>"
			} 
			else
			{
				document.getElementById("condiv"+aa).style.display = 'none';
				document.getElementById("link"+aa).innerHTML="<font color='brown'>Click To Show Contact Details</font>"
			}
			
			
		}
		
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
          <P></p>
          <%@ include file="header1.jsp" %>
                   </div>   
    <div id="gbox1">
           <!-- <div id="gbox-top1"> </div> --> 
            <div id="gbox-bg1">
              <div id="gbox-grd1">
      
  
<!--- code start here ------>

<%
instcount=0;
currcount=0;
delcount=0;
discount=0;
notacount=0;
unallocatedall=0;
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-1000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
today = formatter.format(defoultdate);
miliseconds=defoultdate.getTime();
miliseconds=miliseconds-6000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
try
{
    Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st=conn.createStatement();
    stx=conn.createStatement();
    st1=conn.createStatement();
    st2=conn1.createStatement();
    st3=conn1.createStatement();
    st4=conn1.createStatement();
    st5=conn.createStatement();
    st6=conn1.createStatement();
    sql="select Distinct(Lname) as loc from t_location";
    ResultSet resloc=st.executeQuery(sql);
    attloc="<selct name='location' id='location'><option value='Select'>Select</option>";
    while(resloc.next())
    {
    attloc=attloc+"<option value='"+resloc.getString("loc")+"'>"+resloc.getString("loc")+"</option>";
    }
    attloc=attloc+"</select>";
    //sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where Representative='"+username+"' order by Transporter";
    //ResultSet rst=st.executeQuery(sql);
    %>
    <table border="0" width="750px" align="center">
    <tr><td> 
    <div align="center" width="750px"><font color="Brown" size="2">List Of Vehicles Having Data Delay</font></div>
    </td></tr>
    </table>
    <table border="1" width="750px" class="sortable">
    <tr>
    <td><b>Sr.</b></td>
    <td><b>Vehicle Reg. No</b></td>
    <td><b>Transporter</b></td>
    <td><b>Updated</b></td>
    <td><b>Comp.Reg. Date</b></td>
    <td><b>Available Date</b></td>
    <td><b>Location</b></td>
    <td><b>Technician</b></td>
    </tr>   
    <%
    int i=1, k=0;
   // while(rst.next())
   // {
	String tt=session.getAttribute("TransporterList").toString();
	StringTokenizer s= new StringTokenizer(tt,",");
	
    while(s.hasMoreTokens())
		{
		transporter=s.nextElement().toString();
		transporter=transporter.replace(")","");
		transporter=transporter.replace("(","");
		if(transporter.equals("a"))
		{
		transporter=s.nextElement().toString();
		}
    
    	//out.print(newtrans+"  "+oldtrans+"<br>");
    	String us=username.toUpperCase();
		if(session.getAttribute("userrole").toString().equals("Group"))
		{
		if(us.equals("CASTROL"))
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"' and Active='Yes'";
		}
		else
		{
			sql="select vehCode as VehicleCode  from t_group where GPName='"+us+"' and VehRegNo='"+transporter+"'";
		}
		}
		else
		{
		sql="select *  from t_vehicledetails where OwnerName='"+transporter+"'";
		}    ResultSet rs1=st6.executeQuery(sql);
         while(rs1.next())
         {
         	
				sql="select * from t_onlinedata where VehicleCode='"+rs1.getString("VehicleCode")+"' and TheDate <'"+today+"'";
    			ResultSet rst1=st2.executeQuery(sql);
    			if(rst1.next())
    			{
    						if(i==1)
    		{
    				
    				oldtrans=transporter;
    		}
    		newtrans=transporter;
    		if(!(oldtrans.equals(newtrans)))
    		{
    			%>
    			<tr><td colspan="8"><a href="javascript:hidediv(<%=i%>);" id="link<%=i%>"><font color="brown">Click to Show Contact Details</font></a> <b><font color="brown"> of <%=oldtrans%> </font></b></td></tr>
				 <tr id="condiv<%=i%>" style="display:none"><td colspan="8">
				<%
				sql="select * from t_recieverinfo where Transporter='"+oldtrans+"'";
				%>
				<table border="1" width="100%" bgcolor="yellow">
				<tr>
				<td>Name</td>
				<td>Phone</td>
				<td>Mobile</td>
				<td>Email</td>
				<td>Location</td>
				<td>Comment</td>
				</tr>
				<%
				ResultSet rst5=stx.executeQuery(sql);	
				while(rst5.next())
				{
				%>
				<tr>
				<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>&limit=10','win1','width=900,height=550,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst5.getString("RecieverName")%></a></td>
				<td><%=rst5.getString("Phone")%></td>
				<td><%=rst5.getString("Mobile")%></td>
				<td><a href="mailto:<%=rst5.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst5.getString("Email")%></a></td>
				<td><%=rst5.getString("PlaceName")%></td>
				<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Edit</a></td>
				 </tr>				
				<%
				}			
				%>
				</table>				
				</td></tr>
				<%
    			oldtrans=newtrans;
    		}	
        			%>
            	<tr>
            	<td><%=i%></td>
            <td><a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst1.getString("VehicleRegNo")%></a>
		<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('add_comp.jsp?vid=<%=rs1.getString("VehicleCode")%>','win1','width=500,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">ADD / REALLOCATE COMPLAINT</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rs1.getString("VehicleCode")%>','win1','width=500,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">VEIW HISTORY</a></td></tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
</div>		</td>
            	<td><%=rst1.getString("Transporter")%></td>
            	<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("TheDate"))%><%=" "+rst1.getString("TheTime")%></td>
            	<%
            	sql="select * from t_complaints1 where VehicleNo='"+rst1.getString("VehicleRegNo")+"' and Status in('UnAllocated', 'Allocated') order by TdyDate desc limit 1 ";
               //out.print(sql); 
                         
            	ResultSet rst2=st1.executeQuery(sql);
					if(rst2.next())
					{
						
    					tno=rst2.getInt("Tno");
    					vehattloc=rst2.getString("VehAttLoc");  
						%>
       		<td id="regdate<%=i %>"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("TdyDate"))%></td>
      				<td id="avaidate<%=i %>"><%
          				String dt=rst2.getString("VehAvailDate");
      					if(dt.length() >4)
      					{
                        out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("VehAvailDate")));
                     }           
                  	%>
                  </td>
                  <td id="attloc<%=i %>"> <%=vehattloc %> </td>
                    <%
                         sql5="select Technicion from t_callocation1 where Tno='"+tno+"' ";
                         ResultSet rs5=st5.executeQuery(sql5);
                         if(rs5.next())
                         {
                             technician=rs5.getString("Technicion"); 
                         }

                         if(null==technician || technician.equals("null"))
                         { %>
                            <td id="tech<%=i%>"> - </td>
                  	      <%  
                  	    }
                         else
                            { %>
                                 <td id="tech<%=i%>"> <%=technician %> </td>
                        <%  }
                        }
                        else
                        { %>
                              <td id="regdate<%=i %>"> - </td>
                              <td id="avaidate<%=i %>"> - </td>
                              <td id="attloc<%=i %>"> - </td>
                              <td id="tech<%=i%>"> - </td>
                  <%    }
                          
            %>
                       
           							
            </tr>       
        <%
    i++;
    
    }
   else
        {  
     
        sql="select * from t_vehicledetails where VehicleCode='"+rs1.getString("VehicleCode")+"' and VehicleCode not in(select VehicleCode from t_onlinedata)";
			ResultSet rst6=st2.executeQuery(sql);
			if(rst6.next())
			{			
				if(i==1)
    		{
    				
    				oldtrans=transporter;
    		}
    		newtrans=transporter;
    		if(!(oldtrans.equals(newtrans)))
    		{
    			%>
    			<tr><td colspan="8"><a href="javascript:hidediv(<%=i%>);" id="link<%=i%>"><font color="brown">Click to Show Contact Details</font></a> <b><font color="brown"> of <%=oldtrans%> </font></b></td></tr>
				 <tr id="condiv<%=i%>" style="display:none"><td colspan="8">
					<%
				sql="select * from t_recieverinfo where Transporter='"+oldtrans+"'";
				%>
				<table border="1" width="100%" bgcolor="yellow">
				<tr>
				<td>Name</td>
				<td>Phone</td>
				<td>Mobile</td>
				<td>Email</td>
				<td>Location</td>
				<td>Comment</td>
				</tr>
				<%
				ResultSet rst5=stx.executeQuery(sql);	
				while(rst5.next())
				{
				%>
				<tr>
	<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>&limit=10','win1','width=900,height=500,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')">
<%=rst5.getString("RecieverName")%></a></td>
				<td><%=rst5.getString("Phone")%></td>
				<td><%=rst5.getString("Mobile")%></td>
				<td><a href="mailto:<%=rst5.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst5.getString("Email")%></a></td>
				<td><%=rst5.getString("PlaceName")%></td>
				<td><a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Edit</a></td>
				</tr>				
				<%
				}			
				%>
				</table>				
				</td></tr>
				 <%
    			oldtrans=newtrans;
    		} 
			  %>
             <tr> <td><%=i%></td><td>
					<a href="javascript:toggleDetails(<%=i%>,true);" title="Click Here"><%=rst6.getString("VehicleRegNumber")%></a>
		<br/>	
	<div class="popup" id="popup<%=i%>">
	<table border="0" >
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('add_comp.jsp?vid=<%=rs1.getString("VehicleCode")%>','win1','width=500,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">ADD / REALLOCATE COMPLAINT</a></td></tr>
	<tr><td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=rs1.getString("VehicleCode")%>','win1','width=500,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">VEIW HISTORY</a></td></tr>
	<tr><td><a href="javascript:toggleDetails(<%=i%>,false);">Close</a></td></tr>
	</table>
	
</div>	             
             
             
              </td><td><%=rst6.getString("OwnerName")%> </td><td><font color='red'>Not Active <br> Install On</font><%try{ out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst6.getDate("InstalledDate"))); }catch(Exception e){ out.print("-");}%> </td>
				<%
            	sql="select * from t_complaints1 where VehicleNo='"+rst6.getString("VehicleRegNumber")+"' and Status in('UnAllocated', 'Allocated') order by TdyDate desc limit 1 ";
               //out.print(sql);           
            	ResultSet rst2=st1.executeQuery(sql);
					if(rst2.next())
					{
    					tno=rst2.getInt("Tno");
    					vehattloc=rst2.getString("VehAttLoc");  
						%>
       				<td id="regdate<%=i %>"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("TdyDate"))%></td>
      				<td id="avail<%=i %>"><%
          				String dt=rst2.getString("VehAvailDate");
      					if(dt.length() >4)
      					{
                        out.print(new SimpleDateFormat("dd-MMM-yyyy").format(rst2.getDate("VehAvailDate")));
                     }           
                  	%>
                  </td>
                  <td id="attloc<%=i %>"> <%=vehattloc %> </td>
                    <%
                         sql5="select Technicion from t_callocation1 where Tno='"+tno+"' ";
                         //out.print(sql5);
                         ResultSet rs5=st5.executeQuery(sql5);
                         if(rs5.next())
                         {
                             technician=rs5.getString("Technicion"); 
                         }

                         if(null==technician || technician.equals("null"))
                         { %>
                            <td id="tech<%=i%>"> - </td>
                  	      <%  
                  	    }
                         else
                            { %>
                                 <td id="tech<%=i%>"> <%=technician %> </td>
                        <%  }
                        }
                        else
                        { %>
                              <td id="regdate<%=i %>"> - </td>
                              <td id="avaidate<%=i %>"> - </td>
                              <td id="attloc<%=i %>"> - </td>
                              <td id="tech<%=i%>"> - </td>
               
                  <%    }
                          
            %>
            				
             </tr>
  <% i++;
  
  }
       
       
  }
 }
 }
 
    %>
    <tr><td colspan="8"> <a href="javascript:hidediv(<%=i%>);" id="link<%=i%>" ><font color="brown">Click to Show Contact Details </font></a><b><font color="brown"> of <%=oldtrans%> </font></b></td> </tr>
	 <tr id="condiv<%=i%>" style="display:none"><td colspan="8">
		<%
				sql="select * from t_recieverinfo where Transporter='"+oldtrans+"'";
				%>
				<table border="1" width="100%" bgcolor="yellow">
				<tr>
				<td>Name</td>
				<td>Phone</td>
				<td>Mobile</td>
				<td>Email</td>
				<td>Location</td>
				<td>Comment</td>
				</tr>
				<%
				ResultSet rst5=stx.executeQuery(sql);	
				while(rst5.next())
				{
				%>
				<tr>
				<td><a href="#" onClick="window.open ('last10callinfo.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>&limit=10','win1','width=900,height=500,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><%=rst5.getString("RecieverName")%></a></td>
				<td><%=rst5.getString("Phone")%></td>
				<td><%=rst5.getString("Mobile")%></td>
				<td><a href="mailto:<%=rst5.getString("Email")%>?subject=Vehicle%20Complaints%20"><%=rst5.getString("Email")%></a></td>
				<td><%=rst5.getString("PlaceName")%></td>
				<td>
				<a href="javascript: flase" onClick="window.open ('addcall.jsp?reciever=<%=rst5.getString("RecieverName")%>&trans=<%=oldtrans%>','win1','width=400,height=250,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')">Edit</a>
				</td>
				</tr>				
				<%
				}			
				%>
				</table>				
					 
	 
	 </td></tr>
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
        <table width="750px" height="350px">
        <tr><td></td></tr>       
        </table>

<!-- code end here --->
         </div>
            </div>
          
        <div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
 
</body>
</html>


