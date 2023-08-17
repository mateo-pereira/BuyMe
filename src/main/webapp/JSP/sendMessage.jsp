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
    user u = new user();
    String username = (String) session.getAttribute("username");
    String message = request.getParameter("message");
    u.sendMessage(username, message);
    response.sendRedirect(".././messages.jsp?success=Successfully sent your message!");
}
catch (Exception e)  {
    
}

%>
</body>
</html>