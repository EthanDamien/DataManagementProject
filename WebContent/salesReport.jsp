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
<title> Sales Report</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<%
	
		String salesReportType = request.getParameter("salesReportType");
		System.out.println(salesReportType);
		
		if(salesReportType.equals("totalEarnings")) { 
		ResultSet rs = salesReport.totalEarnings();
		
		%>
		
		<h2> Sales Report for Total Earnings</h2>
		<table class="table-sm table-dark">
			<tr>
			   <th>Total Earnings</th>
			</tr>
			
		<% 
	
			
		while(rs.next()) {%>
			<tr> 
				<td>$<%=rs.getString("totalEarnings")%></td>
			</tr>
		
		<%} %></table><% } 
		else if(salesReportType.equals("earningsPerItem")) { 
			ResultSet rs = salesReport.earningsPerItem();
		%>
		<h2> Sales Report for Earnings Per Item</h2>
		<table class="table-sm table-dark">
			<tr>
			   <th>Earnings Per Item</th>
			   <th>Item Category</th>
			</tr>
		<% 
		
		while(rs.next()) {%>
		<tr> 
			<td><%=rs.getString("EarningsPerItem")%></td>
			<td><%=rs.getString("Category")%></td>
			
		</tr>
		<%} %></table><%
		
			
		}else if(salesReportType.equals("earningsPerItemType")){
			ResultSet rs = salesReport.earningsPerItemType();
			%>
			<h2> Sales Report for Earnings Per Item Type</h2>
			<table class="table-sm table-dark">
				<tr>
				   <th>Earnings Per Item</th>
				   <th>Item Subcategory</th>
				</tr>
			<% 
			
			while(rs.next()) {%>
			<tr> 
				<td><%=rs.getString("EarningsPerItemType")%></td>
				<td><%=rs.getString("Subcategory")%></td>
				
			</tr>
			<%} %></table><%
		}else if(salesReportType.equals("earningsPerUser")){
			ResultSet rs = salesReport.earningsPerUser();
			%>
			<h2> Sales Report for Earnings Per User</h2>
			<table class="table-sm table-dark">
				<tr>
					<td>Username</td>
					<th>UserID</th>
				   	<th>Earnings Per User</th>
				</tr>
			<% 
			
			while(rs.next()) {%>
			<tr> 
			
				<td> <%= Users.getUsername( Integer.parseInt( rs.getString("UserID"))) %></td>
				<td><%=rs.getString("UserID") %></td>
				<td>$<%=rs.getString("EarningPerUser")%></td>
			</tr>
			<%} %></table><%
		}else if(salesReportType.equals("bestItem")){
			ResultSet rs = salesReport.bestItem();
			%>
			<h2> Sales Report for Best Items</h2>
			<table class="table-sm table-dark">
				<tr>
					<th>Item Name</th>
				   	<th>Number of Items Sold</th>
				</tr>
			<% 
			
			while(rs.next()) {%>
			<tr> 
				<td><%=rs.getString("ItemName")%></td>
				<td><%=rs.getString("NumberOfItems")%></td>
			</tr>
			<%} %></table><%
		}else if(salesReportType.equals("bestBuyer")){
			ResultSet rs = salesReport.bestBuyer();
			%>
			<h2> Sales Report for Best Buyer</h2>
			<table class="table-sm table-dark">
				<tr>
					<th>Best Buyer Username</th>
				   <th>Best Buyer User ID</th>
				   <th>Bids Won</th>
				</tr>
			<% 
			while(rs.next()) {
			%>
			
			<tr> 
				<td><%= Users.getUsername(Integer.parseInt(rs.getString("WinnerID")))%></td>
				<td><%=rs.getString("WinnerID")%></td>
				<td><%=rs.getString("BidsWon")%></td>
				
			</tr>
			<%} %></table><%
		}
		%> 
		

</body>
</html>