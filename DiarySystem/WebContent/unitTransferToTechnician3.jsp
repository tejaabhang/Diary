<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
  <%@ include file="header.jsp" %> 

<%!
String userrole1="";
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
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript">
	function redirect()
	{
//	alert("in validation");
//	var a=document.unittransfer.cmnt.value;
//	alert(a);
//	var b=document.unittransfer.techlist.value;
//alert(b);
//	if(a=="")
//	{
//		alert("Please enter reason of delay");
//		return false;
//    }
//	else if(b=="Select")
//	{
//		alert("Please select technician");
//		return false;
//   }else{
	var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransfertotechnician.jsp?";
//	alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("tech"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&tech"+i+"="+document.getElementById("tech"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
//    }
	}
	
	function redirect1()
	{
	//alert("in validation");
		var cntr=document.unittransfer.cntr.value;
	//	alert(cntr);
		var url="insertunittransferbycourier.jsp?";
	//alert(url);
	//url=url+"&description="+document.getElementById("description").value+"&body="+document.getElementById("body").value;
	var i=0;
	var flag="false";
	   	for(var j=1;j<cntr;j++)
	    	{	//alert("j loop"+j);
	    		//alert(document.getElementById("disp"+j).checked);
	    		if(document.getElementById("disp"+j).checked==true)
	    		{
				//	alert("chechbox selected");
		    	//	alert("UnitID"+document.getElementById("unitid"+j).value);
		    	//	alert("transp"+document.getElementById("tech"+j).value);
	          	 url=url+"&UnitID"+i+"="+document.getElementById("unitid"+j).value+"&transp"+i+"="+document.getElementById("transp"+j).value;
					 i++;
				//	alert(url);
					// alert("map"+url);
						flag="true";
	    		}		
	    	}
			//alert(flag);
	        if(flag=="false"){
				alert("Please select TO mail ids");
				return false;
	        }//write function to check no of check boxes get value
	       document.unittransfer.action=url+"&cntr1="+i;
	      	
	       document.unittransfer.submit();
		
	}
	function submitUser(){
			
	       		 var listbox = document.resourceFrm.assigned;
	        		for(var count=0; count < listbox.options.length; count++) {
	            		listbox.options[count].selected = isSelect;
	    	
		}
	        document.resourceFrm.submit();
		}




	function addUser() {
	    var src = document.resourceFrm.resources;
	    var dest = document.resourceFrm.assigned;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function removeUser() {
	    var src =document.resourceFrm.assigned;
	    var dest =  document.resourceFrm.resources;
	 
	    for(var count=0; count < src.options.length; count++) {
	 
	        if(src.options[count].selected == true) {
	                var option = src.options[count];
	 
	                var newOption = document.createElement("option");
	                newOption.value = option.value;
	                newOption.text = option.text;
	                newOption.selected = true;
	                try {
	                         dest.add(newOption, null); //Standard
	                         src.remove(count, null);
	                 }catch(error) {
	                         dest.add(newOption); // IE only
	                         src.remove(count);
	                 }
	                count--;
	        }
	    }
	}
	function show(id)
	{
		//alert(id);
		if(id==0)
		{
			document.getElementById("transfer").style.display="";
			document.getElementById("courierby").style.display='none';
			
		}
		else if(id==1)
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display="";
			
		}
		else
		{
			document.getElementById("transfer").style.display='none';
			document.getElementById("courierby").style.display='none';
		}
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
<!-- Checking request from tech type or not, and making headers available accordingly-->


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
              
<%
Connection con;
Statement st,st1,st2,stmt21,stmt31,stmt51,stmt52,stmt61,stmt71,stmt72,stmt73,stmt74,stmt75,stmt76,stmt77,stmt78;
Statement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt88,stmt7,stmt10,stmt111,stmt13;
Class.forName(MM_dbConn_DRIVER);
con = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con.createStatement();
st1=con.createStatement();
stmt1=con.createStatement();
stmt2=con.createStatement();
stmt3=con.createStatement();
stmt4=con.createStatement();
stmt5=con.createStatement();
stmt6=con.createStatement();
stmt88=con.createStatement();
stmt7=con.createStatement();
stmt10=con.createStatement();
stmt111=con.createStatement();
stmt13=con.createStatement();

stmt21=con.createStatement();
stmt31=con.createStatement();
stmt51=con.createStatement();
stmt52=con.createStatement();
stmt61=con.createStatement();
stmt71=con.createStatement();
stmt72=con.createStatement();
stmt73=con.createStatement();
stmt74=con.createStatement();
stmt75=con.createStatement();
stmt76=con.createStatement();
stmt77=con.createStatement();
stmt78=con.createStatement();

String userrole=session.getAttribute("userrole").toString();
java.util.Date dte = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
String today=formatter.format(dte);
String updated=request.getParameter("updated");
if(updated==null){
	
}else{
	%>
	<table border="0" width="750px" bgcolor="#77D7D4" align="center">
			<tr>	
				<td align="center"> <font color="black"> Selected Unit Id has already been received. </font> </td>
			</tr>
		</table>
	<%
} %>




<form action="" name="unittransfer" method="post">


<%
String[] assignedtech=request.getParameterValues("assigned");
//out.println("assignedtech:-"+assignedtech);
String finaltech="";

if(assignedtech==null){
	
}else{

	%>
	<div align="left" colspan="1"><font color="red" >This report shows data based on last 90 days replacements and dispatches</font></div>
	 <table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
              
              	
				<tr>
					<td align="center" colspan="2"> <font color="black" > <b>Pending Units From Replacement/Removed For <%=Arrays.toString(assignedtech)%></b></font></td>
				</tr>
</table>
	  <table border="1" width="750px" align="center" class="sortable">
<tr>
	<td></td>
	<td> <b> Sr. No </b> </td>
	<td> <b> Unit Id </b> </td>	
	<td> <b> Unit Type</b> </td>	
	<td><b> Status </b></td>
	<td> <b> Status Date </b> </td>
	<td><b> Veh. Reg No. </b></td>
	<td><b>Customer</b></td>
	<td> <b> Location </b> </td>
	<td> <b> Technician </b> </td>
	<td><b>Old Unit With</b></td>
		
</tr>
	
	<%
	
	int iii=1;	
	//out.println("assignedtech.length:-"+assignedtech.length);
if(assignedtech.length==0)
{%>
<tr>
					<td align="center" colspan="2"> <font color="black" > <b>No Data.</b></font></td>
				</tr>
	<% }
	for(int j=0; j<assignedtech.length;j++)
{
	//int ii=assignedtech.length;
		finaltech=assignedtech[j]+","+finaltech;
	//	cominsrt=comm;
		// out.print("===>"+finaltech); 

%>

<%
String OldUnitID="",EntDate="",InstType="",VehRegNo="",OwnerName="",InstPlace="",InstBy="",OldUnitWith="";
try{
	 

String sql1="select InstTime,OldUnitID,EntDate,InstType,VehRegNo,OwnerName,InstPlace,InstBy,OldUnitWith from t_unitreplacement where InstType In ('Rem','Rep','Del') and OldUnitWith In ('tech','"+assignedtech[j]+"') and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') AND EntDate >= DATE_SUB(curdate(),INTERVAL 90 DAY) order by EntDate Desc";
ResultSet rs1=stmt1.executeQuery(sql1);
//System.out.print("sql1:-"+sql1);


//out.print(ouid);

while(rs1.next())
{
	
	String time=rs1.getString("InstTime");
	OldUnitID=rs1.getString("OldUnitID").trim();
	EntDate=rs1.getString("EntDate");
	InstType=rs1.getString("InstType");
	VehRegNo=rs1.getString("VehRegNo");
	OwnerName=rs1.getString("OwnerName");
	InstPlace=rs1.getString("InstPlace");
	InstBy=rs1.getString("InstBy");
	OldUnitWith=rs1.getString("OldUnitWith");
	
	//System.out.print("time:-"+time);
	String z=new Integer(00).toString();
	if(time==null)
	{
		time=z;
		
	}
	
	//String remdate1=rs3.getString("EntDate");
	//out.print("EntDate");
	//String sql2="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+OldUnitID+"' and Rdate > '"+EntDate+"' order by Rdate desc"; 
	String sql2="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+OldUnitID+"' and Rdate >= '"+EntDate+"' and Rtime > '"+time+"' order by Rdate desc";
     //and Transporter='"+transp+"'";
	//System.out.print("sql2:-"+sql2);
	ResultSet rs2=stmt2.executeQuery(sql2);
	//String ss=rs2.getString("Rdate");
	//out.print(ss);
	//out.print(sql2);
	if(rs2.next())
	{
	}
	else
	{	
	 		
	  //String sql3="select OldUnitID from t_unitreplacement where (OldUnitID='"+OldUnitID+"' or NewUnitID='"+OldUnitID+"') and EntDate > '"+EntDate+"'";
		String sql3="select OldUnitID from t_unitreplacement where (OldUnitID='"+OldUnitID+"' or NewUnitID='"+OldUnitID+"') and EntDate >= '"+EntDate+"' and InstTime > '"+time+"'";
		//System.out.print("sql3:-"+sql3);
	   	ResultSet rs3=stmt3.executeQuery(sql3);
		if(rs3.next())
		{
			
		}
		
		else
		{	
								
			//String sql41="select UnitID from t_unitmasterhistory where UnitID='"+OldUnitID+"' and DispDate > '"+EntDate+"'";
			//String sql41="select UnitID from t_unitmasterhistory where UnitID='"+OldUnitID+"' and DispDate >= '"+EntDate+"' and EntTime > '"+time+"' ";
			String sql41="select UnitID from t_unitmasterhistory where UnitID='"+OldUnitID+"' and DispDate >= '"+EntDate+"' ";
			//System.out.print("sql41:-"+sql41);
			ResultSet rs4=stmt51.executeQuery(sql41);
			if(rs4.next())
			{
				
			}
			else
			{
			  String sql5="Select UnitID from allconnectedunits where UnitID='"+OldUnitID+"' and TheDate >'"+EntDate+"' and  VehNo <> '-' order by TheDate Desc ";
			  //System.out.print("sql5:-"+sql5);
					ResultSet rs5=stmt6.executeQuery(sql5);
					
					if(rs5.next())
					{
						
					}
					else
					{
						String sql6="select InstType from db_gps.t_unitmaster where UnitID='"+OldUnitID+"'";
						//System.out.print("sql6:-"+sql6);
						ResultSet rs6=stmt61.executeQuery(sql6);
						if(rs6.next()){
							String unittype=rs6.getString("InstType");
							
%>				
					<tr>
					<td> <input type="checkbox" name="disp<%=iii%>" id="disp<%=iii%>" value="disp<%=iii%>" /> </td>
					<td><div align="right"> <%=iii %></div> </td>
					<td><div align="right"> <%=OldUnitID%></div> </td>
					<td><div align="left"> <%=unittype%></div> </td>
					<td> <div align="left"><%=InstType%></div> </td>
					<td><div align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(EntDate)) %></div> </td>
					<td><div align="left"> <%=VehRegNo%></div> </td> 
					<td><div align="left"> <%=OwnerName%></div> </td>
					<td><div align="left"> <%=InstPlace%></div> </td>
					<td><div align="center"> <%=InstBy%></div> </td>
					<td> <div align="center"><%=OldUnitWith%>
					<input type="hidden" name="unitid<%=iii%>" id="unitid<%=iii%>" value="<%=OldUnitID%>" />
					<input type="hidden" name="tech<%=iii%>" id="tech<%=iii%>" value="<%=assignedtech[j]%>" />
					<input type="hidden" name="transp<%=iii%>" id="transp<%=iii%>" value="<%=OwnerName%>" />
					
					</div>
					</td>
					</tr>
					
					

<%	
						}iii++;
					}
			//	}
			//}
			//}
			
			}
		}
		
	}

}
}catch(Exception e){
  	 e.printStackTrace();
  	 System.out.println("exception is:-"+e);
   }
//--------------------------FOR DISPATCH----------------------------//	
}

%>
</table>

<br></br>
<table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
	
				<tr>
					<td align="center" colspan="2"> <font color="black" > <b>Pending Units From Dispatches/Transform For <%=Arrays.toString(assignedtech)%></b></font></td>
				</tr>
</table>
<br></br>
<table border="1" width="750px" align="center" class="sortable">
	<tr>
		<td></td>
		<td> <b> Sr. No </b> </td>
		<td> <b> Unit Id </b> </td>	
		<td> <b> Unit Type</b> </td>	
		<td><b> Status </b></td>
		<td> <b> Dispatch Date </b> </td>
		<td><b> Unit Type </b></td>
		<td> <b> Dispatch Location </b> </td>
		<td><b>Mode Of Dispatch</b></td>
		<td><b>Docket No.</b></td>
		<td> <b> Chalan No </b> </td>
		<td><b>Dispatch From</b></td>
		<td><b>Tech</b></td>
	</tr>

<%
String UnitId="",DispDate="",typeunit="",DisAdd="",ModeofDispatch="",DisName="",ChalanNo="";
for(int j=0; j<assignedtech.length;j++)
{
	try 
	{
		
	String sql66="select Reqno,Reqto from db_CustomerComplaints.t_unitorder where Tech like '"+assignedtech[j]+"' and Status <> 'Open'  order by ReqDate desc ";
	//out.println(sql66);
	ResultSet rs66=stmt4.executeQuery(sql66);
	 	
	 while(rs66.next())
	 {
		//i++;
		 String orderno=rs66.getString("Reqno");
		

			
			String sql77="select RecByCust,typeunit,UnitId,EntTime,RecByCust,EntTime,DispDate,DisAdd,ModeofDispatch,DisName,ChalanNo from t_unitmasterhistory where OrderNo='"+orderno+"' AND EntDate >= DATE_SUB(curdate(),INTERVAL 90 DAY) group by UnitID";
			//System.out.println("sql77"+sql77);
			ResultSet rs77=stmt7.executeQuery(sql77);
			
			while(rs77.next())
			{
				
				//out.print(rs77.getString("UnitId"));
				String received=rs77.getString("RecByCust");
				String tme=rs77.getString("EntTime");
				UnitId=rs77.getString("UnitId").trim();
				DispDate=rs77.getString("DispDate");
				typeunit=rs77.getString("typeunit"); 
				DisAdd=rs77.getString("DisAdd");
				ModeofDispatch=rs77.getString("ModeofDispatch");
				DisName=rs77.getString("DisName");
				ChalanNo=rs77.getString("ChalanNo");
				
				String z=new Integer(00).toString();
				if(tme==null)
				{
					tme=z;
					
				}
				else
				{
					
				}
						
				//String sql88="select oldunitid from t_unitreplacement where NewUnitID='"+UnitId+"' and (InstDate = '"+DispDate+"' or EntDate = '"+DispDate+"') and InstTime > '"+tme+"' and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') order by EntDate Desc";
				String sql88="select oldunitid from t_unitreplacement where NewUnitID='"+UnitId+"' and (InstDate >= '"+DispDate+"' or EntDate >= '"+DispDate+"') and InstTime > '"+tme+"' and InstBy In ('"+assignedtech[j]+"' , '"+assignedtech[j]+" del') order by EntDate Desc";
				//System.out.print("sql88:-"+sql88);  
				ResultSet reurep=stmt88.executeQuery(sql88);
					//System.out.print(rs77.getString("UnitId"));
					
					if(reurep.next())
					{
					
					}
					else
					{
					
						//String sql71="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+UnitId+"' and Rdate = '"+DispDate+"' and Rtime > '"+tme+"' order by Rdate desc";
						String sql71="select UnitID from db_CustomerComplaints.t_unitreceived where UnitID='"+UnitId+"' and Rdate >= '"+DispDate+"' and Rtime > '"+tme+"' order by Rdate desc";
						//System.out.print("sql71:-"+sql71);	
						ResultSet rsurcv=stmt71.executeQuery(sql71);
							
							if(rsurcv.next())

							{
							}
							else
							{	
              
								//String sql72="select OldUnitID from t_unitreplacement where (OldUnitID='"+UnitId+"' or NewUnitID='"+UnitId+"') and EntDate = '"+DispDate+"' and InstTime > '"+tme+"' ";
								String sql72="select OldUnitID from t_unitreplacement where (OldUnitID='"+UnitId+"' or NewUnitID='"+UnitId+"') and EntDate >= '"+DispDate+"' and InstTime > '"+tme+"' ";
								//System.out.print("sql72:-"+sql72);
								ResultSet rsurep=stmt72.executeQuery(sql72);
								
								if(rsurep.next())
								{
									
								}
								
								else
								{
								//String sql122="select UnitID,InstType from t_unitmasterhistory where UnitID='"+UnitId+"' and DispDate = '"+DispDate+"' and (EntTime > '"+tme+"' or EntTime = '"+tme+"') ";
								  String sql122="select UnitID,InstType from t_unitmasterhistory where UnitID='"+UnitId+"' and DispDate >= '"+DispDate+"' and EntTime >= '"+tme+"'";
								 // System.out.print("sql122:-"+sql122);	
								ResultSet rsumh1=stmt74.executeQuery(sql122);
								//out.print(sql12);
								if(rsumh1.next())
										{
										String sql13="Select UnitID from allconnectedunits where UnitID='"+UnitId+"' and TheDate >'"+DispDate+"' and VehNo <> '-'order by TheDate Desc ";
										//System.out.print("sql13:-"+sql13);
										ResultSet rs13=stmt13.executeQuery(sql13);
										//out.print(sql13);
										if(rs13.next())
										{
											
										}
										else
										{											
											
%>								
										<tr>
										<td> <input type="checkbox" name="disp<%=iii%>" id="disp<%=iii%>" value="disp<%=iii%>" /> </td>
										<td> <div align="right"><%=iii%></div> </td>
										
										<td><div align="right"> <%=UnitId%></div> </td>
										<td><div align="left"> <%=rsumh1.getString("InstType")%></div> </td>
										<td><font><div align="left"> OK</div> </font></td>
										<td><div align="right"> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(DispDate))%></div> </td>
										<td><div align="left"> <%=typeunit %></div> </td>
										<td> <div align="left"><%=DisAdd %></div> </td>
										<td> <div align="left"><%=ModeofDispatch %></div> </td>
										<td><B><div align="left"> <%=DisName %></div> </B></td>
										<td><div align="right"> <%=ChalanNo%></div> </td>
										<td> <div align="left"> <%=rs66.getString("Reqto")%></div> </td>
										<td> <div align="center"><%=assignedtech[j]%> 
										
										<input type="hidden" name="unitid<%=iii%>" id="unitid<%=iii%>" value="<%=UnitId%>" />
										<input type="hidden" name="tech<%=iii%>" id="tech<%=iii%>" value="<%=assignedtech[j]%>" />
											<input type="hidden" name="transp<%=iii%>" id="transp<%=iii%>" value="-" />
										
										</div>
										</td>
										</tr>
			<%	
										iii++;
			System.out.println(iii);
										}
										}
									}
								//}
								//}///
								//}
							//}
							//}
							//}
						}
					}
				}
}
}catch(Exception e){
  	 e.printStackTrace();
  	 System.out.println("exception is:-"+e);
   }
}
	String sqltech="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
	ResultSet rstechname=stmt2.executeQuery(sqltech);
