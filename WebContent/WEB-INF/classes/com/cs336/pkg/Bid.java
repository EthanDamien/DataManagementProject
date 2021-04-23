package com.cs336.pkg;

import java.sql.*;

public class Bid {

	public static int createBid(int auctionID, int userID, double price, double userBidLimit, double userIncrement) throws SQLException, Exception
	{	    	
		System.out.println("Auction ID:" + auctionID);
		System.out.println("User ID:" + userID);
		System.out.println("BidPrice:" + price);
		
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
            
            Statement checkStartingprice = con.createStatement();
            ResultSet auctionInfo = checkStartingprice.executeQuery("SELECT AuctionPrice, BidIncrement from auction WHERE AuctionID = "+ auctionID);
            auctionInfo.next();
            if(auctionInfo.getDouble("AuctionPrice") + auctionInfo.getDouble("BidIncrement") > price){
                return 0;
            } 
            
			// if(price == 0.0){
            //     return;
            // }

            String query = "INSERT INTO bid (AuctionID, UserID, BidAmount) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, auctionID);
            ps.setInt(2, userID);
            ps.setDouble(3, price);
            ps.executeUpdate();

            String updateQuery = "UPDATE auction set AuctionPrice = ? WHERE AuctionID = ?";
            PreparedStatement psUpdate = con.prepareStatement(updateQuery);

            psUpdate.setDouble(1, price);
            psUpdate.setInt(2, auctionID);

            psUpdate.executeUpdate();


            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM participating WHERE UserID = " + userID + " AND AuctionID = " + auctionID);
            
			

            if(!rs.isBeforeFirst()) {
                String query2 = "INSERT INTO participating VALUES (?,?,0,?,?)";
                PreparedStatement ps2 = con.prepareStatement(query2);
                
                ps2.setInt(1, userID);
                ps2.setInt(2, auctionID);
				ps2.setDouble(3, userBidLimit);
                ps2.setDouble(4, userIncrement);
				

                ps2.executeUpdate();
            }
			else{
                updateQuery = "UPDATE participating SET autoAmount = ?, increment = ? WHERE UserID = ? AND AuctionID = ?";
				PreparedStatement fml = con.prepareStatement(updateQuery);

                fml.setDouble(1, userBidLimit);
                fml.setDouble(2, userIncrement);
                fml.setInt(3, userID);
                fml.setInt(4, auctionID);
				
                fml.executeUpdate();
			}
			Auction.automaticUpdate(auctionID);
            
            Auction.newBidUpdate(auctionID, userID);
            


	    	return 1;
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
			
	    	String query = "Select * FROM bid b JOIN users u ON u.UserID = b.UserID where b.AuctionID = ? ORDER BY b.BidCreatedAt Desc";
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
			int bidPrice = rs.getInt("BidAmount");

			String queryTemp = "Select * FROM auction where AuctionID = ?";
	    	PreparedStatement psTemp = con.prepareStatement(queryTemp);
		    psTemp.setInt(1, auctionID);
			ResultSet rsTemp = psTemp.executeQuery();
			rsTemp.next();
			int oldMax = rsTemp.getInt("AuctionPrice");
			int newPrice = oldMax - bidPrice;

			
		    PreparedStatement psDelete = con.prepareStatement("DELETE FROM bid where AuctionID = ? and BidID = ?");
		    psDelete.setInt(1, auctionID);
		    psDelete.setInt(2, bidID);
		    psDelete.executeUpdate();
	

		    String updateQuery = "UPDATE auction set AuctionPrice = ? WHERE AuctionID = ?";
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
