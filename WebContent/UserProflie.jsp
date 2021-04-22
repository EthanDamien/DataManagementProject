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
<title>BuyMe - Profile</title>
</head>
<body>

	
	<%@ include file="./Components/navBar.jsp" %>

	<% if(session.getAttribute("Username") == null){  %>
	<p>You must be logged in to access your account!</p>
	<%} else{ 
	
		ResultSet rs = Users.getUser((String)session.getAttribute("Username"));
		rs.next();
		
		String username = rs.getString("Username");
		
	%>
	
	<h1> Welcome <%= username %>!</h1>
	<%
	

					}
	%>
	
</body>
</html>