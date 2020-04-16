<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,stmtinsert;
String sql,sql1,para,username,userrole,today,olddate,thedate,technician;
int tno;
String discription,prvsact,result,resultval,action,hidcomment,cust,vehno;
int cntrforAtt=0;
%>

<%@page import="javax.xml.datatype.Duration"%><html>
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
	</head>

<body>


<!--- code start here ------>
<%
java.util.Date defoultdate = new java.util.Date();
Format formatter = new SimpleDateFormat("yyyy-MM-dd");
today = formatter.format(defoultdate);
long miliseconds=defoultdate.getTime();
miliseconds=miliseconds-7000 * 60 * 60 *24;
defoultdate.setTime(miliseconds);
olddate=formatter.format(defoultdate);
String trans=request.getParameter("translist"); 

String vid=request.getParameter("vid"); 

String unitid=request.getParameter("unitid"); 
String veh=request.getParameter("vehlist"); 
String othcomp=request.getParameter("othcomp");
String rep=session.getValue("username").toString();
String probdec=request.getParameter("probdesc"); 
String attadd=request.getParameter("attadd"); 
if(attadd.equals("Other"))
{
	attadd=request.getParameter("othercolor");
	System.out.println("attadd --- >  "+attadd);
}
String vehavldte=request.getParameter("calender1");
String tech=request.getParameter("techname"); 
String cost=request.getParameter("cost");
String claimdetails=request.getParameter("claimdetails");
String hh=request.getParameter("hh");
String mm=request.getParameter("mm");
String deviceisfixed=request.getParameter("deviceisfixed");
String gpsplacement=request.getParameter("gpsplacement");
String power=request.getParameter("power");
String jrm=request.getParameter("jrm");
para=request.getParameter("parameter");
username=session.getAttribute("username").toString();
userrole=session.getAttribute("userrole").toString();
technician=request.getParameter("technician");
discription=request.getParameter("desccomp");
prvsact=request.getParameter("presaction");
action=request.getParameter("act");
hidcomment=request.getParameter("hidcmnt");
result=request.getParameter("res");
resultval=request.getParameter("actsol");
thedate=request.getParameter("alocdate");
String thedate=request.getParameter("thedate");
String thedate1=request.getParameter("thedate1");
String durationOfClosure=hh+":"+mm;
//out.print(today+" "+tno+" "+technician+" "+discription+" "+prvsact+" "+action+" "+hidcomment+" "+result+" "+resultval+" "+thedate);
try{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn1.createStatement();
	stmtinsert=conn1.createStatement();
	java.util.Date dd=new java.util.Date();
   	String dte= "" + (dd.getYear()+1900) + "-" + (1+dd.getMonth()) + "-" + dd.getDate();
   	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   	Format formatter11=new SimpleDateFormat("yyyy-MM-dd");
   	String nwfrmtdte=formatter11.format(datefrmdb);
	
	String allocplace=request.getParameter("vehattadd");
	String technician=request.getParameter("technician");	
	String[] comp=request.getParameterValues("comptyp");
	
	String comptype =request.getParameter("comptype"); 
	String tid=request.getParameter("tid"); 
	
	
	//System.out.println("othcomp>>>"+othcomp);
	//System.out.println("tid>>>"+tid);
	//System.out.println("comptype>>>"+comptype);
	
	//System.out.println("prvsact>>>>>>"+prvsact);
	
	
 	String deb="",comptyp="";
	
if(null==othcomp || othcomp.equals(""))
{
  comptyp=deb; 
}
else
{ 
	deb=deb+","+othcomp;
	String sql3="";
	
	if(tid==null || tid.equals("null") || tid.equals("-")){
	 sql3="insert into t_complainttypenew(cname)values('"+othcomp+"') ";
	
	}else{
		
		sql3="insert into t_complainttypenew(cname,TicketID)values('"+othcomp+"','"+tid+"') ";
		
	}
	 
	 
	 
	 //System.out.println("first query-->"+sql3);
	//Query for t_sqlquery
		String abcd=sql3.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
  	st.executeUpdate(sql3);
  	//System.out.println(">>>sql3<<<"+sql3);
	comptyp=deb; 
}
	 
/* if(request.getParameter("attadd") == "Other")
{
	attadd = request.getParameter("othercolor");
} */
if(tid==null || tid.equals("null") || tid.equals("-")){
    sql1="insert into t_complaints1 (TdyDate, Customer, UnitNo, VehicleNo, Complaint, Status, Regby, Result, VehAttLoc, VehAvailDate,CostOfInspection,ClaimDetails,DurationOfClosure,DeviceIsFixed,GPSPleacement,PowerConnection,JRMOther,inspection) values('"+nwfrmtdte+"', '"+trans+"', '"+unitid+"', '"+veh+"', '"+comptype+"', 'Allocated', '"+rep+"', 'Unsolved', '"+attadd+"', '"+vehavldte+"','"+cost+"','"+claimdetails+"','"+durationOfClosure+"','"+deviceisfixed+"','"+gpsplacement+"','"+power+"','"+jrm+"','Yes')";
    System.out.println(">>>sql1<<<"+sql1);
}else{
	
	  sql1="insert into t_complaints1 (TicketID,TdyDate, Customer, UnitNo, VehicleNo, Complaint, Status, Regby, Result, VehAttLoc, VehAvailDate,CostOfInspection,ClaimDetails,DurationOfClosure,DeviceIsFixed,GPSPleacement,PowerConnection,JRMOther,inspection) values('"+tid+"','"+nwfrmtdte+"', '"+trans+"', '"+unitid+"', '"+veh+"', '"+comptype+"', 'Allocated', '"+rep+"', 'Unsolved', '"+attadd+"', '"+vehavldte+"','"+cost+"','"+claimdetails+"','"+durationOfClosure+"','"+deviceisfixed+"','"+gpsplacement+"','"+power+"','"+jrm+"','Yes')";
	
	  System.out.println(">>>sql1<<<"+sql1);
  }
    //Query for t_sqlquery
	 //System.out.println("Second query-->"+sql1);
			String abcd1=sql1.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
	   		st.executeUpdate(sql1);
	
	String sql2="select max(Tno) from t_complaints1 ";
	 //System.out.println("Third query-->"+sql2);
	ResultSet rs2=st.executeQuery(sql2);
	   if(rs2.next())
	   {
	     tno=rs2.getInt("max(Tno)");
	   }
	  String tdydate="";
	  String sql9="select * from t_complaints1 where Tno='"+tno+"' ";
	  //System.out.println("Fourth query-->"+sql2);
	  ResultSet rs9=st.executeQuery(sql9);
	  //System.out.println(">>>sql9<<<"+sql9);
	   if(rs9.next())
	   {
	      tdydate=rs9.getString("Tdydate");
	   }

	   
	   String sql6="";
	       
	   if(tid==null || tid.equals("null") || tid.equals("-")){
	   sql6="insert into t_callocation1 (Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, VehRegNo, VehAvailDate) values ('"+tno+"', '"+trans+"','"+nwfrmtdte+"', '"+tdydate+"', '"+tech+"', 'Unsolved', '"+veh+"', '"+vehavldte+"') ";
	    
	   }else{
		   
		   sql6="insert into t_callocation1 (TicketID,Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, VehRegNo, VehAvailDate) values ('"+tid+"','"+tno+"', '"+trans+"','"+nwfrmtdte+"', '"+tdydate+"', '"+tech+"', 'Unsolved', '"+veh+"', '"+vehavldte+"') ";  
		   
	   }
	   
	   //System.out.println("Fifth query-->"+sql6);
	       //Query for t_sqlquery
				String abcd2=sql6.replace("'","#");	
				abcd2=abcd2.replace(",","$");								
				stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd2+"')");
	        st.executeUpdate(sql6);
	        
	sql="select Action,cntrforAtt from t_complaints1 where Tno='"+tno+"' ";
	ResultSet rst=st.executeQuery(sql);
	//System.out.println(">>>sql<<<"+sql);
	if(rst.next())
		{
			prvsact=action+" "+rst.getString("Action");
			cntrforAtt=rst.getInt("cntrforAtt")+1;
		}

		sql="select * from t_complaints1 a, t_callocation1 b where a.Tno='"+tno+"' and a.Tno=b.Tno ";
   		ResultSet rst1=st.executeQuery(sql);
   		//System.out.println(">>>sql<<<"+sql);
   		if(rst1.next())
   			{
   				cust=rst1.getString("a.Customer");
     				vehno=rst1.getString("a.VehicleNo");
   			}

		sql="update t_complaints1 set Action='"+prvsact+"', Status='Attended', cntrforAtt = '"+cntrforAtt+"' where Tno='"+tno+"' ";
		//Query for t_sqlquery
		String abcd=sql.replace("'","#");	
		abcd=abcd.replace(",","$");								
		stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		
		out.print(sql+"<br>");		
		st.executeUpdate(sql); 
		//System.out.println(">>>sql update<<<"+sql);
	if(result.equals("Solved"))
		{
			sql="update t_complaints1 set Status='Solved', Result='Solved', PSolBy='"+technician+"', PSolDate='"+today+"' where Tno='"+tno+"' ";
			//Query for t_sqlquery
			String abcd11=sql.replace("'","#");	
			abcd11=abcd11.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd11+"')");			
			st.executeUpdate(sql);
			//System.out.println(">>>sql update<<<"+sql);
  			out.print(sql+"<br>");
  			
  			sql="update t_callocation1 set Status='Solved' where Tno='"+tno+"' ";
  		//Query for t_sqlquery
  			String abcd22=sql.replace("'","#");	
  			abcd22=abcd22.replace(",","$");								
  			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd22+"')");  			
  			st.executeUpdate(sql);
  			//System.out.println(">>>sql update<<<"+sql);
  			out.print(sql+"<br>");
  			
  			sql="update t_callocation1 set ActualProb ='"+resultval+"' where Tno = '"+tno+"' " ;
  		//Query for t_sqlquery
  			String abcd3=sql.replace("'","#");	
  			abcd3=abcd3.replace(",","$");								
  			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
       	st1.executeUpdate(sql);
    	//System.out.println(">>>sql update<<<"+sql);
       	out.print(sql+"<br>");
       	
       	
       	if(tid==null || tid.equals("null") || tid.equals("-")){
   			sql="insert into t_solvedcomps (Tno, Customer, VehNo, DofComp, DofAlloc, SolDate, SolBy) values ('"+tno+"', '"+cust+"','"+vehno+"','"+thedate+"','"+thedate+"','"+today+"','"+technician+"') ";
   		
       	}else{
       		
       		sql="insert into t_solvedcomps (TicketID,Tno, Customer, VehNo, DofComp, DofAlloc, SolDate, SolBy) values ('"+tid+"','"+tno+"', '"+cust+"','"+vehno+"','"+thedate+"','"+thedate+"','"+today+"','"+technician+"') ";
       		
       	}
   			String abcd4=sql.replace("'","#");	
   			abcd4=abcd4.replace(",","$");								
   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd4+"')");
   			
   			st.executeUpdate(sql);
   			//System.out.println(">>>sql last insert<<<"+sql);
       		out.print(sql+"<br>");
       		if(thedate=="")
					{
					}
				else
					{ 
						sql="update t_callocation1 set VehAvaildate ='"+thedate+"' where Tno = '"+tno+"' " ;
						//Query for t_sqlquery
						String abcd5=sql.replace("'","#");	
						abcd5=abcd5.replace(",","$");								
						stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd5+"')");
						
 						st.executeUpdate(sql);
 						//System.out.println(">>>sql update<<<"+sql);
 						out.print(sql+"<br>");
					}
					sql="select Tno,HiddenComment from t_callocation1 where Tno= '"+tno+"' ";
					ResultSet rst2=st.executeQuery(sql);
  					while(rst2.next())
  						{
    						hidcomment=hidcomment+rst2.getString("HiddenComment"); 
    						 
  						}
  						sql="update t_callocation1 set HiddenComment ='"+hidcomment+"' where Tno = '"+tno+"' " ;
  					//Query for t_sqlquery
  						String abcd6=sql.replace("'","#");	
  						abcd6=abcd6.replace(",","$");								
  						stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd6+"')");
      				st.executeUpdate(sql);  
      				//System.out.println(">>>sql update<<<"+sql);
      				out.print(sql+"<br>");
  						
		}

	if(tid==null || tid.equals("null") || tid.equals("-")){
		
		
		
	}else{
	
	
	String sqlths="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+tid+"','Inspection','"+action+"','"+rep+"','"+vid+"','"+veh+"','"+trans+"') ";
	  st.executeUpdate(sqlths);
	  //System.out.println(">>>sqlths<<<"+sqlths);
	  
	}
	
		String sprep=request.getParameter("sprep");
		if(sprep.equals("Yes"))	
		{ 
			response.sendRedirect("specialreport1.jsp?trans="+cust+"&tid="+tid+"&comptype="+comptype+"&vehno="+vehno+"&tickno="+tno+"&vehid="+vid+"&allocplace="+allocplace+"&technician="+technician);
   			return;
		}
		else
		{
			response.sendRedirect("mydiary.jsp?inserted=yes&thedate="+thedate+"&tid="+tid+"&comptype="+comptype+"&vehid="+vid+"&thedate1="+thedate1+"&parameter="+para);
			return;
		}

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	conn.close();
	conn1.close();

}
%>
		
<table border="0" width="750px" height="350px">
<tr><td></td></tr>
</table>
<!-- code end here --->

  
  <div id="copyright">
   Copyright © 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
  </div>

</body>
</html>
