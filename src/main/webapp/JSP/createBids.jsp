<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid Creation</title>
</head>
<body>

</body>

<%
try{
	Bid b = new Bid();
	Connection conn = b.conn;
	int auctionID = Integer.parseInt(request.getParameter("auctionID"));
	float amount = Float.parseFloat(request.getParameter("amount"));
	String username = (String)session.getAttribute("username");
	
	String query = "SELECT price FROM auctions WHERE auction_id=?";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setInt(1,auctionID);
	ResultSet rs = stmt.executeQuery();
	if (rs.next()){
		float highestBid = Float.parseFloat(rs.getString(1));
	    
	    String queryTwo = "SELECT increment FROM auctions WHERE auction_id=?";
		PreparedStatement stmtTwo = conn.prepareStatement(queryTwo);
		stmtTwo.setInt(1,auctionID);
		ResultSet rsTwo = stmtTwo.executeQuery();
		rsTwo.next();
	    int increment = Integer.parseInt(rsTwo.getString(1));
	   
	    
		if (amount >= increment + highestBid){
			b.createBid(amount,username,auctionID);
			String update = "UPDATE auctions SET price=? WHERE auction_id=?";
			PreparedStatement stmtThree = conn.prepareStatement(update);
			stmtThree.setFloat(1,amount);
			stmtThree.setInt(2,auctionID);
			stmtThree.executeUpdate();
			
			response.sendRedirect("../welcome.jsp?success=Bid has been created");
		}
		else if (amount <= highestBid){
			response.sendRedirect("../welcome.jsp?errorOne=Bid is not higher than the current highest bid");
		}
		else if (amount> highestBid && amount < highestBid + increment){
			response.sendRedirect("../welcome.jsp?errorTwo=Must bid higher or equal to the increment");
		}
		else{
			response.sendRedirect("../welcome.jsp?error=Error");
		}
	}
	else{
		response.sendRedirect("../welcome.jsp?auctionDNE=Auction does not exist");
	}
	
}
catch (Exception e){
	e.printStackTrace();
	response.sendRedirect("../welcome.jsp?auctionDNE=Error");
}


%>
</html>