<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>

<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st6,st7,st8;
String sql,sql1,sql2,sql3,sql4,username,userrole,today,olddate,Svehlist,sp;
int total,updated,dealy,disconnected,notactive,transid;
String vehcode, transporter, vehregno,displayform,tcategory,mobileNo;
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
	
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
 
 <script language="javascript">
 function validate()
 { var v1=document.simeditform.simplan.value;
   var v2=document.simeditform.simcategory.value;
   if(v1=="Select")
   {
      alert("Please select SimPlan from the list");
      return false;
   }
   
   if(v2=="Select")
   {
      alert("Please select SimCategory from the list");
      return false;
   }
   return true;
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
          <%String para=request.getParameter("parameter");
if(para!=null && para.equalsIgnoreCase("tech"))
{
%>EditSimPlan.jsp?mobNo=7758075139
  <%@ include file="headertech.jsp" %>

<%}
else{%>
                    <%@ include file="header1.jsp" %>
          <%} %>
          </div>
          
          <div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">
              <!--- code start here ------>
              <%  mobileNo=request.getParameter("mobNo");
              try
              {
              	Class.forName(MM_dbConn_DRIVER);
              	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
              //	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
              	st=conn.createStatement();
              	//st1=conn1.createStatement();
              	st6=conn.createStatement();
              	st7=conn.createStatement();
              	st8=conn.createStatement();
              	ResultSet rs7=null;
              	String sql7="";
              
              
              %>
          
          <table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td  align="center">
				<font size="3" color="#2A0A12">
					<b>Edit Sim Plan </b>
				</font>
			</td>
		</tr>
	</table>
<br></br>
<!--- Form And Table  start here ------>
<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td >
				<form name="simeditform" method="get" action="insertSimEdit.jsp" onSubmit="return validate()";>
				
				<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
						<tr bgcolor="#BDBDBD">
							<td width="50%" align="center"><font color="black" ><b>Mobile Number :</b></font></td>
							<td><input type="text" name="mobileno" value="<%=mobileNo%>" class="formElement" readonly /></td>
						</tr>
						<tr bgcolor="#BDBDBD">
							<td align="center"><font color="black" ><b>Sim Plan :</b></font></td>
							<td>
								<select name="simplan" id="attadd" class="formElement"> <option value="Select">Select </option>
<%                              sql1="select Service_provider from t_simmaster where Mobno='"+mobileNo+"'";
                                ResultSet RS1=st7.executeQuery(sql1);
                                while(RS1.next())
                                {
                                	sp=RS1.getString("Service_provider");
                                }
								sql="select simplan from t_simplanmaster where serviceprovider='"+sp+"' and status='Active' order by simplan asc ";
								ResultSet rst2=st.executeQuery(sql);
								while(rst2.next())
								{
%>
									<option value='<%=rst2.getString("simplan")%>'><%=rst2.getString("simplan")%></option>
<%
								}
								
%>
<!--  <option value="Other">Other</option> -->
								</select>
								
					  <div id="dvPassport" style="display: none">
       <input type="text" name="attadd1" id="txtPassportNumber" />
</div>			
							</td>
						</tr>
						
						<%
								sql7="select SimCategory from t_SimCategoryMaster order by SimCategory asc";
								rs7=st6.executeQuery(sql7);
%>
						<tr bgcolor="#BDBDBD">
							<td align="center"><font color="black" ><b>Sim Category:</b></font></td>
							<td> 
							<select name="simcategory" class="formElement"> 
								<option value="Select">Select</option>
<%
								while(rs7.next())
								{ 
%>
									<option value="<%=rs7.getString("SimCategory")%>"><%=rs7.getString("SimCategory")%></option>
<%		
								}		
%>
<!-- 									<option value="Customer">Customer</option>	 -->

		     					</select>
		     					
							</td>
						</tr>
						
						
						
				<tr>
							<td colspan="2" align="center">
								<input type="submit" name="submit" value="Submit" class="formElement">
							</td>
						</tr>
				</table>
				
				
				
				
				</form>
		</td>
	</tr>
</table>
<%
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	//conn1.close();

}
%>
<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  <div id="copyright">
   Copyright  2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>
</body>
</html>