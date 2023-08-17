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
			<a href ="./welcome.jsp" class = "nav-branding">BuyMe</a>
			<ul class = "nav-menu">
				<li class = "nav-item">
					<a href ="./welcome.jsp" class = "nav-link">Home</a>
				</li>
				<li class = "nav-item">
					<a href ="./myAuctionsPage.jsp" class = "nav-link">My Auctions</a>
				</li>
				<li class = "nav-item">
					<a href ="#" onclick = "bidHist()" class = "nav-link">Bid History</a>
				</li>
				<li class = "nav-item">
					<a href ="./messages.jsp" class = "nav-link">Messages</a>
				</li>
                <li class = "nav-item">
                    <a href = "./welcome.jsp" class = "nav-link">Settings &#9662</a>
                    <ul class = "dropdown">
                        <li><a href = "./JSP/deleteAccount.jsp">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
		</nav>
	</header>

    <p style = "color:green;margin-left:26%;margin-bottom:5%"> 
    <%String success = request.getParameter("success");
           if (success != null) {
       out.println(success);
   }
    %>
    
<h1 style = "color:white;margin-left:10px">Your Message History</h1>
<table border = "1" cellpadding = "5" style = "color:white;margin-left:10px">
    <tr>
        <th>Question</th>
        <th>Response</th>
    </tr>
    <% 
    user u = new user();
    String username = (String)session.getAttribute("username");
    ResultSet rs = u.getMessageHistory(username);
    while (rs.next()) {
        String question = rs.getString("message");
        String resp = rs.getString("response");
        %>
        <tr>
            <td><%=question%></td>
            <td><%=resp %></td>
        <%}%>        
</table>
<form action="./JSP/sendMessage.jsp" method = "get" style = "color:white;margin-left:10px;margin-top:40px;">
    <label for="message">What would you like to say?</label>
    <input type="text" id="message" name="message"><br>
    <input style = "margin-top:20px;margin-left:15%;" type="submit" value="Send">
</form>


</body>
		<script>
	
		function bidHist () {
			  var message = prompt("Enter a auction ID:");
			  if (message != null)
				  window.location.href="./bidHistory.jsp?bid_id=" + message;
			  else
				  window.location.href="./messages.jsp";
		}
	</script>
</html>