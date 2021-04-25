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
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>BuyMe - Register</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

   <div id = "registrationForm">
        <h1 class = "headerGreetings">Nice to Meet You</h1>
        <form class = "formContainer" action="registrationHandler.jsp" method = "POST">
            <input class = "textField sweep" type="text" id = "email" name = "userEmail" placeholder= "Email" required>
        	<input class = "textField sweep" type="text" id = "username" name = "username" placeholder= "Username" required>
            <input class = "textField sweep" type="password" id = "password" name = "password" placeholder= "Password" required>
            <input class = "loginButton sweep" type="submit" value = "Register" style="margin-top: 10px;">
            <a class = "loginOrRegistration" href="login.jsp">Already have an account? Login here.</a>
        </form>
    </div>
    		<%
			try{
				String temp = (String) session.getAttribute("error");

				if(temp.equals("Email")){%>
					<script>
						alert('Email already exists');
					</script>
				<%
				}
				else if(temp.equals("UsernameError")){%>
				<script>
					alert('Username already exists');
				</script>
			<%
				}session.removeAttribute("error");	 
			}catch (Exception ex) {
			}
				
			%>
 
    <div id ="products" style = "height: 100vw;"></div>
    </div>
</body>
</html>