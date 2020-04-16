<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage=""

import=" java.text.*" 
     import=" java.util.*" 
     errorPage="" 
     import="java.io.BufferedReader"
     import="java.io.InputStreamReader"
	 import="java.net.URL"
	 import="java.net.URLConnection"
     import="java.net.URLEncoder"



 %>
  


<script src="sorttable.js" type="text/javascript"></script>
	<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
<script language="javascript">
function validate()
{ 
	var v1=document.callrec.comment.value;

	if(v1.length<=2)
	{
		//alert("Please enter Comment");
		return false;
	}
	var calltype = document.getElementById("calltype").value;
	if(calltype=='Select'){
		alert("Please select Call Type");
		return false;
	}
	var row7 = document.getElementById("reason").value;
//	alert(row7)
	if(row7=='Select'){
		alert("Please select Reason of call");
		return false;
	}
	var VehicleTracking=document.getElementById("VehicleTracking").value;
//	alert(VehicleTracking);
	var diary=document.getElementById("diary").value;
//	alert(diary);
	var SalesFollowup=document.getElementById("SalesFollowup").value;
//	alert(SalesFollowup);
	if(row7=='Vehicle Tracking' && VehicleTracking=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='diary' && diary=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	if(row7=='Sales Followup' && SalesFollowup=='Select'){
		alert("Please select Reason for Vehicle tracking");
		return false;
		}
	
}

function selectAll()
	{
      // alert("HIIII");
  try{
		var cntr=document.callrec.cntr.value;

			//alert("HIIII11111   ");
		cntr=cntr-1;
	  // alert(document.getElementById("cb1"+j).value)
		if(document.callrec.maincb.checked==true)
		{
			//alert("unside>>>");
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=true;
			}
		}
		else
		{
			
			for(var j=0;j<=cntr;j++)
			{	
				document.getElementById("cb1"+j).checked=false;
			}
		
		}
  }catch(e){
     alert(e); 
		}
		  //alert("HIIII 2222");
		}


