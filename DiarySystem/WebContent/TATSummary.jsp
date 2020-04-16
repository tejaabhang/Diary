

<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<html>
<head>
			<script language="javascript">
			function validate()
  			{
  				/*if(document.getElementById("data").value=="")
  				{
  			  		alert("Please select the from date");
  					return false;
  				}
  				if(document.getElementById("data1").value=="")
  				{
			  		alert("Please select the to date");
  					return false;
  				}
  				if(document.getElementById("vendor").value=="")
  				{
  					alert("Please select the vendor");
  					return false;
  	  			}
  				if(document.getElementById("Statustype").value=="")
  				{
  					alert("Please select the Statustype");
  					return false;
  	  			}*/
  				//return true;
  				return datevalidate();
  		  }
  		
			 function datevalidate()
			 {
			 	var date1=document.getElementById("data").value;
				var date2=document.getElementById("data1").value;
				var dm1,dd1,dy1,dm2,dd2,dy2;
				dy1=date1.substring(0,4);
				dy2=date2.substring(0,4);
				dm1=date1.substring(5,7);
				dm2=date2.substring(5,7);
				dd1=date1.substring(8,10);
				dd2=date2.substring(8,10);
				var date=new Date();
				var month=date.getMonth()+1;
				var day=date.getDate();
				var year=date.getFullYear();
				if(dy1>year || dy2>year)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				else if(year==dy1 && year==dy2)
				{
		  			if(dm1>month || dm2>month)
					{
						alert("selected date should not be greater than todays date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				if(dm1==month)
				{
					if(dd1>day || dd2>day)
					{
						alert("selected date should not be greater than todays date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				if(dy1>dy2)
				{
					alert("From date year is should not be greater than to date year");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				else if(year==dy1 && year==dy2) if(dm1>dm2)
				{MimeMessage msg=new MimeMessage(session);
					alert("From date month is should not be greater than to date month 5");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				if(dm1==dm2) 
				{
					if(dd1 > dd2)
					{
						alert("From date should not be greater than to date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				return true;
			}
 			

  	</script>
<title>Unit Dispatch</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<tr>
			<td align="center" class="sorttable_nosort"><font color="block" size="2" >TAT Summary Report</font></td>
			</tr>
			<tr><td>
			<!-- if date range is not requred please remove this code start from this comment to -->
			
  	
  	
  	<%!
Connection con1;
Connection con2;
String refno=null;
%>
<% 


ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";


String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	<form action="" method="get" onsubmit="return validate();">
			<table border="0"  width="50%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <table ><tr style="border: none;">
			  <td >
			  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="10" readonly/>
			  </td>
			  <td>
				<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",     // the date format
      			button      : "trigger"       // ID of the button
    			}
  				);	
				</script>
			  </td>
			  </tr></table>
			</td>
			<td align="right">
			<table><tr><td>
			<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
			</td>
			<td>
			 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data1",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",    // the date format
      			button      : "trigger1"       // ID of the button
    			}
  				);
				</script>
			</td>
			</tr></table>
			  	
			  	
  			 </td >
			
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement">
			</td>
		</tr>
		
		</table>
		</form>
		</td></tr>
	<%	 
	
		String dd=request.getParameter("data");
	if(dd==null)
{
%>

<table class="stats">
<tr><td>
<center class='bodyText'><b>Please select option to display the Report</b></center>
</td></tr>
</table>

<%
}
else
{
data=request.getParameter("data");
//System.out.println("data==>"+data);
data1=request.getParameter("data1");
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	Statement stmt1 = con2.createStatement();
	Statement stmt2 = con1.createStatement();
	Statement stmt3 = con1.createStatement();
	Statement st=con1.createStatement();
	Statement st1=con1.createStatement();
	Statement st2=con1.createStatement();
	Statement st3=con1.createStatement();
	Statement st5=con2.createStatement();
%>

			<tr>
			<td  class="sorttable_nosort">
			<div id="report_heding"><font color="brown" size="3">TAT Summary report from <%
                       java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
                      Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                       java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1); %> </font></div>
				<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
			</td>
			</tr>
			</table>
			<form name="tatsummary" method=get>
			<div align="center">
			<table border="1" width="30%">
					<%
					
					int i=1;
					int Unitstrt_notRcvd=0,QTnotdone=0,Repairnotdone=0,unitOK_ntdspth=0,dsptchdone=0,unitntOK=0,repairnotOK=0,total=0;
					String qtdone="no";
					String uid_ntRec="(",uid_Qtnt="(",uid_repnt="(",uid_ntDisp="(",uid_Disp="(",uid_rep="(";
					//out.println(sql2);
					sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+data+"'and '"+data1+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
					rs2=st.executeQuery(sql2);
				//	 System.out.println("Sql2==>"+sql2);
					while(rs2.next())
					{
						String actrecdaet="-",Rdate="-",Rtime="-",loc="-",courier="-",receiveby="-";
						
						String unitid=rs2.getString("UnitID"); 
						
						 actrecdaet=rs2.getString("ActualRecDate");
						 Rdate=rs2.getString("Rdate");
						 Rtime=rs2.getString("Rtime");
						 loc=rs2.getString("Lname");
						 courier=rs2.getString("Courier");
						//	String courierby=rs2.getString("");
						 receiveby=rs2.getString("EntBy");
							if(Rdate==null || Rdate.equals("null"))
							{
								Rdate="-";
							}
							if(actrecdaet==null || actrecdaet.equals("null"))
								actrecdaet="-";
							
						
						long diff=0,diffindays=0,diffinhrs=0,time1=0,time2=0;
			
						
						if(!Rdate.equals("-"))
						{
						if(!Rdate.equals("-"))
						{
						java.util.Date recdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Rdate+" "+Rtime);
						 time1=recdate.getTime();
					
						}
						if(!actrecdaet.equals("-"))
						{
						 java.util.Date actdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(actrecdaet);
						 time2=actdate.getTime();
				
						 diff=time1-time2;
						
						 diffindays=(diff / (1000*60*60*24));
							;
						 diffinhrs=(diff / (1000*60*60));
						
						}
						
						
						String qtdate="-";
						String qtby="-",qttime="-",refno="";
						boolean qtFlag=false;
						//to check if qt or not aft receive
						
						if(!(Rdate.equals("-")))
						{
						sql7="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
					//	System.out.println(sql7);
						 rs7=stmt1.executeQuery(sql7);	
						 if(rs7.next())
						 {
							
							qtFlag=true;
							 qtdate=rs7.getString("TheDate");
							 qttime=rs7.getString("TheTime");
							 qtby=rs7.getString("User");
							 refno=rs7.getString("RefNo");
							 
						 }
						 else
						 {
							 uid_Qtnt=uid_Qtnt+"'"+unitid+"',";
								 
							 qtFlag=false;
							 qtdate="-";
							 qtby="-";
							 QTnotdone++;	//****  Rcvd bt  Quick test not done  *****//
							// System.out.println("QTnotdone====>"+QTnotdone);
						 }
						}
						/* long diffindaysqt=0,diffinhrsqt=0,diffqt=0;
						 long time3=0;
						// System.out.println("qtdate="+qtdate);
						 if(!(qtdate.equals("-")))
						 { //System.out.println("inside qtdate if");
							java.util.Date quickTdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(qtdate+" "+qttime);
							time3=quickTdate.getTime();
							
						//	System.out.println("rtime="+time1+"qttime="+time3);
							 diffqt=time3-time1;
							// System.out.println("diffqt="+diffqt);
							diffindaysqt=(diffqt / (60*60*24*1000));
							// System.out.println("diffindaysqt="+diffindaysqt);
							diffinhrsqt=(diffqt / (60*60*1000));
							// System.out.println("diffinhrsqt="+diffinhrsqt);
						 }*/
						 
						 //----------------------------get the edit date------------------------------------------
						 
						 String entdate="-",enttime="-",editedby="-";
						 boolean editFlag=false;
						 if(!(qtdate.equals("-")))
						 {
						 	 sql7="Select * from t_unitmasterhistory where Unitid='"+unitid+"' and EditedBy <> '-' and EntDate>='"+qtdate+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-' order by concat(EntDate,' ',EntTime) Limit 1";
						 	// System.out.println(sql7);
						 ResultSet rs=st2.executeQuery(sql7);
						 if(rs.next())
						 	{
							 	editFlag=true;
							 	entdate=rs.getString("EntDate");
								enttime=rs.getString("EntTime");
								editedby=rs.getString("EditedBy");
								
							}
						 else
						 {
							 	unitntOK++;			//unit tested bt nt repaired
								uid_repnt=uid_repnt+"'"+unitid+"',";
						 }
						 }
						/* if(editedby.equalsIgnoreCase("-"))
							{
								Repairnotdone++;
								 System.out.println("Repairnotdone====>"+Repairnotdone);
								 
								 
							}*/
						// System.out.println("entdate"+entdate+"enttime"+enttime+"editedby"+editedby);
					/*	 long diffindayseditdt=0,diffinhrsedit=0;
						 long time4=0;
						 if(!(qtdate.equals("-")) && !entdate.equals("-"))
						 {
							// System.out.println("inside if");
							java.util.Date editeddate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(entdate+" "+enttime);
							time4=editeddate.getTime();
							//System.out.println("time4="+time4);
							long diffedit=time4-time3;
							//System.out.println("diffedit="+diffedit);
							diffindayseditdt=(diffedit / (60*60*24*1000));
							//System.out.println("diffindayseditdt="+diffindayseditdt);
							diffinhrsedit=(diffedit / (60*60*1000));
							//System.out.println("diffinhrsedit="+diffinhrsedit);
						 }
						 */
						 
						
						 //--------------------------------------------------------------------------------------
						
						 //------------------------ getting the tested date ------------------------
						 String testedBy="-",testDateTime="-";
						 boolean testFlag=false; 
						 long testTime=0,diffTest=0;
						 String testedDt=null;
						 long diffindaystestdt=0,diffinhrstest=0;
						 if(entdate!=null && !(entdate.equals("-")))
						 {
						 sql7="select * from t_unitmasterhistory where Unitid='"+unitid+"' and EntDate>='"+entdate+"' and testedunit='Yes' order by TesetdDateTime limit 1";
						 ResultSet testRst=st2.executeQuery(sql7);
						 if(testRst.next())
						 {
							 testFlag=true;
							 testedBy=testRst.getString("Tested_by");
						//	 System.out.println("testedBy===>"+testedBy);
							 testDateTime=testRst.getString("TesetdDateTime");
							 testedDt=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime));
						//	out.println("testedDt===>"+testedDt);
						//	 System.out.println("testDateTime===>"+testDateTime);
							 qtdone="yes";
						 }else
						 {
							 repairnotOK++;		//unit rep not OK
							 uid_rep=uid_rep+"'"+unitid+"',";
							 
						 }
						 }
					
					
					/*	 if(testFlag)
						 {
							 
							 Date testDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime);
							
							 testTime=testDate.getTime();
						//	 System.out.println("testTime===>"+testTime);
							 diffTest=testTime-time4;
						//	 System.out.println("diffTest===>"+diffTest);
							diffindaystestdt=(diffTest / (60*60*24*1000));
								//System.out.println("diffindayseditdt="+diffindayseditdt);
							diffinhrstest=(diffTest / (60*60*1000));
								//System.out.println("diffinhrsedit="+diffinhrsedit);
						 }
						 
						 //------------TOTAl TAT Total TAT = (Unit Tested Date&Time - Unit Received Date&Time)------------------------------------------------------------------------------------
							
						 long diffindaysTotTat=0,diffinhrsTotTat=0,diffTotTat=0;
						 if(time2!=0)
						 {
							 diffTotTat=testTime-time2;
						 }
						 else
						 {
							 diffTotTat=testTime-time1; 
						 }
						 diffindaysTotTat=(diffTotTat / (1000*60*60*24));
						 diffinhrsTotTat=(diffTotTat / (1000*60*60));*/
						 //------------------------------------------------------------------------------------------------
						 
						 //--------------------------------------------------------------------------
						 //----------------getting the dispatch date--------------------------
						 	String dispdate="-",dispdoneby="-",disptime="";
						 if(!testDateTime.equals("-"))
						 {
						 	que="Select * from t_unitmasterhistory where DispDate >= '"+testedDt+"' and UnitId='"+unitid+"' and Status='Dispatched' order by DispDate Limit 1";
						//System.out.println(que);
						ResultSet rsget=st1.executeQuery(que);
					
						if(rsget.next())
						{
							dispdate=rsget.getString("DispDate");
							disptime=rsget.getString("DispTime");
							dispdoneby=rsget.getString("User");
							if(dispdoneby==null || dispdoneby.equals("null"))
								dispdoneby="-";
							dsptchdone++; 	//****   Dispatch done  *****//
							uid_Disp=uid_Disp+"'"+unitid+"',";
						}
						else
							{
								unitOK_ntdspth++;		//unit OK nt disptch
							//	 System.out.println("unitOK_ntdspth====>"+unitOK_ntdspth);
								 uid_ntDisp=uid_ntDisp+"'"+unitid+"',";
								 
							}
						
						}
						
						
						 //--------------------------------------------------------------------------
					 
						 
						 //-----------------getting the received date---------------------------------------------------
						 
						 String receiveddate="-",recname="-",receivetime="";
						 if(!(dispdate.equals("-")))
						 {
						 que1="Select * from t_unitmasterhistory where DispDate='"+dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' and (RecByTech='Yes' OR RecByCust='Yes') order by DispDate Limit 1";
							//System.out.println(que1);
							ResultSet rsget1=st3.executeQuery(que1);
						if(rsget1.next())
						{
							if((rsget1.getString("RecByTech").equalsIgnoreCase("yes")))
							receiveddate=rsget1.getString("RecDateTime");
							else if((rsget1.getString("RecByCust").equalsIgnoreCase("yes")))
								receiveddate=rsget1.getString("RecByCustDate");
							if(receiveddate==null || receiveddate.equals("null"))
								receiveddate="-";
							//receivetime=rsget1.getString("Rtime");
							recname=rsget1.getString("User");
						}
						else
							receiveddate="-";
											
						 }
					/*	 long diffindaysdisp=0,diffinhrsdisp=0,diffdisp=0;
						 if(!(dispdate.equals("-")) && !receiveddate.equals("-"))
						 {
							 java.util.Date dispatchdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dispdate+" "+disptime);
							long time5=dispatchdate.getTime();
								 
							 
							java.util.Date receivedt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receiveddate);
							long time6=receivedt.getTime();
							
							 diffdisp=time6-time5;
							diffindaysdisp=(diffdisp / (1000*60*60*24));
							diffinhrsdisp=(diffdisp / (1000*60*60));
						 }*/
						%>
					<%	i++;
						}
					} // while		
					
					//rcvd QT not don
					uid_Qtnt=uid_Qtnt+")";
					uid_Qtnt=uid_Qtnt.replace(",)",")");
					
					// QT not rep 
					uid_repnt=uid_repnt+")";
					uid_repnt=uid_repnt.replace(",)",")");
					
					//repair  done unit nt ok
					uid_rep=uid_rep+")";
					uid_rep=uid_rep.replace(",)",")");
					
					//unit ok,bt not dispatch
					uid_ntDisp=uid_ntDisp+")";
					uid_ntDisp=uid_ntDisp.replace(",)",")");
					
					//dispatch done
					uid_Disp=uid_Disp+")";
					uid_Disp=uid_Disp.replace(",)",")");
					
					
					total=QTnotdone+unitntOK+repairnotOK+unitOK_ntdspth+dsptchdone;
				//System.out.println("uid_Disp--------->"+uid_Disp);
			%>
			<tr>
				<th align="center" width="60%"><font size="2">Unit Received but not QT</font></th>
				<td align="center" ><font size="2"><a href="TATReport.jsp?total=no&uidList=<%=uid_Qtnt%>&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=QTnotdone%></font></b></a></td>
			</tr>
			<tr>
				
				<th align="center"><font size="2"> QT but not repair</th>
				<td align="center"><font size="2"><a href="TATReport.jsp?total=no&uidList=<%=uid_repnt%>&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=unitntOK %></font></b></a></td>
			</tr>
			<tr>
				<th align="center"><font size="2"> Repair but not OK</th>
				<td align="center"><font size="2"><a href="TATReport.jsp?total=no&uidList=<%=uid_rep%>&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=repairnotOK%></font></b></a></td>
				
			</tr>
			<tr>
				<th align="center"><font size="2"> Unit OK, Not Dispatched</th>
				<td align="center"><font size="2"><a href="TATReport.jsp?total=no&uidList=<%=uid_ntDisp%>&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=unitOK_ntdspth %></font></b></a></td>
			</tr>
			<tr>
				<th align="center"><font size="2"> OK & Dispatch Done</th>
				<td align="center"><font size="2"><a href="TATReport.jsp?total=no&uidList=<%=uid_Disp%>&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=dsptchdone%></font></b></a></td>
				
			</tr>
			<tr>
				<th align="center"> TOTAL </th>
				<td align="center"><a href="TATReport.jsp?total=yes&from=<%=data%>&to=<%=data1%>"><b><font size="2"><%=total%></font></b></a></td>
			</tr>
				</table>	
				</div>	
			<!-- body part come here -->
					<%}
catch(Exception e) { 
	//out.println("Exception----->"+e); 
//System.out.println("Exception----->"+e);	
}

finally
{
con1.close();
con2.close();
}
} //else end

%>
		
    </form>
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
      
    </body>
    
</html>