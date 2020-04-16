<%-- 
    Document   : header1
    Created on : October 9, 2008, 10:19:52 AM
    Author     : atul
    Description: this page having code of user validation according to user role show the menu.
    last updated : January 12, 2009.
    Update By	: Ayaz Ansari	
    last updated : December 26, 2009.    
--%>
<%@ page 
	contentType="text/html; charset=iso-8859-1" 
	language="java" 
	import="java.sql.*" 
	import=" java.text.*" 
	import=" java.util.*" 
	errorPage="" %>
	
<%@ include file="menu.html" %>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19595446-3']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

  function newwindow(webadd)
  { 
	window.open(webadd,'jav','width=780,height=200,resizable=yes');
  } 

  function openpopup(PageName)
  {
  	 try{
  		 //alert(e);
  	 testwindow=window.open("RegisterComplaint_diary.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes");
  	 testwindow.moveTo(200,200);
  	 }catch(e)
  	 {
  		 alert(e);
  	 }
  }
  function openpopup1(PageName)
  {
  	 try{
  		 //alert(e);
  	 testwindow=window.open("RegisterComplaint_Customer.jsp?PageName="+PageName,"Register Complaint","width=900,height=500,scrollbars=yes");
  //	window.location="RegisterComplaint_Customer.jsp?PageName="+PageName,"Register Complaint","width=700,height=400,scrollbars=yes";
  	 testwindow.moveTo(200,200);
  	 }catch(e)
  	 {
  		 alert(e);
  	 }
  }


  
</script>

<%!
	final String SUPER_USER = "Superuser";
	final String MANAGER = "Manager";
	final String MIDDLE_WARE = "MiddleWare";
	final String SERVICE = "service";
	final String GROUP = "Group";
	final String SALES = "sales";
	final String DISPATCH = "dispatch";
	final String SUPERADMIN = "SuperAdmin";
	

%>
<%
String  MM_dbConn_STRING1="jdbc:mysql://103.241.181.36/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://192.168.2.55/db_gps";
String  MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";


String MM_dbConn_USERNAME="diary";
String MM_dbConn_PASSWORD="d@1ry";




//