function mycheckbox()
{
	try{
     // var p="";
  	//var p=document.getElementById("ab"+i).value;
  	//alert(">>>>");
	  var e= document.getElementsByName("chkbx");
   // alert("111")
	  var z=e.length;
//if (z>1){

	//z=z-1;
//}
     
	  //alert(z);
	  //alert("@@@@@@@@@@@@z@  "+z);
	  var cnt=0;
    var a="";
      var b;
      var d;
      var f;
     var i=1;
     var j=0;
     var a1;
     var a2;
     var a3;
     var a4;
     var a5;
     var a6;
     var a7;
     var a8;
     var a9;
     var a10;
     var a11;
	  for( cnt=0;cnt<e.length;cnt++)
	  {
  	  try
  	  {
  		  
	    //if(document.addinstn.elements("ab"+i).name=="chkbx"){
     try{   
     if((document.getElementById("cb1"+j)).checked){
  	   //f=document.getElementById("aw"+i).value;
		 // alert("<><<>  vehregno>>>");
        // a=a+","+document.getElementById("cb1"+j).value;
          a1=a1+","+document.getElementById("vh"+j).innerHTML;
          a2=a2+","+document.getElementById("td"+j).innerHTML;
         a3=a3+","+document.getElementById("tct"+j).innerHTML;
          a4=a4+","+document.getElementById("dt"+j).innerHTML;
          a5=a5+","+document.getElementById("loc"+j).innerHTML;
          a6=a6+","+document.getElementById("calender"+i).value;
         // a7=document.getElementById("attadd"+j).value;

          //alert(">>a7>>>   "+a7)
         //  alert(">>j>>>   "+j)
         
            // a7=document.getElementsByName("attadd");
             if (document.getElementById("attadd"+j).value!="select")
             {
            	alert("inside");
            	 a7=a7+","+document.getElementById("attadd"+j).value;
            	
            	 
            	 
            }

            
               
             if (document.getElementById("attadd1"+j).value!="select")
             {
            	alert("inside111");
            	 a8=a8+","+document.getElementById("attadd1"+j).value;
            	
            	 
            	 
            }


             

               //a8=a8+","+document.getElementById("altby"+j).innerHTML;
          a9=a9+","+document.getElementById("cntprsn"+j).value;
          a10=a10+","+document.getElementById("cmnt"+j).value;
        
     //alert(">>a1"+a1);
     //alert(">>a2."+a2);
     //alert(">>a6."+a6);
    // alert(">>a7.>>>>   "+a7);
    // alert(">>a8.>>>>   "+a8);
    // alert(">>a9.>>>>   "+a9);
    // alert(">>a10.>>>>   "+a10);
    // alert(">>strUser"+strUser);
         //alert(">>1"+a1+">>2"+a2+">>3"+a3+">>4"+a4+">>5"+a5+">>>6"+a6+">7"+a7+">>>8"+a8+">>9"+a9+">>10"+a10);
      //  f=f+","+document.getElementById("aw"+i).value;
        
           }
		
		 }catch(e){
      alert("Exception--------->"+e);
     }
	    //}
		 
	    j++;
	    i++;
  	  }
  	  catch(e)
  	  {
      	  alert("Exception-----^^^^^---->"+e);
  	  }
	    }
	  
	//  alert("@@@@@@@"+q);          
	//  alert("111111111"+d);
	//alert(f);
	try{
	 // c=document.getElementById("xyz").value; 
		//b=document.getElementById("instruction").value;
  
  if(b=="select" || b=="other" )
  {
   	d=document.getElementById("txt").value;
  }
  else
      {
	 //  d=document.getElementById("instruction").value;
     
  		}
	}catch(e)
	{
  	alert(e);
	}
   //  alert(f);
    try{
    //alert(">>>>hi11111" +a+"  8888888     "+d);
	//  window.location="addcontent.jsp?a="+a+"&d="+d;
	//alert(a);
	//alert(d);
  
  var q=a.substring(1,a.length);
 // alert("@@@@@@@"+q);  
   //  alert("###########"+q);
	//var q=p.replace(",");
 
 
// alert(q);
// var dss=document.getElemnentById("transporter").options[document.getElemnentById("transporter").selectedIndex].value;
 //alert(document.getElementById('transporter').options[document.getElementById('transporter').selectedIndex].value);
 //alert(dss);
	if(q=="" || q==null)
	{
		// alert("Please select atleast one checkbox option");
		//return false;
	}
	// alert(">>>>End of loop");
	
	document.callrec.action="addcalInsert.jsp?a1="+a1+"&a2="+a2+"&a3="+a3+"&a4="+a4+"&a5="+a5+"&a6="+a6+"&a7="+a7+"&a8="+a8+"&a9="+a9+"&a10="+a10 ;


	  document.callrec.submit();
	  //alert("Please select the atleast one option");
  
    }catch(e){
      alert(e);
  }
	}catch(e){
      
  }
 	
	 }





   
function call(){
	var row7 = document.getElementById("reason").value;
//	alert(row7);
	if(row7=='Vehicle Tracking'){
		document.getElementById("1").style.display="";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
		
		}else if(row7=='diary'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="";
			document.getElementById("3").style.display="none";
		
		}else if(row7=='Sales Followup'){
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="";
		
		}else{
			document.getElementById("1").style.display="none";
			document.getElementById("2").style.display="none";
			document.getElementById("3").style.display="none";
				}
	
		
}
</script>
<style>
.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden;
} 
.popupnew { 
	background-color : #98AFC7;
	position: absolute;
	visibility: visible;
} 
.popupx { 
	background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}
</style>

<%@ include file="header.jsp" %>
<%!
String reciever,caller,calltype,thedate,thetime,transporter,comment,username,sql,mob,loct,designation;
String chk="",stg1="",stg2="",stg3="",stg4="";
Connection conn,conn1;
Statement st_sql,st,stmtinsert,st1,stnew,stnew1,stnew2,stcall,stcall1,stcall2,stcall3,stcall4,stcall5,stcall6,stcall7,stcall8,stcall9,stcall10;
%>
<%

//System.out.println(">>CONTROL IN INSERT PAGE ###############33333333#");


transporter=request.getParameter("trans");
reciever=request.getParameter("reciever");
mob=request.getParameter("mob");
loct=request.getParameter("loct");
designation =request.getParameter("designation");
//chk=request.getParameter("check");
//stg1=request.getParameter("stage1");
//stg2=request.getParameter("stage2");
//stg3=request.getParameter("stage3");
//stg4=request.getParameter("stage4");


java.util.Date d=new java.util.Date();
   	String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   	java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   	Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   	String nwfrmtdte=formatter.format(datefrmdb);



