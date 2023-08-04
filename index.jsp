<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src = "./script.js" defer></script>
	<link rel = "stylesheet" href = "./styles.css">	
    <title>Login</title>
</head>
<body>
        <form action="login.jsp" method = "get">
       	<div class = "form">
	        <h2>WELCOME</h2>
	        <p style = "color:red;margin-left:31.5%;margin-bottom:5%"> 
	        <%String error = request.getParameter("error");
	     	        if (error != null) {
	            out.println(error);
	         
	        }
	         %>
	         
	         <p style = "color:green;margin-left:27%;margin-bottom:5%"> 
	         <%String success = request.getParameter("success");
	     	  		if (success != null) {
	            out.println(success);
	        }
	         %>

	         </p>
	       
	        <p class = username>Username</p>
	        <input type = "text" name = "username" placeholder="Enter username" id = "username">
	        <p class = password>Password</p>
	        <input type = "password" name = "password" placeholder="Enter Password" id = "password">
	        <img src = "./Images/eye-close.png" id = "eyeicon">
	        <button id = "loginButton">LOGIN</button>
	        <p class = "link">Don't have an account?
	            <a href = "./signUp.jsp">Sign up</a>
	        </p>
   		 </div>     
        </form>       
</body>
</html>
