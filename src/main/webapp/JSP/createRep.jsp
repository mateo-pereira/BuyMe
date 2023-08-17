<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Customer Rep</title>
</head>
<body>
<%
try {
    user u = new user();
    Connection conn = u.conn;
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String check = "SELECT * FROM Users WHERE username=?";
    PreparedStatement stmt = conn.prepareStatement(check);
    stmt.setString(1, username);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
    	response.sendRedirect(".././adminPage.jsp?error=Account already exists");
    }
    else {
        u.create(username, password, 2);
        response.sendRedirect(".././adminPage.jsp?success=Customer Representative account has been created");
    }
}
catch (Exception e) {
    
}

%>
</body>
</html>