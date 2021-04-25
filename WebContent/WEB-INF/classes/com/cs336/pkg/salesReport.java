package com.cs336.pkg;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class salesReport 
{

	public static ResultSet totalEarnings() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT SUM(auctionPrice) AS totalEarnings FROM auction WHERE TIMESTAMP(AuctionEnd) <= CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice";	
		    
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
	
	public static ResultSet earningsPerItem() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT SUM(auctionPrice) EarningsPerItem, Subcategory FROM auction WHERE TIMESTAMP(AuctionEnd) < CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice GROUP BY Subcategory ORDER BY EarningsPerItem DESC";	
		    
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
	
	public static ResultSet earningsPerItemType() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT SUM(auctionPrice) EarningsPerItemType, Category FROM auction WHERE TIMESTAMP(AuctionEnd) < CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice GROUP BY Category ORDER BY EarningsPerItemType DESC";	
		    
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
	
	public static ResultSet earningsPerUser() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT SUM(auctionPrice) EarningPerUser, UserID FROM auction WHERE TIMESTAMP(AuctionEnd) < CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice GROUP BY UserID ORDER BY EarningPerUser DESC";	
		    
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
	
	public static ResultSet bestItem() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT ItemName, COUNT(*) AS NumberOfItems FROM auction WHERE TIMESTAMP(AuctionEnd) < CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice GROUP BY ItemName ORDER BY NumberOfItems DESC";	
		    
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
	
	// Won the most auctions
	public static ResultSet bestBuyer() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query= "Select WinnerID, Count(*) AS BidsWon from auction WHERE TIMESTAMP(AuctionEnd) < CURRENT_TIMESTAMP AND AuctionPrice >= ReservePrice GROUP BY WinnerID ORDER BY BidsWon DESC";	
		    
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
	
}