%>
<br><br>
<%
try{
	
	//System.out.println("inside try.of header.....");
	String reportno = "",PageName="";
	 PageName=this.getClass().getName();

	PageName=PageName.substring(PageName.lastIndexOf(".")+1,PageName.length());
	//System.out.println("<><><>>......."+PageName);
	PageName=PageName.replace("_",".");
	PageName=PageName.replace(".005f","_");
	//System.out.println(">>>>>>>>PageName>>"+PageName);
	
	
	Class.forName(MM_dbConn_DRIVER);
	//System.out.println("00000000......");
	Connection conn;
	//System.out.println("<<><><><>1......");
	conn = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//System.out.println("<><><><>222......");
	//sessionst = sessionconn.createStatement();
	//sessionst1 = sessionconn.createStatement();
	//Statement stqueryy=sessionconn.createStatement();
	Statement strno = conn.createStatement();
	Statement cnt1=conn.createStatement();
    Statement cnt2=conn.createStatement();
    Statement cnt3=conn.createStatement();
    Statement cnt4=conn.createStatement();
    Statement	cnt5=conn.createStatement();
    Statement cnt6=conn.createStatement();
    Statement cnt7=conn.createStatement();
    Statement cnt8=conn.createStatement();
    Statement cnt9=conn.createStatement();
	
	
	//System.out.println("<><><><>33333......");
//String useType11=session.getAttribute("TypeofUser").toString();
//String targetvalue=session.getAttribute("usertypevaluemain").toString();
//String userid=session.getAttribute("user").toString();
//System.out.println("1111111111111111...");

////System.out.println(userid);
String sql = "select ReportNo from db_gps.t_reportnumberdiary where PageName = '"+PageName+"'";
//System.out.println("222222222...");
ResultSet rs = strno.executeQuery(sql);
//System.out.println("33333333...");
//System.out.println(sql);
//System.out.println("4444444...");
if(rs.next())
{
	reportno = rs.getString("ReportNo");
	//System.out.println("reportno>>..."+reportno);
}
	
int pndng=0,respnd=0,escltd=0,slvd=0,attnd=0,ovrdue=0,clsd=0;
//String a="Pending",b="Responded",c="Attended",d="Solved",e="Escalated",g="overdue",l="Closed";

String a="Pending",b="Responded",c="Attended",d="Solved",e="Escalated",g="overdue",l="Closed",nwl1="NewCmpL1",nwl2="NewCmpL2",nwl3="NewCmpL3",rspndl1="RspndL1",rspndl2="RspndL2",rspndl3="RspndL3",esltdl1="EscL1",esltdl2="EscL2",esltdl3="EscL3",attnl1="AttndL1",attnl2="AttndL2",attnl3="AttndL3",quedl1="QuedL1",quedl2="QuedL2",quedl3="QuedL3",svdl1="solvL1",svdl2="solvL2",svdl3="solvL3",cldl1="ClsdL1",cldl2="ClsdL2",cldl3="ClsdL3" ;
	 
String 	sqlcnt="SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' and dept='software' ) and TIMESTAMPDIFF( MINUTE ,ComplaintDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'pending' and dept='software' )  and status = 'pending'";
   	  	
ResultSet rs111=cnt1.executeQuery(sqlcnt);

//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>111>>>>>"+sqlcnt);

if(rs111.next())
{
	
	pndng=rs111.getInt("cnt");
	
}



	
String 	sqlcnt1="SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Responded' ) and status = 'Responded' ";  	

ResultSet rs111_rst=cnt2.executeQuery(sqlcnt1);

//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>22222>>>>"+sqlcnt);
if(rs111_rst.next())
{
	
	respnd=rs111_rst.getInt("cnt");
	
}


String 	sqlcnt2="SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Attended' ) and status = 'Attended' ";  	

ResultSet rs111_rst1=cnt3.executeQuery(sqlcnt2);

//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>33333>>>>>"+sqlcnt);
if(rs111_rst1.next())
{
	
	attnd=rs111_rst1.getInt("cnt");
	
}



String 	sqlcnt33=" SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' ) and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Solved' )  and status = 'Solved'  ";  	

ResultSet rs111_rst_33=cnt4.executeQuery(sqlcnt33);

//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>>>4444>>>"+sqlcnt);
if(rs111_rst_33.next())
{
	
	slvd=rs111_rst_33.getInt("cnt");
	
}



String 	sqlcnt_54=" SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated' and dept='software' ) and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Escalated' and dept='software' ) and status = 'Escalated' ";
 	  	
ResultSet rs111_27=cnt7.executeQuery(sqlcnt_54);

//System.out.println(">>>>>>sqlcnt@@@@@@@@ >>>>>121212>>>>>"+sqlcnt_54);

if(rs111_27.next())
{

escltd=rs111_27.getInt("cnt");

}




String 	sqlcnt_58=" SELECT count( * ) as cnt  FROM db_gps.t_ComplaintDetail    WHERE TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and TIMESTAMPDIFF( MINUTE ,ComplaintResolutionTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'Queued' )  and status = 'Queued'  ";
	

//System.out.println(">>>>>>sqlcnt_58@@@@@@@@ >>>>>before>>>>>"+sqlcnt_58);
ResultSet rstnew1=cnt8.executeQuery(sqlcnt_58);
//System.out.println(">>>>>>sqlcnt_58@@@@@@@@ >>>>>>>>>>"+sqlcnt_58);

if(rstnew1.next())
{
	
	ovrdue=rstnew1.getInt("cnt");
	
}


String 	sqlcnt_541="select count(*) as cnt  from db_gps.t_ComplaintDetail  where  TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() )    > ( 	SELECT TimeDiffL1 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' )  and TIMESTAMPDIFF( MINUTE ,UpdatedDateTime, now() ) < ( 	SELECT TimeDiffL2 FROM db_gps.t_ComplaintSettings WHERE Category = 'closed' ) and status = 'closed' ";
	
ResultSet rs111_271=cnt9.executeQuery(sqlcnt_541);

//System.out.println(">>>>>>sqlcnt_541@@@@@@@@ >>>>>>>>>>"+sqlcnt_541);

if(rs111_271.next())
{
	
	clsd=rs111_271.getInt("cnt");
	
}
	
	
	
	final Format dateFormatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	final String currentDate = dateFormatter.format(new java.util.Date());
	final String userRole = session.getAttribute("userrole").toString();	
	final String typevalue = session.getAttribute("typevalue").toString();	
	if("transporter".equalsIgnoreCase(typevalue)){
		%>
		
		<table border="0" width="750px" align="center"  bgcolor="#CECEF6" bordercolor="red">
		<tr>
			<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>BACK</b></font></a></th>
			<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
			<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu12, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
			<th><a href="#"><font color="#2A0A12"><b>WELCOME</b></font> </a><font color="#2A0A12"><b><%=session.getAttribute("DisplayName").toString()%></b></font></th>
			<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
		</tr>
		<tr>
			<td colspan="6"> <div align="right"><font color="#2A0A12"><%=currentDate%></font></div></td>
	   </tr>
	</table>
	<%}
	if(SUPER_USER.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="750px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="weeklyreport.jsp" title="weeklyreport"><font color="#2A0A12"><b>7 Days Report</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu3, '150px')" onMouseout="delayhidemenu()" title="My Dairy"><font color="#2A0A12"><b>MY DIARY</b></font></a></th>
		<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu4, '150px')" onMouseout="delayhidemenu()" title="SpecialReports"><font color="#2A0A12"><b>SPECIAL REPORTS</b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME </b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="7"> <div align="right"><%=currentDate%></div></td>
	</tr>  
</table>
<%
	} 
	else if(MANAGER.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="800px" align="center" bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"> <font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="weeklyreport.jsp" title="weeklyreport"><font color="#2A0A12"><b>7 Days Report</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '150px')" onMouseout="delayhidemenu()" title="My Dairy"><font color="#2A0A12"><b>MY DIARY</b></font></a></th>
		<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu6, '150px')" onMouseout="delayhidemenu()" title="Admin Options"><font color="#2A0A12"><b>ADMIN OPTIONS</b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME </b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="6"> <div align="right"><%=currentDate%></div></td>
	</tr>