java.util.Date td =new java.util.Date();
Format fmt = new SimpleDateFormat("dd-MM-yyyy");
Format fmt1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
Format fmt2 = new SimpleDateFormat("yyyy-MM-dd");
String sdt = fmt.format(td);

java.util.Date dte1 = new java.util.Date();
Format formatter1 = new SimpleDateFormat("dd-MM-yyyy");
String today=formatter1.format(dte1);

String fromdate=request.getParameter("calender");




////System.out.println(">>TCATEGORY#"+chk+">>"+stg1+">>1"+stg2+">>2"+stg3+">>3"+stg4);



thedate=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
thetime=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
username=session.getAttribute("username").toString();
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
stmtinsert=conn1.createStatement();
stnew=conn1.createStatement();
stnew1=conn1.createStatement();
stnew2=conn1.createStatement();

stcall=conn1.createStatement();
stcall1=conn1.createStatement();
stcall2=conn1.createStatement();
stcall3=conn1.createStatement();
stcall4=conn1.createStatement();
stcall5=conn1.createStatement();
stcall6=conn1.createStatement();
stcall7=conn1.createStatement();
stcall8=conn1.createStatement();
stcall9=conn1.createStatement();
stcall10=conn1.createStatement();
st_sql=conn1.createStatement();

//String rep=session.getValue("username").toString();


String a1="",a2="",a3="",a4="",a5="",a6="",a7="",a8="",a9="",a10="",a11="",a12="",chhk="",tdate="";
String comp="",comp1="",comp2="",comp3="",comp4="",comp5="",comp6="",comp7="",comp8="",comp9="";

String unitid="",tdydate="",vid="";

int tno=0, cntloc=0;

a1=request.getParameter("a1");
a2=request.getParameter("a2");
a3=request.getParameter("a3");
a4=request.getParameter("a4");
a5=request.getParameter("a5");

a6=request.getParameter("a6");
a7=request.getParameter("a7");
a8=request.getParameter("a8");
a9=request.getParameter("a9");
a10=request.getParameter("a10");
a11=request.getParameter("a11");
String reason_new11=request.getParameter("reason11");

a12=request.getParameter("a12");

chhk=request.getParameter("chhk");

//String comment =request.getParameter("chhk");;

//System.out.println(">>a11>>"+a11);
//System.out.println(">>a12>vehid>"+a12);
//System.out.println(">>a1>>"+a1);
String a0="";
//a1=a1.replace(",","");
//System.out.println(">>a1> before>"+a1);
String token_reson[]=null,token[]=null,token1[]=null,token2[]=null,token3[]=null,token4[]=null,token5[]=null,token6[]=null,token7[]=null,token8[]=null,token9[]=null,token10[]=null;
////System.out.println(">>a1>  after>"+a1);
String insertdatetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());






if(a1!=null)
{
	
	  token_reson=reason_new11.split(",");
	
	 token=a1.split(",");
	 token1=a2.split(",");
	 token2=a3.split(",");

	
	 
	a4=a4.replace("<br>","");

	//System.out.println(">>a4>  <br> tag"+a4);
	 token3=a4.split(",");

	 token4=a5.split(",");
	 token5=a6.split(",");
	 token6=a7.split(",");
	 token7=a8.split(",");
	 token8=a9.split(",");
	 token9=a10.split(",");
	 token10=a12.split(",");
	//String token10[]=a11.split(",");
	//String token11[]=a1.split(",");

	 //System.out.println(">>token9[1]>>"+token9[1]);




	 //System.out.println(">>a2>>"+a2);
	 //System.out.println(">>a3>>"+a3);
	 //System.out.println(">>a4>>"+a4);
	 //System.out.println(">>a5>>"+a5);
	 //System.out.println(">>a6>>"+a6);
	 //System.out.println(">>a7>>"+a7);
	 //System.out.println(">>a8>>"+a8);
	 //System.out.println(">>a9>>"+a9);
	 //System.out.println(">>a10>>"+a10);
	 //System.out.println(">>tansporter>>"+transporter);
	 //System.out.println(">>reciever>>"+reciever);
	 //System.out.println(">>a11>>"+a11);
	 //System.out.println(">>chhk>>"+chhk);

	 //System.out.println(">>token.length>>"+token.length);

	 //System.out.println(">>token2.length>>"+token2.length);
}



