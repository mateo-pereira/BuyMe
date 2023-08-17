<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bid</title>
</head>
<body>
<%

try{
	user u = new user();
	int bidID = Integer.parseInt(request.getParameter("bidID"));
	Connection conn = u.conn;
	
	String getBid = "SELECT auction_id FROM Bids WHERE bid_id=?";
	String query = "DELETE FROM BIDS WHERE bid_ID=" + bidID;
	String getLast = "SELECT * FROM Bids b WHERE b.bid_id in (SELECT MAX(b2.bid_id) FROM Bids b2 WHERE b2.auction_id=?)";
	
	PreparedStatement stmt = conn.prepareStatement(getBid);
	stmt.setInt(1, bidID);
	ResultSet rs = stmt.executeQuery();
	if (rs.next()) {
		int auctionID = rs.getInt("auction_id");
		stmt = conn.prepareStatement(query);
		stmt.executeUpdate();
		
		stmt = conn.prepareStatement(getLast);
		stmt.setInt(1, auctionID);
		rs = stmt.executeQuery();
		float price;
		if (rs.next()) {
		    price = rs.getFloat("amount");
		}
		else {
		    price = 0;
		}
		stmt = conn.prepareStatement("UPDATE Auctions SET price=? WHERE auction_id=?");
		stmt.setFloat(1, price);
		stmt.setInt(2, auctionID);
		stmt.executeUpdate();
		response.sendRedirect("./customerRep.jsp?success=Bid Deleted");
	}
	else{
		response.sendRedirect("./customerRep.jsp?error=Bid does not exist");
	}
	
	
}
catch (Exception e){
	response.sendRedirect("./customerRep.jsp?error=Bid_ID must be an integer");
}



%>

</body>
</html>

