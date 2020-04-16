package beanpack;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.*;
import java.io.*;
 
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;



//import  "org.apache.commons.fileupload.servlet.ServletFileUpload";
//<%@ page import=""%>
//<%@ page import="org.apache.commons.fileupload.*"%>





import org.apache.commons.pool.impl.GenericKeyedObjectPool.Config;
public class UnzippingBillingFilesNew {
	
	static Connection conn=null;
	static Connection conn1=null;
	static Statement st1=null;
	static Statement st2=null;
	static Statement st3=null;
	static Statement st4=null;	
	static Statement st5=null;	
	
	

	/**
	 * @param args
	 */
	public void GetConnection()
	{
		try
		{
				//String url = "jdbc:mysql://10.0.10.62/";
				
				//String url = "jdbc:mysql://192.168.2.55/";
				String url = "jdbc:mysql://103.241.181.36/";
				
		        String dbName = "db_gps";
		        String driver = "org.gjt.mm.mysql.Driver"; 
		        String userName = "diary"; 
		        String password = "d@1ry";
		        Class.forName(driver).newInstance();
	            conn = DriverManager.getConnection(url+dbName,userName,password);
	            st1=conn.createStatement();
	            st2=conn.createStatement();
	            st3=conn.createStatement();	
	            st4=conn.createStatement();
	            
	            st5=conn.createStatement();
	            
			System.out.println("In Open Connection");				
		}catch (Exception e) {
			System.out.print("GetConnection Exception ---->"+e);
			System.out.print("GetConnection Exception -@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&^&^&^&^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@@@@@@@@@@@@@@@@@2222--->"+e);
			//out.print("GetConnection Exception ---->"+e);
		}
	}
	
	
	
