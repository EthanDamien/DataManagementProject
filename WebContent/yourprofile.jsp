<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--meta-->
	<meta charset = "utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1, minimum-scale=1">
  <!--Link bootstrap, css and fonts-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Group 107</title>
	</head>
	
	<body>
		<%@ include file="./Components/navBar.jsp" %>
		<div id="products">
            <br>
			<div class = "container">
        <%String username = (String) session.getAttribute("Username");%>
				<h1>My Profile (<%=username%>)</h1>
          <%
          int userID = Users.getUserID(username); 
          ResultSet validProducts = Auction.auctionsOwnedBy(userID);
          %>
                <hr>
                <div class ="row">
                    <div class = "col-9">
                        <div class = "desc_row">
                            <h3 id = "desc_itemPrice">My Listings</h3>
                            <a href = "createAuction.jsp"id = "desc_bidButton" class = "hvr-bob actionButton">Add Listing +</a>
                        </div>
                        <br>
                        <div class="container" >
                          <div class="row">
                        <!-- card start -->
                            <% while(validProducts.next()){
                              int AuctionID = validProducts.getInt("auctionID"); 
                            %>
                            <a class="col-4 itemCard" href="product.jsp?auctionID=<%=AuctionID%>">
                              <img src="assets/img/BurberryJacket.jpg"/>
                              <h4 class = "itemName"><%=validProducts.getString("itemname")%></h4>
                              <div>
                              <h4 style="float:left;"><%=validProducts.getDouble("AuctionPrice")%>USD</h4>
                              <h4 style="float:right"><%=Auction.numOfBids(AuctionID)%> Bids</h4>
                              </div>
                              <div>
                              <h6 style="float:left">Ends At</h6>
                              <h6 style="float:right; color: red"><%=validProducts.getString("AuctionEnd")%></h6>
                              </div>
                              <div>
                                <h6 style = "float: right">from <%=validProducts.getString("username")%></h6>
                              </div>
                            </a>
                            <%}%>
                          
                          </div>
                        </div>
                    </div>
                    <div class = "col-3 profileHistory">
                        <h4>My History</h4>
                        <div id = "history_scrollable2">
                          <% ResultSet bidRs = Bid.userBidHistory(userID);
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
                        
                    </div>
                </div>
                
			</div>
            <div id = "footer">
                <div style = "height: 400px"></div>
                <h4>Data Management Project</h4>
                <h4>by Ethan Chang, David Lam, Rachael Chin, Kevin Cubillos</h4>
              </div>
        </div>

</body>
</html>