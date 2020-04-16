<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="header.jsp" %>
<head>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>



<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 

<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>


<script type="text/javascript">
$(document).ready(function() {
	 $("#checkAll").click(function () {
	     $('input:checkbox').not(this).prop('checked', this.checked);
	 });
});
</script>
 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
	        dom: 'Blfrtip',
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Technician Report',
	                        exportOptions: {
	                            modifier: {
	                                page: 'current'
	                            }
	                        }
	                    },
	                    {
	                        extend: 'pdf',
	                        orientation: 'landscape',
	                        pageSize: 'LEGAL',
	                        title: 'Technician Report'
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Technician Report'
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Technician Report'
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Technician Report'
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
	        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
	    	
	    } );
	} );

</script>

<script language="javascript">
function validate()
{
	//alert("in valiate function");
	var cntr=document.spcommentclose.cntr.value;
	//alert(cntr);
	var Srno="";
	var flag="false";
   	for(var j=0;j<cntr;j++)
    	{	
    		if(document.getElementById("del"+j).checked==true)
    		{
    			var RId=document.getElementById("id"+j).value;
    			
    			//alert(RId)
    			Srno=Srno+RId+",";
				flag="true";
    		}		
    	}
	//	alert(flag);
		if(flag=="true"){
	//		alert(Srno);
			var vehno=document.getElementById("vehno").value;
			var unitid=document.getElementById("unitid").value;
			window.open('ClosingSpComment.jsp?RId='+Srno+'&vehno='+vehno+'&unitid='+unitid,'mywindow','width=800, height=250, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no,left=50, top=50 ');
			}
        if(flag=="false"){
			alert("Please select atleast one checkbox");
			return false;
        }//write function to check no of check boxes get value
	//return false;
}

</script>

<style type="text/css">
#example {
    
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid ;
    padding: 8px;
}

#example tr:nth-child(even){}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
   
    color: white;
}
</style>
</head>
<body>
<%! 
Connection con1;
%>
<form name="spcommentclose" method="post" onsubmit="return validate();" >
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="",sql2="";
	int i=1,j=0,k=0;

	String inserted=request.getParameter("inserted");
	if(inserted==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px" bgcolor="#E6E6E6">
			<tr>	
				<td align="center"> <font color="black"> Successfully Closed </font> </td>
			</tr>
		</table>
<% 	}

	String nocbselected=request.getParameter("nocbselected");
	if(nocbselected==null)
	{
	}
	else
	{ %>
		<table border="0" width="750px" bgcolor="#E6E6E6">
			<tr>
				<td> <div align="center"> <font color="black" > No Check-box was selected. Please select the check-box to remove it from Unit Missing list.</font> </div> </td>
			</tr>
		</table>
<%	}

	String vehregno=request.getParameter("vehno");
	String unitid=request.getParameter("unitid");
%>
		<table border="0" width="750px" bgcolor="#E6E6E6">
			<tr >
				<td align="center" colspan="3"> <font color="black"> <B> Special Comments of Vehicle : <%=vehregno%>  
				<%if(unitid!=null || (!unitid.equalsIgnoreCase("null"))|| (!unitid.equals("-")))
					{%> and Unit : <%=unitid %>
					<%} %></B> </font> </td>
			</tr>
			<tr><td align="right">Color indication:</td><td bgcolor="#BBF0E8">Vehicle </td><td bgcolor="#F6FDD0">Unit </td><td bgcolor="#E2A9F3">Disconnection</td></tr>
		</table>
<br></br>
		<table border="1" width="500px" bgcolor="#E6E6E6" align="black"  id="example">
			<tr bgcolor="#BDBDBD">
				<td> <div align="center"> <input type="checkbox" id="checkAll"> </div> </td>
		
				<td align="center"> <b>Sr. No</b></td>
				<td align="center"> <b>Ent Date-Time</b> </td>
				<td align="center"> <b>Sp. Comment</b></td>
				<td align="center"> <b>Extra Comment</b></td>
				<td align="center"> <b>Concerned Person</b></td>
				<td align="center"> <b>Ent. By</b></td>
				<td align="center"> <b>Close By</b></td>
				<td align="center"> <b>Comment type</b></td>
				
			</tr>
