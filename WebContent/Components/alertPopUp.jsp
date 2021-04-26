<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
    <div id = "notifyModal">
        <div class = "modal-content">
        <h1>Notifications</h1>
         

        <% 
            Auction.checkWinners();
            
            String username = (String) session.getAttribute("Username");
            %>
                <p> Username: <%=username%> <p>

                <%
                ResultSet userInterests = null;
                int userID = Users.getUserID(username);
                try{
                    ApplicationDB db = new ApplicationDB();	
                    Connection con = db.getConnection();
                    Statement st = con.createStatement();
                    Statement st2 = con.createStatement();
                    Statement st3 = con.createStatement();

                    userInterests = st.executeQuery("Select * from interested where userID = " + userID);
                    while(userInterests.next()){
                        String lastChecked = userInterests.getString("lastChecked");
                        String itemName = userInterests.getString("interestName");
                        ResultSet newAuctions = st3.executeQuery("Select * from auction where itemname = '" + itemName + "' and AuctionCreatedAt > '" + lastChecked + "'");
                        while(newAuctions.next()){
                              
                %>          
                            <script>
                                document.getElementById("notifyModal").style.display = "block";  
                            </script>
                            <p>A new <a href = 'product.jsp?auctionID=<%=newAuctions.getInt("AuctionID")%>'><%=itemName%></a> was listed</p>
                        <%   
                        }
                        st2.executeUpdate("update interested set lastchecked = current_timestamp() where interestName = '" + itemName + "' and userID = " + userID);
                    }
			
                    }
                    catch(SQLException se) {
                        throw se;
                    } 
                    catch(Exception ex) {
                        throw ex;
                    }
                ResultSet notifRS = Users.auctionNotifications(userID);
                while(notifRS.next()){
        %>
                
               
                <% if(notifRS.getInt("NotificationStatus") == 1){
                    
                %>
                    <div>
                        <p>Theres a new bid on <a href='product.jsp?auctionID=<%=notifRS.getInt("auctionID") %>'><%=notifRS.getString("ItemName")%></a></p>
                        <script>
                            document.getElementById("notifyModal").style.display = "block";  
                        </script>
                    </div>
                <% 
                }
                else if(notifRS.getInt("NotificationStatus") == 2){
                
                    %>
                        <div>
                            <p>Your autolimit has been surpassed on <a href='product.jsp?auctionID=<%=notifRS.getInt("auctionID") %>'><%=notifRS.getString("ItemName")%></a></p>
                            <script>
                                document.getElementById("notifyModal").style.display = "block";  
                            </script>
                        </div>
                <%
                    
                
                    }
                    else if(notifRS.getInt("NotificationStatus") == 3){
                     
                %>
                    <div>
                        <p>You won an auction on <a href='product.jsp?auctionID=<%=notifRS.getInt("auctionID") %>'><%=notifRS.getString("ItemName")%></a></p>
                        <script>
                                document.getElementById("notifyModal").style.display = "block";       
                        </script>
                    </div>
                
                <%}

                    Users.gotNotified(userID);
                %>
                

        <% } %>
        <span class = "goButton anima closebutton" >close</span>
        </div>
    </div>
    <script>
    //MODAL
      // Get the modal
      var modal = document.getElementById("notifyModal");

      // Get the button that opens the modal

      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("closebutton")[0];

      // When the user clicks on the button, open the modal

      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
        modal.style.display = "none";
      }

      // When the user clicks anywhere outside of the modal, close it
      </script>
</body>
</html>