</table>
<%
	}else if(SUPERADMIN.equalsIgnoreCase(userRole)){
		%>
		<table border="0" width="800px" align="center" bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"> <font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="weeklyreport.jsp" title="weeklyreport"><font color="#2A0A12"><b>7 Days Report</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '150px')" onMouseout="delayhidemenu()" title="My Dairy"><font color="#2A0A12"><b>MY DIARY</b></font></a></th>
		<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu6, '150px')" onMouseout="delayhidemenu()" title="Admin Options"><font color="#2A0A12"><b>ADMIN OPTIONS</b></font></a></th>
		<th><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu8, '150px')" onMouseout="delayhidemenu()" title="Admin Options"><font color="#2A0A12"><b>SUPER ADMIN </b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME </b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="6"> <div align="right"><%=currentDate%></div></td>
	</tr>
</table>
		<%
	}
	else if(MIDDLE_WARE.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="750px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th><a href="weeklyreport.jsp" title="weeklyreport"><font color="#2A0A12"><b>7 Days Report</b></font></a></th>
		<th><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '150px')" onMouseout="delayhidemenu()" title="My Dairy"><font color="#2A0A12"><b>MY DIARY</b></font></a></th>
		<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu7, '150px')" onMouseout="delayhidemenu()" title="Admin Options"><font color="#2A0A12"><b>OTHER OPTIONS</b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME </b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="6"> <div align="right"><%=currentDate%></div></td>
	</tr>
