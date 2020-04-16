

	//package com.mail;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.text.DateFormat;
	import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;

	public class AutomaticTicketGeneration {

		static Connection conn1=null;
		static Statement st=null;
		static Statement st1=null;
		static Statement st2=null;
		static Statement st3=null;
		static Statement st4=null;
		static Statement st5=null;
		static Statement st6=null;
		static Statement st7=null;
		static Statement st8=null;
		static Statement st9=null;
		static Statement st10=null;
		static Statement st11=null;
		static Statement st12=null;
		static Statement st13=null;
		
		static Statement st14=null;
		static Statement st15=null;
		static Statement st16=null;
		static Statement st17=null;
		static Statement st18=null;
		static Statement st19=null;
		static Statement st20=null;
		static Statement st21=null;
		static Statement st22=null;
		static Statement st23=null;
		static Statement st24=null;
		static Statement st25=null;
		static Statement st26=null;
		static Statement st27=null;
		static Statement st29=null;
		
		
		
		static String sql="";
		static String sql1="";
		static String sql2="";
		static String sql3="";
		static String sql4="";
		static String sql5="";
		static String sql6="";
		static String sql7="";
		static String sql8="";
		static String sql9="";
		static String sql10="";
		static String sql11="";
		static String sql12="";
		static String sql13="";
		static String sql14="";
		static String sql15="";
		static String sql16="";
		static String sql17="";
		static String sql18="";
		static String sql19="";
		static String sql20="";
		static String sql21="";
		static String sql22="";
		static String sql23="";
		static String sql24="";
		static String sql25="";
		static String sql26="";
		static String sql27="";
		static String sql28="";
		static String sql29="";
		static String sql30="";
		static String sql31="";
		
		static String sql32="";
		
		static String TicketDetails="Delay More than 6 Hrs";
		static String TicketCategory="ToCheck";
		static String TicketDetails1="Delay More than 12 Hrs";
		static String TicketCategory1="Stage1Ticket";
		static String TicketDetails2="Delay More than 24 Hrs";
		static String TicketCategory2="Stage2Ticket";
		static String TicketDetails3="Delay More than 48 Hrs";
		static String TicketCategory3="Stage3Ticket";
		static String TicketDetails4="Delay More than 7 Days";
		static String TicketCategory4="Stage4Ticket";
		static String chkdate="";
		static String chktime="";
		
		
		static String tdetails="-";
		static String tdetails1="-";
		static String tdetails2="-";
		static String tdetails3="-";
		static String tdetails4="-";
		static String tdetails5="-";
		static String tdetails6="-";
		
		static int count=0;
		static int count1=0;
		static String datetime="";
		static int[] count3=new int[7];
		static int[] count2=new int[7];
		static String[] status=new String[7];
		static int[] statusValues=new int[7];
        

		
		public static void GetConnection() { 
			try {
				String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
			    String MM_dbConn_USERNAME = "diary";
			    String MM_dbConn_PASSWORD = "d@1ry";
			    //String MM_dbConn= "jdbc:mysql://182.18.129.62/db_gps";
			    String MM_dbConn= "jdbc:mysql://103.241.181.36/db_gps";
			    Class.forName(MM_dbConn_DRIVER);
			    conn1 = DriverManager.getConnection(MM_dbConn,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			    st =  conn1.createStatement();
			    st1 =  conn1.createStatement();
			    st2 =  conn1.createStatement();
			    st3 =  conn1.createStatement();
			    st4 =  conn1.createStatement();
			    st5 =  conn1.createStatement();
			    st6 =  conn1.createStatement();
			    st7 =  conn1.createStatement();
			    st8 =  conn1.createStatement();
			    st9 =  conn1.createStatement();
			    st10 =  conn1.createStatement();
			    st11 =  conn1.createStatement();
			    st12 =  conn1.createStatement();
			    st13 =  conn1.createStatement();
			    st14 =  conn1.createStatement();
			    st15 =  conn1.createStatement();
			    st16 =  conn1.createStatement();
			    st17 =  conn1.createStatement();
			  
			    st18 =  conn1.createStatement();
			    st19 =  conn1.createStatement();
			    st20 =  conn1.createStatement();
			    st21 =  conn1.createStatement();
			    st22 =  conn1.createStatement();
			    st23 =  conn1.createStatement();
			    st24 =  conn1.createStatement();
			    st25 =  conn1.createStatement();
			    st26 =  conn1.createStatement();
			    st27 =  conn1.createStatement();
			    st29 = conn1.createStatement();
			    
			        System.out.println("\n\n in connection...");
			} catch (Exception e) {
				System.out.print("GetConnection Exception ---->" + e);
				//GetConnection();
			}
		}
		
		public static void CloseConnection() { 
			try {
				st.close();
				
				st1.close();
				st2.close();
				st3.close();
				
				st4.close();
				st5.close();
				st6.close();
				st7.close();
				st8.close();
				
				st9.close();st11.close();
				st10.close();
				
				st12.close();
				st13.close();
				st14.close();
				st15.close();
				st16.close();
				st17.close();
				st18.close();
				st19.close();
				st20.close();
				st21.close();
				st22.close();
				st23.close();
				st24.close();
				st25.close();
				st26.close();
				st27.close();
				
				
						
				
				conn1.close();
				
				
				
			} catch (Exception e) {
				System.out.print("CloseConnection Exception---->" + e);
			}

		}
		
		public static void main(String[] args)
		{
			Date date = new Date();
			DateFormat df;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatter1 = new SimpleDateFormat("hh:mm:ss");
			Calendar currentDate = Calendar.getInstance();
			 chkdate = formatter.format(currentDate.getTime());
				chktime =formatter1.format(currentDate.getTime());
				System.out.println("\n\n  chkdate  here..."+chkdate);
				System.out.println("\n\n chktime  here..."+chktime);
				//System.out.println("\n\n chktime CURRENT_TIMESTAMP()  here..."+CURRENT_TIMESTAMP());
			
			try
			{
			GetConnection();
			allTicketProcessing();
			CloseConnection();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("\n\n Exception here...");
			}
			
		}
		
		public static void allTicketProcessing()
		
		{	
			 System.out.println("Inside loop >>>>>>>  :");
			
			// First loop for automatic process of tickets
			
			 try{
	     	   
	            sql="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter)  (select tid,'AutoClosed','Ticket AutoClosed','Auto',a.vehid,b.vehicleregnumber,b.ownername from t_livetickettest a,t_vehicledetails b where a.vehid=b.vehiclecode and b.Status <>'-') ";      
	            st.executeUpdate(sql);
	            System.out.println("The string sql is a11111 :"+sql);
	            
	           
	            //System.out.println("The number of count is  :");
	         	   
	            }catch(Exception e) {
	         	   System.out.println("the exception is e>> :"+e);
	         	   e.printStackTrace();
	            }
	            
	            
	         try{          	   
	                sql1="Delete from t_livetickettest where vehid in (Select vehiclecode from t_vehicledetails where Status <>'-')";      
	               st1.executeUpdate(sql1);
	                System.out.println("The string sql1 is a2222 :"+sql1);
	                //int j=0;
	                
	               
	             	   
	                }catch(Exception e1) {
	             	   System.out.println("the exception is e1>> :"+e1);
	             	   e1.printStackTrace();
	            }
	                
	                
	                //Removes the ticket for any Updated vehciles
	                
	                
	                
	                try
	                {
	                  sql2 = "insert into t_tickethistorytest (ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) (select tid,'AutoClosed','Ticket AutoClosed','Auto',a.vehid,b.vehicleregno,b.transporter from t_livetickettest a,t_onlinedata b  where a.vehid=b.vehiclecode  and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(b.thedate,' '),b.thetime)))<6) ";
	                  System.out.println("The string sql2 is b1111 before :" + sql2);
	                  st27.executeUpdate(sql2);
	                  System.out.println("The string sql2 is b1111 after :" + sql2);
	                }
	                catch (Exception e2)
	                {
	                  System.out.println("the exception change statement is ininsert query    >> :" + e2);
	                  e2.printStackTrace();
	                }

	                try
	                {
	                  sql32 = "Delete from t_livetickettest where vehid in (Select vehiclecode from t_onlinedata where   hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))<6)";
	                  System.out.println("The 55555855 BEFORE sql32:" + sql32);
	                  st29.executeUpdate(sql32);
	                  System.out.println("The 55555855 sql32:" + sql32);
	                }
	                catch (Exception e22)
	                {
	                  System.out.println("the exception while deleting ticket having data less than 6Hrs  >> :" + e22);
	                }
	                  
	                 //Updates or Inserts the ticket for any delay>=6 Hrs and <12 Hrs.
	                 
	                 
	             try{
	            	 //int l=0;
	                                     	
	                    	//datetime = getCurrentTimeStamp(i);
	                    	sql3="Select vehiclecode,vehicleregno,transporter from t_onlinedata where vehiclecode in(Select vehiclecode from t_vehicledetails where Status ='-') and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))>=6 and hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))<12";      
	                    	ResultSet rs3=st3.executeQuery(sql3);
	                    	System.out.println("The string sql3 is b333 :"+sql3);
	                    		while(rs3.next()) {
	                    			System.out.println("\nThe number of count3 is b333 :");
	                    			sql4="Select * from t_livetickettest where vehid="+rs3.getString("vehiclecode");
	                    			ResultSet rs4 =st4.executeQuery(sql4);
	                    			System.out.println("The string sql4 is b333 :"+sql4);
	                    			if(rs4.next())
	                    			{
	                    				tdetails=rs4.getString("tdetails");	
	                    			sql5="Update t_livetickettest set tdetails='"+TicketDetails+ "',tcategory='"+TicketCategory+"' where vehid="+rs3.getString("vehiclecode");	
	                    			st4.executeUpdate(sql5);
	                    			System.out.println("The string sql5 is b333 if :"+sql5);
	                    			
	                    			}else{
	                    				tdetails="chk";
	                    				sql5="Insert into t_livetickettest (tdate,ttime,vehid,tdetails,tcategory,status,action) values ('"+chkdate+"','"+chktime+"','"+rs3.getString("vehiclecode")+"','"+TicketDetails+"','"+TicketCategory+"','Open','-')";	
		                    			st4.executeUpdate(sql5);	
		                    			System.out.println("The string  sql5 is b333 else :"+sql5);
	                    				
	                    			}
	                    			
	                    			//String tct="";
	                    			if(tdetails.equalsIgnoreCase("chk"))
	                    			{
	                    				
		                    			sql6="Select tid from t_livetickettest where vehid='"+rs3.getString("vehiclecode")+"'  " ;

	                    			}else{
		                    			sql6="Select tid from t_livetickettest where vehid='"+rs3.getString("vehiclecode")+"' and tdetails <> '"+tdetails+"' " ;
	
	                    				
	                    			}
	                    			ResultSet rs5 =st5.executeQuery(sql6);
	                    			System.out.println("The string  sql6 is b333 else :"+sql6);
	                    			if(rs5.next()){
	                    				//tct=rs5.getString("tid");
	                    				sql7="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) values ('"+rs5.getString("tid")+"','Created','"+TicketDetails+"','Auto','"+rs3.getString("vehiclecode")+"','"+rs3.getString("vehicleregno")+"','"+rs3.getString("transporter")+"')";
	                    				st9.executeUpdate(sql7);	
	                    				System.out.println("The string sql7 is b333 else :"+sql7);
	                    			}
	                    			
	                    			
	                    			
	                    			
	                    			}
	                         
	                 }catch(Exception e3) {
	                	 System.out.println("the exception is e3>> :"+e3);
	                	 e3.printStackTrace();
	                 } 
	                   
	                 // Updates or Inserts the ticket for any delay>=12 Hrs and <24 Hrs.
	                 
	                
	               
	                 
	                 try{
		            	 
		                                     	
		                    	//datetime = getCurrentTimeStamp(i);
		                    	sql8="Select vehiclecode,vehicleregno,transporter from t_onlinedata where vehiclecode in(Select vehiclecode from t_vehicledetails where Status ='-') and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))>=12 and hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))<24";      
		                    	ResultSet rs6=st6.executeQuery(sql8);
		                    	System.out.println("The string sql8 is  :"+sql8);
		                    		while(rs6.next()) {
		                    			System.out.println("\nThe number of count3 is  :");
		                    			sql9="Select * from t_livetickettest where vehid="+rs6.getString("vehiclecode");
		                    			ResultSet rs7 =st7.executeQuery(sql9);
		                    			System.out.println("The string sql9 ccc is  :"+sql9);
		                    			
		                    			if(rs7.next())
		                    			{
		                    				tdetails1=rs7.getString("tdetails");	
		                    			sql10="Update t_livetickettest set tdetails='"+TicketDetails1+ "',tcategory='"+TicketCategory1+"' where vehid="+rs6.getString("vehiclecode");	
		                    			st8.executeUpdate(sql10);
		                    			System.out.println("The string sql10 ccc if is  :"+sql10);
		                    			
		                    			}else{
		                    				tdetails1="stg1";
		                    				sql10="Insert into t_livetickettest (tdate,ttime,vehid,tdetails,tcategory,status,action) values ('"+chkdate+"','"+chktime+"','"+rs6.getString("vehiclecode")+"','"+TicketDetails1+"','"+TicketCategory1+"','Open','-')";	
			                    			st8.executeUpdate(sql10);	
			                    			System.out.println("The string sql10 ccc else is  :"+sql10);
		                    				
		                    			}
		                    			
		                    			//String tct="";
		                    			if(tdetails1.equalsIgnoreCase("stg1"))
		                    			{
		                    				
			                    			sql11="Select tid from t_livetickettest where vehid='"+rs6.getString("vehiclecode")+"'";

		                    			}else{
		                    				
			                    			sql11="Select tid from t_livetickettest where vehid='"+rs6.getString("vehiclecode")+"' and tdetails <> '"+tdetails1+"' ";

		                    			}
		                    			ResultSet rs8 =st9.executeQuery(sql11);
		                    			System.out.println("The string sql11 ccc else is  :"+sql11);
		                    			if(rs8.next()){
		                    				//tct=rs5.getString("tid");
		                    				sql12="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) values ('"+rs8.getString("tid")+"','Created','"+TicketDetails1+"','Auto','"+rs6.getString("vehiclecode")+"','"+rs6.getString("vehicleregno")+"','"+rs6.getString("transporter")+"')";
		                    				st9.executeUpdate(sql12);
		                    				System.out.println("The string sql12 ccc else is  :"+sql12);
		                    				
		                    				
		                    			}
		                    			
		                    			
		                    			
		                    			
		                    			}
		                         
		                 }catch(Exception e4) {
		                	 System.out.println("the exception is e4>> :"+e4);
		                	 e4.printStackTrace();
		                 } 
	                 
		                 // Updates or Inserts the ticket for any delay>=24 Hrs and <48 Hrs.
	                 
		                
		                
		                 try{
			            	 
                          	
		                    	//datetime = getCurrentTimeStamp(i);
		                    	sql13="Select vehiclecode,vehicleregno,transporter from t_onlinedata where vehiclecode in(Select vehiclecode from t_vehicledetails where Status ='-') and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))>=24 and hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))<48";      
		                    	ResultSet rs9=st10.executeQuery(sql13);
		                    	System.out.println("The string  is  :"+sql13);
		                    	System.out.println("The string sql13 ddd else is  :"+sql13);
		                    	
		                    		while(rs9.next()) {
		                    			System.out.println("\nThe number of count3 is  :");
		                    			sql14="Select * from t_livetickettest where vehid="+rs9.getString("vehiclecode");
		                    			ResultSet rs10 =st11.executeQuery(sql14);
		                    			System.out.println("The string sql14 ddd else is  :"+sql14);
		                    			if(rs10.next())
		                    			{
		                    				tdetails2=rs10.getString("tdetails");
		                    			sql15="Update t_livetickettest set tdetails='"+TicketDetails2+ "',tcategory='"+TicketCategory2+"' where vehid="+rs9.getString("vehiclecode");	
		                    			st12.executeUpdate(sql15);
		                    			System.out.println("The string sql15 ddd if is  :"+sql15);
		                    			
		                    			
		                    			}else{
		                    				tdetails2="stg2";
		                    				sql15="Insert into t_livetickettest (tdate,ttime,vehid,tdetails,tcategory,status,action) values ('"+chkdate+"','"+chktime+"','"+rs9.getString("vehiclecode")+"','"+TicketDetails2+"','"+TicketCategory2+"','Open','-')";	
			                    			st12.executeUpdate(sql15);	
			                    			System.out.println("The string sql15 ddd else is  :"+sql15);
		                    				
		                    			}
		                    			
		                    			//String tct="";

		                    			if(tdetails2.equalsIgnoreCase("stg2"))
		                    			{
			                    			sql16="Select tid from t_livetickettest where vehid="+rs9.getString("vehiclecode");

		                    				
		                    			}else{
		                    				
			                    			sql16="Select tid from t_livetickettest where vehid='"+rs9.getString("vehiclecode")+"' and tdetails <> '"+tdetails2+"' " ;
	
		                    			}
		                    			ResultSet rs11 =st9.executeQuery(sql16);
		                    			System.out.println("The string sql16 ddd  is  :"+sql16);
		                    			if(rs11.next()){
		                    				//tct=rs5.getString("tid");
		                    				sql17="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) values ('"+rs11.getString("tid")+"','Created','"+TicketDetails2+"','Auto','"+rs9.getString("vehiclecode")+"','"+rs9.getString("vehicleregno")+"','"+rs9.getString("transporter")+"')";
		                    				st13.executeUpdate(sql17);	
		                    				System.out.println("The string sql17 ddd  is  :"+sql17);
		                    				
		                    			}
		                    			
		                    			
		                    			
		                    			
		                    			}
		                    				                    	  	                    			                    		                    		                    		             		
		                    		                   		              		
		                         
		                 }catch(Exception e5) {
		                	 System.out.println("the exception is e5>> :"+e5);
		                	 e5.printStackTrace();
		                 } 
	                 
	                 
		                 //Updates or Inserts the ticket for any delay>=48 Hrs and <7 Days.
		                
		                 
		                 
		                 
		                
	                 
		                 try{
			            	 
	                          	
		                    	//datetime = getCurrentTimeStamp(i);
		                    	sql18="Select vehiclecode,vehicleregno,transporter from t_onlinedata where vehiclecode in(Select vehiclecode from t_vehicledetails where Status ='-') and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))>=48 and hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))<168";      
		                    	ResultSet rs12=st14.executeQuery(sql18);
		                    	System.out.println("The string sql18 eee if is  :"+sql18);
		                    	//System.out.println("The string  is  :"+sql18);
		                    		while(rs12.next()) {
		                    			System.out.println("\nThe number of count3 is  :");
		                    			sql19="Select * from t_livetickettest where vehid="+rs12.getString("vehiclecode");
		                    			ResultSet rs13 =st15.executeQuery(sql19);
		                    			System.out.println("The string sql19 eee if is  :"+sql19);
		                    			if(rs13.next())
		                    			{
		                    				tdetails3=rs13.getString("tdetails");
		                    			sql20="Update t_livetickettest set tdetails='"+TicketDetails3+ "',tcategory='"+TicketCategory3+"' where vehid="+rs12.getString("vehiclecode");	
		                    			st16.executeUpdate(sql20);
		                    			System.out.println("The string sql20 eee if is  :"+sql20);
		                    			
		                    			
		                    			}else{
		                    				tdetails3="stg3";
		                    				sql20="Insert into t_livetickettest (tdate,ttime,vehid,tdetails,tcategory,status,action) values ('"+chkdate+"','"+chktime+"','"+rs12.getString("vehiclecode")+"','"+TicketDetails3+"','"+TicketCategory3+"','Open','-')";	
			                    			st16.executeUpdate(sql20);	
			                    			System.out.println("The string sql20 eee if is  :"+sql20);
		                    				
		                    				
		                    			}
		                    			
		                    			//String tct="";
		                    			if(tdetails3.equalsIgnoreCase("stg3"))
		                    			{
			                    			sql21="Select tid from t_livetickettest where vehid="+rs12.getString("vehiclecode");
	
		                    				
		                    			}else{
		                    				
			                    			sql21="Select tid from t_livetickettest where vehid='"+rs12.getString("vehiclecode")+"' and tdetails <> '"+tdetails3+"' " ;

		                    				
		                    			}
		                    			ResultSet rs14 =st17.executeQuery(sql21);
		                    			System.out.println("The string sql21 eee if is  :"+sql21);
		                    			if(rs14.next()){
		                    				//tct=rs5.getString("tid");
		                    				sql22="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) values ('"+rs14.getString("tid")+"','Created','"+TicketDetails3+"','Auto','"+rs12.getString("vehiclecode")+"','"+rs12.getString("vehicleregno")+"','"+rs12.getString("transporter")+"')";
		                    			st18.executeUpdate(sql22);	
		                    				System.out.println("The string sql22 eee if is  :"+sql22);
		                    				
		                    			}
		                    			
		                    			
		                    			
		                    			
		                    			}
		                    				                    	  	                    			                    		                    		                    		             		
		                    		                   		              		
		                         
		                 }catch(Exception e6) {
		                	 System.out.println("the exception is e6>> :"+e6);
		                	 e6.printStackTrace();
		                 } 
	                 
		                
		                
		                 
		                 //Updates or Inserts the ticket for any delay > 7 Days.
		                 try{
			            	 
	                          	
		                    	//datetime = getCurrentTimeStamp(i);
		                    	sql23="Select vehiclecode,vehicleregno,transporter from t_onlinedata where vehiclecode in(Select vehiclecode from t_vehicledetails where Status ='-') and  hour(timediff(CURRENT_TIMESTAMP(),concat(concat(thedate,' '),thetime)))>=168 ";      
		                    	ResultSet rs15=st19.executeQuery(sql23);
		                    	System.out.println("The string sql23 eee if is  :"+sql23);
		                    	//System.out.println("The string  is  :"+sql23);
		                    		while(rs15.next()) {
		                    			System.out.println("\nThe number of count3 is  :");
		                    			sql24="Select * from t_livetickettest where vehid="+rs15.getString("vehiclecode");
		                    			ResultSet rs16 =st20.executeQuery(sql24);
		                    			System.out.println("The string sql24 eee if is  :"+sql24);
		                    			if(rs16.next())
		                    			{
		                    				tdetails4=rs16.getString("tdetails");	
		                    			sql25="Update t_livetickettest set tdetails='"+TicketDetails4+ "',tcategory='"+TicketCategory4+"' where vehid="+rs15.getString("vehiclecode");	
		                    			st21.executeUpdate(sql25);
		                    			System.out.println("The string sql25 eee if is  :"+sql25);
		                    			
		                    			
		                    			}else{
		                    				tdetails4="stg4";
		                    				sql25="Insert into t_livetickettest (tdate,ttime,vehid,tdetails,tcategory,status,action) values ('"+chkdate+"','"+chktime+"','"+rs15.getString("vehiclecode")+"','"+TicketDetails4+"','"+TicketCategory4+"','Open','-')";	
			                    			st21.executeUpdate(sql25);
			                    			System.out.println("The string sql25 eee if is  :"+sql25);
		                    				
		                    				
		                    			}
		                    			
		                    			//String tct="";
		                    			if(tdetails4.equalsIgnoreCase("stg4"))
		                    			{
			                    			sql26="Select tid from t_livetickettest where vehid="+rs15.getString("vehiclecode");

		                    				
		                    			}else{
		                    				
			                    			sql26="Select tid from t_livetickettest where vehid='"+rs15.getString("vehiclecode")+"' and tdetails <> '"+tdetails4+"' " ;
	
		                    				
		                    			}
		                    			ResultSet rs17 =st22.executeQuery(sql26);
		                    			System.out.println("The string sql26 eee if is  :"+sql26);
		                    			if(rs17.next()){
		                    				//tct=rs5.getString("tid");
		                    				sql27="insert into t_tickethistorytest(ticketid,Action,ActionComment,Actionby,Vehid,vehregno,Transporter) values ('"+rs17.getString("tid")+"','Created','"+TicketDetails4+"','Auto','"+rs15.getString("vehiclecode")+"','"+rs15.getString("vehicleregno")+"','"+rs15.getString("transporter")+"')";
		                    				st23.executeUpdate(sql27);	
		                    				System.out.println("The string sql27 eee if is  :"+sql27);
		                    				
		                    			}
		                    			
		                    			
		                    			
		                    			
		                    			}
		                    				                    	  	                    			                    		                    		                    		             		
		                    		                   		              		
		                         
		                 }catch(Exception e7) {
		                	 System.out.println("the exception is e7>> :"+e7);
		                	 e7.printStackTrace();
		                 } 
	                 
		               
		                 
		                
		                 
		                 //Last loop for ticketmaster table
		                 try{
			            	 
	                          	
		                    	//datetime = getCurrentTimeStamp(i);
		                   
		                    	
		                    	sql28="Insert into t_ticketmastertest (tid,tdate,ttime,vehid,tdetails,tcategory,status,action,user) select tid,tdate,ttime,vehid,tdetails,tcategory,status,action,user from t_livetickettest where tdate='"+chkdate+"' and ttime='"+chktime+"' ";      
		                    	st24.executeUpdate(sql28);	
		                    	System.out.println("The string sql28 eee if is  :"+sql28);
		                    	
		                  
		                	 
		                	 
                    			
		                    	sql29="Update t_ticketmastertest set status='AutoClosed' where Status<>'AutoClosed' and tid not in (select tid from t_livetickettest)";
		                    	st26.executeUpdate(sql29);
		                    	System.out.println("The string sql29 eee if is  :"+sql29);
		                   	                   		              		
		                         
		                 }catch(Exception e8) {
		                	 System.out.println("the exception is e8>> :"+e8);
		                	 e8.printStackTrace();
		                 } 
	                   	
		                 
		                 //CloseConnection(); 		                 
		                          
			//call the next method
			//insertHtmlString(status,statusValues,count2,count3);
		}


		
				
	

		

	}