String cat[]=new String [10];
////System.out.println(">>token2[2]>>"+token2[2]);
////System.out.println(">>token2[1]>>"+token2[1]);


////System.out.println(">>token8[2]>>"+token8[2]);
////System.out.println(">>token8[1]>>"+token8[1]);


////System.out.println(">>token9[2]>>"+token9[2]);



if(a1!=null)
{
for(int a=1;a<token2.length;a++)
{
if(token2[a].equalsIgnoreCase("ToCheck") || token2[a]=="ToCheck" || token2[a].contains("ToCheck") || token2[a].equals("ToCheck") )
{
	//System.out.println(">>>>insidfe loop>>>>");
	cat[a]="delay >=6 Hrs and delay < 12 Hrs";
}
//System.out.println(">>>>token2[a]>>>>"+token2[a]);

if(token2[a].equalsIgnoreCase("Stage1Ticket") || token2[a]=="Stage1Ticket" || token2[a].contains("Stage1Ticket") || token2[a].equals("Stage1Ticket")  )
{
	cat[a]="delay >=12 Hrs and delay < 24 Hrs";
	
}
if(token2[a].equalsIgnoreCase("Stage2Ticket") || token2[a]=="Stage2Ticket" || token2[a].contains("Stage2Ticket") || token2[a].equals("Stage2Ticket") )
{
	cat[a]="delay >=24 Hrs and delay < 48 Hrs";
	
}
if(token2[a].equalsIgnoreCase("Stage3Ticket") || token2[a]=="Stage3Ticket" || token2[a].contains("Stage3Ticket") || token2[a].equals("Stage3Ticket") )
{
	cat[a]="delay >=48 Hrs and delay < 7 Days";
	
}

//System.out.println(">>>Before condition*********>"+token2[a]);


String ak=new String("stage4ticket");
//System.out.println(">>>>boolean condition>"+token2[a].equalsIgnoreCase(ak));

if(token2[a].equalsIgnoreCase("stage4ticket") ||  token2[a].equalsIgnoreCase("Stage4Ticket") || token2[a]=="Stage4Ticket"  || token2[a].contains("Stage4Ticket") || token2[a].equals("Stage4Ticket"))
{
	//System.out.println(">>>inside condition*********>");	
	cat[a]="> 7 Days ";
}
//else{
	
	
	////System.out.println(">>>>boolean condition>"+token2[a].equalsIgnoreCase("stage4ticket"));	
	
//}


//System.out.println(">>>>boolean condition>"+token2[a].equalsIgnoreCase("stage4ticket"));

//System.out.println(">>>>cat[]>>a>"+cat[a]+a);
//System.out.println(">>>>category>>>"+cat[a]);

}



}
////System.out.println(">>>>cat>>>"+cat);


