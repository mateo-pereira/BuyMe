<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleting User</title>
</head>
<body>
<%
try{
	user u = new user();
	response.sendRedirect("../index.jsp?success=Successfully deleted account");
	
	/*Connection conn = u.conn;
	String username = (String)session.getAttribute("username");
	String updateTwo = "DELETE FROM auctions WHERE author=?";
	PreparedStatement stmtTwo = conn.prepareStatement(updateTwo);
	stmtTwo.setString(1,username);
	stmtTwo.executeUpdate();

	String update = "DELETE FROM users WHERE username=?";
	PreparedStatement stmt = conn.prepareStatement(update);
	stmt.setString(1,username);
	stmt.executeUpdate();
	out.println(username);
	
	response.sendRedirect("../index.jsp?deleted=Successfully deleted account");
	*/
	
}
catch (Exception e){
	e.printStackTrace();
}


%>


</body>
</html>
