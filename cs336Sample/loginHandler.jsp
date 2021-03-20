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
    try {
        //Get the database connection
        //Redundant, use OOP
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	

        //Create a SQL statement
		Statement stmt = con.createStatement();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        username.toLowercase();
        

        //the query is limiting, case sensitive
        String query = "SELECT * from users WHERE Username = ? and Password = ?";
        PreparedStatement statement = connection.prepareStatement(statement);
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery(query);

        //we can remove this
        //if theres something, it exists and it's successful, 
        //Check if tuple is not empty


        if(rs.next()) {
            
            if(result.getString("Password").equals(password)) {
                session.setAttribute("Username", username);
                session.setAttribute("acountType", result.getInt("type"));
                
                response.sendRedirect(index.jsp);
                return;
                // make class for every database table
            }
            else{
                //return to login with extra line saying bad login
                reponse.sendRedirect(login.jsp);
                return;
            }
        }

            
        
        
        reponse.sendRedirect(index.jsp);
        }
    %>
    
</body>
</html>

