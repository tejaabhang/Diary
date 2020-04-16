<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css"></link>

<%! 
Connection con1;
%>

<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	String entby=session.getValue("username").toString();
	Statement stmt1=con1.createStatement();
	Statement stmt2=con1.createStatement();
	Statement stmtinsert=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="",sql22="";
	int chkdcntr1=0, chkdcntr=0;
	String cntr=request.getParameter("cntr1");
	String tech=request.getParameter("tech1");
	int cntrint=Integer.parseInt(cntr);
	out.print(cntrint);
	java.util.Date tdydte = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String s=formatter.format(tdydte);
	String[] unitid = new String[cntrint];

	 for(int k=0; k<cntrint; k++) 
	{
   		unitid[k] = request.getParameter("unitid"+k );
          	
          		String dcno=null;
				chkdcntr++;
				sql22="select * from t_unitmasterhistory where UnitId = '"+unitid[k]+"' and Status in ('Dispatched','InterDisp') order by DispDate Desc limit 1";
				rs2=stmt2.executeQuery(sql22);
				if(rs2.next())
				{
					 dcno=rs2.getString("OrderNo");
				}
				String sql2="update t_unitmaster set RecConfirmByRep='"+entby+"',RecByTech='Yes',RecDateTime='"+s+"' where UnitID='"+unitid[k]+"'";
				
				stmt1.executeUpdate(sql2);
			System.out.println("sql2--->"+sql2);
				String sqlselect="select * from db_gps.t_unitmaster where unitID='"+unitid[k]+"'";
				ResultSet rsselect=stmt1.executeQuery(sqlselect);
				if(rsselect.next()){
				
				sql1="insert into t_unitmasterhistory ("+
						"Rno,EntDate,EntTime,UnitID,SimNo,"+
						"SimCompany,MobNo,InstType,InstTypeNew,CommentOfEdit,"+
						"EditedBy,WMSN,Module,GPS,typeunit,"+
						"SwVer,PVoice,PJrmBuzz,PBuzzer,PTemp1,"+
						"PTemp2,PDoor1,PDoor2,PHorn,PScard,"+
						"PFlowSen1,PFlowSen2,Plain,Peripherals,PeriphCode,"+
						"Status,CommentForDispatch,DisAdd,DispDate,DispTime,"+
						"OrderNo,ModeofDispatch,DisName,CourierDate,ChalanNo,"+
						"DispId,Barcode,User,RecBy,HoldBy,"+
						"CommentForTransf,RecByTech,RecDateTime,RecByCust,"+
						"FaultyUnit,FirmwareChanged,ModulePCBChanged,PCBmodification,PowerSupplyChanged,"+
						"GPSMouseChanged,GSMAntennaChanged,SoftwareSimCorrections,OtherCorrections,TrackFileCount,"+
						"ManufactureCount,EntBy,TransDate,testedunit,Mobile_verified,"+
						"Box_type,Tested_by,RecConfirmByRep) values ("+
						"'"+rsselect.getString("Rno")+"' ,'"+rsselect.getString("EntDate")+"','"+rsselect.getString("EntTime")+"',"+	
						"'"+rsselect.getString("UnitID")+"','"+rsselect.getString("SimNo")+"','"+rsselect.getString("SimCompany")+"',"+
						"'"+rsselect.getString("MobNo")+"','"+rsselect.getString("InstType")+"','"+rsselect.getString("InstTypeNew")+"',"+
						"'"+rsselect.getString("CommentOfEdit")+"','"+rsselect.getString("EditedBy")+"','"+rsselect.getString("WMSN")+"',"+
						"'"+rsselect.getString("Module")+"','"+rsselect.getString("GPS")+"','"+rsselect.getString("typeunit")+"','"+rsselect.getString("SwVer")+"',"+
						"'"+rsselect.getString("PVoice")+"','"+rsselect.getString("PJrmBuzz")+"','"+rsselect.getString("PBuzzer")+"',"+
						"'"+rsselect.getString("PTemp1")+"','"+rsselect.getString("PTemp2")+"','"+rsselect.getString("PDoor1")+"',"+
						"'"+rsselect.getString("PDoor2")+"','"+rsselect.getString("PHorn")+"','"+rsselect.getString("PScard")+"',"+
						"'"+rsselect.getString("PFlowSen1")+"','"+rsselect.getString("PFlowSen2")+"','"+rsselect.getString("Plain")+"',"+
						"'"+rsselect.getString("Peripherals")+"','"+rsselect.getString("PeriphCode")+"','"+rsselect.getString("Status")+"',"+
						"'"+rsselect.getString("CommentForDispatch")+"','"+rsselect.getString("DisAdd")+"','"+rsselect.getString("DispDate")+"',"+
						"'"+rsselect.getString("DispTime")+"','"+rsselect.getString("OrderNo")+"','"+rsselect.getString("ModeofDispatch")+"',"+
						"'"+rsselect.getString("DisName")+"','"+rsselect.getString("CourierDate")+"','"+rsselect.getString("ChalanNo")+"',"+
						"'"+rsselect.getString("DispId")+"','"+rsselect.getString("Barcode")+"','"+rsselect.getString("User")+"' ,"+
						"'"+rsselect.getString("RecBy")+"','"+rsselect.getString("HoldBy")+"','"+rsselect.getString("CommentForTransf")+"',"+
						"'"+rsselect.getString("RecByTech")+"','"+rsselect.getString("RecDateTime")+"','"+rsselect.getString("RecByCust")+"',"+
						"'"+rsselect.getString("FaultyUnit")+"','"+rsselect.getString("FirmwareChanged")+"',"+
						"'"+rsselect.getString("ModulePCBChanged")+"','"+rsselect.getString("PCBmodification")+"','"+rsselect.getString("PowerSupplyChanged")+"',"+
						"'"+rsselect.getString("GPSMouseChanged")+"','"+rsselect.getString("GSMAntennaChanged")+"','"+rsselect.getString("SoftwareSimCorrections")+"',"+
						"'"+rsselect.getString("OtherCorrections")+"','"+rsselect.getString("TrackFileCount")+"','"+rsselect.getString("ManufactureCount")+"',"+
						"'"+rsselect.getString("EntBy")+"','"+rsselect.getString("TransDate")+"','"+rsselect.getString("testedunit")+"',"+
						"'"+rsselect.getString("Mobile_verified")+"','"+rsselect.getString("Box_type")+"','"+rsselect.getString("Tested_by")+"',"+
						"'"+rsselect.getString("RecConfirmByRep")+"')";
				
				System.out.println("sql1--->"+sql1);
				stmt2.executeUpdate(sql1);
				}
	
			
		}

		con1.close();
		
		response.sendRedirect("details1.jsp?updated=yes&comment=techunit&parameter=tech&type=Dispatched&tech=tech");
		return;
	

}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
con1.close();	

}
%>
	</html>
