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
    Connection conn = u.conn;
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    ResultSet rs = u.view(username, password);
    if (rs.next()) {
    	session.setAttribute("username",username);
        String user = ".././welcome.jsp";
        String rep = ".././customerRep.jsp";
        String admin = ".././adminPage.jsp";
        
        int type = rs.getInt("account_type");
        if (type == 1) response.sendRedirect(user);
        if (type == 2) response.sendRedirect(rep);
        if (type == 3) response.sendRedirect(admin);
        
    } 
    else {
        response.sendRedirect("../index.jsp?error=Incorrect username or password");
    }
}
catch (Exception e) {
    e.printStackTrace();
}

%>
</body>
</html>