<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E107 - Login</title>
</head>
<body>
    
    <div class="loginContainer">
        <h1>E107</h1>
        <form action="loginHandler.jsp" input = "text" method = "POST">
            <%-- required --%>
            <input type="text" id = "username" name = "username" placeholder= "Username" required>
            <input type="text" id = "password" name = "password" placeholder= "Password" required>
            <input type="submit" value = "Submit">
        </form>
    </div>
    <a href="#">Don't have an account? Register here.</a>
</body>
</html>/