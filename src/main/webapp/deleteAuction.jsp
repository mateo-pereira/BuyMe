<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
</head>
<body>
<%
try{
	user u = new user();
	int auctionID = Integer.parseInt(request.getParameter("auctionID"));
	Connection conn = u.conn;
	String query = "DELETE FROM Auctions WHERE auction_ID=?";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setInt(1,auctionID);
	if (stmt.executeUpdate() == 1){
		response.sendRedirect("./customerRep.jsp?success=Auction Deleted");
	}
	else{
		response.sendRedirect("./customerRep.jsp?error=Auction does not exist");
	}
}
catch (Exception e){
	e.printStackTrace();
	response.sendRedirect("./customerRep.jsp?error=Message ID must be an integer");
}



%>

</body>
</html>