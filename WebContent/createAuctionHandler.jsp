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
 		double price = Double.parseDouble(request.getParameter("price")); 
		double reservePrice = Double.parseDouble(request.getParameter("reservePrice")); 
		double bidIncrement = Double.parseDouble(request.getParameter("bidIncrement")); 
   		String itemName = request.getParameter("itemName"); 
   		String productDescription = request.getParameter("productDescription"); 
 		String subCategory = request.getParameter("category"); 
		String category = "";

 		if(subCategory.equals("pants") || subCategory.equals("hoodies") || subCategory.equals("shorts") || subCategory.equals("tees"))
 			category = "clothes";
 		else if(subCategory.equals("running") || subCategory.equals("hiking") || subCategory.equals("workout") || subCategory.equals("casual"))
 			category = "shoes";
 		else if(subCategory.equals("necklace") || subCategory.equals("bracelet") || subCategory.equals("ring") || subCategory.equals("watch"))
 			category = "jewelery";
 		else if(subCategory.equals("phone") || subCategory.equals("tablet") || subCategory.equals("computer") || subCategory.equals("laptop"))
 			category = "electronics";

 		try {	
 			int auctionID = Auction.createAuction("AuctionID", userID, endDate, price, reservePrice, bidIncrement, itemName, productDescription, category, subCategory);

        	response.sendRedirect("product.jsp?auctionID=" + Integer.toString(auctionID));
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
 		}
 		    
	%>
	
	
	
	
	
	
	
</body>
</html>