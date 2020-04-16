package beanpack;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;


public class SendMsg {
	static Connection conn=null;
	static Connection conn1=null;
	static Statement st1=null;
	static Statement st2=null;
	static Statement st3=null;
	static Statement st4=null;	
	

	/**
	 * @param args
	 */
	public void GetConnection()
	{
		try
		{
			 String url = "jdbc:mysql://103.241.181.36/";
			 // String url = "jdbc:mysql://103.241.181.36/";
				
		        String dbName = "db_CustomerComplaints";
		        String driver = "org.gjt.mm.mysql.Driver"; 
		        String userName = "diary"; 
		        String password = "d@1ry";
		        String msgbdy="";

		        Class.forName(driver).newInstance();
	            conn = DriverManager.getConnection(url+dbName,userName,password);
			//conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
			//Class.forName("org.gjt.mm.mysql.Driver");
			//conn1= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","ujjain","u@1jn");
			st1=conn.createStatement();
			st2=conn.createStatement();
			st3=conn.createStatement();	
			st4=conn.createStatement();
			System.out.println("In Open Connection");				
		}catch (Exception e) {
			System.out.print("GetConnection Exception ---->"+e);	
		}
	}
	
	public void CloseConnection() {
		try{
			st1.close();
			st2.close();
			st3.close();
			st4.close();
			conn.close();
			//conn2.close();
			System.out.println("In Colose Connection");
			}catch (Exception e) {
			System.out.print("CloseConnection Exception---->"+e);
		}
	}
	

	
	
/*	public void getOfAlerts() {
		
		GetConnection();
		System.out.println("after getConnection");
		Send("Hello Shilpa", "9922894506");
		System.out.println("after send msg");
		CloseConnection();
	} //end of else */
	
	public void Send(String sms, String numbers) {
		try
		{
			GetConnection();
			sms=sms.replace("-", " ");
			sms=sms.replace("'", " ");
			sms=sms.replace(";", " ");
			sms=sms.replace("&", " ");
			sms=sms.replace("@", " ");
			sms=sms.replace("<>", " ");
			sms=URLEncoder.encode(sms);
			//String smsurl="http://india.timessms.com/receiverCommon.asp?outLogin=Transworld&outPWD=vikram&outMSG="+sms+"&outNumber="+numbers+"&sign=FleetView";
			String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=FleetView&to="+numbers+"&message="+sms+"&gateway=regular";
			URL url=new URL(smsurl);
			URLConnection connection = url.openConnection();
			connection.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			
		    while ((line = in.readLine()) != null ) 
		    {
		    	System.out.println(line);
		    		
		    }
		    CloseConnection();
		    	 			
		}catch (Exception e) {
			
			System.out.print("SMS Sending Exception --->"+e);
		}
	}
				

}
