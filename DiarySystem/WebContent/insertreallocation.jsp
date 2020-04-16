<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" 
     import=" java.text.*" 
     import=" java.util.*" 
     errorPage="" 
     import="java.io.BufferedReader"
     import="java.io.InputStreamReader"
	 import="java.net.URL"
	 import="java.net.URLConnection"
     import="java.net.URLEncoder" 
     import="java.net.HttpURLConnection" %>
     
<%@ include file="header.jsp" %>
<%!
Connection conn,conn1;
Statement st,st1,stmt2,stmt5,st5,stmtinsert;
String sql,sql2,sql3,tno,transporter,location,Loc, thedate,technician,user,oldlocation,loddate,oldtechnician,resone,insertdatetime,insertdatetime1,insertdatetime11;
String rsn;
String dofcomplaint="", vehno="",para="";

%>

<% 




oldtechnician=request.getParameter("oldtechnician");
user=session.getAttribute("username").toString();
insertdatetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

insertdatetime1=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

String  probsnc=request.getParameter("probsnc");
rsn=request.getParameter("reason");
try {
	Class.forName(MM_dbConn_DRIVER);
	conn= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	stmt2=conn.createStatement();
	stmt5=conn.createStatement();
	st5=conn.createStatement();	
	stmtinsert=conn1.createStatement();
	
	para=request.getParameter("parameter");
	tno=request.getParameter("tno");
	vehno=request.getParameter("vehno");
	transporter=request.getParameter("transporter");
	location=request.getParameter("location");
	thedate=request.getParameter("calender");
    technician=request.getParameter("techname");
	oldlocation=request.getParameter("oldlocation");
	loddate=request.getParameter("oldavaildate");
	
	String attadddet1= request.getParameter("attadddet");
	if(location.equals("Other"))
	{
		location=request.getParameter("addpass");
		System.out.println("attadd --- >  "+location);
	}
	
	
	
	String contnum1 = request.getParameter("contnum");
	String contdets = request.getParameter("contdets");
	String vehicleavailable = request.getParameter("vehavail");
	System.out.println("vehicleavailable:-"+vehicleavailable);
	String comment = request.getParameter("comnt");

	String  tid=request.getParameter("tid");
	System.out.println("tid"+tid);
	String  vid=request.getParameter("vid");
	
	//*************************Added By Veena*****************************************************
	
	String Loc=request.getParameter("addpass");
	System.out.println("Location To add  is  "+Loc);
	sql2="select * from t_location where LName='"+Loc+"'";
	ResultSet RS=st.executeQuery(sql2);
	   if(!RS.next())
	   {sql3="insert into t_location (LName) values ('"+Loc+"')";
	   st1.executeUpdate(sql3);
	   }
	
   //*********************************************************************************************
	
if("Yes".equalsIgnoreCase(vehicleavailable)||vehicleavailable.equalsIgnoreCase("Yes")){
	
	
	
	System.out.println("Inside if veh availbale yes");

	try{
	
		
		if(tid==null || tid.equals("-"))
		{
		
		sql="insert into db_CustomerComplaints.t_reallocated (TicketID,Tno,VehRegNo,Transporter,NewAvailableDate,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason) values('0','"+tno+"','"+vehno+"','"+transporter+"','"+thedate+"','"+location+"','"+technician+"','"+insertdatetime+"','"+loddate+"','"+oldlocation+"','"+oldtechnician+"','"+user+"','"+rsn+"')";	
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");			
		System.out.println("sqlsqlsqlsqlsqlsqlsql11111:-"+sql);
		st.executeUpdate(sql);
	    stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		}
		else
		{
			sql="insert into db_CustomerComplaints.t_reallocated (TicketID,Tno,VehRegNo,Transporter,NewAvailableDate,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason) values('"+tid+"','"+tno+"','"+vehno+"','"+transporter+"','"+thedate+"','"+location+"','"+technician+"','"+insertdatetime+"','"+loddate+"','"+oldlocation+"','"+oldtechnician+"','"+user+"','"+rsn+"')";	
			String abcd=sql.replace("'","#");	
			abcd=abcd.replace(",","$");			
			System.out.println("sqlsqlsqlsqlsqlsqlsql11111:-"+sql);
			st.executeUpdate(sql);
		    stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		}
		
	}
	catch(Exception e)
	{
		System.out.println("inside 1121231");
		e.printStackTrace();
		System.out.println("HEree");
	}
		
		
		
		
		
	

	
	System.out.println("sql-1-->" + sql);
	//out.print(sql);
	
	
	
	String sql1="select * from t_complaints1 where Tno='"+tno+"' ";
	ResultSet rs1=st.executeQuery(sql1);
	if(rs1.next())
	{
		dofcomplaint=rs1.getString("Tdydate");
		vehno=rs1.getString("VehicleNo");
	}

	if(probsnc.equals(null))
	{
		 probsnc="-";
	}else
	{
		probsnc=probsnc;
	}
	
	String tech=request.getParameter("techname");
	
//	//System.out.println("tech--->" + tech);
	////System.out.println("tech---->" +  tech);
	String CompInsp = request.getParameter("CompInsp");
	////System.out.println("CompInsp--->" + CompInsp);
	String sendmsg = request.getParameter("MsgSend");
	////System.out.println("sendmsg---->" +  sendmsg);
	String allocatedby = session.getAttribute("username").toString();
	//String contdets=request.getParameter("contdets"); 
	////System.out.println("contdets--->" + contdets);
	
	////System.out.println("contdets--->" +  contdets);

	if (sendmsg!=null)
	{
		
		String sql ="select MobNo from t_techlist where TechName= '" + tech + "'";
		ResultSet rs6 = stmt2.executeQuery(sql);
	
		if (rs6.next())
		{
			String phnumber = rs6.getString("MobNo");
			//String phnumber = "8275829983";
			if(phnumber!=null)
			{
			phnumber=phnumber.replaceAll("91"," ");
			phnumber="91"+phnumber.trim();
			}
				
			String temp = loddate;
			String tempdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(thedate));
			//String textmsg= "No.:" + vehno + ",Transporter:"+ transporter +", Address: " + location +", Available Date: " +tempdate +" Allocated By: "+allocatedby +" , Contact Details :" + contdets;
			
			//String orgMsg= vehno + ", "+ transporter +", " + location +", " +tempdate +", "+allocatedby+", "+ contdets;
			//String orgMsg=  veh + "\n"+ trans +"\n"  +tempdate +"\n" +contdets+ "\n" +contnum1+ "\n" +attadddet1 + "\n" +attadd ;
		
			String orgMsg= vehno + "\n"+ transporter +"\n" +tempdate +"\n"+ contdets+"\n" + contnum1+"\n" + location + "\n" + attadddet1 ;
			
			String textmsg="-",inserMsg="-";
			if(orgMsg.trim().length()>=160)
				{
				
				textmsg= orgMsg.substring(0,159);
				inserMsg=textmsg;
				}
			else
			{
				textmsg=orgMsg;
				inserMsg="-";	
			}
			
			
			
			String smsurl ="";
            
            try
            {
               
               //String sqlsms="select Url from db_gps.t_SmsGatewayUrl";
            String sqlsms="select Url from db_gps.t_TransactionSmsGatewayUrl";
             ResultSet  rsnd=st5.executeQuery(sqlsms);
            System.out.println("sqlsms...  "+sqlsms);
               
            if(rsnd.next())
              {
                    
                 smsurl = rsnd.getString("Url");
                    
               }
            //    smsurl=" http://BULK.SMS-INDIA.IN/send.php?usr=sms@myfleetview.com&pwd=987456&ph="+numbers+"&text="+sms;
               
               
            }
            catch(Exception e)
            {
                System.out.println("Exception in READING SMS...  "+e);
               
            }
               System.out.println("smsurl==>"+smsurl);
           
             System.out.println("NUMBERS NUMBERS ==>"+phnumber);
            
            try
            {
                textmsg=URLEncoder.encode(textmsg,"UTF-8");
                smsurl=smsurl.replaceAll("\\+", "");
                smsurl=smsurl.replaceAll("numbers",phnumber);
                smsurl=smsurl.replaceAll("sms",textmsg);
                smsurl=smsurl.replaceAll("\"","");
                smsurl=smsurl.replaceAll(" ","+");
           
            }catch(Exception e)
            {
                System.out.println("Exception  in  parsing SMS URl==>"+e);   
               
            }
           
           
            System.out.println("FINAL  SMS URL==>"+smsurl);
           
            
            
            textmsg=textmsg.replace("-", " ");
			textmsg=textmsg.replace("'", " ");
			textmsg=textmsg.replace(";", " ");
			textmsg=textmsg.replace("&", " ");
			textmsg=textmsg.replace("@", " ");
			textmsg=textmsg.replace("<>", " ");
			textmsg=URLEncoder.encode(textmsg,"UTF-8");
           
         
            System.out.println("the sms is :- "+textmsg);
            System.out.println("and msg is  :- "+textmsg);
         
           
            System.out.println("smsurl FINAL 1212212==>"+smsurl);
           
            try{
           
             URL url=new URL(smsurl);
            
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            //String cookie = urlconnection.getHeaderField("Set-Cookie"); 
            urlconnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5"); 
            urlconnection.setRequestProperty("Accept", "*/*"); 
            //urlconnection.setRequestProperty("Cookie", cookie); 
            urlconnection.setRequestMethod("GET"); 
            System.out.println("222=#############=>");
           
          
            urlconnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
            urlconnection.setDoOutput(true);
        
         
         
            urlconnection.connect();
            BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null )
            {
                System.out.println("line==>"+line);
                //msgid=line;
            }
			
            }catch(Exception e3)
            {
            	System.out.println("Exceptions in HTTPURLConnection-->"+e3);
            }
			
			
			String insert_Date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tempdate));	
			//msg.Send(textmsg,phnumber);
			//msg.Send(textmsg,"9922894506");
			Calendar cal = Calendar.getInstance();
			
			String current_tm = new SimpleDateFormat("hh:mm:ss").format(cal.getTime());
			String current_dt = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			
			String current_dt_tm = current_dt +" " + current_tm;
			
			//String str = "INSERT INTO `db_CustomerComplaints`.`t_ComplaintAllocationSMS` (`VehicleNo` ,`VehAttLoc` ,`Transporter` ,`ContDets` ,`VehAvaildate` ,`AllotedBy`) VALUES ('"+ vehno +"', '"+ location +"', '"+transporter+ "', '" + contdets + "', '"+ loddate + "', ' " + allocatedby +"')";
			////System.out.println("current_dt_tm--->" + current_dt_tm);
			String str="";
			
			if(loddate==null || loddate.equals("-") || loddate.equals("null") || loddate==" ")
			{
				loddate="0";
			}
			//ContDetsNumber='"+contnum1+"'
			
			if(tid==null || tid.equals("null") || tid.equals("-")){
			
			 str = "INSERT INTO `t_ComplaintAllocationSMS` (`VehicleNo`, `VehAttLoc`, `VehAttLocDetails`,`Transporter`, `ContDets`, `ContDetsNumber`,`VehAvaildate`, `AllotedBy`, `TechName`, `Tno`, `Complaint_date`, `data_type`,`reason`,OriginalMsg) VALUES('"+ vehno +"', '" + location +"','" + attadddet1 +"', '"+transporter+"', '"+ contdets +"', '"+contnum1+"' ,'"+loddate+"', '"+allocatedby+"', '"+technician+"',"+ tno +", '"+ current_dt_tm + "', 'reallocation','" + rsn +"','"+inserMsg+"')";
			
			}else{
				
				 str = "INSERT INTO `t_ComplaintAllocationSMS` (`TicketID`,`VehicleNo`, `VehAttLoc`, `VehAttLocDetails`,`Transporter`, `ContDets`,`ContDetsNumber`, `VehAvaildate`, `AllotedBy`, `TechName`, `Tno`, `Complaint_date`, `data_type`,`reason`,OriginalMsg) VALUES('"+ tid +"','"+ vehno +"', '" + location +"','" + attadddet1 +"', '"+transporter+"', '"+ contdets +"', '"+contnum1+"', '"+loddate+"', '"+allocatedby+"', '"+technician+"',"+ tno +", '"+ current_dt_tm + "', 'reallocation','" + rsn +"','"+inserMsg+"')";	
				
				
			}
			
			//Query for t_sqlquery
   			String abcd1=str.replace("'","#");	
   			abcd1=abcd1.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
			System.out.println("str---->" +  str);
			int i = stmt5.executeUpdate(str);
		}//end of if (rs6.next())
	}//end of if (CompInsp.equals("Complaint") && sendmsg!=null)
		
	String sql_new="";
	if(tid==null || tid.equals("null") || tid.equals("-")){
		sql_new="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, ProbSince, VehRegNo, VehAvailDate) values ('"+tno+"', '"+transporter+"', '"+dofcomplaint+"', '"+insertdatetime1+"', '"+technician+"', 'Unsolved','"+probsnc+"', '"+vehno+"', '"+thedate+"')";
	}else{
		
		sql_new="insert into t_callocation1 (TicketID,Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, ProbSince, VehRegNo, VehAvailDate) values ('"+tid+"','"+tno+"', '"+transporter+"', '"+dofcomplaint+"', '"+insertdatetime1+"', '"+technician+"', 'Unsolved','"+probsnc+"', '"+vehno+"', '"+thedate+"')";
		
		
	}
	
	//Query for t_sqlquery
		String abcd2=sql.replace("'","#");	
		abcd2=abcd2.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
	st.executeUpdate(sql_new);
	
	//System.out.println(">>>sql_new 222<<<"+sql_new);

