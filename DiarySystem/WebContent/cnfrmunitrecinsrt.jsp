<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
%>

<%
try{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),st=con1.createStatement(), stmt2=con2.createStatement(),stmt3=con2.createStatement(),stmt4=con2.createStatement();
	Statement stmtinsert=con2.createStatement();
	String sql1="", sql2="";
	int chkdcntr=0;
	String flag="true";
	boolean insert=false; 
	String notinserted="0";
	String entby=session.getValue("username").toString();
System.out.println("UserName--->"+entby);
	java.util.Date tdydate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	String s=formatter.format(tdydate);

	java.util.Date tdydate1 = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("HH:mm:ss");
	String s1=formatter1.format(tdydate);
	
	int cntr=Integer.parseInt(request.getParameter("cntr"));

	String[] chkbox=new String[cntr];
	String[] id = new String[cntr];
	String[] unitid = new String[cntr];
	
	for(int i=0;i<cntr;i++)
	{
		 chkbox[i] = request.getParameter("cb"+i );
		 if(chkbox[i]==null)
   		{
       		}
   		else
   		{
			chkdcntr++;
			flag="false";
   		} 	
	}

	if(flag.equals("true"))
	{
   		response.sendRedirect("confrmunitrec.jsp?nocbselected=true");
	        return;
	}
	else
	{
		String[] x = new String[cntr];
		
		for(int k=0;k<cntr;k++)
		{
			x[k] = request.getParameter("cb"+k );
				
			if(x[k]==null)
       			{
    	
     		        }
			else
       			{
				id[k] = request.getParameter("id"+k ); 
				unitid[k] = request.getParameter("unitid"+k ); 
				
				String que="Select * FROM t_techspecialrep where UnitId='"+unitid[k]+"' and Closed='No'";
			//	System.out.println(que);
				ResultSet rsget=st.executeQuery(que);
				if(rsget.next())
				{
					notinserted=unitid[k]+","+notinserted;
				}
				else
				{
				System.out.println("Unit ID-->"+id[k]);
				sql1="update t_unitreceived set InTransit='No', RDate='"+s+"',Rcevd='Closed', Rtime='"+s1+"', EntBy='"+entby+"',TypeValue = '2' where SrNo='"+id[k]+"'";
				System.out.println("SQL1 -->"+sql1);
				//Query for t_sqlquery
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
				//out.print(sql1);
				stmt1.executeUpdate(sql1);

				sql2="update t_unitmaster set HoldBy='2', Status='Received',RecByTech='No',RecByCust='No',RecConfirmByRep='-',EntBy='"+entby+"' where UnitId='"+unitid[k]+"' ";
				//Query for t_sqlquery
	   			String abcd1=sql2.replace("'","#");	
	   			abcd1=abcd1.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into db_gps.t_sqlquery (dbname,query) values ('db_gps','"+abcd1+"')");
				stmt2.executeUpdate(sql2);
				
				String rno="0", simno="", mobno="", hldby="", simcomp="",user="", status="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="0";
				
				String sqlum="select * from db_gps.t_unitmaster where UnitId='"+unitid[k]+"' ";
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
				
				String sqlinsrt="insert into db_gps.t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, HoldBy, EntBy,RecByTech,RecByCust) values ('"+rno+"', '"+s+"', '"+s1+"', '"+unitid[k]+"', '"+simno+"','"+simcomp+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"', '"+status+"','"+hldby+"', '"+entby+"','No','No') ";
				//Query for t_sqlquery
	   			String abcd2=sqlinsrt.replace("'","#");	
	   			abcd2=abcd2.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
				out.println(sqlinsrt);
				int i=stmt4.executeUpdate(sqlinsrt);
				if(i!=0)
					insert=true;
       			}
				
				
				
			}
		}
		con1.close();	
		con2.close();	
		
		if(!notinserted.equals(""))
		{
			notinserted=notinserted.substring(0,notinserted.length()-1);
		}
		System.out.println("notinserted is --------->"+notinserted);
		response.sendRedirect("confrmunitrec.jsp?inserted="+insert+"&notinserted="+notinserted);
		return;
	}	
	

	
	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();
	con2.close();
}
%>

