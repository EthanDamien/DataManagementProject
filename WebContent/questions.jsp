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
	<%
	int accountType = 0;
	if(session.getAttribute("Type") != null)
		accountType = (Integer) session.getAttribute("Type");
	
	if(accountType == 3){ %>
	<a id = "clickQuestion" href = "createQuestion.jsp" style = "font-size: 1.5rem; color: red;"> Create a Question</a>
	<%} %>
	<form>		
      <input type="text" name="search" placeholder="Search for Questions">
      <button type="submit">Search Questions</button>
    </form>

	 
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
	<br>
	<form>		
      <input type="text" name="searchAnswers" placeholder="Search for Response">
      <button type="submit">Search Response</button>
    </form>
	
	<% 	try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	String searchAnswer = request.getParameter("searchAnswers");
	    	
	    	rs = st.executeQuery("SELECT * FROM questions WHERE Response LIKE '%"+searchAnswer+"%' ORDER BY QuestionCreatedAt DESC");
	%>
	    <table  class="table-sm table-dark">
	    	<tr>
			   <th>Username</th>
			   <th>Question</th>
			   <th>Answered</th>
			   <th>Response</th>
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
			<td><%=rs.getString("Response")%></td>	
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
	<br>
	<br>
	<h3> All Questions</h3>
	 <table class="table-sm table-dark">
	    	<tr>
			   <th>Username</th>
			   <th>Question</th>
			   <th>Answered</th>
			   <th>Description</th>
			   <th>Response</th>
			   
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
				<td><%=rsAll.getString("Response")%></td>	
				
				<td><%=rsAll.getString("QuestionCreatedAt")%></td>
				
			</tr>
			<%} %>
			
	 </table>
</body>
</html>