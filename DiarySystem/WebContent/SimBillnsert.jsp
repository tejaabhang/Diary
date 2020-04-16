<%@ page import="java.sql.*" %>
<%@page import="java.util.Date.*"%>
<%@ page import="java.util.List" %>
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
   <%@ page import="org.apache.poi.ss.usermodel.*" %> 
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
    <%@ page import="java.util.zip.*" %>
    <%@ page import="java.util.Enumeration" %>
     <%@ page import="java.util.zip.ZipEntry" %>
      <%@ page import="java.util.zip.ZipFile" %>
      
      
     
  
  
  	
   
<%@page import="beanpack.UnzippingBillingFilesNew"%>

<%@page import="java.text.Format"%>


<script type="text/javascript">
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
java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("dd-MMM-yyyy");
String sdt = fmt.format(td);
System.out.println("The todays date is :"+sdt);
int count1=0;

String month = request.getParameter("mnth");
String year = request.getParameter("yr");
String serviceProvider = request.getParameter("operator");
System.out.println(">>>>>month>>>>>>>>>>>>>>>"+month);
System.out.println(">>>>>>>>>year>>>>>>>>>>>"+year);
System.out.println(">>>>>>>>>serviceProvider>>>>"+serviceProvider);

String folder_name=sdt+"_"+serviceProvider+"_"+month+"_"+year;

String fname="",fname1="",fname2="",oladdfile="",oldobfile="",transporter="",dobfileup="",addfileup="",maridstatus="";
 String itemName="";
//File savedFile;
String zipfilename=request.getParameter("file");

System.out.println(">>>>>>>>>folder_name>>>>"+folder_name);
System.out.println(">>>>>>>>>zipfilename>>>>"+zipfilename);

String username=  session.getValue("username").toString();


boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
	System.out.println("\n\nin multipart..");
} 
else
{
	System.out.println("\n\n in else with  multipart..");
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = null;
	try {
		items = upload.parseRequest(request);
	} catch (FileUploadException e)
	{
		e.printStackTrace();
	}
	
	Iterator itr = items.iterator();

	while (itr.hasNext()) {
		
		System.out.println("control inside while loop===========");
		FileItem item = (FileItem) itr.next();
		if(item.isFormField()) 
		{
			String name = item.getFieldName();
			//System.out.print("\n name==>"+name);
			String value = item.getString();
			
							
			if(name.equals("mnth")) 
			{
				month = value;
				System.out.print("\n GPName==>"+month);
				count1 = 1;
			}
			

			if(name.equals("yr")) 
			{
				year = value;
				System.out.print("\n clenname==>"+year);
				count1 = 1;
			}
			
		
			
			
			if(name.equals("operator")) 
			{
				serviceProvider = value;
				System.out.print("\n clean==>"+serviceProvider);
				count1 = 1;
			}
			

			 
							
			
		}
	else {	
			try {

				 itemName = item.getName();
				System.out.print("\n\nitemName22<<<<<<<<==>"+itemName);
				if(itemName.equalsIgnoreCase(""))
				{
				}
				else
				{
					try{
				
						System.out.println("HHHHHH  ");
					//	savedFile = new File("/home/a_thakur/Desktop/Zoomala/"+""+""+itemName);

						 savedFile = new File("/home/javaprg/ServiceProviderBilling3/"+""+""+itemName);
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
						System.out.println("\n\nscreenshot----------->>>"+screenshot);
						
						
						zipfilename=itemName;	
						System.out.println("zipfilename-------!!!!!!!!!!---->>>"+zipfilename);
							
					
				}catch(Exception e)
				{
					e.printStackTrace();
				}
					}
					
				}
						
			 catch (Exception e) {
  					e.printStackTrace();
  				}
				}
		
	}
		
		
		
}

try{
 beanpack.UnzippingBillingFilesNew unzp= new beanpack.UnzippingBillingFilesNew();

unzp.UnzippcompressedFiles(zipfilename,serviceProvider,year,month,username);

}catch(Exception e33)
{
	System.out.println(">Exceptio=in callinf unzipping java code  ======>"+e33);
	
}



