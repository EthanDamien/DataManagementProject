<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
  
  <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Group 107</title>
	</head>
	
	<body>
		<a href="login.jsp">Login</a>
		<a href="register.jsp">Register</a>
		
		<div style= "position: fixed; width: 100vw; overflow-x: hidden;">
			<div class="col-12" id="header" style="z-index: 1">
				<img src="styles/E107logo.png" style="height: 98px; float: left"/>
				<input id="searchbar" type="text" name="search" placeholder="Search.." style="margin-top: 30px;"/>
				<a href="/" id="gobutton" style="margin-top: 30px;">Go</a>
				<div style="float: right;">
				<a href="loginPage.jsp" class="headerbutton">Log In</a>
				<% 
					String name = (String)session.getAttribute("USERNAME");
					out.print("Hello" + name);	
				%>
				<a href="/" class="headerbutton">Sign Up</a>
				</div>
			</div>
			<div class="col-12" id="nav2" style="z-index: -1">
				<a href="/" id="gobutton">Profile</a>
				<a href="/" id="gobutton">Account</a>
				<a href="/" id="gobutton">Categories</a>
				<a href="/" id="gobutton">Sell</a>
				<a href="/" id="gobutton" style="float: right;">About Us</a>
			</div>
		</div>
		

</body>
</html>