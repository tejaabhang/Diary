<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""%>
    <%@ page import="java.sql.PreparedStatement"  %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
	<%@ include file="header.jsp"%>
	
<%@page import="java.sql.ResultSet"%>
<%!
Connection conn;
Statement st1,st2,st3,st4,st5,st6,st7,st8,stwar3,stamc1;
String query1,query2,query3,query4,query5;
%>

<%!
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
<html>
<head><style type=text/css>table.mytable{font:13px arial,sans-serif;border-collapse: collapse; border: 1px solid #839E99;background: #f8fcff;}</style>
<title>ASC Service Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<link rel="stylesheet" href="css/css.css" type="text/css" charset="utf-8" />
	<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>


<script type="text/javascript">

function confirmSubmit()
{
	
	var operator= document.getElementById("operator").options[document.getElementById("operator").selectedIndex].value;
	//var status= document.getElementById("status").options[document.getElementById("status").selectedIndex].value;
	
	if(operator=="select") 
		{			
			alert("Please select  Transporter!");
		return false;
		}
	
	
	
return true;	
}
</script>
<script type="text/javascript">
function goToFullExcel(operator,calender,calender1) 
{
	alert(">>>>"+operator+">>>>>>>>"+status+">>>>>>");
	
		window.location.href="SimmasterReportFullExcelReport.jsp?date1="+date1+"&date2="+date2+"Operator="+operator;	
}

function gotoExcel(elemId,frmFldId)  
{  
	   alert(">>>>");   
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.SimmasterReport.action ="excel.jsp";
          document.forms["SimmasterReport"].submit();
}
</script>
<script type="text/javascript">
function fun()
{

	//alert("Hi");
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("calender").value;
	//alert(objFromDate);
	var fdate=objFromDate.split("-");
	if(fdate[1]=="Jan")
	{
		chkf="01";
	}
	if(fdate[1]=="Feb")
	{
		chkf="02";
	}
	if(fdate[1]=="Mar")
	{
		chkf="03";
	}
	if(fdate[1]=="Apr")
	{
		chkf="04";
	}
	if(fdate[1]=="May")
	{
		chkf="05";
	}
	if(fdate[1]=="Jun")
	{
		chkf="06";
	}
	if(fdate[1]=="Jul")
	{
		chkf="07";
	}
	if(fdate[1]=="Aug")
	{
		chkf="08";
	}
	if(fdate[1]=="Sep")
	{
		chkf="09";
	}
	if(fdate[1]=="Oct")
	{
		chkf="10";
	}
	if(fdate[1]=="Nov")
	{
		chkf="11";
	}
	if(fdate[1]=="Dec")
	{
		chkf="12";
	}
	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
    var objToDate = document.getElementById("calender1").value;
    var tdate=objToDate.split("-");
    if(tdate[1]=="Jan")
	{
    	chkt="01";
	}
	if(tdate[1]=="Feb")
	{
		chkt="02";
	}
	if(tdate[1]=="Mar")
	{
		chkt="03";
	}
	if(tdate[1]=="Apr")
	{
		chkt="04";
	}
	if(tdate[1]=="May")
	{
		chkt="05";
	}
	if(tdate[1]=="Jun")
	{
		chkt="06";
	}
	if(tdate[1]=="Jul")
	{
		chkt="07";
	}
	if(tdate[1]=="Aug")
	{
		chkt="08";
	}
	if(tdate[1]=="Sep")
	{
		chkt="09";
	}
	if(tdate[1]=="Oct")
	{
		chkt="10";
	}
	if(tdate[1]=="Nov")
	{
		chkt="11";
	}
	if(tdate[1]=="Dec")
	{
		chkt="12";
	}
    var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
   // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
     
    var date1 = new Date(objFromDate1);
    var date2 = new Date(objToDate1);
    
    //alert("from > "+date1+" Todate > "+date2);
    
    var date3 = new Date();
    var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
    var currentDate = new Date(date4);
     
        if(date1 > date2)
        {
            alert("From Date Should be Less Than To Date");
            return false; 
        }
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }


	return true;
}
</script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {

	    	"pagingType": "full_numbers",
	        dom: 'Blfrtip',

	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'ASC Service Details '+$("#oname").val(),
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'ASC Service Details '+$("#oname").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'ASC Service Details '+$("#oname").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'ASC Service Details '+$("#oname").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'ASC Service Details '+$("#oname").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
	        
	        
	     
	    } );
	} );

</script>



</head>