%>
<input type="hidden" name="cntr" value="<%=iii%>" />	
</table>	 
<br></br>
<table border="1" width="750px" align="center" class="sortable" bgcolor="#77D7D4">
	
				<tr>
					<td align="center" colspan="2"> <font color="black" > <b>Transfer By </b></font> 
								<input type="radio" name="transferby" value="techorcust" onclick="show(0);"> <font color="black" ><b>Tech or Cust</b></font>
					 			<input type="radio" name="transferby" value="courier" onclick="show(1);"><font color="black" ><b>Courier</b> </font>
					 </td>
				</tr>
</table>
<br></br>
<table>
	<tr id="transfer" style="display:none"><td>
	<%
	//coding for internal transfer 
	%> 
	  <table border="1" width="750px" align="center" class="sortable">
		 <tr bgcolor="#77D7D4" align="center">
			<td colspan="2">
				<font color="black"><b>Internal Transfer Form</b></font>
			</td>
		</tr>
		<tr>
			<td>  Tech: 
				<select name="techlist" > 	
					<option value="Select">Select</option>	
<%
					while(rstechname.next())
					{ %>
						<option value="<%=rstechname.getString("TechName")%>"><%=rstechname.getString("TechName")%></option>
<%						}
%>
						
   		     </select> 
<%	
              
					if(MANAGER.equalsIgnoreCase(userrole)||SUPERADMIN.equalsIgnoreCase(userrole))
					{
%>
						&nbsp;&nbsp;&nbsp; OR &nbsp; &nbsp;&nbsp;
<%
					String sqltrans="select distinct(OwnerName) as cust from t_vehicledetails where OwnerName not like '% del' order by OwnerName asc";
					ResultSet rstransname=stmt75.executeQuery(sqltrans);
%>						      
					 Cust: <select name="custlist"> 	
							<option value="Select">Select</option>
							<%
								while(rstransname.next())
								{ %>
									<option value="<%=rstransname.getString("cust")%>"><%=rstransname.getString("cust")%></option>
<%									}
%>
							</select>	
<%									
}
%>

						</td>
					  </tr>   
					  
					     <tr>
					     <td align="center">
					  Transfer as: <input type="radio" name="unittype" value="Okay"> Okay
					 			<input type="radio" name="unittype" value="Faulty">Faulty
					</td>
				</tr>
				<tr>
					<td align="center">  Comment:  <textarea name="cmnt"> </textarea> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer"  onclick="redirect();" /> </td>
				</tr>
			</table>
			</td></tr>
			
			
			
			
			<tr id="courierby" style="display:none"><td>
			
			  <table border="1" width="750px" align="center" class="sortable">
				<tr bgcolor="#77D7D4" align="center">
				<td colspan="2"><font color="black"><b>Courier Form</b></font></td>
				</tr>
				<tr>
					<td>  Courier : <select name="courierlist" > 	
					<option value="Select">Select</option>	
