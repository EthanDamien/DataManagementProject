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
  	
    try 
    {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
        String email = request.getParameter("userEmail");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
		Statement stmt = con.createStatement();
        String counter = "SELECT COUNT(*) FROM users";
		ResultSet result = stmt.executeQuery(counter);
		int count = 0;
		
		if(result.next())
		{
			count = result.getInt("COUNT(*)") + 1;
		}
   
        String query = "INSERT into users(UserID, Email, Username, Password, Type) values(?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, count);
        ps.setString(2, email);
        ps.setString(3, username);
        ps.setString(4, password);
		ps.setInt(5, 1);
		
        ps.executeUpdate();
    	response.sendRedirect("index.jsp");

        
      	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
  		con.close();
      	ps.close();
  		out.print("Registration succeeded");
    
  	} 
    catch (Exception ex)
    {
  		out.print(ex);
  		out.print("Registration failed");
  	}
    %> 
    
  
</body>
</html>