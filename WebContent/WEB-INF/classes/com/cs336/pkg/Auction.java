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

	public static void newBidUpdate(int auctionID, int userID)throws SQLException, Exception{
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement st = con.createStatement();
			
			String query = String.format("UPDATE participating SET NotificationStatus = 1 WHERE AuctionID = %d AND UserID <> %d" , auctionID, userID);
			
			st.executeUpdate(query);
		}
        catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}

	public static void automaticUpdate(int auctionID)throws SQLException, Exception{

		try {
			Thread.sleep(1000);
			System.out.println("Automatic Update for " + auctionID);

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement st = con.createStatement();
			ResultSet rs1 = st.executeQuery("SELECT COUNT(*) AS count FROM participating WHERE AuctionID = " + auctionID + " AND autoAmount <> 0");
            rs1.next();
            int count = rs1.getInt("count");

            System.out.println("Count: " + count);
            //No one 
			if(count == 0){
				return;
			}
			
			

			ResultSet rs2 = st.executeQuery("SELECT * FROM participating p join Auction a on a.AuctionID = p.AuctionID WHERE a.AuctionID = " + auctionID + " AND p.autoAmount <> 0");
			if(count == 1){
			 	rs2.next();
				double currentBid = rs2.getDouble("AuctionPrice");
				double autoIncrement = rs2.getDouble("increment");
				double limit = rs2.getDouble("autoAmount");

				System.out.println("current Bid: " + currentBid);
				System.out.println("Auto Increment: " + autoIncrement);
				System.out.println("limit: " + limit);

				int user = rs2.getInt("UserID");

				//if the current limit of the highest autobid is less than currentBid
				//get rid of it
				if(limit <= currentBid){
					st.executeUpdate("UPDATE participating SET autoAmount = 0, increment = 0 WHERE UserID = " + user + "AND AuctionID = " + auctionID);
				}
				//done... 
				//if the current limit of highest autobid is more than current bid, increment by 
				//the specified increment, or until it reaches the limit
				else{
					double newCurrentBid = 0;
					//check if auctionprice + increment is more than limit
					if(currentBid + autoIncrement > limit){
						newCurrentBid = limit;
					}
					else{
						newCurrentBid = currentBid + autoIncrement;
						//update current price to current + specified increment
						
					}
					System.out.println("New Current Bid = " + newCurrentBid);
					String query = "INSERT INTO bid (AuctionID, UserID, BidAmount) VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(query);
					
					ps.setInt(1, auctionID);
					ps.setInt(2, user);
					ps.setDouble(3, newCurrentBid);
					ps.executeUpdate();
					st.executeUpdate("UPDATE auction SET AuctionPrice = " + newCurrentBid + " WHERE AuctionID = " + auctionID);
				}
			}

		 
            // //One person ∂
            // System.out.println("There Exists at least one with autobid");
			return;
            
        }
        catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}
	
	
	
}
