<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Question Handler</title>
</head>
<body>
 	<%
		int userID = Users.getUserID((String)session.getAttribute("Username")); 
   		String question = request.getParameter("question"); 
   		String description = request.getParameter("description"); 
   		int answer = 0;

 		try {	
 			int questionID = Question.createQuestion(userID, "QuestionID", question, description, answer);

        	response.sendRedirect("questionPage.jsp?questionID=" + Integer.toString(questionID));
 	    	return;
 	    }
 			 
 		catch (Exception ex) {
 		}
 		    
	%>
	
	
	
	
	
	
	
</body>
</html>