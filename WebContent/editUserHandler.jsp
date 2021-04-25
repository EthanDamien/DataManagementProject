<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try { 
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		String oldUsername = request.getParameter("oldUsername");
		String newUsername = request.getParameter("newUsername");
		String newEmail = request.getParameter("newEmail");
		
		PreparedStatement ps = con.prepareStatement("UPDATE users SET Username = ?, Email= ? WHERE Username = ?");
		ps.setString(1, newUsername);
		ps.setString(2, newEmail);
		ps.setString(3, oldUsername);
		ps.executeUpdate();
		
    	response.sendRedirect("customerRepHome.jsp");
		
	
		
	} catch(Exception e){
		
	}
	%>
</body>
</html>