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


<h1 style = "color:white;margin-left:10px">Bid History for Auction <%=request.getParameter("bid_id") %></h1>
<table border = "1" cellpadding = "5" style = "color:white;margin-left:10%">
    <tr>
        <th>ID</th>
        <th>Amount</th>
        <th>Author</th>
        <th>Date</th>
    </tr>
	<%
	    Auction a = new Auction();
	    int auction_id = Integer.parseInt(request.getParameter("bid_id"));
	    ResultSet rs = a.getBidHistory(auction_id);
	    
	    while (rs.next()) {
	        int bid_id = rs.getInt("bid_id");
	        float amount = rs.getFloat("amount");
	        String author = rs.getString("login_name");
	        String date = rs.getString("bid_date");
	        %>
	        <tr>
	            <td><%=bid_id%></td>
	            <td><%=amount%></td>
	            <td><%=author%></td>
	            <td><%=date%></td>
	        </tr>
	    <%}%>

</body>
	<script>
	
	function bidHist () {
		  var message = prompt("Enter a auction ID:");
		  window.location.href="./bidHistory.jsp?bid_id=" + message;
	}
	</script>
</html>