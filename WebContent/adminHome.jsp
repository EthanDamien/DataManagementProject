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
<title>Admin Home</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>
	<h1>Administrator Home</h1>
	<a href="createCustRep.jsp">Create customer representative account.</a> 
	<br>
	<a href="deleteCustRep.jsp">Delete customer representative account.</a>
	<br>
	
	<form action="salesReport.jsp" method="POST">
       <select> 
	       <option value="totalE">Total Earnings</option>
	       <option value="ePerItem">Earnings Per Item</option>
	       <option value="eItemType">Earnings Per Item Type</option>
	       <option value="ePerUser">Earnings Per End-User</option>
	       <option value="bestItem">Best Selling Items</option>
	       <option value="bestBuyer">Best Buyers</option>
       </select>
       <input type="submit" value="Generate Sales Report"/>
     </form>
	
	
	
	
	
</body>
</html>