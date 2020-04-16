<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="header.jsp" %>


<%!
Connection con1;
%>

<% 
try {
//Class.forName(MM_dbConn_DRIVER);
//con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance(); 
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
String sql1="", sql2="", sql3="", sql4="";
ResultSet rs1=null;

String techname="", cellno="", intime1="", intime2="", outtime1="", intime="", outtime2="", outtime="", owner="", vehno="", fixed="", olduid="", newId="", othprob="", accesstime1="", accesstime2="", accesstime="", location="", othinstloc="",  specRep="", supname="", drivername="", allprobs="", probinsrt="", locinsrt=""; 
int maxrid=0;

String entby=session.getValue("username").toString();
out.print(entby);
   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);


techname=request.getParameter("techname");
out.print(techname);

cellno=request.getParameter("cellno");
out.print(cellno.length());
intime1=request.getParameter("intime1");
intime2=request.getParameter("intime2");
intime=intime1+":"+intime2;

outtime1=request.getParameter("outtime1");
outtime2=request.getParameter("outtime2");
outtime=outtime1+":"+outtime2;
owner=request.getParameter("owner");

vehno=request.getParameter("vehno");
fixed=request.getParameter("fixed");
olduid=request.getParameter("olduid");
newId=request.getParameter("NewId");


String[] probfound=request.getParameterValues("prob");
othprob=request.getParameter("othprob"); 
   for(int i=0; i<probfound.length; i++)
   {
      allprobs=allprobs+","+probfound[i];
      probinsrt=allprobs;
      
      out.print(probfound[i]+",");     
      
   }
  
if(null==othprob || othprob.equals(""))
{
   
}
else
{ 
   allprobs=allprobs+","+othprob;
   sql1="select max(Rid) from db_CustomerComplaints.t_complainttype";
         rs1=stmt1.executeQuery(sql1);
         if(rs1.next())
         {
            maxrid=rs1.getInt("max(Rid)");
            maxrid=maxrid+1;
         }  

   sql2="insert into db_CustomerComplaints.t_complainttype (Rid, ComplaintType, ComplaintCode) values ('"+maxrid+"', '"+othprob+"', '"+othprob+"')";
   stmt1.executeUpdate(sql2);
   
}
out.print("problems = "+allprobs);

accesstime1=request.getParameter("accesstime1");
accesstime2=request.getParameter("accesstime2");
accesstime=accesstime1+":"+accesstime2;

location=request.getParameter("location");
locinsrt=location;
if(location.equals("Other"))
{
   othinstloc=request.getParameter("othinst");
   locinsrt=othinstloc;
   
   sql3="insert into db_CustomerComplaints.t_location (LName) values ('"+othinstloc+"')";
   stmt1.executeUpdate(sql3);
}  

specRep=request.getParameter("SpecRep");
supname=request.getParameter("Superviser");
drivername=request.getParameter("Driver"); 

sql4="insert into db_CustomerComplaints.t_techdailyreport (TechName, ConNo, InTime, OutTime, Transporter, VehNo, Fixed, OldUnitId, NewUnitId, ProbFound, AccessTime, Location, SpReport, SupName, DriverName, EntBy ) values('"+techname+"', '"+cellno+"', '"+intime+"', '"+outtime+"', '"+owner+"', '"+vehno+"', '"+fixed+"', '"+olduid+"', '"+newId+"', '"+probinsrt+"', '"+accesstime+"', '"+locinsrt+"', '"+specRep+"', '"+supname+"', '"+drivername+"', '"+entby+"' )";
stmt1.executeUpdate(sql4);

con1.close();
response.sendRedirect("techdailyreport.jsp?inserted=successfull");
return;
}
catch(Exception e)
{ 
   out.print("Exception----->"+e);
} 


%>

