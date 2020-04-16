<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<%!
Connection con1, con2;
%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);

	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();

ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null, rs8=null, rs9=null, rs10=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="", sql10="";
String holdby="", cust1="", cust2="", holdby1="";

String firstfunc=request.getParameter("firstfunc");
String dte=request.getParameter("dte");

if(firstfunc==null)
{
	String dispdate1="", recentinstdate1="", orderno1="", dispcust1="", loc1="", faulty1="", ownname1="", rdate1="";
	int days1=0;

	String unitid1=request.getParameter("unid1");
	String val=request.getParameter("val");

	
	sql3="select * from t_techspecialrep where UnitId='"+unitid1+"' and Closed='No' order by EntDateTime desc ";
	rs3=stmt2.executeQuery(sql3);	
	if(rs3.next())
	{
		out.print(rs3.getString("SpComment"));		
		
	}

	sql4="select * from t_unitmasterhistory where UnitId='"+unitid1+"' and Status='Dispatched' order by DispDate desc limit 1";
	
	rs4=stmt1.executeQuery(sql4);
	if(rs4.next())
	{
		dispdate1=rs4.getString("DispDate");
	}

	String chk1="";

	sql5="select * from t_unitreplacement where NewUnitId='"+unitid1+"' and InstDate between '"+dispdate1+"' and '"+dte+"' order by InstDate desc, EntDate desc limit 1 ";
	//out.print(sql5);
	rs5=stmt1.executeQuery(sql5);
	if(rs5.next())
	{
		recentinstdate1=rs5.getString("InstDate");
		ownname1=rs5.getString("OwnerName");
		chk1="No";
	}
 	else
	{
		chk1="Yes";
	}
	
	sql10="select * from t_unitreceived where UNitId='"+unitid1+"' order by RDate desc limit 1";
	rs10=stmt2.executeQuery(sql10);
	if(rs10.next())
	{
		rdate1=rs10.getString("RDate");

		sql6="select (TO_DAYS('"+rdate1+"')-TO_DAYS('"+dispdate1+"')) ";
		//out.print(sql6);
		rs6=stmt1.executeQuery(sql6);
		if(rs6.next())
		{
			days1=rs6.getInt(1);
		} 

		if(days1 > 0)
		{ %>
			<font color="red"> Already Received. Don't enter it again</font> 
	<%	}
		
	}
	

	sql1="select * from t_unitmaster where UnitId='"+unitid1+"' ";
	//out.println(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		holdby1=rs1.getString("HoldBy");
		orderno1=rs1.getString("Orderno");	
	}

	sql8="select * from t_techlist where TechName='"+holdby1+"' ";
	rs8=stmt2.executeQuery(sql8);
	if(rs8.next())
	{
		holdby1=ownname1;
	}
	
	if(chk1.equals("Yes"))
	{
		sql7="select * from t_unitorder where Reqno='"+orderno1+"' ";
		rs7=stmt2.executeQuery(sql7);
		if(rs7.next())
		{
			holdby1=rs7.getString("Cust");
			loc1=rs7.getString("DispatchAdd");
			faulty1="Yes";
		}
	}
	else
	{
		faulty1="No";
	}
	
	
	sql2="select distinct(TypeValue) as cust from t_security where TypeOfUser in ('Transporter', 'GROUP') order by TypeValue asc  ";
	rs2=stmt1.executeQuery(sql2);	
%>
		<select name="transp<%=val%>" class="formElement">
			<option value="Select">Select</option>
<%
		while(rs2.next())		
			{
				cust2=rs2.getString("cust");
				
 %>
				<option value="<%=rs2.getString("cust")%>" <% if(cust2.equals(holdby1)) {  %> Selected <% } %> ><%=rs2.getString("cust")%> </option>
<%			}
%>
		<option value="Transworld" <% if(holdby1.equals("Transworld")) {  %> Selected <% } %>>Transworld</option>

			<option value="Anish" <% if(holdby1.equals("Anish")) {  %> Selected <% } %> >Anish</option>

		<option value="Pulraj" <% if(holdby1.equals("Pulraj")) {  %> Selected <% } %> >Pulraj</option>
		<option value="Wagholi" <% if(holdby1.equals("Wagholi")) {  %> Selected <% } %> >Wagholi</option>
		<option value="IITS" <% if(holdby1.equals("IITS")) {  %> Selected <% } %> >IITS</option>
		<option value="Lloyds Metals" <% if(holdby1.equals("Lloyds Metals")) {  %> Selected <% } %> >Lloyds Metals</option>
		<option value="Batco Roadways" <% if(holdby1.equals("Batco Roadways")) {  %> Selected <% } %> >Batco Roadways</option>


		
	</select>	
<%
	
	if(faulty1.equals("Yes"))
	{ %>
		<input type="text" name="loc<%=val%>" value="<%=loc1%>" class="formElement" />
<%	} %>

	<input type="hidden" name="faulty<%=val%>" value=<%=faulty1%> > 	
<%
		
}

