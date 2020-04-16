<%-- 
    Document   : Ajaxgetlocfortech
    Created on : 2009
    Author     : Azhar B.
    Discroption: this page load the information about the technician at attendance page
    last updated : Jan 10, 2010
    Modified by:  Ayaz A.
    
--%>


<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<script language="javascript">

function newwindow(webadd)
{ 
  window.open(webadd,'jav','width=700,height=500,resizable=yes');
} 


</script>
<%!
Connection con1, con2;
String lastunit,lastunit1,lastcomment;

%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con1.createStatement(), stmt4=con2.createStatement(), stmtunit=con1.createStatement(), stmtunit1=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null, rs8=null, rs9=null, rs10=null, rs11=null, rs12=null, rs13=null, rs14=null, rs15=null, rs16=null, rs20=null, rs21=null, rs22=null,rs23=null,rs24=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="", sql10="", sql11="", sql12="", sql13="", sql14="", sql15="", sql16="", sql20="", sql21="", sql22="";
String loc="", comment1="", comment2="", comment3="", spcomment1="", spcomment2="", spcomment3="";
String yestokayunits="", yestfaultyunits="", twodaysbfreokayunits="", twodaysbfrefaultyunits="", tdyokayunits="", tdyfaultyunits="";
int cnt1=0, cnt2=0, cnt3=0;

		java.util.Date tdydte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String s=formatter.format(tdydte);

		java.util.Date yestdte = new java.util.Date();
		long miliseconds=tdydte.getTime();
		miliseconds=miliseconds - 1000 * 60 * 60 *24;
		yestdte.setTime(miliseconds);	
		String yestdte1= new SimpleDateFormat("yyyy-MM-dd").format(yestdte); 

		java.util.Date twodaysbfredte = new java.util.Date();
		miliseconds=yestdte.getTime();
		miliseconds=miliseconds - 1000 * 60 * 60 *24;
		twodaysbfredte.setTime(miliseconds);	
		String twodaysbfredte1= new SimpleDateFormat("yyyy-MM-dd").format(twodaysbfredte); 

		java.util.Date threedaysbfredte = new java.util.Date();
		miliseconds=twodaysbfredte.getTime();
		miliseconds=miliseconds - 1000 * 60 * 60 *24;
		threedaysbfredte.setTime(miliseconds);	
		String threedaysbfredte1= new SimpleDateFormat("yyyy-MM-dd").format(threedaysbfredte); 
		
String tech=request.getParameter("tech");

sql1="select * from t_techlist where TechName='"+tech+"' ";
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	loc=rs1.getString("Location");
} %>

<select name="loc" class="formElement">
		<option value="Select">Select</option>
<%
sql2="select * from t_location order by LName asc";
rs2=stmt1.executeQuery(sql2);
while(rs2.next())
{ %>
	<option value="<%=rs2.getString("LName")%>" <% if(rs2.getString("LName").equals(loc)) {  %> Selected <% } %> > <%=rs2.getString("LName")%> </option>
<%	
}
%>
	<option value="Home">Home</option>
</select>

<%
	out.print("$");
	
	int okayunits=0, faultyunits=0;
	
	sql21="select count(*) as cnt from t_unitmaster where HoldBy='"+tech+"' and FaultyUnit='No' ";
	rs21=stmt2.executeQuery(sql21);
	if(rs21.next())
	{
		okayunits=rs21.getInt("cnt");
	}

	String sqlunit="select * from t_techattendance where TechName = '"+tech+"' and AttendDateTime < '"+s+"' order by AttendDateTime Desc limit 1";
	rs23=stmtunit.executeQuery(sqlunit);
	while(rs23.next())
	{
		lastunit=rs23.getString("OkayUnitsToday");
		lastunit1=rs23.getString("FaultyUnitsToday");
		lastcomment=rs23.getString("comment");
	}
%>
	<table border="1">
		<%=lastunit %>
	</table>
	<a href="#" onClick="window.open ('unitholdbytech.jsp?type=New&holdername=<%=tech%>', 'win1', 'width=700, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')">  <%=okayunits%> </a>	
	
