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
	
	<h1 id = "welcome"> Welcome to BuyMe! </h1>
	<a id = "login" href="login.jsp">Login</a>
	<a id = "register" href="registration.jsp">Register</a>
	<%
		try{
				
			String temp = (String) session.getAttribute("error");
				
			if(temp.equals("Valid")){%>
				<script>
				window.onload = function(){
					document.getElementById("login").classList.add("hidden");
					document.getElementById("register").classList.add("hidden");
					alert('Sucessful Login');
				}
				</script>
			<%
			}session.removeAttribute("error");
		}catch (Exception ex){
		}		
	%>
	
	
</body>
</html>