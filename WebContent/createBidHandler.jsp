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
    String bidLimit = request.getParameter("autoBidLimit");
	String increment = request.getParameter("BidIncrement");

    Double bidLim = 0.0;
    Double increm = 0.0;
    if(bidLimit.length() < 1 || increment.length() < 1){
        System.out.println("Nothing in here");
        
    }
    else{
        bidLim = Double.parseDouble(bidLimit);
        increm = Double.parseDouble(increment); 
    }

    ResultSet rs = Auction.getAuction(auctionID);

    if(bidLim < price && bidLim != 0.0){
        out.println("What are you stupid?");
        out.println("<a href='product.jsp?auctionID="+auctionID+"'>Go back to Product</a>");
        return;
    }
    rs.next();
    Double currentIncrement = rs.getDouble("BidIncrement");
    System.out.println(currentIncrement);

    if(currentIncrement > increm && increm != 0.0){
        out.println("Can you read?");
        out.println("<a href='product.jsp?auctionID="+auctionID+"'>Go back to Product</a>");
        return;
    }
	
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
				
		int success = Bid.createBid(auctionID, userID, price, bidLim, increm);
        
        if(success == 0){
            out.println("Cannot place bid that's lower than the current price + increment");
			out.println("<a href='product.jsp?auctionID="+auctionID+"'>Go back to Product</a>");
			return;
        }
    	
        response.sendRedirect("product.jsp?auctionID=" + Integer.toString(auctionID));
	
		return;
		
	
		
	} catch(Exception e){
		
	}
	
			
	
%>
</body>
</html>