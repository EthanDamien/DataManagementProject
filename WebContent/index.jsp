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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>BuyMe - Home</title>
</head>
<body>
	<%
	String accountType = "";

		try{

			String temp = (String) session.getAttribute("error");
			int accountNum = (Integer) session.getAttribute("Type");
									
			switch(accountNum){
				case(1):
					accountType = "Admin";
					break;
				case(2):
					accountType = "Customer Support";
					break;
				case(3):
					accountType = "Customer";
					break;
		}

		if(temp.equals("Valid")){
				
		%>
			<script>
				alert('Sucessful Login');
				window.onload = function(){
				document.getElementById("login").classList.add("hidden");
				document.getElementById("register").classList.add("hidden");
				document.getElementById("logout").classList.remove("hidden");
				document.getElementById("userType").classList.remove("hidden");
			}
			</script>
			<%
			}session.removeAttribute("error");
		}catch (Exception ex){
		}		
	%>
	
	<h1 id = "welcome"> Welcome to BuyMe! </h1>
	<a id = "login" href="login.jsp">Login</a>
	<a id = "register" href="registration.jsp">Register</a>
	<p id = "userType" class = "hidden"><%= accountType %></p>
	<form id = "logout" method="POST" action="logout.jsp" class = "hidden">
    	<input type="submit" value="Logout"/>
	</form>
	
	
</body>
</html>