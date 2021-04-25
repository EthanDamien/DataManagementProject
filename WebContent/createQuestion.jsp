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
 	<title>BuyMe - Create Question</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>
	
	<% 
	
	if(session.getAttribute("Username") == null){  %>
	<p>You must be logged in to Create a Question</p>
	<%}else{%>
	<div id = "createQuestion">
        <h1 class = "headerGreetings">Create a Question</h1>
        <form class = "formContainer" action="createQuestionHandler.jsp" method = "POST">
        	<label>Question</label>
        	<input class = "textField sweep" type="text" name = "question" placeholder= "Question" required>
        	
           	<label>Description</label>
           	<input class = "textField sweep" type="text" name = "description" placeholder= "Description" required>
            <input class = "loginButton sweep" type="submit" value = "Submit Question" style="margin-top: 10px;">	
        </form>
    </div>
    <%}%>
    
</body>
</html>

