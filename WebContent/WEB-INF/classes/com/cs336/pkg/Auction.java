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
			
			String query = String.format("UPDATE participating SET NotificationStatus = 1 WHERE AuctionID = %d AND UserID <> %d AND NotificationStatus = 0" , auctionID, userID);
			
			st.executeUpdate(query);
		}
        catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}


	public static void automaticUpdate(int auctionID, int currUserID)throws SQLException, Exception{

		try {
			//The wait is so the bid doesn't happen at exactly the same time
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
				Auction.newBidUpdate(auctionID, currUserID);
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
					String query = "UPDATE participating SET autoAmount = 0, increment = 0, NotificationStatus = 2 WHERE UserID = ? AND AuctionID = ?";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1, user);
					ps.setInt(2, auctionID);
					ps.executeUpdate();
				}
				//done... 
				//if the current limit of highest autobid is more than current bid, increment by 
				//the specified increment, or until it reaches the limit
				else{
					double newCurrentBid = 0;
					//check if auctionprice + increment is more than limit
					if(currentBid + autoIncrement > limit){
						newCurrentBid = limit;
						String query = "UPDATE participating SET autoAmount = 0, increment = 0, NotificationStatus = 2 WHERE UserID = ? AND AuctionID = ?";
						PreparedStatement ps = con.prepareStatement(query);
						ps.setInt(1, user);
						ps.setInt(2, auctionID);
						ps.executeUpdate();
					}
					else{
						newCurrentBid = currentBid + autoIncrement;
						//update current price to current + specified increment
						
					}
					//Leading = the only autobid
					System.out.println("New Current Bid = " + newCurrentBid);
					String query = "INSERT INTO bid (AuctionID, UserID, BidAmount) VALUES (?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(query);
					
					ps.setInt(1, auctionID);
					ps.setInt(2, user);
					ps.setDouble(3, newCurrentBid);
					ps.executeUpdate();
					
					st.executeUpdate("UPDATE auction SET AuctionPrice = " + newCurrentBid + " WHERE AuctionID = " + auctionID);
					Auction.newBidUpdate(auctionID, user);
				}
			}
			//bid war time
			if(count == 2){
				//problem...  We don't know who should automatically bid first
				rs2.next();
				double currentBid = rs2.getDouble("AuctionPrice");
				double autoIncrement1 = rs2.getDouble("increment");
				double limit1 = rs2.getDouble("autoAmount");
				int user1 = rs2.getInt("UserID");
				System.out.println("User: " + user1);
				System.out.println("current Bid: " + currentBid);
				System.out.println("Auto Increment: " + autoIncrement1);
				System.out.println("limit: " + limit1);

				rs2.next();
				double autoIncrement2 = rs2.getDouble("increment");
				double limit2 = rs2.getDouble("autoAmount");
				int user2 = rs2.getInt("UserID");

				System.out.println("User: " + user2);
				System.out.println("current Bid: " + currentBid);
				System.out.println("Auto Increment: " + autoIncrement2);
				System.out.println("limit: " + limit2);

				int userToBid = 0;

				if(user1 == currUserID){
					System.out.println("User " + user2 + " should go first.");
					userToBid = 2;


				}
				else{
					System.out.println("User " + user1 + " should go first.");
					userToBid = 1;
				}


				double newCurrentBid = 0;
				boolean possible = true;
				while(possible){
					//Thread.sleep(200);
					//first, check if next user can increment, then increment if possible
					switch (userToBid){
						case 1:
							if(limit1 <= newCurrentBid){
								//discard autobid and break;
								possible = false;
							}
							else{
								if(newCurrentBid + autoIncrement1 > limit1){
									System.out.println("Point: " + 1);
									newCurrentBid = limit1;
									String query = "UPDATE participating SET autoAmount = 0, increment = 0 WHERE UserID = ? AND AuctionID = ?";
									PreparedStatement ps = con.prepareStatement(query);
									ps.setInt(1, user1);
									ps.setInt(2, auctionID);
									ps.executeUpdate();
								}
								else{
									System.out.println("Point: " + 2);
									newCurrentBid = newCurrentBid + autoIncrement1;
									//update current price to current + specified increment
								}
								System.out.println("New Current Bid = " + newCurrentBid);
								String query = "INSERT INTO bid (AuctionID, UserID, BidAmount) VALUES (?, ?, ?)";
								PreparedStatement ps = con.prepareStatement(query);
								ps.setInt(1, auctionID);
								ps.setInt(2, user1);
								ps.setDouble(3, newCurrentBid);
								ps.executeUpdate();
								st.executeUpdate("UPDATE auction SET AuctionPrice = " + newCurrentBid + " WHERE AuctionID = " + auctionID);

								//give turn to other user
								userToBid = 2;
							}
							break;
						case 2: 
							//checking user 2
							if(limit2 <= newCurrentBid){
								//discard autobid and break;
								possible = false;
							}
							else{
								if(newCurrentBid + autoIncrement2 > limit2){
									System.out.println("Point: " + 3);
									newCurrentBid = limit2;
									String query = "UPDATE participating SET autoAmount = 0, increment = 0 WHERE UserID = ? AND AuctionID = ?";
									PreparedStatement ps = con.prepareStatement(query);
									ps.setInt(1, user2);
									ps.setInt(2, auctionID);
									ps.executeUpdate();
								}
								else{
									System.out.println("Point: " + 4);
									newCurrentBid = newCurrentBid + autoIncrement2;
									//update current price to current + specified increment
								}
								System.out.println("New Current Bid = " + newCurrentBid);
								String query = "INSERT INTO bid (AuctionID, UserID, BidAmount) VALUES (?, ?, ?)";
								PreparedStatement ps = con.prepareStatement(query);
								ps.setInt(1, auctionID);
								ps.setInt(2, user2);
								ps.setDouble(3, newCurrentBid);
								ps.executeUpdate();
								st.executeUpdate("UPDATE auction SET AuctionPrice = " + newCurrentBid + " WHERE AuctionID = " + auctionID);

								//give turn to other user
								userToBid = 1;
							}
						break;
					}

				}
				String query = "UPDATE participating SET autoAmount = 0, increment = 0, NotificationStatus = 2 WHERE UserID = ? AND AuctionID = ?";
				PreparedStatement ps = con.prepareStatement(query);

				switch(userToBid){
					case 1: 
						ps.setInt(1, user1);
						ps.setInt(2, auctionID);
						ps.executeUpdate();
						Auction.newBidUpdate(auctionID, user2);
					break;
					case 2: 
						ps.setInt(1, user2);
						ps.setInt(2, auctionID);
						ps.executeUpdate();
						Auction.newBidUpdate(auctionID, user1);
					break;
				}
				//discard the losing autobid


			}
			return;
            
        }
        catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}

	public static ResultSet orderedNotExpired()throws SQLException, Exception{
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			Statement query = con.createStatement();
			//return a result set of auctions that have not ended in increasing order
			ResultSet rs = query.executeQuery("SELECT * FROM auction WHERE CURRENT_TIMESTAMP < AuctionEnd order by AuctionEnd ASC");
            return rs;
		}
		catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}

}
