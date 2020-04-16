<%-- 
    Document   : index
    Created on : Oct 9, 2008, 10:19:52 AM
    Author     : atul
    Discroption: this page is welcome page for the site.
    last updated : Jan 12, 2009.
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<!--
		Login page for Diary System.
				
		Author: Atul Kalaskar
		Modified Date: 29 Dec 2008.
		parpous : to provide the interface to login and validate the user on client side.	
 	-->
	<title>Seven Day Diary System.</title>
	<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
	<script src="includes/MENU.js" type="text/javascript"></script>

	<script type="text/javascript">
	//function to validate the user name and possword.
	function validate()
	{
		if(document.getElementById("loginid").value=="")
			{
				alert("Please Enter the Login Id");
				return false;
			}
		if(document.getElementById("pass").value=="")
			{
				alert("Please Enter the Password");
				return false;
			}
		return true;
	}
	</script>
</head>

<body>

  <div id="outer">
    <div id="wrapper">
      <div id="body-bot">
        <div id="body-top">
          <div id="logo">
            <h1><img src="images/Transworld.gif"></h1>
            <p>We care about your Vehicles</p>
          </div>
          <div id="nav">
            <ul>
              <li><a href="index.html">MAIN PAGE</a></li>
              <li><a href="http://www.myfleetview.com">TRACKING</a></li>
              <li><a href="http://www.mobile-eye.in/contact.html">CONTACT US</a></li>
            </ul>
            <div class="clear"> </div>
          </div>
          <div id="gbox">
            <div id="gbox-top"> </div>
            <div id="gbox-bg">
              <div id="gbox-grd">
                <h2>WELCOME TO OUR DIARY MAINTENANCE SYSTEM</h2>
				
                <p>Don't forget to login every day, because you have  new tasks almost daily.</p>
          <p>You are free to call transporters to get faulty vehicle availability details.</p>
                
<p>This is a website designed by Transworld for you to maintain your diary.</p>
                <div id="features">
                  <h2>Transworld Compressor Technologies Ltd.</h2>
                  <ul>
                    <li><font color="red">No Boundaries</font></li>
		                      
                  
	            <li><font color="green">.............No Limitations</font></li>
                  
	            <li><font color="violet">......................No Conventions</font></li>
                  
	            <li><font color="blue">...............................Just Invention</font></li>
                  </ul>
                  <div class="clear"> </div>
                </div>
                
                <div id="newsletter">
                  <h2>Login</h2>
                  <form action="login.jsp" method="post" name="loginform" accept-charset="utf-8" onsubmit="return validate();">
			<table border="0">
			<tr><td colspan="2">
			<%
				String err=request.getParameter("err");
				if(null==err)
				{
				}
				else
				{
					if(err.equals("err2"))
					{
						out.print("<center><font color='red' size='1'>Session expired, please login again.</font>");
					}
					else
					{
					out.print("<center><font color='red' size='1'>Please enter correct User Name And Password</font>");
					}
				}
				%>
			</td>
			<tr><td>User Id: </td><td><input type="text" class="text" name="loginid" id="loginid"/></td></tr>		
			<tr><td>Password: </td><td><input type="password" class="text" name="pass" id="pass"/></td></tr>
			<tr><td colspan="2" align="center"> <input type="submit" value="Submit"></td></tr>
			</table>
                    
                   
                  </form>
                  
                </div>
                <div id="events">
               
                  <h2>FEATURED LIST</h2>
                  <ul>
                    <li>1. Diary Maintaining </li>
                    <li>2. Complaint Registration</li>
			<li>3. Technician's Daily Report</li>
					<li>4. Unit Replacement</li>
                    <li>5. Unit Addition</li>
 <li>6. Phone Call Status.</li>
                  </ul>

                </div>
                <div class="clear"> </div>
                
              </div>
            </div>
            <div id="gbox-bot"> </div>
          </div>
          
  
        </div>
      </div>
    </div>
  </div>
  
  <div id="copyright"><font color="Black">
   Copyright Â© 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.
   </font>
  </div>

</body>
</html>
