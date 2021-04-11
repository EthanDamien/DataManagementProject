<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Bid Handler</title>
</head>
<body>
<%
		try {	


			Bid.deleteBid(Integer.parseInt(request.getParameter("auctionID")), Integer.parseInt(request.getParameter("bidID")));

	    	response.sendRedirect("customerRepHome.jsp");
	    	return;
	    }
			 
		catch (Exception ex) {
		System.out.println(ex);
		}
	%>
</body>
</html>