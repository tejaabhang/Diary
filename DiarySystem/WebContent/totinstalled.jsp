<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement psPagination,psRowCnt,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12,st13,st14;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,transporter, warranty;



public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>
<%
String  userrole1=session.getAttribute("userrole").toString();
%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<title>Seven Day Diary System.</title>
	
	
	<script language="javascript">


	function gotoPrint(divName)  
	{  
		  

    //  alert("fun 1>>>");
		  var printContents = document.getElementById(divName).innerHTML; 
		  var originalContents = document.body.innerHTML; 
		  document.body.innerHTML = printContents;  
		  window.print();
		  document.body.innerHTML = originalContents;  
	}


	function gotoExcel(elemId, frmFldId)  
	{  
		//alert("fun 2>>>");
		      
	          var obj = document.getElementById(elemId);  
          var oFld = document.getElementById(frmFldId); 
          oFld.value = obj.innerHTML;  
          document.sla1.action ="excel.jsp";
          document.forms["sla1"].submit();

	           //alert("end>>>");

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
           <!-- <div id="gbox-top1"> </div> --> 
            <div id="gbox-bg1">
              <div id="gbox-grd1">
              

<%
try{
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);


Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

st1=conn1.createStatement();
st2=conn1.createStatement();
st3=conn1.createStatement();
st4=conn1.createStatement();
st5=conn1.createStatement();
st6=conn1.createStatement();
st7=conn1.createStatement();
st8=conn1.createStatement();
st9=conn1.createStatement();
st10=conn1.createStatement();
st11=conn1.createStatement();
st12=conn1.createStatement();
st13=conn1.createStatement();
st14=conn1.createStatement();


//psRowCnt=conn1.createStatement();

    ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=100;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    int l=nullIntconv(request.getParameter("l"));
    int iStartResultNo=0;
    int iEndResultNo=0;
    String vehno="";
   // String sqlPagination;
    
    if(iPageNo==0)
    {
        iPageNo=0;
        l=iPageNo+1;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
        l=iPageNo+1;
    }
    
    
    
    String vhrg="",vhreg="",sqlagn="",rep="",sqlon="",vhrg1="",sqlut="",sqlgrp="";
    if(userrole1.equalsIgnoreCase("supertech"))
    {
    	System.out.println(">>>INSIDE KAMAL DIXIT LOOP&&&&&&###########>>");
    	
    %>	
    	
<form  name="sla1" id="sla1" method="post" >
   
   <div id="table1">
	
	
	<%
	
	 String exportFileName="Reinspection.xls";  
	
	%>
	<div class="bodyText"  style="text-align: right;">
                           <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
                           <input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
     
                           </div>
   
    	
    	<table border="0" width="750px" align="center">
				<tr>
				<td>
						
				<td align="center"> <font color="maroon" size='3'><b><i> Total Installed Vehicles </i></b> </font> </td>
				<td colspan="" bgcolor="">  
					<a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style:none; "></img></a> </td>	

			</tr>
		</table>
    		<table border="0" width="750px" align="center">
				<tr>
				<td>
<table border="1" width="100%" class="sortable">
    <tr>
    <td><b><font color='brown' size='2'><div align="right"> Sr. No.</div> </font></b></td>
    <td><b><font color='brown' size='2'>Transporter</font></b></td>
	<td><b><font color='brown' size='2'>Veh. Reg. No.</font></b></td>
	<td><b><font color='brown' size='2'>Updated</font></b></td>
	<td><b><font color='brown' size='2'>Location</font></b></td>
	<td><b><font color='brown' size='2'> Unit Id </font></b></td>
	<td><b><font color='brown' size='2'>MobileNO</font></b></td>
	<td><b><font color='brown' size='2'>SimNo</font></b></td>
	<td><b><font color='brown' size='2'>Peripherals</font></b></td>
	<td><b><font color='brown' size='2'>Sim Company</font></b></td>
	<td><b><font color='brown' size='2'>GP Name</font></b></td>
	<td><b><font color='brown' size='2'>Inst On</font></b></td>
	<td><b><font color='brown' size='2'>Warranty</font></b></td>
		</tr>
	<tr>	
    	
    	
    	
    	
    <%	
    	vhrg="select *  from t_vehicledetails where OwnerName not like '%del' order by OwnerName Asc";// where Available='Yes'";
    	ResultSet vht=st10.executeQuery(vhrg);
    	System.out.println(">>>>>>sql 3>>vhrg>>"+vhrg);
    	while(vht.next())
    	{
    		vhreg=vht.getString("OwnerName");
    		//vhrg1=vht.getString("VehicleRegNumber");
    		
    		sqlagn ="select * from db_CustomerComplaints.t_asgndtranstoreps where Transporter='"+vhreg+"' ";	
    		ResultSet agnt=st11.executeQuery(sqlagn);
    		System.out.println(">>>>>>sql 3>>sqlagn>>"+sqlagn);
    		if(agnt.next())
    		{
    			rep=agnt.getString("Representative");		
    			
    			
    		
    		if(rep=="Kamal Dixit" || rep.equalsIgnoreCase("Kamal Dixit")){
    		%>
    			
    			
    	<%
    	sqlon="select * from t_onlinedata where VehicleRegNo='"+vht.getString("VehicleRegNumber")+"' order by TheDate desc, TheTime desc";
    	ResultSet ont=st12.executeQuery(sqlon);
    	System.out.println(">>>>>>sql 3>>sqlon>>"+sqlon);
    	if(ont.next())
    	{%>
    		
    		<td align="right"><div align="right"> <%=l%></div> </td>
  		   <td align="left"><div align="left"> <%=vht.getString("OwnerName")%></div> </td>
     	   <td><%=vht.getString("VehicleRegNumber")%></td>
           <td><font color='red'><%=ont.getString("TheDate") %><br><%=ont.getString("TheTime") %></br></font></td>
           <td align="left"><font color='red'><%=ont.getString("Location") %></font></td>
           <td align="right"><div align="right"><%=vht.getString("UnitID")%></div> </td>
    		
    		
    		
    	<%
    	sqlut="select * from t_unitmaster where unitid= '"+vht.getString("UnitID")+"' ";
    	ResultSet utd=st13.executeQuery(sqlut);
    	System.out.println(">>>>>>sql 3>>sqlut>>"+sqlut);
    	if(utd.next())
    	{%>
    		<td align="right"><div align="right"> <%=utd.getString("MobNo") %> </div></td>
    			<td align="right"><div align="right"> <%=utd.getString("SimNo") %></div> </td>
    			<td align="left"> <div align="left"><%=utd.getString("Peripherals") %> </div></td>
    			<td align="left">  <div align="left"><%=utd.getString("SimCompany") %></div> </td>
    		
    		
    		
    		
    	<%}
    	else
    	{
    		%>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			
		
		<%
    	}
    	sqlgrp="select * from t_group where transporter= '"+vht.getString("VehicleRegNumber")+"'";
    	ResultSet grp=st14.executeQuery(sqlgrp);
    	System.out.println(">>>>>>sql 3>>sqlgrp>>"+sqlgrp);
    	if(grp.next())
    	{
    		%>
			<td align="left"> <div align="left"> <%=grp.getString("GPName") %></div> </td>
			<%
    		
    		
    	}else
    	{
    		%>
    			<td>-</td>
    		<%
    		
    	}
    		
    %>
    		<td align="right"> <div align="right"> <%=vht.getString("InstalledDate") %> </div> </td>
    	
    	   			
    			
    		<%

		String	wardate = vht.getString("InstalledDate");
			String sql5="select * from t_amchistory where VehNo = '"+vht.getString("VehicleRegNumber")+"' order by NewDate desc limit 1";
			ResultSet rst5 = st5.executeQuery(sql5);
			if(rst5.next())
			{
				if(!(null==rst5.getDate("WarrantyTill")))
				{
					try
					{
						String sql6="select TO_DAYS('"+rst5.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
						ResultSet rst6 = st6.executeQuery(sql6);
						if(rst6.next())
						{
							if(rst6.getInt("days") > 0)
							{
								warranty = "YES";
							}
							else
							{
								warranty = "NO";
							}
						}
					}catch(Exception e)
					{
						warranty="-";
					}
				}
				else
				{
					String sql7="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
					ResultSet rst7= st7.executeQuery(sql7);
					if(rst7.next())
					{
						if(rst7.getInt("days") > 365)
						{
							warranty = "NO";
						}
						else
						{
							warranty = "YES";
						}
					}
				}
			}
			else
			{
				String sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
				ResultSet rst8 = st8.executeQuery(sql8);
				if(rst8.next())
				{
					if(rst8.getInt("days") > 365)
					{
						warranty = "NO";
					}
					else
					{
						warranty = "YES";
					}
				}
			}
			
			
		
	
	
	%>
		<td align="left">  <div align="left"><%=warranty %></div> </td>
 </tr>
 <%
    	}else{
    		%>
 		   
    		
    <%		
    	   		
    	}
    		    		
    		l++;
    		}	
    		
    	}	
    	}
    	
    %>	
    </table>
    </td>
   </tr>
   </table>
    </div>
    </form>
    	
    	
   <% }else{
    
   String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM t_vehicledetails where Status in ('-','DeActivated','Removed') and OwnerName not like '%del' and OwnerName not like '%rem' order by OwnerName Asc limit "+iPageNo+","+iShowRows+" ";
	
   psPagination=conn1.prepareStatement(sqlPagination);
   rsPagination=psPagination.executeQuery();
    
    //// this will count total number of rows
     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
     psRowCnt=conn1.prepareStatement(sqlRowCnt);
     rsRowCnt=psRowCnt.executeQuery();
     
     if(rsRowCnt.next())
      {
         iTotalRows=rsRowCnt.getInt("cnt");
      }
%>

<body>
<form name="frm">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
<input type="hidden" name="l" value="<%=l%>">



			<table border="0" width="750px" align="center">
				<tr>
				<td>
						
				<td align="center"> <font color="maroon" size='3'><b><i> Total Installed Vehicles </i></b> </font> </td>
				<td colspan="" bgcolor="">  
					<div align="right">  <a href="totinstalledexcel.jsp?"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div> </td>	

			</tr>
		</table>
<table border="0" width="750px" align="center">
				<tr>
				<td>
<table border="1" width="100%" class="sortable">
    <tr>
    <td><b><font color='brown' size='2'>Sr. No.</font></b></td>
    <td><b><font color='brown' size='2'>Transporter</font></b></td>
	<td><b><font color='brown' size='2'>Veh. Reg. No.</font></b></td>
	<td><b><font color='brown' size='2'>Updated</font></b></td>
	<td><b><font color='brown' size='2'>Location</font></b></td>
	<td><b><font color='brown' size='2'>Unit Id</font></b></td>
	<td><b><font color='brown' size='2'>MobileNO</font></b></td>
	<td><b><font color='brown' size='2'>SimNo</font></b></td>
	<td><b><font color='brown' size='2'>Peripherals</font></b></td>
	<td><b><font color='brown' size='2'>Sim Company</font></b></td>
	<td><b><font color='brown' size='2'>GP Name</font></b></td>
	<td><b><font color='brown' size='2'>Inst On</font></b></td>
	<td><b><font color='brown' size='2'>Warranty</font></b></td>
		</tr>
	<tr>
<%
  while(rsPagination.next())
  {
	  vehno=rsPagination.getString("VehicleRegNumber");
	  
	  sql="select * from t_onlinedata where VehicleRegNo='"+rsPagination.getString("VehicleRegNumber")+"' order by TheDate desc, TheTime desc";

		ResultSet rst1=st1.executeQuery(sql);
	  
	 if(rst1.next())
	  {
  %>
  		   <td><%=l%></td>
  		   <td><%=rsPagination.getString("OwnerName")%></td>
     	   <td><%=rsPagination.getString("VehicleRegNumber")%></td>
           <td><font color='red'><%=rst1.getString("TheDate") %><br><%=rst1.getString("TheTime") %></br></font></td>
           <td><font color='red'><%=rst1.getString("Location") %></font></td>
           <td><%=rsPagination.getString("UnitID")%></td>
    
    <%
    	
    	sql2="select * from t_unitmaster where unitid= '"+rsPagination.getString("UnitID")+"' ";
    	ResultSet rst2 = st2.executeQuery(sql2);
    	if(rst2.next())
    	{
    		%>
    			<td><%=rst2.getString("MobNo") %></td>
    			<td><%=rst2.getString("SimNo") %></td>
    			<td><%=rst2.getString("Peripherals") %></td>
    			<td><%=rst2.getString("SimCompany") %></td>
    			
    		
    		<%
    	}
    	else
    	{
    		%>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			
		
		<%
    	}
    	
    	
    	String sql3 = "select * from t_group where transporter= '"+vehno+"'";
    	ResultSet rst3 = st3.executeQuery(sql3);
    	if(rst3.next())
    	{
    		%>
			<td><%=rst3.getString("GPName") %></td>
			<%
    	}
    	else
    	{
    		%>
    			<td>-</td>
    		<%
    		
    	}
    		
    %>
    		<td><%=rsPagination.getString("InstalledDate") %></td>
    	<%
    	String wardate;
        String sql4="select InstalledDate from t_vehicledetails where VehicleRegNumber = '"+vehno+"' ";
        ResultSet rst4 = st4.executeQuery(sql4);
        if(rst4.next())
        {
				wardate = rst4.getString("InstalledDate");
				String sql5="select * from t_amchistory where VehNo = '"+vehno+"' order by NewDate desc limit 1";
				ResultSet rst5 = st5.executeQuery(sql5);
				if(rst5.next())
				{
					if(!(null==rst5.getDate("WarrantyTill")))
					{
						try
						{
							String sql6="select TO_DAYS('"+rst5.getDate("WarrantyTill")+"')-TO_DAYS('"+today+"') as days";
							ResultSet rst6 = st6.executeQuery(sql6);
							if(rst6.next())
							{
								if(rst6.getInt("days") > 0)
								{
									warranty = "YES";
								}
								else
								{
									warranty = "NO";
								}
							}
						}catch(Exception e)
						{
							warranty="-";
						}
					}
					else
					{
						String sql7="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
						ResultSet rst7= st7.executeQuery(sql7);
						if(rst7.next())
						{
							if(rst7.getInt("days") > 365)
							{
								warranty = "NO";
							}
							else
							{
								warranty = "YES";
							}
						}
					}
				}
				else
				{
					String sql8="select TO_DAYS('"+today+"')-TO_DAYS('"+wardate+"') as days";
					ResultSet rst8 = st8.executeQuery(sql8);
					if(rst8.next())
					{
						if(rst8.getInt("days") > 365)
						{
							warranty = "NO";
						}
						else
						{
							warranty = "YES";
						}
					}
				}
				
			}
    	
    	
    	%>
    		<td><%=warranty %></td>
     </tr>
     <%
    
    
    
  }
	 else
	 {
		 %>
		   <td><%=l%></td>
		   <td><%=rsPagination.getString("OwnerName")%></td>
   	       <td><%=rsPagination.getString("VehicleRegNumber")%></td>
           <td><font color='red'>-</font></td>
           <td><font color='red'>-</font></td>
           <td><%=rsPagination.getString("UnitID")%></td>
         
   </tr>
  <%
	 }
	 l++;
 }


    
 %>

 </table>
 
<%
  //// calculate next record start record  and end record 
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
            iStartResultNo=(iPageNo+1);
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

%>
</td>
</tr>
<tr>
<td colspan="3">
<div align='left'>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="next.jsp?l=<%=l %>&iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> < Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="next.jsp?l=<%=l %>&iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="next.jsp?l=<%=l %>&iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="next.jsp?l=<%=l %>&iPageNo=<%=i%>&cPageNo=<%=i%>"> > Next</a> 
         <%
        }
        }
      %>
<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%>   Total Result  <%=iTotalRows%> </b>
</div>
</td>
</tr>
</table>
</form>

<%
    }
%>

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
<%
    try{
         if(psPagination!=null){
             psPagination.close();
         }
         if(rsPagination!=null){
             rsPagination.close();
         }
         
         if(psRowCnt!=null){
             psRowCnt.close();
         }
         if(rsRowCnt!=null){
             rsRowCnt.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
}catch(Exception e)
{
	out.print(e);
	 e.printStackTrace();
	
	
}
    
%>

