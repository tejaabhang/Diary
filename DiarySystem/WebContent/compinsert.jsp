	
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" 
     import=" java.text.*" 
     import=" java.util.*" 
     errorPage="" 
     import="java.io.BufferedReader"
     import="java.io.InputStreamReader"
	 import="java.net.URL"
	 import="java.net.URLConnection"
	 import="java.net.HttpURLConnection"
     import="java.net.URLEncoder" %>
	
<%@ include file="header.jsp" %>


<%!
Connection con1,con2;
%>
 
<% 
try {
	
	Class.forName(MM_dbConn_DRIVER);
	con1= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement(), stmt5=con1.createStatement(),stmt6=con1.createStatement();
	Statement stmtinsert=con2.createStatement();
	String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";
	ResultSet rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs8=null, rs9=null;

	String trans="",para="", veh="", comptyp="", probsnc="", probdec="", attadd="", vehavldte="", tdydate="", attadddet1="", contnum1="",contdets1="";
	String location="", tech="", othcomp="", deb="", unitid="",tid="";
	String rep=session.getValue("username").toString();
	int tno=0, cntloc=0;

	java.util.Date d=new java.util.Date();
   	String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   	Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   	String nwfrmtdte=formatter.format(datefrmdb);
   	para=request.getParameter("parameter");
	trans=request.getParameter("translist"); 
	veh=request.getParameter("vehlist"); 
	othcomp=request.getParameter("cat");
	probsnc=request.getParameter("calender"); 
	probdec=request.getParameter("probdesc"); 
	attadd=request.getParameter("attadd");
	System.out.println("attadd is ---??????" + attadd);
	//attadd=request.getParameter("attadd1");
	if(attadd.equals("Other"))
{
	attadd=request.getParameter("attadd1");
	System.out.println("attadd --- >  "+attadd);
}
	
	
	
	attadddet1=request.getParameter("attadddet").trim();
	contnum1=request.getParameter("contnum").trim();
	vehavldte=request.getParameter("calender1"); 
	unitid=request.getParameter("unitid"); 
	tech=request.getParameter("techname"); 
	String vid=request.getParameter("vid");
	String CompInsp = request.getParameter("CompInsp");
	String sendmsg = request.getParameter("MsgSend");
	String allocatedby = session.getAttribute("username").toString();
	String contdets=request.getParameter("contdets").trim(); 
	tid=request.getParameter("tid"); 
	String comptype =request.getParameter("comptype"); 
	System.out.println("attadd is ---??????" + attadd);
	//System.out.println("othcomp>>>"+othcomp);
	//System.out.println("tid>>>"+tid);
	//System.out.println("comptype>>>"+comptype);
	
	String probsnc1="";
	
 	//System.out.println(">>>HIIIII>>>");
if(null==othcomp || othcomp.equals(""))
{
  comptyp=deb; 
}
else
{ 
	deb=deb+","+othcomp;
	if(tid!=null || tid.equals("null") || tid.equals("-")){
		sql3="insert into t_complainttypenew(cname)values('"+othcomp+"') ";
	}else{
		
		
		sql3="insert into t_complainttypenew(cname,TicketID)values('"+othcomp+"','"+tid+"') ";
	}
	
	
	//Query for t_sqlquery
		String abcd=sql3.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
  	stmt1.executeUpdate(sql3);
  	//System.out.println(">>>sql3<<<"+sql3);
	comptyp=deb; 
}

sql8="select * from t_complaints1 where VehicleNo='"+veh+"' and Result='Unsolved' ";
//out.print(sql8);
rs8=stmt1.executeQuery(sql8);
//System.out.println(">>>sql8<<<"+sql8);
if(rs8.next())
{
  response.sendRedirect("addcomplaint.jsp?alrdyinsrtd=yes&="+vid+"&parameter="+para);
  return;

}
else
{
	//out.println(probsnc);
	probsnc1=probsnc;//new SimpleDateFormat("yyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(probsnc));
	
	//System.out.println(">>>>>>"+tid);
	////System.out.println(">>>"+!(tid.contains(null)));
	
	//System.out.println(">>>>1111>>"+(tid.equals("null")));
	if(tid==null || tid.equals("null") || tid.equals("-")){
		//System.out.println(">>>if<<11<");
		sql1="insert into t_complaints1 (CDate, TdyDate, Customer, UnitNo, VehicleNo, Complaint, Status, Regby, Result, CDescription, VehAttLoc,VehAttLocDetails, ContDets,ContDetsNumber, VehAvailDate) values ('"+probsnc1+"', '"+nwfrmtdte+"', '"+trans+"', '"+unitid+"', '"+veh+"', '"+comptype+"', 'Allocated', '"+rep+"', 'Unsolved', '"+probdec+"', '"+attadd+"','"+attadddet1+"', '"+contdets+"','"+contnum1+"', '"+vehavldte+"')";	
		
		
	}else{
		//System.out.println(">>>else<<<");
		
		 sql1="insert into t_complaints1 (CDate, TdyDate, Customer, UnitNo, VehicleNo, Complaint, Status, Regby, Result, CDescription, VehAttLoc, VehAttLocDetails, ContDets, ContDetsNumber, VehAvailDate ,TicketID) values ('"+probsnc1+"', '"+nwfrmtdte+"', '"+trans+"', '"+unitid+"', '"+veh+"', '"+comptype+"', 'Allocated', '"+rep+"', 'Unsolved', '"+probdec+"', '"+attadd+"','"+attadddet1+"', '"+contdets+"', '"+contnum1+"','"+vehavldte+"' ,'"+tid+"')";
	}  
	
	
   
   
   //Query for t_sqlquery
		String abcd1=sql1.replace("'","#");	
		abcd1=abcd1.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
   stmt1.executeUpdate(sql1);
   //System.out.println(">>>sql1<<<"+sql1);

   sql2="select max(Tno) from t_complaints1 ";
   rs2=stmt1.executeQuery(sql2);
   //System.out.println(">>>sql2<<<"+sql2);
   if(rs2.next())
   {
     tno=rs2.getInt("max(Tno)");
   }

   sql9="select * from t_complaints1 where Tno='"+tno+"' ";
   rs9=stmt1.executeQuery(sql9);
   //System.out.println(">>>sql9<<<"+sql9);
   if(rs9.next())
   {
      tdydate=rs9.getString("Tdydate");
   }

   if(tid==null || tid.equals("null") || tid.equals("-")){      
	   sql6="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, ProbSince, VehRegNo, VehAvailDate) values ('"+tno+"', '"+trans+"','"+nwfrmtdte+"', '"+tdydate+"', '"+tech+"', 'Unsolved', '"+probsnc1+"', '"+veh+"', '"+vehavldte+"') ";
   }else{
	   
	   //System.out.println(">>>else loop@@@@<<<"+sql2);
	  
	   sql6="insert into t_callocation1 (TicketID,Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, ProbSince, VehRegNo, VehAvailDate) values ('"+tid+"','"+tno+"', '"+trans+"','"+nwfrmtdte+"', '"+tdydate+"', '"+tech+"', 'Unsolved', '"+probsnc1+"', '"+veh+"', '"+vehavldte+"') ";
	   
   }
  // out.print("==>"+sql6);
   
   
   //Query for t_sqlquery
			String abcd2=sql6.replace("'","#");	
			abcd2=abcd2.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
        stmt3.executeUpdate(sql6);
        //System.out.println(">>>sql6<<<"+sql6);
}


out.print(">>>tid<<<"+tid);
if(tid==null || tid.equals("null") || tid.equals("-")){
	
	out.print("Inside IF LOOp");
	
}else{

	out.print("Inside else LOOp");

  String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Complaint','"+probdec+"','"+allocatedby+"','"+vid+"','"+veh+"','"+trans+"') ";
  stmt1.executeUpdate(sqlths);
  //System.out.println(">>>sqlths<<<"+sqlths);
 // out.print(">>>sqlths<<<"+sqlths);
  out.print(sqlths);
  }
  
    
if (sendmsg!=null)
{
	String sql ="select MobNo from t_techlist where TechName= '" + tech + "'";
	rs6 = stmt2.executeQuery(sql);
	//System.out.println(">>>sql<<<"+sql);

	if (rs6.next())
	{
		String phnumber = rs6.getString("MobNo");
		//String phnumber = "8275829983";
		if(phnumber!=null)
		{
		phnumber=phnumber.replaceAll("91"," ");
		phnumber="91"+phnumber.trim();
		}
		
		String temp = vehavldte;
		String tempdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(temp));
		//String textmsg= veh + ", "+ trans +", " + attadd +", " +tempdate +", " + contdets +" , "+allocatedby;
		//String orgMsg= "VehNo:"+ veh + ", "+ "Transp:"+trans +", " + "Loc:"+attadd +", " +"Avail.Date:"+tempdate +", "+"Alloc by:"+allocatedby+", "+"Contact:" +contdets+ ", "+ "Contact Num:"+contnum1+ "," + "Loc Detail:"+attadddet1;
		String orgMsg=  veh + "\n"+ trans +"\n"  +tempdate +"\n" +contdets+ "\n" +contnum1+ "\n" +attadddet1 + "\n" +attadd ;
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
			
			
			String smsUrl="",sms="";
			//phnumber="9561031265";
         try{
        	 String sqlsms="select Url from db_gps.t_TransactionSmsGatewayUrl";
				//String sqlsms="select Url from db_gps.t_SmsGatewayUrl";
				ResultSet rst=stmt6.executeQuery(sqlsms);
				if(rst.next())
				{
					smsUrl=rst.getString("Url");
				}
								
			}catch(Exception ex){
				System.out.println("Exception in sms sending code"+ex);
			}

         System.out.println("smsurl==>" + smsUrl);
         System.out.println("NUMBERS NUMBERS ==>" + phnumber);
         
         try{
        	 textmsg=URLEncoder.encode(textmsg,"UTF-8");
        	 smsUrl=smsUrl.replaceAll("\\+", "");
        	 smsUrl=smsUrl.replaceAll("numbers", phnumber);
        	 smsUrl=smsUrl.replaceAll("sms", textmsg);
        	 smsUrl=smsUrl.replaceAll("\"", "");
        	 smsUrl=smsUrl.replaceAll(" ", "+");
        	 
         }catch(Exception e){
        	 System.out.println("exception in url:-"+e);
         }
         
         textmsg=textmsg.replace("-"," ");
         textmsg=textmsg.replace(";"," ");
         textmsg=textmsg.replace("@"," ");
         textmsg=textmsg.replace("&"," ");
         textmsg = textmsg.replace("<>", " ");
         textmsg = textmsg.replace("[", " ");
         textmsg = textmsg.replace("]", " ");
         textmsg=URLEncoder.encode(textmsg,"UTF-8");
         
         
         try
         {
           URL url = new URL(smsUrl);

           HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();

           urlconnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
           urlconnection.setRequestProperty("Accept", "*/*");

           urlconnection.setRequestMethod("GET");
           //System.out.println("222=#############=>");

           urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
           urlconnection.setDoOutput(true);

           urlconnection.connect();
           BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
           String line;
           while ((line = in.readLine()) != null)
           {
            // String line;
             System.out.println("line==>" + line);
             //msgid = line;
           }

           System.out.println("******SMS IS BEEN SENT************ =>");

           //System.out.println("4444==>");
         }
         catch (Exception ex)
         {
           System.out.println("****IO EXCEPATION FOR SMS SENDING===>" + ex);
         }
         
         
			
			/* textmsg=textmsg.replace("-", " ");
			textmsg=textmsg.replace("'", " ");
			textmsg=textmsg.replace(";", " ");
			textmsg=textmsg.replace("&", " ");
			textmsg=textmsg.replace("@", " ");
			textmsg=textmsg.replace("<>", " ");
			textmsg=URLEncoder.encode(textmsg);
			//http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=vikram&sender=Demo&cdmasender=&to=919762000537&message=Hello

			//String smsurl="http://india.timessms.com/receiverCommon.asp?outLogin=Transworld&outPWD=vikram&outMSG="+sms+"&outNumber="+numbers+"&sign=diary";
		//	String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=vikram&sender=Demo&cdmasender=&to="+phnumber+"&message="+textmsg;
			String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=diary&to="+phnumber+"&message="+textmsg+"&gateway=regular";
			URL url=new URL(smsurl);
			URLConnection connection = url.openConnection();
			connection.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			
		    while ((line = in.readLine()) != null ) 
		    {
		    	//System.out.println(line);
		    		
		    }
 */
 
 
    String insert_Date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tempdate));
		//msg.Send(textmsg,phnumber);
		//msg.Send(textmsg,"9922894506");
		
		Calendar cal = Calendar.getInstance();
		String current_tm = new SimpleDateFormat("hh:mm:ss").format(cal.getTime());
		String current_dt = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		
		String current_dt_tm = current_dt +" " + current_tm;
		String str="";
		//if(tid!=null || tid.equals("-") || tid.equals("null")){
			// str = "INSERT INTO `t_ComplaintAllocationSMS` (`VehicleNo`, `VehAttLoc`, `Transporter`, `ContDets`, `VehAvaildate`, `AllotedBy`, `TechName`, `Tno`, `Complaint_date`, `data_type`,`reason`,OriginalMsg) VALUES('"+ veh +"', '" + attadd +"', '"+trans+"', '"+ contdets +"', '"+vehavldte+"', '"+allocatedby+"', '"+tech+"',"+ tno +", '"+ current_dt_tm + "', 'allocation','-','"+inserMsg+"')";
		//}else{
			
			
			
			 str = "INSERT INTO `t_ComplaintAllocationSMS` (`TicketID`,`VehicleNo`, `VehAttLoc`, `VehAttLocDetails`, `Transporter`, `ContDets`, `ContDetsNumber`, `VehAvaildate`, `AllotedBy`, `TechName`, `Tno`, `Complaint_date`, `data_type`,`reason`,OriginalMsg) VALUES('"+tid+"', '"+veh+"', '"+attadd+"', '"+attadddet1+"','"+trans+"', '"+contdets+"','"+contnum1+"', '"+vehavldte+"', '"+allocatedby+"', '"+tech+"',"+tno+", '"+current_dt_tm+ "', 'allocation','-','"+inserMsg+"')";
		//}
		
		
		
		//Query for t_sqlquery
			String abcd3=str.replace("'","#");	
			abcd3=abcd3.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
		
		int i = stmt5.executeUpdate(str);
		//System.out.println(">>>str<<<"+str);
		
		
	}//end of if (rs6.next())
}//end of if (CompInsp.equals("Complaint") && sendmsg!=null)

 String vehavail=request.getParameter("vehavail");
	if(vehavail.equals("Yes"))	
	{
		response.sendRedirect("action.jsp?tno="+tno+"&tid="+tid+"&tech="+tech+"&vid="+vid+"&vehno="+veh+"&inserted=yes&parameter="+para);
		return;		
	}
	else
	{
		
	//	//System.out.println("yes i am here");
		// response.sendRedirect("reallocate.jsp?tno="+tno+"&err=no");
		response.sendRedirect("addcomplaint.jsp?showinsrtmsg=yes&tid="+tid+"&vid="+vid+"&parameter="+para);
		return;
		
	} 
	
	
	
	
} catch(Exception e) { out.println("Exception----->" +e);e.printStackTrace(); }

finally
{
con1.close();
con2.close();
}
%>
