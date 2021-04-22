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
    <title>BuyMe - Home</title>
</head>
<body>
	
	<%@ include file="./Components/navBar.jsp" %>
	
	<h1 id = "welcome"> Welcome to BuyMe! </h1>
	<div id="products">
		<div class="container" style = "padding-top: 200px;">
			<div class="row">
			<!-- card start -->
			  <a class="col-4 itemCard" href="product.html">
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
			  </a>
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
		<div id = "footer">
		  <div style = "height: 400px"></div>
		  <h4>Data Management Project</h4>
		  <h4>by Ethan Chang, David Lam, Rachael Chin, Kevin Cubillos</h4>
		</div>
	
</body>
</html>