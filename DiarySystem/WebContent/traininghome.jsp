<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<table border="1" Width="96%">
<tr><td>
<%@ include file="header.jsp" %>
</td></tr>
<%! 
Connection conn,conn1;
Statement st,st1,st2;
%>
<tr><td>
	<form name="Trainingform" method="post" action="traininginsrt.jsp" onsubmit="return validate();">

<table border="1" width="750px">
<tr>
<td><font color="maroon" ><b>Trainee Name: </b></font></td>
<td>
<input type="text" name="trainee" class="formElement"> </input> 
</td>
<td colspan="4" align="center"><font size="3" color="maroon" >Unit Addition  </font></td>
</tr>
<tr>
<td><font color="maroon" ><b>Organisation of Trainee :</b></font></td><td>
<select name="owner" onChange="OnChangeFunc3(this);" class="formElement" > 
         <option value="Select"> Select </option>
	<%
	username=session.getAttribute("username").toString();
	sql="select Distinct(Transporter) as Transporter from t_asgndtranstoreps where Representative='"+username+"' order by Transporter";
		ResultSet rst=st.executeQuery(sql);
		while(rst.next())
		{
		%>
			<option value="<%=rst.getString("Transporter")%>"><%=rst.getString("Transporter")%></option>
		<%
		}
		%>
			<option value="Other"> Other </option>
</select>
</td>
<tr>
<td><font color="maroon" ><b>Trainer Name: </b></font></td>
<td>
<input type="text" name="trainer" class="formElement"> </input> 
</td>

<td><font color="maroon" ><b>Subject of Training: </b></font></td>
<td>
<input type="text" name="subject" class="formElement"> </input> 
</td>


</tr>
<tr>
<td>
<input type="text" id="calender" name="calender" size="13" class="formElement" value="" readonly/>
             <input type="button" name="trigger" id="trigger" value="Inst Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script>
</td>
<td>
<font color="maroon" ><b>
Training Time:
</b></font>
</td>
<td>
 <select name="hour" class="formElement">
                <% for(int i=0;i<24;i++)
                   { %>
                      <option value="<%=i %>" > <%=i %> </option>
               <%  } %>
              </select>
                 &nbsp;&nbsp;
               <select name="minutes" class="formElement">
                <% for(int j=0;j<60;j++)
                   { %>
                      <option value="<%=j %>" > <%=j %> </option>
               <%  } %>
              </select>

</td>
</tr>
<tr>
<td>
<td><font color="maroon" ><b>Total Time of Training: </b></font></td>
<td>
<input type="text" name="Tothour" class="formElement"> </input> 
</td>
</td>

</tr>
<td><font color="maroon" ><b>Group: </b></font></td>
<td>
    <select name="cust" onChange="OnChangeFunc1(this);" class="formElement"> 
         <option value="None" > None </option>
<% 

	sql="select TypeValue from t_security where TypeofUser='GROUP' order by TypeValue";
     	ResultSet rst1=st2.executeQuery(sql);
   	while(rst1.next())
   	{
     		String chk=rst1.getString("TypeValue");
     		out.println(chk);
    
	%>
        	<option value="<%=rst1.getString("TypeValue") %>" >  <%=rst1.getString("TypeValue") %> </option>
   	<%
   	} 
	%>
         <option value="Other"> Other </option>
         </select>

</td>
</tr>
<tr>
<td><font color="maroon" ><b>Vehicle Reg. No.: </b></font></td>
<td>
<input type="text" name="vehno" class="formElement"> </input> 
</td>
<td>
<font color="maroon" ><b>
 Unit Id: 
</b></font>
</td>
<td>
<input type="text" name="uid" size="10" class="formElement"> </input> 
</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
Mobile No.: 
</b></font>
</td>
<td>
<input type="text" name="mobno" size="13" onClick="AJAXFunc()"; class="formElement"> </input>
</td>
<td>
<font color="maroon" ><b>
Sim No.:
</b></font>
</td>
<td>
<input type="text" name="simno" size="13" class="formElement"> </input>
</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
 Installation Date:
</b></font>
</td>
<td>
<input type="text" id="calender" name="calender" size="13" class="formElement" value="" readonly/>
             <input type="button" name="trigger" id="trigger" value="Inst Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script>
</td>

</tr>
<tr>
<td>
<font color="maroon" ><b>
Installed at: 
</b></font>
</td>
<td>
<select name="instat" onChange="OnChangeFunc2(this);" class="formElement">
        <option value="Select"> Select </option>

<%
  sql="select LName from t_location order by LName";
  ResultSet rst2=st.executeQuery(sql);
  while(rst2.next())
  { %>

     <option value="<%=rst2.getString("LName") %>" > <%=rst2.getString("LName") %> </option>
<% } %>

     <option value="Other"> Other </option>
   </select>
<div id="othinstloc" style="visibility:hidden"> <center><input type="text" name="othinst" size="20"> </input> </center> </div> 
</td>
<td>
<font color="maroon" ><b>
 Type of Unit:
</b></font>
</td>
<td>
<select name="typeunit" class="formElement">
        <option value="NORMAL" >NORMAL  </option>
        <option value="TEMPSENSOR" >TEMPSENSOR  </option>
        <option value="FUELFLOW" >FUELFLOW  </option>
    </select>
</td>
</tr>
<tr>
<td>
<font color="maroon" ><b>
Installed By: 
</b></font>
</td>
<td>
<select name="instby" class="formElement">
 <option value="Select"> Select </option>
<% sql="select TechName from t_techlist" ;
   ResultSet rst3=st.executeQuery(sql);
    while(rst3.next())
    { %>
     <option value="<%=rst3.getString("TechName") %>"> <%=rst3.getString("TechName") %> </option>
<%  } %>
        </select> 
</td>
<td>
<input type=checkbox name="instin" value="instin" checked onChange="OnChangeChkBx(this);" class="formElement"><font color="maroon" ><b> Installed in India</b></font> </input> 
</td>
<td><font color="maroon" ><b>
Time</b></font>  &nbsp;&nbsp;<input type="text" name="tme" value="5:30" size="5" readonly class="formElement"> </input>
<div id="nwtme" style="visibility:hidden"> <center><input type="text" name="newtme" size="5"> </input> </center> </div> 
</td>
</tr>
<tr>
<td colspan="4"> <div align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </div> </td>

</tr>
</table>
</form>
</td></tr>
<tr><td>

</td></tr>