</table>
<%
	}
	else if(SERVICE.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="750px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th><a href="weeklyreport.jsp" title="weeklyreport"><font color="#2A0A12"><b>7 Days Report</b></font></a></th>
		<!-- <th><a href="techreport.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '150px')" onMouseout="delayhidemenu()" title="Tech Report">TECH. REPORT</a></th>  -->
		<th><a href="mydiary.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '150px')" onMouseout="delayhidemenu()" title="My Dairy"><font color="#2A0A12"><b>MY DIARY</b></font></a></th>
		<th><a href="dataentry.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '150px')" onMouseout="delayhidemenu()" title="Forms"><font color="#2A0A12"><b>DATA ENTRY FORMS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>		
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME</b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="6"> <div align="right"><%=currentDate%></div></td>
   </tr>
</table>
<%
	}
	else if(GROUP.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="750px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>BACK</b></font></a></th>
		<th><a href="homepage.jsp"  title="MAIN PAGE"><font color="#2A0A12"><b>MAIN PAGE</b></font></a></th>
		<th><a href="#"><font color="#2A0A12"><b>WELCOME</b></font></a><font color="red"><%=session.getAttribute("DisplayName").toString()%></font></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
	<tr>
		<td colspan="4"> <div align="right"><%=currentDate%></div></td>  
   </tr>
</table>
<%
	}
	else if(SALES.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="750px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>Back</b></font></a></th>
		<th><a href="homepage.jsp" title="Home"><font color="#2A0A12"><b>HOME</b></font></a></th>
		<th> <a href="outofwarrant.jsp" title="Out Of Warranty Vehicles (Excel format)"><font color="#2A0A12"><b>All OutOf Warranty Vehs(Excel)</b></font></a></th>
		<th> <a href="remdelvehs.jsp" title="Removed / Deleted Vehs"><font color="#2A0A12"><b>Removed/Deleted Vehs</b></font></a></th>
		<th> <a href="groupmainpage.jsp" title="Group Vehs"><font color="#2A0A12"><b>GroupWise Vehs</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu9, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th><a href="report.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu11, '150px')" onMouseout="delayhidemenu()" title="Reports"><font color="#2A0A12"><b>REPORTS</b></font></a></th>
		<th> <a href="changepassword.jsp" title="changepass"><font color="#2A0A12"><b>Change Password</b></font></a></th>
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
</table>
<%
	}
	else if(DISPATCH.equalsIgnoreCase(userRole))
	{
%>
<table border="0" width="500px" align="center"  bgcolor="#E6E6E6">
	<tr>
		<th><a href="javascript:history.go(-1);" title="Back"><font color="#2A0A12"><b>Back</b></font></a></th>
		<th> <a href="Simtrack.jsp" title="Out Of Warranty Vehicles (Excel format)"><font color="#2A0A12"><b>Sim Search</b></font></a></th>		
		<th><a href="logout.jsp"><font color="#2A0A12"><b>LOGOUT</b></font></a></th>
	</tr>
</table>
<%
	}
%>
 <form name="srch" method="get" action="latestdata.jsp">
     <table border="0" width="800px">
       <tr> 
          
          <td>
          <%
          	if("transporter".equalsIgnoreCase(typevalue)){
		  
          	}else{
          		%>
              	<a href="AVL_LITE.jsp"><b>AVL LITE</b></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<a href="AVL_LITE_dragonfly_rpt.jsp"><b>Dragon Fly Report</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
              	<a href="JRMVehicles.jsp"><b>JRM</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	<a href="CastrolJRM.jsp"><b>Castrol group JRM details</b></a>&nbsp;&nbsp;
              		<a href="batterbckp.jsp"><b>Battey Backup</b></a>&nbsp;&nbsp;
              		<a href="liveticket.jsp"><b>Ticket</b></a>&nbsp;&nbsp;
<!--              		<a href="livetickethistory.jsp"><b>Ticket History</b></a>&nbsp;&nbsp;-->
              		<a href="FleetViewComplaintReport1.jsp"><b>Complaints Report</b></a>&nbsp;&nbsp;
              		<font color="brown" size="1"><blink><a href="DistinctTripEntry.jsp">Check For Vehicle With Faulty Trip</a></blink> </font>
              	
              	
              	<%		
          	}
          	%>
            <div align="right"> <font color="maroon"> Enter Unit Id to search for its last data.</font>  
             
            	
            	<input type="radio" name="VehUnit" value="Vehicle" checked/><B>Vehicle</B>
				<input type="radio" name="VehUnit" value="Unit"/><B>Unit Id</B>	
				<input type="text" name="srchbx" class="formElement"/>
               	<input type="submit" style="" name="submit" value="Look Up!" class="formElement"/><br>
            </div>
            </td>            
       </tr>            
