<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border = "1" cellpadding = "5" style = "color:white;margin-left:10px">
<h2 style = "color:white;margin-left:10px">All Matching Auctions</h2>
<tr> 
    <th>ID</th>
    <th>End Date</th>
    <th>Price</th>
</tr>
<%
Auction a = new Auction();
String type = request.getParameter("menu");
String username = request.getParameter("author");
username = username == null ? "" : username;
String min_price_str = request.getParameter("min_price");
String max_price_str = request.getParameter("max_price");
String gpu = request.getParameter("gpu");
String memory = request.getParameter("memory");
String cpu = request.getParameter("cpu");
String make = request.getParameter("make");
String model = request.getParameter("model");
String engine = request.getParameter("engine");
String camera = request.getParameter("camera");
String brand = request.getParameter("brand");
String size_str = request.getParameter("size");

if (type.equals("1"))
    type = "car";
else if (type.equals("2"))
    type = "phone";
else
    type = "computer";


float min_price, max_price;


min_price = min_price_str == "" || min_price_str == null ? 0 : Float.parseFloat(min_price_str);
max_price = max_price_str == "" || max_price_str == null ? 1000000 : Float.parseFloat(max_price_str);

ResultSet rs = a.getAuctionByCriteria(type, username, min_price, max_price,
                                       gpu, memory, cpu, make, model, engine,
                               camera, brand, size_str);

while (rs.next()) {
    int auction_id = rs.getInt("auction_id");
    String end_date = rs.getString("end");
    double price = rs.getFloat("price");
    %>
    <tr>
        <td><%= auction_id%></td>
        <td><%= end_date%></td>
        <td><%= price%></td>
    </tr>
    
<% }%>
 </table>  

</body>

<script>
	
		function bidHist () {
			  var message = prompt("Enter a auction ID:");
			  if (message != NULL)
				  window.location.href="./JSP/bidHistory.jsp?bid_id=" + message;
			  else
				  window.location.href="./filterResults.jsp";
		}
	</script>
</html>