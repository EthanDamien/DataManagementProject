<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<title>BuyMe - Create Auction</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<% if(session.getAttribute("Username") == null){  %>
	<p>You must be logged in to Create Auction</p>
	<%} else{ %>
	 
	<div id = "createAuction">
        <h1 class = "headerGreetings">Nice to Meet You</h1>
        <form class = "formContainer" action="createAuctionHandler.jsp" method = "POST">
        	<input class = "textField sweep" type="text" name = "itemName" placeholder= "Item Name" required>
            <input class = "textField sweep" type="text" name = "imageLink" placeholder= "Image" required>
            <input class = "textField sweep" type="text" name = "initialPrice" placeholder= "Intial Price" required>
            <input class = "textField sweep" type="text" name = "reservePrice" placeholder= "Reserve Sell Price" required>
            <input class = "textField sweep" type="text" name = "bidIncrement" placeholder= "Bid Increment" required> 
            <input class = "textField sweep" type="text" name = "productDescription" placeholder= "Product Description" required>
            <input class = "textField sweep" type="text" name = "category" placeholder= "Category Name" required>
            <input class = "textField sweep" type="text" name = "endDate" placeholder= "End Date" required>
            <input class = "loginButton sweep" type="submit" value = "Submit" style="margin-top: 10px;">	
        </form>
    </div>
    <%}%>
    
</body>
</html>