<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel = "stylesheet" type = "text/css" href="styles/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Delete Customer Rep</title>
</head>
<body>
	<%@ include file="./Components/navBar.jsp" %>
	<h1> Delete Customer Rep</h1>
	
	<form>
      <input type="text" name="usernameSearch" placeholder="Search Username">
      <button type="submit">Search</button>
    </form>
    
	<% 	try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
	    	Statement st = con.createStatement();
	    	ResultSet rs;
	    	String name = request.getParameter("usernameSearch");
	    	
	    	rs = st.executeQuery("SELECT * FROM users WHERE username LIKE '%"+name+"%' AND UserType = 2");
	%>
	 <table class="table-sm table-dark">
	 	    <tr>
			   <th>Username</th>
			   <th>UserID</th>
			   <th>Email</th>
			   <th>Delete</th> 
			</tr>
  	<% 
	    	while(rs.next()) {
	%>
	<tr> 
		
		<td><%=rs.getString("Username")%></td>
		<td><%=rs.getString("UserID")%></td>
		<td><%=rs.getString("Email")%></td>
		<td> 
			<form action="deleteCustRepHandler.jsp" method = "POST">		
				<input name = "usernameDelete" type = "hidden" value="<%=rs.getString("Username")%>">
				<input class = "bid sweep" type="submit" value = "Delete User">
			</form>
		</td>	
	</tr>
	
	<%} %> </table>
	
	<h2> All Customer Rep Accounts</h2>
		<table class="table-sm table-dark">
	    	<tr>
			   <th>Username</th>
			   <th>UserID</th>
			   <th>Email</th>
			   <th>Delete</th> 
			</tr>
	<% 	ResultSet allRepRS = Users.getAllCustomerReps(); 
		while(allRepRS.next()){
	%>
		<tr>
			<td><%=allRepRS.getString("Username")%></td>
			<td><%=allRepRS.getString("UserID")%></td>
			<td><%=allRepRS.getString("Email")%></td>
			<td> 
				<form action="deleteCustRepHandler.jsp" method = "POST">		
					<input name = "usernameDelete" type = "hidden" value="<%=allRepRS.getString("Username")%>">
					<input class = "bid sweep" type="submit" value = "Delete User">
				</form>
			</td>	
		</tr>
	<% } %> </table>
	<% 
	}
	catch(SQLException se){
	}
	catch(Exception e){
	}
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>