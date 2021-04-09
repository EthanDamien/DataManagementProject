<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
  
  <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Group 107</title>
	</head>
	
	<body>
		<div class= "hheader">
			<div class="col-12" id="header">
                <a href = "productpage.html">
                    <img src="styles/E107logo.png" style="height: 98px; float: left"/>
                </a>
				<input id="searchBar" type="text" name="search" placeholder="Search.." style="margin-top: 30px;"/>
				<a href="/" id="goButton" style="margin-top: 30px;">Go</a>
				<div style="float: right;">
				<a href="loginPage.jsp" class="headerButton">Log In</a>
				<a href="/" class="headerButton">Sign Up</a>
				</div>
			</div>
			<div class="col-12" id="navBar">
				<a href="profileedit.html" id="goButton">Profile</a>
				<a href="/" id="goButton">Categories</a>
				<a href="addlisting.html" id="goButton">Sell</a>
				<a href="/" id="goButton" style="float: right;">About Us</a>
			</div>
		</div>
		<div class = "whitespace"></div>
		<div id="products">
            <br>
			<div class = "container">
				<h1>Kevin Jones</h1>
                <h2>Seller from Irvine, California</h2>
                <hr>
                <div class ="row">
                    <div class = "col-9">
                        <h3>Available Listings</h3>
                        <br>
                        <div class="container" >
                            <div class="row">
                            <!-- card start -->
                              <div class="col-4 itemCard">
                                <img src="assets/img/BurberryJacket.jpg"/>
                                <h4 class = "itemName">Burberry Work Jacket</h4>
                                <div>
                                  <h4 style="float:left;">99.99USD</h4>
                                  <h4 style="float:right">3 Bids</h4>
                                </div>
                                <div>
                                  <h6 style="float:left; color: red">15mins left</h6>
                                  <h6 style="float:right">Kevin Jones</h6>
                                </div>
                                <h6>Buy Now at 479.99USD</h6>
                              </div>
                              <!-- card end -->
                              <div class="col-4 itemCard">
                                <img src="assets/img/DiorJacket.webp"/>
                                <h4 class = "itemName">Dior Puffer</h4>
                                <div>
                                  <h4 style="float:left;">99.99USD</h4>
                                  <h4 style="float:right">3 Bids</h4>
                                </div>
                                <div>
                                  <h6 style="float:left; color: red">15mins left</h6>
                                  <h6 style="float:right">Kevin Jones</h6>
                                </div>
                                <h6>Buy Now at 479.99USD</h6>
                              </div>
                              <div class="col-4 itemCard">
                                <img src="assets/img/Helmut Jacket.jpg"/>
                                <h4 class = "itemName">Helmut Lang Leather Jacket</h4>
                                <div>
                                  <h4 style="float:left;">99.99USD</h4>
                                  <h4 style="float:right">3 Bids</h4>
                                </div>
                                <div>
                                  <h6 style="float:left; color: red">15mins left</h6>
                                  <h6 style="float:right">Kevin Jones</h6>
                                </div>
                                <h6>Buy Now at 479.99USD</h6>
                              </div>
                              <div class="col-4 itemCard">
                                <img src="assets/img/WeekndJacket.png"/>
                                <h4 class = "itemName">The Weeknd Daniel Arsham Jacket</h4>
                                <div>
                                  <h4 style="float:left;">99.99USD</h4>
                                  <h4 style="float:right">3 Bids</h4>
                                </div>
                                <div>
                                  <h6 style="float:left; color: red">15mins left</h6>
                                  <h6 style="float:right">Kevin Jones</h6>
                                </div>
                                <h6>Buy Now at 479.99USD</h6>
                              </div>
                          </div>
                        </div>
                    </div>
                    <div class = "col-3 profileHistory">
                        <h4>Kevin's History</h4>
                        <p>-Won Tesla Model X for $79,000, 15mins ago</p>
                        <p>-Bid on Tesla Model X for $79,000, 30mins ago</p>
                        
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