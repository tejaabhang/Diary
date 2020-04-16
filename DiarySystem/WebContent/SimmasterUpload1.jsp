<%@ page import="java.sql.*" %>
<%@page import="java.util.Date.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.TreeSet" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>  
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFCell" %> 
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

   <%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
   <%@ page import = "java.io.FileNotFoundException"%>
   <%@ page import = "java.io.FileOutputStream"%>
   <%@ page import = "java.io.IOException"%>
   <%@ page import="javax.activation.*" %>  
   <%@ page import="java.io.FileInputStream" %>
   <%@ page import="java.math.BigDecimal" %>
   <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.DriverManager" %>
   <%@ page import="java.sql.ResultSet" %>
   <%@ page import="java.sql.Statement" %>
   <%@ page import="java.text.SimpleDateFormat" %>
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.StringTokenizer" %>
   <%@page import="org.apache.poi.hssf.usermodel.HSSFDateUtil"%>

<script type="text/javascript">
function crosscountry(){
	//alert("hello");
var alertone= document.getElementById("allu").value;
window.location.href="SimmasterUpload.jsp?msg=1&alertone="+alertone;
//response.sendRedirect("SimmasterUpload.jsp?msg=1");
}
</script>
<%
String file1="";
int saveflag=1;
File savedFile;
String[] filepath =new String[10];
String[] filename =new String[10];
int  count2 = 0, filecount = 0;;
int count=1;
String savefilestring="";
String service_provider = "";
String pon = "";
String activation_date = "";
String plan = "";
System.out.println(">>>>>>>>>>>>>>>>>>>>");
String Category="";
int count1=0;
String username=session.getAttribute("username").toString();
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String sdt = fmt.format(td);
System.out.println("EntryDate is:" + sdt);
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("\n\n ismultipart-->>"+isMultipart);
        if (!isMultipart) {
        System.out.println("\n\nin multipart..");
        } else {
                System.out.println("\n\n in else with  multipart..");
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                        items = upload.parseRequest(request);
                //      System.out.print("\n\n items==>"+items);
                } catch (FileUploadException e) {
                        e.printStackTrace();
                }
                Iterator itr = items.iterator();
                
                
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if(item.isFormField()) 
                    {
		                    	String name1 = item.getFieldName();
		                        System.out.print("\n name==>"+name1);
		                        String value = item.getString();
		                        System.out.print("\n value==>"+value);
		                        if(name1.equals("operator")) 
		                        {
		                        		service_provider = value;
		                                System.out.print("\n title==>"+service_provider);		                             
		                               
		                        }
		                        if(name1.equals("pon")) 
		                        {
		                        		pon = value;
		                                System.out.print("\n title==>"+pon);		                             
		                               
		                        }
		                        if(name1.equals("activation_date")) 
		                        {
		                        		activation_date = value;
		                                System.out.print("\n title==>"+activation_date);		                             
		                               
		                        }
		                        if(name1.equals("plan")) 
		                        {
		                        		plan = value;
		                                System.out.print("\n title==>"+plan);		                             
		                               
		                        }
		                        
		                        
		                        if(name1.equals("Category"))
		                        {
		                        	Category=value;
		                        	System.out.print("\n Category==>"+Category);
		                        	
		                        }
		                        
		                        
                    } else {
                                   try {

                                         String itemName = item.getName();
                                         System.out.print("\n\nitemName==>"+itemName);
                                         	file1=itemName;
                                          if(itemName.equalsIgnoreCase(""))
                                          {
                                          }
                                        else
                                         {
                                        	//savedFile = new File("/home/twtech/"+itemName);  
                                     	  	  
                                     		savedFile = new File("/home/javaprg/TaskList/"+itemName);  
                                        //savedFile = new File("/home/bunnty/Desktop/"+itemName);
                                         					System.out.print("\n\nsavedFile==>"+savedFile);
                                                            item.write(savedFile);
                                                            filepath[filecount]=""+savedFile;
                                                            
                                                            filename[filecount]=itemName;
                                                            filecount++;
                                                            if(saveflag==1)
                                                            {
                                                             savefilestring=""+savedFile;
                                                             saveflag++;
                                                            }
                                                            else
                                                            savefilestring=savefilestring+","+savedFile;
                                                             //out.print("successfully saved the file");
                                                            //File file = new File(savedFile);
                                                            String screenshot=savedFile.getAbsolutePath();
                                                   // System.out.println("\n\nscreenshot--->>>"+screenshot);
                                                            }
                                                    
                                                    
                                    } catch (Exception e) {
                                            e.printStackTrace();
                                    }
                    }
            }
	
 }
   //=============================excel reading code========================
