package beanpack;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;

public class SendMsgParameter {

	static Connection conn=null;
	static Connection conn1=null;
	static Statement st1=null;
	static Statement st2=null;
	static Statement st3=null;
	static Statement st4=null;	
	static Statement st5=null;	
	
	static Statement stmt1=null;	
	static Statement stmt2=null;	
	static Statement stmt3=null;	
	static Statement stmt4=null;	
	static Statement stmt5=null;	
	static Statement stmt6=null;	
	static Statement stmt7=null;	
	static Statement stmt8=null;
	static Statement stmt9=null;
	
	

	/**
	 * @param args
	 */
	public static void GetConnection()
	{
		try
		{
				String url = "jdbc:mysql://103.241.181.36/";
				
				//String url = "jdbc:mysql://103.241.181.36/";
		      
				String dbName = "db_CustomerComplaints";
				String dbName1 = "db_gpsExceptions";
		        String driver = "org.gjt.mm.mysql.Driver"; 
		        String userName = "diary"; 
		        String password = "d@1ry";
		        Class.forName(driver).newInstance();
	            conn = DriverManager.getConnection(url+dbName,userName,password);
	            
	            conn1 = DriverManager.getConnection(url+dbName1,userName,password);
	            
	            st1=conn.createStatement();
	            st2=conn.createStatement();
	            st3=conn.createStatement();	
	            st4=conn.createStatement();
	            
	            st5=conn.createStatement();
	            
	            stmt1=conn1.createStatement();
	            stmt2=conn1.createStatement();
	            stmt3=conn1.createStatement();
	            stmt4=conn1.createStatement();
	            stmt5=conn1.createStatement();
	            stmt6=conn1.createStatement();
	            stmt7=conn1.createStatement();
	            stmt8=conn1.createStatement();
	            stmt9=conn1.createStatement();
	            
	            
	            
			System.out.println("In Open Connection");				
		}catch (Exception e) {
			System.out.print("GetConnection Exception ---->"+e);
			System.out.print("GetConnection Exception -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&^&^&^&^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@@@@@@@@@@@@@@@@@2222--->"+e);
			//out.print("GetConnection Exception ---->"+e);
		}
	}
	
	public static void CloseConnection() {
		try{
			st1.close();
			st2.close();
			st3.close();
			st4.close();
			
			st5.close();
			conn.close();
			//conn2.close();
			System.out.println("In Colose Connection");
			}catch (Exception e) {
			System.out.print("CloseConnection Exception---->"+e);
		}
	}

	public static int getLength(int  num){
		int cnt =0;
		
		while(num>0)
		{
			
			
			num=num/10;
			
			cnt++;
			
		}
		
		
		
		
		
		return cnt;
		
	}
	
