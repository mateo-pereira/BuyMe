<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src = "./script.js" defer></script>
	<link rel = "stylesheet" href = "./styles.css">	
	<title>Sign-Up</title>
</head>
<body>
	 <form action="registration.jsp" method = "get">
       	<div class = "form">
	        <h2>REGISTRATION</h2>
	        <p style = "color:red;margin-left:21%;margin-bottom:5%"> 
	        <%String error = request.getParameter("error");
	        	if (error != null) {
	            out.println(error);
	        }
	         %>
	         
	         <p style = "color:red;margin-left:26%;margin-bottom:5%"> 
	         <%String passError = request.getParameter("passError");
	        		if (passError != null) {
	            out.println(passError);
	        }
	         %>
	         </p>
	       
	        <p class = username>Username</p>
	        <input type = "text" name = "username" placeholder="Enter username" id = "username">
	        <p class = password>Password</p>
	        <input type = "password" name = "password" placeholder="Enter Password" id = "password">
	        <img src = "./Images/eye-close.png" id = "eyeicon">
	        <p style = "margin-top:35px" class = "confirm">Confirm Password</p>
	        <input type = password name = "confirm-pass" placeholder="Re-Enter Password" id = "confirm">
	        <button id = "register">REGISTER</button>
	        <p class = "link" id = "loginLink">Already have an account?
	            <a href = "./index.jsp">Login</a>
	        </p>
   		 </div>     
        </form>       
</body>
</html>