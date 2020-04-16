<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%! 
Connection con1, con2;
Statement stmt1, stmt2,stmtinsert;
%>

<!--- code start here ------>
<%
try
{	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		
	stmt1=con1.createStatement();
	stmt2=con1.createStatement();
	stmtinsert=con2.createStatement();
	ResultSet rs1=null, rs2=null, rs4=null;
	String sql1="", sql2="", sql3="", sql4="",sql5="",sql6="";
	String permtemp="", rep="", tilldate="",transporter ="",today="";
	
	String cntr="", flag="true";
	int cntrint=0, cntrint1=0, chkdcntr1=0, chkdcntr=0;

	cntr=request.getParameter("cntr");
	cntrint=Integer.parseInt(cntr);
	cntrint1=cntrint-1;

	java.util.Date defoultdate = new java.util.Date();
	Format formatter = new SimpleDateFormat("yyyy-MM-dd");
	today = formatter.format(defoultdate);
	
	permtemp=request.getParameter("permtemp");
	System.out.println(">>>>>>permtemp>>>>>>>@@@@@"+permtemp);
	rep=request.getParameter("reps"); 
	tilldate=request.getParameter("calender");

		
/* ********Checking how many check-boxes were checked. Taking count of that*********** */

String[] uncntchk = new String[cntrint];
  for(int k=0; k<cntrint; k++) 
{
   uncntchk[k] = request.getParameter("dis"+k );

   if(uncntchk[k]==null)
   {
     
   }
   else
   {
        chkdcntr1++;
	flag="false";
   }
}

//remunits=cntrint1-chkdcntr1;

/* ******************************************************************************************** */

/* *********if no check box was selected, then page will be re-directed to previous form, else it will be upated in DB************ */
if(flag.equals("true"))
 {
   response.sendRedirect("assigntrans.jsp?nounitselected=true");
   return;
 }
 else
 {
	String[] x = new String[cntrint];
	String[] cust= new String[cntrint];

	for(int i=0; i<cntrint; i++) 
        {
                x[i] = request.getParameter("dis"+i );

    		 if(x[i]==null || x[i].equals("null") )
                {
      
                }
                else
                {
			chkdcntr++;
			cust[i]=request.getParameter("cust"+i);
			
			if(permtemp.equalsIgnoreCase("Perm") )
			{
		   		int p= 0;
		   		System.out.println(">>>>>>cust[i]>>>>"+cust[i]);
				sql5 = "select transporter from t_asgndtranstoreps where Transporter='"+cust[i]+"'   ";
				ResultSet rst=stmt2.executeQuery(sql5);
				//System.out.println(">>>>>>sql 5>> for perm>>"+sql5);
				if(rst.next())
				{
					
					transporter =rst.getString("Transporter");
					
				
				//System.out.println(">>>>>>transporter>>"+transporter);
				
				
					sql3="update t_asgndtranstoreps set Representative='"+rep+"', PermRep='-'  where Transporter='"+cust[i]+"' ";
				   	//Query for t_sqlquery
			   			String abcd=sql3.replace("'","#");	
			   			abcd=abcd.replace(",","$");								
			   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd+"')");
				   		
				   		stmt1.executeUpdate(sql3);
				   		//System.out.println(">>>>>>sql 3>> for of if perm>>"+sql3);
					
				}else{
					int a =0;
					
					sql6="insert into  t_asgndtranstoreps (Transporter , Representative, PermRep ,  GPName ) values ('"+cust[i]+"' ,'"+rep+"' ,'-' ,'-')  ";	
					//System.out.println(">>>>>sql 6>>>>"+sql6);
     				stmt2.executeUpdate(sql6);
					a++;
					
					
					
					
					
				
				
				
		   		//System.out.println(">>>>>>sql 3>> for of else  perm>>"+sql3);
				}	
		   		
			}
			else
			{
				
				System.out.println(">>>>>>ELSE OF TEMP>>");
				int p= 0;
		   		
				sql5 = "select transporter from t_asgndtranstoreps where Transporter='"+cust[i]+"'   ";
				ResultSet rst=stmt2.executeQuery(sql5);
				System.out.println(">>>>>>sql 5>> for temp>>"+sql5);
				if(rst.next())
				{
					
					transporter =rst.getString("Transporter");
					
				
				//System.out.println(">>>>>>transporter >>temp>>"+transporter);
				String oldrep="";
				
				sql4="select * from t_asgndtranstoreps where Transporter='"+cust[i]+"' ";
				rs4=stmt1.executeQuery(sql4);
				//System.out.println(">>>>>>sql 4>> for temp>>"+sql4);
				if(rs4.next())
				{
					oldrep=rs4.getString("Representative");
				}
				
				sql3="update t_asgndtranstoreps set Representative='"+rep+"', PermRep='"+oldrep+"', TillDate='"+tilldate+"' where Transporter='"+cust[i]+"' ";				
				//Query for t_sqlquery
	   			String abcd1=sql3.replace("'","#");	
	   			abcd1=abcd1.replace(",","$");								
	   			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");
				stmt1.executeUpdate(sql3);
				
				//System.out.println(">>>>>>sql 3>> for if temp>>"+sql3);
				
				
				
				
					
					
					
				}else{
					
					int a =0;
					
							
					sql6="insert into  t_asgndtranstoreps (Transporter , Representative, PermRep , TillDate , GPName ) values ('"+cust[i]+"' ,'"+rep+"' ,'-' ,'"+tilldate+"' , '-')  ";	
					
     				stmt2.executeUpdate(sql6);
     				//System.out.println(">>>>>sql temp  else 6>>>>"+sql6);
					a++;
					
					
					
				}
											
		   					
				
				
				//System.out.println(">>>>>>sql 3>> for temp>>"+sql3);
			}	
		}
	}	
 }
System.out.println(">>>>>>permtemp>>>>>>>@@@@@"+permtemp);
con1.close();


response.sendRedirect("assigntrans.jsp?received=yes");
return;

}
catch(Exception e)
{
	out.print("Exception --->"+e);
	System.out.println("Exception >>>>>>--->"+e);
}
finally
{
	
	
}
%>
