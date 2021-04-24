<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
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
<title>Buy Me - Product</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<div id="products">
		<div class="productImages">
			<img src="assets/img/chicken.jpg"/>
		</div>
		<% 
			ResultSet bidRs = null;
			ResultSet rs = Auction.getAuction(Integer.parseInt(request.getParameter("auctionID")));
			rs.next();
		%>
		<div class="productDescription">
			<h1 class = "itemName"><%=rs.getString("ItemName") %></h1>
				<div class = "desc">
				
					<div class = "desc_row">
						<h3 id = "desc_itemPrice">Current Bid: <%=rs.getString("AuctionPrice")%>USD</h3>
						<button id = "desc_bidButton" class = "hvr-bob actionButton">Bid Now</button>
					</div>
					
					<div class = "desc_row">
						<button id = "desc_bidButton" class = "hvr-bob actionButton">History</button>
						<% bidRs = Bid.bidHistory(Integer.parseInt(request.getParameter("auctionID")));
							while(bidRs.next()){
				
						%>
						

						<div>
							<p><%=bidRs.getString("Username")%> bid <%=bidRs.getDouble("BidAmount")%>USD at <%=bidRs.getString("BidCreatedAt")%></p>
						</div>
						<%
						}
						%>
			
						
					<% 
						if(session.getAttribute("Username") != null) {
					%>
					
					<p>Auto Bid Increment: <%=rs.getString("BidIncrement")%></p>
					<form action="createBidHandler.jsp" method = "POST">
						<input class = "textField sweep" type="number" name = "bidAmount" placeholder= "Bid Amount" required>
						<br>
                        <h4>AutoBid (Optional)</h4>
						<h6><strong>This amount will possibly be bid if a bid war exists</strong></h6>
			            <input class = "textField sweep " type="number" name = "autoBidLimit" placeholder= "Auto Bid Limit">			
			            <br>
                        <input class = "textField sweep" type="number" name = "BidIncrement" placeholder= "Bid Increment (greater than current)">
                        <br>     
			            <input id = "desc_bidButton" class = "bid sweep hvr-bob actionButton" type="submit" value = "Bid Now" style="margin-top: 10px;">
			            <input name = "auctionID" type = "hidden" value="<%=request.getParameter("auctionID")%>">
			            <input name = "userID" type = "hidden" value="<%=Users.getUserID((String)session.getAttribute("Username")) %>">
					</form>
					
					<%}else{ %>
					<a class="link" href="login.jsp">Login to Bid!</a>
					<%} %>
					</div>
					<div class = "desc_row">
						<h4 id = "desc_itemPrice">Start Date <strong>Today</strong></h4>
						<br>     
 			            <br>     						
						<h4 id = "desc_itemPrice">End Date <strong><%=rs.getString("AuctionEnd")%></strong></h4>
						
						<button id = "desc_bidButton" class = "hvr-bob actionButton">Watch</button>
					</div>
					
					<hr>
					<h5>Description</h5>
					<h6><%=rs.getString("ProductDesc") %></h6>
					<hr>
					<h5><%=rs.getString("Category") %></h5>
			</div>
		</div>
	</div>
		
</body>
</html>