<%
		Boolean flag=false,flag1=false,flag2=false;
		if(unitid.equals("-"))
		{
			sql1="select * from t_techspecialrep where VehRegNo='"+vehregno+"' and cmmt_type='Vehicle' and Closed='No' order by EntDateTime desc ";
			flag=true;
		}
		else
			if(vehregno.equals("-"))
		{
			//sql1="select * from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' order by EntDateTime desc ";
			sql1="select * from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' order by EntDateTime desc ";
			flag1=true;
		}
		else
		{
		//sql1="select * from t_techspecialrep where VehRegNo='"+vehregno+"' and Closed='No' order by EntDateTime desc ";
		sql1="select * from t_techspecialrep where VehRegNo='"+vehregno+"' and  cmmt_type='Vehicle' and Closed='No' order by EntDateTime desc ";
		sql2="select * from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' and Closed='No' order by EntDateTime desc ";
		//sql2="select * from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' order by EntDateTime desc ";
		
		flag2=true;
		}
		String bgcolor="";
		rs1=stmt1.executeQuery(sql1);
		while(rs1.next())
		{ 
			String sp=rs1.getString("SpComment");
			if(sp.contains("System disconnection detected")){
		%>
		<tr bgcolor="#E2A9F3">
		<%	
			}else{
		%>
			<tr <%if(flag==true || flag2==true){ %> bgcolor="#BBF0E8"
			<%}else{%>bgcolor="#F6FDD0"<%}
			%>>
			<%
		}
			%>
			<td>			 <div align="center"> 
			<%if(flag==true || flag2==true){ %>
			 <input type="checkbox" name="del<%=j%>" id="del<%=j%>" value="del<%=j%>" />
			 
			 <%} %>
			  </div>  </td>
			
				<td> <%=i%> 
				<input type="hidden" name="id<%=j%>" id="id<%=j%>" value="<%=rs1.getString("SrNo")%>" /> </td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs1.getString("EntDateTime")))%> </td>
				<td> <%=rs1.getString("SpComment")%> </td>
				<td><%=rs1.getString("Extra_comment") %></td>
				<td> <%=rs1.getString("ActionToBeTakenBy")%> </td>
				<td> <%=rs1.getString("EntBy")%> </td>
				<td> <%=rs1.getString("CloseBy")%> </td>
				
				<%if(flag==true)
				{
				%>
				<td> Vehicle </td>
				<%}
				else if(flag1==true)
				{
				%>
				<td> Unit </td>
				<%}
				else if(flag2==true)
				{%>
				<td>Vehicle</td>
				<% }%>
			</tr>
<%		
			i++;j++;k++;
		}
		if(flag2==true)
		{
			rs2=stmt2.executeQuery(sql2);
			while(rs2.next())
			{
				
				
%>
<tr bgcolor="#F2FFAA">
			<td>			 <div align="center">  </div>  </td>
			
				<td> <%=i%> 
				<input type="hidden" name="id<%=j%>" id="id<%=j%>" value="<%=rs2.getString("SrNo")%>" /> </td>
				<td> <%=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(rs2.getString("EntDateTime")))%> </td>
				<td> <%=rs2.getString("SpComment")%> </td>
				<td><%=rs2.getString("Extra_comment") %></td>
				<td> <%=rs2.getString("ActionToBeTakenBy")%> </td>
				<td> <%=rs2.getString("EntBy")%> </td>
				<td> <%=rs2.getString("CloseBy")%> </td>
				<td> Unit </td>
				
			</tr>
<%    i++;j++;
} }%>
		<tr>
			<td colspan="11"> <div align="center"> <input type="submit" name="submit" value="Close" class="btn btn-primary"/> </div> </td>
		</tr>
		</table>
	
<input type="hidden" name="cntr" value="<%=k%>" />
<input type="hidden" name="vehno" id="vehno" value="<%=vehregno%>" />
<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" />
<%	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();

}
%>
	</form></body></html>
