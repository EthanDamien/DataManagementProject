<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Create Customer Rep</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<h1 class = "headerGreetings">Create Customer Representative Account</h1>
        <form class = "formContainer" action="createCustomerRepHandler.jsp" method = "POST">
        	<label>Username</label>
        	<input class = "textField sweep" type="text" name = "username" placeholder= "Username" required>
        	<label>Password</label>
        	<input class = "textField sweep" type="text" name = "password" placeholder= "Password" required>
        	<label>Email</label>
        	<input class = "textField sweep" type="text" name = "email" placeholder= "Email" required>
            <input class = "loginButton sweep" type="submit" value = "Create Customer Rep Account" style="margin-top: 10px;">	
        </form>
</body>
</html>