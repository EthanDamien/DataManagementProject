<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<%
	int auctionID = Integer.parseInt(request.getParameter("auctionID"));
	int userID = Integer.parseInt(request.getParameter("userID"));
	double price = Double.parseDouble(request.getParameter("bidAmount"));

	
	try { 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement st = con.createStatement();
				
		Bid.createBid(auctionID, userID, price);

    	response.sendRedirect(request.getContextPath() + "/product.jsp?auctionID=" + Integer.toString(auctionID));
	
		return;
		
	
		
	} catch(Exception e){
		
	}
	
			
	
%>
</body>
</html>