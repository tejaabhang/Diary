	
<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" import=" java.sql.Timestamp" %>
<%@ include file="header.jsp" %>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5;
String sql,sql1,sql2,sql3,sql4,sql5,vehiclecode="",instn="",date="",VehicleregNo="",userrole="";
int total,updated,dealy,disconnected,notactive,transid;
%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 

try
{
	//System.out.println(">>>>inside try");
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	//System.out.println("1");

	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn.createStatement();
	//System.out.println("2");
	String vehreg=request.getParameter("VehicleRegNumber");
	//System.out.println(vehreg);

	String userrole=session.getAttribute("userrole").toString();
	String user=session.getAttribute("DisplayName").toString();
	
	//System.out.println(userrole);
	String transporter=request.getParameter("transporter");
	
	String x=request.getParameter("q");
	String y=request.getParameter("d");
	java.util.Date dte = new java.util.Date();
	//System.out.println("3");
	Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
	String today=formatter.format(dte);
	//System.out.println(today);
		
%>

<%
              try{
 			  
            	  
            	  
            	  sql3="select VehicleRegNumber  FROM db_gps.t_vehicledetails where VehicleCode in ("+x+") order by VehicleCode ";
  				ResultSet rst=st2.executeQuery(sql3);
  				//System.out.println(sql3);
  				while(rst.next())
  				{
  					VehicleregNo=VehicleregNo+" ,"+rst.getString("VehicleRegNumber");
  				}
            	  
            	  
  				//System.out.println(VehicleregNo);
            	  
            	  
            	  
            	  
            	  sql1="update db_gps.t_vehicledetails set Instruction ='"+y+"' where VehicleCode in ("+x+") ";
 			   //System.out.println(sql1);
				st2.executeUpdate(sql1);
				
			//	//System.out.println("4");
				
					
					////System.out.println("inside rst");
					
                    
                    String[] tokens1=x.split(",");
                  
                   //System.out.println("VehicleregNo >>>>>>>"+VehicleregNo); 
                 String q1=VehicleregNo.trim();
                 int q3=q1.length();
                  String  q2=q1.substring(1,q3);
                    //System.out.println("q1 >>>>>>>"+q1);
                    
                    String[] tokens2=q2.split(",");
                    
                    int a=0;
                    
                    while(a<tokens1.length )
                    {
                    	
                    	           
                    sql4="Insert into  db_gps.t_instructionhistory (UserName,VehicleId,VehicleRegNo,UpdatedInstruction,UpdatedDateTime) values ('"+user+"','"+tokens1[a]+"','"+tokens2[a]+"','"+y+"','"+today+"')";
      			   //System.out.println(sql4);
     				st2.executeUpdate(sql4);
     				//System.out.println("inside rst"+tokens2[a]);
     				a++;
                    	
              }
                    response.sendRedirect("addinstn1.jsp");
              }
          catch(Exception e)
          {
        	  //System.out.println(">>>>>E:"+e);
          }

%>



<%
}
catch(Exception e)
{
	//
	out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}
%>

</body>
</html>