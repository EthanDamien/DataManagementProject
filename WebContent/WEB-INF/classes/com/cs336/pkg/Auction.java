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
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement st = con.createStatement();
			ResultSet rs1 = st.executeQuery("SELECT COUNT(*) AS count FROM participating WHERE AuctionID = " + auctionID + " AND autoAmount <> 0");
            rs1.next();
            int count = rs1.getInt("count");

            System.out.println("Count: "+ count);
            //No one 
			if(count == 0){
				return;
			}
			
			ResultSet rs2 = st.executeQuery("SELECT * FROM participating p join Auction a on a.AuctionID = p. AuctionID WHERE AuctionID = " + auctionID + " AND autoAmount <> 0");
			if(count == 1){
				rs2.next();
				double currentBid = rs2.getDouble("AuctionPrice");
				double autoIncrement = rs2.getDouble("increment");
				double limit = rs2.getDouble("autoAmount");
				int user = rs2.getInt("UserID");

				if(limit - currentBid <= autoIncrement ){
					st.executeUpdate("UPDATE auction SET AuctionPrice = " + limit + " WHERE AuctionID = " + auctionID);
					st.executeUpdate("UPDATE participation SET autoAmount = 0, increment = 0 WHERE UserID = " + user + " AND AuctionID = " + auctionID);
				}
				else{
					st.executeUpdate("UPDATE auction SET AuctionPrice = " + (currentBid + autoIncrement) + " WHERE AuctionID = " + auctionID);

					//WHERE LEFT OFF
					
				}


				
			}

		 
            // //One person ∂
            // System.out.println("There Exists at least one with autobid");

            
        }
        catch(SQLException se) {
			throw se;
		} 
		catch(Exception ex) {
			throw ex;
		}
	}
	
	
	
}
