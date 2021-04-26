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
    <title>BuyMe - Home</title>
</head>
<body>
	
	<%@ include file="./Components/navBar.jsp" %>
	<%
	
	if(session.getAttribute("Username") != null){
	%>
		<%@ include file="./Components/alertPopUp.jsp" %>

		<%
	}

	%>
	<div id="products">
		<%
			
		%>

		<div class="container" style = "padding-top: 20px;">
		<div class = "row">
		<form action="index.jsp" method = "POST">
			<h6 style=" padding-top: 3px; float: left;">Show</h6>
			<select id = "subcat" name = "subcategory" style = "margin-left: 5px; margin-right: 5px; float: left;">
				<option value = "everything">Everything</option>
				<optgroup label = "Clothes">
					<option id="pants" value="pants">Pants</option>
					<option id="hoodies" value="hoodies">Hoodies</option>
					<option id="shorts" value="shorts">Shorts</option>
					<option id="tees" value="tees">Tees</option>
				</optgroup>
				
				<optgroup label = "Shoes">
					<option id="running" value="running">Running</option>
					<option id="hiking" value="hiking">Hiking</option>
					<option id="workout" value="workout">Workout</option>
					<option id="casual" value="casual">Casual</option>
				</optgroup>
				
				
				<optgroup label = "Jewelery">
					<option id="necklace" value="necklace">Necklace</option>
					<option id="bracelet" value="bracelet">Bracelet</option>
					<option id="ring" value="ring">Ring</option>
					<option id="watch" value="watch">Watch</option>
				</optgroup>
				
				<optgroup label = "Electronics">
					<option id="phone" value="phone">Phone</option>
					<option id="tablet" value="tablet">Tablet</option>
					<option id="computer" value="computer">Computer</option>
					<option id="laptop" value="laptop">Laptop</option>
				</optgroup>
			</select>
			
			<h6 style=" padding-top: 3px; float: left;"> and Sort By</h6>

			<select id = "order" name = "orderby" style = "margin-left: 5px; float: left;">
				<%-- 1 --%>
				<option id = "1" value = "1">Time Left (Ascending)</option>
				<%-- 2 --%>
				<option id = "2" value = "2">Time Left (Descending)</option>
				<%-- 3 --%>
				<option id = "3" value = "3">Price (Low To High)</option>
				<%-- 4 --%>
				<option id = "4" value = "4">Price (High To Low)</option>
			</select>
			<input id = "submitQuerybut" class = "bid sweep hvr-bob actionButton2 anima" type="submit" value = "Submit" style="margin-left: 10px;">
			</form>
		</div>

		<% 
		ResultSet validProducts = Auction.getValidProducts(1, "everything");
		int i = 0;
		try{
			
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	    	Statement st = con.createStatement();
			String subcategory = request.getParameter("subcategory");
	    	int orderby = Integer.parseInt(request.getParameter("orderby"));
			
			validProducts = Auction.getValidProducts(orderby, subcategory);

			%>
			<div class="row" style = "padding-top: 30px">
				<!-- card start -->
					<% while(validProducts.next()){
						i = 1;
						int AuctionID = validProducts.getInt("auctionID");
						
						int winner = validProducts.getInt("WinnerID");
						
					%>
					<a class="col-4 itemCard anima" style = "padding-top: 10px;" href="product.jsp?auctionID=<%=AuctionID%>">
						<img src="assets/img/BurberryJacket.jpg"/>
						<h4 class = "itemName"><%=validProducts.getString("itemname")%></h4>
						<div>
						<h4 style="float:left;"><%=validProducts.getDouble("AuctionPrice")%>USD</h4>
						<h4 style="float:right"><%=Auction.numOfBids(AuctionID)%> Bids</h4>
						</div>
						<div style = "background: black; padding-top: 5px;">
						<h6 style="float:left; color: white; padding-left: 10px">Ends At</h6>
						<h6 style="float:right; color: white; background: black; padding-right: 10px;"><%=validProducts.getString("AuctionEnd")%></h6>
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
		<% 
		if(i == 0){
			%>
			<div class="row" style = "padding-top: 30px">
				<!-- card start -->
					<% while(validProducts.next()){
						i = 1;
						int AuctionID = validProducts.getInt("auctionID");
						
						int winner = validProducts.getInt("WinnerID");
						
					%>
					<a class="col-4 itemCard anima" style = "padding-top: 10px;" href="product.jsp?auctionID=<%=AuctionID%>">
						<img src="assets/img/BurberryJacket.jpg"/>
						<h4 class = "itemName"><%=validProducts.getString("itemname")%></h4>
						<div>
						<h4 style="float:left;"><%=validProducts.getDouble("AuctionPrice")%>USD</h4>
						<h4 style="float:right"><%=Auction.numOfBids(AuctionID)%> Bids</h4>
						</div>
						<div style = "background: black; padding-top: 5px;">
						<h6 style="float:left; color: white; padding-left: 10px">Ends At</h6>
						<h6 style="float:right; color: white; background: black; padding-right: 10px;"><%=validProducts.getString("AuctionEnd")%></h6>
						</div>
						<div>
							<h6 style = "float: right">from <%=validProducts.getString("username")%></h6>
						</div>
					</a>
					<%}%>
					
				</div>
		<%
		}
		%>
	</div>
	</div>
	<div id = "footer">
		<div style = "height: 400px"></div>
		<h4>Data Management Project</h4>
		<h4>by Ethan Chang, David Lam, Rachael Chin, Kevin Cubillos</h4>
	</div>
	<script>
		document.getElementById('subcat').onchange = function() {
			localStorage.setItem('selectedItem', document.getElementById('subcat').value);
		};

		if (localStorage.getItem('selectedItem')) {
			document.getElementById(localStorage.getItem('selectedItem')).selected = true;
		};

		document.getElementById('order').onchange = function() {
			localStorage.setItem('orderItem', document.getElementById('order').value);
		};

		if (localStorage.getItem('orderItem')) {
			document.getElementById(localStorage.getItem('orderItem')).selected = true;
		};

	</script>
</body>
</html>

<%-- <h6 style = "float: right">from <%=validProducts.getString("username")%></h6>
						<%
							if(winner == -2){

							
						%>
						<h6 style = "float: right"> Winner: <%=Users.getUsername(validProducts.getInt("WinnerID"))%></h6>
						<%
							else{

						%>
						<h6 style = "float: right"> No one won</h6>
						<% }%> --%>