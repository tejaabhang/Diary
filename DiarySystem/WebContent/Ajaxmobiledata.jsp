<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>

<%!
Connection con1;
%>

<%
try {
    
          
    Class.forName(MM_dbConn_DRIVER);
//	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement st1=con1.createStatement(),st2=con1.createStatement(), stmt1=con1.createStatement(),stmt2=con1.createStatement(),stmt3=con1.createStatement(),stmt4=con1.createStatement(),stmt5=con1.createStatement(),st=con1.createStatement();
    ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
    String sql1=""; 
    String unitid="",serviceprovider=null, newunit="",vehcode="",simno="",ownername="",TheDate="",TheTime="",lastdata="",ftpdate="";
String no=request.getParameter("mobno");
String mobno="";
String src=request.getParameter("src");
////System.out.println("src"+src);
	if(src.equalsIgnoreCase("sim"))
		{
		
		// ---------------get the service provider---------------------------------
		String str1="Select Service_provider from t_simmaster where Simno Like '%"+no+"%'";
		////System.out.println(str1);
		ResultSet rst1=st1.executeQuery(str1);
		if(rst1.next())
		{
			serviceprovider=rst1.getString("Service_provider");
		}
		else
		{
			out.println("yes#Sim you entered is not availble in Sim Master#");
		
		}
		
		//----------------if service provider is airtel get the mobile no from AirtelMobno col.-------------
		if(serviceprovider!=null && serviceprovider.equalsIgnoreCase("Airtel"))
		{
		 String str2="select AirtelMobno from t_simmaster where Simno Like '%"+no+"%'";
		//	//System.out.println(str2);
		 ResultSet rst2=st2.executeQuery(str2);
		 if(rst2.next())
		 {
			 mobno=rst2.getString("AirtelMobno");
		 }
		}
		if(mobno.equals("")|| mobno.equals("-"))
		{
			//----------------
		
				String str="Select Mobno from t_simmaster where Simno Like'%"+no+"%'";
			//	//System.out.println(str);
				ResultSet rsget=st.executeQuery(str);
				if(rsget.next())
				{
			//		//System.out.println("inside if");
					mobno=rsget.getString("Mobno");
				}
				else
				{
					out.println("yes#Sim you entered is not availble in Sim Master#");
				
				}
		}
		}
	else
	{
		mobno=no;
	}
//	//System.out.println("mobno="+mobno);
sql1="select * from t_unitmaster where MobNo='"+mobno+"'";
//out.println(sql1);
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
	unitid=rs1.getString("UnitID");

	String sql="select VehicleRegNumber,OwnerName from t_vehicledetails where unitid="+unitid;
	rs2=stmt2.executeQuery(sql);
	if(rs2.next())
	{
		
		 vehcode=rs2.getString("VehicleRegNumber");
		 ownername=rs2.getString("OwnerName");		 
		
	}
	else
	{
		vehcode="N.A";
		ownername="N.A";
	}
}
else
{
	unitid="N.A";
	vehcode="N.A";
	ownername="N.A";
}

String sql4="SELECT * FROM t_onlinedata WHERE UnitID='"+unitid+"'";
rs4=stmt4.executeQuery(sql4);
if(rs4.next())
{
	TheDate=rs4.getString("TheDate");
	TheTime=rs4.getString("TheTime"); 
	lastdata=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(TheDate+" "+TheTime));
}
else
	lastdata="N.A";



String sql2="Select Simno from t_simmaster where Mobno='"+mobno+"'";
rs3=stmt3.executeQuery(sql2);
if(rs3.next())
{
	simno=rs3.getString("Simno");
	
	String str="Select * from  t_ftplastdump where SimNo='"+simno+"'";
	ResultSet rsget=stmt5.executeQuery(str);
	if(rsget.next())
	{
		ftpdate=rsget.getString("StoredDateTime");
		ftpdate=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ftpdate));
		
	}
	else
		ftpdate="N.A";
	
}
else
{
	simno="N.A";
	ftpdate="N.A";
}

//String sql3="select StoredDateTime from t_ftpdump where
////System.out.println(unitid+"#"+vehcode+"#"+simno+"#"+ownername+"#"+lastdata+"#"+ftpdate);  
out.println(unitid+"#"+vehcode+"#"+simno+"#"+ownername+"#"+lastdata+"#"+ftpdate+"#"+mobno);

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>