<%           
	if(SERVICE.equalsIgnoreCase(userRole) || 
		MIDDLE_WARE.equalsIgnoreCase(userRole) || 
		MANAGER.equalsIgnoreCase(userRole) || 
		SUPERADMIN.equalsIgnoreCase(userRole) || 
		SUPER_USER.equalsIgnoreCase(userRole))
	{
%>           
	<tr>
       <td > <div align="left"> <a href="#" onclick="openpopup('<%=PageName %>')" title="Register Complaint">Register Complaint</a>&nbsp;&nbsp;
            	 <a href="#" onclick="openpopup1('<%=PageName %>')" title="Register Complaint">Register Customer Complaint</a>&nbsp;&nbsp;
            	<font color="black"> Report No.:<% try{%><%=reportno %><%}catch(Exception e11){e11 .printStackTrace();} %> </font>
            	
            	</div>
<!--       <div align="center">  <font color="brown" size="2"><blink><a href="DistinctTripEntry.jsp">Check For Vehicle With Faulty Trip</a></blink> </font>	</div>-->
       </td>
       
       	
	</tr>
	<tr>
	<td>
			<font color="maroon" ><b>Overdue L1 :&nbsp;</b></font>&nbsp; 
				
			
			<b> New:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=nwl1%>&opened=<%=pndng %>" "> <font color="red" size="2"  style="size:5em"> <%=pndng %></font>  </a>&nbsp;
		
			
			
			<b> Reponded:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=rspndl1%>&closedtot=<%=respnd %>" "> <font color="red" size="2" > <%=respnd %> </font> </a>&nbsp;
			
			
				<b> Escalated:</b>&nbsp; 
			
			<a href="FleetViewComplaintDetails.jsp?Status=<%=esltdl1%>&closedtot=<%=escltd %>" "> <font color="red" size="2" > <%=escltd %> </font> </a>&nbsp;
			
			
				
			
			
			
			<b> Attended:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=attnl1%>&closedtot=<%=attnd %>" "> <font color="red" size="2">  <%=attnd %></font> </a>&nbsp;
			
			
			<b> Queued:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=quedl1%>&closedtot=<%=g %>" "><font color="red" size="2"> <%=ovrdue %></font> </a>&nbsp;
			
			
			<b> Solved:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=svdl1%>&closedtot=<%=slvd %>" "> <font color="red" size="2"> <%=slvd %></font> </a>&nbsp;
			
			
			<b> Closed:</b>
			<a href="FleetViewComplaintDetails.jsp?Status=<%=cldl1%>&closedtot=<%=l %>" "> <font color="red" size="2"> <%=clsd %></font> </a>&nbsp;
			
			
			
<!--			<b> Stage2</b>-->
<!--			<input type ="text" name ="open" value="< %=stg22 %>" style="width:30px;height:15px; " readonly="readonly">&nbsp; -->
<!--			-->
<!--			-->
<!--			&nbsp;-->
<!--			<b> Stage3</b>-->
<!--			<input type ="text" name ="open" value="< %=stg33 %>" style="width:30px;height:15px; " readonly="readonly"> -->
<!--			-->
<!--			<b> Stage4</b>-->
<!--			<input type ="text" name ="open" value="< %=stg44 %>" style="width:30px;height:15px; "  readonly="readonly">&nbsp;&nbsp;&nbsp; -->
<!--			-->
<!--			<b> Total:</b>&nbsp;-->
<!--			<a href="liveticket.jsp?owner=< %=t33%>&totaltc=< %=t3 %>" "><blink>< %=tot %></blink></a>&nbsp;-->
			</td>
	
	</tr>
	
<%
	}
%>
    </table>       
</form>  
<%
}catch (IllegalStateException e) {
    // TODO Auto-generated catch block
    response.sendRedirect("index.jsp");
	return;
   
}
catch (NullPointerException e)
{
	   
	out.print("Exception in header===>"+e);
	//System.out.println("bar.couldReturnNull() returned null");
	} 
%>
