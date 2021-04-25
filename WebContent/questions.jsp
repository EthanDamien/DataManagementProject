<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
<title>BuyMe - Questions</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>

	<h1> Questions</h1>
	
	<form>		
      <input type="text" name="search" placeholder="Search for Questions">
      <button type="submit">Search Questions</button>
    </form>
    
    <form>		
      <input type="text" name="searchAnswers" placeholder="Search for Answers">
      <button type="submit">Search Answers</button>
    </form>
    
    <br>
    <div>
    <%
	int accountType = (Integer) session.getAttribute("Type");

    
    if(accountType == 3){ %>
		<a id = "clickQuestion" href = "createQuestion.jsp"> Create a Question</a>
	<%} %>
	 </div>
	 <br>
	 
	 <% 	try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	String search = request.getParameter("search");
	    	
	    	rs = st.executeQuery("SELECT * FROM questions WHERE Question LIKE '%"+search+"%' ORDER BY QuestionCreatedAt DESC");
	%>
	    <table  class="table-sm table-dark">
	    	<tr>
			   <th>Username</th>
			   <th>Question</th>
			   <th>Answered</th>
			   <th>Description</th>
			   <th>Created Date</th> 
			</tr>
  	<% 
	    	while(rs.next()) {
	%>
	

		<tr> 
			<td><%=rs.getString("UserID")%></td>
			<td><a href = "questionPage.jsp?questionID=<%=rs.getString("questionID")%>" ><%=rs.getString("Question")%></a></td>
			
			<td><% 
				
				if(rs.getInt("Answered") == 0)
					out.println("No");
				else
					out.println("Yes");
				%>
				
			</td>
			
			<td><%=rs.getString("Description")%></td>	
			<td><%=rs.getString("QuestionCreatedAt")%></td>	
		</tr>
	
	<% } %> </table><% 
	}
	catch(SQLException se){
	}
	catch(Exception e){
	}
	%>
	<br>
	<h3> All Questions</h3>
	 <table class="table-sm table-dark">
	    	<tr>
			   <th>Username</th>
			   <th>Question</th>
			   <th>Answered</th>
			   <th>Description</th>
			   <th>Created Date</th> 
			</tr>
			
			<%  ResultSet rsAll = Question.getAllQuestions(); 
				while(rsAll.next()){
			%>
			<tr> 
				<td><%=rsAll.getString("UserID")%></td>
				<td><a href = "questionPage.jsp?questionID=<%=rsAll.getString("questionID")%>" ><%=rsAll.getString("Question")%></a></td>
				
				<td><% 
				
				if(rsAll.getInt("Answered") == 0)
					out.println("No");
				else
					out.println("Yes");
				%>
				</td>	
				
				<td><%=rsAll.getString("Description")%></td>	
				
				<td><%=rsAll.getString("QuestionCreatedAt")%></td>
				
			</tr>
			<%} %>
			
	 </table>
</body>
</html>