<%
	out.print("$");
	out.print(okayunits);
	out.print("$");

	sql22="select count(*) as cnt from t_unitmaster where HoldBy='"+tech+"' and FaultyUnit='Yes' ";
	rs22=stmt2.executeQuery(sql22);
	if(rs22.next())
	{
		faultyunits=rs22.getInt("cnt");
	}
	
%>
	
	<table border="1">
		<%=lastunit1 %>
	</table>
		<a href="#" onClick="window.open ('unitholdbytech.jsp?type=Faulty&holdername=<%=tech%>', 'win1', 'width=630, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=faultyunits%> </a>	
<%
	out.print("$");	
	out.print(faultyunits);
	out.print("$");
		

	
	//out.print(lastcomment);
										
	

	sql3="select * from t_techattendance where TechName = '"+tech+"' and AttendDateTime like '"+yestdte1+" %' ";
//	System.out.print(sql3);
	rs3=stmt1.executeQuery(sql3);
	if(rs3.next())
	{
		yestokayunits=rs3.getString("OkayUnitsToday");
		yestfaultyunits=rs3.getString("FaultyUnitsToday");
		comment1=rs3.getString("Comment");
	}

	sql4="select * from t_techattendance where TechName = '"+tech+"' and AttendDateTime like '"+twodaysbfredte1+" %' ";
//	System.out.print(sql4);
	rs4=stmt1.executeQuery(sql4);
	if(rs4.next())
	{
		twodaysbfreokayunits=rs4.getString("OkayUnitsToday");
		twodaysbfrefaultyunits=rs4.getString("FaultyUnitsToday");
		comment2=rs4.getString("Comment");
	}

	sql5="select * from t_techattendance where TechName = '"+tech+"' and AttendDateTime like '"+s+" %' ";
//	System.out.print(sql5);
	rs5=stmt1.executeQuery(sql5);
	if(rs5.next())
	{
		tdyokayunits=rs5.getString("OkayUnitsToday");
		tdyfaultyunits=rs5.getString("FaultyUnitsToday");
		comment3=rs5.getString("Comment");
	}

	sql6="select count(*) as cnt1 from t_unitreplacement where Instby='"+tech+"' and InstDate = '"+yestdte1+"' and InstType in ('Rep', 'New')";
	rs6=stmt2.executeQuery(sql6);
	if(rs6.next())
	{
		cnt1=rs6.getInt("cnt1");
	}

	sql7="select count(*) as cnt2 from t_unitreplacement where Instby='"+tech+"' and InstDate = '"+twodaysbfredte1+"' and InstType in ('Rep', 'New')";
	
	rs7=stmt2.executeQuery(sql7);
	if(rs7.next())
	{
		cnt2=rs7.getInt("cnt2");
	}

	sql8="select count(*) as cnt3 from t_unitreplacement where Instby='"+tech+"' and InstDate = '"+s+"' and InstType in ('Rep', 'New')";
	
	rs8=stmt2.executeQuery(sql8);
	if(rs8.next())
	{
		cnt3=rs8.getInt("cnt3");
	}

	sql13="select count(*) as cnt from t_techspecialrep where TechName='"+tech+"' and EntDateTime like '"+yestdte1+" %' ";
	
	rs13=stmt1.executeQuery(sql13);
	if(rs13.next())
	{
		spcomment1=rs13.getString("cnt");
	}

	sql14="select count(*) as cnt from t_techspecialrep where TechName='"+tech+"' and EntDateTime like '"+twodaysbfredte1+" %' ";
	
	rs14=stmt1.executeQuery(sql14);
	if(rs14.next())
	{
		spcomment2=rs14.getString("cnt");
	}

	sql15="select count(*) as cnt from t_techspecialrep where TechName='"+tech+"' and EntDateTime like '"+s+" %' ";
	
	rs15=stmt1.executeQuery(sql15);
	if(rs15.next())
	{
		spcomment3=rs15.getString("cnt");
	}

