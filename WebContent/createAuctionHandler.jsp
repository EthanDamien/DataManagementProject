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
   		String imageLink = request.getParameter("imageLink"); 
 		String endDate  = request.getParameter("endDate"); 
 		int initialPrice = Integer.parseInt(request.getParameter("initialPrice")); 
		int reservePrice = Integer.parseInt(request.getParameter("reservePrice")); 
		int bidIncrement = Integer.parseInt(request.getParameter("bidIncrement")); 
   		String itemName = request.getParameter("itemName"); 
   		String productDescription = request.getParameter("productDescription"); 
 		String category = request.getParameter("category"); 
 		try {	
 			int auctionID = Auction.createAuction("AuctionID", userID, imageLink, endDate, initialPrice, reservePrice, bidIncrement, itemName, productDescription, category);
        	response.sendRedirect("index.jsp");
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
			System.out.println("error");
 		}
 		    
	%>
	
	
	
	
	
	
	
</body>
</html>