<body>
<div id="wrapper">
<div id="logo">
<h1><img src="images/Transworld.gif"></h1>
<p>We care about your Vehicles</p>
</div>
<P></p>
<%@ include file="header1.jsp"%></div>
<div id="gbox1"><!-- <div id="gbox-top1"> </div> -->
<div id="gbox-bg1">
<div id="gbox-grd1"><!--- code start here ------> 

<%

java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("dd-MM-yyyy");
Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

////System.out.println("----------------------------------------------------------------------???<_>"+inputtype);


java.util.Date dte11 = new java.util.Date();
Format formatter12 = new SimpleDateFormat("yyyy-MM-dd");
String today11=formatter12.format(dte11);

System.out.println("Todays is:"+today11);


java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("dd-MM-yyyy");
String today=formatter.format(dte);

java.util.Date dte1 = new java.util.Date();
Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
String today1=formatter.format(dte);


String operator = request.getParameter("operator");
String datenew1="";
String datenew2="";
String dataDate11="";


//datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
/* String dt = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew1));
dt=dt;

String dt1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(datenew2));

dt1=dt1; */

String fromdate=request.getParameter("calender");

String todate=request.getParameter("calender1");

if(request.getParameter("calender")!=null)
{
  datenew1=request.getParameter("calender");
  datenew2=request.getParameter("calender1");
}
else
	datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());


try{
	System.out.println("Creating Connection");
	Class.forName(MM_dbConn_DRIVER);
    conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    st1=conn.createStatement();
    st2=conn.createStatement();
    st3=conn.createStatement();
    st4=conn.createStatement();
    st5=conn.createStatement();
    st6=conn.createStatement();
    st7=conn.createStatement();
    st8=conn.createStatement();
    stwar3=conn.createStatement();
    stamc1=conn.createStatement();
    
    
	}catch(Exception E){
	System.out.println(""+E);
	}	
	ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=10;  // Number of records show on per page
    int iTotalSearchRecords=10;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;

    if(iPageNo==0)
    {
        iPageNo=0;
    }
    else{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    
    System.out.println("Connection Created");
    
%>

<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
	<tr>
		<td>
			<table border="0" width="100%">
				<tr><td align="center"><font color="black" size="3"><b>ASC Service Details</font></td></tr>
			</table>
		</td>
	</tr>
</table>
<br />
<form name="unit" id ="unit" method="post" onsubmit="return confirmSubmit();" >
      <table border="0" width="750px" bgcolor="#E6E6E6" align="center">          	
			<tr  bgcolor="#BDBDBD"> 
			 	
			  
			
					<td align="center"><font size="2"><b>Transporter</b></font>
			 	</td>
			     <td align ="center">
			     	<div>
							<select class="element select medium" id="operator" name="operator" style="width: 260px; height: 28px;" > 								
								
								
								<%
								
								
								
								
									if(operator==null)
									{
									%>
									<option value="select">select</option> 
									<option value="All" >All</option>
									<%
					            	query1 = "select distinct(ownername) as ownername  from db_gps.t_vehicledetails where status='-'";
									System.out.println("The query is :"+query1);
					             	ResultSet rs1 = st1.executeQuery(query1);
					             	while(rs1.next())
					              	{
									%>
									<option value="<%=rs1.getString("ownername") %>" ><%=rs1.getString("ownername")%></option>
									<%} 
									}else{
										%> <option value="select" >select</option> 
										 <option value="All" >All</option><%
												query1 = "select distinct(ownername) as ownername  from db_gps.t_vehicledetails where status='-'";
										System.out.println("The query is :"+query1);
						             	ResultSet rs1 = st1.executeQuery(query1);
						             	while(rs1.next())
						              	{
										
											if(rs1.getString("ownername").equals(operator))
											{
												%><option value="<%=rs1.getString("ownername") %>" selected><%=rs1.getString("ownername")%></option><%
											}else{
												%><option value="<%=rs1.getString("ownername") %>" ><%=rs1.getString("ownername")%></option><%
											}
											
									    } 
									}
									%>
							</select>
					</div> 
				</td>
	        <td align ="center">	        
	        	<input type="submit" name="sub" id="sub" value="submit" onclick="return fun()" style="background: #E6E6E6;"/>
	        </td>
	        
		</tr>
	</table>
</form>
<br />		
</div>

<div id="gbox-bot1"></div>
</div>
</div>	
<%
	
	System.out.println("The Date 1 is  :"+fromdate);
	System.out.println("The Date 2 is :"+todate);
	System.out.println("operator is :"+operator);
	
	

	
	System.out.println("Selected Value is:"+operator);
	
	DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
	DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
	String dataDate1=df1234.format(df123.parse(datenew1));
	String dataDate2=df1234.format(df123.parse(datenew2));
	
	String dt = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(datenew1));
			dt=dt;
			
			String dt1 = new SimpleDateFormat("yyyy-MM-dd")
			.format(new SimpleDateFormat("dd-MMM-yyyy")
					.parse(datenew2));

			dt1=dt1;
			
			System.out.println("Date1 After Format : "+dt);
			System.out.println("Date2 After Format : "+dt1);