%>
	<a href="#" onClick="window.open ('unitholdbytech1.jsp?type=New&holdername=<%=tech%>', 'win1', 'width=700, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"><font Color="RED" size="3">Click To Find Pending Units </font></a>


<table border="10" width="350px">
  <tr>
        <td align="center" colspan="6"> <B> <%=tech%> </B> </td>
  </tr>
  <tr> 
	<td align="center"> <B> Date </B> </td>
	<td align="center"> <B> Okay <br> Units </B> </td>
	<td align="center"> <B> Faulty <br> Units </B> </td>
	<td align="center"> <B> Replac<br>ement / Inst </B> </td>
	<td align="center"> <B> Comment </B> </td>
	<td align="center"> <B> Sp. Comment </B> </td>
  </tr>
  <tr>
	<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(s))%> </td>
	<td> <%=tdyokayunits%> </td>	
	<td> <%=tdyfaultyunits%> </td>
	<td> <%=cnt3%> </td>
	<td align="center"> <a href="#" onClick="newwindow('showcomments.jsp?comment=comment&comdesc=<%=comment3%>&date=<%=threedaysbfredte1%>');return false" target="_parent">  Click to view   </a> </td>
	<td>  <a href="#" onClick="newwindow('showcomments.jsp?date=<%=threedaysbfredte1%>&tech=<%=tech%>');return false" target="_parent">  <%=spcomment3%>   </a>   </td>	
  </tr>	
  <tr>
	<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(yestdte1))%> </td>
	<td> <%=yestokayunits%> </td>
	<td> <%=yestfaultyunits%> </td>
	<td> <%=cnt1%> </td>

	<td align="center"> <a href="#" onClick="newwindow('showcomments.jsp?comment=comment&comdesc=<%=comment1%>&date=<%=yestdte1%>');return false" target="_parent">  Click to view   </a> </td>

	<td>  <a href="#" onClick="newwindow('showcomments.jsp?date=<%=yestdte1%>&tech=<%=tech%>');return false" target="_parent">  <%=spcomment1%>   </a>   </td>
 </tr>
 <tr>
	<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(twodaysbfredte1))%> </td>
	<td> <%=twodaysbfreokayunits%> </td>
	<td> <%=twodaysbfrefaultyunits%> </td>
	<td> <%=cnt2%> </td>
	
	<td align="center"> <a href="#" onClick="newwindow('showcomments.jsp?comment=comment&comdesc=<%=comment2%>&date=<%=twodaysbfredte1%>');return false" target="_parent">  Click to view   </a> </td>
	<td>  <a href="#" onClick="newwindow('showcomments.jsp?date=<%=twodaysbfredte1%>&tech=<%=tech%>');return false" target="_parent">  <%=spcomment2%>   </a>   </td>	
 </tr>
 
</table>

<%
	out.print("$");
	
	Integer[] dispqty=new Integer[100];
	String[] dispdate=new String[100];
	String[] orderno=new String[100];
	String[] courier=new String[100];
	String[] docket=new String[100];
	int k=0;
	String[] received=new String[100];

	sql9="select Reqno from t_unitorder where Tech='"+tech+"' and Status in ('Dispatched','Partially Dispatched') order by ReqDate desc limit 5 ";
	//out.print(sql9);
	rs9=stmt1.executeQuery(sql9);
	while(rs9.next())
	{
		String reqno=rs9.getString("Reqno");
		//out.print("reqno="+reqno);

		int dispcntr=0, reccntyes=0;
		
		orderno[k]=rs9.getString("Reqno");
		
		sql10="select count(*) as cnt from t_unitmasterhistory where OrderNo='"+reqno+"' and RecConfirmByRep='-'";	
		//out.print(sql10);
		rs10=stmt2.executeQuery(sql10);
		while(rs10.next())
		{
			dispcntr=rs10.getInt("cnt");
		}
		dispqty[k]=dispcntr;

		
		sql20="select * from t_unitmasterhistory where OrderNo='"+reqno+"' group by UnitID";
		
		rs20=stmt2.executeQuery(sql20);
		if(rs20.next())
		{
			dispdate[k]=rs20.getString("DispDate");
			courier[k]=rs20.getString("DisName");
			//docket[k]=rs20.getString("DisName");
		}
		
		sql16="select count(*) as cntyesno from t_unitmasterhistory where OrderNo='"+reqno+"' and RecConfirmByRep!='-' ";
		//out.print(sql16);
		rs16=stmt4.executeQuery(sql16);
		if(rs16.next())
		{
			reccntyes=rs16.getInt("cntyesno");

			if(reccntyes==dispqty[k])
			{
				received[k]="R";
			}
			else if(reccntyes < dispqty[k] && reccntyes > 0)
			{
				received[k]="PR";
			}
			else
			{
				received[k]="NR";
			}
			
		}

		k++;
	}

	
