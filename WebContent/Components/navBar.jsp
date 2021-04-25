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
			<a href = "index.jsp">
				<img src="styles/E107logo.png" style="height: 98px; float: left"/>
			</a>
			<div style="float: right;">


			<% if(session.getAttribute("Username") == null){%>

			<a id = "login" href="login.jsp" class="headerButton">Log In</a>
			<a id = "register" href="registration.jsp" class="headerButton">Sign Up</a>
			
			<%}else{ %>
			<a class="goButton anima" href="logout.jsp">Logout</a>
			<%} %>
			
			</div>
		</div>
		<div class="col-12" id="navBar">
			<%  if(session.getAttribute("Username") != null) { 
				int accountType = (Integer) session.getAttribute("Type");
				if(accountType == 1){
			%> <a class="goButton anima" href="adminHome.jsp">Admin Home</a><% 
				 }else if(accountType == 2) {
			%> <a class="goButton anima" href="customerRepHome.jsp">Customer Representative Home</a><% 
			}
			%>
						
			<a class="goButton anima" href="questions.jsp">Questions</a>
			<% if(accountType == 3){%>
			<a class="goButton anima" href="createAuction.jsp">Add Listing +</a>
			<a class="goButton anima" href="yourProfile.jsp">My Profile</a>
			<%} %>
			

			<% } else { %>
			<a class="goButton anima" href="questions.jsp">Questions</a>
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