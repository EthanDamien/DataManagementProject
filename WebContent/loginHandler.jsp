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
    <title>E107 - Login</title>
</head>
<body>
    <%
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	ResultSet result = null;
	PreparedStatement ps = null;
	
    try 
    {	
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        username.toLowerCase();
        
        //the query is limiting, case sensitive
        String query = "SELECT * from users WHERE Username = ?";
		ps = con.prepareStatement(query);
        ps.setString(1, username);
        result = ps.executeQuery();
        
        // Check if there a tuple that matches the Username
        if(result.next()) 
        {
            String userPassword = result.getString("password");
            if(userPassword.equals(password)) 
            {
                session.setAttribute("Username", username);
                session.setAttribute("acountType", result.getInt("type"));
                session.setAttribute("error", "Valid");

                response.sendRedirect("index.jsp");
                return;
            }
            // Return to Login Page but Display Wrong Credentials
            else
            {
            	session.setAttribute("error", "Invalid");
            	
            	response.sendRedirect("login.jsp");
                return;
            }
        }
     	// Return to Login Page but Display Wrong Credentials
        else
        {
        	session.setAttribute("error", "Invalid");
        	response.sendRedirect("login.jsp");
            return;
        }
  	} 
    catch (Exception ex)
    {
  		out.print(ex);
  		out.print("Login failed");
  	}
    finally 
    {
    	try { result.close(); } catch (Exception e) {}
        try { ps.close(); } catch (Exception e) {}
        try { con.close(); } catch (Exception e) {}
    }
    %> 
    

    
</body>
</html>