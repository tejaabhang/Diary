<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import=" java.text.*" import=" java.util.*" 
    
    import="java.io.BufferedReader" import="java.io.InputStreamReader" import="java.net.URL"
    import="java.net.URLEncoder" import="java.net.URLConnection" import="java.sql.Connection" import="java.sql.DriverManager"
    import="java.sql.ResultSet" import="java.sql.Statement" import="java.text.Format" import="java.text.SimpleDateFormat"
    import ="java.net.HttpURLConnection"
 %>

<%@ include file="header.jsp" %>    


<% 
	Connection conn,conn1;
	Statement st,st1;
	String numbers="";
	String msgid="";
	String vehcode = request.getParameter("vehcode");
	
	System.out.println("vehcode:- "+vehcode);
	
	if(vehcode == null)
	{
		%>
		   out.print("Vehicle code invalid ");
		
		<% 	
	}
	else
	{
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

		st = conn1.createStatement();
		st1 = conn1.createStatement();

    	String sql = "select * from db_gps.t_vehicledetails where vehiclecode='"+vehcode+"' " ;	 
    	ResultSet rst1 = st.executeQuery(sql);
    	
    	System.out.println("sql :- "+sql);
    		
		if(rst1.next())
		{
			
			String unitid = rst1.getString("unitid"); 	
		
			String sql2 = "select * from db_gps.t_unitmaster where unitid='"+unitid+"' ";
			System.out.println("sql2 :- "+sql2);
			ResultSet rst2 = st1.executeQuery(sql2);
			
			if(rst2.next())
			{
				String mobno = rst2.getString("MobNo"); 	
						
				String codeVersion = rst2.getString("SwVer"); 
				
				String sms = "";
				
				
				if(codeVersion.contains("MT02_V266_R7451_WMP100_290812") || codeVersion.equalsIgnoreCase("MT02_V266_R7451_WMP100_290812"))
				{
					System.out.println("the code version is MT02_V266_R7451_WMP100_290812");
					sms = "SG501";
				}
				else if(codeVersion.contains("SO3") || codeVersion.equalsIgnoreCase("SO3") )
				{
					System.out.println("SO3");
					sms = "930#";
				}
				else
				{	
					System.out.println("the code version is other than so3 and mt...");
					sms="UI"+unitid+"#SET0001:0000,-,-,-,-,-";
				}
				System.out.println("before encoding the sms is :- "+sms);
				
				//sms=URLEncoder.encode(sms);
		        
				System.out.println("after encoding the sms string is "+sms);
				
				
				/*if(sms.contains("%23") || sms.contains("%3A") || sms.contains("%2C"))
				 {
					
				 
				 
					sms=sms.replace("%23","#"); 
					sms=sms.replace("%3A",":"); 
					sms=sms.replace("%2C"," "); 
					
					System.out.println(">>>Afeter onVersion>>>>>sms>>>"+sms);
					 
					 
				 }*/
						//mobno = "8007231834";
						numbers = mobno;
						
						String smsurl = "";
						//String sqlsms = "select Url from db_gps.t_SmsGatewayUrl";
						
						String sqlsms = "select Url from db_gps.t_TransactionSmsGatewayUrl";
						
			            Statement stmt3 = conn1.createStatement();
			            ResultSet rst = stmt3.executeQuery(sqlsms);
			            System.out.println("sqlsms...  " + sqlsms);
			            //http://BULK.SMS-INDIA.IN/send.php?usr=sms@myfleetview.com&pwd=987456&ph="+numbers+"&text="+sms
			            if(rst.next())
			            {
			              smsurl = rst.getString("Url");
			            }
						
						
			            System.out.println("smsurl==>" + smsurl);
			            System.out.println("NUMBERS NUMBERS ==>" + numbers);
			            
			            String user_test = "sms@myfleetview.com";
			            
			            user_test = URLEncoder.encode(user_test, "UTF-8");
			            
			            System.out.println("user test is :- "+user_test);
			            
			            try
			            {
			              sms = URLEncoder.encode(sms, "UTF-8");
			              smsurl = smsurl.replaceAll("\\+", "");
			              smsurl = smsurl.replaceAll("numbers", numbers);
			              smsurl = smsurl.replaceAll("sms", sms);
			              smsurl = smsurl.replaceAll("\"", "");
			              smsurl = smsurl.replaceAll(" ", "+");
			            }
			            catch (Exception e)
			            {
			              System.out.println("Exception  in  parsing SMS URl==>" + e);
			            }
			            
			            
			            System.out.println("sms" + sms);
			            System.out.println("FINAL  SMS URL==>" + smsurl);
			            
			            sms = sms.replace("'", " ");
			            sms = sms.replace(";", " ");
			            sms = sms.replace("&", " ");
			            sms = sms.replace("@", " ");
			            sms = sms.replace("<>", " ");
			            sms = sms.replace("[", " ");
			            sms = sms.replace("]", " ");
			            sms = URLEncoder.encode(sms, "UTF-8");
			            
			            try
			            {
			              URL url = new URL(smsurl);

			              HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();

			              urlconnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
			              urlconnection.setRequestProperty("Accept", "*/*");

			              urlconnection.setRequestMethod("GET");

			              urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			              urlconnection.setDoOutput(true);

			              urlconnection.connect();
			              BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			              String line;
			              while ((line = in.readLine()) != null)
			              {
			                //String line;
			                msgid = line;
			              	System.out.println("msgid:- "+msgid);
			              
			              }
			              
			              	if(msgid.contains("Send Successful"))
			              	{
			            		  
			             	   		out.print("Send Successful");
			              		 
			              	}
			              	else
			              	{
			              		%>  
		             	   		out.print("Send Successful");
		              		<%
			              	}

			            }
			            catch(Exception e)
			            {
			            	out.print("SMS Sending Exception --->"+e);
			            }
			            
			            
			            
			            //String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=transwld&sign=FleetView&to="+mobno+"&message="+sms+"&gateway=regular";
				        /*String smsurl="http://BULK.SMS-INDIA.IN/send.php?usr=24982&pwd=v_ah123&ph="+numbers+"&text="+sms;
				        
				        try
				          {
				            sms = URLEncoder.encode(sms, "UTF-8");
				            smsurl = smsurl.replaceAll("\\+", "");
				            smsurl = smsurl.replaceAll("numbers", numbers);
				            smsurl = smsurl.replaceAll("sms", sms);
				            smsurl = smsurl.replaceAll("\"", "");
				            smsurl = smsurl.replaceAll(" ", "+");
				          }
				          catch (Exception e)
				          {
				            System.out.println("Exception  in  parsing SMS URl==>" + e);
				          }
				        
				        
				        System.out.println("url is ..."+smsurl);
				        URL url=new URL(smsurl);
				        URLConnection connection = url.openConnection();
				        connection.connect();
				 		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				        String line;
				        while ((line = in.readLine()) != null )
				        {
				            System.out.println("line is :- "+line);
				           
				        }*/	
				
				
				
			
			}
			else
			{
				%>	
			        out.print("number not present ");
			    <% 
			}
		}
		else
		{
			
			%> out.print("vehicledetails not present ");
		
		<% 
		}
	
	
	}
	


%>



