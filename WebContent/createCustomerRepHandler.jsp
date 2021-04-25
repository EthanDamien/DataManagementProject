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
	
    try 
    {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
    	ResultSet usernameRS = null;
    	PreparedStatement usernamePS = null;

        String queryEmail = "SELECT * from users WHERE Username = ?";
        usernamePS = con.prepareStatement(queryEmail);
        usernamePS.setString(1, username);
        usernameRS = usernamePS.executeQuery();
        
		//Check if the Username Exists in the system
		if(usernameRS.next())
		{
			out.println("There was an error creating the customer representative.");
			out.println("<a href='createCustRep.jsp'>Create Customer Representative Account</a>");
			return;
		}
		
   
		//Insert a tuple into the Users table
        String query = "INSERT into users(Email, Username, Password, UserType) values(?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, username);
        ps.setString(3, password);
		ps.setInt(4, 2);
		
        ps.executeUpdate();
    	response.sendRedirect("adminHome.jsp");

        
      	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
  		con.close();
      	ps.close();
    
	} catch(SQLException se) {
		out.println("There was an error creating the customer representative.");
		out.println("<a href='createCustRep.jsp'>Create Customer Representative Account</a>");
	    se.printStackTrace();
	} catch(Exception e) {
	    e.printStackTrace();
	}
    %> 
</body>
</html>