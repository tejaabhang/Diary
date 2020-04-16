<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">


</script>
</head>

<%! 
Connection con1,con2;
%>

<%
try
{
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con2.createStatement();
	Statement stmtinsert=con1.createStatement();
	ResultSet rs2=null;
	String sql1="", sql2="", sql3="";
	String flag="true";
	int chkdcntr1=0, chkdcntr=0;
	int orno=0;
	
	java.util.Date dxxx = new java.util.Date();
	Format formatterxxx1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatterxxx1.format(dxxx);

	Format formatter = new SimpleDateFormat("hh:mm:ss");
	String tme=formatter.format(dxxx);
	
	String user=session.getAttribute("DisplayName").toString();
	//String typ=request.getParameter("type");
	String holdername=request.getParameter("techname");
	String cntr=request.getParameter("cntr");
	//out.println(cntr);
	String newtech=request.getParameter("techlist");
	String newcust=request.getParameter("custlist");
	String unittyp=request.getParameter("unittype");
	String comment=request.getParameter("cmnt");
	
	
	int pos=0;
	pos=comment.indexOf("'");
	if(pos>0)
	{
		comment=comment.replace("'","");
	}


	String holdbyinsrt="";

	if(newtech.equals("Select"))
	{
		holdbyinsrt=newcust;
	}
	else
	{
		holdbyinsrt=newtech;
	}

	if(unittyp.equals("Faulty"))
	{
		unittyp="Yes";
	}
	else
	{
		unittyp="No";
	}
	
	int cntrint=Integer.parseInt(cntr);
	//out.print(cntrint);

	String[] uncntchk = new String[cntrint];

	 for(int k=0; k<cntrint; k++) 
	{
   		uncntchk[k] = request.getParameter("disp"+k );

		if(uncntchk[k]==null)
   		{
     
   		}
   		else
   		{
			chkdcntr1++;
			flag="false";
   		}
	}

	if(flag.equals("true"))
 	{
		

   		response.sendRedirect("unitholdbytech1.jsp?nounitselected=true&holdername="+holdername);
   		return;
 	}
	else
 	{
		String[] unid = new String[cntrint];
		//String[] status = new String[cntrint];
		String[] x = new String[cntrint];

		for(int i=0; i<cntrint; i++) 
     		{
          		x[i] = request.getParameter("disp"+i );

          		if(x[i]==null)
         		{
    
      		        }
         		else
         		{
				chkdcntr++;
				unid[i]=request.getParameter("unitid"+i);
				//status[i]=request.getParameter("status"+i);
				String utype="";
				//out.println(unid[i]);
String sqlorno="SELECT  Reqno FROM t_unitorder ORDER BY Reqno DESC LIMIT 1";
				ResultSet rsorno=stmt4.executeQuery(sqlorno);
				while(rsorno.next())
				{
					orno=rsorno.getInt("Reqno");
					orno=orno+1;
					//out.println(orno);
				}
				sql1="update t_unitmaster set TransDate='"+tdydte+"',OrderNo='"+orno+"', HoldBy='"+holdbyinsrt+"', CommentForTransf='"+comment+"', FaultyUnit='"+unittyp+"' where UnitID='"+unid[i]+"' ";
				//Query for t_sqlquery
	   			String abcd=sql1.replace("'","#");	
	   			abcd=abcd.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd+"')");
				//out.print(sql1);
				stmt1.executeUpdate(sql1);
				
				String rno="", simno="", mobno="", wmsn="", module="", gps="", neworrep="", typeunit="", swver="", voice="", jrmbuz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", periphs="", periphcode="";  
				
				sql2="select * from t_unitmaster where UnitId='"+unid[i]+"' ";
				rs2=stmt2.executeQuery(sql2);
				if(rs2.next())
				{
					rno=rs2.getString("Rno");
					simno=rs2.getString("SIMNo");
					mobno=rs2.getString("MobNo"); 
					neworrep=rs2.getString("InstType");
					wmsn=rs2.getString("WMSN");
					module=rs2.getString("Module");
					gps=rs2.getString("GPS");
					typeunit=rs2.getString("typeunit");
					swver=rs2.getString("swver");
					voice=rs2.getString("PVoice");
					jrmbuz=rs2.getString("PJrmBuzz");
					buzzer=rs2.getString("PBuzzer");
					temp1=rs2.getString("PTemp1");
					temp2=rs2.getString("PTemp2");
					door1=rs2.getString("PDoor1");
					door2=rs2.getString("PDoor2");
					horn=rs2.getString("PHorn");
					scard=rs2.getString("PSCard");
					flowsen1=rs2.getString("PFlowSen1");
					flowsen2=rs2.getString("PFlowSen2");
					plain=rs2.getString("Plain");
					periphs=rs2.getString("Peripherals");
					periphcode=rs2.getString("PeriphCode");
				//	utype="+status[i]+";
					
				}
				
							
				
				
				String sqlorder="insert into t_unitorder (Reqno, Reqto, ReqDate, TypofUnit, NoofUnits, RemUnits, Peripherals, InsType, DispatchAdd, Cust, Tech, DispDate, Status, ModeofDispatch, DisName, Reqby ) values ('"+orno+"','"+holdername+"', '"+tdydte+"', '"+typeunit+"', '-', '-', '"+periphs+"','"+neworrep+"','-','"+newcust+"','"+holdbyinsrt+"','"+tdydte+"','Transfer','Transfer','"+holdbyinsrt+"','"+user+"') ";
				//Query for t_sqlquery
	   			String abcd1=sqlorder.replace("'","#");	
	   			abcd1=abcd1.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
				//out.print(sqlorder);
				//stmt3.executeUpdate(sqlorder);
				stmt4.executeUpdate(sqlorder);
				
				
				
				sql3="insert into t_unitmasterhistory (Rno, EntDate, EntTime, UnitId, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode,Status,DisAdd, DispDate, DispTime, OrderNo, ModeofDispatch, DisName, CourierDate, HoldBy, FaultyUnit, CommentForTransf, EntBy, TransDate) values ('"+rno+"', '"+tdydte+"', '"+tme+"', '"+unid[i]+"', '"+simno+"', '"+mobno+"', '"+neworrep+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+periphs+"', '"+periphcode+"','InterDisp','"+holdbyinsrt+"', '"+tdydte+"', '"+tme+"', '"+orno+"', 'Transfer','"+holdername+"','"+tdydte+"', '"+holdbyinsrt+"', '"+unittyp+"', '"+comment+"','"+user+"', '"+tdydte+"') ";
				//Query for t_sqlquery
	   			String abcd2=sql3.replace("'","#");	
	   			abcd2=abcd2.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd2+"')");
				
				//out.print(sql3);
				stmt3.executeUpdate(sql3);
				
			}
		}

		con1.close();
		
		response.sendRedirect("unitholdbytech1.jsp?updated=yes&holdername="+holdername);
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
	
