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

            String username = (String) session.getAttribute("Username");
            %>
                <p> Username: <%=username%> <p>

                <%
            
                int userID = Users.getUserID(username);
                ResultSet notifRS = Users.auctionNotifications(userID);
                while(notifRS.next()){
        %>
                <%-- When a new bid is placed in an auction they are partiicpating in --%>
               
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
        <span class = "goButton closebutton" >close</span>
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