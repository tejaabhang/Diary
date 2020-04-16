<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,stmtinsert,st2,stid,stvid;
String transporter, vehicleno, drivername, drivercode, unitid, amount, complaint, othercomp, thedate, location, otherloc, technician, othertech, insertdate, sql, tickno, comment="-";
String TicketID="",cust="";
int VehicleCode=0;
%>
<%
try{
		transporter=request.getParameter("transporter");
		vehicleno=request.getParameter("vehno");
		drivername=request.getParameter("drivername");
		drivercode=request.getParameter("drivercode");
		unitid=request.getParameter("unitid");
		amount=request.getParameter("amount");
		complaint=request.getParameter("comp");
		othercomp=request.getParameter("othercomp");
		thedate=request.getParameter("calender");
		location=request.getParameter("location");
		otherloc=request.getParameter("otherloc");
		technician=request.getParameter("technician");
		othertech=request.getParameter("othertech");
		comment=request.getParameter("comment");
		tickno=request.getParameter("tickno");
		String emailtocust=request.getParameter("emailtocust");
		//System.out.println(emailtocust);
		String commentformail=request.getParameter("commentformail");
		//System.out.println(commentformail);
		String phone=request.getParameter("phone");
		//System.out.println(phone);
		String commentforphone=request.getParameter("commentforphone");
		//System.out.println(commentforphone);
		String calender1=request.getParameter("calender1");
		//System.out.println(calender1);
		String tid=request.getParameter("tid");
		
		String vid=request.getParameter("vehid"); 
		String trans=request.getParameter("trans");
		
		
		//System.out.println(">>>tid &&&&&&<<<"+tid);
		//System.out.println(">>>vid &&&<<<"+vid);

String		username=session.getAttribute("username").toString();

		
		
		if(tickno==null)
		{
			tickno="-";
		}
			
	insertdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		//out.print(insertdate);
		
		Class.forName(MM_dbConn_DRIVER);
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		st=conn.createStatement();
		stid=conn.createStatement();
		stmtinsert=conn1.createStatement();
		stvid=conn1.createStatement();
		st2=conn1.createStatement();
		if(complaint.equals("Other"))
		{
		sql="insert into t_specialcomp (Complaint,CompStatus) values('"+othercomp+"','Yes')";
		//Query for t_sqlquery
			String abcd=sql.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
			complaint=othercomp;
			st.executeUpdate(sql);
		}
		if(location.equals("Other"))
		{
			location=otherloc;
		}
		if(technician.equals("Other"))
		{
			technician=othertech;
		}
		sql="insert into t_specialreports (Transporter, VehRegNo, TickNo, DriverName, DriverCode, UnitID, Complaint, FoundDate, EnterDate, Location, Technician, amount, Comment,fromdate,emailtocust,phonetocust,commentformail,commentforphone) values('"+transporter+"','"+vehicleno+"','"+tickno+"', '"+drivername+"','"+drivercode+"','"+unitid+"','"+complaint+"','"+thedate+"','"+insertdate+"','"+location+"','"+technician+"','"+amount+"','"+comment+"','"+calender1+"','"+emailtocust+"','"+phone+"','"+commentformail+"','"+commentforphone+"')";
		System.out.println(">>>sql<<<"+sql);
		//Query for t_sqlquery
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
		st.executeUpdate(sql);

		String redirectto=request.getParameter("redirectto");
		System.out.println(">>>redirectto<<<"+redirectto);
		redirectto="specialreport11";
		
		try{
		String sqltid="select TicketID,Customer from db_CustomerComplaints.t_complaints1 where Tno='"+tickno+"' ";
		ResultSet rsid=stid.executeQuery(sqltid);
		if(rsid.next()){
			TicketID=rsid.getString("TicketID");
			cust=rsid.getString("Customer");
		}
		
		String sqlvid="select VehicleCode from db_gps.t_vehicledetails where VehicleRegNumber='"+vehicleno+"' ";
		ResultSet rsvid=stvid.executeQuery(sqlvid);
		if(rsvid.next()){
			VehicleCode=rsvid.getInt("VehicleCode");
			
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		 String  sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+TicketID+"','Special Report','"+comment+"','"+username+"','"+VehicleCode+"','"+vehicleno+"','"+cust+"') ";	
		 System.out.println(">>>sqlths<<<"+sqlths);
		 st2.executeUpdate(sqlths);
		  
		
		
		if(null==redirectto)
		{
			response.sendRedirect("specialreport.jsp?err=no");
			return;
		}
		else
		{ 
			//response.sendRedirect("specialreport1.jsp?err=no&trans="+transporter+"&vehno="+vehicleno+"&tickno="+tickno+"&inserted=yes");
			response.sendRedirect("fullfleet.jsp?transporter="+transporter+"&inserted=yes&vehno="+vehicleno);
			return;	
		}
		
		
	}catch(Exception e)
	{
		out.println("Exception----> "+e);
		e.printStackTrace();
	}
	finally
	{
		conn.close();
		conn1.close();
	}
%>
