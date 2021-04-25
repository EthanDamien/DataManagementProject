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
<title>Edit User</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>
	<%
		String username = request.getParameter("usernameEdit");
	%>
	<h1> Edit User <%=username%></h1>
	
	<form action="editUserHandler.jsp" method="POST">
    	<input type="text" name="newUsername" placeholder = "New Username">
      	<input type="text" name="newEmail" placeholder = "New Email">
      	<input type="hidden" name="oldUsername" value="<%=username%>">
      	<input type="submit" value="Save Changes">
    </form>
	
	
	
</body>
</html>