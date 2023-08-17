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
		
	
		
		<h3 style = "color:green;margin-left:40%;margin-bottom:2%;margin-top:2%;"> 
		<%String auctionCreated = request.getParameter("auctionCreated");
	     	  		if (auctionCreated != null) {
	            out.println(auctionCreated);
	        }
	         %>
	    </h3>
	    
	    
	    <h3 style = "color:green;margin-left:40%;margin-bottom:2%;margin-top:2%;"> 
		<%String success = request.getParameter("success");
		     	  if (success != null) {
		           out.println(success);
		       	}
		         %>
	     </h3>
	     
	     <h3 style = "color:red;margin-left:40%;margin-top:2%;position:fixed;"> 
		        <%String auctionDNE = request.getParameter("auctionDNE");
		     	   if (auctionDNE != null) {
		            out.println(auctionDNE);
		         
		        }
		         %>
		   </h3>
	     
	      <h3 style = "color:red;margin-left:40%;margin-top:2%;position:fixed;"> 
		        <%String errorOne = request.getParameter("errorOne");
		     	    if (errorOne != null) {
		            out.println(errorOne);
		         
		        }
		         %>
		 </h3>
		         
		  <h3 style = "color:red;margin-left:40%;margin-top:2%;position:fixed;"> 
		        <%String errorTwo = request.getParameter("errorTwo");
		     	    if (errorTwo != null) {
		            out.println(errorTwo);
		         
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
		 
		 
		<button style = "margin-left:90%;margin-bottom:30px" class = "AuctionButton" onclick = "window.location.href='./auctionPage.jsp';">Create Auction</button>
			<form action = "./JSP/createBids.jsp" method = "get">
				<button style = "margin-left:90%;position:fixed;" type = "button" id = "bidButton" onclick="show()">Create Bid</button>
				<div class="bidShow" id = "bidShow" style = "display:none;">
			      <br>
					<div class = "auctionID" style = "color:white;margin-left:80%;margin-top:20px;margin-bottom:30px;position:fixed;">
						<label for="auctionID">Auction ID:</label>
						<input type="text" id ="auctionID" name = "auctionID">
					</div>
					<br>
		         	
					<div class = "amount" style = "color:white;margin-top:50px;margin-left:80%;position:fixed;">
						<label for="amount">&nbsp &nbsp &nbsp Amount ($):</label>
						<input type="text" id ="amount" name = "amount">
					</div>
					<br>
					<div class = autoBid style = "color:white;margin-top:70px;margin-left:90%;position:fixed;">Auto Bidding:</div>
					<div class = "increment" style = "color:white;margin-top:100px;margin-left:80%;position:fixed;">
						<label for="increment">&nbsp &nbsp Increment ($):</label>
						<input type="text" id ="increment" name = "increment">
					</div>
					<br>
					<div class = "Max Limit" style = "color:white;margin-top:150px;margin-left:80%;position:fixed;">
						<label for="increment">&nbsp Max Limit ($):</label>
						<input type="text" id ="max" name = max>
					</div>
					<br>
					<button style = "margin-left:90%;margin-top:190px;position:fixed;" id = "bidSubmit">Submit</button>
			    </div>
			</form>
	
		<button class = "searchButton" onclick = "window.location.href='./searchPage.jsp';">Filter Results</button>
		
		<h1 style = "color:white;margin-left:10px">All Active Auctions</h1>
	    <%
	    
	    Auction a = new Auction();
	    item item = new item();
	    ResultSet[] rs = a.getActiveAuctions();
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
	    
	           <h2 style = "color:white;margin-left:10px">Set an Alert</h2>
        <form action = "./JSP/alertCreated.jsp">
              <label style = "color:white;margin-left:10px" for="itemType">Type of Item</label><br>
              <input type="text" id="itemType" name="itemType"><br>
              <label style = "color:white;margin-left:10px" for="price">Price</label><br>
              <input type="text" id="price" name="price"><br>
              <label style = "color:white;margin-left:10px" for="age">Age</label><br>
              <input type="text" id="age" name="age"><br>
              <input type="submit" value="Set Alert">
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
	
	function bidHist () {
		  var message = prompt("Enter a auction ID:");
		  if (message != null)
			  window.location.href="./bidHistory.jsp?bid_id=" + message;
		  else
			  window.location.href="./welcome.jsp";
	}
	</script>
</html>

