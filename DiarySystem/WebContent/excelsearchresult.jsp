<%@ page contentType="application/vnd.ms-excel; charset=gb2312" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*"%>
<%
	response.setContentType("application/vnd.ms-excel");

	String filename = "searchresult.xls";
	response.addHeader("Content-Disposition", "attachment;filename="
			+ filename);
%>
<%@ include file="header.jsp" %>
<%!Connection con1;
	Statement stmt1, st, st3, stmt2, stmt4;
	ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null;
	String sql1 = "", sql, sql2, sql3, sql4;%>

<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		stmt1 = con1.createStatement();
		stmt2 = con1.createStatement();
		st = con1.createStatement();
		st3 = con1.createStatement();
		stmt4 = con1.createStatement();

		String getunit = "", vehiclecode = "";
		String transporter = "", instdate = "", instloc = "", instby = "", dispdate = "", dispby = "", disadd = "", instructions = "", getinstruction ="";

		String rad = request.getParameter("VehUnit");
		getunit = request.getParameter("srchbx");

		java.util.Date d = new java.util.Date();
		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte = formatter1.format(d);

		/* **********************If choices (columns) are selected, then only selected cols will be shown ********************************************************************************** */
		String enteredby = "", replacedby = "", oldunitid = "";

		String custCol = "",periferals="",   groupCol = "", vehCol = "", unitidCol = "", simnoCol = "", mobnoCol = "", lastdateCol = "", lastlocCol = "", instdateCol = "", instplaceCol = "", instalbyCol = "", entbyCol = "", repdateCol = "", replbyCol = "", oldunitCol = "", dispdateCol = "", disptoCol = "", dispbyCol = "", inwarrantyCol = "", simcom = "";

		instructions = request.getParameter("instn");
		custCol = request.getParameter("cust");
		groupCol = request.getParameter("group");
		vehCol = request.getParameter("veh");
		simnoCol = request.getParameter("simno");
		mobnoCol = request.getParameter("mobno");
		lastdateCol = request.getParameter("lastdate");
		periferals=request.getParameter("periferal");
		lastlocCol = request.getParameter("lastloc");
		instdateCol = request.getParameter("instdate");
		instplaceCol = request.getParameter("instplace");
		instalbyCol = request.getParameter("instby");
		entbyCol = request.getParameter("entby");
		repdateCol = request.getParameter("repdate");
		replbyCol = request.getParameter("replby");
		oldunitCol = request.getParameter("oldunit");
		dispdateCol = request.getParameter("dispdate");
		disptoCol = request.getParameter("dispto");
		inwarrantyCol = request.getParameter("inwarranty");
		unitidCol = request.getParameter("unitid");
		dispbyCol = request.getParameter("dispby");
		simcom = request.getParameter("simcomp");