else
{    
	String dispdate="", recentinstdate="", orderno="", dispcust="", loc="", faulty="", ownname="", rdate="";
	int days=0;
	String unitid=request.getParameter("unid");

	/*sql3="select * from t_techspecialrep where UnitId='"+unitid+"' and Closed='No' order by EntDateTime desc ";
	rs3=stmt2.executeQuery(sql3);	
	if(rs3.next())
	{
		out.print(rs3.getString("SpComment"));		
		
	}*/

	sql4="select * from t_unitmasterhistory where UnitId='"+unitid+"' and Status='Dispatched' order by DispDate desc limit 1";
	
	rs4=stmt1.executeQuery(sql4);
	if(rs4.next())
	{
		dispdate=rs4.getString("DispDate");
	}

	sql10="select * from t_unitreceived where UNitId='"+unitid+"' order by RDate desc limit 1";
	rs10=stmt2.executeQuery(sql10);
	if(rs10.next())
	{
		rdate=rs10.getString("RDate");

		sql6="select (TO_DAYS('"+rdate+"')-TO_DAYS('"+dispdate+"')) ";
		//out.print(sql6);
		rs6=stmt1.executeQuery(sql6);
		if(rs6.next())
		{
			days=rs6.getInt(1);
		} 

		if(days > 0)
		{ %>
			<font color="red"> Already Received. Don't enter it again</font> 
	<%	}
	}	

	String chk="";
	sql5="select * from t_unitreplacement where NewUnitId='"+unitid+"' and InstDate between '"+dispdate+"' and '"+dte+"' order by InstDate desc, EntDate desc limit 1 ";
	//out.print(sql5);
	rs5=stmt1.executeQuery(sql5);
	if(rs5.next())
	{
		recentinstdate=rs5.getString("InstDate");
		ownname=rs5.getString("OwnerName");
		chk="No";
	}
 	else
	{
		chk="Yes";
	}	

	String sqlVehicleAvailable="select * from t_vehicledetails where UnitID='"+unitid+"'";
	ResultSet rsVehicleAvailable=stmt1.executeQuery(sqlVehicleAvailable);
	if(rsVehicleAvailable.next())
	{
		String vehicleRegistratinNumber=rsVehicleAvailable.getString("VehicleRegNumber");
		String transporter=rsVehicleAvailable.getString("OwnerName");
	//	//System.out.println(vehicleRegistratinNumber+transporter);
		%>
		<font size="3" color="red"><b> Unit is present in vehicle <%=vehicleRegistratinNumber %>,you cannot receive it.</b></font> 
	<%
	}
	
	sql1="select * from t_unitmaster where UnitId='"+unitid+"' ";
	//out.println(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		holdby=rs1.getString("HoldBy");
		orderno=rs1.getString("Orderno");
	}

	sql8="select * from t_techlist where TechName='"+holdby+"' ";
	rs8=stmt2.executeQuery(sql8);
	if(rs8.next())
	{
		holdby=ownname;
	}

	if(chk.equals("Yes"))
	{
		sql7="select * from t_unitorder where Reqno='"+orderno+"' ";
		//out.print(sql7);
		rs7=stmt2.executeQuery(sql7);
		if(rs7.next())
		{
			holdby=rs7.getString("Cust");
			loc=rs7.getString("DispatchAdd");
			faulty="Yes";
		}
	}
	else
	{
		faulty="No";
	}


sql2="select distinct(TypeValue) as cust from t_security where TypeOfUser in ('Transporter', 'GROUP') order by TypeValue asc  ";
	rs2=stmt1.executeQuery(sql2);	
%>

	<select name="transp" class="formElement">
		<option value="Select">Select</option>
<%
		while(rs2.next())		
			{
				cust1=rs2.getString("cust");
				
 %>
				<option value="<%=rs2.getString("cust")%>" <% if(cust1.equals(holdby)) {  %> Selected <% } %> ><%=rs2.getString("cust")%> </option>
<%
			} 
			
%>
			<option value="Transworld" <% if(holdby.equals("Transworld")) {  %> Selected <% } %>>Transworld</option>

			<option value="Anish" <% if(holdby.equals("Anish")) {  %> Selected <% } %> >Anish</option>

		<option value="Pulraj" <% if(holdby.equals("Pulraj")) {  %> Selected <% } %> >Pulraj</option>
		<option value="Wagholi" <% if(holdby.equals("Wagholi")) {  %> Selected <% } %> >Wagholi</option>
		<option value="IITS" <% if(holdby1.equals("IITS")) {  %> Selected <% } %> >IITS</option>
		<option value="Lloyds Metals" <% if(holdby1.equals("Lloyds Metals")) {  %> Selected <% } %> >Lloyds Metals</option>
		<option value="Batco Roadways" <% if(holdby1.equals("Batco Roadways")) {  %> Selected <% } %> >Batco Roadways</option>
		
	</select>	
	
<% 
	if(faulty.equals("Yes"))
	{ %>
		<input type="text" name="loc" value="<%=loc%>" class="formElement" />
<%	} %>
	<input type="hidden" name="faulty" value=<%=faulty%> > 	
<%
}	
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
con2.close();

}

%>







