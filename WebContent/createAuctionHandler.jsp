<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Auction Handler</title>
</head>
<body>
 	<%
		int userID = Users.getUserID((String)session.getAttribute("Username")); 
 		String endDate  = request.getParameter("endDate") + " 23:59:59"; 
 		System.out.println(endDate);
 		int price = Integer.parseInt(request.getParameter("price")); 
		int reservePrice = Integer.parseInt(request.getParameter("reservePrice")); 
		int bidIncrement = Integer.parseInt(request.getParameter("bidIncrement")); 
   		String itemName = request.getParameter("itemName"); 
   		String productDescription = request.getParameter("productDescription"); 
 		String category = request.getParameter("category"); 
 		try {	
 			int auctionID = Auction.createAuction("AuctionID", userID, endDate, price, reservePrice, bidIncrement, itemName, productDescription, category);
        	response.sendRedirect("product.jsp?auctionID=" + Integer.toString(auctionID));
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
 		}
 		    
	%>
	
	
	
	
	
	
	
</body>
</html>