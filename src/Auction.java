package com.cs336.pkg;

import java.sql.*;


public class Auction 
{
	public static ResultSet getAllAuctions()throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = "SELECT * FROM auction";

 	 		ResultSet rs = st.executeQuery(query);

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
	
	public static int createAuction(String auctionID, int userID, String endDate, double price, double reservePrice, double bidIncrement, String itemName, String productDescription, String category) throws Exception {
		
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = String.format("INSERT into auction(AuctionID, UserID, AuctionEnd, AuctionPrice, ReservePrice, BidIncrement, ItemName, ProductDesc, Category) "
	        		+ "values(%s, '%d', '%s', '%f', '%f', '%f', '%s', '%s', '%s')", auctionID, userID, endDate, price, reservePrice, bidIncrement, itemName, productDescription, category);
 	 		System.out.println(query);

 	 		st.executeUpdate(query);

	        ResultSet rs = st.executeQuery("SELECT Max(AuctionID) AS max FROM auction");
		    rs.next();
	
		
		    return rs.getInt("max");
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
	
	public static ResultSet getAuction(int auctionID) throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = "SELECT * FROM auction WHERE AuctionID = " + auctionID;
 	 		System.out.println(query);

 	 		ResultSet rs = st.executeQuery(query);

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
	
	public static void deleteAuction(int auctionID)throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    
		    PreparedStatement ps = con.prepareStatement("DELETE FROM auction where AuctionID = ?");
			ps.setInt(1, auctionID);
			ps.executeUpdate();

	    }
		catch(SQLException se) {
			throw se;
		} 
		catch (Exception ex)
	    {
			throw ex;
	  	}
		
	}
	
	
	
}