try{	   
	   
	  // String duplicateSim="";
	 	TreeSet duplicateSim = new TreeSet();
        		//get connection
        	 	Connection conne = null;
				 Statement st = null;
				 Statement st1 = null;
				
        		try {
						String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
						String MM_dbConn_USERNAME = "diary";
						String MM_dbConn_PASSWORD = "d@1ry";
						//String MM_dbConn_GPS = "jdbc:mysql://103.8.126.138/db_gps";
					//	String MM_dbConn_GPS = "jdbc:mysql://103.8.126.138/db_gps"; 
						//String MM_dbConn_GPS = "jdbc:mysql://103.241.181.36/db_gps";
			String MM_dbConn_GPS = "jdbc:mysql://173.234.153.82/db_gps";
						Class.forName(MM_dbConn_DRIVER);
						conne = DriverManager.getConnection(MM_dbConn_GPS,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						st=conne.createStatement();
						st1=conne.createStatement();
						System.out.println("===========connection created=============");
					
					} catch (Exception e) {
						System.out.print("GetConnection Exception ---->" + e);
					}
					
					activation_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(activation_date));
					System.out.println(">>>>>>The service Provider is "+service_provider);
					System.out.println(">>>>>>The Purchase Ordernum is "+pon);
					System.out.println(">>>>>>The activation date is "+activation_date);
					System.out.println(">>>>>>The plan is "+plan);
					
					//read excel file
				//String fname = "/home/twtech/"+file1;
				String fname = "/home/javaprg/TaskList/"+file1;
					//String fname = "/home/bunnty/Desktop/"+file1;
					System.out.println("The filename is :"+file1);
					System.out.println("The filepath is :"+fname);
			        List sheetData = new ArrayList();			 
			        FileInputStream fis = null;
			        
			        
			        
			  
			        try {
			            
			            fis = new FileInputStream(fname);			 
			            HSSFWorkbook workbook = new HSSFWorkbook(fis);			            
			            HSSFSheet sheet = workbook.getSheetAt(0);
			            Iterator rows = sheet.rowIterator();
			            while (rows.hasNext()) {
			                HSSFRow row = (HSSFRow) rows.next();
			                Iterator cells = row.cellIterator();
			 
			                List data = new ArrayList();
			                while (cells.hasNext()) {
			                    HSSFCell cell = (HSSFCell) cells.next();
			                    data.add(cell);
			                    
			                }
			 
			                sheetData.add(data);
			            }
			        } catch (IOException e) {
			            e.printStackTrace();
			        } finally {
			            if (fis != null) {
			                fis.close();
			            }
			        }
			        
			        
			        
			        
			        
			        //show excel data=====
			        	System.out.println("The >>>>>>>>>>>>is :");
			        
			        int cnt=0;
       		// Iterates the data and print it out to the console.
       		/* ====================================== */
       		  if(Category.equals("Sim"))
       		  {
       			 
			        for (int i = 1; i < sheetData.size(); i++)
			        {
			        	cnt++;
			        	String row="";
			            List list = (List) sheetData.get(i);
			           
			            try{
			            	//System.out.println( "IN ntry   ");
			            for (int j = 0; j < list.size(); j++) {
			                //Cell cell = (Cell) list.get(j);
			                 HSSFCell cell = (HSSFCell) list.get(j);
			                System.out.println( "The cell type is :"+cell.getCellType());	
			                
			               //if(cell.getCellType()==Cell.CELL_TYPE_NUMERIC) 
			               if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)  
			               {
			                	//System.out.println( "IN IFFFFFFFFF    ");	
			                	//if(DateUtil.isCellDateFormatted(cell))
			                	if(HSSFDateUtil.isCellDateFormatted(cell)){  
			                	//	System.out.print( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue()) );
			                		System.out.println( "hibhihihihih>>>>"+cell.getDateCellValue());
			                		if(row.equals("")){
			                			System.out.println( "IN another iff ");
			                		row=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue());
			                		}else{
			                			row=row+"$"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue());
			                		}
			                    }else{
			                    //	System.out.println( "INanothsr    ELS SSSSSSS ");
			                    	System.out.print(new BigDecimal(cell.getNumericCellValue()).toString());
			                    	if(row.equals("")){
			                    	row=new BigDecimal(cell.getNumericCellValue()).toString();
			                    	}else{
			                    		row=row+"$"+new BigDecimal(cell.getNumericCellValue()).toString();
			                    	}
			                    }
			               
			                }
			                
			                else{  
			                	//System.out.println( "IN mainn     ELS SSSSSSS ");
			                	    System.out.print(cell.toString());
			                	    if(row.equals("")){
			                	    row=cell.toString();
			                	    }else{
			                	    	 row=row+"$"+cell.toString();
			                	    }
			                }
			                 
			               
			                if (j < list.size() - 1) {
			                    System.out.print(" ");
			                }   
			            }
			            }catch(Exception ioe){
			            	System.out.println("The exception is xxx:"+ioe);
			            	ioe.printStackTrace();
			            }
			            //code for row
			            System.out.println("\nThe row is >>  "+row);
			         //   insertToDb(rw);
			            //inset row into database
			            				
							String mobno="",simno="";
							int p=0;
							int countFeild=0;
							String para1="",para2="";
						try
						{
							StringTokenizer stringTokenizer = new StringTokenizer(row,"$");
							System.out.println("The total no. of tokens generated :  " + stringTokenizer.countTokens());
							countFeild  = stringTokenizer.countTokens();						
							while(stringTokenizer.hasMoreTokens()){
												
								para1 = stringTokenizer.nextToken();
								para2 = stringTokenizer.nextToken();
							}
						
						//trim the  white space						
						para1 = para1.trim();
						para2 = para2.trim();
						
						System.out.println("The number of char is+++sim :"+para1.length());
						System.out.println("The number of char is+++mob :"+para2.length());
						
						/* if(para1.length() > 10)
						{
							simno = para1;
							mobno = para2;
							
						}else{
							
							mobno = para1;
							simno = para2;
						} */
						mobno = para1;
						simno = para2;
						
						System.out.println("The sim number is  :"+simno);
						System.out.println("The mobile number is  :"+mobno);
						
						
							if(simno.contains("'") || simno.contains("\"")){
								simno=simno.replace("'", " ");
								simno=simno.replace("\"", " ");
							}
							
							if(simno.contains("*")){
								simno=simno.replace("*", "");
							}
							if(simno.contains("F")){
								simno=simno.replace("F", "");
							}
							if(simno.contains("f")){
								simno=simno.replace("f", "");
							}
							
							System.out.println("The sim no is******** :"+simno);
							//add the 'f' at the last of sim no
							simno = simno+"f";
							System.out.println("The new sim no is *****:"+simno);
							
								if(mobno.contains("'") || mobno.contains("\"")){
								mobno=mobno.replace("'", " ");
								mobno=mobno.replace("\"", " ");
							}
							
							System.out.println(">>>>>>>>>>>>>>>>>Sim Numer "+simno);
							System.out.println(">>>>>>>>>>>>>>>>>Mobile Numer "+mobno);						
							
							if(countFeild==2)
							{
								
								//check whether sim already exist in database or not
								String sql1 ="select * from db_gps.t_simmaster where Simno = '"+simno+"'";
								ResultSet rs1 = st1.executeQuery(sql1);
				             	if(rs1.next())
				              	{
				             		duplicateSim.add(simno);
				             		System.out.println("output is:-" + duplicateSim);
				             		System.out.println("The record regarding this sim no is already present in db -->> "+duplicateSim);
				             		
				             		
				              	}else{
				              		//insert into table
									String sql ="insert into db_gps.t_simmaster(Simno,Mobno,DateofPurchase,Purchaseno,Service_Provider,Activationdate,plan,EntryBy,EntryDate)values('"+simno+"','"+mobno+"','"+activation_date+"','"+pon+"','"+service_provider+"','"+activation_date+"','"+plan+"','"+username+"','"+sdt+"')";	

									System.out.println("The query is :"+sql);
								int k =st.executeUpdate(sql);
								System.out.println("The number of rows updated :"+k);
				              	}
								
				             	
							
						  	}//endif	
						}catch (Exception e) {
					
							System.out.println("exceptionnnn===>>"+e);
						}
							
					
								            
								            System.out.println("  ");
				}//end of for loop of show excel data
				
       		  }
       		
       		
       		  else
       		  {
       			  
       			  
       			  System.out.println("Not Sim");
       			  
       			/*  =================Logic to excel other than sim========== */
       			  
       			  for (int i = 1; i < sheetData.size(); i++)
			        {
			        	cnt++;
			        	String row="";
			            List list = (List) sheetData.get(i);
			           
			            try{
			            	//System.out.println( "IN ntry   ");
			            for (int j = 0; j < list.size(); j++) {
			                //Cell cell = (Cell) list.get(j);
			                 HSSFCell cell = (HSSFCell) list.get(j);
			                System.out.println( "The cell type is :"+cell.getCellType());	
			                
			               //if(cell.getCellType()==Cell.CELL_TYPE_NUMERIC) 
			               if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)  
			               {
			                	//System.out.println( "IN IFFFFFFFFF    ");	
			                	//if(DateUtil.isCellDateFormatted(cell))
			                	if(HSSFDateUtil.isCellDateFormatted(cell)){  
			                	//	System.out.print( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue()) );
			                		System.out.println( "hibhihihihih>>>>"+cell.getDateCellValue());
			                		if(row.equals("")){
			                			System.out.println( "IN another iff ");
			                		row=new SimpleDateFormat("yyyy-MM-dd").format(cell.getDateCellValue());
			                		}else{
			                			row=row+"$"+new SimpleDateFormat("yyyy-MM-dd").format(cell.getDateCellValue());
			                		}
			                    }else{
			                    //	System.out.println( "INanothsr    ELS SSSSSSS ");
			                    	System.out.print(new BigDecimal(cell.getNumericCellValue()).toString());
			                    	if(row.equals("")){
			                    	row=new BigDecimal(cell.getNumericCellValue()).toString();
			                    	}else{
			                    		row=row+"$"+new BigDecimal(cell.getNumericCellValue()).toString();
			                    	}
			                    }
			               
			                }
			                
			                else{  
			                	//System.out.println( "IN mainn     ELS SSSSSSS ");
			                	    System.out.print(cell.toString());
			                	    if(row.equals("")){
			                	    row=cell.toString();
			                	    }else{
			                	    	 row=row+"$"+cell.toString();
			                	    }
			                }
			                 
			               
			                if (j < list.size() - 1) {
			                    System.out.print(" ");
			                }   
			            }
			            }catch(Exception ioe){
			            	System.out.println("The exception is xxx:"+ioe);
			            	ioe.printStackTrace();
			            }
			            //code for row
			            System.out.println("\nThe row is >>  "+row);
			         //   insertToDb(rw);
			            //inset row into database
			            				
							String mobno="",simno="";
							int p=0;
							int countFeild=0;
							String para1="",para2="",para3="",para4="",para5="",para6="",para7="";
						
							String serialno="",name="",model="",purchasedate="",warrenty="",vendor="",id="";
							try
						{
							StringTokenizer stringTokenizer = new StringTokenizer(row,"$");
							System.out.println("The total no. of tokens generated :  " + stringTokenizer.countTokens());
							countFeild  = stringTokenizer.countTokens();						
							while(stringTokenizer.hasMoreTokens())
							{
												
								para1 = stringTokenizer.nextToken();
								para2 = stringTokenizer.nextToken();
								
								para3 = stringTokenizer.nextToken();
								para4 = stringTokenizer.nextToken();
								
								para5 = stringTokenizer.nextToken();
								para6 = stringTokenizer.nextToken();
								
								para7 = stringTokenizer.nextToken();
								
								
							}
						
						//trim the  white space						
						para1 = para1.trim();
						para2 = para2.trim();
						para3=para3.trim();
						
						para4 = para4.trim();
						para5 = para5.trim();
					
						para6 = para6.trim();
						para7 = para7.trim();
							
						id=para1;
						serialno=para2;
						name=para3;
						model=para4;
						purchasedate=para5;
						warrenty=para6;
						vendor=para7;			
						
						
						
						
							
							if(countFeild==7)
							{
								
								String sql1 ="select category,serialno from db_gps.t_unitperipherals where category='"+Category+"' and serialno='"+serialno+"'";
								ResultSet rs1 = st1.executeQuery(sql1);
								
								
								if(rs1.next())
								{
									
								System.out.println("Category and serial no duplicate");
									
								}	
								else
								{
								String sql="insert into db_gps.t_unitperipherals (category,serialno,name,model,purchasedate,warrenty,vendor,entryby,id) values('"+Category+"','"+serialno+"','"+name+"','"+model+"','"+purchasedate+"','"+warrenty+"','"+vendor+"','"+username+"','"+id+"') ";
								
								System.out.println("Query===>"+sql);
								
								st.executeUpdate(sql);
								}
								//check whether sim already exist in database or not
								/* String sql1 ="select * from db_gps.t_simmaster where Simno = '"+simno+"'";
								ResultSet rs1 = st1.executeQuery(sql1);
				             	if(rs1.next())
				              	{
				             		System.out.println("The record regarding this sim no is already present in db");
				             		
				              	}else{
				              		//insert into table
									String sql ="insert into db_gps.t_simmaster(Simno,Mobno,DateofPurchase,Purchaseno,Service_Provider,Activationdate,plan)values('"+simno+"','"+mobno+"','"+activation_date+"','"+pon+"','"+service_provider+"','"+activation_date+"','"+plan+"')";	

									System.out.println("The query is :"+sql);
									//int k =st.executeUpdate(sql);
									//System.out.println("The number of rows updated :"+k);
				              	} */
								
								
							
						  	}//endif	
						}catch (Exception e) {
					
							System.out.println("exceptionnnn===>>"+e);
						}
							
					
								            
								            System.out.println("  ");
				}
       			  
       			  
       			  
       			/*  =================Logic to excel other than sim========== */ 
       			  
       		  }
       		
       		
       		
       		
       		
				/* ===================== */
				System.out.println("The total number of records in the excel sheet :"+cnt);
				
				//move the excel file in other folder
			//File f = new File("/home/twtech/"+file1);
			 File f = new File("/home/javaprg/TaskList/"+file1);
			//File f = new File("/home/bunnty/Desktop/"+file1);
				
			/*Temporary comented*/
			if(f.renameTo(new File("/home/javaprg/TaskListDestination/" + file1)))
				{							
					System.out.println("File is moved successful!");
				} 
  
        //=======================================================================   
        //response.sendRedirect("SimmasterUpload.jsp?msg=1");
         
        String duplicateSimString = duplicateSim.toString().replaceAll("\\s", "");
        //System.out.println("duplicateSimString original -> "+duplicateSimString);
        duplicateSimString = duplicateSimString.substring(1, duplicateSimString.length()-1);
        //System.out.println("duplicateSimString -> "+duplicateSimString);
        %>
								<input type="hidden" name="allu" id="allu" value="<%=duplicateSimString%>">
								<%
        out.println("<script> crosscountry();</script>");
}
   catch(Exception e){
	System.out.println("Th exception is >>>>>"+e);
	
}
%>