	public static String getFinalAppendVal(int param, int num){
		int param_final =0;
		
		String param1=Integer.toString(param);
		
		
		for(int i=0;i<num;i++)
		{
			
			
			param1="0"+param1;
			
		}
		
		
		
		
		
		return param1;
		
	}
	
	
	
	
	
	
	public void Send(String CodeVersion,String vehiclecode,
							String vehreg,String custname,
								String OwnerName,String unitid,
									String mobno,String operation,String entby) {
		GetConnection();
		java.util.Date d=new java.util.Date();
		Format formatter1=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		System.out.println(CodeVersion);
		System.out.println(vehiclecode);
		System.out.println(vehreg);
		System.out.println(custname);
		
		
		
		//mobno=mobno+","+"7588793046";
		
		
		if(operation.equalsIgnoreCase("Installtion")){
		try
		{
			String peripheral="-";
			int OS1=0,OS2=0,OS=0,ST=0,TX=0,RA=0,RD=0;
			String sql="select peripherals from db_gps.t_unitmaster  where unitid='"+unitid+"'";
			ResultSet rs=st1.executeQuery(sql);
			if(rs.next()){
				peripheral=rs.getString("peripherals");
				System.out.println(peripheral);
			}
			if(custname.equalsIgnoreCase("none")){
				
				String sql2="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
				"	from db_gps.t_defaultvals " +
				"	where OwnerName='"+OwnerName.trim()+"' ";
				ResultSet rs2=st2.executeQuery(sql2);
				if(rs2.next()){
					OS=rs2.getInt("Overspeedlimit");
					RD=rs2.getInt("DecelerationSpeedVarLimit");
					RA=rs2.getInt("AccelerationSpeedVarLimit");
					OS1=rs2.getInt("OS1");
					OS2=rs2.getInt("OS2");
					ST=rs2.getInt("ST");
					TX=rs2.getInt("TX");
				}else{
					String sql3="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
					"	from db_gps.t_defaultvals " +
					"	where OwnerName='default' ";
					ResultSet rs3=st3.executeQuery(sql3);
					if(rs3.next()){
						OS=rs3.getInt("Overspeedlimit");
						RD=rs3.getInt("DecelerationSpeedVarLimit");
						RA=rs3.getInt("AccelerationSpeedVarLimit");
						OS1=rs3.getInt("OS1");
						OS2=rs3.getInt("OS2");
						ST=rs3.getInt("ST");
						TX=rs3.getInt("TX");
					}
				}
			}else{
				String sql1="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
					"	from db_gps.t_defaultvals " +
					"	where OwnerName='"+custname.trim()+"' ";
				ResultSet rs1=st1.executeQuery(sql1);
				if(rs1.next()){
					OS=rs1.getInt("Overspeedlimit");
					RD=rs1.getInt("DecelerationSpeedVarLimit");
					RA=rs1.getInt("AccelerationSpeedVarLimit");
					OS1=rs1.getInt("OS1");
					OS2=rs1.getInt("OS2");
					ST=rs1.getInt("ST");
					TX=rs1.getInt("TX");
				}else{
					String sql2="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
					"	from db_gps.t_defaultvals " +
					"	where OwnerName='"+OwnerName.trim()+"' ";
					ResultSet rs2=st2.executeQuery(sql2);
					if(rs2.next()){
						OS=rs2.getInt("Overspeedlimit");
						RD=rs2.getInt("DecelerationSpeedVarLimit");
						RA=rs2.getInt("AccelerationSpeedVarLimit");
						OS1=rs2.getInt("OS1");
						OS2=rs2.getInt("OS2");
						ST=rs2.getInt("ST");
						TX=rs2.getInt("TX");
					}else{
						String sql3="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
						"	from db_gps.t_defaultvals " +
						"	where OwnerName='default' ";
						ResultSet rs3=st3.executeQuery(sql3);
						if(rs3.next()){
							OS=rs3.getInt("Overspeedlimit");
							RD=rs3.getInt("DecelerationSpeedVarLimit");
							RA=rs3.getInt("AccelerationSpeedVarLimit");
							OS1=rs3.getInt("OS1");
							OS2=rs3.getInt("OS2");
							ST=rs3.getInt("ST");
							TX=rs3.getInt("TX");
						}
					}
				}
			}
			System.out.println("REPPP%%%%%%%%%%ST"+ST);
			System.out.println("REPPP%%%%%%%%%%TX"+TX);
			System.out.println("REPPP%%%%%%%%%%OS"+OS);
			System.out.println("REPPP%%%%%%%%%%OS1"+OS1);
			System.out.println("REPPP%%%%%%%%%%OS2"+OS2);
			System.out.println("REPPP%%%%%%%%%%RA"+RA);
			System.out.println("REPPP%%%%%%%%%%RD"+RD);
			if(peripheral.contains("JRM")){
				OS=65; //////change it to 65 from 66
				OS1=30;
				OS2=40;
			}
			System.out.println("REPPP^^^^^^^^^^ST"+ST);
			System.out.println("REPPP^^^^^^^^^^TX"+TX);
			System.out.println("REPPP^^^^^^^^^^OS"+OS);
			System.out.println("REPPP^^^^^^^^^^OS1"+OS1);
			System.out.println("REPPP^^^^^^^^^^OS2"+OS2);
			System.out.println("REPPP^^^^^^^^^^RA"+RA);
			System.out.println("REPPP^^^^^^^^^^RD"+RD);
			try{
			    String SmsFormat="";
				String sqlSms="select Message from db_gps.t_messageFormat where Parameter='ST'";
				System.out.println(sqlSms);
				ResultSet rsSms=st1.executeQuery(sqlSms);
				if(rsSms.next()){
				 SmsFormat=rsSms.getString("Message");
				 System.out.println(SmsFormat);
				 String sms="";
				 
				 			 
				 
				 int parameterValueForTX=0,parameterValueForST=0;
				 
				 if(CodeVersion.contains("M12_avl1pt1") || 
						 CodeVersion.contains("SIMARM")|| CodeVersion.contains("AVL_LITE")||
						 	CodeVersion.contains("FM2200")||CodeVersion.contains("TWP3_TS")||
						 	CodeVersion.contains("TW_P1_TS_RTC")){
				 
				 }else{
					 parameterValueForST=(ST*1000)/100;
				 	 System.out.println(parameterValueForST);
				 	 parameterValueForTX=(TX*1000)/100;
				 	 System.out.println(parameterValueForTX);
				 	 
				 	 
				 	 
				 	 
				 	 
				 	 
/////////////////////////////code to append zero
				 	 
					 	System.out.println(">>>parameterValueForST>>BEFORE>>>>"+parameterValueForST);
						System.out.println(">>>parameterValueForTX>BEFORE>>"+parameterValueForTX);
					 	 
					 	 
						//parameterValueForST=9;
						//parameterValueForTX=3;
						
						
					 	 int lt1=getLength(parameterValueForST);
						 
						 int lt2=getLength(parameterValueForTX);
						 
						 
						 System.out.println(">>>lt1>>>"+lt1);
						 System.out.println(">>>lt2>>>"+lt2);
						 
						 int char_toapnd=5-lt1;
						 int char_toapnd1=5-lt2;
						 
						 
						 System.out.println(">>>char_toapnd>>>"+char_toapnd);
						 System.out.println(">>>char_toapnd1>>>"+char_toapnd1);
						 
						 
						String parameterValueForST_new=getFinalAppendVal(parameterValueForST,char_toapnd);
						 
						String	 parameterValueForTX_new =getFinalAppendVal(parameterValueForTX,char_toapnd1);
						 
						//  String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=mobeye&sender=transw&cdmasender=&to="+mobno+"&message="+sms;
						
						System.out.println(">>>parameterValueForST_new>  AFTER>>"+parameterValueForST_new);
						System.out.println(">>>parameterValueForTX_new> AFTER>>"+parameterValueForTX_new);
					 	 
					 	 
						
						//////////
						
					 	 
					 	 SmsFormat=SmsFormat.replace("ST",parameterValueForST_new+"");
					 	 SmsFormat=SmsFormat.replace("TX",parameterValueForTX_new+"");
					 	 System.out.println(">>>>sms>>"+SmsFormat);
					 	 SmsFormat="UI"+unitid+SmsFormat;
						 sms=URLEncoder.encode(SmsFormat);
						 System.out.println(">>>SMS>>>AFTER APPENDING%%%%%%%%%%%%%>"+sms);
						 
						 if(sms.contains("%23") || sms.contains("%3A") || sms.contains("%2C"))
						 {
							
						 
						 
							sms=sms.replace("%23","#"); 
							sms=sms.replace("%3A",":"); 
							sms=sms.replace("%2C"," "); 
							
							System.out.println(">>>Afeter onVersion>>>>>sms>>>"+sms);
							 
							 
						 }
						 
						 				 
						
						
						
						System.out.println(">>>Afeter ConVersion>>>>>sms>>>"+sms);
						 
						 
						 String smsurl="";
						 
						 
						 String newmsg="insert into db_gps.t_serveralerts "+ 
							"(UnitID,Message,MobNo,SentStatus,EntryBy,MsgType,SenderID,VehicleRegNo,Transporter) values ("+
							"  '"+unitid+"','"+sms+"','"+mobno+"','No','DiarySystem-NewInstallation','ST,TX parameter','"+entby+"','"+vehreg+"','"+OwnerName+"' )";
							System.out.println("sqlSentMessage===newmsg=>"+newmsg);
						st5.executeUpdate(newmsg);
						System.out.println("sqlSentMessage== after of installtiopn =newmsg=>"+newmsg);
					 
					// smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=FleetView&to="+mobno+"&message="+sms+"&gateway=regular";
					  URL url=new URL(smsurl);
						
					  URLConnection connection = url.openConnection();
						connection.connect();
						BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
						String line;
						while ((line = in.readLine()) != null )
						{
							String sqlSentMessage="insert into db_gps.t_msgSentDetails "+ 
							"(UnitID,MobNo,ActualMsg,MsgType,SenderID,Date_Time,VehicleRegNo,Transporter,ConfStatus,EntBy) values ("+
							"'"+unitid+"','"+mobno+"','"+SmsFormat+"','ST,TX parameter','"+entby+"','"+formatter1.format(d)+"','"+vehreg+"','"+OwnerName+"','Pending','Auto')";
							System.out.println("sqlSentMessage====>"+sqlSentMessage);
							st2.executeUpdate(sqlSentMessage);
						}
				 	}
				 }
				}catch(Exception e){
					e.printStackTrace();
				}
				try{
					String SmsFormat="";
					String sqlSms1="select Message from db_gps.t_messageFormat where Parameter='RA'";
					System.out.println(sqlSms1);
					ResultSet rsSms1=st1.executeQuery(sqlSms1);
					if(rsSms1.next()){
					 SmsFormat=rsSms1.getString("Message");
					 System.out.println(SmsFormat);
					 String sms="";
					 if(CodeVersion.contains("M12_avl1pt1") || 
							 CodeVersion.contains("SIMARM")|| CodeVersion.contains("AVL_LITE")||
							 	CodeVersion.contains("FM2200")||CodeVersion.contains("TWP3_TS")||
							 	CodeVersion.contains("TW_P1_TS_RTC")){
						 
					 }else{
						 int parameterValueForOS=0,parameterValueForRA=0;
					 	if(RA>RD){
					 		parameterValueForRA=RD;
					 	}else{
							 parameterValueForRA=RA;
					 	}
					 	System.out.println(parameterValueForRA);
					 	parameterValueForOS=OS;
					 	 System.out.println(parameterValueForOS);
					 	SmsFormat=SmsFormat.replace("RA",parameterValueForRA+"");
					 	SmsFormat=SmsFormat.replace("OS1",OS1+"");
					 	SmsFormat=SmsFormat.replace("OS2",OS2+"");
					 	SmsFormat=SmsFormat.replace("OS",parameterValueForOS+"");
					 	
					 	System.out.println(SmsFormat);
					 	sms="UI"+unitid+SmsFormat;
					 	Format formatter2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					 	
					 	////////inserted RA,RD parameters into sms table
					 	
					 	 System.out.println(">>>Afeter ConVersion>>FOr BEFORE RA%%%%>>>sms>>>"+sms);
						 	
						 	if(sms.contains(","))
							 {
								
							 
							 
								sms=sms.replace(","," "); 
								
								
								
								 
								 
							 }
							//  String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=mobeye&sender=transw&cdmasender=&to="+mobno+"&message="+sms;
							
							 System.out.println(">>>Afeter ConVersion>>FOr RA%%%%>>>sms>>>"+sms);
						 	
						 	
						 	
						 	
						 	
	              // 			      	 st2.executeUpdate("insert into db_gps.t_msgNotSendDetails(UnitID,MobNo,Msg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"') ");
						
						 	st2.executeUpdate("insert into db_gps.t_serveralerts(UnitID,MobNo,Message,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter,SentStatus,EntryBy) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"','No','DiarySystem-NewInstallation') ");
						 
						 	System.out.println("sqlSentMessage=  Replacement=ELSE LOOP=newmsg=>"+"insert into db_gps.t_serveralerts(UnitID,MobNo,ActualMsg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter,SentStatus,EntryBy) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"','No','DiarySystem-NewInstallation') ");
					 	
					 	//////////////////
					 	
					 	
					    //st2.executeUpdate("insert into db_gps.t_msgNotSendDetails(UnitID,MobNo,Msg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"') ");
					} }
					}catch(Exception e){
						e.printStackTrace();
					}
		  String sqlveh="update db_gps.t_vehicledetails set ST='"+ST+"',TX='"+TX+"',RA='"+RA+"',RD='"+RD+"',OS='"+OS+"',OS1='"+OS1+"',OS2='"+OS2+"' where VehicleCode='"+vehiclecode+"'";
	    	 st1.executeUpdate(sqlveh);		
		}catch (Exception e) {
			
			System.out.print("SMS Sending Exception --->"+e);
		}
	}else if(operation.equalsIgnoreCase("Replacement")){
		try{
			
			
			System.out.println("$$$$$$$$$$$$$$$$$$$INSTALLATION LOOP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			
			String peripheral="-";
			int OS1=0,OS2=0,OS=0,ST=0,TX=0,RA=0,RD=0;
			
			
//		/	String sql="select peripheral from db_CustomerComplaints.t_utcodever where codever='"+CodeVersion.trim()+"'";
			
			String sql="select peripherals from db_gps.t_unitmaster  where unitid='"+unitid+"'";
			
			ResultSet rs=st1.executeQuery(sql);
			if(rs.next()){
				peripheral=rs.getString("peripherals");
				System.out.println(peripheral);
			}

			/*
			String sqlvehicle="select OS,RA,RD,ST,TX,OS1,OS2 " +
			"	from db_gps.t_vehicledetails " +
			"	where vehicleCode='"+vehiclecode+"' ";
			ResultSet rsvehicle=st1.executeQuery(sqlvehicle);
			if(rsvehicle.next()){
				OS=rsvehicle.getInt("OS");
				RD=rsvehicle.getInt("RD");
				RA=rsvehicle.getInt("RA");
				OS1=rsvehicle.getInt("OS1");
				OS2=rsvehicle.getInt("OS2");
				ST=rsvehicle.getInt("ST");
				TX=rsvehicle.getInt("TX");
			}
			
			*/
			//removed else loop for vehicle details query
				
				
				String sql2="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
				"	from db_gps.t_defaultvals " +
				"	where OwnerName='"+OwnerName.trim()+"' ";
				ResultSet rs2=st2.executeQuery(sql2);
				System.out.println("sql2==>"+sql2);
				if(rs2.next()){
					OS=rs2.getInt("Overspeedlimit");
					RD=rs2.getInt("DecelerationSpeedVarLimit");
					RA=rs2.getInt("AccelerationSpeedVarLimit");
					OS1=rs2.getInt("OS1");
					OS2=rs2.getInt("OS2");
					ST=rs2.getInt("ST");
					TX=rs2.getInt("TX");
				}else{
					String sql3="select Overspeedlimit,DecelerationSpeedVarLimit,AccelerationSpeedVarLimit,ST,TX,OS1,OS2 " +
					"	from db_gps.t_defaultvals " +
					"	where OwnerName='default' ";
					ResultSet rs3=st3.executeQuery(sql3);
					System.out.println("sql3==>"+sql3);
					if(rs3.next()){
						OS=rs3.getInt("Overspeedlimit");
						RD=rs3.getInt("DecelerationSpeedVarLimit");
						RA=rs3.getInt("AccelerationSpeedVarLimit");
						OS1=rs3.getInt("OS1");
						OS2=rs3.getInt("OS2");
						ST=rs3.getInt("ST");
						TX=rs3.getInt("TX");
					}
				}
			
			System.out.println("%%%%%%%%%%ST"+ST);
			System.out.println("%%%%%%%%%%TX"+TX);
			System.out.println("%%%%%%%%%%OS"+OS);
			System.out.println("%%%%%%%%%%OS1"+OS1);
			System.out.println("%%%%%%%%%%OS2"+OS2);
			System.out.println("%%%%%%%%%%RA"+RA);
			System.out.println("%%%%%%%%%%RD"+RD);
			if(peripheral.contains("JRM")){
				OS=65;////////////change it to 65 from 66
				OS1=30;
				OS2=40;
			}
			System.out.println("^^^^^^^^^^ST"+ST);
			System.out.println("^^^^^^^^^^TX"+TX);
			System.out.println("^^^^^^^^^^OS"+OS);
			System.out.println("^^^^^^^^^^OS1"+OS1);
			System.out.println("^^^^^^^^^^OS2"+OS2);
			System.out.println("^^^^^^^^^^RA"+RA);
			System.out.println("^^^^^^^^^^RD"+RD);
			
			try{
			    String SmsFormat="";
				String sqlSms="select Message from db_gps.t_messageFormat where Parameter='ST'";
				System.out.println(sqlSms);
				ResultSet rsSms=st1.executeQuery(sqlSms);
				if(rsSms.next()){
				 SmsFormat=rsSms.getString("Message");
				 System.out.println(SmsFormat);
				 String sms="";
				 int parameterValueForTX=0,parameterValueForST=0;
				 
				 if(CodeVersion.contains("M12_avl1pt1") || 
						 CodeVersion.contains("SIMARM")|| CodeVersion.contains("AVL_LITE")||
						 	CodeVersion.contains("FM2200")||CodeVersion.contains("TWP3_TS")||
						 	CodeVersion.contains("TW_P1_TS_RTC")){
				 
				 }else{
					 parameterValueForST=(ST*1000)/100;
				 	 System.out.println(parameterValueForST);
				 	 parameterValueForTX=(TX*1000)/100;
				 	 System.out.println(parameterValueForTX);
				 	 
				 	 
				 	 
				 	 
				 	 
				 	 
				 	 /////////////////////////////code to append zero
				 	 
					 	
					 	//parameterValueForST=9;
						//parameterValueForTX=3;
					 	 
					 	 System.out.println(">>>parameterValueForST>>BEFORE>>>>"+parameterValueForST);
						System.out.println(">>>parameterValueForTX>BEFORE>>"+parameterValueForTX);
					 	 
					 	 
					 	 int lt1=getLength(parameterValueForST);
						 
						 int lt2=getLength(parameterValueForTX);
						 
						 
						 System.out.println(">>>lt1>>>"+lt1);
						 System.out.println(">>>lt2>>>"+lt2);
						 
						 int char_toapnd=5-lt1;
						 int char_toapnd1=5-lt2;
						 
						 
						 System.out.println(">>>char_toapnd>>>"+char_toapnd);
						 System.out.println(">>>char_toapnd1>>>"+char_toapnd1);
						 
						 
						String parameterValueForST_new=getFinalAppendVal(parameterValueForST,char_toapnd);
						 
						String	 parameterValueForTX_new =getFinalAppendVal(parameterValueForTX,char_toapnd1);
						 
						//  String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=mobeye&sender=transw&cdmasender=&to="+mobno+"&message="+sms;
						
						System.out.println(">>>parameterValueForST_new>  AFTER>>"+parameterValueForST_new);
						System.out.println(">>>parameterValueForTX_new> AFTER>>"+parameterValueForTX_new);
					 	 
					 	 /////////////
					 	 
					 	 
					 	 
					 	 
					 	 
					 	 
					 	 
					 	 SmsFormat=SmsFormat.replace("ST",parameterValueForST_new+"");
					 	 SmsFormat=SmsFormat.replace("TX",parameterValueForTX_new+"");
					 	 System.out.println(SmsFormat);
					 	 SmsFormat="UI"+unitid+SmsFormat;
						 sms=URLEncoder.encode(SmsFormat);
						 
						 
						 if(sms.contains("%23") || sms.contains("%3A") || sms.contains("%2C"))
						 {
							
						 
						 
							sms=sms.replace("%23","#"); 
							sms=sms.replace("%3A",":"); 
							sms=sms.replace("%2C"," "); 
							
							System.out.println(">>>Afeter onVersion>>>>>sms>>>"+sms);
							 
							 
						 }
						 
						 				 
						
						
						
						System.out.println(">>>Afeter ConVersion>Replacement>>>>sms>>>"+sms);
						 
						 System.out.println("Replacement SMS format>>>>>"+sms);
						//  String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=mobeye&sender=transw&cdmasender=&to="+mobno+"&message="+sms;
						 
						 String smsurl="";
						 // smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=FleetView&to="+mobno+"&message="+sms+"&gateway=regular";
						 
						 String newmsg="insert into db_gps.t_serveralerts "+ 
							"(UnitID,Message,MobNo,SentStatus,EntryBy,MsgType,SenderID,VehicleRegNo,Transporter) values ("+
							"  '"+unitid+"','"+sms+"','"+mobno+"','No','DiarySystem-Replacement','ST,TX parameter','"+entby+"','"+vehreg+"','"+OwnerName+"' )";
							System.out.println("sqlSentMessage==ELSE LOOP=newmsg=>"+newmsg);
					  
						System.out.println("sqlSentMessage= AFTEr=ELSE LOOP=newmsg=>"+newmsg);
						st5.executeUpdate(newmsg);
						
						
						
						
					  URL url=new URL(smsurl);
						URLConnection connection = url.openConnection();
						connection.connect();
						BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
						String line;
						while ((line = in.readLine()) != null )
						{
							String sqlSentMessage="insert into db_gps.t_msgSentDetails "+ 
							"(UnitID,MobNo,ActualMsg,MsgType,SenderID,Date_Time,VehicleRegNo,Transporter,ConfStatus,EntBy) values ("+
							"'"+unitid+"','"+mobno+"','"+SmsFormat+"','ST,TX parameter','"+entby+"','"+formatter1.format(d)+"','"+vehreg+"','"+OwnerName+"','Pending','Auto')";
							System.out.println("sqlSentMessage====>"+sqlSentMessage);
							//st2.executeUpdate(sqlSentMessage);
						}
				 	}
				 }
				}catch(Exception e){
					e.printStackTrace();
				}
				try{
					String SmsFormat="";
					String sqlSms1="select Message from db_gps.t_messageFormat where Parameter='RA'";
					System.out.println(sqlSms1);
					ResultSet rsSms1=st1.executeQuery(sqlSms1);
					if(rsSms1.next()){
					 SmsFormat=rsSms1.getString("Message");
					 System.out.println(SmsFormat);
					 String sms="";
					 if(CodeVersion.contains("M12_avl1pt1") || 
							 CodeVersion.contains("SIMARM")|| CodeVersion.contains("AVL_LITE")||
							 	CodeVersion.contains("FM2200")||CodeVersion.contains("TWP3_TS")||
							 	CodeVersion.contains("TW_P1_TS_RTC")){
						 
					 }else{
						 int parameterValueForOS=0,parameterValueForRA=0;
					 	if(RA>RD){
					 		parameterValueForRA=RD;
					 	}else{
							 parameterValueForRA=RA;
					 	}
					 	System.out.println(parameterValueForRA);
					 	parameterValueForOS=OS;
					 	 System.out.println(parameterValueForOS);
					 	SmsFormat=SmsFormat.replace("RA",parameterValueForRA+"");
					 	SmsFormat=SmsFormat.replace("OS1",OS1+"");
					 	SmsFormat=SmsFormat.replace("OS2",OS2+"");
					 	SmsFormat=SmsFormat.replace("OS",parameterValueForOS+"");
					 	
					 	System.out.println(SmsFormat);
					 	sms="UI"+unitid+SmsFormat;
					 	Format formatter2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					    /////////inserted RA,RD table into sms table
					 	
					 	
					 	
					 	 System.out.println(">>>Afeter ConVersion>>FOr BEFORE RA%%%%>>>sms>>>"+sms);
						 	
						 	if(sms.contains(","))
							 {
								
							  
								sms=sms.replace(","," "); 
														 
							 }
						 	
						 	
						 	 System.out.println(">>>Afeter ConVersion REPLACENT>FOr RA%%%%>>>sms>>>"+sms);				 	
						 					 	
						 	//st2.executeUpdate("insert into db_gps.t_msgNotSendDetails(UnitID,MobNo,Msg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"') ");
						
						 	st2.executeUpdate("insert into db_gps.t_serveralerts(UnitID,MobNo,Message,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter,SentStatus,EntryBy) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"','No','DiarySystem-Replacement') ");
						 	System.out.println("sqlSentMessage=  Replacement=ELSE LOOP=newmsg=>"+"insert into db_gps.t_serveralerts(UnitID,MobNo,ActualMsg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter,SentStatus,EntryBy) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"','No','DiarySystem-Replacement') ");
						 	
					 	
					 	/////////////////////
					 	
					 	
					 	
					 	//st2.executeUpdate("insert into db_gps.t_msgNotSendDetails(UnitID,MobNo,Msg,InsertedDateTime,MsgType,SenderID,VehicleRegNo,Transporter) values ('"+unitid+"','"+mobno+"','"+sms+"','"+formatter2.format(d)+"','RA,RD,OS parameter','"+entby+"','"+vehreg+"','"+OwnerName+"') ");
					} }
					}catch(Exception e){
						e.printStackTrace();
					}
					String sqlveh="update db_gps.t_vehicledetails set ST='"+ST+"',TX='"+TX+"',RA='"+RA+"',RD='"+RD+"',OS='"+OS+"',OS1='"+OS1+"',OS2='"+OS2+"' where VehicleCode='"+vehiclecode+"'";
			    	 st1.executeUpdate(sqlveh);		
		}catch(Exception e){
			
		}
	}
		  //CloseConnection();
	}
				

	
	public void  CreateTable( int nextvehcode)
	{
		System.out.println(" AGAIN  CREATE TABLE FOR VEHICLE CODE==>"+nextvehcode);
		
		try{
			
			if(stmt1.isClosed())
			{
				
				System.out.println("EXCEPTION CONNECTION BRAKED ......CONNECT AGAIN");
				GetConnection();
				
				
			}
			
		}catch(Exception e22)
		{
			
			System.out.println("EXCEPTION CONNECTION BRAKED .."+e22);
		}
		
		
		
		try{
			
			/*
			String sqlforvehcode="CREATE TABLE IF NOT EXISTS t_veh"+nextvehcode+" ("+
			" `TheFieldDataDate` date default NULL,"+
			" `TheFieldDataTime` time default NULL,"+
			" `Latitude` double default '0',"+
			" `LatitudeDir` varchar(10) default '-',"+
			" `Longitude` double default '0',"+
			" `LongitudeDir` varchar(10) default '-',"+
			" `DataValid` varchar(10) default '-',"+
			" `Speed` double default '0',"+
			" `DirectionDegree` double default '0',"+
			" `TheFiledTextFileName` varchar(100) default '-',"+
			" `TheFieldDataStoredDate` date default NULL,"+
			" `TheFieldDataStoredTime` time default NULL,"+
			" `TheFieldEmailFrom` varchar(100) default '-',"+
			" `TheFieldEmailTo` varchar(100) default '-',"+
			" `TheFieldDataID` varchar(10) default '-',"+
			" `TheFieldFileDate` date default NULL,"+
			" `TheFieldFileTime` time default NULL,"+
			" `TheFieldAutoNum` double default NULL,"+
			" `TheFieldSubject` varchar(100) default '-',"+
			" `LocatorStatus` tinyint(3) unsigned default '0',"+
			" `EngineStatus` varchar(100) default '-',"+
			" `VoiceStatus` varchar(100) default '-',"+
			" `RegistrationNo` varchar(100) default '-',"+
			" `FuelLevel` tinyint(3) unsigned default '0',"+
			" `Distance` double default '0',"+
			" `RouteID` int(11) default '0',"+
			" `ZoneID` int(11) default '0',"+
			" `ZoneDesc` varchar(20) default '-',"+
			" `LatinDec` double default '0',"+
			" `LonginDec` double default '0',"+
			" `Sen1` varchar(50) default '-',"+
			" `Sen2` varchar(50) default '-',"+
			" `Sen3` varchar(50) default '-',"+
			" `Sen4` varchar(50) default '-',"+
			" `CDistance` double default '0',"+
			" `Thefielddatadatetime` datetime default NULL,"+
			" `RDataMailDateTime` datetime default NULL,"+
			" `RDataStoredTime` datetime default NULL,"+
			" KEY `DateTime` (`TheFieldDataDate`,`TheFieldDataTime`,`TheFiledTextFileName`),"+
			" KEY `stampdate` (`TheFieldDataDateTime`,`TheFiledTextFileName`),"+
			" KEY `dttime` (`Thefielddatadatetime`)"+
			"  ) ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
			
			
			String sqlforvehcode="CREATE TABLE IF NOT EXISTS t_veh"+nextvehcode+" like db_gps.t_veh5";
			
			stmt1.executeUpdate(sqlforvehcode);
		//	String abcd9=sqlforvehcode.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt1.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"+abcd9+"')");
			//System.out.println(sqlforvehcode);

			System.out.println("Query 1==>"+sqlforvehcode);
		

			}catch(Exception e){
				System.out.println("Exception 1==>"+e);
			}

			try{
			
				/*
				String sqlfordistance="CREATE TABLE  IF NOT EXISTS db_avlalldata.t_distancecorrection_"+nextvehcode+" ( "+
			"  `rid` int(10) unsigned NOT NULL auto_increment,"+
			"  `InsertDateTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"  `vehid` varchar(50) default '0',"+
			"  `PrevCorrFactor` double default '0',"+
			"  `NewCorrFactor` double default '0',"+
			"  `PrevStampDateTime` timestamp NULL default NULL,"+
			"  `NewStampDateTime` timestamp NULL default NULL,"+
			"  `PreStamp` varchar(50) default '-',"+
			"  `NewStamp` varchar(50) default '-',"+
			"  `PrevDist` double default '0',"+
			"  `NewDist` double default '0',"+
			"  `Reason` varchar(100) default '-',"+
			"  KEY `NewIndex` (`rid`),"+
			 " KEY `vehid` (`vehid`),"+
			"  KEY `gg` (`vehid`,`NewStampDateTime`)"+
			") ENGINE=MyISAM AUTO_INCREMENT=7543 DEFAULT CHARSET=latin1";
			
				*/
				
				String sqlfordistance="CREATE TABLE IF NOT EXISTS   db_avlalldata.t_distancecorrection_"+nextvehcode+" like  db_avlalldata.t_distancecorrection_5 ";
				
				stmt2.executeUpdate(sqlfordistance);
			//String abcd9=sqlfordistance.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt2.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_avlalldata','"+abcd9+"')");

			System.out.println("Query 1==>"+sqlfordistance);

			}catch(Exception e){
				
				System.out.println("Exception 2==>"+e);
				
				
			}
			try{
			
				
				/*
				String sqlfords="CREATE TABLE IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_ds ("+
			"  `VehCode` int(10) unsigned default '0',"+
			"  `TheDate` date default NULL,"+
			"  `OSCount` int(3) unsigned default '0',"+
			"  `OSDuration` double NOT NULL default '0',"+
			"  `RACount` int(3) unsigned default '0',"+
			"  `RDCount` int(3) unsigned default '0',"+
			"  `CRCount` int(3) unsigned default '0',"+
			"  `ND` varchar(10) default 'No',"+
			"  `Distance` double default '0',"+
			"  `Rating` double NOT NULL default '0',"+
			"  `Location` varchar(255) default '-',"+
			"  `StopCount` int(3) unsigned default '0',"+
			"  `RDuration` varchar(100) default '-',"+
			"  `RDinSec` double default '0',"+
			"  `NRDDuration` double default '0',"+
			"  `DName` varchar(50) default '-',"+
			"  `DID` varchar(50) default '-',"+
			"  `JCode` varchar(50) default '-',"+
			"  `DCode` varchar(50) default '-',"+
			"  `Transporter` varchar(100) default NULL,"+
			"  `FC` double default '0',"+
			"  `FAVG` double default '0',"+
			"  `FuelValue` double default '0',"+
			"  `Refuel` double default '0',"+
			"  `Fueltheft` double default '0',"+
			"  `FTCount` int(3) default '0',"+
			"  `FACount` double default '0',"+
			"  `UpdatedDt` datetime default NULL,"+
			"  `RDurationinHrs` double unsigned default '0',"+
			"  `DayRDuration` varchar(50) default '-',"+
			"  `DayRDurationinHrs` double default '0',"+
			"  `NightRDuration` varchar(50) default '-',"+
			"  `NightRDurationinHrs` double default '0',"+
			"  `StopDuration` varchar(50) default '-',"+
			"  `StopDurationinHrs` double default '0',"+
			"  `DayStopDuration` varchar(50) default '-',"+
			"  `DayStopDurationinHrs` double default '0',"+
			"  `NightStopDuration` varchar(50) default '-',"+
			"  `NightStopDurationinHrs` double default '0',"+
			"  `RAvg` double unsigned default '0',"+
			"  `Last7DayRDuration` time default '00:00:00',"+
			"  `Last7DayRDurationinHrs` double default '0',"+
			"  `UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"  `gapkm` double NOT NULL default '0',"+
			"  `disconnkm` double NOT NULL default '0',"+
			"  `gapdur` double NOT NULL default '0',"+
			"  `disconndur` double NOT NULL default '0',"+
			"  `Disconnection` varchar(20) NOT NULL default 'No',"+
			" `Gap` varchar(20) NOT NULL default 'No',"+
			"  `UnitId` varchar(20) NOT NULL default '-',"+
			"  `Version` varchar(100) NOT NULL default '-',"+
			" `AvgSpeedConsidered` varchar(100) NOT NULL default '-',"+
			"  KEY `NewIndex` (`TheDate`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
			
			
				String sqlfords="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_ds like db_gpsExceptions.t_veh5_ds";
				
			stmt3.executeUpdate(sqlfords);
			//String abcd9=sqlfords.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt3.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");

			
			System.out.println("Query 1==>"+sqlfords);
			
			}catch(Exception e){
				
				System.out.println("Exception 3==>"+e);
				
				
			}
			try{
			
				
				/*
				String sqlforoverspeed="CREATE TABLE IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_overspeed ( "+
			"  `VehCode` int(10) unsigned default '0',"+
			"  `FromDate` date default NULL,"+
			"  `FromTime` time default NULL,"+
			"  `ToDate` date default NULL,"+
			"  `ToTime` time default NULL,"+
			"  `Speed` int(3) unsigned default '0',"+
			"  `Duration` int(10) unsigned default '0',"+
			"  `JCode` varchar(50) default '-',"+
			"  `DCode` varchar(50) default '-',"+
			"  `Transporter` varchar(100) default NULL,"+
			"  `UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"  `Zone` varchar(20) NOT NULL default '-',"+
			"  KEY `NewIndex` (`FromDate`,`FromTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
				
				
				String sqlforoverspeed="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_overspeed like db_gpsExceptions.t_veh5_overspeed  "  ;
			
			
			stmt4.executeUpdate(sqlforoverspeed);
		//	String abcd9=sqlforoverspeed.replace("'","#");	
	//		abcd9=abcd9.replace(",","$");								
//			stmt4.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");

			
			System.out.println("Query 1==>"+sqlforoverspeed);
			
			
			}catch(Exception e){
				
				
				
				System.out.println("Exception 4==>"+e);
				
			}
			try{
			
				/*
				String sqlforra="CREATE TABLE  IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_ra ("+
			"  `VehCode` int(10) unsigned default '0',"+
			"  `TheDate` date default NULL,"+
			 " `TheTime` time default NULL,"+
			"  `FromSpeed` int(3) unsigned default '0',"+
			 " `ToSpeed` int(3) unsigned default '0',"+
			 " `JCode` varchar(50) default '-',"+
			"  `DCode` varchar(50) default '-',"+
			 " `Transporter` varchar(100) default NULL,"+
			 " `UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"  KEY `NewIndex` (`TheDate`,`TheTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
				
				String sqlforra="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_ra like db_gpsExceptions.t_veh5_ra ";
			
			
			
			stmt5.executeUpdate(sqlforra);
		//	String abcd9=sqlforra.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt5.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");

			System.out.println("Query 1==>"+sqlforra);
			
			}catch(Exception e){
				
				System.out.println("Exception 5==>"+e);
				
				
			}
			try{
			
				
				/*
				String sqlforrd="CREATE TABLE  IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_rd ("+
			"  `VehCode` int(10) unsigned default '0',"+
			"  `TheDate` date default NULL,"+
			"  `TheTime` time default NULL,"+
			"  `FromSpeed` int(3) unsigned default '0',"+
			"  `ToSpeed` int(3) default '0',"+
			"  `JCode` varchar(50) default '-',"+
			"  `DCode` varchar(50) default '-',"+
			"  `Transporter` varchar(100) default NULL,"+
			"  `UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			" KEY `NewIndex` (`TheDate`,`TheTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			
			*/
				String sqlforrd="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_rd like db_gpsExceptions.t_veh5_rd";
			stmt6.executeUpdate(sqlforrd);
		//	String abcd9=sqlforrd.replace("'","#");	
		//	abcd9=abcd9.replace(",","$");								
	//		stmt6.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");
			System.out.println("sqlforrd 1==>"+sqlforrd);

			
			}catch(Exception e){
				
				System.out.println("Exception 6==>"+e);
				
				
			}
			try{

				
				/*
				String sqlfornd="CREATE TABLE  IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_nd ("+
			"  `VehCode` int(10) unsigned default '0',"+
			"  `FromDate` date default NULL,"+
			"  `FromTime` time default NULL,"+
			"  `ToDate` date default NULL,"+
			"  `ToTime` time default NULL,"+
			"  `Distance` double default '0',"+
			"  `Duration` varchar(100) default '-',"+
			"  `JCode` varchar(50) default '-',"+
			"  `DCode` varchar(50) default '-',"+
			"  `Transporter` varchar(100) default NULL,"+
			"  `UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"   NDPreAuthorised VARCHAR( 100 ) NOT NULL DEFAULT 'No', "+ 
			"   KEY `NewIndex` (`FromDate`,`FromTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
			
				String sqlfornd="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_nd like db_gpsExceptions.t_veh5_nd";
			
			stmt7.executeUpdate(sqlfornd);
			//String abcd9=sqlfornd.replace("'","#");	
		//	abcd9=abcd9.replace(",","$");								
			//stmt7.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");

			
			System.out.println("sqlfornd 1==>"+sqlfornd);

			
			

			}catch(Exception e){
				
				System.out.println("Exception 7==>"+e);
				
			}
			try{
			
				/*
				String sqlforstsp="CREATE TABLE IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_stsp ("+
			" `VehCode` int(10) unsigned default '0',"+
			"  `FromDate` date default NULL,"+
			"  `FromTime` time default NULL,"+
			"  `ToDate` date default NULL,"+
			"  `ToTime` time default NULL,"+
			"  `Duration` varchar(100) default '-',"+
			"  `Location` varchar(255) default '-',"+
			"  `JCode` varchar(50) default '-',"+
			"`DCode` varchar(50) default '-',"+
			"`Transporter` varchar(100) default NULL,"+
			"`UpdateDateTime` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,"+
			"`ValidWardStop` varchar(50) NOT NULL default 'No',"+
			" KEY `NewIndex` (`FromDate`,`FromTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
			
			
				String sqlforstsp="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_stsp like db_gpsExceptions.t_veh5_stsp";
			stmt8.executeUpdate(sqlforstsp);
			//String abcd9=sqlforstsp.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt8.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");


			
			System.out.println("sqlfornd 1==>"+sqlforstsp);
			
			
			}catch(Exception e){
				System.out.println("Exception 8==>"+e);
				
				
			}
			try{
			
				
				/*
				String sqlforcr="CREATE TABLE IF NOT EXISTS db_gpsExceptions.t_veh"+nextvehcode+"_cr ( "+
			"`VehCode` int(10) unsigned default '0', "+
			"`FromDate` date default NULL,"+
			"`FromTime` time default NULL,"+
			"`ToDate` date default NULL,"+
			"`ToTime` time default NULL,"+
			"`Duration` varchar(100) default '-',"+
			"`NoofStops` int(10) unsigned default '0',"+
			"`Distance` double default '0',"+
			"`JCode` varchar(50) default '-',"+
			"`DCode` varchar(50) default '-',"+
			"`Transporter` varchar(100) default NULL,"+
			"KEY `NewIndex` (`FromDate`,`FromTime`)"+
			") ENGINE=MyISAM DEFAULT CHARSET=latin1";
			*/
			
				String sqlforcr="CREATE TABLE IF NOT EXISTS   db_gpsExceptions.t_veh"+nextvehcode+"_cr like db_gpsExceptions.t_veh5_cr";
			
			stmt9.executeUpdate(sqlforcr);
			//String abcd9=sqlforcr.replace("'","#");	
			//abcd9=abcd9.replace(",","$");								
			//stmt9.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gpsExceptions','"+abcd9+"')");


			
			}catch(Exception e){
				
				System.out.println("Exception 9==>"+e);
				
			}
		
		
		
			System.out.print("CREATED THE VEHICLE TABLE +++++++********************--->");	
	}
	
	
	SendMsgParameter sm= new SendMsgParameter();
	
	
	//SendMsgParameter.
}
