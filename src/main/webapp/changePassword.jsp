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
user u = new user();
String username = request.getParameter("username");
String newPassword = request.getParameter("newPass");
Connection conn = u.conn;

String query = "SELECT * FROM Users WHERE username='" +  username + "'";
PreparedStatement stmt = conn.prepareStatement(query);
ResultSet rs = stmt.executeQuery();
if(rs.next()) {
    u.changePassword(username, newPassword);
    response.sendRedirect("./customerRep.jsp?success=Changed this users password");
}
else {
    response.sendRedirect("./customerRep.jsp?error=That user does not exist");
}

%>

</body>
</html>