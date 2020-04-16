<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict/aaa/EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());
String filename= showdatex+"Complaint_Report.xls";
response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>	

<%

Connection conn,conn1;
Statement st=null,st1=null,st2=null,st3=null,st4=null,stQuickTest=null,stQuickTest1=null;
String data,data1;
String sql="",sql1,sql2,sql3,sql4;
String    fromdate="";
String complaintid=request.getParameter("complaintid");
System.out.println("Complaint ID frem request"+complaintid);
String inputtype=request.getParameter("dataFilter");
data1=request.getParameter("data");
fromdate=request.getParameter("calender");
String todate=request.getParameter("calender1");
String dept=request.getParameter("dept");
System.out.println("dept request"+dept);
String dept1= "('"+dept+"')";
if(dept.equals("All")){
	dept1="('MD','Sales','Service','Accounts','Devlopement','RnD','Software','Legal','HR','Testing','Development','Repair','Admin','-')";
}

String  staus=request.getParameter("Status");
String staus1= "('"+staus+"')";
if(staus.equals("All")){
	staus1="('Open','Pending','Responded','Attended','Queued','Escalated','Solved','Closed')";
}
String chkbx=request.getParameter("checkbox");
String  web=request.getParameter("website");
String web1= "('"+web+"')";
if(web.equals("All")){
	web1= "('FleetView','ERP','Global ERP','Transworld','Safe And Secure','Diary')";
}

String owner=request.getParameter("owner");
String  exportFileName="FV_ComplaintsReport.xls";
String chbxAll="",abc="";
abc=request.getParameter("abc");

chbxAll=request.getParameter("checkbox"); 

