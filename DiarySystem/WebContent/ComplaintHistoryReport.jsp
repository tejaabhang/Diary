<%@ page language="java"  import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet" import=" java.text.*" %><html>
<%@ include file="headerpopdiary.jsp"%>
<%!
	Connection con;
	
	%>

<head>
<title>Complaint History Report</title>
<script src="sorttable.js" type="text/javascript"></script>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/style2.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/chromestyle2.css" />
<script type="text/javascript" src="css/chrome.js"></script>
<script type="text/javascript">
</script>
</head>


<body>
<%
Statement st=null;

String RId=request.getParameter("RId");
//System.out.println("************"+RId+"***********");
//System.out.println("came inside the history report");
int count=0;
SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm");
String ComplaintID="-",PageName="-",Description="-",EntBy="-", Name="-",EmailID="-",Email1="-",ContactNumber="-",FileName="-",Category="-", Priority="-", ComplaintDateTime="-",ExpectedResTime="-";
String UpdatedDateTime="-",ComplaintResolutionTime="-",EscalatedDept="-",ClosingComment="-",Status="-",Website="-",ReportName="-",Closeddatetime="-",Transporter="-",prmntSolution="-",updateComment="-";
try
{
	con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = con.createStatement();
} catch (Exception e) {
}
%>


<h1 align="center">
		<table width="100%" >
		<tr>
		<td>
		<a href="http://www.mobile-eye.in" target="_blank"><img src="images/mobile.jpg" style="height: 80px; width: 100px;" title="Mobile-eye" id="logo" alt="Logo" /></a>
		</td>
		
		<td style="vertical-align: bottom;text-align: center;margin-left: 2em;"><div style="text-align: center;"><a>Complaint History Report</a></div></td>
		
		
		<td style="vertical-align: bottom;text-align: right;"><font style="font-size: 0.5em;"><a href="http://www.mobile-eye.in" target="_blank">www.mobile-eye.in</a></font></td>
		
		
		
		</tr>
		</table></h1>




			
