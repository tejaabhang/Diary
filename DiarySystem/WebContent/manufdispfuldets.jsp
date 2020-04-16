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
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<title>Seven Day Diary System.</title>
	
	<script type="text/javascript">
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
           <!-- <div id="gbox-top1"> </div> --> 
            <div id="gbox-bg1">
              <div id="gbox-grd1">

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement();
ResultSet rs1=null;
String sql1="";
String frmdte="", todte="", dets="", manuf="";
int i=0;

frmdte=request.getParameter("frmdte");
todte=request.getParameter("todte");
dets=request.getParameter("dets");
manuf=request.getParameter("manuf");

%>

<table border="0" width="30%">
  <tr>
      <td>
             <div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > </img> </a> </div>
     </td> 
  </tr>
</table> 

<%
if(dets.equals("newman"))
{ %>
     <table border="0" width="750px">
       <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Manufactured Units (New) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B></font></div></td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <td> <div align="center"> <B> Sr. No. </B> </div> </td>
            <td> <div align="center"> <B> Unit No. </B> </div> </td>
            <td> <div align="center"> <B> Manuf. Date </B> </div> </td>
            <td> <div align="center"> <B> Sim No. </B> </div> </td>
            <td> <div align="center"> <B> Mob. No. </B> </div> </td>
            <td> <div align="center"> <B> Status </B> </div> </td>
            
        </tr>
     
<% 
       sql1="select * from t_unitmaster where EntDate between '"+frmdte+"' and '"+todte+"' and InstType='New' and User='"+manuf+"' ";

       rs1=stmt1.executeQuery(sql1);
       while(rs1.next())
       { 
           i++;  
           String stat=rs1.getString("Status"); 

           String entdte=rs1.getString("EntDate");

             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);
%>
            <tr>
                  <td> <div align="center"><%=i %> </div></td>
                  <td> <div align="center"><%=rs1.getString("UnitID") %></div> </td>
                  <td> <div align="center"><%=nwfrmtdte %> </div></td>
                  <td> <div align="center"><%=rs1.getString("SimNo") %> </div></td>
                  <td><div align="center">  <%=rs1.getString("MobNo") %></div> </td>
            <%
                  if(stat.equals("Dispatched"))
                  { %>
                    <td> <div align="center"><%=rs1.getString("Status") %> </div></td>
            <%    } 
                  else
                  { %>
                     <td> <div align="center"><B> Available </B> </div></td>
            <%    }  
            %>
                     
                  
            </tr>         
   <%  }  %>
     </table>
<% } 
  
else if(dets.equals("repman"))
{ 
%>
     <table border="0" width="750px">
       <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Manufactured Units (Repaired) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B></font></div></td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <td> <div align="center"><B>Sr. No. </B> </div></td>
            <td> <div align="center"><B>Unit No.</B> </div> </td>
            <td> <div align="center"><B> Manuf. Date </B> </div></td>
            <td> <div align="center"><B> Sim No. </B> </div></td>
            <td> <div align="center"> <B>Mob. No. </B> </div></td>
            <td> <div align="center"> <B>Status </B> </div></td>
            
        </tr>
     
<% 
       sql1="select * from t_unitmaster where EntDate between '"+frmdte+"' and '"+todte+"' and InstType='Repaired' and User='"+manuf+"' ";
       rs1=stmt1.executeQuery(sql1);
       while(rs1.next())
       { 
           i++;  
           String stat=rs1.getString("Status"); 
            String entdte=rs1.getString("EntDate");

             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);
%>
            <tr>
                  <td> <div align="center"> <%=i %> </div></td>
                  <td> <div align="center"><%=rs1.getString("UnitID") %></div> </td>
                  <td> <div align="center"><%=nwfrmtdte %> </div></td>
                  <td> <div align="center"><%=rs1.getString("SimNo") %> </div></td>
                  <td> <div align="center"><%=rs1.getString("MobNo") %> </div></td>
            <%
                  if(stat.equals("Dispatched"))
                  { %>
                    <td> <div align="center"><%=rs1.getString("Status") %></div> </td>
            <%    } 
                  else
                  { %>
                     <td><div align="center"> <B> Available </B> </div></td>
            <%    }  
            %>
                     
                  
            </tr>         
   <%  } %>
     </table>
