<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1;
%>

<%
try {
	//System.out.println(">>>>");
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
Statement stmt2=con1.createStatement();
String Buffer="",Buffer1="";
ResultSet rs1=null, rs2=null;
String sql1="", sql2="",transporter="",vehiclecode="",instn="",VehicleregNo="-";
String ownername=request.getParameter("transporter");
String gpname=request.getParameter("gpname");

String reqtype=request.getParameter("type");
System.out.println(">gpname>>>>"+gpname);



System.out.println(">reqtype>>>>"+reqtype);

String newstring = "";
String cntcprsn="-";
//System.out.println(">>>>>"+ownername);
int Userlimit=0,Unitlimit=0;
int i=1;
boolean flag = false;
//String originalcompany=request.getParameter("gpname");


//String company = request.getParameter("gpname").replaceAll(" ","");
String company = request.getParameter("gpname").replaceAll(" ","");
company=company.replace(".","");
company=company.replace(" ","");
company=company.replace("-","");
company=company.replace("_","");
System.out.println("*&&&&&&&&&&&******&&&&&&&&&&&&*  "+company);
String sql="";
String A = request.getParameter("limitcount");
int limitcnt = 0,count=0,flg=1;
limitcnt = Integer.parseInt(A);
System.out.println("?????????LimitCount"+limitcnt);


if(reqtype.equalsIgnoreCase("group"))
{

	 
	String tran="gpname";
	
	int j = 1;
	  String buf = "<div id='companyinfoid' style='height:100%;width:100%;overflow:auto; align:right;'><table align = 'left' >";
	  
	  if(limitcnt==0)
	  {
		   sql = "select distinct(gpname) as VehicleRegNumber ,Replace(Replace(Replace(Replace( Replace( Replace( GPName,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')AS com,GPName as a from db_gps.t_group  where Replace(Replace(Replace(Replace(Replace(Replace( Replace( Replace( GPName,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_',''),'(',''),')','') like ('%"+company+"%') order by gpname";
		   flg=0;
	  }
	  else
	  {
		   //sql2 = "SELECT CustomerCode,SalesCustomerCode,Replace( Replace( Replace( CompanyName,'.', '') ,' ','') ,'-','') AS com,CompanyName as a from t_prospectivecustmaster where Replace( Replace( Replace( CompanyName, '.', '') , ' ', '') , '-', '') like ('"+company+"%') and IsDataValid='1'  order by CompanyName limit 0,"+limitcnt+"";
		  sql = " select distinct(gpname) as VehicleRegNumber ,Replace(Replace(Replace(Replace( Replace( Replace( GPName,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')AS com,GPName as a from db_gps.t_group  where Replace(Replace(Replace(Replace(Replace(Replace( Replace( Replace( GPName,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_',''),'(',''),')','') like ('%"+company+"%') order by gpname limit 0,"+limitcnt+"";
		  
	  }
	  	 ResultSet rs = stmt2.executeQuery(sql);
	  if (rs.last()) {
		  count = rs.getRow();
		  rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
		}
	  System.out.println("The Query ===>"+sql);
	  System.out.println("cntt===>"+count);
	  
	  if (!rs.next()) {
		    System.out.println("No records found");
		    buf +="<tr><td align='left'><h4><a href='#' >No Records found</a></h4></td></tr>";
		    rs.beforeFirst();
		} else {
			//rs.first();
			System.out.println("limitcnt    "+limitcnt+"row count==>"+count+"flg val"+flg);
			  
			   if( count >= limitcnt && flg==1)
			  { 
			   	   buf +="<tr ><td ></td><td align='left'><a href='#' onclick='getGroupName(2,\""+tran+"\");' >more..</a></td></tr>";
			  }
			   else 
			  {  
			   	 // buf +="<tr><td></td></tr>";
			  }
			  
			   //rs.beforeFirst();
			  do {
		    	
		        // Get data from the current row and use it
		    	newstring = rs.getString("com");
				  String b = rs.getString("a");
				  String type = (rs.getString("VehicleRegNumber") == null || rs.getString("VehicleRegNumber").equalsIgnoreCase("") ) ? "-" : rs.getString("VehicleRegNumber");
				  
				  String custcode = "";
// 				  if(type.equals("0") || type == "0")
// 				  {
// 					  type = "Prospect";
// 					  custcode = rs.getString("CustomerCode");
// 				  }
// 				  else	
// 				  {
// 					   type = "Customer";
// 					   custcode = rs.getString("SalesCustomerCode");
// 				  }
				  
				  
				  	System.out.println("Company Name ===>"+b+ "company-->"+company);
				  	
				  	

						//System.out.println("originalcompany==11>"+originalcompany);
						System.out.println("str==11>"+company);
						System.out.println("b=====11>"+b);
						//System.out.println("b=====11>"+);
						
						
						buf += "<tr><td align = 'left'><a href='#' onClick='getSelectedGpaname(\""+rs.getString("a")+"\",\""+tran+"\");'  style='color: black;'>"+rs.getString("a").replaceAll("(?i)"+company,"<font color=blue size='2'><u>"+company.toUpperCase()+"</u></font>")+".</a></td></tr>";
						
					
				 j++; 
		    }while (rs.next());
			  buf+="<tr><td><input type='hidden'  name='element'  id='element'  value='"+limitcnt+"'/></td></tr>";
		}
	  buf += "</table></div>";
	  out.println(buf);
	  //System.out.println(">>>>>>>>>>>>>>>>>"+buf);
	   
	  buf = null;
	  
}else{
	
	 System.out.println(">>>>>>>>ELSEEEEEEEEEEEEEEEEEEEEEEEEEEE>>>>>>>>>");
		String tran="transporter";
	  int j = 1;
	  String buf = "<div id='companyinfoid' style='height:100%;width:100%;overflow:auto; align:right;'><table align = 'left' >";
	  
	  if(limitcnt==0)
	  {
		   sql = "select  Distinct(TypeValue)  as VehicleRegNumber ,Replace(Replace(Replace(Replace( Replace( Replace( TypeValue,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')AS com,TypeValue as a from db_gps.t_transporter  where Replace(Replace(Replace(Replace(Replace(Replace( Replace( Replace( TypeValue,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_',''),'(',''),')','') like ('%"+company+"%') order by TypeValue";
		   flg=0;
	  }
	  else
	  {
		   //sql2 = "SELECT CustomerCode,SalesCustomerCode,Replace( Replace( Replace( CompanyName,'.', '') ,' ','') ,'-','') AS com,CompanyName as a from t_prospectivecustmaster where Replace( Replace( Replace( CompanyName, '.', '') , ' ', '') , '-', '') like ('"+company+"%') and IsDataValid='1'  order by CompanyName limit 0,"+limitcnt+"";
		  sql = " select distinct(TypeValue) as VehicleRegNumber ,Replace(Replace(Replace(Replace( Replace( Replace( TypeValue,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_','')AS com,TypeValue as a from db_gps.t_transporter  where Replace(Replace(Replace(Replace(Replace(Replace( Replace( Replace( TypeValue,'.', '') ,' ','') ,'-',''),',',''),'?',''),'_',''),'(',''),')','') like ('%"+company+"%') order by TypeValue limit 0,"+limitcnt+"";
		  
	  }
	  	 ResultSet rs = stmt2.executeQuery(sql);
	  if (rs.last()) {
		  count = rs.getRow();
		  rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
		}
	  System.out.println("The Query ===>"+sql);
	  System.out.println("cntt===>"+count);
	  
	  if (!rs.next()) {
		    System.out.println("No records found");
		    buf +="<tr><td align='left'><h4><a href='#' >No Records found</a></h4></td></tr>";
		    rs.beforeFirst();
		} else {
			//rs.first();
			System.out.println("limitcnt    "+limitcnt+"row count==>"+count+"flg val"+flg);
			  
			   if( count >= limitcnt && flg==1)
			  { 
			   	   buf +="<tr ><td ></td><td align='left'><a href='#' onclick='getGroupName(2,\""+tran+"\");' >more..</a></td></tr>";
			  }
			   else 
			  {  
			   	 // buf +="<tr><td></td></tr>";
			  }
			  
			   //rs.beforeFirst();
			  do {
		    	
		        // Get data from the current row and use it
		    	newstring = rs.getString("com");
				  String b = rs.getString("a");
				  String type = (rs.getString("VehicleRegNumber") == null || rs.getString("VehicleRegNumber").equalsIgnoreCase("") ) ? "-" : rs.getString("VehicleRegNumber");
				  
				  String custcode = "";
//				  if(type.equals("0") || type == "0")
//				  {
//					  type = "Prospect";
//					  custcode = rs.getString("CustomerCode");
//				  }
//				  else	
//				  {
//					   type = "Customer";
//					   custcode = rs.getString("SalesCustomerCode");
//				  }
				  
				  
				  	System.out.println("Company Name ===>"+b+ "company-->"+company);
				  	
				  	

						//System.out.println("originalcompany==11>"+originalcompany);
						System.out.println("str==11>"+company);
						System.out.println("b=====11>"+b);
						//System.out.println("b=====11>"+);
					
						
						buf += "<tr><td align = 'left'><a href='#' onClick='getSelectedGpaname(\""+rs.getString("a")+"\",\""+tran+"\");'  style='color: black;'>"+rs.getString("a").replaceAll("(?i)"+company,"<font color=blue><u>"+company.toUpperCase()+"</u></font>")+".</a></td></tr>";
						
					
				 j++; 
		    }while (rs.next());
			  buf+="<tr><td><input type='hidden'  name='element'  id='element'  value='"+limitcnt+"'/></td></tr>";
		}
	  buf += "</table></div>";
	  out.println(buf);
	  //System.out.println(">>>>>>>>>>>>>>>>>"+buf);
	   
	  buf = null;
	  

	
	
	
}
	  
 
 

////System.out.println(Buffer+"#"+Buffer1);
} catch(Exception e) {
System.out.println(">>>>>>>>excpetion>>>>>>>>>"+e);
	
	//out.print("<div style='height:110px;width:300px;overflow:auto; align:left;'><table style='display: block';><tr><td>Exception</td></tr></table></div>");
  out.print("<div style='height:110px;width:300px;overflow:auto; align:left;'><table style='display: block';></table></div>");
}

finally
{
con1.close();
}

%>