	public void UnzippcompressedFiles(String zipFile,String serviceProvider,String year,String month,String username) throws IOException, DataFormatException
	 {
		
		 try{
		GetConnection();
		String currentdatetime=new SimpleDateFormat("yyyy-MMM-ddHH:mm:ss").format(new java.util.Date());
		//File dir = new File("/home/javaprg/SimBillingFolder");
		 
		String   folder_name=serviceProvider+"_"+year+"_"+month+"_"+currentdatetime;
		 
		
		
		File dir = new File("/home/javaprg/ServiceProviderBilling3/"+folder_name);
		
		      
			//File dir = new File("/home/a_thakur/Desktop/SimBillingFolder/"+folder_name);
			if(dir.exists()) {
				
			}else{
				
				dir.mkdirs();
				
				dir.setWritable(true);
				dir.setExecutable(true);
			//	dir.setReadable(true);
				
				
//				/dir.set
				//dir.setExecutable(true, false);
				//file.setReadable(true, false);
				//file.setWritable(true, false);
				
			}
		 //File fl=new File("/home/a_thakur/Desktop/"+zipFile);
			
			//File folder = new File(zipFile); 
			
	//		String folderPath=folder.getAbsolutePath();
		//	String outputFolder = System.getProperty("user.home") + File.separator + "Desktop" + File.separator +zipFile;
			
			
			//System.out.println("outputFolder==>"+outputFolder);
			//System.out.println(">>>folderPath folderPath>>>>>>121212>>>>>> >>>"+folder.getCanonicalPath());
			//System.out.println(">>>folderPath folderPath>>>>>>@@@@>>>>>> >>>"+folder.getAbsolutePath());
		 
		 File fl=new File("/home/javaprg/ServiceProviderBilling3/"+zipFile);
		 
		 //File fl=new File(""+folderPath+"/"+zipFile);
		 
		 
		 //File fl=new File(outputFolder);
            
		 System.out.println(">Control after file statement");
		 
		 System.out.println(">>>Controln inside zip java code >>>"+fl);
		 File savefile=null;
		
		 //FileOutputStream fileOutputStream=null;
			
		 
		//  savefile = new File("/home/javaprg/ServiceProviderBilling3/"+folder);
		 
		        
		 
		 /*
		 try
						{
							fileOutputStream=new FileOutputStream(savefile);
							System.out.println ("File is been write to mention  location  ");
							
							
							
						}
							catch (FileNotFoundException e)
							{
									System.out.println ("File not found in the specified path*********************.");
									e.printStackTrace ();
							}
							
			*/				
							
							
//		 /OutputStream out = new FileO
		 
		// FileInputStream fin = new FileInputStream(fl);
		 
		 FileInputStream fin = new FileInputStream(fl);
		 
		 System.out.println(">>>>>>>33333<  got the file <<<<<<");
		 BufferedInputStream bin = new BufferedInputStream(fin);
		 ZipInputStream zin = new ZipInputStream(bin);
		 ZipEntry ze = null;
		 while ((ze = zin.getNextEntry()) != null) {
		     
			 
			 String zeName = ze.getName();
			  
			
			 System.out.println("==inside while =>"+zeName);
			 String fName = zeName.substring(zeName.lastIndexOf("/")+1);
			// System.out.println("Filename is "+fName);
			 OutputStream out = new FileOutputStream(dir+"/"+fName);
			 //if (ze.getName().equals("/home/a_thakur/Desktop/SimBillingFolder/Akshay")) {
		         byte[] buffer = new byte[8192];
		         
		         if(ze.isDirectory())
		            {
		                File f2 = new File("/home/javaprg/ServiceProviderBilling3/\\"+ze.getName());
		                
		                
		                //File f2 = new File("/home/a_thakur/Desktop/SimBillingFolder/\\"+ze.getName());
		                f2.mkdir();
		                System.out.println("Creating directory during unzip....."+ze.getName());
		            }else{
		         
		         
		         
		         int len;
		         while ((len = zin.read(buffer)) != -1) {
		        	 
		        	 
		        	 
		        	 
		             out.write(buffer, 0, len);
		         }
		         
		            }
		         out.close();
		        // break;
		    // }
		 }
		 
		 
		 
		 
		 
		 
		 
		 try{
			 
			String  sql1="Insert into db_gps.t_serviceproviderbillingDetails(Month,Year,ServiceProvider,EntBy,FilePath,status) values ('"+month+"','"+year+"','"+serviceProvider+"','"+username+"','"+dir+"','Pending')" ; 
			System.out.println("The string sql2 is b1111 before :"+sql1);
				 st1.executeUpdate(sql1);
				  System.out.println("The string sql1 is a2222 :"+sql1);
			 
		 }catch(Exception e33)
		 {
			 System.out.println(">>>exception****in inserting records  e34 >>>"+e33);  
			 
		 }
		 
		 
		 }catch(Exception e34)
		 {
			 System.out.println(">>>exception*************** e34 >>>"+e34); 
			 
		 }
		 
		 
		/* 
		 
		 ZipInputStream zis=null;
		    StringBuilder sb=null;
		    String source = "/home/a_thakur/Desktop/Akshay_zip_content.zip";
		    String destination = "/home/a_thakur/Desktop/SimBillingFolder/";
		    try {
		        zis = new ZipInputStream(new FileInputStream(fl));
		        
		        
		        
		        ZipEntry ze = zis.getNextEntry();

		        byte[] buffer = new byte[(int) ze.getSize()];

		        FileOutputStream fos = new FileOutputStream("/home/a_thakur/Desktop/SimBillingFolder/"+ze.getName());

		        int len;
		        while ((len=zis.read(buffer))>0)
		        {
		            fos.write(buffer);
		        }
		        fos.flush();
		        fos.close();

		    } catch (FileNotFoundException e) {
		        // TODO Auto-generated catch block
		       // e.printStackTrace();
		        System.out.println(">>>@@@@@@@@@@@@@@22>>>"+e); 
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        //e.printStackTrace();
		        
		        System.out.println(">>>@@@@@@@@@@@@@@33>>>"+e); 
		    } finally 
		    {
		        if (zis!=null) 
		        {
		            try { zis.close();
		            } catch (IOException e) {
		                e.printStackTrace();
		            }
		        }
		        
		    }
		*/
		    
		    /*
		    try{
		 FileInputStream fin=new FileInputStream(zipFile);
		 InflaterInputStream in=new InflaterInputStream(fin);

		 FileOutputStream fout=new FileOutputStream("ak.txt");
		 
		 int i;
		 while((i=in.read())!=-1){
		 fout.write((byte)i);
		 fout.flush();
		 }
		 
		 }catch(Exception e11)
		 {
			 System.out.println(">>>exception in unzippig >>>"+e11); 
			 
		 }
		
		
		*/
		 /*
		 String fname = "book1";
	        FileReader infile = new FileReader(zipFile);
	        BufferedReader in = new BufferedReader(infile);

	        FileOutputStream out = new FileOutputStream("book1out.dfl");
	        //BufferedInputStream in = new BufferedInputStream(new FileInputStream(filename));

	        Deflater compress = new Deflater();
	        Inflater decompress = new Inflater();

	        String readFile = in.readLine();
	        byte[] bx = readFile.getBytes();

	        while(readFile!=null){
	            byte[] input = readFile.getBytes();
	            byte[] compressedData = new byte[1024];
	            compress.setInput(input);
	            compress.finish();
	            int compressLength = compress.deflate(compressedData, 0, compressedData.length);
	            //System.out.println(compressedData);
	            out.write(compressedData, 0, compressLength);
	            readFile = in.readLine();
	        }

	        File abc = new File("book1out.dfl");
	        InputStream is = new FileInputStream("book1out.dfl");

	        InflaterInputStream infl = new InflaterInputStream(new FileInputStream("book1out.dfl"), new Inflater());
	        FileOutputStream outFile = new FileOutputStream("decompressed.txt");

	        byte[] b = new byte[1024];
	        while(true){

	            int a = infl.read(b,0,1024);
	            if(a==0)
	                break;

	            decompress.setInput(b);
	            byte[] fresult = new byte[1024];
	            //decompress.in
	            int resLength = decompress.inflate(fresult);
	            //outFile.write(b,0,1);
	            //String outt = new String(fresult, 0, resLength);
	            //System.out.println(outt);
	        }

	        System.out.println("complete");
		 
	 }
	 
	 */
	 }	 
}