%>
	<table border="0" width="750px">
		<tr>
			<td align="right"> <a href="excelsearchresult.jsp?VehUnit=<%=rad%>&srchbx=<%=getunit%>&cust=<%=custCol%> &instn=<%=instructions%>&veh=<%=vehCol%>&simno=<%=simnoCol%>&mobno=<%=mobnoCol%>&lastdate=<%=lastdateCol%>&lastloc=<%=lastlocCol%>&instdate=<%=instdateCol%>&instplace=<%=instplaceCol%>&instby=<%=instalbyCol%>&entby=<%=entbyCol%>&repdate=<%=repdateCol%>&replby=<%=replbyCol%>&oldunitCol=<%=oldunitCol%>&dispdate=<%=dispdateCol%>&dispto=<%=disptoCol%>&periferal=<%=periferals%>&inwarranty=<%=inwarrantyCol%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/> </a> </td>	
		</tr>
	</table>
		<table class="sortable">
			<tr>		
				<td> <div align="center"><b> Sr. No.</b></div> </td>
				
				
				
			
				<td> <div align="center"><b> Instruction </b></div> </td>
 <%
	//}
		//} catch (Exception e) {
		//}

		try {
			if (vehCol.equals("veh")) {
%>
				<td> <div align="center"><b> Vehicle No. </b></div> </td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (lastdateCol.equals("lastdate")) {
%>

				<td width="68px"><div align="center"><b>Last Date</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (lastlocCol.equals("lastloc")) {
%>
				<td width="68px"> <div align="center"><b>Last Location</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (unitidCol.equals("unitid")) {
%>
				<td width="68px"> <div align="center"><b> Unit Id</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (custCol.equals("cust")) {
%>
				<td width="68px"><div align="center"><b>Transporter</b></div></td>
<%
	}
		} catch (Exception e) {
		}
       
		
		
		try
		{
			if(periferals.equals("periferal"))
			{ %>
				<td width="68px"><div align="center"><b>Peripherals</b></div> </td>
<%			}
		} catch(Exception e) { }
		
		
		try {
			if (groupCol.equals("group")) {
%>
				<td> <div align="center"><b>Group </b></div> </td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (mobnoCol.equals("mobno")) {
%>
				<td width="68px"><div align="center"><b>Mobile</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (simnoCol.equals("simno")) {
%>
				<td width="68px"><div align="center"><b>Sim</b></div></td>		
<%
			}
				} catch (Exception e) {
				}

				try {
					if (simcom.equals("simcomp")) {
		%>
				<td width="68px"><div align="center"><b>Sim Company</b></div> </td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (instdateCol.equals("instdate")) {
%>
				<td width="68px"><div align="center"><b>First Inst. Date</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (instalbyCol.equals("instby")) {
%>
				<td width="68px"><div align="center"><b>Inst. By</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (instplaceCol.equals("instplace")) {
%>
				<td width="68px"><div align="center"><b>Inst. Place</b></div></td>	
<%
		}
			} catch (Exception e) {
			}

			try {
				if (repdateCol.equals("repdate")) {
	%>
				<td width="68px"><div align="center"><b>Last Rep. Date</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (inwarrantyCol.equals("inwarranty")) {
%>
				<td width="68px"><div align="center"><b>In Warranty</b></div> </td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (entbyCol.equals("entby")) {
%>
				<td width="68px"><div align="center"><b>Entered by</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (replbyCol.equals("replby")) {
%>
				<td width="68px"><div align="center"><b>Replaced by</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (oldunitCol.equals("oldunit")) {
%>	
				<td width="68px"><div align="center"><b>Old Unit Id</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (dispdateCol.equals("dispdate")) {
%>	
				<td width="68px"><div align="center"><b>Disp. Date</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (dispbyCol.equals("dispby")) {
%>	
				<td width="68px"><div align="center"><b>Disp. By</b></div></td>
<%
	}
		} catch (Exception e) {
		}

		try {
			if (disptoCol.equals("dispto")) {
%>	
				<td width="68px"><div align="center"><b>Disp. To</b></div></td>
<%
	}
		} catch (Exception e) {
		}
%>

<td width="68px"><div align="center"><b>Code version</b></div></td>
			</tr>				
<%
				
String nextstr = "" ;
						int i = 1;

						StringTokenizer strtok = new StringTokenizer(getunit, ",");
						while (strtok.hasMoreTokens()) {
							
							if (rad.equals("Vehicle")) {
								nextstr = "'%" + strtok.nextToken() + "%'";
								sql1 = "select * from allconnectedunits where VehNo like "
										+ nextstr
										+ "  order by concat(TheDate,TheTime) desc";
							} else {
								nextstr = strtok.nextToken();
								sql1 = "select * from allconnectedunits where UnitId like "
										+ nextstr
										+ " group by UnitId order by concat(TheDate,TheTime) desc";

							}
							rs1 = stmt1.executeQuery(sql1);
							while (rs1.next()) {
								String groupname = "", vehid = "", firstinstdate = "", unitwarranty = "";
								String vehno = rs1.getString("VehNo");
								String unitid = rs1.getString("UnitId");

								sql4 = "select * from t_vehicledetails where VehicleRegNumber='"
										+ vehno + "' ";
								rs4 = stmt4.executeQuery(sql4);
								if(rs4.next()) {
									getinstruction = rs4.getString("Instruction");
									transporter = rs4.getString("OwnerName");
									vehid = rs4.getString("VehicleCode");
									firstinstdate = rs4.getString("InstalledDate");
								}

								String sql5 = "select (TO_DAYS('" + tdydte
										+ "')-TO_DAYS('" + firstinstdate + "'))";
								//out.print(sql5);
								ResultSet rs5 = stmt4.executeQuery(sql5);
								if (rs5.next()) {
									int ww = rs5.getInt(1);
									int dysrem = 365 - ww;

									if (ww < 365) {
										unitwarranty = "Yes";
									} else {
										unitwarranty = "No";
									}
								}
								
				%>
		<tr>
			<td><div align="center"><font color="maroon"> <%=i%> </div></td>

<%





     sql3 = "select * from t_vehicledetails where UnitID='"
						+ getunit + "' ";
				ResultSet rs3 = st3.executeQuery(sql3);
				if(rs3.next()) {
					vehiclecode = rs3.getString("VehicleCode");
					getinstruction=rs3.getString("Instruction");
				}


				%>
<%

try {      //System.out.println(">>>>"+instruction);
						

if (instructions.equals("instn")) {

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
              
            
              
				
                    
     
                

                               


	if (vehno.equals("-") || null == vehno) {
					unitwarranty = "NA";

					try {
						if (vehCol.equals("veh")) {
       %>
			 		<td> <div align="center"> <font color="maroon"> 
					<%=rs1.getString("VehNo")%> </div> </td>
<%
	}
					} catch (Exception e) {
					}
				} else {
					try {
						if (vehCol.equals("veh")) {
%>	
              		 		<td> <div align="center"> <font color="maroon">
					 <%=rs1.getString("VehNo")%> 
			 	</td>
<%
	} //close of if
					} catch (Exception e) {
					}
				} //close of else 

				
					
					
					
					
					sql = "select * from t_unitreplacement where VehRegNo='"
						+ rs1.getString("VehNo")
						+ "' and VehRegNo not in('-','0','0000') and InstType='New' order by InstDate desc limit 1";
				ResultSet rst = st.executeQuery(sql);
				if (rst.next()) {

					instdate = rst.getString("InstDate");
					instloc = rst.getString("InstPlace");
					instby = rst.getString("InstBy");
					oldunitid = rst.getString("OldUnitId");
				} else {

					instdate = "-";
					instloc = "-";
					instby = "-";
				}
				 

				sql2 = "select * from t_group where VehCode='"
						+ vehiclecode + "' ";
				ResultSet rs2 = stmt2.executeQuery(sql2);
				if (rs2.next()) {
					groupname = rs2.getString("GPName");
				} else {
					groupname = "-";
				}
				try {
					if (lastdateCol.equals("lastdate")) {
%>
			<td sorttable_customkey="dd-MMM-yyyy" > <div align="center"> <font color="maroon"> <%=new SimpleDateFormat(
														"dd-MMM-yyyy")
														.format(rs1
																.getDate("TheDate"))%>
		 <%=rs1.getString("TheTime")%> </div> 
			</td>	
<%
		}
					} catch (Exception e) {
					}

					try {
						if (lastlocCol.equals("lastloc")) {
	%>
			 <td> <div align="center"> <font color="maroon"> <%=rs1.getString("Location")%> </div>  </td>
	 
<%
	 	}
	 				} catch (Exception e) {
	 				}

	 				try {
	 					if (unitidCol.equals("unitid")) {
	 %>
			<td> <div align="center"> <font color="maroon"> <%=unitid%> </div>
			</td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (custCol.equals("cust")) {
%>
			<td><div align="center"> <font color="maroon"> <%=transporter%> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				

				String getmobno = "", getsimno = "", getsimcompany = "",getPeripherals="",CodeVersion="";
				sql2 = "select * from t_unitmaster where Unitid='"
						+ unitid + "' order by EntDate desc limit 1";
				ResultSet unitmob = stmt2.executeQuery(sql2);
				if (unitmob.next()) {
					getmobno = unitmob.getString("MobNo");
					getsimno = unitmob.getString("SimNo");
					getsimcompany = unitmob.getString("SimCompany");
					getPeripherals=unitmob.getString("Peripherals");

				} else {
					getmobno = "-";
					getsimno = "-";
					getsimcompany = "-";
					getPeripherals="-";	

				}

				String sqlCodeVer="select * from t_ftplastdump where UnitID='"+unitid+"'";
				ResultSet rsCodeVer=stmt2.executeQuery(sqlCodeVer);
				System.out.println(sqlCodeVer);
				if(rsCodeVer.next()){
					CodeVersion=rsCodeVer.getString("CodeVersion"); 
				}

				
				
				try
				{
					if(periferals.equals("periferal"))
					{ %>
							<td><div align="left"><font color="maroon"> <%=getPeripherals%></font></div> </td>	
			<%		}
				} catch(Exception e) { }
				
				
				
				
				
				try {

					if (groupCol.equals("group")) {
%>
			<td><div align="center"><font color="maroon"> <%=groupname%> </div> </td>
<%
	}
				} catch (Exception e) {
				}
				
				
				
				
				
				
				
				try {
					if (mobnoCol.equals("mobno")) {
%>
				<td><div align="center"><font color="maroon"> <%=getmobno%></div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (simnoCol.equals("simno")) {
%>
				<td><div align="center"><font color="maroon"> <%=getsimno%><div> </td>	
<%
		}
					} catch (Exception e) {
					}

					try {
						if (simcom.equals("simcomp")) {
	%>
				<td><div align="center"><font color="maroon"> <%=getsimcompany%><div> </td>	
<%
		}
					} catch (Exception e) {
					}
          
					
					
					
					
					
					
					
					
					
					try {
						if (instdateCol.equals("instdate")) {
	%>   
              		<td width="68px"><div align="center"> <font color="maroon">
<%
	if (instdate == "0000-00-00" || instdate == "-") {
							String d3 = "-";
							out.print(d3);
						} else {
							String d3 = new SimpleDateFormat(
									"dd-MMM-yyyy")
									.format(new SimpleDateFormat(
											"yyyy-MM-dd")
											.parse(instdate));
							out.print(d3);
						}
%>
			</div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (instalbyCol.equals("instby")) {
%>
		        <td> <div align="center"> <font color="maroon"> <%=instby%> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (instplaceCol.equals("instplace")) {
%>
              		<td> <div align="center"> <font color="maroon"> <%=instloc%> </div>  </td>		
<%
			}
						} catch (Exception e) {
						}

						String d2 = "", d1 = "";
						sql = "select * from t_unitreplacement where VehRegNo='"
								+ rs1.getString("VehNo")
								+ "' and VehRegNo not in('-','0','0000') and InstType='Rep' order by InstDate desc";
						ResultSet rst2 = st.executeQuery(sql);
						if (rst2.next()) {
							d1 = rst2.getString("InstDate");
							enteredby = rst2.getString("Entby");
							replacedby = rst2.getString("InstBy");

							if (d1 == "0000-00-00" || d1 == "-") {
								d2 = d1;
							} else {
								d2 = new SimpleDateFormat("dd-MMM-yyyy")
										.format(new SimpleDateFormat(
												"yyyy-MM-dd").parse(d1));
							}
						}

						try {
							if (repdateCol.equals("repdate")) {
		%>
			<td> <div align="center"> <font color="maroon"> <%=d2%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (inwarrantyCol.equals("inwarranty")) {
%>
			<td> <div align="center"> <font color="maroon"> <%=unitwarranty%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (entbyCol.equals("entby")) {
%>
			<td> <div align="center"> <font color="maroon"> <%=enteredby%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (replbyCol.equals("replby")) {
%>
			<td> <div align="center"> <font color="maroon"> <%=replacedby%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (oldunitCol.equals("oldunit")) {
%>	
			<td> <div align="center"> <font color="maroon"> <%=oldunitid%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				String sql6 = "select * from t_unitmasterhistory where UnitId='"
						+ unitid
						+ "' and Status='Dispatched' order by DispDate desc limit 1";
				ResultSet rs6 = stmt4.executeQuery(sql6);
				if (rs6.next()) {
					dispdate = rs6.getString("DispDate");
					dispby = rs6.getString("User");
					disadd = rs6.getString("DisAdd");
				}

				try {
					if (dispdateCol.equals("dispdate")) {
%>	
			<td> <div align="center"> <font color="maroon"> <%=dispdate%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (dispbyCol.equals("dispby")) {
%>	
			<td> <div align="center"> <font color="maroon"> <%=dispby%> </font> </div> </td>
<%
	}
				} catch (Exception e) {
				}

				try {
					if (disptoCol.equals("dispto")) {
%>		
			<td> <div align="center"> <font color="maroon"> <%=disadd%> </font> </div> </td>	
<%
		}
					} catch (Exception e) {
					}
					   System.out.println(">>>>!@"+CodeVersion);
	%>
	
	<td> <div align="left"> <font color="maroon" > <%=CodeVersion%> </font> </div> </td>
 	
 	</tr>
<%
	i++;
			} //close of while
		} //close of string tokenizer
%>		
			</tr>
		</table>
<%
	} catch (Exception e) {
		out.print("Exception -->" + e);

	} finally {
		con1.close();
	}
%>
		


<!-- code end here --->

 		</div>
   		 </div>
 		 
		<div id="gbox-bot1"> </div></div>
      </div>
    </div>
  </div>
  
  

</body>
</html>
<div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

