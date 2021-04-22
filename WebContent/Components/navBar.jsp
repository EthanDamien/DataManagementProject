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

	<div class= "hheader">
		<div class="col-12" id="header">
			<a href = "productpage.html">
				<img src="styles/E107logo.png" style="height: 98px; float: left"/>
			</a>
			<input id="searchBar" type="text" name="search" placeholder="Search.." style="margin-top: 30px;"/>
			<a href="/" class="goButton" style="margin-top: 30px;">Go</a>
			<div style="float: right;">


			<% if(session.getAttribute("Username") == null){%>

			<a id = "login" href="login.jsp" class="headerButton">Log In</a>
			<a id = "register" href="registration.jsp" class="headerButton">Sign Up</a>
			
			<%}else{ %>
			<a class="goButton" href="logout.jsp">Logout</a>
			<%} %>
			
			</div>
		</div>
		<div class="col-12" id="navBar">
			<a class="goButton" href="index.jsp">Buy Me</a>
			<a class="goButton" href="market.jsp">Shop</a>
			<%  if(session.getAttribute("Username") != null) { 
				int accountType = (Integer) session.getAttribute("Type");
				if(accountType == 1){
			%> <a class="goButton" href="adminHome.jsp">Admin Home</a><% 
				 }else if(accountType == 2) {
			%> <a class="goButton" href="customerRepHome.jsp">Customer Representative Home</a><% 
			}
			%>
						
			<a class="goButton" href="questions.jsp">Questions</a>
			<a class="goButton" href="createAuction.jsp">Create Auction</a>
			<a class="goButton" href="userProfile.jsp">Profile</a>

			<% } else { %>
			<a class="goButton" href="questions.jsp">Questions</a>
			<% } %>
		</div>
	</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
</body>
</html>