/*
try {
	
	System.out.println(">111>");
	
	 FileInputStream fis = new FileInputStream(zipfilename);
	 FileOutputStream fout=new FileOutputStream("");
	 
	 InflaterInputStream inf=new InflaterInputStream(fis);
	 
	 
	 
	 
     ZipInputStream zis = new ZipInputStream(new BufferedInputStream(fis));
     ZipEntry entry;
     File destFile;
     File destinationDir;
     final int BUFFER_SIZE = 1024;

	//  ZipFile zipFile = new ZipFile(zipfilename);
	while((entry = zis.getNextEntry()) != null) {               

            destFile = FilesystemUtils.combineFileNames(destinationDir, entry.getName());

            if (entry.isDirectory()) {
                destFile.mkdirs();
                continue;
            } else {
                int count;
                byte data[] = new byte[BUFFER_SIZE];

                destFile.getParentFile().mkdirs();

                FileOutputStream fos = new FileOutputStream(destFile);
                dest = new BufferedOutputStream(fos, BUFFER_SIZE);
                while ((count = zis.read(data, 0, BUFFER_SIZE)) != -1) {
                    dest.write(data, 0, count);
                }

                dest.flush();
                dest.close();
                fos.close();
            }
        }
        zis.close();
        fis.close();  
	System.out.println(">222>");
	Enumeration<?> enu = zipFile.entries();
	while (enu.hasMoreElements()) {
		ZipEntry zipEntry = (ZipEntry) enu.nextElement();

		String name = zipEntry.getName();
		long size = zipEntry.getSize();
		long compressedSize = zipEntry.getCompressedSize();
		System.out.printf("name: %-20s | size: %6d | compressed size: %6d\n", 
				name, size, compressedSize);

		File file = new File(name);
		if (name.endsWith("/")) {
			file.mkdirs();
			continue;
		}

		File parent = file.getParentFile();
		if (parent != null) {
			parent.mkdirs();
		}

		
		////reading the contetnt the of zip files 
		InputStream is = zipFile.getInputStream(zipEntry);
		
		
		String ak="akshay_files";
		File file_name = new File("/home/a_thakur/Desktop/SimBillingFolder/"+ak);
		
		
		System.out.println(">>>>>>>>>file_name>>>>"+file_name);
		////to write the 
		FileOutputStream fos = new FileOutputStream(file_name);
		byte[] bytes = new byte[1024];
		int length;
		while ((length = is.read(bytes)) >= 0) {
			
			
			fos.write(bytes, 0, length);
			
		}
		is.close();
		fos.close();

	}
	zipFile.close();
	
	

} catch (IOException e) {
	e.printStackTrace();
	System.out.println(">>>>>>>exception in unzipping  the zip file  >>>>"+e);
	
	
}
*/
/*
try{
	
	

	//		File dir = new File("/home/sumedh/Desktop/FtpFiles");
			//File dir = new File("/home/javaprg/SimBillingFolder");
			File dir = new File("/home/a_thakur/Desktop/SimBillingFolder/"+folder_name);
			if(dir.exists()) {
				
			}else{
				
				dir.mkdirs();
			}
			
	//		File file = new File("/home/sumedh/Desktop/FtpFiles/"+fname);
			//File file = new File("/home/javaprg/FtpFiles/"+folder_name);
			
			
		//	int count1 =dir.listFiles();
			
			File file = new File("/home/a_thakur/Desktop/SimBillingFolder/"+folder_name);
			
		
			file.createNewFile();
			FileWriter writer = new FileWriter(file);
        	//writer.write(msg);
       	 	writer.flush();
            writer.close();
			System.out.println("=====File Created=====");
		
		}catch (Exception e) {
			System.out.print("Exception ---->" + e);
		}


*/


   //=============================excel reading code========================

	   /*
	   try{	   
	   
	   
        		//get connection
        	 	Connection conne = null;
				 Statement st = null;
				 Statement st1 = null;
				
        		try {
						String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
						String MM_dbConn_USERNAME = "diary";
						String MM_dbConn_PASSWORD = "d@1ry";
						//String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/db_gps";
					//	String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/db_gps"; 
						String MM_dbConn_GPS = "jdbc:mysql://192.168.2.55/db_gps";
			
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
				//	String fname = "/home/sumedh/Desktop/Task_List/"+file1;
					String fname = "/usr/share/tomcat6/webapps/TaskList/"+file1;
					System.out.println("The filename is :"+file1);
					System.out.println("The filepath is :"+fname);
			        List sheetData = new ArrayList();			 
			        FileInputStream fis = null;
			       
			        
			        //show excel data=====
			        	System.out.println("The >>>>>>>>>>>>is :");
			        
			        int cnt=0;
       		// Iterates the data and print it out to the console.	
			      //  for (int i = 1; i < sheetData.size(); i++) {}//end of for loop of show excel data
				
				System.out.println("The total number of records in the excel sheet :"+cnt);
				
				//move the excel file in other folder
			//	File f = new File("/home/sumedh/Desktop/Task_List/"+file1);
				//File f = new File("/usr/share/tomcat6/webapps/TaskList/"+file1);
			//	if(f.renameTo(new File("/home/sumedh/Desktop/Moved_Files/" + file1)))
			//	{							
			//		System.out.println("File is moved successful!");
			//	}
				//if(f.renameTo(new File("/usr/share/tomcat6/webapps/TaskListDestination/" + file1)))
				//{							
				//	System.out.println("File is moved successful!");
				//}
  
        //=======================================================================   
       
}catch(Exception e){
	System.out.println("Th exception is >>>>>"+e);
	
}

*/
response.sendRedirect("ServiceProviderBillingUpload.jsp?msg=1");


%>

