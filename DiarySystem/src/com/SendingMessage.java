package com;
//import com.bulk.bean.validate1.*;
//import com.bulk.bean.InsertData;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class sendmessage
 */
public class SendingMessage extends HttpServlet  implements Runnable{
	private static final long serialVersionUID = 1L;
	static Statement st,st1,st2,stsecond,stmt,st3,st4,st5,st6,st7;
	static Connection conn,conn1,connsecondary;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendingMessage() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void run()
    {
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
		try{
		  
	   		
			GetConnection();
		String mobno="";
	    String sms="";
	    
	  String data="select * from t_smssend where Status='NO'";
	  ResultSet rs= stmt.executeQuery(data); 
	   while(rs.next())
	   {
	      mobno=rs.getString("MobNo");
		   
	      sms=rs.getString("Message");
	      String dd= send(mobno,sms);
	      System.out.println("sended successfully");
	      if(dd.equals("done"))
	     {  
	        String up="update t_smssend set Status='Yes' where MobNo="+mobno+" and Message='"+sms+"'";
	       st1.executeUpdate(up);
	      System.out.println("updated");
	     }
	 }	
		response.sendRedirect("BulkSmssending.jsp");
		}catch (Exception e) {
			// TODO: handle exception
		   System.out.println("Exceeption=>"+e);
		}
        finally{
        	CloseConnection();
                 
        }
	}
private void CloseConnection() {
	try{	
	stmt.close();
	st.close();
	st1.close();
	conn1.close(); 
	}catch (Exception e) {
		// TODO: handle exception
	   System.out.println(e);
	
	}	
	}
private void GetConnection() {
		// TODO Auto-generated method stub
		try
	    {
			  	Class.forName("org.gjt.mm.mysql.Driver");
			  //	conn= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","fleetview","1@flv");
			  	conn1= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_CustomerComplaints","fleetview","1@flv");
			  	//conn1= DriverManager.getConnection("jdbc:mysql://203.199.134.130/db_gps","fleetview","1@flv");
			  	st=conn1.createStatement();
			  	st1=conn1.createStatement(); 
			    
			  	 stmt=conn1.createStatement();
			     System.out.println("Connection successful");
	    }catch (Exception e) {
			e.printStackTrace();
			System.out.print("Exception in getconnection--->"+e);
		}
	
	}
  
	@SuppressWarnings("deprecation")
	private String send(String mobno,String sms) {
		// TODO Auto-generated method stub
		System.out.println("in send");
		try
        {
            sms=sms.replace("'", " ");
            sms=sms.replace(";", " ");
            sms=sms.replace("&", " ");
            sms=sms.replace("@", " ");
            sms=sms.replace("<>", " ");
            sms=sms.replace("[", " ");
            sms=sms.replace("]", " ");
            sms=URLEncoder.encode(sms);
            String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=Transworld&sign=FleetView&to="+mobno+"&message="+sms+"&gateway=high";
            URL url=new URL(smsurl);
            URLConnection connection = url.openConnection();
            connection.connect();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null )
            {
                System.out.println(line);
               
            }
              
                      
        }
        catch (Exception e) 
        {
            System.out.print("SMS Sending Exception --->"+e);
            
            
                           
        }
         return "done";
	}

	
	
	
	}


