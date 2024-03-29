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
  <title>BuyMe - Create Auction</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<% if(session.getAttribute("Username") == null){  %>
	<p>You must be logged in to Create Auction</p>
	<%} else{ %>
	 
	<div id = "createAuction">
        <form class = "formContainer" action="createAuctionHandler.jsp" method = "POST">
			<h1 class = "headerGreetings">Add Listing</h1>
        	<input class = "textField sweep" type="text" name = "itemName" placeholder= "Item Name" required>
            <input class = "textField sweep" type="text" name = "price" placeholder= "Initial Price" required>
            <input class = "textField sweep" type="text" name = "reservePrice" placeholder= "Reserve Sell Price" required>
            <input class = "textField sweep" type="text" name = "bidIncrement" placeholder= "Bid Increment" required> 
            <input class = "textField sweep" type="text" name = "productDescription" placeholder= "Product Description" required>
            <select name = "category">
            	<optgroup label = "Clothes">
            		<option value="pants">Pants</option>
            	    <option value="hoodies">Hoodies</option>
            	    <option value="shorts">Shorts</option>
            	    <option value="tees">Tees</option>
            	</optgroup>
            	 
            	 <optgroup label = "Shoes">
            		<option value="running">Running</option>
            	    <option value="hiking">Hiking</option>
            	    <option value="workout">Workout</option>
            	    <option value="casual">Casual</option>
            	</optgroup>
            	
            	
            	<optgroup label = "Jewelery">
            		<option value="necklace">Necklace</option>
            	    <option value="bracelet">Bracelet</option>
            	    <option value="ring">Ring</option>
            	    <option value="watch">Watch</option>
            	</optgroup>
            	
            	<optgroup label = "Electronics">
            		<option value="phone">Phone</option>
            	    <option value="tablet">Tablet</option>
            	    <option value="computer">Computer</option>
            	    <option value="laptop">Laptop</option>
            	</optgroup>
            </select>
            
            <input class = "textField sweep" type="text" name = "endDate" placeholder= "End Date YYYY-MM-DD" required>
            <input class = "loginButton sweep" type="submit" value = "Submit" style="margin-top: 10px;">	
        </form>
    </div>
    <%}%>
    
</body>
</html>