int q=0;

	calltype=request.getParameter("calltype");
	comment=request.getParameter("comment");
	String reason=request.getParameter("reason");
	String VehicleTracking=request.getParameter("VehicleTracking");
	String diary=request.getParameter("diary");
	String FleetView=request.getParameter("FleetView");
	String SalesFollowup=request.getParameter("SalesFollowup");
	
	//System.out.println(">>VehicleTracking>>"+VehicleTracking);
	//System.out.println(">>FleetView>>"+FleetView);
	//System.out.println(">>SalesFollowup>>"+SalesFollowup);
	//System.out.println(">>comment>>===>"+comment);

	
	
	
	//if(diary.equalsIgnoreCase("Select")){
		//diary="-";
	//}
	if(VehicleTracking!=null){
	if(VehicleTracking.equalsIgnoreCase("Select")){
		VehicleTracking="-";
	}
	}
	
	if(SalesFollowup!=null)
	{
	if(SalesFollowup.equalsIgnoreCase("Select")){
		SalesFollowup="-";
	}
	}	
	
	
	int pos=0;
	
	if(a1!=null)
	{
	pos=a11.indexOf("'");
	if(pos>0)
	{
		a11=a11.replace("'","");
	}
	
	}
	//System.out.println(">@@@@@@@@@@@>>");
  int a=0;
	try{
		
		//out.print(transporter+"  "+reciever+" "+thedate+"  "+thetime+"  "+username+"  "+calltype+" "+comment);
		
		if(a1!=null)
			{
				
			sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType,reasonOfCall,vehicleTracking,salesFollowup) values('"+thedate+"','"+thetime+"','"+reciever+"','"+username+"','"+comment+"','"+transporter+"','"+calltype+"','Transporter','"+reason+"','"+VehicleTracking+"','"+SalesFollowup+"')";
				
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");

		//out.print(sql);
		////System.out.println(">>Sql$$$$$$$$$$$>>"+sql);
		 a=st.executeUpdate(sql);
		//System.out.println(">>Sql> insert query when  ticket id>"+sql);
			}else{
				
					
					sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType,reasonOfCall,vehicleTracking,salesFollowup) values('"+thedate+"','"+thetime+"','"+reciever+"','"+username+"','"+comment+"','"+transporter+"','"+calltype+"','Transporter','"+reason+"','"+VehicleTracking+"','"+SalesFollowup+"')";
					
					
				
				
				
				//Query for t_sqlquery
				String abcd1=sql.replace("'","#");	
				abcd1=abcd1.replace(",","$");								
				stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");

			//out.print(sql);
			//System.out.println(">>Sql$$$$$$$$$$$>>"+sql);
			 a=st.executeUpdate(sql);
			//System.out.println(">>Sql> insert query when n o ticket id>"+sql);
				
			}
		
		if(a1!=null)
			{
		for(int p=1;p<token.length;p++){
			
			if(a1!=null)
			{
				
				
				
			}else{
				token1[p]="0";
				
			}
		
			//System.out.println(">>up TO HERE >>");
			if(a1!=null)
			{
			//sql="insert into t_callinformation (TicketID,TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType,reasonOfCall,vehicleTracking,salesFollowup) values('"+token1[p]+"', '"+thedate+"','"+thetime+"','"+reciever+"','"+username+"','"+token9[p]+"','"+transporter+"','"+calltype+"','Transporter','"+reason+"','"+VehicleTracking+"','"+SalesFollowup+"')";
			}else{
				
				//sql="insert into t_callinformation (TheDate,TheTime,Reciever,Caller,Callinfo,Transporter,CallType,CallerType,reasonOfCall,vehicleTracking,salesFollowup) values('"+thedate+"','"+thetime+"','"+reciever+"','"+username+"','"+comment+"','"+transporter+"','"+calltype+"','Transporter','"+reason+"','"+VehicleTracking+"','"+SalesFollowup+"')";
				
				
			}
			
			
			//Query for t_sqlquery
			String abcd1=sql.replace("'","#");	
			abcd1=abcd1.replace(",","$");								
			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd1+"')");

		//out.print(sql);
		////System.out.println(">>Sql>>"+sql);
		// a=st.executeUpdate(sql);
		////System.out.println(">>Sql>>"+sql);
		}
		
			}
		
		
		
		//System.out.println(">@@@@@@@@@@@111111111111>>");
		
		
	if(a >0)
		{
			out.print("<div align='center'><font color='red' size='2'>Call Recorder Successfully.</font></div>");
		}
	
	
	// //System.out.println(">>>>token.length>>>"+token.length);  
	
	
	
	if(a1!=null)
	{
	for(int p=1;p<token.length;p++){
	
		String date111=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(token5[p])); 
		
		comp="select * from db_gps.t_vehicledetails where VehicleRegNumber ='"+token[p]+"' ";
        ResultSet cmp=stcall.executeQuery(comp);
        //System.out.println(">>>>comp>>>"+comp);  
        if (cmp.next())
        {
        unitid=cmp.getString("UnitID");
        	
        	
        }
        
        comp2="select * from t_livetickettest where tid ='"+token1[p]+"'  ";
	    ResultSet cmpp=stcall2.executeQuery(comp2);
	    //System.out.println(">>>>comp2>>>"+comp2);  
	    
	    if(cmpp.next())
	    {
	    	
	    	tdate=cmpp.getString("tdate");
	    	vid =cmpp.getString("tid");
	    	
	    }
        
	    //System.out.println(">>>>Before query >>>");  
	    
	    String sql_new="select * from db_CustomerComplaints.t_complaints1 where VehicleNo='"+token[p]+"'   and Status='Allocated' and Result='Unsolved'  ";
	    
	    ResultSet rs_new=st_sql.executeQuery(sql_new);
	    //System.out.println(">>>>sql_new>>>"+sql_new);  
	    if(rs_new.next())
	    {
	    	
	    	
	    	//System.out.println(">>>>Inside LOOPPPPPPPPPPPPP>>>");  
	    	String techname="-";
	    	String sql111="select * from db_CustomerComplaints.t_callocation1 where Tno='"+rs_new.getString("Tno")+"' order by DofAllocation desc";
	    	ResultSet rst1_new=st1.executeQuery(sql111);
	    	if(rst1_new.next())
	    	{
	    		
	    		techname=rst1_new.getString("Technicion");
	    		
	    	}
			
	    	
	    	
	    	
	    	
	    	
	    	if(token6[p].equalsIgnoreCase("select"))
	    	
	    	{	
	    		comp1="insert into db_CustomerComplaints.t_reallocated (TicketID,Tno,VehRegNo,Transporter,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason,comment,contactdetails) values('"+token1[p]+"','"+tno+"','"+token[p]+"','"+transporter+"','VehNotAvailable','VehNotAvailable','"+insertdatetime+"','"+tdate+"','"+token6[p]+"','"+rs_new.getString("VehAttLoc")+"','"+techname+"','"+token_reson[p]+"','"+comment+"','"+token9[p]+"')";
	    	}else{
	    		
	    		comp1="insert into db_CustomerComplaints.t_reallocated (TicketID,Tno,VehRegNo,Transporter,NewLocation,NewTechnician,AlocationDateTime,OldAvailableDate,OldLocation,OldTechnician,AllocatedBy,Reason,comment,contactdetails) values('"+token1[p]+"','"+tno+"','"+token[p]+"','"+transporter+"','"+token6[p]+"','"+token7[p]+"','"+insertdatetime+"','"+tdate+"','"+token6[p]+"','"+rs_new.getString("VehAttLoc")+"','"+techname+"','"+token_reson[p]+"','"+comment+"','"+token9[p]+"')";
	    		
	    	}
	    	
	    	stcall1.executeUpdate(comp1);  
    		//System.out.println(">>>>comp1>>>"+comp1);  
	    	
	    	
	    	
	    }else{
	    	
	    	
	    	//System.out.println(">>>>ELSE LOOPPPPPPPPPPPPP>>>"+p);  
	    	//System.out.println(">>>>ELSE token[p]>>>"+token[p]);  
	    	//System.out.println(">>>>ELSE cat[p]>>>"+cat[p]);  
	    	//System.out.println(">>>>ELSE token9[p]>>>"+token9[p]);  
	    	//System.out.println(">>>>ELSE token6[p]>>>"+token6[p]);  
	    	//System.out.println(">>>>ELSE token6[p]>>>"+token6[p]);
	    	
	    	
	    	//System.out.println(">>>>ELSE token8[p]>>>"+token8[p]);
	    	//System.out.println(">>>>ELSE token1[p]>>>"+token1[p]);
	    	
	    	
	    	
	    	
	    	
	    	 comp1="insert into db_CustomerComplaints.t_complaints1 (CDate, TdyDate, Customer, UnitNo, VehicleNo, Complaint, Status, Regby, Result, CDescription, VehAttLoc, ContDets, VehAvailDate,TicketID) values ('"+tdate+"', '"+nwfrmtdte+"', '"+transporter+"', '"+unitid+"', '"+token[p]+"', '"+cat[p]+"', 'Allocated', '"+username+"', 'Unsolved', '"+token9[p]+"', '"+token6[p]+"', '"+token8[p]+"', '"+date111+"','"+token1[p]+"')";
	    	 //System.out.println(">>>>comp1>beforfe>>"+comp1);  
	    		stcall1.executeUpdate(comp1);  
	    		//System.out.println(">>>>comp1>>>"+comp1);  
	    	
	    	
	    }
	    
	    
	    
	    //System.out.println(">>>>AKKKKKKKKKKKKKKK>>>");  
	    comp3="insert into db_CustomerComplaints.t_complainttypenew(cname,TicketID)values('"+cat[p]+"','"+token1[p]+"')";  
       //System.out.println(">>>>comp3>>>"+comp3);  
       stcall3.executeUpdate(comp3);
	    //System.out.println(">>>>comp3>>>"+comp3);  
	    
	    
	    
	   
	
	
	comp4="select max(Tno) from db_CustomerComplaints.t_complaints1 ";
	 ResultSet cmpp1=stcall4.executeQuery(comp4);
	 //System.out.println(">>>>comp4>>>"+comp4);  
	if (cmpp1.next())
		{
		 tno=cmpp1.getInt("max(Tno)");
	   	
		
	}
	
	
	comp5="select * from db_CustomerComplaints.t_complaints1 where Tno='"+tno+"'  ";
	 ResultSet cmpt=stcall5.executeQuery(comp5);
	 //System.out.println(">>>>comp5>>>"+comp5);  
	 if (cmpt.next())
		{
		 tdydate=cmpt.getString("Tdydate");
	   	
		
	}
	
	 
	 comp6= " insert into db_CustomerComplaints.t_callocation1 (TicketID,Tno, Customer, DofComplaint, DofAllocation, Technicion, Status, ProbSince, VehRegNo, VehAvailDate) values ('"+token1[p]+"', '"+tno+"', '"+transporter+"','"+nwfrmtdte+"', '"+tdydate+"', '"+token7[p]+"', 'Unsolved', '"+tdate+"', '"+token[p]+"', '"+date111+"')";
	 stcall6.executeUpdate(comp6);  
	 //System.out.println(">>>>comp6>>>"+comp6);  
	
	
	 if (chhk!=null)
	 {
	 	String sql ="select MobNo from t_techlist where TechName= '"+token7[p]+"' ";
	 	ResultSet	rs6 = stcall6.executeQuery(sql);
	 	//System.out.println(">>>sql<<<"+sql);

	 	if (rs6.next())
	 	{
	 		String phnumber = rs6.getString("MobNo");
	 		if(phnumber!=null)
	 		{
	 		phnumber=phnumber.replaceAll("91"," ");
	 		phnumber="91"+phnumber.trim();
	 		}
	 		
	 		String temp = token5[p];
	 		String tempdate = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(temp));
	 		//String textmsg= veh + ", "+ trans +", " + attadd +", " +tempdate +", " + contdets +" , "+allocatedby;
	 		String orgMsg= token[p] + ", "+ transporter +", " + token6[p] +", " +tempdate +", "+username+","+token5[p];
	 		String textmsg="-",inserMsg="-";
	 			if(orgMsg.trim().length()>=160)
	 				{
	 				
	 				textmsg= orgMsg.substring(0,159);
	 				inserMsg=textmsg;
	 				
	 				}
	 			else
	 			{
	 				textmsg=orgMsg;
	 				inserMsg="-";				
	 			}
	 			textmsg=textmsg.replace("-", " ");
	 			textmsg=textmsg.replace("'", " ");
	 			textmsg=textmsg.replace(";", " ");
	 			textmsg=textmsg.replace("&", " ");
	 			textmsg=textmsg.replace("@", " ");
	 			textmsg=textmsg.replace("<>", " ");
	 			textmsg=URLEncoder.encode(textmsg);
	 			//http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=vikram&sender=Demo&cdmasender=&to=919762000537&message=Hello

	 			//String smsurl="http://india.timessms.com/receiverCommon.asp?outLogin=Transworld&outPWD=vikram&outMSG="+sms+"&outNumber="+numbers+"&sign=diary";
	 		//	String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld-INT&password=vikram&sender=Demo&cdmasender=&to="+phnumber+"&message="+textmsg;
	 			String smsurl="http://india.timessms.com/http-api/receiverall.asp?username=Transworld&password=vikram&sender=TransWld&sign=diary&to="+phnumber+"&message="+textmsg+"&gateway=regular";
	 			URL url=new URL(smsurl);
	 			URLConnection connection = url.openConnection();
	 			connection.connect();
	 			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	 			String line;
	 			
	 		    while ((line = in.readLine()) != null ) 
	 		    {
	 		    	//System.out.println(line);
	 		    		
	 		    }
	 		String insert_Date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(tempdate));
	 		//msg.Send(textmsg,phnumber);
	 		//msg.Send(textmsg,"9922894506");
	 		
	 		Calendar cal = Calendar.getInstance();
	 		String current_tm = new SimpleDateFormat("hh:mm:ss").format(cal.getTime());
	 		String current_dt = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	 		
	 		String current_dt_tm = current_dt +" " + current_tm;
	 		String str="";
	 		
	 			
	 		
	 			//String date1111=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MM-yyyy").parse(token5[p]));
	 			
	 			
	 			 String  str1 = "INSERT INTO db_CustomerComplaints.`t_ComplaintAllocationSMS` (`TicketID`,`VehicleNo`, `VehAttLoc`, `Transporter`, `ContDets`, `VehAvaildate`, `AllotedBy`, `TechName`, `Tno`, `Complaint_date`, `data_type`,`reason`,OriginalMsg) VALUES('"+token1[p] +"', '"+ token[p] +"', '" + token6[p] +"', '"+transporter+"', '"+ token8[p] +"', '"+date111+"', '"+username+"', '"+token7[p]+"',"+ tno +", '"+ current_dt_tm + "', 'allocation','-','"+inserMsg+"')";
	 		
	 		
	 		
	 		
	 		//Query for t_sqlquery
	 			String abcd3=str1.replace("'","#");	
	 			abcd3=abcd3.replace(",","$");								
	 			stmtinsert.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"+abcd3+"')");
	 		
	 		int i = stcall7.executeUpdate(str1);
	 		//System.out.println(">>>str1<<<"+str1);
	 		
	 		
	 	}//end of if (rs6.next())
	 	 
	 
	 }
	 
	 
	 
	 
	 if(a1!=null)
	 {
		 comp7="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+token1[p]+"','Complaint Assigned','"+token9[p]+"','"+username+"','"+token10[p]+"','"+token[p]+"','"+transporter+"')";
	
		 stcall8.executeUpdate(comp7);  
		 
		 //System.out.println(">>>comp7<<<"+comp7);
	 
	 }
	 
	 
	 
	
	
	 
	
     
	 if(a1!=null)
	 {
	 comp8="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+token1[p]+"','Call','"+comment+"','"+username+"','"+token10[p]+"','"+token[p]+"','"+transporter+"')";
	 }else{
		 
		 comp8="insert into db_gps.t_tickethistorytest (Action,ActionComment,ActionBy,Transporter) values ('Call','"+comment+"','"+username+"','"+transporter+"')";
		 
		 
	 }
	 q= stcall9.executeUpdate(comp8);  
	 
	 //System.out.println(">>>comp8<<<"+comp8);
	 
	 
	 
	
	
	}
	
	//response.sendRedirect("addcall.jsp?q="+q);
	
	if (q>0)
	
		
		{
			out.print("<div align='center'><font color='red' size='2'>Complaint Assigned  Successfully.</font></div>");
		}	
		
	}else{
		
		
		
		//if(a1!=null)
		// {
		// comp8="insert into db_gps.t_tickethistorytest (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+token1[p]+"','Call','"+comment+"','"+username+"','"+token10[p]+"','"+token[p]+"','"+transporter+"')";
		// }else{
			 
			 comp8="insert into db_gps.t_tickethistorytest (Action,ActionComment,ActionBy,Transporter) values ('Call','"+comment+"','"+username+"','"+transporter+"')";
			 
			 
		// }
		 q= stcall9.executeUpdate(comp8);  
		 
		 //System.out.println(">1111111111111>>comp8<<<"+comp8);
		
	}
	
	// if(a1!=null)
	 //{
	 //comp8="insert into db_gps.t_tickethistory (TicketID,Action,ActionComment,ActionBy,Vehid,VehRegNo,Transporter) values ('"+token1[p]+"','Call','"+token9[p]+"','"+username+"','"+vid+"','"+token[p]+"','"+transporter+"')";
	 //}else{
		 
		// comp8="insert into db_gps.t_tickethistorytest (Action,ActionComment,ActionBy,Transporter) values ('Call','"+comment+"','"+username+"','"+transporter+"')";
		 
		 
	// }
	// q= stcall9.executeUpdate(comp8);  
	 
	 ////System.out.println(">>>comp8<<<"+comp8);
	
	response.sendRedirect("addcall1.jsp?q="+q);
	%>
	
	
<%	
	}catch(Exception e)
	{
		//out.print("Exception -->"+e);
		e.printStackTrace();
	}
	finally
	{
		//conn.close();
		conn1.close();
		
	}
%>


<!--   <body background="images/green_grad_bot.jpg" onload="focusChild();"> -->
<body >


<form name="" action="addcalInsert.jsp" method="post"  onSubmit="return validate();">
  
  <table align="center">
 <tr align =""><td colspan="2" align=""> <div align="center"><a href="javascript:window.close();">Close</a>  </div> </td></tr>
  </table>
  
  
</form>
 </body> 
</html>
