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
  	
    try 
    {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        username.toLowerCase();
        
        //the query is limiting, case sensitive
        String query = "SELECT * from users WHERE Username = ?";
		PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);

        ResultSet result = ps.executeQuery();

        if(result.next()) 
        {
            String userPassword = result.getString("password");
            if(userPassword.equals(password)) 
            {
                session.setAttribute("Username", username);
                session.setAttribute("acountType", result.getInt("type"));
                
                response.sendRedirect("index.jsp");
                return;
            }
            // Return to Login Page but Display Wrong Credentials
            else
            {
            	response.sendRedirect("bop.jsp");
                return;
            }
        }
     	// Return to Login Page but Display Wrong Credentials
        else
        {
        	response.sendRedirect("bop.jsp");
            return;
        }
        
      	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
  		con.close();
  		out.print("Login succeeded");
    
  	} 
    catch (Exception ex)
    {
  		out.print(ex);
  		out.print("Login failed");
  	}
    %> 
    

    
</body>
</html>

