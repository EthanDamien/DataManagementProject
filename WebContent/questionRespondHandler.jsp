<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question Respond Handler</title>
</head>
<body>
	<%
		int questionID = Integer.parseInt(request.getParameter("questionID"));
   		String answer = request.getParameter("answer"); 

 		try {	
 			int returnQuestionID = Question.respondQuestion(questionID, answer);

        	response.sendRedirect("questionPage.jsp?questionID=" + Integer.toString(returnQuestionID));
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
 		}
 		    
	%>
</body>
</html>