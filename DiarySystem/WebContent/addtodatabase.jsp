<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="header.jsp" %>


<%!
Connection con1, con2;
Statement stmt1, stmt2,stmt3,stmt4,stmtinsert,stmtreplace,stmtreplace1,stmt5;
String dt,tm,rcdp,rfdt,nm,courier,tp,uid,transp,tech,entby,dcno,otertech,techinsert, loc, faulty,SESSION_entby="";
int h1;
String sql1, sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="";
%>

<%
String Unitids="";
dt=request.getParameter("calender");
tm=request.getParameter("rtime");
rcdp=request.getParameter("rd");
rfdt=request.getParameter("radio1");
nm=request.getParameter("cname");
courier=request.getParameter("courier");
tp=request.getParameter("radio2");
uid=request.getParameter("unitId");
transp=request.getParameter("transp");
tech=request.getParameter("techname");
String locname=request.getParameter("locname");
//entby=request.getParameter("entby");
dcno=request.getParameter("dcno");
otertech=request.getParameter("othertech");
loc=request.getParameter("loc");
//faulty=request.getParameter("faulty");

//   SESSION_entby=session.getValue("username").toString();
SESSION_entby=  session.getAttribute("username").toString();

entby=  session.getAttribute("username").toString();

if(entby.equalsIgnoreCase("Operation Executive") ||  entby == "Operation Executive")
{
	entby="a_laddha";
	
	
}



if(tp=="Defective")
{
	faulty="Yes";
}
else
	if(tp=="Ok")
{
		faulty="No";
}
//out.print(dt+"<br>"+tm+"<br>"+rcdp+"<br>"+rfdt+"<br>"+nm+"<br>"+courier+"<br>"+tp+"<br>"+uid);

h1=Integer.parseInt(request.getParameter("h1"));

