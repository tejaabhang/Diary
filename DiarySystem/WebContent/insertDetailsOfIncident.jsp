<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*" language="java"%>
<% // page import="incident.IncidentDateProcessing"
%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.net.*" import="java.util.*"
	import="java.text.*" import="java.io.*" import="javax.swing.*"
	errorPage=""%>
<%@ include file="header.jsp"%>
<%!
Connection con1;
%>

<%
String transporter="",vehno="",unitid="",calender2="",recby="";
String recfrom="",calender1="",hourincident="",minutesincident="",MyFileSat="",MyFileMap="",MyFile4lasttrip="",training="";
String observation1="",observation2="",observation3="",observation4="",downloadedBy="",inciRecThr="",TheDate="",TheTime="",Location="";
String imagename="";
		 
		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 out.println(isMultipart);
		 if (!isMultipart) {
		 } else {
		   FileItemFactory factory = new DiskFileItemFactory();
		//   out.println("factory====>"+factory);
		   ServletFileUpload upload = new ServletFileUpload(factory);
		//   out.println("upload====>"+upload);
		   List items = null;
		   try {
		   items = upload.parseRequest(request);
		   } catch (FileUploadException e) {
		   e.printStackTrace();
		   }
		   Iterator itr = items.iterator();
		   while (itr.hasNext()) 
		           {
			   try{
		   FileItem item = (FileItem) itr.next();
		//  out.println("item====>"+item);
		   if (item.isFormField())
		           {
		              String name = item.getFieldName();
		     //         //System.out.println("name====>"+name);
		                  String value = item.getString();
		                //  out.println("value====>"+value);
		                  if(name.equals("transporter"))
		                   {
		                	  transporter=value;
		                	//  out.println("transporter====>"+transporter);
		                   }
		                   if(name.equals("vehno"))
		                   {  
		                	   vehno=value;         
		                	//   out.println("vehno====>"+vehno);
		                   }
		                   if(name.equals("unitid"))
		                   {  
		                	   unitid=value;       
		                	//   out.println("unitid====>"+unitid);
		                   }
		                   if(name.equals("downloadedBy"))
		                   {
		                	   downloadedBy=value;
		                	 //  out.println("calender2====>"+calender2);
		                   }
		                   if(name.equals("inciRecThr"))
		                   {
		                	   inciRecThr=value;
		                	 //  out.println("calender2====>"+calender2);
		                   }
		                   
		             
		                   
		                   if(name.equals("recby"))
		                   {
		                	   recby=value;
		               	 //  out.println("recby====>"+recby);
		                   } 
		                
		                   if(name.equals("recfrom"))
		                   {
		                	   recfrom=value;
		                	 //  out.println("recfrom====>"+recfrom);
		                   } 
		                   if(name.equals("calender1"))
		                   {
		                	   calender1=value;
		                	 //  out.println("calender1====>"+calender1);
		                   } 
		                   if(name.equals("hourincident"))
		                   {
		                	   hourincident=value;
		                	 //  out.println("hourincident====>"+hourincident);
		                   } 
		                   if(name.equals("minutesincident"))
		                   {
		                	   minutesincident=value;
		                	//   out.println("minutesincident====>"+minutesincident);
		                   } 
		                   
		                   if(name.equals("training"))
		                   {
		                	   training=value;
		                	 //  out.println("training====>"+training);
		                   } 
		                   if(name.equals("observation1"))
		                   {
		                	   observation1=value;
		                	 //  out.println("observation1====>"+observation1);
		                   } 
		                   if(name.equals("observation2"))
		                   {
		                	   observation2=value;
		                	 //  out.println("observation2====>"+observation2);
		                   } 
		                   if(name.equals("observation3"))
		                   {
		                	   observation3=value;
		               	   //out.println("observation3====>"+observation3);
		                   } 
		                   if(name.equals("observation4"))
		                   {
		                	   observation4=value;
		                	 //  out.println("observation4====>"+observation4);
		                   } 
		                   
		            }else{
		        		           String itemName = item.getName();
		        		           out.println("itemName====>"+itemName);
		        		  		   //File savedFile = new File(config.getServletContext().getRealPath("/")+"/IncidentImage/"+itemName);
		        		  		   File savedFile = new File(config.getServletContext().getRealPath("/IncidentImage/")+itemName);
		        		  		 //File savedFile = new File("/home/s_dhole/test/"+itemName);

		        		   	    System.out.println("savedFile====>"+savedFile);
		        		           item.write(savedFile);
		        		           imagename=imagename+","+itemName;
		        		           System.out.println("imagename&&&&&=>"+imagename);
		            }
			   }catch(Exception e)
			   {
				   e.printStackTrace();
			   }
		   }
		   
		   
		   calender1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(calender1));
		   
		   
		   
		   
		  
		   Class.forName(MM_dbConn_DRIVER);
		   con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		   Statement stmt1=con1.createStatement();
		   Statement stmt2=con1.createStatement();
		   Statement st2=con1.createStatement();
		   Statement st3=con1.createStatement();
		   Statement st4=con1.createStatement();
		   String sql="",sql1="",image1="",image2="",image3="",image4="";

		   try{
		// out.println(imagename);
		String []temp=imagename.split(",");
		String []image=null;
		for(int i =0; i < temp.length ; i++)
		{
			String image0=temp[0].toString();
			image1=temp[1].toString();
			image2=temp[2].toString();
			image3=temp[3].toString();
			image4=temp[4].toString();
			//System.out.println("image0---------------------->"+image0);
			//System.out.println("image1----------------------->"+image1);
			//System.out.println("image2----------------------->"+image2);
			//System.out.println("image3------------------------>"+image3);
			//System.out.println("image4------------------------>"+image4);
		}
		   }catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   String username=session.getAttribute("username").toString();
		   String sql11="select * from db_gps.t_onlinedata where VehicleRegNo = '"+vehno+"' AND Transporter = '"+transporter+"' ";
			ResultSet rs11=stmt2.executeQuery(sql11);
			if(rs11.next()){
				TheDate=rs11.getString("TheDate");
				TheTime=rs11.getString("TheTime");
				Location=rs11.getString("Location"); 
			}