<%
					String sqltech1="select distinct(value) as courier from db_CustomerComplaints.t_dropdown where dropdown='CourierTransfer' order by value asc";
					ResultSet rstechname1=stmt76.executeQuery(sqltech1);
					while(rstechname1.next())
					{ %>
						<option value="<%=rstechname1.getString("courier")%>"><%=rstechname1.getString("courier")%></option>
<%						}
%>
						
					     </select> 
						</td>
					 
					     <td align="center">
					 Courier Account: 
					 	<input type="radio" name="unittype" value="Transworld">Transworld
					 	<input type="radio" name="unittype" value="Customer">Customer&nbsp;&nbsp;&nbsp;&nbsp;
					 	<input type="radio" name="unittype" value="Technician">Technician
					</td>
				</tr>
				<tr>
				<td>Book Date :
					<input type="text" id="calender" name="calender" size="13" value="<%=today %>" readonly/>
       			 <script type="text/javascript">
      					  Calendar.setup(
     					   {
     					       inputField  : "calender",         // ID of the input field
     					       ifFormat    : "%Y-%m-%d",     // the date format
     					       button      : "trigger"       // ID of the button
     					   }
                      );
      				  </script>
      				  <%
      				String tm="";
      				 java.util.Date tdydate = new java.util.Date();
      				Format formatter11 = new SimpleDateFormat("HH:mm:ss");
      				tm=formatter11.format(tdydate);
      				  %>
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time : &nbsp;&nbsp;<input type="text" name="rtime" size="10" value="<%=tm%>" readonly>
				</td>
				<td>Pickup Date :
				<input type="text" id="calender1" name="Calender1" size="13" value="<%=today %>" readonly/>
       			 <script type="text/javascript">
      					  Calendar.setup(
     					   {
     					       inputField  : "calender1",         // ID of the input field
     					       ifFormat    : "%Y-%m-%d",     // the date format
     					       button      : "trigger1"       // ID of the button
     					   }
                      );
      				  </script>
				</td>
				</tr>
				<tr>
					<td align="center">  Pickup Delay Reason:  <textarea name="rsndelay"> </textarea> </td>
					<td align="center"> Booking Ref No: 	<input type="text" id="refno" name="refno" size="13" /></td>
				</tr>
				<tr>
					<td align="center">  Comment:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				  &nbsp;&nbsp;&nbsp;  <textarea name="comment"> </textarea> </td>
					<td align="center"> Courier DC No: 	<input type="text" id="courierdcno" name="courierdcno" size="13" /></td>
				</tr>
				<tr>
					<td> Tech Name :
  						<select name="techname">
     					    <option value="Select">Select</option>