%>

<% 


	 
	 String Action1 =""+operator+" Sim Billable Report From "+fromdate+" To "+todate ;

System.out.println("DAte is :"+fromdate);
System.out.println("Todate is :"+todate);

String btnvalue=request.getParameter("sub");
System.out.println("----------------->"+btnvalue);

try
{

if(btnvalue!=null || !btnvalue.equals("null"))
{
 %>
 <div style="width: 100%">
<table id="example" border="1" width="100%" class="sortable">
					<tr>
					<td>SrNo</td>
					<td>VehNo</td>
					<td>UnitId</td>
					<td>MobNo</td>
					<td>SimNo</td>
					<td>Provider</td>
					<td>Transporter</td>
					<td>Group</td>
					
				 	<!-- <td>TheDate</td>
					<td>TheTime</td> -->
					<td>LastUpdatedDateTime</td>
					<td>Location</td> 
					<td>InstalledDate</td>
					<td>Warranty Date</td>
					<td>Warranty Status</td>
					
					
					
					
					
					
					
						</tr>
					
					
					<input type="hidden" id="oname" name="oname" value="<%=operator%>">
					
					<%
				
			
				    
					String query="";
				  if(!operator.equals("All"))
				  {
					//query="select VehCode,Transporter,WarrantyTill,VehNo,max(WarrantyTill) from db_gps.t_amchistory where Transporter='"+operator+"' and VehCode in (select distinct(vehiclecode) from db_gps.t_vehicledetails where ownername='"+operator+"' and status='-') group by VehNo";
					query="select a.VehicleCode,b.VehCode,a.Unitid,max(b.WarrantyTill),b.VehNo,b.WarrantyTill,b.Transporter,a.OwnerName from db_gps.t_vehicledetails a left outer join db_gps.t_amchistory b on a.vehiclecode=b.VehCode where  a.status='-' and a.ownername='"+operator+"' group by a.Vehiclecode order by a.OwnerName";
				  }
				  else
				  {
					  //query="select VehCode,Transporter,WarrantyTill,VehNo,max(WarrantyTill) from db_gps.t_amchistory where Transporter like '%%' and VehCode in (select distinct(vehiclecode) from db_gps.t_vehicledetails where ownername like '%%' and status='-') group by VehNo order by Transporter";
					  
					  query="select a.VehicleCode,b.VehCode,a.Unitid,max(b.WarrantyTill),b.VehNo,b.WarrantyTill,b.Transporter,a.OwnerName from db_gps.t_vehicledetails a left outer join db_gps.t_amchistory b on a.vehiclecode=b.VehCode where  a.status='-' and a.ownername like '%%' group by a.Vehiclecode order by a.OwnerName";
					  
					  %>
						<script>
						document.getElementById("operator").value = '<% out.print(operator); %>';
						</script>
						<% 
				  
				  }
					
					System.out.println("Query is when selectced:"+query);
					
					String vehno="";
					System.out.println("Query is :"+query);
					int i=1;
					ResultSet rs3 = st3.executeQuery(query);
					while(rs3.next())
					{
						String sqlamc1="",warranty="",sql4="";
						String thedate="",thetime="",location="";
						vehno=rs3.getString("VehicleCode");
						
						
						String insdt="";
						String Unit="",Vehcode="",GroupName="",Owner="";
						double latitude=0.0,longitude=0.0;
						
						String	sql5="select * from db_gps.t_vehicledetails where VehicleCode='"+vehno+"'";
						
						
						//System.out.println("Installeddate::::::::::"+sql5);
						
						ResultSet rs6=st5.executeQuery(sql5);
						if(rs6.next())
						{
							insdt=rs6.getString("InstalledDate");
							Unit=rs6.getString("unitid");
							Vehcode=rs6.getString("vehiclecode");
							Owner=rs6.getString("OwnerName");
						}
						
						
						String GPName="select GPName from db_gps.t_group where VehCode='"+Vehcode+"'";
						ResultSet rsGPName=st8.executeQuery(GPName);
						
						//System.out.println("GPName ::::::::::----> "+GPName);
						
						if(rsGPName.next())
						{
							GroupName=rsGPName.getString("GPName");
						}
						else
						{
							GroupName=Owner;
						}
								
						String query2="select * from db_gps.t_onlinedata where VehicleCode='"+vehno+"'";
						ResultSet rs4=st4.executeQuery(query2);
						
						//System.out.println("Online  ::::::::::----> "+query2);
						
						if(rs4.next())
						{
							thedate=rs4.getString("TheDate");
							thetime=rs4.getString("TheTime");
							location=rs4.getString("Location");
							latitude=rs4.getDouble("LatitudePosition");
							longitude=rs4.getDouble("LongitudePosition");
						}
						
						String SimNo="",SimCompany="",MobNo="",UnitId="";
					
						
						String unitdata="select * from db_gps.t_unitmaster where UnitID='"+Unit+"'";
						ResultSet rsunitdata=st6.executeQuery(unitdata);
						
						//System.out.println("Unitdata  ::::::::::----> "+unitdata);
						
						if(rsunitdata.next())
						{
							
							MobNo=rsunitdata.getString("MobNo");
							
							String unitdata1="select * from db_gps.t_simmaster where Mobno='"+MobNo+"'";
							ResultSet rsunitdata1=st7.executeQuery(unitdata1);
							
							//System.out.println("Unitdatd1 11111   ::::::::::----> "+unitdata1);
							
							if(rsunitdata1.next())
							{SimNo=rsunitdata1.getString("Simno");
							SimCompany=rsunitdata1.getString("Service_provider");
								
							}else
							{
							SimNo="-";
							SimCompany="-";
								
							}
						}
						else
						{
							SimNo="-";
							SimCompany="-";
							MobNo="-";
						}
						
						try
						{
						if(!(null==rs3.getDate("max(b.WarrantyTill)")))
						{
						try{	
							
						 sqlamc1="select TO_DAYS('"+rs3.getDate("WarrantyTill")+"')-TO_DAYS('"+today11+"') as days";
						
						//System.out.println(sqlamc1);
							ResultSet rsamcc1=stamc1.executeQuery(sqlamc1);
							if(rsamcc1.next())
							{
								if(rsamcc1.getInt("days") > 0)
								{
									warranty="Yes";
								}
								else
								{
									warranty="No";
								}
							}
							}
							catch(Exception X)
							{
								warranty="-";
							}
						}
						else
						{
							String sql7="select TO_DAYS('"+today11+"')-TO_DAYS('"+insdt+"') as days";
							ResultSet rst222=stwar3.executeQuery(sql7);
							if(rst222.next())
							{
								if(rst222.getInt("days") > 365)
									{
										warranty="NO";
									}
								else
								{
									warranty="YES";
								}
							}
						}
						
						}catch(Exception e)
						{
							warranty="-";
						}
						
						
						
						
						String wdate=rs3.getString("max(b.WarrantyTill)");
						
						String dt123="",dt124="",dt12345="";
						try
						
						{
							dt123= new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(wdate));
						}
						catch(Exception e)
						{
							dt123="-";
						}
						
						try
						{
						 dt124= new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(thedate));
						
						}
						catch(Exception e)
						{
							dt124="-";
						}
						
						try
						{
						 dt12345= new SimpleDateFormat("dd-MMM-yyyy")
								.format(new SimpleDateFormat("yyyy-MM-dd")
										.parse(insdt));
						}
						catch(Exception e)
						{
							dt12345="-";
						}
						
						String thefielddate=dt124+" "+thetime;
						
						
						%>
						
							<tr>
							
							<td align="right"><%=i%></td>
						<td align="left"><%=rs3.getString("VehNo")%></td>
						<td align="left"><%=Unit%></td>
						<td align="left"><%=MobNo%></td>
						<td align="left"><%=SimNo%></td>
						<td align="left"><%=SimCompany%></td>
						<td align="left"><%=rs3.getString("Transporter")%></td>
						<td align="left"><%=GroupName%></td>
						
						<td align="left"><%=thefielddate %></td>
						
						
						
						
<td><a href="# " onclick="window.open('shownewmap.jsp?lat=<%=latitude%>&long=<%=longitude%>' ,'m','width=500,height=500'); popWin.focus(); return false"><b> <font color ="blue" ><%=location %> </font> </a></td>						
						
						<td align="left"><%=dt12345 %></td>
						<td align="right"><%=dt123%></td>
						<td align="left"><%=warranty %></td>
						</tr>
						
						
						<%i++;
					}
					%>
					
					
						
					
						</table>
	
</div>


<%}
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.println("Hello");
}
%>


<div id="copyright">Copyright &copy; 2008 by Transworld Compressor
Technologies Ltd. All Rights Reserved.</div>
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
%>
