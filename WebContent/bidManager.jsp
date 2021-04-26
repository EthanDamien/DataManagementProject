<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Bid Manager</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>
	<form>
      <input type="text" name="auctionID" placeholder="Search Auction ID">
      <button type="submit">Search</button>
    </form>
    
	<% 	try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	String auctionID = request.getParameter("auctionID");
	    	
	    	rs = st.executeQuery("SELECT * FROM bid WHERE AuctionID LIKE'%"+auctionID+"%'"); 	
	 %>
	 <table class="table-sm table-dark">
	    <tr>
	    	<th>User ID</th>
	    	<th>User Name</th>
	    	<th>Bid ID</th>
			<th>Auction ID</th>
			<th>Bid Amount</th>
			<th>Bid Created</th>
		</tr>
	<% 
	    while(rs.next()) {
	%>
	<tr> 
		<td><%=rs.getInt("UserID")%></td>
		<td><%= Users.getUsername(rs.getInt("UserID"))%></td>
		<td><%=rs.getInt("BidID")%></td>
		<td><%=rs.getInt("AuctionID")%></td>
		<td>$<%=rs.getDouble("BidAmount")%></td>
		<td><%=rs.getString("BidCreatedAt")%></td>
		<td> 
			<form action="deleteBidHandler.jsp" method = "POST">		
				<input name = "auctionID" type = "hidden" value="<%=rs.getInt("AuctionID")%>">
				<input name = "bidID" type = "hidden" value="<%=rs.getInt("BidID")%>">
				
				<input class = "sweep" type="submit" value = "Delete Bid">
			</form>
		</td>	
	</tr>
			<%} %> </table><% 
	}
	catch(SQLException se){
	}
	catch(Exception e){
	}
	%>
	
	<h3> All Bids</h3>
	 <table class="table-sm table-dark">
	    	<tr>
			  	<th>User ID</th>
		    	<th>User Name</th>
		    	<th>Bid ID</th>
				<th>Auction ID</th>
				<th>Bid Amount</th>
				<th>Bid Created</th>
			</tr>
			
			<%  ResultSet rsAll = Bid.getAllBids(); 
				while(rsAll.next()){
			%>
			<tr> 
				<td><%=rsAll.getInt("UserID")%></td>
				<td><%= Users.getUsername(rsAll.getInt("UserID"))%></td>
				<td><%=rsAll.getInt("BidID")%></td>
				<td><%=rsAll.getInt("AuctionID")%></td>
				<td>$<%=rsAll.getDouble("BidAmount")%></td>
				<td><%=rsAll.getString("BidCreatedAt")%></td>
				<td> 
					<form action="deleteBidHandler.jsp" method = "POST">		
						<input name = "auctionID" type = "hidden" value="<%=rsAll.getInt("AuctionID")%>">
						<input name = "bidID" type = "hidden" value="<%=rsAll.getInt("BidID")%>">
						
						<input class = "sweep" type="submit" value = "Delete Bid">
					</form>
				</td>	
			</tr>
			<%} %>
			
	 </table>
</body>
</html>