%>
	
	<table border="10" width="350px">
	  <tr>
        	<td align="center" colspan="3"> <B> Last 5 dispatches to <%=tech%> </B> </td>
	  </tr>
	  <tr><a href="#" onClick="window.open ('details1.jsp?type=Dispatched&tech=<%=tech%>&parameter=none', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')">All Dispatches</a></tr>
	  <tr>	
		<td align="left" colspan="3"> <font color="red"> R=Received; NR=Not Received; PR=Partially Received</font> </td>	
	  </tr>	
	  <tr>
		<td align="center"> <B> Date </B> </td>
		<td align="center"> <B> Unit Count </B> </td>
		<td align="center"> <B> Docket 	No. </B> </td>
	  </tr>
	  <tr>
		<td align="center">
<%
	try { %>
		 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate[0]))%> 
		</td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=orderno[0]%>&type=Dispatched&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')">  <%=dispqty[0]%> </a>	

		  </a> &nbsp;&nbsp;&nbsp; <font color="red"> <%=received[0]%> </font> 
</td>

		<td align="center"> <%=courier[0]%> </td>
<%	}
	catch(Exception e)	
	{
		e.printStackTrace();
		out.print("No Record Found");  
	} 
%>
	
	  </tr>	
	  
	  <tr>
		<td align="center">
<%
	try
	{ %>
		 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate[1]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=orderno[1]%>&type=Dispatched&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=dispqty[1]%> </a> &nbsp;&nbsp;&nbsp; <font color="red"> <%=received[1]%> </font> 
 </td>	
		<td align="center"> <%=courier[1]%> </td>
<%	} catch(Exception e)
	  {
		 out.print("No Record Found");  
		 e.printStackTrace();
	  }	
%>
	  </tr>		
	  <tr>
		<td align="center">
<%
	try
	{ %>
		 <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate[2]))%> </td>
		<td align="center">  <a href="#" onClick="window.open ('details.jsp?dcno=<%=orderno[2]%>&type=Dispatched&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=dispqty[2]%> </a> &nbsp;&nbsp;&nbsp; <font color="red"> <%=received[2]%> </font> 
 </td>	
		<td align="center"> <%=courier[2]%> </td>
<%	} catch(Exception e)
	  {
		 out.print("No Record Found"); 
		 e.printStackTrace();
	  }	
%>
	  </tr>		
	  <tr>
		<td align="center"> 
<%
	try
	{ %>
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate[3]))%> </td>
		<td align="center">  <a href="#" onClick="window.open ('details.jsp?dcno=<%=orderno[3]%>&type=Dispatched&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=dispqty[3]%> </a> &nbsp;&nbsp;&nbsp; <font color="red"> <%=received[3]%> </font> 
</td>	
		<td align="center"> <%=courier[3]%> </td>
<%	} catch(Exception e)
	  {
		 out.print("No Record Found");   
		 e.printStackTrace();
	  }	
%>
	  </tr>	
	  <tr>
		<td align="center"> 
<%
	try
	{ %>
<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate[4]))%> </td>
		<td align="center">  <a href="#" onClick="window.open ('details.jsp?dcno=<%=orderno[4]%>&type=Dispatched&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=dispqty[4]%> </a>
