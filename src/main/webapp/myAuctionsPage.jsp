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
                        <li><a href = "#">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
		</nav>
	</header>
	
	<h1 style = "color:white;margin-left:10px">Your Auctions</h1>
	
	<%
    	String username = (String)session.getAttribute("username");
	
	    Auction a = new Auction();
	    item item = new item();
	    ResultSet[] rs = a.getYourActiveAuctions(username);
	    String[][] attrs = {{"GPU", "MEMORY", "CPU"}, 
	                        {"MAKE", "MODEL", "ENGINE"},
	                        {"CAMERA", "BRAND", "SIZE"}
	                        };
	    String[] headers = {"Computers", "Cars", "Phones"};
		
	    for (int i = 0; i < 3; i++) {
	        %>
	        <table border = "1" cellpadding = "5" style = "color:white;margin-left:10px">
	        <h2 style = "color:white;margin-left:10px"><%=headers[i]%></h2>
	            <tr>
	                <th>ID</th>
	                <th>End Date</th>
	                <th>Price</th>
	                <th>Author</th>
	            <%
	            for (int j = 0; j < attrs[i].length; j++) { %>
	                <th><%= attrs[i][j]%></th>
	            <%}%>
	            </tr>
	            
	        <%
	        while (rs[i].next()) {
	            int auction_id = rs[i].getInt("auction_id");
	            String end_date = rs[i].getString("end");
	            double price = rs[i].getFloat("price");
	            int item_id = rs[i].getInt("item_id");
	            String author = rs[i].getString("author");
	            %>
	            <tr>
		            <td><%= auction_id%></td>
		            <td><%= end_date%></td>
		            <td><%= price%></td>
		            <td><%= author%></td>
	            <%  if (i == 0) {
	                String gpu = rs[i].getString("gpu");
	                String memory = rs[i].getString("memory");
	                String cpu = rs[i].getString("cpu");
	                %>
	                <td><%= gpu%></td>
	                <td><%= memory%></td>
	                <td><%= cpu%></td>
	            <%}
	            else if (i == 1) {
	                String make = rs[i].getString("make");
	                String model = rs[i].getString("model");
	                String engine = rs[i].getString("engine");
	                %>
	                <td><%= make%></td>
	                <td><%= model%></td>
	                <td><%= engine%></td>
	                
	            <%}
	            else {
	                String camera = rs[i].getString("camera");
	                String brand = rs[i].getString("brand");
	                String size = rs[i].getString("size");
	                %>
	                <td><%= camera%></td>
	                <td><%= brand%></td>
	                <td><%= size%></td>
	            </tr>
	            <%}
	        }
	    }
	    %>
	    </table>


</body>
	<script>
	
	function bidHist () {
		  var message = prompt("Enter a auction ID:");
		  if (message != null)
			  window.location.href="./bidHistory.jsp?bid_id=" + message;
		  else
			  window.location.href="./myAuctionsPage.jsp";
	}
	</script>
</html>