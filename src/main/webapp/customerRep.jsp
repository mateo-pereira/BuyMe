<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "./CSS/welcomeStyles.css">    
    <title>HomePage</title>
</head>
<body>
    <header>
		<nav class = "navbar">
			<a href ="./customerRep" class = "nav-branding">BuyMe</a>
			<ul class = "nav-menu">
				<li class = "nav-item">
					<a href ="./customerRep.jsp" class = "nav-link">Home</a>
				</li>
                <li class = "nav-item">
                    <a href = "./customerRep.jsp" class = "nav-link">Settings &#9662</a>
                    <ul class = "dropdown">
                        <li><a href = "./JSP/deleteAccount.jsp">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
		</nav>
	</header>
    
    
    <h3 style = "color:green;margin-left:40%;margin-bottom:2%;margin-top:2%;"> 
		<%String success = request.getParameter("success");
		     	  if (success != null) {
		           out.println(success);
		       	}
		         %>
	     </h3>
	     
	     <h3 style = "color:red;margin-left:40%;margin-top:2%;position:fixed;"> 
		        <%String error = request.getParameter("error");
		     	   if (error != null) {
		            out.println(error);
		         
		        }
		         %>
		   </h3>

    <h2 style = "color:white;margin-left:10px">All Unanswered Inqueries</h2>
    <table border = "1" cellpadding = "5" style = "color:white;margin-left:10px">
        <tr>
            <th>ID</th>
            <th>Author</th>
            <th>Question</th>
        </tr>
    <%
    Messages m = new Messages();
    ResultSet rs = m.getOpenMessages();
    while (rs.next()) {
        int id = rs.getInt("message_id");
        String author = rs.getString("author");
        String message = rs.getString("message");
        %>
        <tr>
            <td><%=id %></td>
            <td><%=author %></td>
            <td><%=message %></td>
        </tr>
    <%}
    %>
        </table>
    
    <h2 style = "color:white;margin-left:10px">Change a User's Password</h2>
    <form action = "./changePassword.jsp">
        <label style = "color:white;margin-left:10px" for="username">Username</label><br>
        <input type="text" id="username" name="username"><br>
        <label style = "color:white;margin-left:10px;" for="newPass">New Password</label><br>
        <input type="text" id="newPass" name="newPass"><br>
        <input style="margin-top:10px;margin:20px;" type="submit" value="Change">
    </form>
    
    <h2 style = "color:white;margin-left:10px">Respond to a Message</h2>
    <form action = "./respondToMessage.jsp">
        <label style = "color:white;margin-left:10px;" for="messageID">Message ID</label><br>
        <input type="text" id="messageID" name="messageID"><br>
        <label style = "color:white;margin-left:10px;" for="responseMsg">Response</label><br>
        <input type="text" id="responseMsg" name="responseMsg"><br>
        <input style="margin-top:10px;margin:20px;" type="submit" value="Send Response">
    </form>
    
    <h2 style = "color:white;margin-left:10px">Delete Auction</h2>
    <form action="./deleteAuction.jsp">
        <label style = "color:white;margin-left:10px;" for="auctionID">Auction ID</label><br>
        <input type="text" id="auctionID" name="auctionID"><br>
        <input style="margin-top:10px;margin:20px;" type="submit" value="Delete Auction">
    </form>
    
    <h2 style = "color:white;margin-left:10px">Delete Bid</h2>
    <form action = "./deleteBid.jsp">
        <label style = "color:white;margin-left:10px;" for="bidID">Bid ID</label><br>
        <input type="text" id="bidID" name="bidID"><br>
        <input style="margin-top:10px;margin:20px;" type="submit" value="Delete Bid">
    </form>
 </body>


    <script>
    function show() {
          var x = document.getElementById("bidShow");
          if (x.style.display == "block") {
            x.style.display = "none";
          } else {
            x.style.display = "block";
          }
        }
    
    </script>
</html> 