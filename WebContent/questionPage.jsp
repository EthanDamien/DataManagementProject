<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
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
<title>Buy Me - Product</title>
</head>
<body>
		<%@ include file="./Components/navBar.jsp" %>

		
		<% 		
			ResultSet rs = Question.getQuestion(Integer.parseInt(request.getParameter("questionID")));
			rs.next();
		%>
		<h4>Question by <%=rs.getString("UserID")%></h4>
		<p><%=rs.getString("Question")%> </p>
		<h4>Description</h4>
		<p><%=rs.getString("Description")%> </p>
		<h4>Answer</h4>
		<p> 
		<% 
			if(rs.getInt("Answered") == 1)
				out.println(rs.getString("Response"));
		%>
		</p>
		
		

		
</body>
</html>