<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--meta-->
	<meta charset = "utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, minimum-scale=1">

  <!--Link bootstrap, css and fonts-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>BuyMe - Login</title>
</head>
<body>
    <div class="headerContainer">
    	<div class="col-12" id="header">
            <a href="index.jsp">
            	<img src="styles/E107logo.png" style="height: 98px; float: left"/>
            </a>
        </div>
    </div>
    
  	<div class="navBar">
    </div>
    
    <div id = "loginForm">
        <h1 class = "headerGreetings">Nice to Meet You</h1>
        <form class = "formContainer" action="loginHandler.jsp" method = "POST">
        	<input class = "textField sweep" type="text" id = "username" name = "username" placeholder= "Username" required>
            <input class = "textField sweep" type="password" id = "password" name = "password" placeholder= "Password" required>
            <input class = "loginButton sweep" type="submit" value = "Login" style="margin-top: 10px;">

			<%
			try{
				String temp = (String) session.getAttribute("error");

				if(temp.equals("Invalid")){%>
					<script>
						alert('Invalid Username or Password')
					</script>
				<%}else if(temp.equals("Username")){%>
					<script>
						alert('Username does not exist');
					</script>
				<%}else if(temp.equals("Valid")){%>
					<script>
						alert('Sucessful Login');
					</script>
				<%
				}session.removeAttribute("error");	 
			}catch (Exception ex) {
			}	
			%>

            <a class = "loginOrRegistration" href="registration.jsp">Don't have an account? Register here.</a>
        </form>
    </div>
    <div id ="products" style = "height: 100vw;"></div>
    </div>
</body>
</html>