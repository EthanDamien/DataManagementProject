<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe - Login</title>
</head>
<body>
    <%
	ResultSet emailResult = null;
	ResultSet usernameResult = null;

	PreparedStatement emailPS = null;
	PreparedStatement usernamePS = null;

    try 
    {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
        String email = request.getParameter("userEmail");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
		
		String queryEmail = "SELECT * from users WHERE Email = ?";
		emailPS = con.prepareStatement(queryEmail);
		emailPS.setString(1, email);
		emailResult = emailPS.executeQuery();
		
		//Check if the Email Exists in the system
		if(emailResult.next())
		{
			session.setAttribute("error", "Email");
        	
        	response.sendRedirect("registration.jsp");
            return;
		}
		
		String queryUsername =  "SELECT * from users WHERE username = ?";
		usernamePS = con.prepareStatement(queryUsername);
		usernamePS.setString(1, username);
		usernameResult = usernamePS.executeQuery();
		
		if(usernameResult.next())
		{
			session.setAttribute("error", "UsernameError");
        	
        	response.sendRedirect("registration.jsp");
            return;
		}
		
		//Insert a tuple into the Users table
        String query = "INSERT into users(Email, Username, Password, UserType) values(?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, username);
        ps.setString(3, password);
		ps.setInt(4, 3);
		
        ps.executeUpdate();
    	response.sendRedirect("login.jsp");

        
      	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
  		con.close();
      	ps.close();
    
  	} 
    catch (Exception ex)
    {
  		out.print(ex);
  	}
    %> 
    
  
</body>
</html>