<%
}
else if(dets.equals("newdisp"))
{
   %>
     <table border="0" width="750px">
       <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Dispatched Units (New) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B></font></div></td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <td><div align="center"><B>Sr. No.</B> </div></td>
            <td><div align="center"><B>Unit No. </B> </div></td>
            <td><div align="center"><B>Manuf. Date </B> </div></td>
            <td><div align="center"><B>Sim No.</B> </div></td>
            <td><div align="center"><B>Mob. No.</B> </div></td>
            <td><div align="center"><B>Disp.Date</B> </div></td>
            <td><div align="center"><B>Disp. Add</B> </div></td>
            <td><div align="center"><B>Mode of Disp</B> </div></td>            
        </tr>

<%
    sql1="select * from t_unitmasterhistory where DispDate between '"+frmdte+"' and '"+todte+"' and InstType='New' and User='"+manuf+"' ";

    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
       i++;
	String entdte="", disdte="";
       
	entdte=rs1.getString("EntDate");
        disdte=rs1.getString("DispDate");


             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);

             java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(disdte);
             Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte1=formatter1.format(datefrmdb1);
%>
          <td> <div align="center"><%=i %></div> </td>
          <td> <div align="center"><%=rs1.getString("UnitID") %> </div></td>
          <td> <div align="center"><%=nwfrmtdte %> </div></td>
          <td> <div align="center"><%=rs1.getString("SimNo") %> </div></td>
          <td> <div align="center"><%=rs1.getString("MobNo") %> </div></td>
          <td> <div align="center"><%=nwfrmtdte1 %> </div></td>
          <td> <div align="center"><%=rs1.getString("DisAdd") %></div> </td>
          <td> <div align="center"><%=rs1.getString("ModeofDispatch") %></div> </td>
    </tr>
<%  } %>
   </table>
<%
}
else
{
%>
     <table border="0" width="750px">
       <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Dispatched Units (Repaired) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B></font></div></td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <td><div align="center"><B>Sr. No.</B> </div></td>
            <td><div align="center"><B>Unit No.</B> </div></td>
            <td><div align="center"><B>Manuf. Date</B> </div></td>
            <td><div align="center"><B>Sim No.</B> </div></td>
            <td><div align="center"><B>Mob. No.</B> </div></td>
            <td><div align="center"><B>Disp.Date</B> </div></td>
            <td><div align="center"><B>Disp. Add</B> </div></td>
            <td><div align="center"><B>Mode of Disp</B> </div></td>            
        </tr>

<%
    sql1="select * from t_unitmasterhistory where DispDate between '"+frmdte+"' and '"+todte+"' and InstType='Repaired' and User='"+manuf+"' ";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
       i++;
		String entdte=rs1.getString("EntDate");	
	       String disdte=rs1.getString("DispDate");	

	     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);

             java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(disdte);
             Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte1=formatter1.format(datefrmdb1);	
%>
          <td> <div align="center"><%=i %> </div></td>
          <td> <div align="center"><%=rs1.getString("UnitID") %></div></td>
          <td> <div align="center"><%=nwfrmtdte %> </div></td>
          <td> <div align="center"><%=rs1.getString("SimNo") %> </div></td>
          <td> <div align="center"><%=rs1.getString("MobNo") %> </div></td>
          <td> <div align="center"><%=nwfrmtdte1 %> </div></td>
          <td> <div align="center"><%=rs1.getString("DisAdd") %> </div></td>
          <td> <div align="center"><%=rs1.getString("ModeofDispatch") %> </div></td>
    </tr>
<%  } %>
   </table>
<%
}
 
 con1.close();
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
<table width="750px" height="350px" border="0">
		<tr><td></td></tr>
		</table>
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

