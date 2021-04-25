package com.cs336.pkg;

import java.sql.*;

public class Question {
	
	
	public static ResultSet getAllQuestions()throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = "SELECT * FROM questions ORDER BY QuestionCreatedAt DESC";

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
	
	public static ResultSet getAllNonAnsweredQuestions()throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = "SELECT * FROM questions WHERE Answered = 0 ORDER BY QuestionCreatedAt DESC";

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
	
	public static int createQuestion(int userID, String questionID, String question, String description, int answer) throws Exception 
	{
		
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();

	        String query = String.format("INSERT into questions(QuestionID, UserID, Question, Description, Answered) values(%s, '%d', '%s', '%s', '%d')", questionID, userID, question, description, answer);
 	 		st.executeUpdate(query);
 	 		
 	 		ResultSet rs = st.executeQuery("SELECT Max(QuestionID) AS max FROM questions");
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

	public static ResultSet getQuestion(int questionID) throws Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement st = con.createStatement();
	
	        String query = "SELECT * FROM questions WHERE QuestionID = " + questionID;
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
	
	public static int respondQuestion(int questionID, String answer) throws SQLException, Exception
	{
		try 
	    {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	 	 	

	    	String updateQuery = "UPDATE questions set Answered = 1, Response = ? WHERE QuestionID = ?";
	    	PreparedStatement psUpdate = con.prepareStatement(updateQuery);
	    	psUpdate.setString(1, answer);
	    	psUpdate.setInt(2, questionID);
	    	psUpdate.executeUpdate();
	    	
	    	return questionID;
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