<% 
 							 String sqltech11="select distinct(TechName) as TechName from db_CustomerComplaints.t_techlist where Available='Yes' order by TechName asc";
							 ResultSet rstechname11=stmt77.executeQuery(sqltech11);
							 while(rstechname11.next())
	   							{ 
%>
 							<option value="<%=rstechname11.getString("TechName") %> "> <%=rstechname11.getString("TechName") %> </option>
<% 
							} 
%>

 							<option value="Customer">Customer</option>
  						 </select>
	
					</td>
						<td>  Location :
					  <select name="locname">
     				    <option value="Select">Select</option>
<%
						String sql="select Distinct(LName) from db_CustomerComplaints.t_location order by LName";
						 ResultSet rst2=stmt78.executeQuery(sql);
							 while(rst2.next())
{ %>
<option value="<%=rst2.getString("LName") %>"> <%=rst2.getString("LName") %> </option>
<% } %>

   </select>
	
</td>


</tr>
<tr>
<td>  Status of Unit:
       <input type=radio name="radio2" value="Defective" checked>  Defective 
	<input type=radio name="radio2" value="Ok" > New
	<input type=radio name="radio2" value="Service Unit" > Service Unit 
</td>
<td>DC NO:  <input type="text" name="dcno" /> </td>
</tr>
				<tr>
					<td colspan="2" align="center">  <input type="submit" name="submit" value="Transfer"  onclick="redirect1();" /> </td>
				</tr>
			</table>
			</td></tr>
			</table>
			
			<%
}	

%>







</form>

</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>