try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
stmt1=con1.createStatement();
stmt2=con2.createStatement();
stmt3=con2.createStatement();
stmt4=con2.createStatement();
stmt5=con1.createStatement();
stmtinsert=con2.createStatement();
stmtreplace=con2.createStatement();
stmtreplace1=con2.createStatement();
String list="";
ResultSet rs1=null, rs2=null, rs3=null, rs5=null, rs6=null, rs7=null;
		
	if(tech.equals("Other"))
     		{
			techinsert=otertech;
		}
      	else
      	{
			techinsert=tech;
       	}	
	
	

	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydte);
	
	
	String entby_QUERY = "SELECT Name FROM t_admin WHERE UNAME LIKE '"+SESSION_entby+"'";
	ResultSet rsEntBy = stmt5.executeQuery(entby_QUERY);
	if(rsEntBy.next())
	{
		//entby = rsEntBy.getString("Name");
	}
	
	String dispdate="", recdate="";
	
	String typeval="";
	typeval=session.getValue("typevalue").toString();

	System.out.println("typeval ---->"+typeval);
	
	int days=0;
			
	try
	{
		sql1="select DispDate from t_unitmasterhistory where UnitId='"+uid+"' and Status='Dispatched' order by DispDate desc limit 1 ";
		//out.print(sql1);
		rs1=stmt2.executeQuery(sql1);
		if(rs1.next())
		{
			dispdate=rs1.getString("DispDate");
		}
		
		if(dispdate==null || dispdate.equals("-") || dispdate.equals(""))		
		{
			dispdate=s;
		}

	} catch(Exception e)
	{
	}
	
	int k=0;
	sql2="select RDate from t_unitreceived where UnitId='"+uid+"' order by RDate desc";
	rs2=stmt1.executeQuery(sql2);
	if(rs2.next())
	{
		recdate=rs2.getString("RDate");
	}
	else
	{
		String step1="",step2="No";
		String sqlstatus="select * from t_vehicledetails where UnitID='"+uid+"'";
		ResultSet rsstatus=stmtreplace1.executeQuery(sqlstatus);
		System.out.println("sqlstatus"+sqlstatus);
		if(rsstatus.next())
		{
			
			Unitids=Unitids+uid+",";
		}
		else
		{
		//check for unit is present in vehicledetails then display msg as unit is configuered in vehicle for transporter
		
		sql4="insert into t_unitreceived(Rdate,Rtime,ReceiveFrom,Name,Utype,UnitId,Transporter,Location,Faulty,Courier,TechName,EntBy,DC_NO,Lname,TypeValue) values('"+dt+"','"+tm+"','"+rfdt+"','"+nm+"','"+tp+"','"+uid+"','"+transp+"','"+loc+"', '"+faulty+"', '"+courier+"','"+techinsert+"','"+entby+"','"+dcno+"','"+locname+"','"+typeval+"')";
		//Query for t_sqlquery
			String abcd=sql4.replace("'","#");	
			abcd=abcd.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
		out.print("sql40="+sql4);
		k=stmt1.executeUpdate(sql4);

		//sql2="update t_unitmaster set HoldBy='Transworld',user='Transworld',Status='Received',RecByTech='No',RecByCust='No',RecConfirmByRep='-' where UnitId='"+uid+"' ";
		sql2="update t_unitmaster set HoldBy='2',user='2',Status='Received',RecByTech='No',RecByCust='No',RecConfirmByRep='-',EntBy='"+entby+"' where UnitId='"+uid+"' ";
		//Query for t_sqlquery
			String abcd1=sql2.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
		stmt2.executeUpdate(sql2);
	
		
		 String rno="";
		 String simno="", mobno="", hldby="", simcomp="",user="", status="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="";  

		String sqlum="select * from t_unitmaster where UnitId='"+uid+"' ";
		ResultSet rsum=stmt3.executeQuery(sqlum);
		if(rsum.next())
		{
			rno=rsum.getString("Rno");
			simno=rsum.getString("SIMNo");
			mobno=rsum.getString("MobNo"); 
			simcomp=rsum.getString("SimCompany");
			neworrep=rsum.getString("InstType");
			wmsn=rsum.getString("WMSN");
			module=rsum.getString("Module");
			gps=rsum.getString("GPS");
			typeunit=rsum.getString("typeunit");
			swver=rsum.getString("swver");
			voice=rsum.getString("PVoice");
			jrmbuz=rsum.getString("PJrmBuzz");
			buzzer=rsum.getString("PBuzzer");
			temp1=rsum.getString("PTemp1");
			temp2=rsum.getString("PTemp2");
			door1=rsum.getString("PDoor1");
			door2=rsum.getString("PDoor2");
			horn=rsum.getString("PHorn");
			scard=rsum.getString("PSCard");
			flowsen1=rsum.getString("PFlowSen1");
			flowsen2=rsum.getString("PFlowSen2");
			plain=rsum.getString("Plain");
			periphs=rsum.getString("Peripherals");
			periphcode=rsum.getString("PeriphCode");
			status=rsum.getString("Status");
			user=rsum.getString("user");
			hldby=rsum.getString("HoldBy");
			
		}
		
		String sqlinsrt="insert into t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, HoldBy, EntBy) values ('"+rno+"', '"+dt+"', '"+tm+"', '"+uid+"', '"+simno+"','"+simcomp+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"', '"+status+"','"+hldby+"', '"+entby+"') ";
		//Query for t_sqlquery
			String abcd2=sqlinsrt.replace("'","#");	
			abcd2=abcd2.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
		out.println(sqlinsrt);
		stmt4.executeUpdate(sqlinsrt);
		}
	}
	
	if(recdate==null || recdate.equals("-") || recdate.equals(""))		
	{
		recdate=s;
	}	
	
	sql3="select (TO_DAYS('"+recdate+"')-TO_DAYS('"+dispdate+"'))";	
	//out.print(sql3);
	rs3=stmt1.executeQuery(sql3);
	if(rs3.next())
	{
		days=rs3.getInt(1);
	}

	System.out.print(days);	
	if(days <= 0 && k <= 0)
	{
		String step1="No",step2="No";

		String sqlstatus="select * from t_vehicledetails where UnitID='"+uid+"'";
		ResultSet rsstatus=stmtreplace1.executeQuery(sqlstatus);
		System.out.println("sqlstatus"+sqlstatus);
		if(rsstatus.next())
		{
			Unitids=Unitids+uid+",";
		}
		else
		{
		
				sql4="insert into t_unitreceived(Rdate,Rtime,ReceiveFrom,Name,Utype,UnitId,Transporter,Location,Faulty,Courier,TechName,EntBy,DC_NO,Lname,TypeValue) values('"+dt+"','"+tm+"','"+rfdt+"','"+nm+"','"+tp+"','"+uid+"','"+transp+"', '"+loc+"', '"+faulty+"', '"+courier+"','"+techinsert+"','"+entby+"','"+dcno+"','"+locname+"','2')";
			
		//Query for t_sqlquery
			String abcd3=sql4.replace("'","#");	
			abcd3=abcd3.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
		out.print("sql41="+sql4);
		stmt1.executeUpdate(sql4);

		//sql2="update t_unitmaster set HoldBy='Transworld',user='Transworld',Status='Received',RecByTech='No',RecByCust='No' where UnitId='"+uid+"' ";
		sql2="update t_unitmaster set HoldBy='2',user='2',Status='Received',RecByTech='No',RecByCust='No' ,EntBy='"+entby+"' where UnitId='"+uid+"' ";
		//Query for t_sqlquery
			String abcd4=sql2.replace("'","#");	
			abcd4=abcd4.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd4+"')");
		stmt2.executeUpdate(sql2);
		
		
		String rno="", simno="", mobno="", hldby="", simcomp="",user="", status="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="";  

		String sqlum="select * from t_unitmaster where UnitId='"+uid+"' ";
		ResultSet rsum=stmt3.executeQuery(sqlum);
		if(rsum.next())
		{
			rno=rsum.getString("Rno");
			simno=rsum.getString("SIMNo");
			mobno=rsum.getString("MobNo"); 
			simcomp=rsum.getString("SimCompany");
			neworrep=rsum.getString("InstType");
			wmsn=rsum.getString("WMSN");
			module=rsum.getString("Module");
			gps=rsum.getString("GPS");
			typeunit=rsum.getString("typeunit");
			swver=rsum.getString("swver");
			voice=rsum.getString("PVoice");
			jrmbuz=rsum.getString("PJrmBuzz");
			buzzer=rsum.getString("PBuzzer");
			temp1=rsum.getString("PTemp1");
			temp2=rsum.getString("PTemp2");
			door1=rsum.getString("PDoor1");
			door2=rsum.getString("PDoor2");
			horn=rsum.getString("PHorn");
			scard=rsum.getString("PSCard");
			flowsen1=rsum.getString("PFlowSen1");
			flowsen2=rsum.getString("PFlowSen2");
			plain=rsum.getString("Plain");
			periphs=rsum.getString("Peripherals");
			periphcode=rsum.getString("PeriphCode");
			status=rsum.getString("Status");
			user=rsum.getString("user");
			hldby=rsum.getString("HoldBy");
			//	utype="+status[i]+";
			
		}
		
		String sqlinsrt="insert into t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, HoldBy, EntBy) values ('"+rno+"', '"+dt+"', '"+tm+"', '"+uid+"', '"+simno+"','"+simcomp+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"', '"+status+"','"+hldby+"', '"+entby+"') ";
		//Query for t_sqlquery
			String abcd5=sqlinsrt.replace("'","#");	
			abcd5=abcd5.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd5+"')");
		out.println(sqlinsrt);
		stmt4.executeUpdate(sqlinsrt);
		
	
		}
	}
	else
	{
		//response.sendRedirect("Received.jsp?alrdyentered=yes&unitid="+uid);
		//return;
	}
					
		