System.out.println("chbxAll>>>>4444444>>>>"+chbxAll);
try{
	Class.forName("org.gjt.mm.mysql.Driver");
	conn= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","diary","d@1ry");
	//conn= DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_gps","fleetview","d@1ry");
	st=conn.createStatement();
	st1=conn.createStatement();
    st2=conn.createStatement();
    st3=conn.createStatement();
    st4=conn.createStatement();
    stQuickTest=conn.createStatement();
    stQuickTest1=conn.createStatement();

    java.util.Date td =new java.util.Date();
    Format fmt = new SimpleDateFormat("dd-MM-yyyy");
    Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
    Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
    String sdt = fmt.format(td);
    
   
    System.out.println("----------------------------------------------------------------------???<_>"+inputtype);
   
    
    java.util.Date dte = new java.util.Date();
    Format formatter = new SimpleDateFormat("dd-MM-yyyy");
	String today=formatter.format(dte);
    
    
	
      
        
    
     // fromdate=fromdate.parse(new SimpleDateFormat("yyyy-MM-dd"));
   // todate= fmt2.format(todate);
    
  System.out.println("Staus>>>>"+staus);
	System.out.println("todate>>>>"+todate);
    if(inputtype==null){
    	
    }
	
	
    
    System.out.println("Connection Created");
    System.out.println("staus>>>> "+staus);
    String status="all";
    String status1="all";
    String status2="";
    
	String dataDate1="",dataDate2="";
	System.out.println(">>>>>today>>>>>"+today);
	
	System.out.println("fromdate>>>>1233333"+fromdate);
	System.out.println("abc>>>>1233333"+abc);
	//String fromdate1=formatter.format(fromdate);
	//String todate1=formatter.format(todate);
	
	  
	 System.out.println("chbxAll>>>>4444444>>>>"+chbxAll);
	 try{
	 System.out.println(null==abc);
	  
	//  System.out.println(chbxAll=="yes" || chbxAll.equalsIgnoreCase("yes") );
	  
 if(null==abc || abc.equalsIgnoreCase("null") ){
	 System.out.println("<<<if loop1111>>>>");
	// chbxAll="akshay";
	 
 }
    if(chbxAll==null){
    	 System.out.println("<<<null  loop>>>>");
    	 
    }else if(chbxAll=="yes" || chbxAll.equalsIgnoreCase("yes")){
	 System.out.println("<<<else if loop>>>>"+chbxAll);
	 chbxAll="yes";
 }else{
	
	 System.out.println("<<<else  loop>>>>"+chbxAll);
	// chbxAll=null;
 }
	 }catch(Exception e){
		 e.printStackTrace();
	 }
 
	
 System.out.println("chbxAll>>>>1233333"+chbxAll);
	 if((fromdate!=null || todate!=null ) && !(fromdate.equalsIgnoreCase("null"))){
		System.out.println("inside date parse11>>>>>>");
	
			
			System.out.println("inside date parse>>>>>>");
			fromdate=fromdate.trim();
		    todate=todate.trim();
			System.out.println("fromdate>>>>"+fromdate);
		    System.out.println("todate>>>>"+todate);
		DateFormat df123= new SimpleDateFormat("dd-MM-yyyy");
		DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
		dataDate1=df1234.format(df123.parse(fromdate));
		 dataDate2=df1234.format(df123.parse(todate));
		 
		 
		 
		 System.out.println("before parsing the date :- "+dataDate1);
		 
		 
		 //dataDate1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(dataDate1));
		
		 System.out.println("After parsing the date :- "+dataDate1);	
		 
		 //SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
	   // SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yy");
	   // Date date1 = format1.parse("05/01/1999");
	   // System.out.println(format2.format(date));

		
		//java.util.Date dt=new java.util.Date();
		//SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		//String  formattedDate = formatter1.format("fromdate");
		
		//String  formattedDate1 = formatter1.format("todate");
		
		System.out.println("dataDate1>>>> "+dataDate1);
		System.out.println("dataDate2>>>> "+dataDate2);
		
		}else{
			
		}
	
		//DateFormat df1=new SimpleDateFormat("dd-MM-yyyy");
	//DateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
	//df1.format(df2.parse(fromdate));
	//df1.format(df2.parse(todate));
	
	
  // String extAll="yes";
	

	System.out.println("--------------------chbxAll excel-----"+chbxAll);

	
%>
<%

System.out.println("------------------output up to here----------------------------sb------>");
System.out.println("------------------staus----->"+staus);
System.out.println("------------------inputtype----->"+inputtype);
System.out.println("------------------fromdate----->"+fromdate+">>>");
System.out.println("------------------today----->"+today);
System.out.println("------------------todate----->"+todate);
System.out.println("------------------dataDate1----->"+dataDate1);
System.out.println("------------------dataDate2----->"+dataDate2);
System.out.println("------------------web----->"+web);
System.out.println("------------------chbxAll----->"+chbxAll);









    
    if(chbxAll==null){
    	System.out.println("------------------null----->");

    	System.out.println("--------------------else of other -inside inputype----");
    	
    	
    		System.out.println("--------------------null  loop-----");
    		System.out.println("--------------------equal Egnor case-----");
 	   	   
	   	    
    		
    		
           if((( staus=="All" || staus.equalsIgnoreCase("All")) && (web=="All" ||  web.equalsIgnoreCase("All"))) &&   (fromdate==today || fromdate.equalsIgnoreCase(today))  ){
		System.out.println("**************frmdt11111 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"'  order by UpdatedDateTime asc";
	}else if(inputtype.equalsIgnoreCase("compid1") ){
    	System.out.println("--------------------else of other -1111----");
    	
    	
		System.out.println("--------------------null  loop-----");
		System.out.println("--------------------equal Egnor case-----");
	   	   
   	   
   	    
		 sql="select * from t_ComplaintDetail where ComplaintID in ("+complaintid+") order by ComplaintDateTime asc";
   	    
   	 System.out.println("**************Compalint ID-->"+complaintid);
		
		
      }else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && ((staus.contains("pending") || staus.equalsIgnoreCase("pending")) && web.equalsIgnoreCase("All"))){
		System.out.println("**************frmdt11222 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+"'  and Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+" order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && ((staus.contains("pending") || staus.equalsIgnoreCase("pending")) && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")))){
		System.out.println("**************frmdt11222web -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00'  and Status in "+staus+"  and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && (staus.equalsIgnoreCase("Solved") && web.equalsIgnoreCase("All"))){
		System.out.println("**************frmdt113333 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00' and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && (staus.equalsIgnoreCase("Solved") && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")))){
		System.out.println("**************frmdt11pend wewb -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00' and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate!=today || !(fromdate.equalsIgnoreCase(today))) && staus.equalsIgnoreCase("All") && web.equalsIgnoreCase("All")){
		System.out.println("--------------------all loop with date-@@@@----");
		sql="select * from t_ComplaintDetail where ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+" order by ComplaintDateTime asc";
	}else if((fromdate!=today || !(fromdate.equalsIgnoreCase(today))) && (staus.equalsIgnoreCase("All") && (web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")) )  ){
		System.out.println("--------------------all loop with date--%%%---");
		sql="select * from t_ComplaintDetail where ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and Website in "+web+" and Status in "+staus1+" and EscalatedDept in "+dept1+" order by ComplaintDateTime asc";
	}else if((staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved")) && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary") ) ){
		System.out.println("--------------------all loop1--with web---");
		sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website in "+web1+" and ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and EscalatedDept in "+dept1+" order by ComplaintDateTime asc";
	}else if(staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved") ){
		System.out.println("--------------------all loop2-----");
		sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+" and ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
	}else{
		sql="select * from t_ComplaintDetail order by UpdatedDateTime asc";
	}
    
    	
    	
    }/*else if(chbxAll=="akshay" || chbxAll.contains("akshay")){
    	
    	today = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(today));
    	sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+today+" 00:00:00' order by ComplaintDateTime asc";
		System.out.println(">>>>>>null query 11 at starting in new akshay>>>>>>>>>>"+sql);
		chbxAll=""; */
		
    else if(chbxAll=="yes" && chbxAll.contains("yes")){
    	 System.out.println("------------------chbxAll----->");
    	 System.out.println("------------------inputtype----->"+inputtype);
    	 if(staus.equalsIgnoreCase("All") && (web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")) ){
    		 System.out.println("--------------------first  loop of  chkbx-----");
    		 sql="select * from t_ComplaintDetail where  Website in "+web1+" and Status in "+staus1+" and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
    	 }else if((staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved")) && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary") ) ){
				System.out.println("--------------------all loop1 chkbx-----");
			sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website='"+web+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
		}else if(staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved") ){
			System.out.println("--------------------all loop2 chkbx-----");
			sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
		}else{
			System.out.println("---------------last loop----else- chkbx-----");
			sql="select * from t_ComplaintDetail where Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
		}
    
     }else if(inputtype.equalsIgnoreCase("compid1") ){
    	System.out.println("--------------------else of other -1111----");
    	
    	
    		System.out.println("--------------------null  loop-----");
    		System.out.println("--------------------equal Egnor case-----");
 	   	   
	   	   
	   	    
			 sql="select * from t_ComplaintDetail where ComplaintID in ("+complaintid+") order by ComplaintDateTime asc";
	   	    
	   	 System.out.println("**************Compalint ID-->"+complaintid);
    		
    		
          }else if((( staus=="All" || staus.equalsIgnoreCase("All")) && (web=="All" ||  web.equalsIgnoreCase("All"))) &&   (fromdate==today || fromdate.equalsIgnoreCase(today))  ){
		System.out.println("**************frmdt11111 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >= '"+dataDate1+"'  order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && ((staus.contains("pending") || staus.equalsIgnoreCase("pending")) && web.equalsIgnoreCase("All"))){
		System.out.println("**************frmdt11222 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00'  and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && ((staus.contains("pending") || staus.equalsIgnoreCase("pending")) && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")))){
		System.out.println("**************frmdt11222web -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >= '"+dataDate1+" 00:00:00'  and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+" order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && (staus.equalsIgnoreCase("Solved") && web.equalsIgnoreCase("All"))){
		System.out.println("**************frmdt113333 -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00' and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate==today || fromdate.equalsIgnoreCase(today)) && (staus.equalsIgnoreCase("Solved") && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary")))){
		System.out.println("**************frmdt11pend wewb -->");
		sql="select * from t_ComplaintDetail where ComplaintDateTime >='"+dataDate1+" 00:00:00' and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by UpdatedDateTime asc";
	}else if((fromdate!=today || !(fromdate.equalsIgnoreCase(today))) && staus.equalsIgnoreCase("All") && web.equalsIgnoreCase("All")  ){
		System.out.println("--------------------all loop with date-with all web----");
		if(dept.equals("All")){
			sql="select * from t_ComplaintDetail where ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and Status in "+staus1+" and Website in "+web1+"  order by ComplaintDateTime asc";
		}else{
			sql="select * from t_ComplaintDetail where ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
			}
		}else if((fromdate!=today || !(fromdate.equalsIgnoreCase(today))) && staus.equalsIgnoreCase("All") && (web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary"))  ){
		System.out.println("--------------------all loop with date-with other all  web option ----");
		if(dept.equals("All")){
		sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+" 23:59:59' and Website in "+web1+" and Status in "+staus1+" order by ComplaintDateTime asc";
		}else{
			sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+" 23:59:59' and Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+" order by ComplaintDateTime asc";
		}
		}else if((staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved")) && ( web.equalsIgnoreCase("FleetView") || web.equalsIgnoreCase("ERP") || web.equalsIgnoreCase("Transworld") || web.equalsIgnoreCase("Diary") ) ){
		System.out.println("--------------------all loop1-----");
		sql="select * from t_ComplaintDetail where Status='"+staus+"' and Website='"+web+"' and ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' and Status in "+staus1+" and Website in "+web1+" and EscalatedDept in "+dept1+" order by ComplaintDateTime asc";
	}else if(staus.equalsIgnoreCase("pending") || staus.equalsIgnoreCase("Solved") ){
		System.out.println("--------------------all loop2-----");
		sql="select * from t_ComplaintDetail where Status='"+staus+"' and  ComplaintDateTime>='"+dataDate1+" 00:00:00' and ComplaintDateTime<= '"+dataDate2+" 23:59:59' order by ComplaintDateTime asc";
	}else{
		if(web.equals("All")){
			sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+" 23:59:59' and Status='"+staus+"' and Website in "+web1+" and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
		}else{
			sql="select * from t_ComplaintDetail where ComplaintDateTime between '"+dataDate1+"' and '"+dataDate2+" 23:59:59' and Status='"+staus+"' and Website in ('"+web+"') and EscalatedDept in "+dept1+"  order by ComplaintDateTime asc";
		}
		}
    System.out.println("---------------------before----------final line---------------sb------>"+sql);
                        ResultSet rst1=st4.executeQuery(sql);
                        System.out.println("-------------------------------final line---------------sb------>"+sql);
                        int i=1;
%>

<form id="ComplaintsReport" name="ComplaintsReport" action="" method="post">
 <table width="100%"  align="center" >
        <tr>
                <td colspan="21">
                <div id="report_heding" align="center"><font face="Arial" size="3"> Complaint Report From <%=dataDate1 %> to <%=dataDate2 %> </font></div>
                </td>
        </tr>
</table>
<table border="0" bgcolor="white" width="100%">
	<tr>
		<td>
		<div id="mytable">

			<table border="1" align="center" class="sortable">
				<tr  bgcolor="#BDBDBD">
					<td><b> Sr.</b></td>
					<td><b>ComplaintID</b></td>
					<td><b>Complaint Date & time</b></td>
           			<td><b>Catagory</b></td>
           			<td><b>Transporter</b></td>
           			<td><b>Vehicle</b></td>
           			<td><b>VehOwner</b></td>
           			<td><b>Website</b> </td>
           			<td><b>Report Name</b> </td>
           			<td><b>Priority</b></td>
           			<td><b>Description</b></td>
					<td><b>Name</b> </td>
					<td style="width: 10px"><b>EmailID</b></td>
					<td><b>Contact</b></td>
					<td><b>Closed Date</b></td>
					<td><b>ClosedBy</b></td>
					<td><b>Closing Comment</b></td>
					<td><b>Status</b></td>
					<td><b>FileName</b></td>
					</tr>
                      <% while(rst1.next())
                         {
                    	  String File=rst1.getString("filename");
                          // int filelt=File.length();
                        String   File1=File.substring(File.lastIndexOf("/")+1,File.length());
                           System.out.println("---file------>"+File1);
                           String vehnno="",trans="";
                           
                          // System.out.println("Veh Details :- "+rst1.getString("ComplaintID"));
   						String vehdetails="select * from t_ComplaintVehDetail where ComplaintID='"+rst1.getString("ComplaintID")+"'";
   						ResultSet rst10=stQuickTest1.executeQuery(vehdetails);
   						
   						System.out.println("Veh Details :- "+vehdetails);
   						if(!rst10.next())
   						{
   							vehnno="-";
   							trans="-";
   							
   							System.out.println("Veh no:- "+vehnno+" trans :- "+trans);
   						}
   						 else
   						{
   							
   							 vehnno=rst10.getString("VehRegNo");
   							trans=rst10.getString("OwnerName");
   							System.out.println("Veh no:- "+vehnno+" trans :- "+trans); 
   						} 
                           
                       %>	
				<tr>
                    <td colspan="1" align="right"><div align="right"><%=i%></div></td>
                    <td colspan="1" align="right"><div align="right"><%=rst1.getString("ComplaintID")%>
				    <td colspan="1" sorttable_customkey="20080211131900" align="right"><div align="right"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("ComplaintDateTime")))%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Category")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Transporter")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=vehnno%></div></td>
					<td colspan="1" align="left"><div align="left"><%=trans%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Website")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("ReportName")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Priority")%></div></td>
					<td colspan="1" align="left"><div align="left" style="overflow: auto; width: 120px;"><%=rst1.getString("Description")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Name")%></div></td>
					<td colspan="1" align="left"><div align="left" style="overflow: auto; width: 120px;"><%=rst1.getString("Email1")%></div></td>
					<td colspan="1"><div align="right"><%=rst1.getString("ContactNumber")%></div></td>
					<%
					String dt =rst1.getString("Closeddatetime");
					System.out.println("---------------------------->"+dt);
					if(dt == null)
					{
				    %>
				    <td colspan="1"><div align="left">-</div></td>
				    <%
					}
					else
					{
					%>
					<td colspan="1"><div align="left"><%=fmt1.format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(rst1.getString("Closeddatetime")))%></div></td>
					<%
					}
					%>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("ClosedBy")%></div></td>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("ClosingComment")%></div></td>
					<%
			   	   if(rst1.getString("Status").contains("Pending"))
			         {
					  %>
					<td colspan="1" align="left"><div align="left"><%=rst1.getString("Status") %></div></td>
					<td colspan="1" align="left"><div align="left"><%= File1 %></div></td>
                    <%} 
					else
					{
                    %>
                    <td colspan="1" align="left"><div align="left"><%=rst1.getString("Status") %></div></td>
                    <td colspan="1" align="left"><div align="left"><%= File1 %></div></td> 
                    <%} %>
                                 
                </tr>
                        <%
                          i++;
                          }
                        
                         %>
                     
                        </table>
                        </div>
                        </td>
                        </tr>
                        </table>
                        </form>
<%
}catch (NullPointerException e)
{
	   System.out.println("bar.couldReturnNull() returned null");
	}

%>                        