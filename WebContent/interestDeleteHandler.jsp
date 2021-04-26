<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Interest Handler</title>
</head>
<body>
	<%
   		String interest = request.getParameter("interestName"); 
		int userID = Integer.parseInt(request.getParameter("userID")); 
 		try {	
 			Users.deleteInterest(interest, userID);

        	response.sendRedirect("yourProfile.jsp");
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
 		}
 		    
	%>
</body>
</html>