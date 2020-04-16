<%@ page contentType="application/vnd.ms-excel;" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<% response.setContentType("application/vnd.ms-excel");

String filename="fullfleetexcel.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st1,st2,st3;
%>

<%
	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	long miliseconds=defoultdate.getTime();
		//System.out.println("miliseconds"+miliseconds);
	miliseconds=miliseconds-1000 * 60 * 60 *24;
	defoultdate.setTime(miliseconds);
	String userrole=session.getAttribute("userrole").toString();
	String typevalue=session.getAttribute("typevalue").toString();

		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st1=conn.createStatement();
		st2=conn.createStatement();
		st3=conn.createStatement();
		String typeOfVehicle="",invoiced="",tripType="";
		typeOfVehicle=request.getParameter("typeOfVehicle");
		invoiced=request.getParameter("invoiced");
		tripType=request.getParameter("tripType");
		String ALL="All",battrystatus ="NA",battrystatustime ="NA";
		String finaltypeofvalue=(typeOfVehicle == null) ? ALL : typeOfVehicle.toString();
		String finalinvoiced=(invoiced == null) ? ALL : invoiced.toString();
		String finaltripType=(tripType == null) ? ALL : tripType.toString();
		System.out.println("typeOfVehicle--------->"+finaltypeofvalue);
		System.out.println("invoiced--------->"+finalinvoiced);
		System.out.println("tripType--------->"+finaltripType);
		