if(tid==null || tid.equals("null") || tid.equals("-")){
		
		//System.out.println(">>>IF LOOP<<");
		
		
	}else {
	
		//System.out.println(">>>IF LOOP$$$$$$$$$$$<<");
	
	String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Re-allocation','"+comment+"','"+user+"','"+vid+"','"+vehno+"','"+transporter+"') ";
	st.executeUpdate(sqlths);
	//System.out.println(">>>sqlths@@@@@<<<"+sqlths);
	}
	
	
	
	
	sql="update t_complaints1 set TdyDate='"+insertdatetime1+"', VehAvailDate='"+thedate+"',RegBy='"+user+"',VehAttLoc='"+location+"',ContDets='"+contdets+"', ContDetsNumber='"+contnum1+"',VehAttLocDetails='"+attadddet1+"'  where Tno='"+tno+"'";
	//Query for t_sqlquery
		String abcd3=sql.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
	
	st.executeUpdate(sql);
	//System.out.println(">>>sql 222<<<"+sql);

	String vehavail=request.getParameter("vehavail");
	if(vehavail.equals("Yes"))	
	{
		response.sendRedirect("action1.jsp?tno="+tno+"&tech="+technician+"&vehno="+vehno+"&inserted=yes&parameter="+para);
		return;		
	}
	else
	{
		response.sendRedirect("liveticketreport.jsp?owner="+transporter);
		return;
	}
}else{
	
	
	String sql_new="";
	
	if(tid==null || tid.equals("-")){
	
	sql_new="insert into t_reallocated (Tno,VehRegNo,Transporter,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason,comment,contactdetails) values('0','"+vehno+"','"+transporter+"','VehNotAvailable','VehNotAvailable','"+insertdatetime+"','"+loddate+"','"+oldlocation+"','"+oldtechnician+"','"+user+"','"+rsn+"','"+comment+"','"+contdets+"')";
	
	}else{
		
	sql_new="insert into t_reallocated (TicketID,Tno,VehRegNo,Transporter,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason,comment,contactdetails) values('"+tid+"','"+tno+"','"+vehno+"','"+transporter+"','VehNotAvailable','VehNotAvailable','"+insertdatetime+"','"+loddate+"','"+oldlocation+"','"+oldtechnician+"','"+user+"','"+rsn+"','"+comment+"','"+contdets+"')";	
		
	}
	
	
	
		System.out.println(">>>sql_new<<<"+sql_new);
		//System.out.println(">>>sql<<<"+sql);
	
	
	//Query for t_sqlquery
		String abcd=sql_new.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
	st.executeUpdate(sql_new);
	
	//System.out.println(">>>sql_new1111111111<<<"+sql_new);
	out.print(sql);

	String sql1="select * from t_complaints1 where Tno='"+tno+"' ";
	//System.out.println(">>>sql_new1<<<"+sql1);
	
	ResultSet rs1=st.executeQuery(sql1);
	if(rs1.next())
	{
		dofcomplaint=rs1.getString("Tdydate");
		vehno=rs1.getString("VehicleNo");
	}

	
	
	String tech=request.getParameter("techname");
	
//	//System.out.println("tech--->" + tech);
	////System.out.println("tech---->" +  tech);
	String CompInsp = request.getParameter("CompInsp");
	////System.out.println("CompInsp--->" + CompInsp);

	String allocatedby = session.getAttribute("username").toString();
	//String contdets=request.getParameter("contdets"); 
	////System.out.println("contdets--->" + contdets);
	
	////System.out.println("contdets--->" +  contdets);
		//String contnum1 = request.getParameter("contnum");
	
	sql="update t_complaints1 set TdyDate='"+insertdatetime1+"',RegBy='"+user+"',ContDets='"+contdets+"',ContDetsNumber='"+contnum1+"' where Tno='"+tno+"'";
	//Query for t_sqlquery
		String abcd3=sql.replace("'","#");	
		abcd3=abcd3.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
	
	st.executeUpdate(sql);
	
	//System.out.println(">>>sql<<<"+sql);
	if(tid==null || tid.equals("null") || tid.equals("-")){
		
		//System.out.println(">>>IF LOOP<<");
		
		
	}else {
	
		//System.out.println(">>>IF LOOP$$$$$$$$$$$<<");
	
	String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Re-allocation','"+comment+"','"+user+"','"+vid+"','"+vehno+"','"+transporter+"') ";
	st.executeUpdate(sqlths);
	//System.out.println(">>>sqlths@@@@@<<<"+sqlths);
	}
	
	
	String vehavail=request.getParameter("vehavail");
	if(vehavail.equals("Yes"))	
	{
		response.sendRedirect("action1.jsp?tno="+tno+"&tech="+technician+"&vehno="+vehno+"&inserted=yes&parameter="+para);
		return;		
	}
	else
	{
		response.sendRedirect("fullfleet.jsp?transporter="+transporter);
		return;
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