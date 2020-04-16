package com;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.text.*;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.util.NumberToTextConverter;


import java.io.IOException;
import java.io.PrintWriter;
/**
 * Servlet implementation class InsertData
 */
public class InsertingData extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static boolean flag=false;
	static int interval=0;
	static String updatesecondaryserver="";
	static	String host = "";
	static  String username = "";
	static String password = "";
	static String body="",msgname="";
	static  int msgno=0;
	static  int totalmsgno=0;
	static  int msgsize=0;
	static  String subject="";
	static  String tbname="";
	static String maildate="";
	static String mailtime="";
	static String dbdriver,connstring,dbuser,dbpass;
   static Connection conn1;
   static Statement st;
	

	
	/**
     * Default constructor. 
     */
    public InsertingData() 
    {super();
    	System.out.println("IN constructor");
    	
    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		// TODO Auto-generated method stub
    	try
    	{
    		String path;
    		System.out.println("in dooo get=>");
    		getConnection();
    		System.out.println("Connection successful");
	        path=request.getParameter("Filename");
		   //String path1="/home/vishal/ExcelFiles/"+path;
		   String path1=path;
		   System.out.println(path1);
		   PrintWriter pw=response.getWriter();
		   System.out.println(path);
		   //String path=getServletContext().getRealPath("filename");
		   System.out.println("Before Calling Zip");
		   boolean floag= getZipFiles(path1);
           //System.out.println("floagfloag==>"+floag);
		response.sendRedirect("BulkSmssending.jsp");				
					
  }catch (Exception e) 
     {
			e.printStackTrace();
			System.out.print("Exception in getconnection--->"+e);
     }
	
	System.out.println("done");
}
	private void getConnection() {
		try{        
		Class.forName("org.gjt.mm.mysql.Driver");
		  //	conn= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_avlalldata","fleetview","1@flv");
		  	 conn1= DriverManager.getConnection("jdbc:mysql://192.168.1.55/db_CustomerComplaints","fleetview","1@flv");
		  	//conn1= DriverManager.getConnection("jdbc:mysql://203.199.134.130/db_gps","fleetview","1@flv");
		  	 st=conn1.createStatement();
		}catch (Exception e) {
			// TODO: handle exception
		      System.out.println(e);
		}
		
	}
	public  static boolean  getZipFiles(String path) {
		// TODO Auto-generated method stub
    	String flag="false";
    	Boolean insertflag=false;
		try
        {
			
			
			flag="true";
			String destinationname ="/home/vishal/ExcelFiles/"+path+"";
			//String filename="jrm.xls";
            //                                                                                                                          String destinationname = "/home/mahesh/Desktop/test/";
            byte[] buf = new byte[1024];
            ZipInputStream zipinputstream = null;
            ZipEntry zipentry;
            zipinputstream = new ZipInputStream(
                new FileInputStream(destinationname));

          
            zipentry = zipinputstream.getNextEntry();
            String entryName="/home/vishal/ExcelFiles/"+path+"";
            System.out.println("entryName==>"+entryName);
            String directory ="";
            while (zipentry != null) 
            { 
                //for each entry to be extracted
                 entryName = zipentry.getName();
                System.out.println("entryname "+entryName);
                int n;
                FileOutputStream fileoutputstream;
                File newFile = new File(entryName);
                 directory = newFile.getParent();
                System.out.println("directory"+directory);
                if(directory == null)
                {
                    if(newFile.isDirectory())
                        break;
                }
                
                fileoutputstream = new FileOutputStream(
                        destinationname);       

                while ((n = zipinputstream.read(buf, 0, 1024)) > -1)
                    fileoutputstream.write(buf, 0, n);

                fileoutputstream.close(); 
                zipinputstream.closeEntry();
                zipentry = zipinputstream.getNextEntry();

            }//while

            zipinputstream.close();
           
             insertflag=displayFromExcel(destinationname);
            
            
            
         }catch(Exception e)
    {
    	flag="false";
        e.printStackTrace();
    }
    return insertflag;
}
	private static Boolean displayFromExcel(String destinationname) {
		boolean insertFlag = false;
		
		InputStream inputStream = null;

		try
		{
			inputStream = new FileInputStream (destinationname);
			System.out.println("xls path"+destinationname);
		}
		catch (FileNotFoundException e)
		{
			System.out.println ("File not found in the specified path.");
			e.printStackTrace ();
		}

		POIFSFileSystem fileSystem = null;
		//bean for insertion
		validdate1 valid = null;
		
		//String username=user;
		
		ArrayList<validdate1> validList= new ArrayList<validdate1>();
		//ArrayList<InvalidData> invalidList= new ArrayList<InvalidData>();
		//ArrayList<DisplayData> dispList= new ArrayList<DisplayData>();
		
		@SuppressWarnings("unused")
		String 	flag="false";
		try
		{
			fileSystem = new POIFSFileSystem (inputStream);
            
			HSSFWorkbook      workBook = new HSSFWorkbook (fileSystem);
			HSSFSheet         sheet    = workBook.getSheetAt (0);
			Iterator rows     = sheet.rowIterator ();
               
			
			while (rows.hasNext ())	{
				 insertFlag = false;
			
				 //valid and invalid bean
				valid = new validdate1();
				
				HSSFRow row = (HSSFRow)rows.next ();
				// display row number in the console.
				//System.out.println ("Row No.: " + row.getRowNum ());
				int rowno=row.getRowNum ();
				if(rowno!=0){
				// once get a row its time to iterate through cells.
				Iterator cells = row.cellIterator ();
				
				while (cells.hasNext ()) {

					HSSFCell cell = (HSSFCell)cells.next ();
                  
					//System.out.println ("Cell No.: " + cell.getColumnIndex());

					/*
					 * Now we will get the cell type and display the values
					 * accordingly.
					 */
								
						switch(cell.getColumnIndex())
						{
						
					
						
						case 0:
						{
							try
							{
							    long mobno = (long)cell.getNumericCellValue();
							    
							    valid.setMobNo(mobno);
								
								
						
							}catch(Exception e)
							{
								System.out.println("Exception e"+e);
								
							}
							
					        
							
							break;
						}
						
						case 1:
						{
							try
							{
								
							//	String msg = cell.getStringCellValue();
								
								

								HSSFRichTextString  msg = cell.getRichStringCellValue();
								String var= msg.toString();
								valid.setMessage(var);
								
								
								
								
						
							}catch(Exception e)
							{
								
							}
							
					
							
							break;
						}
						
					
						default :
						{
							try
							{
							System.out.println ("Wrong value not numeric: " + cell.getNumericCellValue ());
							}catch(Exception e)
							{
								//insertFlag = true;
							}
							//insertFlag = true;
							break;
						}
					}//switch end
						
						
						 
						
			}//cell end
				
				///////////////------------- Insert the record into database------------------------------------
					
				try{
					
					long mono=0;
					String message=""; 
					
					
					validList.add(valid); 
				
					
				java.util.Date dt=new java.util.Date();
				
				String Storedate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dt);
				//String stddatetime=Storedate;
					
					//ArrayList<ValidData> validList= new ArrayList<ValidData>();
					Iterator<validdate1> itr = validList.iterator();
				    while (itr.hasNext()) {
				    	validdate1 element = itr.next();
				    	 
				    	
						 
						 	mono=element.getMobNo();
						 
						 	message=element.getMessage();
						 	
						 	//System.out.println("mono==>"+mono);
						
						 	
				    						    }
				    String mm=""+mono;
				    System.out.println("mono==>"+mm);
				    System.out.println("Msg==>"+message);
				    
				    
				    //System.out.println("lonvalue"+dtime);
				    
				    
				 
				 
					     
					   String str="insert into t_smssend(SMSDate,MobNo,Message,Status)values('"+Storedate+"',"+mm+",'"+message+"','NO')";
					  st.executeUpdate(str);
								    
				}
				catch(Exception e)
				{
					System.out.println("error in inserting castroljd"+e);
				}
								 /* New reruirement for processing */
										
					    
		   }// End of if row 0 end
		 }//End of while -row end
		}
		catch (IOException e)
		{
			e.printStackTrace ();
		}
		catch(OfficeXmlFileException e)
		{
			e.printStackTrace();
			
		}
		
		
		return insertFlag;
		
	
	}
	}
    
    
   
   








	
	
		

