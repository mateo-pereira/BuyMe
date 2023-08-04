<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src = "./script.js"></script>
<link rel = "stylesheet" href = "./styles.css">
</head>
<body>
<%
try {
    DatabaseConnector db = new DatabaseConnector();
    Connection conn = db.getConnection();
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String query = "SELECT username FROM users WHERE username=? and password=?";
    
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setString(1, username);
    stmt.setString(2, password);
    
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
        String redirect = "welcome.jsp";
        response.sendRedirect(redirect);
    } 
    else {
    	response.sendRedirect("index.jsp?error=Incorrect username or password");
    }
    db.closeConnection(conn);
}
catch (Exception e) {
    e.printStackTrace();
}

%>
</body>
</html>