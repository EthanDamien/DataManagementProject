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
	<link rel = "stylesheet" type = "text/css" href="styles.css">
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
		<div style= "position: fixed; width: 100vw; overflow-x: hidden;">
			<div class="col-12" id="header" style="z-index: 1">
				<img src="E107logo.png" style="height: 98px; float: left"/>
				<input id="searchbar" type="text" name="search" placeholder="Search.." style="margin-top: 30px;"/>
				<a href="/" id="gobutton" style="margin-top: 30px;">Go</a>
				<div style="float: right;">
				<a href="/" class="headerbutton">Log In</a>
				<a href="/" class="headerbutton">Sign Up</a>
				</div>
			</div>
			<div class="col-12" id="nav2" style="z-index: -1">
				<a href="/" id="gobutton">Profile</a>
				<a href="/" id="gobutton">Account</a>
				<a href="/" id="gobutton">Categories</a>
				<a href="/" id="gobutton">Sell</a>
				<a href="/" id="gobutton" style="float: right;">About Us</a>
			</div>
		</div>
		<div id= "products" style=" background-color: bisque;"></div>
		Hello World1 <!-- the usual HTML way -->
		<% out.println("Hello World2"); %> <!-- output the same thing, but using 
	                                      jsp programming -->
							  
		<br>
	
		 <!-- Show html form to i) display something, ii) choose an action via a 
		  | radio button -->
		<!-- forms are used to collect user input 
			The default method when submitting form data is GET.
			However, when GET is used, the submitted form data will be visible in the page address field-->
		<form method="post" action="show.jsp">
		    <!-- note the show.jsp will be invoked when the choice is made -->
			<!-- The next lines give HTML for radio buttons being displayed -->
		  <input type="radio" name="command" value="beers"/>Let's have a beer! Click here to see the beers.
		  <br>
		  <input type="radio" name="command" value="bars"/>Let's go to a bar! Click here to see the bars.
		    <!-- when the radio for bars is chosen, then 'command' will have value 
		     | 'bars', in the show.jsp file, when you access request.parameters -->
		  <br>
		  <input type="submit" value="submit" />
		</form>
		<br>
	
	An existing bar wants to sell an existing beer! Type the bar, the beer and the price of the beer:
	<br>
		<form method="get" action="sellsNewBeer.jsp">
			<table>
				<tr>    
					<td>Bar</td><td><input type="text" name="barvalia"></td>
				</tr>
				<tr>
					<td>Beer</td><td><input type="text" name="beer"></td>
				</tr>
				<tr>
					<td>Price</td><td><input type="text" name="price"></td>
				</tr>
			</table>
			<input type="submit" value="Add the selling beer!">
		</form>
	<br>
	
	
	Alternatively, lets type in a new bar, a new beer, and a price that this bar will sell the beer for.
	<br>
		<form method="post" action="newBarBeerPrice.jsp">
		<table>
		<tr>    
		<td>Bar</td><td><input type="text" name="bar"></td>
		</tr>
		<tr>
		<td>Beer</td><td><input type="text" name="beer"></td>
		</tr>
		<tr>
		<td>Price</td><td><input type="text" name="price"></td>
		</tr>
		</table>
		<input type="submit" value="Add me!">
		</form>
	<br>
	
	Or we can query the beers with price:
	<br>
		<form method="get" action="query.jsp">
			<select name="price" size=1>
				<option value="3.0">$3.0 and under</option>
				<option value="5.0">$5.0 and under</option>
				<option value="8.0">$8.0 and under</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
	<br>

</body>
</html>