import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellReference;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
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
import java.io.File;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.*;


public class Voda {
	
	
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
	static Statement st_update=null;
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
	
	
	static Statement st51=null;
	static Statement st52=null;
	static Statement st53=null;
	static Statement st54=null;
	static Statement st55=null;
	
	
	
	static	String filepath1="";
	public static Connection con=null;
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
	
	
	static String chkdate="";
	static String chktime="";
	static String type1="-",type2="-",type3="-",type4="-"; 
	
	
	static String [] array={"Address","Bill date",};
	
	int totalFolder=0;
	int totalFile=0;
	
	
    @SuppressWarnings("unchecked")
  public static void GetConnection() { 
			try {
				
				  System.out.println("\n\n in connection.METHODDDDDDD.----1111.db_gps");
				String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
			    String MM_dbConn_USERNAME = "fleetview";
			    String MM_dbConn_PASSWORD = "1@flv";
			    
			    
			   // String MM_dbConn_USERNAME = "java";
			   // String MM_dbConn_PASSWORD = "transjava!1";
			    
			    
			  // String MM_dbConn= "jdbc:mysql://103.241.181.36/airtelnew";
			    String MM_dbConn= "jdbc:mysql://192.168.2.55/airtelnewTest";
			    
			   //String MM_dbConn= "jdbc:mysql://202.65.131.44/airtelnew";
			    
			    //String MM_dbConn= "jdbc:mysql://103.241.181.36/db_gps";
			  
			    System.out.println("\n\n in connection.METHODDDDDDD.1111.");
			    Class.forName(MM_dbConn_DRIVER);
			    System.out.println("\n\n in connection.METHODDDDDDD.3333.");
			   // conn1 = DriverManager.getConnection(MM_dbConn,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
			   
			    
			    conn1 = DriverManager.getConnection("jdbc:mysql://192.168.2.55/airtelnewTest", "fleetview", "1@flv");
			    System.out.println("\n\n in connection.METHODDDDDDD.4444.*********");
			    st =  conn1.createStatement();
			    
			    
			    System.out.println("\n\n DONE with  connection..");
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
			    
			    
			    st51 =  conn1.createStatement();
			    st52 =  conn1.createStatement();
			    st53 =  conn1.createStatement();
			    st54 =  conn1.createStatement();
			    st55 =  conn1.createStatement();
			    st_update=conn1.createStatement();
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
    
    public static String GetFolderPath() throws SQLException 
	{
		 String currentdatetime=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		
		String filepath="-";
		
	//	String sql="SELECT filepath FROM db_gps.t_serviceproviderbillingDetails where serviceprovider='Vodafone' and status ='Pending' order by updateddatetime desc  ";
		
		//ResultSet rs=st1.executeQuery(sql);
		//System.out.println("sql====>"+sql);
		//if(rs.next()){
			//filepath=rs.getString("FilePath");
			
		//}
		
		filepath="/home/hduser/Documents/Billing_HandOverDoc/Vodafone/";
	//filepath="/home/a_thakur/Desktop/VODATEST/";
		
		System.out.println("filepath====>"+filepath);
		
		return filepath;
	}
    
    
    public static void readxlfile(String file,String filepath){
    	
    	//System.out.print("inside read x file method-------->"+file);
    	
    	System.out.print("inside rea dfilepath------->"+filepath);
    	System.out.print("inside read file------->"+file);
    	
    	 File f=null;
    	 //= new File("++"+file);
    	
    	 
    	 
    	 try{
    	  f=	new File(""+filepath+"/"+file);
    	
    	 }catch(Exception e44)
    	 {
    		 
    		 System.out.print("inside Exception in e44 of -readxlfile method------>"+e44); 
    		 
    	 }
    	//File f = new File("/home/a_thakur/Desktop/vodafone_Test/"+file);
    	
    	List sheetData = new ArrayList();
    	 
    	 
    	System.out.print("inside read x file method-***@@@@@@@******--->"+f);
         FileInputStream fis = null;
         FileOutputStream fileOut=null;
         try {
             //
             // Create a FileInputStream that will be use to read the
             // excel file.
             //
            
        	 try{
        	
        		 System.out.print("aaaa");
        		 fis = new FileInputStream(f);
        		 System.out.print("aaaa111");
             //
             // Create an excel workbook from the file system.
             //
             HSSFWorkbook workbook = new HSSFWorkbook(fis);
             System.out.print("aaaa222");
             //
             // Get the first sheet on the workbook.
             //
             HSSFSheet sheet = workbook.getSheetAt(0);
             
              fileOut = new FileOutputStream(f);
              
              workbook.write(fileOut);
              fileOut.close();
            
              System.out.print("aaaa333");
        	
             int rownr=0, colnr = 10;

          //   HSSFRow row = sheet.getRow(rownr);

             //HSSFCell cell = row.getCell(2);

             /**
             for(Row row1 : sheet) {
                 for(Cell cell : row1) {

                     while(cell.getCellType() == Cell.CELL_TYPE_STRING){

                         if(cell.getRichStringCellValue().getString () == cellContent);{

                                 rowNum = row1.getRowNum();
                                 return rowNum;  
                         }
                     }
                 }
             }               
            
             **/
             
             //
             // When we have a sheet object in hand we can iterator on
             // each sheet's rows and on each row's cells. We store the
             // data read on an ArrayList so that we can printed the
             // content of the excel to the console.
             //
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
             
             System.out.print("aaaa444");
             showExcelData(sheetData,file);
             System.out.print("aaaa55555");
        	 }catch(IOException e){
        		 
        		 throw new IllegalStateException(e.getMessage()); 
        		 
        	 }   
             
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
             if (fis != null) {
                // fis.close();
             }
         }
  
    }
     
    public static void main(String[] args) throws Exception { try { GetConnection();

    System.out.println("========$$$$$$$$$$$ =========");
    filepath1 = GetFolderPath();

    System.out.println("========filepath1 been returned =========" + filepath1);
  }
  catch (Exception e)
  {
    e.printStackTrace();
    System.out.println("\n\n Exception here.********************..");
  }

  try
  {
    if (!filepath1.equalsIgnoreCase("-"))
    {
      Date date = new Date();

      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat formatter1 = new SimpleDateFormat("hh:mm:ss");
      Calendar currentDate = Calendar.getInstance();
      chkdate = formatter.format(currentDate.getTime());
      chktime = formatter1.format(currentDate.getTime());
      System.out.println("\n\n  chkdate  here..." + chkdate);
      System.out.println("\n\n chktime  here..." + chktime);

      System.out.println(">>.11111111111");
      try
      {
        System.out.println(">>.33333333333==>" + filepath1);
        try
        {
          System.out.println(">>.HELLOOOOOOOOOOOOOOOOOOO");
          File f = new File(filepath1);

          System.out.println(">>.22222222222222" + f.isDirectory());

          File[] listOfFiles = f.listFiles();
          System.out.println(">>.33333333333");

          System.out.println(">>.length===>" + listOfFiles.length);

          for (int i = 0; i < listOfFiles.length; i++)
          {
            System.out.println(">>INSIDE FOR===>" + i);
            if (listOfFiles[i].isFile())
            {
              String files = listOfFiles[i].getName();
              System.out.println("file is 55555 :" + files);
              System.out.println("before readx file  ");
              readxlfile(files, filepath1);
              System.out.println("move successfully");
            }

          }

        }
        catch (Exception e)
        {
          System.out.println("Exception in LIST OF FILES**********" + e);
        }

      }
      catch (Exception e)
      {
        e.printStackTrace();
      }

      List sheetData = new ArrayList();

      String file = "";

      DeletingprocessedFolder(filepath1);
      CloseConnection();
    }
  }
  catch (Exception localException1)
  {
  }
}

private static void showExcelData(List sheetData, String file)
{
  System.out.println("========CONTROL: INSIDE =showExcelData==method======");

  String rw_dwnld = ""; String rw3 = ""; String rw31 = ""; String rw32 = ""; String rw33 = ""; String rw34 = ""; String rw35 = ""; String rw36 = ""; String rw37 = ""; String rw38 = ""; String rw_date = ""; String rw_dur = ""; String rw_amt = ""; String rw_dnld_amt = ""; String rw_dnld_dur = ""; String rw_dnld_date = ""; String rw_dnld_time = "";
  String[] token = (String[])null; String[] token1 = (String[])null; String[] token2 = (String[])null; String[] token3 = (String[])null; String[] token4 = (String[])null; String[] token5 = (String[])null; String[] token6 = (String[])null; String[] token7 = (String[])null; String[] token8 = (String[])null; String[] token9 = (String[])null; String[] token9_date = (String[])null; String[] token9_dur = (String[])null; String[] token9_amt = (String[])null; String[] token9_dwnld_date = (String[])null; String[] token9_dwnld_amt = (String[])null; String[] token9_dwnld_dur = (String[])null; String[] token9_dwnld = (String[])null; String[] token9_dwnld_time = (String[])null;

  String download_value = "-";
  String date = ""; String second = ""; String charge = ""; String number = "";
  double num = 0.0D;

  String frmdt = ""; String todate = "";

  rw_dwnld = "-";
  rw3 = "-";
  rw31 = "-";
  rw32 = "-";
  rw33 = "-";
  rw34 = "-";
  rw35 = "-";
  rw36 = "-";
  rw37 = "-";
  rw38 = "-";
  rw_date = "-";
  rw_dur = "-";
  rw_amt = "-";
  rw_dnld_amt = "-";
  rw_dnld_dur = "-";
  rw_dnld_date = "-";
  rw_dnld_time = "-";

  for (int i = 1; i < sheetData.size(); i++)
  {
    List list = (List)sheetData.get(i);
    for (int j = 0; j < list.size(); j++)
    {
      HSSFCell cell = (HSSFCell)list.get(j);

      DataFormatter df = new DataFormatter();

      if (cell.getCellType() == 0) {
        int i1 = (int)cell.getNumericCellValue();

        if (String.valueOf(i1) == "Address")
        {
          try
          {
            for (int i2 = 2; i2 < sheetData.size(); i2++)
            {
              for (int j1 = 0; j1 < list.size(); j1++)
              {
                HSSFCell localHSSFCell1 = (HSSFCell)list.get(j1);
              }

            }

          }
          catch (IndexOutOfBoundsException e111)
          {
            System.out.println("Exception=e111=>" + e111);
          }

        }

        if ((String.valueOf(i1) == "Outgoing calls") || (String.valueOf(i1).equalsIgnoreCase("Outgoing calls")))
        {
          int a = 54;
          try
          {
            for (int i2 = 24; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell localHSSFCell2 = (HSSFCell)list1.get(j1);
              }

            }

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException1)
          {
          }

          System.out.print(String.valueOf(i1));
        }

      }
      else
      {
        if (cell.toString().equals("Address"))
        {
          int a = 2;
          try
          {
            for (int i2 = 2; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw3 = rw3 + "&" + cell1.toString().trim();
              }

            }System.out.println("Address----->"+rw3);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException2)
          {
          }

        }

        if ((cell.toString().equals("Previous balance")) || (cell.toString().equalsIgnoreCase("Previous balance")))
        {
          int a = 4;
          try
          {
            for (int i2 = 4; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw31 = rw31 + "," + cell1.toString().trim();
              }

            }System.out.println("Previous b----->"+rw31);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException3)
          {
          }

        }

        if ((cell.toString().equals("A) One time charges")) || (cell.toString().equalsIgnoreCase("A) One time charges")))
        {
          int a = 6;
          try
          {
            for (int i2 = 6; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw32 = rw32 + "," + cell1.toString().trim();
              }

            }System.out.println("OTC----->"+rw32);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException4)
          {
          }

        }

        if ((cell.toString().equals("Account No")) || (cell.toString().equalsIgnoreCase("Account No")))
        {
          int a = 9;
          try
          {
            for (int i2 = 9; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw33 = rw33 + "," + cell1.toString().trim();
              }

            }System.out.println("AccNO----->"+rw33);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException5)
          {
          }

        }

        if ((cell.toString().equals("Monthly charges")) || (cell.toString().equalsIgnoreCase("Monthly charges")))
        {
          int a = 12;
          try
          {
            for (int i2 = 11; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw34 = rw34 + "," + cell1.toString().trim();
              }

            }System.out.println("MOc----->"+rw34);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException6)
          {
          }

        }

