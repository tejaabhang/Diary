<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1,st,st3,stmt2, stmt4;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null;
String sql1="",sql,sql2,sql3, sql4;
String srchtext="",thename;

%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>

<script language="javascript">
function validate()
{
	var cmnt=document.multsrch.srchbx.value;

	if(cmnt.length <= 2)
	{
		alert("Please enter Unit Id ");
		return false;
	}

	
	var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
	
	for (var i = 0; i < cmnt.length; i++) 
	{
  		if (iChars.indexOf(cmnt.charAt(i)) != -1) 
		{
		  	alert ("Special Characters are not allowed");
		  	return false;
  		}
  	}

}
function fun2()
{	
	document.multsrch.submit();
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
         <p></p>
<%@ include file="header1.jsp" %>
          </div>
	<div id="gbox1">
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">

 <form name="multsrch" method="get" action="" onSubmit="return validate();">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	thename=request.getParameter("radio1");
	if(null==thename)
	{
	
	thename="simmaster";
	}
	%>
<table border="0" width="750px" align="center">	<tr>
		<td align="center" colspan="2"> <font color="maroon" size="2"> <b> Search FTP Last Dump</b> </font> </td>
	
			<input type="radio" name="radio1" value="simmaster" <% if(thename.equals("simmaster")) { out.print("CHECKED"); } %> onclick="fun2();" >From FTPlastdump Table
		   <input type="radio" name="radio1" value="manufacture" <% if(thename.equals("manufacture")) { out.print("CHECKED"); } %> onclick="fun2();">From Manufatured Table				
		
</table>
	

 
<%

if(!(null==thename))
{
	if(thename.equals("simmaster"))
	{ 


	String rad=request.getParameter("src");
	String getunit="";
	if(rad==null)
	{
		
		rad="mobile";
		
	}
	else
	{
	 	getunit=request.getParameter("srchbx");
	 	session.setAttribute("srchtext",getunit);
		try
		{
			srchtext=session.getValue("srchtext").toString();
		} catch(Exception e)
	  	{
			srchtext="";
	  	}	
	}
%>


	<table border="0" width="750px">
		<tr>
			<td align="right"> <a href="ftplastdumpexcel.jsp?thename=<%=thename%>&rad=<%=rad%>&srchbx=<%=getunit%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>	
		</tr>
	</table>
		
	


 <font color="maroon"><center><B> Note:</B> Multiple entries has to be separated by comma only. </center></font>  
<table border="0" width="750px">
<tr> 
<td align="left">
	<table border="10" width="350px" align="center">
		<tr>
			<td align="center" colspan="2"> <font color="maroon" size="2"> <B> Multiple Search For FTP Last Dump</B> </font> </td>
		</tr>	
				
		<tr>
			<td> <font color="maroon"> Search </font> </td>
			<td>
				<input type="radio" name="src" value="mobile" checked><B>Unit ID.</B></input>
	<input type="radio" name="src" value="sim"><B>Sim No.</B></input>	
			</td>
		</tr>
		<tr>
			<td> <font color="maroon"> Enter</font> </td>
			<td colspan="" align=""> <textarea name="srchbx" class="formElement"><%=srchtext%> </textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
		</tr>
	</table>
 </td>
 <td> 
		
	
</td>
</tr>
</table>
<%
			
if(rad==null)
{
}
else
{
	

	java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatter1.format(d);


	 String nextstr="";
	 int i=1;

StringTokenizer strtok = new StringTokenizer(getunit,","); 
%>

<table border="1" width="100%" class="sortable">
<tr>
				<td>Sr</td>
				<td>Unit ID</td>
				<td>Location</td>
				<td>RMC Date & Time</td>
				<td>File date & time</td>
				<td>FileName</td>
				<td>WMSN No</td>
				<td>Sim No</td>
				<td>Unit Type</td>
				<td>Username</td>
				<td>CodeVersion</td>
			
				</tr>		
<%
 while (strtok.hasMoreTokens())
 {

	if(rad.equals("mobile"))	
   	{	
		nextstr="'%"+strtok.nextToken()+"%'";
		sql1="select * from t_ftplastdump where UnitID like "+nextstr+"  order by Filedatetime desc";
   	}
	 else
		// if(rad.equals("Unit"))
   	{
			 nextstr="'%"+strtok.nextToken()+"%'";
		sql1="select * from t_ftplastdump where Simno like "+nextstr+"  order by Filedatetime desc";
	
	}  	
	 rs1=stmt1.executeQuery(sql1);
	  while(rs1.next())
	  { 

%>
		<tr>
			
			<td><div align="center"><font color="maroon"> <%=i %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("UnitID") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("Location") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("rmcdate") %> </font></div>
			<br></br><div align="center"><font color="maroon"> <%=rs1.getString("rmctime") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("Filedatetime") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("FileName") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("WMSN") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("SimNo") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("UnitType") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("Username") %> </font></div></td>
			<td><div align="center"><font color="maroon"> <%=rs1.getString("CodeVersion") %> </font></div></td>

		
 	</tr>
<%
		i++;
	} //close of while
} //close of string tokenizer

       
%>		
			
		</table>
<%
} //colse of else

	}
	else
	{


		String rad=request.getParameter("src");
		String getunit="";
		if(rad==null)
		{
			
			rad="mobile";
			
		}
		else
		{
		 	getunit=request.getParameter("srchbx");
		 	session.setAttribute("srchtext",getunit);
			try
			{
				srchtext=session.getValue("srchtext").toString();
			} catch(Exception e)
		  	{
				srchtext="";
		  	}	
		}
	%>
	
	
		<table border="0" width="750px">
			<tr>
				<td align="right"> <a href="ftplastdumpexcel.jsp?thename=<%=thename %>&rad=<%=rad%>&srchbx=<%=getunit%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>	
			</tr>
		</table>
			
		
	
	 <font color="maroon"><center><B> Note:</B> Multiple entries has to be separated by comma only. </center></font>  
	<table border="0" width="750px">
	<tr> 
	<td align="left">
		<table border="10" width="350px" align="center">
			<tr>
				<td align="center" colspan="2"> <font color="maroon" size="2"> <B> Multiple Search For FTP Last Dump</B> </font> </td>
			</tr>	
					
			<tr>
				<td> <font color="maroon"> Search </font> </td>
				<td>
					<input type="radio" name="src" value="mobile" checked><B>Unit ID.</B></input>
		<input type="radio" name="src" value="sim"><B>Sim No.</B></input>	
				</td>
			</tr>
			<tr>
				<td> <font color="maroon"> Enter</font> </td>
				<td colspan="" align=""> <textarea name="srchbx" class="formElement"><%=srchtext%> </textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
			</tr>
		</table>
	 </td>
	 <td> 
			
		
	</td>
	</tr>
	</table>
	<%

	if(rad==null)
	{
	}
	else
	{
		

		java.util.Date d = new java.util.Date();
		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte=formatter1.format(d);


	
	 	 String nextstr="";
		 int i=1;

	StringTokenizer strtok = new StringTokenizer(getunit,","); 
	%>

	<table border="1" width="100%" class="sortable">
	<tr>
			<td> Sr.</td>
			<td> Date</td>
            <td> Unit ID</td>
			<td> Sim No</td>
			<td> Mobile No</td>
			<td> InstallationType</td>
			<td> WMSN</td>
			<td> SimCompany</td>
			<td> Unit Type</td>
            <td> Software Version</td>
            <td> Peripherals</td>
            <td> Status</td>
				
					</tr>		
	<%
	 while (strtok.hasMoreTokens())
	 {

		if(rad.equals("mobile"))	
	   	{	
			nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_unitmasterhistory where UnitID like "+nextstr+"  order by UnitID Desc";
	   	}
		 else
			// if(rad.equals("Unit"))
	   	{
				 nextstr="'%"+strtok.nextToken()+"%'";
			sql1="select * from t_unitmasterhistory where Simno like "+nextstr+"  order by UnitID Desc";
		
		}  	
		ResultSet rst1=stmt1.executeQuery(sql1);
		  while(rst1.next())
		  { 

	%>
			<tr>
						<td class="bodyText"><div align="left"><font color="red"><%=i%></font></div></td>
						<%
					    try{
                        %>
                        <td class="bodyText"><div align="left"><font color="red"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst1.getDate("EntDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                           {
	                    out.print("-");
                        }
                                %>
				
                        <td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("UnitID")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("SimNo")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("MobNo")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("103.241.181.36")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("WMSN")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("SimCompany")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("typeunit")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("SwVer")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("Peripherals")%></div></td>
						<td class="bodyText"><div align="left"><font color="red"><%=rst1.getString("Status")%></div></td>
                       

			
	 	</tr>
	<%
			i++;
		} //close of while
	} //close of string tokenizer

	       
	%>		
				
			</table>
	<%
	} //colse of else
	}
}

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
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
