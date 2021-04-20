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
		
		ResultSet userRS = null;
    	PreparedStatement userPS = null;
    	
		String queryUser = "SELECT * from auction WHERE UserID = ? and AuctionID = ?";
        userPS = con.prepareStatement(queryUser);
        userPS.setInt(1, userID);
        userPS.setInt(2, auctionID);

        userRS = userPS.executeQuery();
        
		//Check if the Username Exists in the system
		if(userRS.next())
		{
			out.println("There was an error creating a bid. You possibly own this bid.");
			out.println("<a href='product.jsp?auctionID="+auctionID+"'>Go back to Product</a>");
			return;
		}
		
		Statement st = con.createStatement();
				
		Bid.createBid(auctionID, userID, price);

    	response.sendRedirect("product.jsp?auctionID=" + Integer.toString(auctionID));
	
		return;
		
	
		
	} catch(Exception e){
		
	}
	
			
	
%>
</body>
</html>