        if ((cell.toString().equals("Usage charges")) || (cell.toString().contains("Usage charges")))
        {
          int a = 16;
          try {
            for (int i2 = 15; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw35 = rw35 + "," + cell1.toString().trim();
              }

            }System.out.println("UsgCh----->"+rw35);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException7)
          {
          }

        }

        if ((cell.toString().equals("Payments updated upto")) || (cell.toString().contains("Payments updated upto")))
        {
          int a = 17;
          try
          {
            for (int i2 = 15; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                HSSFCell cell1 = (HSSFCell)list1.get(j1);

                rw37 = rw37 + "," + cell1.toString().trim();
              }

            }System.out.println("Payment----->"+rw37);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException8)
          {
          }

        }

        String tobebreaked = "-"; String tobebreaked1 = "-";
        HSSFCell cell1;
        if ((cell.toString().equals("Outgoing calls")) || (cell.toString().contains("Outgoing calls")))
        {
          int a = 54;

          System.out.println("check string ==>" + cell.toString());
          try
          {
            for (int i2 = 24; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              if (tobebreaked1.equalsIgnoreCase("yes"))
              {
                break;
              }

              if (tobebreaked.equalsIgnoreCase("yes"))
              {
                break;
              }

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                cell1 = (HSSFCell)list1.get(j1);

                if (cell1.toString().contains("Breakup of GPRS Events"))
                {
                  tobebreaked = "yes";

                  break;
                }

                if (cell1.toString().contains("Details of free usage"))
                {
                  tobebreaked1 = "yes";

                  break;
                }

                rw36 = rw36 + "," + cell1.toString().trim();

                cell1.toString().contains("Breakup of  VF Mobile Connect usage");
              }

            }System.out.println("VF----->"+rw36);

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException17)
          {
          }

        }

        if (rw36.contains("Outgoing calls,Date,Time,Number,Duration,Charges,Roaming partner"))
        {
          rw36 = rw36.replace("Outgoing calls,Date,Time,Number,Duration,Charges,Roaming partner", "");
        }

        if (rw36.contains("Total"))
        {
          rw36 = rw36.replace("Total", "");
        }

        if ((cell.toString().equals("Date & Time")) || (cell.toString().contains("Date & Time")))
        {
          int a = 54;
          try
          {
            for (int i2 = 8; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                cell1 = (HSSFCell)list1.get(j1);
              }

            }

          }
          catch (IndexOutOfBoundsException localIndexOutOfBoundsException18)
          {
          }

        }

        String tobebreaked2 = "-"; String tobebreaked22 = "-";

        String dwnld = "-";

        if ((cell.toString().equals("Downloads")) || (cell.toString().contains("Downloads")))
        {
          dwnld = "yes";
        }

        if ((cell.toString().equals("Downloads")) || (cell.toString().contains("Downloads")))
        {
          System.out.println("akshay--CONTROL INSIDE -Downloads ------------->>>>" + cell.getRowIndex());

          int a = 74;

          int ak = 1;
          download_value = "yes";
          try
          {
            for (int i2 = 45; i2 <= a; i2++)
            {
              List list1 = (List)sheetData.get(i2);

              if (tobebreaked2.equalsIgnoreCase("yes"))
              {
                break;
              }

              if (tobebreaked22.equalsIgnoreCase("yes"))
              {
                break;
              }

              for (int j1 = 0; j1 < list1.size(); j1++)
              {
                 cell1 = (HSSFCell)list1.get(j1);

                System.out.println("value of download loop  loop>>> " + cell1.toString());

                if (cell1.toString().contains("Breakup of GPRS Events"))
                {
                  tobebreaked2 = "yes";

                  break;
                }

                if (cell1.toString().contains("Details of free usage"))
                {
                  tobebreaked22 = "yes";

                  break;
                }

                if (!cell1.toString().matches(".*\\d.*"))
                {
                  cell1.setCellValue("");
                }

                rw_dwnld = rw_dwnld + "," + cell1.toString().trim();
              }

              ak++;
            }

          }
          catch (IndexOutOfBoundsException e100)
          {
            System.out.println("Exception=e100=>" + e100);
          }

        }

        if (rw_dwnld.contains("Total"))
        {
          rw_dwnld = rw_dwnld.replace("Total", "");
        }

        token = rw3.split("&");
        token1 = rw31.split(",");
        token2 = rw32.split(",");

        token3 = rw33.split(",");
        token4 = rw34.split(",");

        token5 = rw35.split(",");

        if (rw36.contains(",,"))
        {
          rw36 = rw36.replace(",,", ",");
        }

        if (rw36.contains("VF Mobile Connect"))
        {
          rw36 = rw36.replace("VF Mobile Connect", "");
        }

        token6 = rw36.split(",");
        token7 = rw37.split(",");

        if (token6.length < 20)
        {
          type1 = "yes";
        }

        rw36.contains("Date,Time,Number,Duration,Charges,Roaming partner");

        rw36.contains(rw36);

        token8 = date.split(",");
        token9 = second.split(",");

        if (rw_dwnld.contains("re.1_store"))
        {
          rw_dwnld = rw_dwnld.replace("re.1_store", "");
        }

        if (rw_dwnld.contains(",,"))
        {
          rw_dwnld = rw_dwnld.replace(",,", ",");
        }

        rw_dwnld.contains("re.1_store");

        token9_dwnld = rw_dwnld.split(",");

        for (int r = 0; r < token6.length; r++);
      }

      list.size();
    }

  }

  System.out.println("rw_amt===22==lt==>" + rw_amt);
  System.out.println("rw_dur===22==lt==>" + rw_dur);
  System.out.println("rw_date===22===lt=>" + rw_date);

  if (type1.equalsIgnoreCase("yes"))
  {
    for (int r = 1; r < token6.length; r += 3)
    {
      rw_date = rw_date + "," + token6[r].trim();
    }

    for (int r = 2; r < token6.length; r += 3)
    {
      rw_dur = rw_dur + "," + token6[r].trim();
    }

    System.out.println("rw_amt=======>" + rw_amt);
    for (int r = 3; r < token6.length; r += 3)
    {
      rw_amt = rw_amt + "," + token6[r].trim();
    }

  }
  else if (type1.equalsIgnoreCase(""))
  {
    for (int r = 1; r < token6.length; r += 4)
    {
      rw_date = rw_date + "," + token6[r].trim();
    }

    for (int r = 3; r < token6.length; r += 4)
    {
      rw_dur = rw_dur + "," + token6[r].trim();
    }

    for (int r = 4; r < token6.length; r += 4)
    {
      rw_amt = rw_amt + "," + token6[r].trim();
    }

  }
  else if (!type1.equalsIgnoreCase(""))
  {
    for (int r = 1; r < token6.length; r += 4)
    {
      rw_date = rw_date + "," + token6[r].trim();
    }

    for (int r = 3; r < token6.length; r += 4)
    {
      rw_dur = rw_dur + "," + token6[r].trim();
    }

    for (int r = 4; r < token6.length; r += 4)
    {
      rw_amt = rw_amt + "," + token6[r].trim();
    }

  }

  for (int r = 0; r < token2.length; r++);
  for (int r = 1; r < token9_dwnld.length; r += 4)
  {
    rw_dnld_date = rw_dnld_date + "," + token9_dwnld[r].trim();
  }

  for (int r = 3; r < token9_dwnld.length; r += 4)
  {
    rw_dnld_dur = rw_dnld_dur + "," + token9_dwnld[r].trim();
  }

  for (int r = 2; r < token9_dwnld.length; r += 4)
  {
    rw_dnld_time = rw_dnld_time + "," + token9_dwnld[r].trim();
  }

  for (int r = 4; r < token9_dwnld.length; r += 4)
  {
    rw_dnld_amt = rw_dnld_amt + "," + token9_dwnld[r].trim();
  }

  token9_dwnld_amt = rw_dnld_amt.split(",");
  token9_dwnld_date = rw_dnld_date.split(",");
  token9_dwnld_time = rw_dnld_time.split(",");
  token9_dwnld_dur = rw_dnld_dur.split(",");

  if (rw_date.contains("Outgoing calls,Number,Roaming partner"))
  {
    rw_date = rw_date.replace("Outgoing calls,Number,Roaming partner", "");
  }

  if (rw_dur.contains("Date,Duration"))
  {
    rw_dur = rw_dur.replace("Date,Duration", "");
  }

  if (rw_amt.contains("Time,Charges"))
  {
    rw_amt = rw_amt.replace("Time,Charges", "");
  }

  token9_date = rw_date.split(",");
  token9_dur = rw_dur.split(",");
  token9_amt = rw_amt.split(",");
  System.out.println("rw_amt=====lt==>" + rw_amt);

  if (rw_date.contains("Total"))
  {
    rw_date = rw_date.replace("Total", "");
  }

  for (int r = 1; r < token9_date.length; r++);
  for (int r = 1; r < token9_dur.length; r++)
  {
    rw_dur = rw_dur + "," + token6[r];
  }

  if (download_value.equalsIgnoreCase("yes"))
  {
    for (int r = 1; r < token9_dwnld_date.length; r++)
    {
      double q = 0.0D; double q1 = 0.0D;
      try
      {
        String sql_charge = "";
        try
        {
          sql_charge = " select * from   t_chargedetailsamt where   TMonth='" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "' and  MobNo='" + token[7] + "'  and  Amount='" + token9_dwnld_amt[r] + "'   and ttime='" + token9_dwnld_time[r] + "' and   filename='" + file + "'  and  Service_Provider='Vodafone'  and callType='Outgoing'  and  ItemType='VF Mobile Connect' ";

          ResultSet rst_new1 = st51.executeQuery(sql_charge);
          System.out.println("The sql_charge after:" + sql_charge);

          if (rst_new1.next())
          {
            System.out.println("The record is already been present in  t_chargedetailsamt table   ");
          }
          else {
            System.out.println("ELSE OF DOWNLOAD==========");
            try
            {
              System.out.println("download_value=====>:" + download_value);
              sql1 = "insert into t_chargedetailsamt (TMonth,TTime,MobNo,AccNo,BillNo,BillDate,TDate,Duration,Amount,TAmt,callType,ItemType,Service_Provider,filename) values ('" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "','" + token9_dwnld_time[r] + "','" + token[7] + "','" + token[6] + "' ,'" + token[4] + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2])) + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token9_dwnld_date[r])) + "','" + token9_dwnld_dur[r] + "','" + token9_dwnld_amt[r] + "','" + token9_dwnld_amt[r] + "','Outgoing','VF Mobile Connect','Vodafone','" + file + "') ";

              System.out.println("The string sql1 BEFORE  is a11111 :" + sql1);
              st1.executeUpdate(sql1);
              System.out.println("The string sql1 after  is a11111 :" + sql1);
            }
            catch (Exception e221)
            {
              System.out.println("exception in charge detail insert query:" + e221);
            }

          }

        }
        catch (Exception e51)
        {
          System.out.println("The Exception in t_chargedetailsamt query  :" + e51);
        }

      }
      catch (Exception localException1)
      {
      }

    }

  }
  else
  {
    System.out.println("ELSE LOOOOPPPPPPPPPPPPP  :");
    for (int r = 1; r < token9_amt.length; r++)
    {
      System.out.println("Control token9_amt.length>>>" + token9_amt.length);

      double q = 0.0D; double q1 = 0.0D;

      System.out.println("The string sql1 BEFORE  is a11111 :" + token9_amt[r]);
      try
      {
        String sql_charge = "";
        if (!token9_amt[r].equalsIgnoreCase("0.0"))
        {
          try
          {
            System.out.println("token[2]-----:" + token[2]);
            System.out.println("value of coout r--:" + r);

            sql_charge = " select * from   t_chargedetailsamt where   TMonth='" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "' and  MobNo='" + token[7] + "'  and  Duration='" + token9_dur[r] + "' and   filename='" + file + "'  and  Service_Provider='Vodafone'  and callType='Outgoing'  and  ItemType='VF Mobile Connect' ";

            System.out.println("The sql_charge before:" + sql_charge);
            ResultSet rst_new1 = st51.executeQuery(sql_charge);
            System.out.println("The sql_charge after@@@@@@@@:" + sql_charge);

            if (rst_new1.next())
            {
              System.out.println("The record is already been present in  t_chargedetailsamt table   ");
            }
            else
            {
              try
              {
                System.out.println("download_value=====>:" + download_value);

                sql1 = "insert into t_chargedetailsamt (TMonth,MobNo,AccNo,BillNo,BillDate,TDate,Duration,Amount,TAmt,callType,ItemType,Service_Provider,filename) values ('" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "','" + token[7] + "','" + token[6] + "' ,'" + token[4] + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2])) + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token9_date[r])) + "','" + token9_dur[r] + "','" + token9_amt[r] + "','" + token9_amt[r] + "','Outgoing','VF Mobile Connect','Vodafone','" + file + "') ";
              }
              catch (Exception e221)
              {
                System.out.println("exception in charge detail insert query:" + e221);
              }

              System.out.println("The string sql1 BEFORE  is a11111 :" + sql1);
              st1.executeUpdate(sql1);
              System.out.println("The string sql1  else loop after  is a11111 :" + sql1);
            }

          }
          catch (Exception e51)
          {
            System.out.println("The Exception in t_chargedetailsamt query  :" + e51);
          }

        }

      }
      catch (Exception e32)
      {
        System.out.println("Exception in chargedetail query e32  :" + e32);
      }

    }

  }

  System.out.println("rw3 >>>" + rw3);
  try {
    frmdt = token[3].substring(0, 10);
    todate = token[3].substring(14, token[3].length());
  }
  catch (IndexOutOfBoundsException e24) {
    System.out.println("UP TO HERE e24==> >>>" + e24);
  }

  System.out.println("frmdt >>>" + frmdt);
  System.out.println("todate >>>" + todate);
  System.out.println("token6[1]  length>>>" + token6.length);
  try
  {
    for (int r = 5; r < token6.length; r += 6)
    {
      if ((token6[r] != "0.0") && (!token6[r].equalsIgnoreCase("0.0")))
      {
        try
        {
          date = date + "," + token6[(r - 4)];

          second = second + "," + token6[(r - 1)];

          charge = charge + "," + token6[r];
        }
        catch (IndexOutOfBoundsException localIndexOutOfBoundsException11)
        {
        }

        DecimalFormat df = new DecimalFormat("#.00000000");

        double q = 0.0D; double q1 = 0.0D;
        try
        {
          q = Double.parseDouble(token6[(r - 1)]);

          q1 = Double.parseDouble(token6[(r - 2)]);

          q *= 1000.0D;
        }
        catch (NumberFormatException localNumberFormatException)
        {
        }

      }

    }

  }
  catch (IndexOutOfBoundsException localIndexOutOfBoundsException12)
  {
  }

  try
  {
    String sql_new2 = " select * from t_billdetails  where BillMonth='" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "'  and AccNo='" + token[6] + "' and BillNo='" + token[4] + "' and BillDate='" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2])) + "'  and FileName='" + file + "' and Plan='RedSox'  and Service_provider='Vodafone'    ";

    ResultSet rst_new2 = st52.executeQuery(sql_new2);
    System.out.println("The sql_new2  after :" + sql_new2);
    if (rst_new2.next())
    {
      System.out.println("The record is already present in t_billdetails table   :");
    }
    else
    {
      sql = "insert into t_billdetails (BillMonth,AccNo,BillNo,BillDate,BillPeriod,FileName,BillPeriodFrom,BillPeriodTo,Plan,Service_provider) values ('" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "','" + token[6] + "','" + token[4] + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2])) + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(token[2])) + "','" + file + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(frmdt)) + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(todate)) + "','RedSox','Vodafone') ";

      st2.executeUpdate(sql);
      System.out.println("The string t_billdetails :" + sql);
    }

  }
  catch (IndexOutOfBoundsException localIndexOutOfBoundsException13)
  {
  }
  catch (Exception localException2)
  {
  }

  try
  {
    if ((token5[5].equalsIgnoreCase("0.0")) || (token5[5].equalsIgnoreCase("0.00")))
    {
      token5[5] = token5[5];
    }
    else
    {
      token5[5] = "0";
    }

  }
  catch (IndexOutOfBoundsException localIndexOutOfBoundsException14)
  {
  }

  try
  {
    try
    {
      String sql_new3 = " select * from t_subsummarydet where  TMonth='" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "'  and Mobno='" + token[7] + "' and  AccNo='" + token[6] + "'  and Service_Provider='Vodafone' and fname='" + file + "'  ";

      ResultSet rst_new4 = st54.executeQuery(sql_new3);
      System.out.println("The sql_new3 after :" + sql_new3);
      System.out.println("Ttoken[2]===########=>" + token[2]);

      if (!rst_new4.next())
      {
        System.out.println("Ttoken[2]===$$$$=>" + token[2]);

        sql1 = "insert into t_subsummarydet (TMonth,DateTime1,Mobno,AccNo,OneTimeCharge,MonthlyCharge,RoamingCharge,Discounts,Tax,Total,UsageCharge,MessagingCharges,MiscCharge,SubTotal,Service_Provider,fname) values ('" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/dd/yyyy").parse(token[2])) + "','" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(frmdt)) + " 00:00:00','" + token[7] + "','" + token[6] + "' ,'" + token2[1] + "','" + token2[2] + "','" + token2[5] + "','" + token2[6] + "','" + token2[9] + "','" + token2[10] + "','" + token2[3] + "','" + token2[4] + "','" + token2[7] + "','" + token2[8] + "','Vodafone','" + file + "') ";

        st3.executeUpdate(sql1);
        System.out.println("The string sql1 is a11111 :" + sql1);
      }
    }
    catch (IndexOutOfBoundsException localIndexOutOfBoundsException15)
    {
    }
  }
  catch (IndexOutOfBoundsException localIndexOutOfBoundsException16)
  {
  }
  catch (Exception localException3)
  {
  }
}

public static void DeletingprocessedFolder(String filepath)
  throws SQLException, ParseException
{
  try
  {
    System.out.println("token3[5]  filepath-------inside DeletingprocessedFolder method------->>>" + filepath);
    File file = new File(filepath);

    if (file.isDirectory())
    {
      File[] files = file.listFiles();

      for (int i = 0; i < files.length; i++);
    }

  }
  catch (Exception localException1)
  {
  }

  try
  {
    Class.forName("org.gjt.mm.mysql.Driver");

    con = DriverManager.getConnection("jdbc:mysql://192.168.2.55/db_gps", "fleetview", "1@flv");

    st = con.createStatement();
    st1 = con.createStatement();
    st4 = con.createStatement();

    st_update = con.createStatement();
  }
  catch (Exception e22)
  {
    e22.printStackTrace();
    System.out.println("Exception in updxate ======>" + e22);
  }

  String sql11;
  try
  {
    sql11 = "Update  db_gps.t_serviceproviderbillingDetails  set status ='Deleted'  where filepath='" + filepath1 + "' and ServiceProvider='Vodafone' ";
  }
  catch (Exception localException2)
  {
  }
}
}