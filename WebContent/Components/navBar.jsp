<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<nav class="navbar">
		<a class="nav-btn" href="index.jsp">Buy Me</a>
		<a class="nav-btn" href="market.jsp">Shop</a>
	 	<% if(session.getAttribute("Username") != null) { 
	 		int accountType = (Integer) session.getAttribute("Type");
	 			if(accountType == 1){
	 				%> <a class="nav-btn" href="adminHome.jsp">Admin Home</a><% 
	 			}else if(accountType == 2) {
	 				%> <a class="nav-btn" href="customerRepHome.jsp">Customer Representative Home</a><% 
	 			}
			 %>
			
			<a class="nav-btn" href="logout.jsp">Logout</a>
			<a class="nav-btn" href="questions.jsp">Questions</a>
			<a class="nav-btn" href="userProfile.jsp">Profile</a>
			<a class="nav-btn" href="createAuction.jsp">Create Auction</a>		
		<% } else { %>
			<a class="nav-btn" href="questions.jsp">Questions</a>
			<a class="nav-btn" href="login.jsp">Login</a>
			<a class="nav-btn" href="registration.jsp">Register</a>
		<% } %>
	</nav>
</body>
</html>