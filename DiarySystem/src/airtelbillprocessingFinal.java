



import java.io.*;
	
import org.apache.commons.io.FileUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.io.File;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import java.text.*;
 
import javax.xml.parsers.*;
 public	class airtelbillprocessingFinal
	{
	 static Connection conn1=null;
	public	static Statement st=null;
		static Statement st1=null;
		static Statement st2=null;
		static Statement st3=null;
		static Statement st4=null;
		static Statement st5=null;
		public	static Statement st6=null;
		static Statement st7=null;
		static Statement st8=null;
		static Statement st9=null;
		static Statement st10=null;
		static Statement st11=null;
		static Statement st12=null;
		static Statement st13=null;
		static Statement st_update=null;
		
		
		static Statement st15=null;
		static Statement st16=null;
		static Statement st17=null;
		static Statement st18=null;
		static Statement st19=null;
		public static Connection con=null;
	//	public static Statement st11=null;
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
		static	String filepath1="";
		public static void GetConnection() { 
			try {
				String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
			    String MM_dbConn_USERNAME = "fleetview";
			    String MM_dbConn_PASSWORD = "1@flv";
			    
			    
			 //   String MM_dbConn_USERNAME = "java";
			  //  String MM_dbConn_PASSWORD = "transjava!1";
			    
			    
			  //  String MM_dbConn= "jdbc:mysql://103.241.181.36/airtelnew";
			    String MM_dbConn= "jdbc:mysql://192.168.2.35/airtelnew";
			    
			    
			    //String MM_dbConn= "jdbc:mysql://103.241.181.36/db_simbillstest";
//			    /String MM_dbConn= "jdbc:mysql://202.65.131.44/airtelnew";
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
			    
			    
			    st15 =  conn1.createStatement();
			    st16 =  conn1.createStatement();
			    st17 =  conn1.createStatement();
			    st18 =  conn1.createStatement();
			    st19 =  conn1.createStatement();
			    st_update=conn1.createStatement();
			    
			    
			        System.out.println("DONE WITH  connection.**************..");
			} catch (Exception e) {
				System.out.println("GetConnection Exception ---->" + e);
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
							
				conn1.close();
			} catch (Exception e) {
				System.out.print("CloseConnection Exception---->" + e);
			}

		}
	 
		public static void main(String args[])
	    {
	      
		 try
	  		{
			 
			 //System.out.print("55---->" );
			
	  		GetConnection();
	  		
	  
	  		//showExcelData(sheetData,file);
	  		// System.out.print("55--22222-->" );
	  		 filepath1=GetFolderPath();
	  		//filepath1="/home/javaprg/unprocessedFiles/Airtel5/Airterl5"; 
	  		
	  		
	  		filepath1="/home/a_thakur/Desktop/Airtel_Tess";
	  		
	  		System.out.println("========filepath1 been returned ========="+filepath1);
	  		
	  		 if(!(filepath1.equalsIgnoreCase("-")))
	  		 {
	  		BillingProcessing(filepath1);
	  		
	  		//DeletingprocessedFolder(filepath1);
	  		 }else{
	  			System.out.println("=========File is already been processed=========");
	  		 }
	  		 
	  		
	  		
	  		
	  		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  			System.out.println("\n\n Exception here...");
	  		}finally{
	  			
	  			CloseConnection();
	  			
	  		}
	    }
	 
		public static String GetFolderPath() throws SQLException 
		{
			 String currentdatetime=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			
			String filepath="-";
		//	String sql="select FilePath from db_gps.t_serviceproviderbillingDetails where ServiceProvider='Airtel'  and status='pending' and UpdatedDateTime >='"+currentdatetime+" 00:00:00' order by UpdatedDateTime desc  limit 1  ";
			//ResultSet rs=st1.executeQuery(sql);
			//System.out.println("sql====>"+sql);
			//if(rs.next()){
				//filepath=rs.getString("FilePath");
				
		//	}
			
			
			filepath="/home/a_thakur/Desktop/Airtel_Tess";
			//filepath1="/home/javaprg/unprocessedFiles/Airtel5/Airterl5"; 
			
			System.out.println("filepath====>"+filepath);
			return filepath;
		}
	 
		public static void BillingProcessing(String filepath) throws SQLException 
		{
			
			 try{
				 
				 System.out.print("1111111-->" );
				 System.out.print("filepath1--=============>"+filepath1);
		        // Open the file that is the first
		        // command line parameter
		 
		        //checks where the path is going ?????????????????????
		        
		    	  FileInputStream fstream=null;
		    	  
		    	  
		    	 // System.out.println(System.getProperty("user.dir"));
		         
		        //
		       
		        //File Folder = new File("/home/a_thakur/Desktop/Airtel_bill_Processing/Xml_files/");
		  //      File Folder = new File("/home/a_thakur/Desktop/SimBillingFolder/"+filepath1+"/");
		       
		    	  try{
		    	  
		        File Folder = new File(""+filepath1+"/");
		    	 
		        //GetFolderSize size=new GetFolderSize();
		        
		        File files[];
		        String files1=null,files2=null,file3=null;
		        File[] listOfFiles = Folder.listFiles();
		        
		       // File[] listOfFiles1 = Folder.;
		        
		        files = Folder.listFiles();
		       System.out.println(">>.length"+listOfFiles.length);  
		        
		    	String row="-",srno="-",date="-",time="-",numb="-",durtn_vol="-",amnt="-",discnt_call="-",mobno="-",billno="-",todate="-";
		        
		    	String acno="-",call_type="-",item_type="-";
		    	
		    	String token[]=null,token1[]=null,token2[]=null,token3[]=null,token4[]=null,token5[]=null,token6[]=null,token7[]=null,token8[]=null,token9[]=null;
		    	
		    	
		    	String mobno1="-",acnt_no="-",acnt_type="-",bill_no="-",bill_no_reset="-",bill_date="-",bill_period="-",prevs_bal="-",paymnt="-",adjstmnt="-",this_mnth_chrge="-",amnt_payby_date="-",amnt_payafter_date="-",onetm_charge="-",mnth_charge="-",call_recharge="-",val_added_servs="-",mob_intrnt_usage="-",roaming="-",discnt="-",late_fee="-",taxes="-",this_mnth_chrg="-";
		    	
		    	
		    	String acnt_type_subsumry="-",acnt_num="-",mob_sumsmry="-",acnt_sumsmry="-";
		    	
		    	String token31[]=null,token11[]=null,token111[]=null,token12[]=null,token13[]=null,token14[]=null,token15[]=null,token16[]=null,token17[]=null,token18[]=null,token19[]=null,token20[]=null,token21[]=null,token22[]=null,token23[]=null,token24[]=null,token25[]=null,token26[]=null,token27[]=null,token28[]=null,token29[]=null,token30[]=null;
		    	
		    	String air_nums="-";
		    	
		    	
		    	
		    	 BufferedReader br=null;
				 DataInputStream in=null;
		    	/** loop for no of folders in directory  */
		    	
				 File[] listOfFiles1=null;
				 System.out.println("listOfFiles.length===== :"+listOfFiles.length);
		    	for (int i = 0; i < listOfFiles.length; i++) {
		        
		    		
		    		
		    		 System.out.println("count :"+i);
						files2 = listOfFiles[i].getName();
						
						System.out.println("file is 55555**** :"+files2);
						try{
						File Folder1 = new File("/home/a_thakur/Desktop/Airtel_Tess/"+files2+"/");
						//	File Folder1 = new File("/home/javaprg/unprocessedFiles/Airtel5/Airterl5/"+files2+"/");
							
							//File Folder1 = new File(filepath+"/"+files2+"/");
						
						
						 listOfFiles1 = Folder1.listFiles();
						 System.out.println("airtel1111==>"+listOfFiles1.length);
						
						 
						}catch(Exception e44)
						{
							System.out.println("exception in folder %###### :"+e44);

							
						}
						
						System.out.println("filepath1*************:"+filepath1);
						System.out.println("files2*************:"+files2);
						//System.out.println("listOfFiles[i].isFile()*************:"+listOfFiles[i].isFile());
						//System.out.println("listOfFiles[i].isDirectory()*************:"+listOfFiles[i].isDirectory());
						
						 if (listOfFiles1[i].isFile()) 
						{	
							 
							System.out.println("INSIDE IFFFF*****listOfFiles1.length*********==>"+listOfFiles1.length);
							 
						for (int i1 = 0; i1 < listOfFiles1.length; i1++){
							
							System.out.println("CHECK Count ********==>"+i1);
							
							file3 = listOfFiles1[i1].getName();
							
							
							air_nums="-";
							mobno1="-";
							acnt_no="-";
							acnt_type="-";
							bill_no="-";
							bill_no_reset="-";
							bill_date="-";
							bill_period="-";
							prevs_bal="-";
							paymnt="-";
							adjstmnt="-";
							this_mnth_chrge="-";
							amnt_payby_date="-";
							amnt_payafter_date="-";
							onetm_charge="-";
							mnth_charge="-";
							call_recharge="-";
							val_added_servs="-";
							mob_intrnt_usage="-";
							roaming="-";
							discnt="-";
							late_fee="-";
							taxes="-";
							this_mnth_chrg="-";
							time="-";
							numb="-";
							durtn_vol="-";
							amnt="-";
							discnt_call="-";
							mobno="-";
							billno="-";
							todate="-";
							acno="-";
							call_type="-";
							item_type="-";
							
							//System.out.println("file3 is 55555$$ :"+file3);
							//System.out.println("filepath1*************:"+filepath1);
							//System.out.println("files2*************:"+files2);
							
							try{
							//fstream = new FileInputStream("/home/a_thakur/Desktop/SimBillingFolder/"+filepath1+"/"+files2);
								System.out.println("**------1111***");
							fstream = new FileInputStream(filepath1+"/"+files2+"/"+file3);
							System.out.println("**1111***");
							in = new DataInputStream(fstream);
							System.out.println("**222***");
							
							System.out.println("IN==>"+in);
						         br = new BufferedReader(new InputStreamReader(in));
						        System.out.println("IN=111=>"+file3);
						        
							}catch(Exception e55)
							{
								
							e55.printStackTrace();	
							System.out.println("Exception in file output stream :"+e55);
							}
						        String strLine;
						        StringBuffer sb = new StringBuffer("");
							
						        while ((strLine = br.readLine()) != null)   {
						            // Print the content on the console
					         //  System.out.println (">>>>>>444"+strLine);
					            //System.out.println (">>>"+strLine.substring(0,4));
					           //System.out.println (">>>"+strLine.length());
						        	 
						        	
					            
					            
					            try{
					            if(strLine.length()>17)
						            {
						           
						            	/**
						            	if(strLine.substring(0,22).equalsIgnoreCase("<Child_Account_Number>"))
							        {
							        	
							        	// System.out.println ("child accnt number>>"+strLine.substring(25,strLine.length()-19));
							        	
							        	
							        }
						            
						            **/
						            	// System.out.println (">UP to HERE>%%%%%>");  
						            	 //System.out.println ("child accnt number18811>>"+strLine.substring(16,strLine.length()-17));
						        		 
						        	
						            }
					            }catch(IndexOutOfBoundsException a1)
					            {
					            	// System.out.println (">Exception>%%a1%%%>"+a1);  
					            	
					            }
						        	
						        	
						        	
						        	try{
						        	if(strLine.length()>21)
						        	 {
						        		 //System.out.println (">mobno>>"+strLine.substring(16,strLine.length()-2));  
						        		 
						        		 if(strLine.substring(0,15).equalsIgnoreCase("<MOBILE NUMBER="))
						        	  {
						        		 // System.out.println (">mobno>>"+strLine.substring(16,strLine.length()-2));  
						        		  mobno=strLine.substring(16,strLine.length()-2);
						        		  
						        		  
						        	  }
					           
						        	 }
						        	
					            }catch(IndexOutOfBoundsException a2)
					            {
					            	 System.out.println (">Exception>%a2%%%%>"+a2);  
					            	
					            }
						        	 
						        	
					            
					            try{
					            if(strLine.length()>18)
						        	 {
						        		 //System.out.println (">acmt_no>>"+strLine.substring(16,strLine.length()-17));  
						        		 if(strLine.substring(0,15).equalsIgnoreCase("<Account_Number"))
						        	  {
						        		  //System.out.println (">acmt_no>>"+strLine.substring(16,strLine.length()-17));  
						        		  acnt_no=acnt_no+","+  (strLine.substring(16,strLine.length()-17)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
					           
					            }catch(IndexOutOfBoundsException a3)
					            {
					            	 System.out.println (">Exceptiona3>%%%%%>"+a3);  
					            	
					            }
						        	// 
						        	 
						        	 try{
						        	 if(strLine.length()>14)
						        	 {
						        		// System.out.println (">bill_no>>"+strLine.substring(13,strLine.length()-14)); 
		                              if(strLine.substring(0,13).equalsIgnoreCase("<Bill_Number>"))
						        	  {
						        		 // System.out.println (">bill_no>>"+strLine.substring(13,strLine.length()-14));  
						        		  bill_no=bill_no+","+  (strLine.substring(13,strLine.length()-14)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 
						        	 }catch(IndexOutOfBoundsException a4)
							            {
							            	 System.out.println (">Exceptiona4>%%%%%>"+a4);  
							            	
							            }
						        	 
						        	 
						        	 /**
						        	 if(strLine.length()>15)
						        	 {
						        	  if(strLine.substring(0,14).equalsIgnoreCase("<MOBILE NUMBER"))
						        	  {
						        		  System.out.println (">mobno111>>"+strLine.substring(14,strLine.length()-1));  
						        		  mobno1=mobno1+","+  strLine.substring(14,strLine.length()-1);
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 System.out.println (">UP to HERE 7895>>");
						        	 **/
						        	 
						        	 try{
						        	 if(strLine.length()>13)
						        	 {
						        		 // System.out.println (">bill_date>>"+strLine.substring(11,strLine.length()-13));  
						        		 if(strLine.substring(0,10).equalsIgnoreCase("<Bill_Date"))
						        	  {
						        		 // System.out.println (">bill_date>>"+strLine.substring(11,strLine.length()-13));  
						        		 
						        			// System.out.println (">bill_date----*************---"+strLine);  
						        			 
						        			 bill_date=bill_date+","+   (strLine.substring(11,strLine.length()-12)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 
						        	 
						        	 }catch(IndexOutOfBoundsException a5)
							            {
							           	 System.out.println (">Exceptiona5>%%%%%>"+a5);  
							            	
							            }
						        	
						        	 
						        	 try{
						        	 if(strLine.length()>14)
						        	 {
						        	  if(strLine.substring(0,12).equalsIgnoreCase("<Bill_Period"))
						        	  {
						        		 // System.out.println (">bill_period>>"+strLine.substring(12,strLine.length()-14));  
						        		  bill_period=bill_period+","+   (strLine.substring(13,strLine.length()-14)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a6)
							            {
							            	 System.out.println (">Exceptiona6>%%%%%>"+a6);  
							            	
							            }
						        	
						        	try{
						        	 
						        	 if(strLine.length()>18)
						        	 {
						        	  if(strLine.substring(0,17).equalsIgnoreCase("<Previous_Balance"))
						        	  {
						        		  //System.out.println (">prevs_bal>>"+strLine.substring(17,strLine.length()-19));  
						        		  prevs_bal=prevs_bal+","+ (strLine.substring(17,strLine.length()-18)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a7)
							            {
							            	 System.out.println (">Exceptiona7>%%%%%>"+a7);  
							            	
							            }
						        	 
						        	 
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>11)
						        	 {
						        	  if(strLine.substring(0,9).equalsIgnoreCase("<Payments"))
						        	  {
						        		 // System.out.println (">paymnt>>"+strLine.substring(10,strLine.length()-11));  
						        		  paymnt=paymnt+","+  (strLine.substring(10,strLine.length()-11)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a8)
							            {
							            	 System.out.println (">Exceptiona3>%%%%%>"+a8);  
							            	
							            }
						        	 try{
						        	 
						        	 if(strLine.length()>14)
						        	 {
						        	  if(strLine.substring(0,12).equalsIgnoreCase("<Adjustments"))
						        	  {
						        		// System.out.println (">adjstmnt>>"+strLine.substring(13,strLine.length()-14));  
						        		  adjstmnt=adjstmnt+","+  (strLine.substring(10,strLine.length()-11)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 
						        	 }catch(IndexOutOfBoundsException a9)
							            {
							            	 System.out.println (">Exceptiona9>%%%%%>"+a9);  
							            	
							            }
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>22)
						        	 {
						        		// System.out.println (">this_mnth_chrge>>"+strLine.substring(0,20));
						        		 if(strLine.substring(0,20).equalsIgnoreCase("<This_Months_Charges") )
						        	  {
						        		 // System.out.println (">this_mnth_chrge>>"+strLine.substring(21,strLine.length()-23));  
						        		  this_mnth_chrge= this_mnth_chrge+","+(strLine.substring(21,strLine.length()-23)).trim();
						        		  
						        		  sb.append(",");
						        		  sb.append(strLine.substring(21,strLine.length()-23).trim());
						        		  
						        	  }else if(strLine.substring(0,20).equalsIgnoreCase("<Total_Current_Charg")  || strLine.substring(0,20).contains("<Total_Current_Charg"))
						        	  {
						        		  //System.out.println ("INSIDE Total_Charges**************** >>"); 
						        		  this_mnth_chrge= this_mnth_chrge+","+(strLine.substring(23,strLine.length()-25)).trim();
						        		  
						        		  sb.append(",");
						        		  sb.append(strLine.substring(23,strLine.length()-25).trim());
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 
						        	 }catch(IndexOutOfBoundsException a10)
							            {
							            	 System.out.println (">Exceptiona10>%%%%%>"+a10);  
							            	
							            }
						        	 
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>29)
						        	 {
						        	  if(strLine.substring(0,27).equalsIgnoreCase("<Amount_Payable_by_Due_Date"))
						        	  {
						        		//  System.out.println (">amnt_payby_date>>"+strLine.substring(27,strLine.length()-29));  
						        		  amnt_payby_date=amnt_payby_date+","+  (strLine.substring(27,strLine.length()-29)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a11)
							            {
							            	 System.out.println (">Exceptiona11>%%%%%>"+a11);  
							            	
							            }
						        	 
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>32)
						        	 {
						        	  if(strLine.substring(0,30).equalsIgnoreCase("<Amount_Payable_After_Due_Date"))
						        	  {
						        		 // System.out.println (">amnt_payafter_date>>"+strLine.substring(31,strLine.length()-32));  
						        		  amnt_payafter_date=amnt_payafter_date+","+   (strLine.substring(31,strLine.length()-32)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a12)
							            {
							            	 System.out.println (">Exceptiona12>%%%%%>"+a12);  
							            	
							            }
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>19)
						        	 {
						        	  if(strLine.substring(0,17).equalsIgnoreCase("<One_Time_Charges"))
						        	  {
						        		 // System.out.println (">onetm_charge>>"+strLine.substring(17,strLine.length()-19));  
						        		  onetm_charge=onetm_charge+","+   (strLine.substring(18,strLine.length()-19)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a13)
							            {
							            	 System.out.println (">Exceptiona13>%%%%%>"+a13);  
							            	
							            }
						        	 
						        	 
						        	 try{
						        	 
						        	 if(strLine.length()>18)
						        	 {
						        	  if(strLine.substring(0,16).equalsIgnoreCase("<Monthly_Charges"))
						        	  {
						        		 // System.out.println (">mnth_charge>>"+strLine.substring(16,strLine.length()-18));  
						        		  mnth_charge=mnth_charge+","+  (strLine.substring(17,strLine.length()-18)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }
						        	 }catch(IndexOutOfBoundsException a14)
							            {
							            	 System.out.println (">Exceptiona14>%%%%%>"+a14);  
							            	
							            }
						        	 
						        	
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>15)
						        	 {
						        	  if(strLine.substring(0,13).equalsIgnoreCase("<Call_Charges"))
						        	  {
						        		  //System.out.println (">call_recharge>>"+strLine.substring(13,strLine.length()-15));  
						        		  call_recharge=call_recharge+","+  (strLine.substring(14,strLine.length()-15)).trim();
						        		  
						        		  
						        	  }
					           
						        	 } 
						        	 
						        	 }catch(IndexOutOfBoundsException a15)
							            {
							            	 System.out.println (">Exceptiona15>%%%%%>"+a15);  
							            	
							            }
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>23)
						        	 {
						        	  if(strLine.substring(0,21).equalsIgnoreCase("<Value_Added_Services"))
						        	  {
						        		 //System.out.println (">val_added_servs>>"+strLine.substring(21,strLine.length()-23));  
						        		  val_added_servs=val_added_servs+","+   (strLine.substring(22,strLine.length()-23)).trim();
						        		  
						        		  
						        	  }
					           
						        	 } 
						        	 }catch(IndexOutOfBoundsException a16)
							            {
							            	 System.out.println (">Exceptiona16>%%%%%>"+a16);  
							            	
							            } 
						        	 
						        
						        	 
						        	 try{
						        	 if(strLine.length()>24)
						        	 {
						        	  
						        		 //System.out.println (">mob_intrnt_usage *@@@******$$$$$$$$**>>"+(strLine.substring(0,22))); 
						        		 if(strLine.substring(0,22).equalsIgnoreCase("<Mobile_Internet_Usage")  || strLine.substring(0,22).equalsIgnoreCase("<Mobile_InterNet_Charg"))
						        	  {
						        		  //System.out.println (">mob_intrnt_usage **check string*******>>"+strLine.substring(0,22));  
						        		 
						        			 if(!(strLine.substring(25,strLine.length()-26)).equalsIgnoreCase("uration></Mobile") && !(strLine.substring(25,strLine.length()-26)).contains("ulse>")  && !(strLine.substring(25,strLine.length()-26)).contains("Total_International>")  )
						        			 
						        				 {mob_intrnt_usage=mob_intrnt_usage+","+   (strLine.substring(25,strLine.length()-26)).trim();
						        		  
						        				 }
						        	  }
					           
						        	 }  
						        	 }catch(IndexOutOfBoundsException a17)
							            {
							            	 System.out.println (">Exceptiona17>%%%%%>"+a17);  
							            	
							            }
						        	
						        	 
						        	 
						        	 try{
						        	 
						        	 if(strLine.length()>10)
						        	 {
						        		// System.out.println (">roaming>>>>&&&>>"+strLine.substring(0,8));  
						        		 if(strLine.substring(0,8).equalsIgnoreCase("<Roaming")   )
						        	  {
						        		// System.out.println (">roaming>>>>>>>inside roaming>>>>>"+strLine.substring(8,strLine.length()-10));  
						        		  
						        		  
						        		  if(strLine.substring(8,strLine.length()-10).contains("Total_National"))
						        		  
						        		  {
						        			  //System.out.println (">INSIDE Total_National=IFFFFF=>"+strLine.substring(8,strLine.length()-10));
						        			  if(strLine.substring(8,strLine.length()-10).contains("Total_International"))
						        			 {
						        			  //System.out.println (">INSIDE Total_National=IFFFFF=>"+strLine.substring(24,strLine.length()-30));
						        			  roaming=roaming+","+   (strLine.substring(24,strLine.length()-30).trim());
						        			 }else{
						        				 
						        			///	 System.out.println (">INSIDE Total_National=else=>"+strLine.substring(24,strLine.length()-25));
							        			  roaming=roaming+","+   (strLine.substring(24,strLine.length()-25).trim());
						        				 
						        			 }
						        			  
						        			  
						        		  }
						        		  else if (strLine.substring(0,9).equalsIgnoreCase("<Roaming>"))
						        		  {
						        			  roaming=roaming+","+   (strLine.substring(9,strLine.length()-10).trim());
						        			  //System.out.println (">ELSEEEEEEEEEEEEEEE  IFFFF =of ROAMING==>"+strLine);
						        		  }
						        		  
						        		  else{
						        			  
						        			  //System.out.println (">ELSEEEEEEEEEEEEEEE=of Total_National==>"+strLine.length());
						        			  //System.out.println (">ELSEEEEEEEEEEEEEEE=of Total_National==>"+strLine);
						        			  //System.out.println (">ELSEEEEEEEEEEEEEEE=of Total INTERRRRR_National=substr=>"+strLine.substring(29,strLine.length()-30));
						        			  //System.out.println (">ELSEEEEEEEEEEEEEEE=of Total_National==>"+strLine.substring(29,strLine.length()-30).trim());
						        			  roaming=roaming+","+   (strLine.substring(29,strLine.length()-30).trim());
						        			  
						        		  }
						        		  
						        		  
						        	  }
					           
						        	 }  
						        	 
						        	 }catch(IndexOutOfBoundsException a18)
							            {
							            	 System.out.println (">Exceptiona18>%%%%%>"+a18);  
							            	
							            }
						        	 
						        	 
						        	 
						        	 try{
						        	 if(strLine.length()>12)
						        	 {
						        	  if(strLine.substring(0,10).equalsIgnoreCase("<Discount>") )
						        	  {
						        		// System.out.println (">discnt>>"+strLine.substring(10,strLine.length()-11));  
						        		  discnt=discnt+","+ (strLine.substring(10,strLine.length()-11)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }  
						        	 
						        	 }catch(IndexOutOfBoundsException a19)
							            {
							            	System.out.println (">Exceptiona19>%%%%%>"+a19);  
							            	
							            }
						        	 

					            	try{
						        	 
						        	 if(strLine.length()>11)
						        	 {
						        	  if(strLine.substring(0,9).equalsIgnoreCase("<Late_Fee"))
						        	  {
						        		 // System.out.println (">late_fee>>"+strLine.substring(10,strLine.length()-11));  
						        		  late_fee=late_fee +","+ (strLine.substring(10,strLine.length()-11)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }  
					            	 }catch(IndexOutOfBoundsException a20)
							            {
							            	// System.out.println (">Exceptiona20>%%%%%>"+a20);  
							            	
							            }
						        	 
						        	
					            	 
					            	 try{
					            	 if(strLine.length()>8)
						        	 {
						        	  if(strLine.substring(0,6).equalsIgnoreCase("<Taxes"))
						        	  {
						        		  //System.out.println (">taxes>>"+strLine.substring(7,strLine.length()-8));  
						        		  taxes=taxes+","+ (strLine.substring(7,strLine.length()-8)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }  
					            	 }catch(IndexOutOfBoundsException a21)
							            {
							            	 System.out.println (">Exceptiona21>%%%%%>"+a21);  
							            	
							            } 
						        	 
						        	 try{
						        	 if(strLine.length()>22)
						        	 {
						        	  if(strLine.substring(0,20).equalsIgnoreCase("<This_Months_Charges"))
						        	  {
						        		 // System.out.println (">this_mnth_chrg>>"+strLine.substring(20,strLine.length()-22));  
						        		  this_mnth_chrg=this_mnth_chrg+","+(strLine.substring(22,strLine.length()-23)).trim();
						        		  
						        		  
						        	  }
					           
						        	 }  
						        	 
						        	 
						        	 }catch(IndexOutOfBoundsException a22)
							            {
							            	 System.out.println (">Exceptiona22>%%%%%>"+a22);  
							            	
							            } 
						        	 
						        	 
						        		try{           
						        	 if(strLine.length()>10)
						        	 {
						        	  if(strLine.substring(0,8).equalsIgnoreCase("<To_Date"))
						        	  {
						        		 // System.out.println (">to_date>>"+strLine.substring(9,strLine.length()-10));  
						        		  
						        		  todate=strLine.substring(9,strLine.length()-10);
						        		  
						        		  
						        	  }
					           
						        	 }
						        		 }catch(IndexOutOfBoundsException a23)
								            {
								            	 System.out.println (">Exceptiona23>%%%%%>"+a23);  
								            	
								            }
						        	
						        	// System.out.println (">up to here>>"+strLine);  
						        	 //System.out.println (">up to here>>"+strLine.length()); 
						        	try{
						        	 if(strLine.length()>13)
						        	 {
						        		 
						        		 if(strLine.substring(0,11).equalsIgnoreCase("<Invoice_No"))
						        	  {
						        		 
						        			// System.out.println ("---------->"+strLine);  
						        			// System.out.println (">invoice no>555>"+strLine.substring(strLine.indexOf(">")+1,strLine.indexOf("</")));  
						        		  
						        		  billno=(strLine.substring(strLine.indexOf(">")+1,strLine.indexOf("</"))).trim();
						        		  //billno=strLine.substring(22,strLine.length()-23);//***commented
						        		  
						        	  }
					           
						        	 }
						        	 
						        	 }catch(IndexOutOfBoundsException a24)
							            {
							            	 System.out.println (">Exceptiona24>%%%%%>"+a24);  
							            	
							            }
						        
						        	 
						        	 try{
						        	 
					            if(strLine.length()>17)
					            {
					           
					            	/**
					            	if(strLine.substring(0,22).equalsIgnoreCase("<Child_Account_Number>"))
						        {
						        	
						        	// System.out.println ("child accnt number>>"+strLine.substring(25,strLine.length()-19));
						        	
						        	
						        }
					            
					            **/
					            	// System.out.println (">UP to HERE>%%%%%>");  
					            	//System.out.println ("item type18811>>"+strLine.substring(0,14));
					           
					            	if(strLine.substring(0,14).equalsIgnoreCase("<ITEMIZED TYPE"))
					            {
					            	
					            	// System.out.println ("child accnt number18811>>"+strLine.substring(17,strLine.length()-16));
					            	
					            	
					            	 item_type=(strLine.substring(17,strLine.length()-16)).trim();
					            	 int r=100;
					            
					            	
					            	
					            }
					            
					            }
					            	
					            
						        	 }catch(IndexOutOfBoundsException a25)
							            {
							            	System.out.println (">Exceptiona10>%%%%%>"+a25);  
							            	
							            }
					            
					            
					            // System.out.println (">>>4444>>>");
					            		 
					            		// System.out.println (">>>"+strLine.length());
					            		 
					            	
					           
					            try{
					            if(strLine.length()>19)
							        	 {
					            			//System.out.println (">777call_type>>"+strLine.substring(19,strLine.length()-11));  
					            			// System.out.println (">777call_type>>"+strLine.substring(19,strLine.length()-11));
					            			if(strLine.substring(0,11).equalsIgnoreCase("<CALL_TYPES"))
							        	  {
							        		  //System.out.println (">777call_type>>"+strLine.substring(19,strLine.length()-11));  
							        		  call_type=(strLine.substring(19,strLine.length()-13)).trim();
							        		  
							        		  
							        	  }
						           
							        	 }
					            }catch(IndexOutOfBoundsException a26)
					            {
					            	 System.out.println (">Exceptiona26>%%%%%>"+a26);  
					            	
					            }
					            		
					            //System.out.println (">UP to HERE 1111>>");   
					            		try{
					            		if(strLine.length()>7)
					            		 {
					            		 if(strLine.substring(0,4).equalsIgnoreCase("<SNo"))
					            		 {
					            			 
					            			srno=srno+","+ (strLine.substring(5,strLine.length()-6 )).trim();
					            			 
					            		 }
					            		 if(strLine.substring(0,6).equalsIgnoreCase("<Date>"))
					            		 {
					            			 
					            			 date=date+","+ (strLine.substring(6,strLine.length()-7 )).trim();
					            			 
					            		 }
					            		 if(strLine.substring(0,5).equalsIgnoreCase("<Time"))
					            		 {
					            			 
					            			 time=time+","+ (strLine.substring(6,strLine.length()-7 )).trim();
					            			 
					            		 }
					            		
					            		 }
					            		 }catch(IndexOutOfBoundsException a28)
								            {
								            	 System.out.println (">Exceptiona28>%%%%%>"+a28);  
								            	
								            }
					            		
					            		
					            		
					            		try{
					            		 if(strLine.length()>9)
					            		 {
					            		 if(strLine.substring(0,7).equalsIgnoreCase("<Number"))
					            		 {
					            			 
					            			 numb=numb+","+ (strLine.substring(8,strLine.length()-9 )).trim();
					            			 
					            		 }
					            		 
					            		 }
					            		 
					            		 }catch(IndexOutOfBoundsException a29)
								            {
								            	 System.out.println (">Exceptiona29>%%%%%>"+a29);  
								            	
								            }
					            		 
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>18){
					            		 
					            		 if(strLine.substring(0,16).equalsIgnoreCase("<Duration_Volume"))
					            		 {
					            			 
					            			 durtn_vol=durtn_vol+","+ (strLine.substring(17,strLine.length()-18 )).trim();
					            			 
					            		 }
					            		 
					            		 }
					            		 }catch(IndexOutOfBoundsException a30)
								            {
								            	 System.out.println (">Exceptiona30>%%%%%>"+a30);  
								            	
								            }
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>9)
					            		 {
					            		 
					            		 if(strLine.substring(0,8).equalsIgnoreCase("<Amount>"))
					            		 {
					            			 
					            			 amnt=amnt+","+ ((strLine.substring(8,strLine.length()-9 ))).trim();
					            			 
					            		 }
					            		 
					            		 }
					            		 }catch(IndexOutOfBoundsException a31)
								            {
								            	 System.out.println (">Exceptiona31>%%%%%>"+a31);  
								            	
								            }
					            		 
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>16)
					            		 {
					            		 
					            		 if(strLine.substring(0,14).equalsIgnoreCase("<DISCOUNT_CALL"))
					            		 {
					            			 
					            			 discnt_call=discnt_call+","+ (strLine.substring(15,strLine.length()-16 )).trim();
					            			 
					            		 }
					            		 }
					            		 
					            		 }catch(IndexOutOfBoundsException a32)
								            {
								            	 System.out.println (">Exceptiona32>%%%%%>"+a32);  
								            	
								            }
					            		 
					            		 
					            		 
					            		 try{
					            		 
					            		 
					            		 if(strLine.length()>16)
					            		 {
					            		 
					            		 if(strLine.substring(0,14).equalsIgnoreCase("<Account_Type>"))
					            		 {
					            			 
					            			 acnt_type_subsumry=((strLine.substring(14,strLine.length()-15 ))).trim();
					            			 
					            		 }
					            		 }
					            		 }catch(IndexOutOfBoundsException a33)
								            {
								            	 System.out.println (">Exceptiona33>%%%%%>"+a33);  
								            	
								            }
					            	
					            		
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>17)
					            		 {
					            		 
					            		 if(strLine.substring(0,15).equalsIgnoreCase("<Mobile_Number>"))
					            		 {
					            			 
					            			 mob_sumsmry=(strLine.substring(15,strLine.length()-16 )).trim();
					            			 
					            		 }
					            		 }
					            		 
					            		 }catch(IndexOutOfBoundsException a34)
								            {
								            	 System.out.println (">Exceptiona34>%%%%%>"+a34);  
								            	
								            }
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>18)
					            		 {
					            		 
					            		 if(strLine.substring(0,16).equalsIgnoreCase("<Account_Number>"))
					            		 {
					            			 
					            			 acnt_sumsmry=acnt_sumsmry+","+((strLine.substring(16,strLine.length()-17 ))).trim();
					            			 
					            		 }
					            		 }
					            		 }catch(IndexOutOfBoundsException a35)
								            {
								            	 System.out.println (">Exceptiona35>%%%%%>"+a35);  
								            	
								            }
					            		 
					            		 
					            		 
					            		 try{
					            		 if(strLine.length()>16)
					            		 {
					            		 
					            		 if(strLine.substring(0,15).equalsIgnoreCase("<Airtel_Number>"))
					            		 {
					            			 
					            			 air_nums=air_nums+","+ (strLine.substring(15,strLine.length()-16 )).trim();
					            			 
					            		 }
					            		 }
					            		 }catch(IndexOutOfBoundsException a36)
								            {
								            	 System.out.println (">Exceptiona36>%%%%%>"+a36);  
								            	
								            }
						        }
						        
						        
						       System.out.println ("item_type>>>>>"+item_type);
						        
						        //System.out.println ("air_nums>>>>>"+air_nums);
						        
						        token=date.split(",");
		              		
						        
						        try{
						        if(time.length()>2){
						        time=time.replaceAll("DT=\"DateTime\">","");
						        time=time.substring(2,time.length());
		              		  }
						        }catch(IndexOutOfBoundsException a37)
					            {
					            	 System.out.println (">Exceptiona37>%%%%%>"+a37);  
					            	
					            }
		              		  
		              		  
						        
						        try{
						        if(numb.length()>2)
		              		  {
		              			numb=numb.replaceAll("DT=\"Text\">","");
		              			numb=numb.substring(1,numb.length());  
		              			  
		              			  
		              			  
		              		  }
						        }catch(IndexOutOfBoundsException a38)
					            {
					            	 System.out.println (">Exceptiona38>%%%%%>"+a38);  
					            	
					            }
						        
		              		  token1=time.split(",");
		              		  
		              		  token2=numb.split(",");
		              		  
		              		 
		              		  try{
		              		  if(durtn_vol.length()>2)
		              		 {  
		              		durtn_vol=durtn_vol.replaceAll("DT=\"DateTime\">","");
		              		durtn_vol=durtn_vol.substring(2,durtn_vol.length());
		              		 }
		              		  
		              		}catch(IndexOutOfBoundsException a39)
				            {
				            	 System.out.println (">Exceptiona39>%%%%%>"+a39);  
				            	
				            }
		              		  
		              		  token3=durtn_vol.split(",");
		              		  token4=amnt.split(",");
		              		  token5=discnt_call.split(",");
		              		  //token6=rw36.split(",");
		              		  //token7=rw37.split(",");
				            	
		              		  
		              		  token111=bill_date.split(",");
		              		  token11=acnt_no.split(","); 
		              		  token12=bill_no.split(",");
		              		  token13=mobno1.split(",");
		              		  token14=bill_period.split(",");
		              		  
		              		  
		              		  token15=prevs_bal.split(",");
		              		  token16=paymnt.split(",");
		              		  token17=adjstmnt.split(",");
		              		  token18=this_mnth_chrge.split(",");
		              		  token19=amnt_payby_date.split(",");
		              		  token20=onetm_charge.split(",");
		              		  token21=mnth_charge.split(",");
		              		  token22=call_recharge.split(",");
		              		  token23=val_added_servs.split(",");
		              		  token24=mob_intrnt_usage.split(",");
		              		  token25=roaming.split(",");
		              		  token26=late_fee.split(",");
		              		  token27=taxes.split(",");
		              		  token28=discnt.split(",");
		              		  token29=this_mnth_chrg.split(",");
						        
						      token30=air_nums.split(",");  
						      token31=acnt_sumsmry.split(",");  
						      
						      
		              		  
		              		 for(int a=0;a<token31.length;a++)
			            	 {
			            		 
			            		//System.out.println(">>token31['"+a+"']>>"+token31[a]);
			            	 }
						    
		              		 
		              		System.out.println(">>item_type>>"+item_type);
		              		//item_type="";
		              		System.out.println(">>item_type>>"+(item_type.contains("")));
		              		//System.out.println(">>acnt_no>>"+acnt_no);
		              		System.out.println(">>acnt_sumsmry>>"+acnt_sumsmry);
		              		
		              		System.out.println(">>amnt  >>"+amnt);
		              		System.out.println(">>air_nums  >>"+air_nums);
		              		
		              		
		              		
		              		System.out.println(">>time>>"+time);
		              		//System.out.println(">>numb>>"+numb.length());
		              		
		              		System.out.println(">>>date>"+date);
		              		System.out.println(">>token>>"+token.length);
		              		System.out.println(">>token1>>"+token1.length);
		              		//System.out.println(">>mob_intrnt_usage>>"+mob_intrnt_usage);
		              		//System.out.println(">>this_mnth_chrge>>"+this_mnth_chrge);
		              		//System.out.println(">>SB>>"+sb);
		              		//StringTokenizer st= new StringTokenizer(this_mnth_chrg, ",");
		              		//if(st.hasMoreTokens())
		              	//	{
		              			
                           		              		
		              			
		              		//}
		              		
		              		
		              		//sb=sb.r
		              		//sb=sb.deleteCharAt(2);
		              		
		              		//String []test=this_mnth_chrg[1];
		              		//this_mnth_chrge[1]=this_mnth_chrge.replace(this_mnth_chrg[1].to, "");
		              			
		              		//System.out.println(">>after>>"+sb);
		              		
		              		 if(token14.length>1){  
		              		//System.out.println(">>token14[1]>>"+token14[1].substring(12,token14[1].length()));
		              		//System.out.println(">>token30[1]>>lt>>"+token30.length);
		              		//System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token14[1].substring(1,9))));
		              		
						      
						      }
		              		 
						       //System.out.println ("acnt_type_subsumry>>>>>"+acnt_type_subsumry);
						        
						        try{
		      	    	     	   
		          					
						        	
						        	//if(token6[r-2]!="")
		          					//{
		          					
						        	sql3="Select distinct(Accno) as acno from t_subsummarydet_sept where mobno='"+mobno+"' ";      
			                    	
						        	//System.out.println("before sql :"+sql3);
						        	ResultSet rs3=st1.executeQuery(sql3);
			                    	System.out.println("The string sql3 is b333 :"+sql3);
			                    	if(rs3.next())
			                    	{
			                    		acno=rs3.getString("acno");
			                    		//System.out.println("Account number :"+acno);
			                    		
			                    	}
						        	
			                    	// System.out.println("Account number============ :"+acno);
						        	
						        	
						        	
		          					            					            					
		          					
		          					//sql1="insert into db_simbillstest.t_chargedetailsamt (TMonth,MobNo,AccNo,BillNo,BillDate,TDate,TTime,CallNo,Duration,Amount,TAmt,callType,ItemType,Service_Provider,filename) values ('"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2]))+"','"+token[7]+"','"+token[6]+"' ,'"+token[4]+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2]))+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token6[r-4]))+"','"+new SimpleDateFormat("HH:mm:ss").format(q)+"','"+df.format(q1)+"','"+q+"','"+token6[r]+"','"+token6[r]+"','Outgoing','VF Mobile Connect','Vodafone','"+file+"') ";      
		          					
		            	           //System.out.println("The string sql1 BEFORE  is a11111 :"+sql1);
		            	            //st2.executeUpdate(sql1);
		            	           // System.out.println("The string sql1 is after :"+sql1);
		            	            
		          					//}
		            	            //System.out.println("The number of count is  :");
		            	         	   
		            	            }catch(NumberFormatException n) {
		            	         	   System.out.println("the exception is e>555> :"+n);
		            	         	   n.printStackTrace();
		            	            }catch(Exception e){
		            	            	
		            	            	e.printStackTrace();
		            	            	
		            	            }
		            	            String tmonth="";
		            	            
		            	           
		            	           // System.out.println("todate  :"+todate);
		            	           
		            	            
		            	            System.out.println("acnt_type_subsumry%%%%%%%%%%%%%%%%  :"+acnt_type_subsumry);
		            	            System.out.println("item_type%%%%%%%%%%%%%%%%  :"+item_type);
		            	        //    System.out.println("item_type%%%%%%%%%%%%%%%%  :"+item_type.equalsIgnoreCase("1.Mobile Internet - Volume"));
		            	          //  System.out.println("item_type%%%%%contains%%%%%%%%%%%  :"+item_type.contains("1.Mobile Internet - Volume"));
		            	            
		            	            // System.out.println("item_type%%%%%%%%%%%%%%%%$$$$$$$$$  :"+item_type.contains("Mobile Internet - Volume"));
		            	            String flnm="-";
		            	            
		            	           try{
		            	            
		            	        	  if(acnt_type_subsumry.equalsIgnoreCase("INDIVIDUAL") || acnt_type_subsumry.contains("INDIVIDUAL"))
		            	        	  {
		            	        	   
		            	        		System.out.println("**INDIVIDUAL**LOOPPPP*****");
		            	        		  
		            	        		try{  
		            	        		  
		            	            //for(int a=1;a< token11.length;a++)
		    				        
		            	        			for(int a=1,p=2,q=3;a< token30.length;a++,p++,q++)
		            	        			{
		            	            	//System.out.println("**token11[a]********"+token11[a]);
		            	            	
		    				        	
		            	            	//System.out.println("**inside *INDIVIDUAL=acntno=>"+token11.length);
		            	            	//System.out.println("**inside *INDIVIDUAL=mobno=>"+token30.length);
		            	            	 //	System.out.println("token20[a]=onetm_charge=>"+token20[p]);
		            	        				//System.out.println("token14[a]*LENGTH**>>"+token14[a].length());
		                	           	//System.out.println("token11[a]***>>"+token11[a]);
		                	            //	System.out.println("token12[1]***>>"+token12[1]);
		                	            	//System.out.println("token23[a]**val_added_servs*>>"+token23[p]);
		                	            	//System.out.println("token24[a]**mob internate usage*>>"+token24[p]);
		                	           	//System.out.println("token25[a]**roaming*>>"+token25[p]);
		                	            	//System.out.println("token27[a]*taxex**>>"+token27[p]);
		                	            	//System.out.println("token28[a]***discnt>>"+token28[q]);
		                	            	//System.out.println("**token18.length********"+token18.length);
		                	            	//System.out.println("token111[a]***discnt>>"+token111[a]);
		            	            	
		            	            	 if(todate!="-" || !(todate.equalsIgnoreCase("-"))){
		            	            	flnm=token11[a]+new SimpleDateFormat("MMM-yy").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate))+".txt";
		            	            	 }else{
		            	            		 
		            	            		 flnm="AirtelOct10_2013.txt";
		            	            		 
		            	            	 }
		            	            	
		            	            	
		            	            	//System.out.println("inside MYYYYY loop>>>");
		    				        		
		            	            	 try{
		            	            	 
		            	            		//System.out.println("**111**");
		            	            		
		            	            		try{
		            	            	
		            	            			//System.out.println("**date********"+token111[a]);
		            	            			//System.out.println("**date**"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[a])));
		            	            		
		            	            		}catch(Exception t33)
		            	            		{
		            	            			System.out.println("**Exception in date format t33 **"+t33);	
		            	            			
		            	            		}
		            	            		//System.out.println("**token11[a]**"+token11[a]);
		            	            		//System.out.println("*token12[a]*"+token12[a]);
		            	            		//System.out.println("**flnm**"+flnm);
		            	            		
		            	            //		sql8=" Select * from t_billdetails_Test where Billdate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"' and accno='"+token31[p]+"'  and  BillNo='"+token12[1]+"' and  Filename='"+flnm+"'   ";
		            	            		sql8=" Select * from t_billdetails where Billdate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"' and accno='"+token31[p]+"'  and  BillNo='"+token12[1]+"' and  Filename='"+flnm+"'   ";
		            	            		
		            	            		
		    				        		//System.out.println("The before sql8>>>"+sql8);	
		    				        		ResultSet rs5 =st2.executeQuery(sql8);
		                        			System.out.println("The sql8==> :"+sql8);	
		    				        		
		                        			if(rs5.next())
		                        			{
		                        				
		                        				//sql9="Delete from t_billdetails_Test where Billdate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token111[1]))+"' and accno='"+token31[p]+"'  ";      
		                        				sql9="Delete from t_billdetails where Billdate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token111[1]))+"' and accno='"+token31[p]+"'  ";
		                        				
		                        				//st1.executeUpdate(sql9);
		                     	              // System.out.println("The string sql9 is Delete loop a2222 ()()():"+sql9);
		                        				
		                        			}else{
		                        				
		                        		//		sql9="Insert into t_billdetails_Test (BillMonth,AccNo,BillNo,BillDate,BillPeriod,FileName,BillPeriodFrom,BillPeriodTo,Service_provider) values ('"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token31[p]+"','"+token12[1]+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"','"+token14[1]+"','"+flnm+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token14[1].substring(1,9)))+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token14[1].substring(12,token14[1].length())))+"','Airtel')" ;      
		                        				sql9="Insert into t_billdetails (BillMonth,AccNo,BillNo,BillDate,BillPeriod,FileName,BillPeriodFrom,BillPeriodTo,Service_provider) values ('"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token31[p]+"','"+token12[1]+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"','"+token14[1]+"','"+flnm+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token14[1].substring(1,9)))+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yy").parse(token14[1].substring(12,token14[1].length())))+"','Airtel')" ;
		                        				
		                        				//System.out.println("The string sql2 is b1111 before :"+sql9);
		                        				  st3.executeUpdate(sql9);
		                        				 System.out.println("sql9 :"+sql9);
		                        				
		                        			}     
		                	            
		                        			
		            	            	 }catch(Exception e71)
		            	            	 {
		            	            		 System.out.println("The Exception in bill details query  :"+e71);	 
		            	            		 
		            	            	 }
		                        			
		                        			 //System.out.println (">>>IN"+flnm);
		                        			
		            	            	 
		            	            	 
		            	            	 
		            	            	 //////***************************AKSHAY
		            	            	 
		            	            	
		            	            	 
		                        		try{
                                       

		                        			//System.out.println("The token30[a] >>>"+token30[a]);	
		                        			//System.out.println("The token31[p]>>>"+token31[p]);	

			    				        	
		                        	//		String  sql_chk= " Select * from t_subsummarydet_Test1 where  TMonth= '"+flnm+"' and mobno ='"+token30[a]+"' and AccNo= '"+token31[p]+"'  and DateTime1='"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01'   and Service_Provider='AirtelChild'  ";
		                        			String  sql_chk= " Select * from t_subsummarydet  where  TMonth= '"+flnm+"' and mobno ='"+token30[a]+"' and AccNo= '"+token31[p]+"'  and DateTime1='"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01'   and Service_Provider='AirtelChild'  ";		
		    				        		//System.out.println("The before sql8>>>"+sql_chk);	
		    				        		ResultSet rs5_chk =st4.executeQuery(sql_chk);
		                        			//System.out.println("The string  ssql_chke :"+sql_chk);
		                        			if(rs5_chk.next())
		                        			{
		                        			
		                        				//System.out.println("Record already present in  t_subsummarydet_sept table:");
		                        			
		                        			}else{
		                        			
		                        			try{	
		                        		//		sql10="Insert into t_subsummarydet_Test1( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider,fname) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','AirtelChild','"+file3+"')" ;      
		                        				sql10="Insert into t_subsummarydet ( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider,fname) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','AirtelChild','"+file3+"')" ;	
		                        			 //System.out.println ("OUT>>>>");
		                        			//System.out.println("The string sql2 is b1111 before :"+sql10);
		    		                    	
		                        				st5.executeUpdate(sql10);
		    		                    	System.out.println("The string sql2 is t_subsummarydet_Aug_FINAL after :"+sql10);
		                        		
		                        			}catch(Exception e33)
		                        			{
		                        				
		                        				System.out.println("The Exception in  t_subsummarydet_july_FINAL query INDIVIDUAL  :"+e33);		
		                        			}
		                        			
		                        			}
		                        		}catch(Exception e81)
		                        		{
		                        			System.out.println("The Exception in  t_subsummarydet_sept query  :"+e81);	 	
		                        			
		                        		}
		    				        	
		            	        			
		            	        			
		            	        			
		            	        			
		            	        			
		            	            	 
		            	            	 //////////AKSHAY
		            	        			}
		            	            
		            	        		}catch(Exception e77)
		            	        		  {
		            	        			  
		            	        			  System.out.println("Exception in else if loop of individual  e77==>"+e77); 
		            	        			  
		            	        		  }
		            	            acnt_type_subsumry="-";
		            	            
		            	        	
		            	            
		            	        	  }else if(item_type.equalsIgnoreCase("1.Mobile Internet - Volume") || item_type.contains("Mobile Internet - Volume") || !(item_type.contains("")) ){
		            	        		  
		            	        		 
		            	        		  System.out.println("ELSE IF LOOPPPPPPPPPPPP=CHRGE DETAILS **********>"); 
		            	        		  

		            	        		  try{
		            	        		 System.out.println("The else loop 222:");
		            	        		  if(todate!="-" || !(todate.equalsIgnoreCase("-"))){
		                      	            try{
		                      	            tmonth=acno+new SimpleDateFormat("MMM-yy").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate));
		                      	            
		                      	           
		                      	           tmonth="112-100792006OCT13.txt";

		                      	           
		                      	         System.out.println("token4.length-1   :"+token4.length);
		          				        for(int a=6,b=1;a< token4.length-1;a++,b++)
		          				        {
		          				        	// System.out.println("token4[a]  :"+token4.length);
		          				        	 //System.out.println("token1['"+a+"']  :"+token1[a]);
		          				        	if(token4[a]!="0.0" || token4[a]!="0.00")
		          				        
		          				        	{
		          				        		 //System.out.println("inside if loop>>>");
		          				        		 //System.out.println(">>>>token[a]>>>"+token[a]);
		          				        		
		          				        		try{
		          				        		
		          				        			//System.out.println("DATE FORMATTTT*********>>>"+token[b]);
		          				        			System.out.println("token[b]   :"+token[b]);
		   		                      	         System.out.println("token1[b]   :"+token1[b]);
		   		                      	    System.out.println("token4[a]   :"+token4[a]);
		          				        			
		          				        			//System.out.println("DATE FORMATTTT>>>"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b])));
		          				        			
		          				        	//		sql6="Select * from t_chargedetailsamt_FINAL_test where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"' and ttime='"+token1[b]+"'  and ItemType= '"+item_type+"' and BillNo='"+billno+"'   ";
		          				        			sql6="Select * from t_chargedetailsamt  where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"' and ttime='"+token1[b]+"'  and ItemType= '"+item_type+"' and BillNo='"+billno+"'   ";
		          				        			
		          				        			//System.out.println("inside if loop4444>>>"+sql6);
		          				        		//System.out.println("The before sql6>>>"+sql6);	
		          				        		ResultSet rs5 =st6.executeQuery(sql6);
		                              			//System.out.println("The string  sql6 is b333 else :"+sql6);	
		          				        		
		                              			//System.out.println("billno>>>>> :"+billno);	
		                              			
		                              			if(rs5.next())
		                              			{
		                              				
		        //                      				sql1="Delete from t_chargedetailsamt_FINAL_test where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"' and ttime='"+token1[a]+"'  ";      
		                           	        sql1="Delete from t_chargedetailsamt where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"' and ttime='"+token1[a]+"'  ";
		                              				
		                              				// st1.executeUpdate(sql1);
		                           	              //System.out.println("The string sql1 is delete loop a2222 (((((:"+sql1);
		                              				
		                              			}else{
		                              				
		                              		//		sql1="Insert into t_chargedetailsamt_FINAL_test( TMonth,MobNo,AccNo,BillNo,BillDate,TDate,TTime,CallNo,Duration,Amount,TAmt,ItemType,CallType,Service_Provider,FileName) values ('"+tmonth+"','"+mobno+"','"+token11[1]+"','"+billno+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate))+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"','"+token1[b]+"','"+token2[a]+"','"+token3[b]+"','"+token4[a]+"','"+token4[a]+"','"+item_type+"','"+call_type.replace("\"","")+"','Airtel','"+file3+"')" ;      
		                              				sql1="Insert into t_chargedetailsamt ( TMonth,MobNo,AccNo,BillNo,BillDate,TDate,TTime,CallNo,Duration,Amount,TAmt,ItemType,CallType,Service_Provider,FileName) values ('"+tmonth+"','"+mobno+"','"+token11[1]+"','"+billno+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate))+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[b]))+"','"+token1[b]+"','"+token2[a]+"','"+token3[b]+"','"+token4[a]+"','"+token4[a]+"','"+item_type+"','"+call_type.replace("\"","")+"','Airtel','"+file3+"')" ;
		                              				
		                              				//System.out.println("The string sql2 is b1111 before :"+sql1);
		                              				st7.executeUpdate(sql1);
		                              				 //System.out.println("The string sql1 IFFF is a2222 &&&&&& :"+sql1);
		                              				
		                              			}
		                              			
		                              			
		          				        		}catch(Exception e39)
		          				        		{
		          				        			 System.out.println("The Exception *****e39***t_chargedetailsamt********** :"+e39);
		          				        			
		          				        			
		          				        		}
		                              			
		                              			
		                              						        		
		          				        	}else{
		          				        		
		                                  
try{
		          				        //		sql6="Select * from t_chargedetailsamt_FINAL_test where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"' and ttime='"+token1[a]+"' and Service_Provider='Airtel' ";
		          				        		sql6="Select * from t_chargedetailsamt where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"' and ttime='"+token1[a]+"' and Service_Provider='Airtel' ";		
		          				        		//System.out.println("The before sql6>>>"+sql6);	
		          				        		ResultSet rs5 =st8.executeQuery(sql6);
		                              			//System.out.println("The string  sql6 is b333 else :"+sql6);	
		          				        		
		                              			if(rs5.next())
		                              			{
		                              				
		                              		//		sql1="Delete from t_chargedetailsamt_FINAL_test where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"' and ttime='"+token1[a]+"'  ";      
		                              				sql1="Delete from t_chargedetailsamt where Mobno='"+mobno+"' and TMonth='"+tmonth+"' and TDate='"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"' and ttime='"+token1[a]+"'  ";
		                              				
		                              				// st1.executeUpdate(sql1);
		                           	               //System.out.println("The string sql1 is  delete loop a2222 ******!!!!:"+sql1);
		                              				
		                              			}else{
		                              				
		                              			//	sql1="Insert into t_chargedetailsamt_FINAL_test( TMonth,MobNo,AccNo,BillNo,BillDate,TDate,TTime,CallNo,Duration,Amount,TAmt,ItemType,CallType,Service_Provider,FileName) values ('"+tmonth+"','"+mobno+"','"+token11[1]+"','"+billno+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"','"+token1[b]+"','"+token2[a]+"','"+token3[b]+"','"+token4[a]+"','"+token4[a]+"','"+item_type+"','"+call_type.replace("\"","")+"','Airtel','"+file3+"')" ;      
		                              				sql1="Insert into t_chargedetailsamt( TMonth,MobNo,AccNo,BillNo,BillDate,TDate,TTime,CallNo,Duration,Amount,TAmt,ItemType,CallType,Service_Provider,FileName) values ('"+tmonth+"','"+mobno+"','"+token11[1]+"','"+billno+"','"+new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MMM/yyyy").parse(token[a]))+"','"+token1[b]+"','"+token2[a]+"','"+token3[b]+"','"+token4[a]+"','"+token4[a]+"','"+item_type+"','"+call_type.replace("\"","")+"','Airtel','"+file3+"')" ;
		                              				//System.out.println("The string sql2 is b1111 before :"+sql1);
		                              				 st9.executeUpdate(sql1);
		                              				  System.out.println("The string sql1  ELSE   is a2222 ****** :"+sql1);
		                              				
		                              			}
                     }catch(Exception e99)
	                  {
		                 System.out.println("The Exception *****e39***t_chargedetailsnew********** :"+e99);
		
		
	                   }
		          				        	}
		          				        	    	
		          				        	
		          				        	
		          				        }
		                      	                    
		                      	            }catch(Exception e)
		                      	            {
		                      	            e.printStackTrace();
		                      	            //System.out.println("the exception is e>555> :"+e);
		                      	            	
		                      	            }
		                      	            
		                      	            }    
		            	        		  
		            	        		  
		            	        		  
		            	        		  
		            	        		  
		            	        		  
		            	        		  item_type="-";
		            	        		  
		            	        	  
		            	        		  }catch(Exception e66)
		            	        		  {
		            	        			  
		            	        			  System.out.println("Exception in else if loop of Mobile Internet - Volume  e66==>"+e66); 
		            	        			  
		            	        		  }
		            	        		  
		            	        	  }        	        	  
		            	        	  
		            	        	  else if(acnt_type_subsumry.equalsIgnoreCase("MULTIPLE")  || acnt_type_subsumry.contains("MULTIPLE")) {
		            	        		  
		            	        		//  System.out.println("todate@@@@  loop :==>"+todate);
		            	        		  
		            	        		         		  
		            	        		System.out.println("The else if MULTIPLE  loop :");
try{
		            	        		//System.out.println(">>token30[1]>>lt>>"+token30.length);
		                	          
	                               int a1=1,b=1,c=1,d=1,e=1,f=1,g=1,h=1,i2=1;
	                               for(int a=1,p=2,q=3;a< token30.length;a++,p++,q++)
		        				        {
	                            	  
		        				        	
		                	            	 if(todate!="-" || !(todate.equalsIgnoreCase("-"))){
		                	            	flnm=token11[1]+new SimpleDateFormat("MMM-yy").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate))+".txt";
		                	            	 }else{
			            	            		 
			            	            		 flnm="AirtelOct10_2013.txt";
			            	            		 
			            	            	 }
		                	            	
		                	            	//System.out.println("a>*********>>"+a);
		                	            	//System.out.println("p>*********>>"+p);
		                	            	//System.out.println("a>*token30[a]**mobno******>>"+token30[a]);
		                	            //	System.out.println("token20[a]=onetm_charge=>"+token20[p]);
		                	           	//System.out.println("token21[a]*mnth_charge**>>"+token21[p]);
		                	            	//System.out.println("token22[a]*call_charge**>>"+token22[p]);
		                	            //	System.out.println("token23[a]**val_added_servs*>>"+token23[p]);
		                	            //	System.out.println("token24[a]**mob internate usage*>>"+token24[p]);
		                	           // 	System.out.println("token25[a]**roaming*>>"+token25[p]);
		                	            	//System.out.println("token27[a]*taxex**>>"+token27[p]);
		                	            	//System.out.println("token28[a]***discnt>>"+token28[q]);
		                	            	//System.out.println("token18[a]**this_mnth_chrge*>>"+token18.length);
		                	            	//System.out.println("token18[a]**this_mnth_chrge*>length>"+token24.length);
		                	            	//System.out.println("e>****AFTER*****>>"+e);
		        				        		try{
		                	            	 
		        				        			//System.out.println(">>mob_intrnt_usage>>"+mob_intrnt_usage);
		        				        	//		sql11=" Select * from t_subsummarydet_Test1 where  Mobno ='"+token30[a]+"' and    TMonth='"+flnm+"' and Service_Provider='Airtel' and AccNo='"+token31[p]+"' ";
		        				        			sql11=" Select * from t_subsummarydet where  Mobno ='"+token30[a]+"' and    TMonth='"+flnm+"' and Service_Provider='Airtel' and AccNo='"+token31[p]+"' ";	
		        				        		System.out.println("The before sql11>>>"+sql11);	
		        				        		ResultSet rs5 =st10.executeQuery(sql11);
		                            			//System.out.println("The string  sql6 is b333 else :"+sql11);	
		        				        		
		                            			if(rs5.next())
		                            			{
		                            				
		                            				//sql12="Delete from t_subsummarydet_Test1 where Mobno ='"+token30[a]+"' and    TMonth='"+flnm+"'  ";      
		                            				sql12="Delete from t_subsummarydet where Mobno ='"+token30[a]+"' and    TMonth='"+flnm+"'  ";
		                            				
		                            				// st12.executeUpdate(sql12);
		                         	              // System.out.println("The  delete loop  is a2222 !@@!@!:"+sql12);
		                            				
		                            			
		                            			try{
		                         	           //   sql13="Insert into t_subsummarydet_Test1( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"''-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','Airtel')" ;      
		                         	             sql13="Insert into t_subsummarydet ( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"''-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','Airtel')" ;
		                         	              
		                         	              //System.out.println("The string sql12 is b1111 before :"+sql13);
		                            				  //st11.executeUpdate(sql13);
		                            				 //System.out.println("delete den insert####33:"+sql13);
		                            			
		                            			}catch(Exception e33)
		                            			{
		                            				  System.out.println("e33=  Delete loop=t_subsummarydet_sept3=>####33:"+e33);
		                            				
		                            			}
		                            				  
		                            				  
		                            				  
		                            			}else{
		                            				
		                            				
		                            				try{
		                            			//	sql12="Insert into t_subsummarydet_Test1( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider,fname) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','Airtel','"+file3+"')" ;      
		                            				sql12="Insert into t_subsummarydet ( TMonth,DateTime1,mobno,AccNo,OneTimeCharge,MonthlyCharge,CallCharges,ValueASCharge,MobileInternet,RoamingCharge,Discounts,Tax,Total,Service_Provider,fname) values ('"+flnm+"','"+new SimpleDateFormat("yyyy-MM").format(new SimpleDateFormat("dd/MM/yy").parse(token111[1]))+"-01','"+token30[a]+"','"+token31[p]+"','"+token20[p].trim()+"','"+token21[p].trim()+"','"+token22[p].trim()+"','"+token23[p].trim()+"','"+token24[p].trim()+"','"+token25[p].trim()+"','"+token28[p].trim()+"','"+token27[p].trim()+"','"+token18[q].trim()+"','Airtel','"+file3+"')" ;
		                            				System.out.println("The insert before :"+sql12);
		                            				  st19.executeUpdate(sql12);
		                            				  System.out.println("The insert AFTER####:"+sql12);
		                            				
		                            				}catch(Exception e33)
			                            			{
			                            				  System.out.println("e33=  ELSE loop=t_subsummarydet_july3=>####33:"+e33);
			                            				
			                            			}
		                            				  
		                            				  
		                            				  
		                            			}     
		                            			
			                	            	
			                	            	//System.out.println("c*>>"+c);
			                	            //	System.out.println("b*>>"+b);
		                            			
		                            			
		                            			
		        				        		}catch(Exception r44)
		        				        		{
		        				        			
		        				        			System.out.println("Exception in t_subsummarydet_july ==>"+r44);	
		        				        			
		        				        		}
		                            			// System.out.println (">>>IN"+flnm);
		                            			
		                            			
		        		                    	
		                            			 //System.out.println ("OUT>>>>");
		                            			//System.out.println("The string sql2 is b1111 before :"+sql10);
		        		                    	//st7.executeUpdate(sql10);
		        		                    	//System.out.println("The string sql2 is b1111 after :"+sql10);
		                    	            
		        				        	
		        				        
		        				        
		        				        }
		                	            
		                	            
		                	            acnt_type_subsumry="-";
		                	            
		                	        	  
   }catch(Exception  e55)
{
	
	 System.out.println("Exception in else if loop of multiple  e55==>"+e55);
	
}
		                	            
		                	            
		                	            
		            	        		  
		            	        	  }else{
		            	        		  
		            	        		  
		            	        		 // System.out.println("ELSEEEEEEEEEEEEEEE LooPPPPPPPPPPP==>");
		            	        	  }
		            	           
		            	           
		            	           
		                                         	           
		            	           
		            	           }catch(Exception e)
		            	           {
		            	        	   
		            	        	   System.out.println("The Exception is last loop a2222 ^^^^^66:"+e);
		            	        	   e.printStackTrace(); 
		            	        	   
		            	           } 
						        
						        
						        
		            	           in.close();	
						       
						}
						
						//System.out.println("@@@@@@@@@@@@@@@@@@@@"+listOfFiles1[i]);
						//System.out.println("@@@@@@@@@@@@@@@@@@@@"+listOfFiles1[i].getName());
						//System.out.println("@@@@@@@@@@@@@@@@@@@@"+listOfFiles[i].getName());
						
						if(listOfFiles[i].renameTo(new File("/home/a_thakur/Desktop/Airtel_Tess/ProcessedFiles/" + listOfFiles[i].getName())))
						
						
						
						//if(listOfFiles[i].renameTo(new File("/home/javaprg/processedFiles/" + listOfFiles[i].getName())))
						
						{
							
							System.out.println("File is moved successful!");

						}
						
					
					//	break;
						
						
		    	}
		         
		         
		         //System.out.println("file is 55555 :"+files1);
						 
						
					         
					         
					        //Read File Line By Line
					        
					       // System.out.println ("discnt>>>>>"+discnt);
					        
					        
					       // System.out.println ("mob_sumsmry>>>>>"+mob_sumsmry);
					      
	            	            
	            	            
	            	            
	            	            
	            	            
	            	            
	            	            
					        
					        
					        
						//readxlfile(files1);
						//System.out.println("move successfully"); 
						
						
			 
					
		        
		        }
		        
				 
		    	  }catch(Exception e22)
		    	  {
		    		  
		    		 e22.printStackTrace(); 
		    		 System.out.println("Exception e22************===>"+e22);
		    	  }
		        
		        
		        CloseConnection();
		        
		        
		        //System.out.println(">>.33333333333");  
				  
		        
		         
		        // Get the object of DataInputStream
		       
		         
		        //Close the input stream
		     
		         
		        } catch (Exception e){//Catch exception if any
		            System.err.println("Error: " + e.getMessage());
		        }
			
			
			
			
		}
	 
		
		
		public static void DeletingprocessedFolder(String filepath) throws SQLException,ParseException
		{
			
			try{
			
				File file=new File (filepath);
				
				if(file.isDirectory())
				{
				// Get all files in the folder
				File[] files=file.listFiles();

				for(int i=0;i<files.length;i++)
				{

				// Delete each file in the folder
				//delete(files[i]);
				
				//files[i].delete();//////commented code

				}

				// Delete the folder
			//	file.delete();st8

				}


				else
				{

				// Delete the file if it is not a folder
				//file.delete();/////commented code 

				}
				
				
				
				
				//File file1 = new File(""+filepath1+"/");
					
	    	//file1.delete();
	    	System.out.println("Processed folder is been deleted==========>"+filepath1); 
			
			 			
			}catch(Exception e23)
			{
				
				System.out.println("Exception while deleting folder ======>"+e23); 
				
			}
			
			 
				 
				 
				
					 try{
					 
						 Class.forName("org.gjt.mm.mysql.Driver");
							//con=DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","java","transjava!1");
							con=DriverManager.getConnection("jdbc:mysql://192.168.2.55/db_gps","diary","d@1ry");

							System.out.println("Connection Successful...in delete folder  method...");
							st=con.createStatement();
							st1=con.createStatement();
							st4=con.createStatement();
						 
						 st_update=con.createStatement();
					 }catch(Exception e22)
					 {
						 
						e22.printStackTrace(); 
						 System.out.println("Exception in updxate ======>"+e22); 
						 
					 }
				 
					// try{
				 
				//	String  sql11="Update  db_gps.t_serviceproviderbillingDetails  set status ='Deleted'  where filepath='"+filepath1+"' and  ServiceProvider='Airtel' "; 
					//System.out.println("The table status  record is been updated  :"+sql1);
					//st_update.executeUpdate(sql11);
						//  System.out.println("The table status  record is been updated after  :"+sql11);
					 
				 //}catch(Exception e33)
				 //{
					// System.out.println(">>>exception****in updating status  records  e34 >>>"+e33);  
					 
		//		 }
			
			
			
			
			
		}
	 
	 
		 
		 
		 
		
	     // end of
	} //end of FileRead class