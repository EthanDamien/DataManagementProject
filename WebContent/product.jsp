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
			<img src="assets/img/chicken.jpg"/>
			<img src="assets/img/chicken.jpg"/>
			<img src="assets/img/chicken.jpg"/>
		</div>
		<% 
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			ResultSet bidRs = null;
			ResultSet rs = Auction.getAuction(Integer.parseInt(request.getParameter("auctionID")));
			boolean expired = false;
				

			rs.next();

			Statement checkExpiry = con.createStatement();
			ResultSet rs2 = checkExpiry.executeQuery("SELECT count(*) AS count FROM auction WHERE CURRENT_TIMESTAMP < AuctionEnd and AuctionID = " + Integer.parseInt(request.getParameter("auctionID")));
            rs2.next();
            if(rs2.getInt("count") < 1){
                //it's expired
				expired = true;
            } 

			
		%>
		<div class="productDescription">
			<h1 class = "itemName"><%=rs.getString("ItemName") %></h1>
				<div class = "desc">
				
					<div class = "desc_row">
						<h3 id = "desc_itemPrice">Current Price is <%=rs.getString("AuctionPrice")%>USD</h3>
					</div>
					
					<div class = "desc_row">
					<h3>Bid History (<%=Auction.numOfBids(Integer.parseInt(request.getParameter("auctionID")))%> Bids)</h3>
					<hr>
						<div id = "history_scrollable">
							<% bidRs = Bid.bidHistory(Integer.parseInt(request.getParameter("auctionID")));
								int i = 0;
								while(bidRs.next()){
									i=1;
							%>
							<div>
								<p><%=bidRs.getString("Username")%> bid <%=bidRs.getDouble("BidAmount")%>USD at <%=bidRs.getString("BidCreatedAt")%></p>
							</div>
							<%
							}

							if(i == 0){
								out.println("No bids yet");
							}
							%>
						</div>
						
					<% 
						if(session.getAttribute("Username") != null) {
					%>
					<hr>
						<% if(!expired){ %>
						<h3>Create Bid</h3>
						<hr>
						<form action="createBidHandler.jsp" method = "POST">
							<input class = "textField sweep" type="number" name = "bidAmount" placeholder= "Bid Amount +<%=rs.getString("BidIncrement")%>" required>
							<input id = "desc_bidButton" class = "bid sweep hvr-bob actionButton anima" type="submit" value = "Bid Now" style="margin-top: 10px;">
							<br>
							<h4>AutoBid (Optional)</h4>
							<div class = "bid sweep hvr-bob actionButton anima" onclick = "dropDown()">Open AutoBid</div>
							<div id = "autobidform" style = "display:none">
								<p>Auto Bid Increment has to surpass or equal <%=rs.getString("BidIncrement")%> for this Auction.</p>
								<h6><strong>AutoBid will possibly bid this amount, be sure you are willing to pay it.</strong></h6>
								<input class = "textField sweep " type="number" name = "autoBidLimit" placeholder= "Auto Bid Limit">			
								<br>
								<input class = "textField sweep" type="number" name = "BidIncrement" placeholder= "Bid Increment (greater than current)">
								<br>     
								
								<input name = "auctionID" type = "hidden" value="<%=request.getParameter("auctionID")%>">
								<input name = "userID" type = "hidden" value="<%=Users.getUserID((String)session.getAttribute("Username")) %>">
							</div>
						</form>
						<%} else{
							int winner = rs.getInt("winnerid");
							if(winner>= 0) {%>
						<h3 style = "color: green">Winner of this auction is <%=Users.getUsername(winner)%></h3>
						<%}
						else{
							%>
							<h3><strong>Auction has ended with no winner</strong></h3>
							<%
						}}%>
					
					<%}else{ %>
					<a class="link" href="login.jsp">Login to Bid!</a>
					<%} %>
					</div>
					<div class = "desc_row">
						<hr>
						<% 
							if(expired){

							
						%> 						
						<h4 id = "desc_itemPrice" style="color: red">End Time: <%=rs.getString("AuctionEnd")%>(Closed) </h4>
						<%
							}
							else{
						%>
						<h4 id = "desc_itemPrice" style="color: green">End Time: <%=rs.getString("AuctionEnd")%> (Open) </h4>
						<%
							}
						%>
					</div>
					<hr>
					<h4>Created by <a href = "profile.jsp?userID=<%=rs.getInt("userID") %>"> <%=Users.getUsername(rs.getInt("userID"))%></a></h4>
					<hr>
					<h4>Description</h4>
					<h6><%=rs.getString("ProductDesc") %></h6>
					<hr>
					<h4>Category</h4>
					<p><%=rs.getString("Category") %> / <%=rs.getString("Subcategory") %></p>
					<hr>
					<h4>Similar Items</h4>
					<% 
					ResultSet validProducts = Auction.getValidProducts(4, rs.getString("Subcategory"));
					i = 0;
					try{
						%>
						<div class="row" style = "padding-top: 10px">
							<!-- card start -->
								<% while(validProducts.next()){
									i = 1;
									int AuctionID = validProducts.getInt("auctionID");
									
									int winner = validProducts.getInt("WinnerID");
									
								%>
								<a class="col-4 itemCard anima" style = "padding-top: 10px;" href="product.jsp?auctionID=<%=AuctionID%>">
									<img src="assets/img/BurberryJacket.jpg"/>
									<h6 class = "itemName"><%=validProducts.getString("itemname")%></h6>
									<div>
									<h6 style="float:left;"><%=validProducts.getDouble("AuctionPrice")%>USD</h6>
									<h6 style="float:right"><%=Auction.numOfBids(AuctionID)%> Bids</h6>
									</div>
									<div style = "background: black; padding-top: 5px;">
									<h6 style="float:left; color: white; padding-left: 10px">Ends At</h6>
									<h6 style="float:right; color: white; background: black; padding-left: 10px"><%=validProducts.getString("AuctionEnd")%></h6>
									</div>
									<div>
										<h6 style = "float: right">from <%=validProducts.getString("username")%></h6>
									</div>
								</a>
								<%}%>
								
							</div>
						<%
					}catch(SQLException se){
						System.out.println(se);
					}
					catch(Exception e){
						System.out.println(e);

					}
					%>
			</div>
		</div>
	</div>
	
	<script>
	function dropDown() {
		var x = document.getElementById("autobidform");
		if(x.style.display === "none"){
			x.style.display = "block";
		}
		else{
			x.style.display = "none";
		}
	}
	</script>
</body>
</html>