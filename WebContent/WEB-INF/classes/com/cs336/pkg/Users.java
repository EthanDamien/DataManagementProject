package com.cs336.pkg;

import java.sql.*;


public class Users 
{
    public static ResultSet getUser(String username) throws Exception
    {
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;

	        String query = "SELECT * from users WHERE Username = '" + username + "'";
		    Statement st = con.createStatement();

			rs = st.executeQuery(query);
			return rs;

	    }
		catch(SQLException se) {
			throw se;
		} 
		catch (Exception ex)
	    {
			throw ex;
	  	}
    }
    
    public static int getUserID(String username)
    {
    	try 
	    {
			ResultSet rs = getUser(username);
			rs.next();
			int userID = rs.getInt("UserID");
			return userID;
	    }
		catch (Exception ex)
	    {
			return -1;
	  	}
    }
    
    public static void deleteUser(String username)
    {
    	try 
    	{
    		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    
		    PreparedStatement ps = con.prepareStatement("DELETE FROM users where username = ?");
			ps.setString(1, username);
			ps.executeUpdate();

    	}
    	catch (Exception ex)
	    {
	  	}
    }
    
    public static ResultSet getAllCustomerReps() throws Exception
    {
    	try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;

	        String query = "SELECT * from users WHERE UserType = 2";
		    Statement st = con.createStatement();

			rs = st.executeQuery(query);
			return rs;

	    }
		catch(SQLException se) {
			System.out.println(se);
			throw se;
		} 
		catch (Exception ex)
	    {
			System.out.println(ex);
			throw ex;
	  	}
    }
    
}
