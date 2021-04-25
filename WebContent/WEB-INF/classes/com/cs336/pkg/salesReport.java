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

		    String query="SELECT SUM(auctionPrice) totalEarnings FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice";	
		    
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

		    String query="SELECT SUM(auctionPrice) EarningsPerItem, subCategory FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice GROUP BY SubCategory ORDER BY EarningsPerItemType DESC";	
		    
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

		    String query="SELECT SUM(auctionPrice) EarningsPerItemType, Category FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice GROUP BY Category ORDER BY EarningsPerItemType DESC";	
		    
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

		    String query="SELECT SUM(auctionPrice) EarningPerUser, UserID FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice GROUP BY UserID ORDER BY EarningPerUser DESC";	
		    
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

		    String query="SELECT COUNT(*) NumberOfItems, SubCategory FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice GROUP BY SubCategory ORDER BY NumberOfItems DESC";	
		    
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
	
	public static ResultSet bestBuyer() throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
		    ResultSet rs = null;
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		    String query="SELECT SUM(AuctionPrice) SumSold, UserID FROM auction WHERE TIMESTAMP(AuctionEnd) < '"+date+"' AND AuctionPrice > ReservePrice GROUP BY UserID ORDER BY SumSold DESC";	
		    
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