String TripID="",TripStartPlace="",TripEndPlace="",TripStartDate="",TripStartTime="",DriverCode="",DriverName="",JStatus="",vehid="";
int DistanceTravelled=0;
			String sql2="SELECT * FROM t_startedjourney WHERE VehRegNo='"+vehno+"' and OwnerName ='"+transporter+"' order by StartDate DESC limit 1";
			ResultSet rs=stmt2.executeQuery(sql2);
			if(rs.next()){
				TripID=rs.getString("TripID");
				TripStartPlace=rs.getString("StartPlace");
				TripEndPlace=rs.getString("EndPlace");
				TripStartDate=rs.getString("StartDate");
				TripStartTime=rs.getString("StartTime");
				DriverCode=rs.getString("DriverCode");
				DriverName=rs.getString("DriverName");
				JStatus=rs.getString("JStatus");
				vehid=rs.getString("Vehid"); 
				String sql7="select * from t_veh"+vehid+" where TheFiledTextFileName IN ('SI','ON','OF','ST','SP') " +
				"and concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) between '"+TripStartDate+" "+TripStartTime+"' and '"+hourincident+" "+minutesincident+":00' ";
			//System.out.println(sql7);
				if("Running".equalsIgnoreCase(JStatus)||"tobeclosed".equalsIgnoreCase(JStatus)){
					String sql3="select count(*) as count from t_veh"+vehid+" where TheFiledTextFileName IN ('SI','ON','OF','ST','SP') " +
							"and concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) between '"+TripStartDate+" "+TripStartTime+"' and '"+hourincident+" "+minutesincident+":00' ";
					//System.out.println(sql3);
					ResultSet rs1=st2.executeQuery(sql3);
					if(rs1.next()){
						int i=rs1.getInt("count");
						int distanceStartDate=0, distanceEndDate=0;
						//System.out.println("(=====>)"+i);
						String sql4="select Distance from t_veh"+vehid+" where concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) >='"+TripStartDate+" "+TripStartTime+"' and " +
								"	TheFiledTextFileName IN ('SI','ON','OF','ST','SP') order by concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) ASC limit 1 ";
						//System.out.println("(sql4=====>)"+sql4);
						ResultSet rs4=st3.executeQuery(sql4);
						if(rs4.next()){
							distanceStartDate=rs4.getInt("Distance");
							//System.out.println("distanceStartDate===>"+distanceStartDate);
						}
						String sql5="select Distance from t_veh"+vehid+" where concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) <='"+hourincident+" "+minutesincident+":00' and " +
						"	TheFiledTextFileName IN ('SI','ON','OF','ST','SP') order by concat(TheFieldDataStoredDate,'',TheFieldDataStoredTime) DESC limit 1 ";
						//System.out.println("(sql5=====>)"+sql5);
						ResultSet rs5=st4.executeQuery(sql5);
						if(rs5.next()){
							distanceEndDate=rs5.getInt("Distance");
							//System.out.println("distanceEndDate===>"+distanceEndDate);
						}
						DistanceTravelled=distanceEndDate-distanceStartDate;
						//System.out.println("DistanceTravelled===>"+DistanceTravelled);
					}
				}else{
					String sqlcomp1="SELECT * FROM t_completedjourney WHERE TripID = '"+TripID+"'";
					ResultSet rscomp1=st2.executeQuery(sqlcomp1);
					if(rscomp1.next()){
						DistanceTravelled=rscomp1.getInt("KmTravelled");
					}
					
				}
			}
			
		String sqlck="select * from db_gps.t_incidentreport where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime DESC limit 1  ";

		ResultSet rsck=stmt1.executeQuery(sqlck);
		if(rsck.next())
		{
			
			sql="update db_gps.t_incidentreport set "+
			"ReconnectDeviceDate='"+calender2+"',IncidentDate='"+calender1+"',IncidentTime='"+hourincident+":"+minutesincident+"',ObservationOFIncident1='"+observation1+"',ObservationOFIncident2='"+observation2+"',"+
			"ObservationOFIncident3='"+observation3+"',ObservationOFIncident4='"+observation4+"',DriverTrainingDetails='"+training+"',IncidentLocationMap='"+image1+"',IncidentLocationSatelite='"+image2+"', "+
			"LastTripJourneyMap='"+image3+"',EntBy='"+username+"',DataDownloadedBy='"+downloadedBy+"',ReportedThrough='"+inciRecThr+"',LastDataDate='"+TheDate+"',LastDataTime='"+TheTime+"',LastDataLocation='"+Location+"' where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by UpdatedDateTime DESC limit 1 ";
			//System.out.println("Query is " +sql);
			stmt2.executeUpdate(sql);
			
		//	response.sendRedirect("detailsOfIncidentReport.jsp?transp="+transporter+"&vehno="+vehno+"&unitid="+unitid+"");
			
			
			response.sendRedirect("alertGoTo.jsp?msg=Record inserted successfully&goto=detailsOfIncidentReport.jsp?transp="+transporter+"&vehno="+vehno+"&unitid="+unitid+"");

			
			
			
			
			
			

		}
		else
		{
			response.sendRedirect("detailsOfIncident.jsp?msg='yess'&vid="+vehid+"&vehno="+vehno+"&unitid="+unitid+"&transp="+transporter);
		}
		
		String IncidentID="";
		sql1="select * from db_gps.t_incidentreport where Transporter='"+transporter+"' and VehicleRegNo='"+vehno+"' and UnitID='"+unitid+"' order by IncidentDate DESC limit 1  ";
		ResultSet rs1=stmt1.executeQuery(sql1);
		if(rs1.next()){
			IncidentID=rs1.getString("IncidentID");
		}
		   

			
		//	IncidentDateProcessing details = new IncidentDateProcessing();	
		//	details.processingdata(IncidentID,unitid);
		   }


%>