if(h1>1)
{
	for(int i=1; i< h1; i++)
	{
		uid=request.getParameter("unitId"+i);
		System.out.println("unitid"+uid);
		transp=request.getParameter("transp"+i);
		loc=request.getParameter("loc"+i);
		faulty=request.getParameter("faulty"+i);
		
		if(uid!=null && uid.trim().length()>=0 && !(uid.equalsIgnoreCase(" ")))
		{
			String 	dispdate1="", recdate1="";	
			
			int days1=0;
		
			try
			{
				sql5="select DispDate from t_unitmasterhistory where UnitId='"+uid+"' and Status='Dispatched' order by DispDate desc limit 1 ";
				out.print(sql5);
				rs5=stmt2.executeQuery(sql5);
				if(rs5.next())
				{
					dispdate1=rs5.getString("DispDate");
				}
					
				
				if(dispdate1==null || dispdate1.equals("-") || dispdate1.equals(""))		
				{
					dispdate1=s;
				}	
			} catch(Exception e)
			{
			}	
			
			int l=0;
			sql6="select RDate from t_unitreceived where UnitId='"+uid+"' order by RDate desc";
			//out.print(sql6);
			rs6=stmt1.executeQuery(sql6);
			if(rs6.next())
			{
				recdate1=rs6.getString("RDate");
			}
			else
			{
				String sqlstatus="select * from t_vehicledetails where UnitID='"+uid+"'";
				ResultSet rsstatus=stmtreplace1.executeQuery(sqlstatus);
				System.out.println("sqlstatus"+sqlstatus);
				if(rsstatus.next())
				{
					Unitids=Unitids+uid+",";
					System.out.println("Unitids--->"+Unitids);
				}
				else
				{
						sql4="insert into t_unitreceived(Rdate,Rtime,ReceiveFrom,Name,Utype,UnitId,Transporter,Location,Faulty,Courier,TechName,EntBy,DC_NO,Lname,TypeValue) values('"+dt+"','"+tm+"','"+rfdt+"','"+nm+"','"+tp+"','"+uid+"','"+transp+"', '"+loc+"', '"+faulty+"', '"+courier+"','"+techinsert+"','"+entby+"','"+dcno+"','"+locname+"','2')";
				//Query for t_sqlquery
	   			String abcd6=sql4.replace("'","#");	
	   			abcd6=abcd6.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd6+"')");
				out.print("sql4="+sql4);
				l=stmt1.executeUpdate(sql4);


	 			sql2="update t_unitmaster set HoldBy='2',user='2',Status='Received',RecByTech='No',RecByCust='No' ,EntBy='"+entby+"' where UnitId='"+uid+"' ";
	 			//Query for t_sqlquery
	   			String abcd7=sql2.replace("'","#");	
	   			abcd7=abcd7.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd7+"')");
				stmt2.executeUpdate(sql2);
				
				
				
				String rno="", simno="", mobno="", hldby="", simcomp="",user="", status="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="";  

				String sqlum="select * from t_unitmaster where UnitId='"+uid+"' ";
				ResultSet rsum=stmt3.executeQuery(sqlum);
				if(rsum.next())
				{
					rno=rsum.getString("Rno");
					simno=rsum.getString("SIMNo");
					mobno=rsum.getString("MobNo"); 
					simcomp=rsum.getString("SimCompany");
					neworrep=rsum.getString("InstType");
					wmsn=rsum.getString("WMSN");
					module=rsum.getString("Module");
					gps=rsum.getString("GPS");
					typeunit=rsum.getString("typeunit");
					swver=rsum.getString("swver");
					voice=rsum.getString("PVoice");
					jrmbuz=rsum.getString("PJrmBuzz");
					buzzer=rsum.getString("PBuzzer");
					temp1=rsum.getString("PTemp1");
					temp2=rsum.getString("PTemp2");
					door1=rsum.getString("PDoor1");
					door2=rsum.getString("PDoor2");
					horn=rsum.getString("PHorn");
					scard=rsum.getString("PSCard");
					flowsen1=rsum.getString("PFlowSen1");
					flowsen2=rsum.getString("PFlowSen2");
					plain=rsum.getString("Plain");
					periphs=rsum.getString("Peripherals");
					periphcode=rsum.getString("PeriphCode");
					status=rsum.getString("Status");
					user=rsum.getString("user");
					hldby=rsum.getString("HoldBy");
					//	utype="+status[i]+";
					
				}
				
				String sqlinsrt="insert into t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, HoldBy, EntBy) values ('"+rno+"', '"+dt+"', '"+tm+"', '"+uid+"', '"+simno+"','"+simcomp+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"', '"+status+"','"+hldby+"', '"+entby+"') ";
				//Query for t_sqlquery
	   			String abcd8=sqlinsrt.replace("'","#");	
	   			abcd8=abcd8.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd8+"')");
				out.println(sqlinsrt);
				stmt4.executeUpdate(sqlinsrt);
				
			
				}
			}
			if(recdate1==null || recdate1.equals("-") || recdate1.equals(""))		
			{
					recdate1=s;
			}	

			sql7="select (TO_DAYS('"+recdate1+"')-TO_DAYS('"+dispdate1+"'))";	
			//out.print(sql7);
			rs7=stmt1.executeQuery(sql7);
			if(rs7.next())
			{
				days1=rs7.getInt(1);
			}
		
			if(days1 <= 0 && l<=0)
			{
				String sqlstatus="select * from t_vehicledetails where UnitID='"+uid+"'";
				ResultSet rsstatus=stmtreplace1.executeQuery(sqlstatus);
				System.out.println("sqlstatus"+sqlstatus);
				if(rsstatus.next())
				{
					Unitids=Unitids+uid+",";
				//	System.out.println("uid--->"+uid+"--Unitids--->"+Unitids);
				}
				else
				{
				sql8="insert into t_unitreceived(Rdate,Rtime,ReceiveFrom,Name,Utype,UnitId,Transporter, Location,Faulty, Courier, TechName, EntBy, DC_NO,Lname,TypeValue) values('"+dt+"','"+tm+"','"+rfdt+"','"+nm+"','"+tp+"','"+uid+"','"+transp+"', '"+loc+"', '"+faulty+"', '"+courier+"','"+techinsert+"','"+entby+"','"+dcno+"','"+locname+"','2')";
					
				//Query for t_sqlquery
	   			String abc=sql8.replace("'","#");	
	   			abc=abc.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abc+"')");
				out.print("sql8="+sql8);
				stmt1.executeUpdate(sql8);
		
				sql2="update t_unitmaster set HoldBy='2',user='2',Status='Received',RecByTech='No',RecByCust='No' ,EntBy='"+entby+"' where UnitId='"+uid+"' ";
				//Query for t_sqlquery
	   			String abc1=sql2.replace("'","#");	
	   			abc1=abc1.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abc1+"')");
				stmt2.executeUpdate(sql2);
					
				
				String rno="", simno="", mobno="", hldby="", simcomp="",user="", status="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="";  

				String sqlum="select * from t_unitmaster where UnitId='"+uid+"' ";
				ResultSet rsum=stmt3.executeQuery(sqlum);
				if(rsum.next())
				{
					rno=rsum.getString("Rno");
					simno=rsum.getString("SIMNo");
					mobno=rsum.getString("MobNo"); 
					simcomp=rsum.getString("SimCompany");
					neworrep=rsum.getString("InstType");
					wmsn=rsum.getString("WMSN");
					module=rsum.getString("Module");
					gps=rsum.getString("GPS");
					typeunit=rsum.getString("typeunit");
					swver=rsum.getString("swver");
					voice=rsum.getString("PVoice");
					jrmbuz=rsum.getString("PJrmBuzz");
					buzzer=rsum.getString("PBuzzer");
					temp1=rsum.getString("PTemp1");
					temp2=rsum.getString("PTemp2");
					door1=rsum.getString("PDoor1");
					door2=rsum.getString("PDoor2");
					horn=rsum.getString("PHorn");
					scard=rsum.getString("PSCard");
					flowsen1=rsum.getString("PFlowSen1");
					flowsen2=rsum.getString("PFlowSen2");
					plain=rsum.getString("Plain");
					periphs=rsum.getString("Peripherals");
					periphcode=rsum.getString("PeriphCode");
					status=rsum.getString("Status");
					user=rsum.getString("user");
					hldby=rsum.getString("HoldBy");
					//	utype="+status[i]+";
					
				}
				
				String sqlinsrt="insert into t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, HoldBy, EntBy) values ('"+rno+"', '"+dt+"', '"+tm+"', '"+uid+"', '"+simno+"','"+simcomp+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"', '"+status+"','"+hldby+"', '"+entby+"') ";
				//Query for t_sqlquery
	   			String abcd9=sqlinsrt.replace("'","#");	
	   			abcd9=abcd9.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd9+"')");
				out.println(sqlinsrt);
				stmt4.executeUpdate(sqlinsrt);
				list=list+uid;
				System.out.println("Unit id list---->"+list);
				
				}
			}
			else
			{	
			}
			
		}
		//java.util.Date dispdate1=new java.util.Date();
		//java.util.Date recdate1=new java.util.Date();
	
		
	}
}
con1.close();
con2.close();
System.out.println("--Unitids--->"+Unitids);




}catch(Exception e)
{
out.print("Exception"+e);
System.out.println("Unit Received :---->"+e);
}
finally
{
con1.close();
con2.close();
response.sendRedirect("Received.jsp?inserted=yes&notreceived="+Unitids);

}
%>