%>
	<table border="0" width="750px" bgcolor="#E6E6E6" align="center">
		<tr bgcolor="#BDBDBD">
			<td align="center">
				<font color="#2A0A12" size="3"><b>JRM Vehicles details</b></font>
				<div align="right"><a href="excelCastrolJRMVehicleDetails.jsp"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </div>
			</td>
		</tr>
	</table>
	<br></br>
	<table border="1" align="center" width="750px" class="sortable">
		<tr  bgcolor="#BDBDBD">
			<td><b>Sr.</b></td>
			<td ><b>Mains Status</b></td>
		    <td><b>Mains StatusTime</b></td>
			
			<td><b>VehicleRegNo</b></td>
			<td><b>Transporter</b></td>
			<td><b>GPName</b></td>
			<td><b>Latest Date Time</b></td>
			<td><b>Last Location</b></td>
			<td><b>UnitID</b></td>
			<td><b>CodeVersion</b></td>
			<td><b>CodeVersion <br>from unitmaster</b></td>
			<td><b>Peripheral</b> </td>
			<td><b>Status</b></td>
			<td><b>Tanker/Truck</b></td>
			<td><b>Vehicle Trips</b></td>
			<td><b>Invoice Raised</b></td>
			<td><b>Installed Date</b></td>
			<td><b>Last Replacement Date</b></td>
		<!-- 	<td><b>JRM</b></td>
			<td><b>Latest JRM installed</b></td>
			<td><b>Latest JRM Removed</b></td> -->
		</tr>
		<%
			int i=1;
		try
		{
			 String sql51="select * from db_gps.t_group where GPName='Castrol'";
 			ResultSet rs51 = st1.executeQuery(sql51);
	         while(rs51.next()){
	        	 String UnitID="",Status="",VehicleType="",TripCatagory="-",Instruction="",InstalledDate="",LastReplacementDate="";
		        	String CodeVersion="-",Location="-",TheDate="-",TheTime="-",Peripherals = "-",SwVer="";
		        	String VehRegno=rs51.getString("VehRegno");
		        	String GPName=rs51.getString("GPName");
		        	String transporter=rs51.getString("transporter");
		        	String VehCode=rs51.getString("VehCode");

		        	 String sql53="SELECT UnitID,Status,Instruction,InstalledDate,LastReplacementDate from db_gps.t_vehicledetails where VehicleCode='"+VehCode+"'";
		        	// System.out.println(sql53);
		        	 ResultSet rs53=st2.executeQuery(sql53);
		        	 if(rs53.next()){
		        		 UnitID=rs53.getString("UnitID");
		        		 Status=rs53.getString("Status");
		        		 Instruction=rs53.getString("Instruction");
		        		 InstalledDate=rs53.getString("InstalledDate");
		        		 try{
		        		 InstalledDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(InstalledDate));
		        		 }catch(Exception e){
		        			 InstalledDate="-";
		        		 }
		        		 LastReplacementDate=rs53.getString("LastReplacementDate");
		        		 try{
		        		 LastReplacementDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(LastReplacementDate));
		        	 }catch(Exception e){
		        		 LastReplacementDate="-";
	        		 }
		        		 if(Instruction.equalsIgnoreCase("JRM")){
		        			 Instruction="JRM";
		        		 }
		        		 if(Status.equalsIgnoreCase("-")){
		        			 Status="Active";
		        		 }
		        		 String sqlAPN="select * from db_gps.t_ftplastdump where UnitID='"+UnitID+"'";
		        		// System.out.println(sqlAPN);
		        		 ResultSet rsAPN=st3.executeQuery(sqlAPN);
		        		 if(rsAPN.next()){
		        			 CodeVersion=rsAPN.getString("CodeVersion");
		        		//	 System.out.println("CodeVersion--->"+CodeVersion);
		        		 } 
		        	 }
		        	 String sqlTrip="select TripCategory from db_gps.t_startedjourney where Vehid='"+VehCode+"' and GPName='Castrol' order by concat(StartDate,' ',StartTime) DESC limit 1";
		        	// System.out.println(sqlTrip);
		        	 ResultSet rsTrip=st2.executeQuery(sqlTrip);
		        	 if(rsTrip.next()){
		        		 TripCatagory=rsTrip.getString("TripCategory");
		        	//	 System.out.println(TripCatagory);
		        	 }
		        	 
		        	 String sqlTankers="select * from db_gps.t_tankers where vehid='"+VehCode+"'";
		        	 ResultSet rsTanker=st2.executeQuery(sqlTankers);
		        	 if(rsTanker.next()){
		        		 VehicleType="Tanker";
		        	 }else{
		        		 VehicleType="Truck";
		        	 }
		        	 String sq="select Location,bcharging,bdatetime,TheDate,TheTime from db_gps.t_onlinedata where VehicleCode='"+VehCode+"'";
			        //	 System.out.println(sq);
			        	 ResultSet rs=st2.executeQuery(sq);
			        //	 System.out.println(sq);
			        	 if(rs.next()){
			        		 Location=rs.getString("Location");
			        		 TheDate=rs.getString("TheDate");
			        		 try{
			        		 TheDate=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(TheDate));
			        		 }catch(Exception e){
			        			 e.printStackTrace();
			        			 TheDate="-";
			        		 }
			        		 TheTime=rs.getString("TheTime");
			        		 battrystatus =rs.getString("bcharging");
			        			battrystatustime =rs.getString("bdatetime");
			        		 
			        	 }
			        	 String sq1="select Peripherals,SwVer  from db_gps.t_unitmaster where UnitiD='"+UnitID+"'";
			        	 
			        	 ResultSet rs1=st2.executeQuery(sq1);
			        //	 System.out.println(sq1);
			        	 if(rs1.next()){
			        		 Peripherals=rs1.getString("Peripherals");
			        		 SwVer=rs1.getString("SwVer");
			        	 }
			        //	 System.out.println("fefgsdkjfhsdkjfhsdkjf");
		if("All".equals(finaltypeofvalue) && "All".equals(finaltripType) && !("All".equals(finalinvoiced))){
			 if(finalinvoiced.equals(Instruction)){
				// System.out.println(Instruction);
			 %>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <%i++;} 
		}else if("All".equals(finaltypeofvalue) && !("All".equals(finaltripType)) && "All".equals(finalinvoiced)){
			 if(finaltripType.equals(TripCatagory)){
			 %>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <%i++; }
		}else if("All".equals(finaltypeofvalue) && !("All".equals(finaltripType)) && !("All".equals(finalinvoiced))){
			if(finaltripType.equals(TripCatagory)&& finalinvoiced.equals(Instruction) ){
			%>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <% i++;}
		}else if(!("All".equals(finaltypeofvalue)) && "All".equals(finaltripType) && "All".equals(finalinvoiced)){
			if(finaltypeofvalue.equals(VehicleType)){
			 %>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <% i++;}
		}else if(!("All".equals(finaltypeofvalue)) && "All".equals(finaltripType) && !("All".equals(finalinvoiced))){
			if(finaltypeofvalue.equals(VehicleType)&& finalinvoiced.equals(Instruction)){
			%>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <%i++; }
		}else if(!("All".equals(finaltypeofvalue)) && !("All".equals(finaltripType)) && "All".equals(finalinvoiced)){
			if(finaltypeofvalue.equals(VehicleType)&& finaltripType.equals(TripCatagory)){
			%>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <% i++;}
		}else if(!("All".equals(finaltypeofvalue)) && !("All".equals(finaltripType)) && !("All".equals(finalinvoiced))){
			if(finaltypeofvalue.equals(VehicleType)&& finaltripType.equals(TripCatagory)&& finalinvoiced.equals(Instruction)){
			%>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <% i++;}
		}else{
			 %>
		      <tr>
				<td><div align="right"><%=i %></div></td>
				<td align ="left"> <div align="left"><font color=""> <%=battrystatus%>	</font> </div> </td>
		
		<td align ="right"> <div align="left"><font color=""><%if(battrystatustime.equalsIgnoreCase("NA")) { %> <%=battrystatustime %><%}else{ %> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(battrystatustime)) %><%} %>	</font> </div> </td>
				
				<td><%=VehRegno %></td>
				<td><%=transporter%></td>
				<td><%=GPName%></td>
				<td><div align="right"><%=TheDate+" "+TheTime%></div></td>
				<td><%=Location%></td>
				<td><div align="right"><%=UnitID%></div></td>
				<td><%=CodeVersion%></td>
				<td><%=SwVer%></td>
				<td><%=Peripherals%></td>
				<td><%=Status%></td>
				<td><%=VehicleType%></td>
				<td><%=TripCatagory%></td>
				<td><%=Instruction%></td>
				<td><div align="right"><%=InstalledDate%></div></td>
				<td><div align="right"><%=LastReplacementDate%></div></td>
				<!-- <td><b>JRM</b></td>
				<td><b>Latest JRM installed</b></td>
				<td><b>Latest JRM Removed</b></td> -->
			</tr>
		      <% i++;
		}
			      
	         }
		}catch(Exception e)
{
	e.printStackTrace();
}
finally
{
conn.close();
conn1.close();
}
%>
	</table>

<!-- code end here --->
</form>