<table border="1" cellpadding="1" width="100%" style="background: #f8fcff" align="center" class="sortable" bgcolor="white">
	<tr style="background-color: #C3D9FF;">
		<td style="background-color:#BDBDBD; ">ComplaintID</td>
		<td style="background-color:#BDBDBD; ">PageName</td>
		<td style="background-color:#BDBDBD; ">Description</td>
		<td style="background-color:#BDBDBD; ">EntBy</td>
		<td style="background-color:#BDBDBD; ">Name</td>
		<td style="background-color:#BDBDBD; ">EmailID</td>
		<td style="background-color:#BDBDBD; ">Email1</td>
		<td style="background-color:#BDBDBD; ">ContactNumber</td>
		<td style="background-color:#BDBDBD; ">FileName</td>
		<td style="background-color:#BDBDBD; ">Category</td>
		<td style="background-color:#BDBDBD; ">Priority</td>
		<td style="background-color:#BDBDBD; ">ComplaintDateTime</td>
		<td style="background-color:#BDBDBD; ">UpdatedDateTime</td>
		<td style="background-color:#BDBDBD; ">ComplaintResolutionTime</td>
		<td style="background-color:#BDBDBD; ">ExpectedResolutionTime</td>
		<td style="background-color:#BDBDBD; ">EscalatedDept</td>
		<td style="background-color:#BDBDBD; ">ClosingComment</td>
		<td style="background-color:#BDBDBD; ">Status</td>
		<td style="background-color:#BDBDBD; ">Website</td>
		<td style="background-color:#BDBDBD; ">ReportName</td>
		<td style="background-color:#BDBDBD; ">Closeddatetime</td>
		<td style="background-color:#BDBDBD; ">Transporter</td>
		<td style="background-color:#BDBDBD; ">prmntSolution</td>
		<td style="background-color:#BDBDBD; ">updateComment</td>
			
	</tr>
	<%
	
	try{
		String sql1 ="select *  from db_gps.t_ComplaintDetailHistory where ComplaintID='"+RId+"' Order by SrNo";
		ResultSet rs1=st.executeQuery(sql1);
		//System.out.println("*****    sql1*******     "+sql1);
		
		while(rs1.next()) {
			ComplaintID=rs1.getString("ComplaintID");
			PageName=rs1.getString("PageName");
			Description=rs1.getString("Description");
			EntBy=rs1.getString("EntBy");
			Name=rs1.getString("Name");
			EmailID=rs1.getString("EmailID");
			Email1=rs1.getString("Email1");
			ContactNumber=rs1.getString("ContactNumber");
			FileName=rs1.getString("FileName");
			Category=rs1.getString("Category");
			Priority=rs1.getString("Priority");
			ComplaintDateTime=rs1.getString("ComplaintDateTime");			
			UpdatedDateTime=rs1.getString("UpdatedDateTime");
			ComplaintResolutionTime=rs1.getString("ComplaintResolutionTime");
			ExpectedResTime=rs1.getString("ExpectedResolutionTime");
			EscalatedDept=rs1.getString("EscalatedDept");
			ClosingComment=rs1.getString("ClosingComment");
			Status=rs1.getString("Status");
			Website=rs1.getString("Website");
			ReportName=rs1.getString("ReportName");
			Closeddatetime=rs1.getString("Closeddatetime");
			Transporter=rs1.getString("Transporter");
			prmntSolution=rs1.getString("prmntSolution");
			updateComment=rs1.getString("updateComment");
			
			
			if(PageName!=null)
			{
				
				
			}else{
				PageName="-";
				
			}
			if(ComplaintID!=null)
			{
				
				
			}else{
				ComplaintID="-";
				
			}
			
			if(Description!=null)
			{
				
				
			}else{
				Description="-";
				
			}
			if(EntBy!=null)
			{				
			}else{
				EntBy="-";
				
			}
			
			if(Name!=null)
			{				
			}else{
				Name="-";
				
			}
			
			if(EmailID!=null)
			{				
			}else{
				EmailID="-";
				
			}
			
			if(Email1!=null)
			{				
			}else{
				Email1="-";
				
			}
			
			if(ContactNumber!=null)
			{				
			}else{
				ContactNumber="-";
				
			}
			if(FileName!=null)
			{				
			}else{
				FileName="-";
				
			}
			if(Category!=null)
			{				
			}else{
				Category="-";
				
			}
			if(Priority!=null)
			{				
			}else{
				Priority="-";
				
			}
			if(ComplaintDateTime!=null)
			{				
			}else{
				ComplaintDateTime="-";
				
			}
			if(UpdatedDateTime!=null)
			{				
			}else{
				UpdatedDateTime="-";
				
			}
			if(ComplaintResolutionTime!=null)
			{				
			}else{
				ComplaintResolutionTime="-";
				
			}
			if(ExpectedResTime!=null)
			{				
			}else{
				ExpectedResTime="-";
				
			}
			if(EscalatedDept!=null)
			{				
			}else{
				EscalatedDept="-";
				
			}
			if(ClosingComment!=null)
			{				
			}else{
				ClosingComment="-";
				
			}
			if(Status!=null)
			{				
			}else{
				Status="-";
				
			}
			
			if(Website!=null)
			{				
			}else{
				Website="-";
				
			}
			if(ReportName!=null)
			{				
			}else{
				ReportName="-";
				
			}
			
			if(Closeddatetime!=null)
			{				
			}else{
				Closeddatetime="-";
				
			}
			if(Transporter!=null)
			{				
			}else{
				Transporter="-";
				
			}
			if(prmntSolution!=null)
			{				
			}else{
				prmntSolution="-";
				
			}
			if(updateComment!=null)
			{				
			}else{
				updateComment="-";
				
			}
			
			
			
		%>
		<%
	/*	if(ComplaintDateTime=="" || ComplaintDateTime.equals("") || ComplaintDateTime.equals("null") || ComplaintDateTime.equals(null) || ComplaintDateTime.equalsIgnoreCase("") || ComplaintDateTime==null ||ComplaintDateTime.equalsIgnoreCase(null))
		{
			//System.out.println("in if4");
			ComplaintDateTime="-";
		}else{
			//System.out.println("in else4");
			ComplaintDateTime=formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTime));
		}
		
		if(UpdatedDateTime=="" || UpdatedDateTime.equals("") || UpdatedDateTime.equals("null") || UpdatedDateTime.equals(null) || UpdatedDateTime.equalsIgnoreCase("") || UpdatedDateTime==null ||UpdatedDateTime.equalsIgnoreCase(null))
		{
			//System.out.println("in if5");
			ComplaintDateTime="-";
		}else{
			//System.out.println("in else5");
			UpdatedDateTime=formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(UpdatedDateTime));
		}
		
		if(ComplaintResolutionTime=="" || ComplaintResolutionTime.equals("") || ComplaintResolutionTime.equals("null") || ComplaintResolutionTime.equals(null) || ComplaintResolutionTime.equalsIgnoreCase("") || ComplaintResolutionTime==null ||ComplaintResolutionTime.equalsIgnoreCase(null))
		{
			//System.out.println("in if1");
			ComplaintResolutionTime="-";
		}else{
			//System.out.println("in else1");
			ComplaintResolutionTime=formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintResolutionTime));
		}
		
		if(ExpectedResTime=="" || ExpectedResTime.equals("") || ExpectedResTime.equals("null") || ExpectedResTime.equals(null) || ExpectedResTime.equalsIgnoreCase("") || ExpectedResTime==null ||ExpectedResTime.equalsIgnoreCase(null))
		{
			//System.out.println("in if2");
			ExpectedResTime="-";
		}else{
			//System.out.println("in else2");
			ExpectedResTime=formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ExpectedResTime));
		}
		
		if(Closeddatetime=="" || Closeddatetime.equals("") || Closeddatetime.equals("null") || Closeddatetime.equals(null) || Closeddatetime.equalsIgnoreCase("") || Closeddatetime==null ||Closeddatetime.equalsIgnoreCase(null))
		{
			//System.out.println("in if3");
			ExpectedResTime="-";
		}else{
			//System.out.println("in else3");
			Closeddatetime=formatter1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Closeddatetime));
		} */
		%>
		
		
		
		<tr>
		<td align="right"><%=ComplaintID%></td>
		<td><%=PageName%></td>
		<td><%=Description%></td>
		<td><%=EntBy%></td>
		<td><%=Name%></td>
		<td><%=EmailID%></td>
		<td><%=Email1%></td>
		<td><%=ContactNumber%></td>
		<td><%=FileName%></td>
		<td><%=Category%></td>
		<td><%=Priority%></td>
		<td><%=ComplaintDateTime%></td>
		<td><%=UpdatedDateTime%></td>
		<td><%=ComplaintResolutionTime%></td>
		<td><%=ExpectedResTime%></td>
		<td><%=EscalatedDept%></td>
		<td><%=ClosingComment%></td>
		<td><%=Status%></td>
		<td><%=Website%></td>
		<td><%=ReportName%></td>
		<td><%=Closeddatetime%></td>
		<td><%=Transporter%></td>
		<td><%=prmntSolution%></td>
		<td><%=updateComment%></td>
		
		</tr><%
			
			
			}	
		}catch(Exception e) {
			//System.out.println("The exception is :"+e);	
		}

	
	%>
	
</table>
</body>


<table border="1" width="100%" align="center">
<tr><td bgcolor="#98AFC7" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>


</html>