&nbsp;&nbsp;&nbsp; <font color="red"> <%=received[4]%> </font> 
</td>	
		<td align="center"> <%=courier[4]%> </td>
<%	} catch(Exception e)
	  {
		 out.print("No Record Found");   
		 e.printStackTrace();
	  }	
%>

	  </tr>	
	</table>
<%
	out.print("$");

	Integer[] recqty=new Integer[100];
	String[] recdate=new String[100];
	String[] recdcno=new String[100];
	int l=0;

	sql11="select distinct(DC_NO), RDate from t_unitreceived where Techname='"+tech+"' and Status <> 'Deleted' order by Rdate desc limit 5 ";
	//out.print(sql11);
	rs11=stmt1.executeQuery(sql11);
	while(rs11.next())
	{
		 String dcnorec=rs11.getString("DC_NO");
		 int reccntr=0;

		recdcno[l]=rs11.getString("DC_NO");
		recdate[l]=rs11.getString("Rdate");	
		
		 sql12="select count(*) as cnt from t_unitreceived where DC_NO='"+dcnorec+"' and Techname='"+tech+"' and Status <> 'Deleted'";
		rs12=stmt3.executeQuery(sql12);
		while(rs12.next())
		{
			reccntr=rs12.getInt("cnt");
		} 
		recqty[l]=reccntr;
		l++;
	} 
	 
	
%>
<a href="#" onClick="window.open ('transitunit1.jsp?type=New&holdername=<%=tech%>', 'win1', 'width=700, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"><font Color="RED" size="3">Click To Find IN-Transit units </font></a>

	<table border="10" width="350px">
	  <tr>
        	<td align="center" colspan="2"> <B> Last 5 Receipts from <%=tech%> </B> </td>
	  </tr>
	  <tr>
		<td align="center"> <B> Date </B> </td>
		<td align="center"> <B> Unit Count </B> </td>
	  </tr>	
          <tr>
		<td align="center"> 
<%
	try
	{ %>
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate[0]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=recdcno[0]%>&type=Received&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')">  <%=recqty[0]%> </a> </td>	
<%	} catch(Exception e)
	  {
		 out.print("No Record Found"); 
		 e.printStackTrace();
	  }	
%>	
	  </tr>	
	  <tr>
		<td align="center"> 
<%
	try
	{ %>
<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate[1]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=recdcno[1]%>&type=Received&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=recqty[1]%> </a> </td>	
<%	} catch(Exception e)
	  {
		 out.print("No Record Found"); 
		 e.printStackTrace();
	  }	
%>
	  </tr>		
	  <tr>
		<td align="center"> 
<%
	try
	{ %>
<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate[2]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=recdcno[2]%>&type=Received&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=recqty[2]%> </a> </td>	
<%	} catch(Exception e)
	  {
	e.printStackTrace();	 
	out.print("No Record Found"); 
	  }	
%>
	  </tr>		
	  <tr>
		<td align="center"> 
<%
	try 
	{ %>
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate[3]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=recdcno[3]%>&type=Received&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=recqty[3]%> </a> </td>	
<%	} catch(Exception e)
	  {
	e.printStackTrace();	 
	out.print("No Record Found"); 
	  }	
%>
	  </tr>	
	  <tr>
		<td align="center"> 
<%
	try
 	{ %>
		<%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recdate[4]))%> </td>
		<td align="center"> <a href="#" onClick="window.open ('details.jsp?dcno=<%=recdcno[4]%>&type=Received&tech=<%=tech%>', 'win1', 'width=450, height=550, location=0, menubar=0, scrollbars=1, status=0,toolbar=0,resizable=0')"> <%=recqty[4]%> </a> </td>	
<%	} catch(Exception e)
	  {
	e.printStackTrace();	 
	out.print("No Record Found"); 
	  }	
%>
	  </tr>	

         </table>
	
<%
	
	out.print("$");	
%>
	
	<table border="1">
		<%=lastcomment %>
	</table>
<%	

} catch(Exception e) {
out.println("No Record Found");
e.printStackTrace();
}

finally
{
con1.close();
con2.close();
}
%>