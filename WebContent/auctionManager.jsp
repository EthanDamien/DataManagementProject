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
<title>Auction Manager</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<h1> Auction Manager</h1>
	<table class="table-sm table-dark">
	    	<tr>
			   <th>Auction ID</th>
			   <th>Seller ID</th>	
			   <th>Seller Name</th>	
			   <th>Item Name</th>
			   <th>Price</th>
			   <th>Product Description</th>
			   <th>Category</th>
			   
			</tr>
	<%
		ResultSet rs = Auction.getAllAuctions();
		while(rs.next()) {
	%>
	<tr>
		<td><%=rs.getInt("AuctionID")%></td>
		<td><%=rs.getInt("UserID")%></td>
		<td><%= Users.getUsername(rs.getInt("UserID"))%></td>
		<td><%=rs.getString("ItemName")%></td>
		<td>$<%=rs.getDouble("AuctionPrice")%></td>
		<td><%=rs.getString("ProductDesc")%></td>
		<td><%=rs.getString("Category")%></td>
				
		<td> 
			<form action="deleteAuctionHandler.jsp" method = "POST">		
				<input name = "deleteAuction" type = "hidden" value="<%= rs.getInt("AuctionID")%>">
				<input class = "sweep" type="submit" value = "Delete Auction">
			</form>
		</td>
	</tr>
	<%} %>	
</body>
</html>