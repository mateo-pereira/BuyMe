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
    String confirm = request.getParameter("confirm-pass");
    String queryOne = "SELECT username FROM users WHERE username=?";
    
    if (!password.equals(confirm)) {
        response.sendRedirect(".././signUp.jsp?passError=Passwords do not match, please try again");
    }
    
    PreparedStatement stmt = conn.prepareStatement(queryOne);
    stmt.setString(1, username);

    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
    	response.sendRedirect(".././signUp.jsp?error=User already taken, please choose another name");
    } 
    else {
    	String queryTwo = "INSERT INTO users (username,password,account_type) values (?,?,?)";
    	PreparedStatement stmt2 = conn.prepareStatement(queryTwo);
    	stmt2.setString(1,username);
    	stmt2.setString(2,password);
    	stmt2.setInt(3,1);
    	int rs2 = stmt2.executeUpdate();
    	response.sendRedirect(".././index.jsp?success=Account has been successfully created");
    }
    db.closeConnection(conn);
}
catch (Exception e) {
    e.printStackTrace();
}

%>
</body>
</html>