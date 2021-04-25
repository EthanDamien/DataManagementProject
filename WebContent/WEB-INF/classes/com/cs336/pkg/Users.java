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

	public static String getUsername(int userID) throws Exception
    {
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;

	        String query = "SELECT * from users WHERE userid = " + userID;
		    Statement st = con.createStatement();

			rs = st.executeQuery(query);
			rs.next();
			
			return rs.getString("username");

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

	public static ResultSet getAuctionsIn(int userID)throws Exception {
    	
    	try {
    		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT AuctionID FROM participating WHERE UserID = " + userID;
			
			ResultSet rs = st.executeQuery(query);
			return rs;
    	}
    	catch(Exception ex) {
    		throw ex;
    	}
    }

	public static ResultSet auctionNotifications(int userID)throws Exception{
		try {
    		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT a.AuctionID, NotificationStatus, ItemName FROM participating p JOIN auction a ON p.AuctionID = a.AuctionID WHERE NotificationStatus <> 0 AND p.UserID = " + userID;
			ResultSet rs = st.executeQuery(query);
			return rs;
    	}
    	catch(Exception ex) {
    		throw ex;
    	}
	}

	public static void gotNotified(int userID)throws Exception{
		try {
    		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String query = "UPDATE participating SET NotificationStatus = 0 WHERE UserID = " + userID ;
			st.executeUpdate(query);
			
    	}
    	catch(Exception ex) {
    		throw ex;
    	}
	}

	public static ResultSet getListings(int userID)throws Exception{
		try {
    		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT * FROM users u JOIN auction a ON u.UserID = a.UserID ORDER BY a.AuctionEnd DESC";
			ResultSet rs = st.executeQuery(query);
			return rs;
    	}
    	catch(Exception ex) {
    		throw ex;
    	}
	}

    
}
