package com.cs336.pkg;

import java.sql.*;

public class Bid {

	public static void createBid(int auctionID, int userID, double price) throws SQLException, Exception
	{	    	
		System.out.println("Auction ID:" + auctionID);
		System.out.println("User ID:" + userID);
		System.out.println("BidPrice:" + price);

		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	

	    	String query = "INSERT INTO bid (AuctionID, UserID, Price) VALUES (?, ?, ?)";
	    	PreparedStatement ps = con.prepareStatement(query);
	    	
	    	ps.setInt(1, auctionID);
	    	ps.setInt(2, userID);
	    	ps.setDouble(3, price);
	    	ps.executeUpdate();

	    	String updateQuery = "UPDATE auction set Price = Price + ? WHERE auctionID = ?";
	    	PreparedStatement psUpdate = con.prepareStatement(updateQuery);

	    	psUpdate.setDouble(1, price);
	    	psUpdate.setInt(2, auctionID);

	    	psUpdate.executeUpdate();

	    	return;
	    }
		catch(SQLException se) {
			throw se;
		} 
		catch (Exception ex)
	    {
			throw ex;
	  	}
		
	}
	
	public static ResultSet bidHistory(int auctionID) throws SQLException, Exception
	{		
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
	    	String query = "Select * FROM bid where auctionID = ? ORDER BY CreatedAt Desc";
	    	PreparedStatement ps = con.prepareStatement(query);
	    	
	    	ps.setInt(1, auctionID);
	    	ResultSet rs = ps.executeQuery();
	    	
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
	
	public static void deleteBid(int auctionID, int bidID)throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			String query = "Select * FROM bid where BidID = ?";
	    	PreparedStatement ps = con.prepareStatement(query);
		    ps.setInt(1, bidID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int bidPrice = rs.getInt("Price");

			String queryTemp = "Select * FROM auction where AuctionID = ?";
	    	PreparedStatement psTemp = con.prepareStatement(queryTemp);
		    psTemp.setInt(1, auctionID);
			ResultSet rsTemp = psTemp.executeQuery();
			rsTemp.next();
			int oldMax = rsTemp.getInt("Price");
			int newPrice = oldMax - bidPrice;

			
		    PreparedStatement psDelete = con.prepareStatement("DELETE FROM bid where AuctionID = ? and BidID = ?");
		    psDelete.setInt(1, auctionID);
		    psDelete.setInt(2, bidID);
		    psDelete.executeUpdate();
	

		    String updateQuery = "UPDATE auction set Price = ? WHERE AuctionID = ?";
	    	PreparedStatement psUpdate = con.prepareStatement(updateQuery);
	    	psUpdate.setDouble(1, newPrice);
	    	psUpdate.setInt(2, auctionID);
	    	psUpdate.executeUpdate();

			return;

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
