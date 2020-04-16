  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>
<%! 
Connection con1;
Statement stmt1,st,st3,stmt2, stmt3, stmt4,stmt9;
ResultSet rs1=null,rs2=null,rs3=null, rs4=null,rs9=null;
String sql1="",sql,sql2,sql3, sql4,sql5;
String srchtext="";
String userrole1="",UnitId="";
String  listUnitId="";

%>
<%
 userrole1=session.getAttribute("userrole").toString();

%>
<html>
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
	/* document.getElementById("newsrcbox").value=cmnt;
	document.multsrch.srchbx.value=''; */
}


	
function CheckUnCheck(id)
{
	if(id==0)
	{
		document.multsrch.cust.checked=true;
		document.multsrch.group.checked=true;
		document.multsrch.veh.checked=true;
		document.multsrch.unitid.checked=true;
		document.multsrch.simno.checked=true;
		document.multsrch.mobno.checked=true;
		document.multsrch.lastdate.checked=true;
		document.multsrch.lastloc.checked=true;
		document.multsrch.instdate.checked=true;
		document.multsrch.instplace.checked=true;
		document.multsrch.instby.checked=true;
		document.multsrch.entby.checked=true;
		document.multsrch.repdate.checked=true;
		document.multsrch.replby.checked=true;
		document.multsrch.oldunit.checked=true;
		document.multsrch.dispdate.checked=true;
		document.multsrch.dispto.checked=true;
		document.multsrch.dispby.checked=true;
		document.multsrch.inwarranty.checked=true;
		document.multsrch.simcomp.checked=true;
		document.multsrch.periferal.checked=true;
		document.multsrch.unittype.checked=true;
		document.multsrch.instn.checked=true;
		document.multsrch.psno.checked=true;
		document.multsrch.pcbno.checked=true;
		document.multsrch.boxno.checked=true;
		document.multsrch.batteryno.checked=true;
	}
	if(id==1)
	{
		document.multsrch.cust.checked=false;
		document.multsrch.group.checked=false;
		document.multsrch.veh.checked=false;
		document.multsrch.unitid.checked=false;
		document.multsrch.simno.checked=false;
		document.multsrch.mobno.checked=false;
		document.multsrch.lastdate.checked=false;
		document.multsrch.lastloc.checked=false;
		document.multsrch.instdate.checked=false;
		document.multsrch.instplace.checked=false;
		document.multsrch.instby.checked=false;
		document.multsrch.entby.checked=false;
		document.multsrch.repdate.checked=false;
		document.multsrch.replby.checked=false;
		document.multsrch.oldunit.checked=false;
		document.multsrch.dispdate.checked=false;
		document.multsrch.dispto.checked=false;
		document.multsrch.dispby.checked=false;
		document.multsrch.inwarranty.checked=false;
		document.multsrch.simcomp.checked=false;
		document.multsrch.periferal.checked=false;
		document.multsrch.unittype.checked=false;
		document.multsrch.instn.checked=false;
		document.multsrch.psno.checked=false;
		document.multsrch.pcbno.checked=false;
		document.multsrch.boxno.checked=false;
		document.multsrch.batteryno.checked=false;
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
function toggleDetails1(id, show)
{
	var popupx = document.getElementById("popupx"+id);
	if (show) {
		popupx.style.visibility = "visible";
		popupx.setfocus();
		
	} else {
		popupx.style.visibility = "hidden";
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

<body onload="srcbo()">

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
            <div id="gbox-top1"> </div>
            <div id="gbox-bg1">
              <div id="gbox-grd1">


 
 <form name="multsrch" method="post" action=""  onSubmit="return validate();">
<%		
try
{
   Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	stmt1=con1.createStatement();	
	stmt2=con1.createStatement();	
	st=con1.createStatement();
	st3=con1.createStatement();
	stmt4=con1.createStatement();
	stmt3=con1.createStatement();
	stmt9=con1.createStatement();
	
	String Type=request.getParameter("Type");
	//Type=Type.replaceAll(" ", "+");
	String Deviceoverview=request.getParameter("Deviceoverview");
	 System.out.println("Type is:-"+Type);
	 System.out.println("Deviceoverview is:-"+Deviceoverview);
	 String sql2="select UnitId from db_gps.t_unitmaster where "+Deviceoverview+"='"+Type+"' ";
	 System.out.println("SQL2:-"+sql2);
	  rs9=stmt9.executeQuery(sql2);
	  ArrayList<String> al=new ArrayList<String>();
	 while(rs9.next()){
		 
		 UnitId=rs9.getString("UnitId");
		 al.add(UnitId);
	 }
	
	/* for(int i=0;i<al.size();i++){
         listUnitId=al.get(i);
		System.out.println("listUnitId is:-"+listUnitId);
	} */
	
	String rad=request.getParameter("VehUnit");
	String getunit="";
	if(rad==null)
	{
	}
	else
	{
		//session.removeAttribute("srchtext");
		getunit=request.getParameter("srchbx");
	 	System.out.println("getunit is:-"+getunit);
	 	int len=getunit.length();
	 	System.out.println("length:-"+len);
	 	int chk=getunit.lastIndexOf("getunit");
	 	System.out.println("chk length:-"+chk);
	 	
	 	//String cha=getunit.substring(getunit.length() - 1);
	 	if(getunit.endsWith(",")||getunit.endsWith(" "))
	 	{
	 		
	 		getunit = getunit.substring(0, getunit.length() - 2);
	 	}     	 	 
	 	System.out.println("final getunit is:-:-"+getunit);
	 	session.setAttribute("srchtext",getunit);
		try
		{
			srchtext=session.getValue("srchtext").toString();
			//session.removeAttribute("srchtext");
		} catch(Exception e)
	  	{
			srchtext="";
	  	}	
	}
%>
 <font ><B> Note:</B> Multiple entries has to be separated by comma only. </font>  
<table border="0" width="750px">
<tr> 
<td align="left">
	<table border="0" width="350px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="center" colspan="2"> <font  size="2" color="#2A0A12"> <B> Multiple Search</B> </font> </td>
		</tr>	
		<tr bgcolor="#BDBDBD">
			<td> <font > Search </font> </td>
			<td>
				<input type="radio" name="VehUnit" value="Vehicle" checked/><B>Vehicle</B>
				<input type="radio" name="VehUnit" value="Unit" /><B>Unit Id</B>
			</td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td> <font > Enter</font> </td>
			<%for(int i=0;i<al.size();i++){
				listUnitId=listUnitId+al.get(i)+",";
		System.out.println("listUnitId is:-"+listUnitId);}%>
			<td> <textarea name="srchbx" id="srcbo" class="formElement"><%=getunit+""+listUnitId.trim()%> </textarea> </td>
			<!-- <input type="hidden" value="newsrcbox" id="newsrcbox"> -->
		</tr>
		
		<%al.clear(); al.removeAll(al);
		listUnitId="";
		System.out.println("al clear is:-"+listUnitId);%>
		<tr>
			<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
		</tr>
	</table>
 </td>
 <td> 
	<table border="0" width="350px" bgcolor="#E6E6E6" align="center">
		<tr>
			<td align="left"> <a href="#" onClick="CheckUnCheck(0);"> Check All</a> &nbsp;&nbsp;&nbsp;
				<a href="#" onClick="CheckUnCheck(1);"> UnCheck All</a>
			</td>
			<td> <font  size="2" color="#2A0A12"> <B> Select Columns to display in result</B> </font> </td>
		</tr>
	</table>		
	<table border="0" width="350px" bgcolor="#E6E6E6" align="center">
		
		<tr bgcolor="#BDBDBD">
			<td> <div align="left"> <input type="checkbox" name="cust" value="cust" checked /> Customer </div> </td>
			<td> <div align="left"> <input type="checkbox" name="group" value="group" checked /> Group </div> </td>
			<td> <div align="left"> <input type="checkbox" name="veh" value="veh" checked /> Vehicle</div> </td>
			<td> <div align="left"> <input type="checkbox" name="unitid" value="unitid" checked /> Unit Id </div></td>		
		</tr>
		<tr bgcolor="#BDBDBD">
			<td> <div align="left"> <input type="checkbox" name="simno" value="simno" checked /> Sim No </div></td>
			<td>  <div align="left"><input type="checkbox" name="mobno" value="mobno" checked /> Mobile No </div></td>
			<td>  <div align="left"><input type="checkbox" name="lastdate" value="lastdate" checked /> Last Date </div></td>
			<td>  <div align="left"><input type="checkbox" name="lastloc" value="lastloc" checked /> Last Location </div></td>			
		</tr>
		<tr bgcolor="#BDBDBD">
			<td>  <div align="left"><input type="checkbox" name="instdate" value="instdate" checked /> Inst Date  </div></td>
			<td>  <div align="left"><input type="checkbox" name="instplace" value="instplace" checked /> Inst. Place </div></td>
			<td> <div align="left"> <input type="checkbox" name="instby" value="instby" checked /> Inst. By </div></td>
			<td>  <div align="left"><input type="checkbox" name="entby" value="entby" checked /> Entered By </div> </td>			
		</tr>
		<tr bgcolor="#BDBDBD">
			<td> <div align="left"><input type="checkbox" name="repdate" value="repdate" checked /> Replaced Date</div></td>
			<td> <div align="left"><input type="checkbox" name="replby" value="replby" checked /> Replaced By </div></td>
			<td> <div align="left"><input type="checkbox" name="oldunit" value="oldunit" checked /> Old Unit </div></td>
			<td> <div align="left"> <input type="checkbox" name="dispdate" value="dispdate" checked /> Disp. Date  </div></td>			
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan=""> <div align="left"><input type="checkbox" name="dispto" value="dispto" checked /> Disp. To </div></td>
			<td colspan="">  <div align="left"><input type="checkbox" name="dispby" value="dispby" checked /> Disp. By </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="inwarranty" value="inwarranty" checked /> In Warranty </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="simcomp" value="simcomp" checked /> Sim Company </div> </td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan=""> <div align="left"><input type="checkbox" name="psno" value="psno" checked /> PS No </div></td>
			<td colspan="">  <div align="left"><input type="checkbox" name="pcbno" value="pcbno" checked />PCB No </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="boxno" value="boxno" checked /> Box No </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="batteryno" value="batteryno" checked />Battery No </div> </td>
		</tr>
		<tr bgcolor="#BDBDBD">
			<td colspan="">  <div align="left"><input type="checkbox" name="periferal" value="periferal" checked />Peripherals </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="unittype" value="unittype" checked />Unit Type </div> </td>
			<td colspan="">  <div align="left"><input type="checkbox" name="instn" value="instn" checked />Instruction </div> </td>
		</tr>
	</table>
</td>
</tr>
</table>
<%

if(rad==null)
{
}
else
{
	String vehiclecode="";
	String x="", transporter="", instdate="", instloc="", instby="", dispdate="", dispby="", disadd="",instruction="",getinstruction="";		

	java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatter1.format(d);

/* **********************If choices (columns) are selected, then only selected cols will be shown ********************************************************************************** */
String enteredby="", replacedby="", oldunitid="";
	
	String custCol="", groupCol="",unittype="",periferals="", vehCol="", unitidCol="", simnoCol="", mobnoCol="", lastdateCol="", lastlocCol="", instdateCol="", instplaceCol="", instalbyCol="", entbyCol="", repdateCol="", replbyCol="", oldunitCol="", dispdateCol="", disptoCol="", dispbyCol="", inwarrantyCol="", simcom="";
	String psno="",pcbno="",boxno="",batteryno="";
	custCol=request.getParameter("cust");
	groupCol=request.getParameter("group");		
	vehCol=request.getParameter("veh");
	simnoCol=request.getParameter("simno");	
	mobnoCol=request.getParameter("mobno");	
	lastdateCol=request.getParameter("lastdate");	
	lastlocCol=request.getParameter("lastloc");	
	instdateCol=request.getParameter("instdate");	
	instplaceCol=request.getParameter("instplace");	
	instalbyCol=request.getParameter("instby");	
	entbyCol=request.getParameter("entby");	
	repdateCol=request.getParameter("repdate");	
	replbyCol=request.getParameter("replby");	
	oldunitCol=request.getParameter("oldunit");	
	dispdateCol=request.getParameter("dispdate");	
	disptoCol=request.getParameter("dispto");	
	inwarrantyCol=request.getParameter("inwarranty"); 
	unitidCol=request.getParameter("unitid"); 
	dispbyCol=request.getParameter("dispby"); 
	simcom=request.getParameter("simcomp"); 
	periferals=request.getParameter("periferal");
	instruction=request.getParameter("instn");
	unittype=request.getParameter("unittype"); 
	psno=request.getParameter("psno"); 
	pcbno=request.getParameter("pcbno"); 
	boxno=request.getParameter("boxno"); 
	batteryno=request.getParameter("batteryno"); 
	
%>
	<table border="0" width="750px">
		
		<tr>
			<td><font color="orange"><b>UnitID contains invalide CodeVersion</b></font></td>
			<td align="right"> <a href="excelsearchresult.jsp?VehUnit=<%=rad%>&srchbx=<%=getunit%>&cust=<%=custCol%>&veh=<%=vehCol%>&simno=<%=simnoCol%>&mobno=<%=mobnoCol%>&instn=<%=instruction%>    &simcomp=<%=simcom%>&unitid=<%=unitidCol%>&lastdate=<%=lastdateCol%>&lastloc=<%=lastlocCol%>&instdate=<%=instdateCol%>&instplace=<%=instplaceCol%>&instby=<%=instalbyCol%>&entby=<%=entbyCol%>&repdate=<%=repdateCol%>&replby=<%=replbyCol%>&oldunitCol=<%=oldunitCol%>&dispdate=<%=dispdateCol%>&dispto=<%=disptoCol%>&inwarranty=<%=inwarrantyCol%>&oldunit=<%=oldunitCol%>&group=<%=groupCol%>&dispby=<%=dispbyCol%>&periferal=<%=periferals%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>	
		</tr>
	</table>
		<table border="1" align="center" width="750px" class="sortable">
			<tr  bgcolor="#BDBDBD">
				<td> <div align="center"><b> Sr. No.</b></div> </td>
				
	<% 			
				
				
				try
		{	
			if(instruction.equals("instn"))
			{ 
%>
				<td> <div align="center"><b> Instruction </b></div> </td>
<%			}
		} catch(Exception e) { }
	
		try
		{	
			if(vehCol.equals("veh"))
			{ 
%>
				<td> <div align="center"><b> Vehicle No. </b></div> </td>
<%			}
		} catch(Exception e) { }

			
		 		
		try
		{
			if(lastdateCol.equals("lastdate"))
			{ %>

				<td width="68px"><div align="center"><b>Last Date</b></div></td>
<%			} 
		} catch(Exception e) { }
	
		try
		{
			if(lastlocCol.equals("lastloc"))		
			{ %>
				<td width="68px"> <div align="center"><b>Last Location</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(unitidCol.equals("unitid"))	
			{ %>
				<td width="68px"> <div align="center"><b> Unit Id</b></div></td>
<%			}
		} catch(Exception e) { }

		try{
			if(custCol.equals("cust"))
			{ 
%>
				<td width="68px"><div align="center"><b>Trans -porter</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{	
			if(groupCol.equals("group"))
			{ 
%>
				<td> <div align="center"><b>Group </b></div> </td>
<%			}
		} catch(Exception e) { }
	
		try
		{
			if(mobnoCol.equals("mobno"))
			{ %>
				<td width="68px"><div align="center"><b>Mobile</b></div></td>
<%			}
		} catch(Exception e) { }
		
		try
		{
			if(simnoCol.equals("simno"))
			{ %>
				<td width="68px"><div align="center"><b>Sim</b></div></td>		
<%			} 
		} catch(Exception e) { }
			
		try
		{
			if(simcom.equals("simcomp"))
			{ %>
				<td width="68px"><div align="center"><b>Sim Company</b></div> </td>
<%			}
		} catch(Exception e) { }	
		try
		{
			if(periferals.equals("periferal"))
			{ %>
				<td width="68px"><div align="center"><b>Peripherals</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(psno.equals("psno"))
			{ %>
				<td width="68px"><div align="center"><b>PS No</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(pcbno.equals("pcbno"))
			{ %>
				<td width="68px"><div align="center"><b>PCB No</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(boxno.equals("boxno"))
			{ %>
				<td width="68px"><div align="center"><b>Box No</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(batteryno.equals("batteryno"))
			{ %>
				<td width="68px"><div align="center"><b>Battery No</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(unittype.equals("unittype"))
			{ %>
				<td width="68px"><div align="center"><b>Unit Type</b></div> </td>
<%			}
		} catch(Exception e) { }
		try
		{
			if(instdateCol.equals("instdate"))
			{ %>
				<td width="68px"><div align="center"><b>First Inst. Date</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(instalbyCol.equals("instby"))
			{ %>
				<td width="68px"><div align="center"><b>Inst. By</b></div></td>
<%			}
		} catch(Exception e) { }	

		try	
		{
			if(instplaceCol.equals("instplace"))
			{ %>
				<td width="68px"><div align="center"><b>Inst. Place</b></div></td>	
<%			}	
		} catch(Exception e) { }

		try
		{
			if(repdateCol.equals("repdate"))
			{ %>
				<td width="68px"><div align="center"><b>Last Rep. Date</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(inwarrantyCol.equals("inwarranty"))
			{ %>
				<td width="68px"><div align="center"><b>In Warranty</b></div> </td>
<%			}
		} catch(Exception e) { }

		
		
		try
		{
			if(entbyCol.equals("entby"))
			{ %>
				<td width="68px"><div align="center"><b>Entered by</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(replbyCol.equals("replby"))
			{ %>
				<td width="68px"><div align="center"><b>Replaced by</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(oldunitCol.equals("oldunit"))
			{ %>	
				<td width="68px"><div align="center"><b>Old Unit Id</b></div></td>
<%			}
		} catch(Exception e) { }

		

		try
		{
			if(dispdateCol.equals("dispdate"))
			{ %>	
				<td width="68px"><div align="center"><b>Disp. Date</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(dispbyCol.equals("dispby"))
			{ %>	
				<td width="68px"><div align="center"><b>Disp. By</b></div></td>
<%			}
		} catch(Exception e) { }

		try
		{
			if(disptoCol.equals("dispto"))
			{ %>	
				<td width="68px"><div align="center"><b>Disp. To</b></div></td>
<%			}
		} catch(Exception e) { }

%>
			<td width="68px"><div align="center"><b>CodeVersion</b></div></td>
			</tr>				
<%
 	 String nextstr="";
	 int i=1;

StringTokenizer strtok = new StringTokenizer(getunit,","); 
 while (strtok.hasMoreTokens())
 {
      	
	
	if(rad.equals("Vehicle"))	
   	{	
		nextstr="'%"+strtok.nextToken()+"%'";
		sql1="select * from allconnectedunits where VehNo like "+nextstr+"  order by concat(TheDate,TheTime) desc";
   	}
	 else
   	{
		nextstr=strtok.nextToken();
		sql1="select * from allconnectedunits where UnitId like "+nextstr+" group by UnitId order by concat(TheDate,TheTime) desc";
	
	}  	
	System.out.println("sql 1 : "+sql1);
	rs1=stmt1.executeQuery(sql1);
	  while(rs1.next())
	  { 
		String groupname="", vehid="", firstinstdate="", unitwarranty="";
		String vehno=rs1.getString("VehNo");
		String unitid=rs1.getString("UnitId");
		
		System.out.println("VehNo : "+vehno);
		System.out.println("UnitId : "+unitid);
		String sqlInsttype="select * from db_gps.t_unitmasterhistory where UnitID='"+unitid+"' order by EntDate DESC limit 1";
		ResultSet rsInsttype=stmt4.executeQuery(sqlInsttype);
		String InstType="";
		if(rsInsttype.next()){
			InstType=rsInsttype.getString("InstType");
			System.out.println("InstType---->"+InstType);
		}
		//sql4="select * from t_vehicledetails where VehicleRegNumber='"+vehno+"' ";
		sql4="select * from t_vehicledetails where unitid='"+unitid+"' ";
		System.out.println("sql4---->"+sql4);
		rs4=stmt4.executeQuery(sql4);
		
		if(rs4.next())
		{
			getinstruction=rs4.getString("Instruction");
			transporter=rs4.getString("OwnerName");
			vehid=rs4.getString("VehicleCode");
			firstinstdate=rs4.getString("InstalledDate");	
			System.out.println("Instruction---->"+getinstruction+", OwnerName---->"+transporter+", VehicleCode---->"+vehid+", InstalledDate---->"+firstinstdate);
		}
		else
		{
			transporter="-";
			vehid="-";
			getinstruction="-";
		}

		String sql5="select (TO_DAYS('"+tdydte+"')-TO_DAYS('"+firstinstdate+"'))";
		//out.print(sql5);
		ResultSet rs5=stmt4.executeQuery(sql5);	
		if(rs5.next())
		{
			int ww=rs5.getInt(1);
                        int dysrem=365-ww;

			if(ww <365)
			{ 
				unitwarranty="Yes";
			}
			else
			{
				unitwarranty="No";
			}
		} 
		
// 		sql5="select * from t_vehicledetails where Unitid='"+unitid+"'" ;
// 		ResultSet rs6=stmt3.executeQuery(sql5);
// 		System.out.println("sql5 : "+sql5);
		
// 		if(rs6.next()){
			
// 			getinstruction=rs6.getString("Instruction");
// 			System.out.println("..>Instruction"+getinstruction);
			
// 		}
		
			
			
			String getmobno="",getinstn, getsimno="",getPeripherals="", getsimcompany="",getpsno="",getpcbno="",getboxno="",getbatteryno="",CodeVersion="";
		sql2="select * from t_unitmaster where Unitid='"+unitid+"' order by EntDate desc limit 1";
		System.out.println("sql2 : "+sql2);
		ResultSet unitmob=stmt2.executeQuery(sql2);
		if(unitmob.next())
		{
			getmobno=unitmob.getString("MobNo");
			getsimno=unitmob.getString("SimNo");
				
			getsimcompany=unitmob.getString("SimCompany");
			getPeripherals=unitmob.getString("Peripherals");
			getpsno=unitmob.getString("PSNo");
			getpcbno=unitmob.getString("PCBNo");
			getboxno=unitmob.getString("BoxNo");
			getbatteryno=unitmob.getString("BatteryNo");
		}
		else
		{
			getmobno="-";
			getsimno="-";
			getsimcompany="-";
			getPeripherals="-";	
		}
		String sqlCodeVer="select * from t_ftplastdump where UnitID='"+unitid+"'";
		ResultSet rsCodeVer=stmt2.executeQuery(sqlCodeVer);
		if(rsCodeVer.next()){
			CodeVersion=rsCodeVer.getString("CodeVersion"); 
		}
		String isCodeVerValid="white";
		String sqlValidCodeVer="select * from db_CustomerComplaints.t_utcodever where codever='"+CodeVersion+"' and valid='Yes'";
		ResultSet rsValidCodeVer=stmt2.executeQuery(sqlValidCodeVer);
		if(rsValidCodeVer.next()){
			isCodeVerValid="white";
		}else{
			isCodeVerValid="orange";
		}
%>
		<tr bgcolor="<%=isCodeVerValid%>">
			<td><div align="right"><font > <%=i %> </font></div></td>
			
			
			
			
			
			
			<%

try {      
 
	if (instruction.equals("instn")) {

	 //close of if    
	
	
						if(getinstruction==null) {
							
							%>
								
							              		 		<td> <div align="center"> <font color="maroon">
												 -</td>
							
		<%						}
						else{
							%>	
              		 		 
              		 		<td> <div align="center"> <font color="maroon">
					 <%=getinstruction%></td>

<%
						}
	}
						
					else{ %>
				
					<td> <div align="center"> <font color="maroon">
						 <%=getinstruction%></td>
			<% 		} 
	  }
		catch (Exception e) {
					}
				 
			%>
	
	
			
<%
		if(vehno.equals("-") || null==vehno)
		{
			unitwarranty="NA";
	
			try
			{
				if(vehCol.equals("veh"))
				{	 			
 %>
			 		<td> <div align="center"> <font > 
					<%=rs1.getString("VehNo") %></font> </div> </td>
<%				}
			} catch(Exception e) { }
		} 
		else
		{
			try
			{
				if(vehCol.equals("veh"))
				{
%>	
              		 		<td> <div align="left"> <font >
					<a href="javascript:toggleDetails1(<%=i%>,true);" title="Click Here"> <%=rs1.getString("VehNo") %> </a>
					</font>
					<br/>	
					<div class="popup" id="popupx<%=i%>">
					<table border="0" >
						<tr> <td><a href="addcomplaint.jsp?vid=<%=vehid%>" onclick="toggleDetails(<%=i%>,false);">Add Complaint</a></td></tr>
						<tr><td><a href="repunit.jsp?vid=<%=vehid%>" onclick="toggleDetails(<%=i%>,false);">Unit Replace</a></td></tr>
						<tr> <td><a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('rep_history.jsp?vid=<%=vehid%>', 'win1', 'width=750, height=400, location=0, menubar=0, scrollbars=0, status=0, toolbar=0, resizable=0')">View History</a></td></tr>
						<tr>
							<td> <a href="javascript: toggleDetails(<%=i%>,false);" onClick="window.open ('reprovisionnos.jsp?vid=<%=vehid%>&vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&simno=<%=getsimno%>&mobno=<%=getmobno%>&transp=<%=x=transporter%>','win1','width=750,height=400,location=0,menubar=0,scrollbars=0,status=0,toolbar=0,resizable=0')" > Re-provisioning </a> </td></tr>		
						<tr>
							<td> <a href="techspcomment.jsp?vehno=<%=rs1.getString("VehNo")%>&comment=veh" onclick="toggleDetails(<%=i%>,false);">Special Comment </a> </td>
						</tr>
						<tr>
					    <td> <a href="sendmail.jsp?vehno=<%=rs1.getString("VehNo")%>&unitid=<%=unitid%>&transp=<%=transporter%><%System.out.println("TRANSPORTER : "+transporter); %>" onclick="toggleDetails(<%=i%>,false);">Send Mail</a> </td>
						</tr>
						<tr> <td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td></tr>
					</table>
	
					</div>		
				</div> 
			 	</td>
<%
				}  //close of if
			} catch(Exception e) { }
		} //close of else 

	
		sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='New' order by InstDate desc limit 1";
		ResultSet rst=st.executeQuery(sql);
		if(rst.next())
		{
			
			instdate=rst.getString("InstDate");
			instloc=rst.getString("InstPlace");
			instby=rst.getString("InstBy");
			oldunitid=rst.getString("OldUnitId");
		}	
		else
		{
			
			instdate="-";
			instloc="-";
			instby="-";
		}

		sql3="select * from t_vehicledetails where UnitID='"+getunit+"' ";
		ResultSet rs3=st3.executeQuery(sql3);
		if(rs3.next())
		{
			vehiclecode=rs3.getString("VehicleCode");
		}

		sql2="select * from t_group where VehCode='"+vehiclecode+"' ";
		ResultSet rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			groupname=rs2.getString("GPName");
		}
		else
		{
			groupname="-";
		} 				
	try
	{	
		if(lastdateCol.equals("lastdate"))
		{ %>
			<td sorttable_customkey="dd-MMM-yyyy" > <div align="right"> <font > <%=new SimpleDateFormat("dd-MMM-yyyy").format(rs1.getDate("TheDate")) %>
		 <%=rs1.getString("TheTime") %> </font></div> 
			</td>	
<%		} 
	} catch(Exception e) { }

	try
	{	
		if(lastlocCol.equals("lastloc"))		
		{ %>
			 <td> <div align="left"> <font > <%=rs1.getString("Location") %></font> </div>  </td>
	 
<%		}
	} catch(Exception e) { }

	try
	{
		if(unitidCol.equals("unitid"))	
		{ %>
			<td> <div align="right"> <font > <%=unitid %> </font></div>
			</td>
<%		} 
	} catch(Exception e) { }

	try
	{		
		if(custCol.equals("cust"))
		{ %>
			<td><div align="left"> <font > <%=transporter%></font> </div> </td>
<%		} 
	} catch(Exception e) { }

	try
	{		
		if(groupCol.equals("group"))
		{ %>
			<td><div align="left"> <font > <%=groupname%> </font></div> </td>
<%		} 
	} catch(Exception e) { }


	
	try
	{
		if(mobnoCol.equals("mobno"))
		{ %>
				<td><div align="right"><font > <%=getmobno %></font></div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(simnoCol.equals("simno"))
		{ %>
				<td><div align="right"><font > <%=getsimno %></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	try
	{
		if(simcom.equals("simcomp"))
		{ %>
				<td><div align="left"><font > <%=getsimcompany %></font></div> </td>	
<%		}
	} catch(Exception e) { }

	try
	{
		if(periferals.equals("periferal"))
		{ %>
				<td><div align="left"><font > <%=getPeripherals%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	try
	{
		if(psno.equals("psno"))
		{ %>
				<td><div align="right"><font > <%=getpsno%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	try
	{
		if(pcbno.equals("pcbno"))
		{ %>
				<td><div align="right"><font > <%=getpcbno%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	try
	{
		if(boxno.equals("boxno"))
		{ %>
				<td><div align="right"><font > <%=getboxno%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	try
	{
		if(batteryno.equals("batteryno"))
		{ %>
				<td><div align="right"><font > <%=getbatteryno%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	try
	{
		if(unittype.equals("unittype"))
		{ %>
				<td><div align="left"><font > <%=InstType%></font></div> </td>	
<%		}
	} catch(Exception e) { }
	
	
	try
	{
		if(instdateCol.equals("instdate"))
		{ %>   
              		<td width="68px"><div align="right"> <font >
<%
			if(instdate=="0000-00-00"||instdate=="-")
			{
				String d3="-";
				out.print(d3);
			}		
			else
			{
				String d3=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(instdate));
				out.print(d3);
			} %>
			</font></div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(instalbyCol.equals("instby"))
		{ %>
		        <td> <div align="left"> <font > <%=instby%> </font></div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(instplaceCol.equals("instplace"))
		{ %>
              		<td> <div align="left"> <font > <%=instloc%> </font></div>  </td>		
<%		}
	} catch(Exception e) { }

		String d2="", d1="";
		sql="select * from t_unitreplacement where VehRegNo='"+rs1.getString("VehNo")+"' and VehRegNo not in('-','0','0000') and InstType='Rep' order by InstDate desc";
		ResultSet rst2=st.executeQuery(sql);
		if(rst2.next())
		{
			d1=rst2.getString("InstDate");
			enteredby=rst2.getString("Entby");
			replacedby=rst2.getString("InstBy");				
	
			if(d1=="0000-00-00"||d1=="-")
			{
				d2=d1;
			}
			else
			{
				d2=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d1));			
			}
		}

	try
	{
		if(repdateCol.equals("repdate"))
		{ %>
			<td> <div align="right"> <font > <%=d2%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(inwarrantyCol.equals("inwarranty"))
		{ %>
			<td> <div align="left"> <font > <%=unitwarranty%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(entbyCol.equals("entby"))
		{ %>
			<td> <div align="left"> <font > <%=enteredby%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(replbyCol.equals("replby"))
		{ %>
			<td> <div align="left"> <font > <%=replacedby%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(oldunitCol.equals("oldunit"))
		{ %>	
			<td> <div align="right"> <font > <%=oldunitid%> </font> </div> </td>
<%		}
	} catch(Exception e) { }


		String sql6="select * from t_unitmasterhistory where UnitId='"+unitid+"' and Status='Dispatched' order by DispDate desc limit 1";
		ResultSet rs7=stmt4.executeQuery(sql6);	
		if(rs7.next())
		{
			dispdate=rs7.getString("DispDate");	
			dispby=rs7.getString("User");	
			disadd=rs7.getString("DisAdd");	
		}

	
	try
	{
		if(dispdateCol.equals("dispdate"))
		{ %>	
			<td> <div align="left"> <font > <%=dispdate%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(dispbyCol.equals("dispby"))
		{ %>	
			<td> <div align="left"> <font > <%=dispby%> </font> </div> </td>
<%		}
	} catch(Exception e) { }

	try
	{
		if(disptoCol.equals("dispto"))
		{ %>		
			<td> <div align="left"> <font > <%=disadd%> </font> </div> </td>	
<%		}
	} catch(Exception e) { }
%>

        
 		<td> <div align="left"> <font > <%=CodeVersion%> </font> </div> </td>
 	</tr>
<%
		i++;
	} //close of while
} //close of string tokenizer
   
%>	

		</table>
	
	
<!-- code end here --->
</form>
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

		
<%
} //colse of else


}catch(Exception e)
{
	//out.print("Exception -->"+e);
	e.printStackTrace();

}
finally
{
	con1.close();
}
%>
		




