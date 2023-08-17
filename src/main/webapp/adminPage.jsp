<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "./CSS/welcomeStyles.css">    
    <title>HomePage</title>
</head>
<body>
     <header>
		<nav class = "navbar">
			<a href ="./adminPage.jsp" class = "nav-branding">BuyMe</a>
			<ul class = "nav-menu">
				<li class = "nav-item">
					<a href ="./adminPage.jsp" class = "nav-link">Home</a>
				</li>
                <li class = "nav-item">
                    <a href = "./adminPage.jsp" class = "nav-link">Settings &#9662</a>
                    <ul class = "dropdown">
                        <li><a href = "./JSP/deleteAccount.jsp">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
		</nav>
	</header>
    
    <h3 style = "color:red;margin-left:40%;margin-top:2%;position:fixed;"> 
		        <%String error = request.getParameter("error");
		     	   if (error != null) {
		            out.println(error);		         
		        }
		         %>
		   </h3>
		   
	<h3 style = "color:green;margin-left:40%;margin-bottom:2%;margin-top:2%;"> 
		<%String success = request.getParameter("success");
		     	  if (success != null) {
		           out.println(success);
		       	}
		         %>
	     </h3>
    
    <h2 style = "color:white;margin-left:10px">Create Customer Rep Account</h2>
    <form action = "./JSP/createRep.jsp">
        <label style = "color:white;margin-left:10px" for="username">Username</label><br>
        <input type="text" id="username" name="username"><br>
        <label style = "color:white;margin-left:10px" for="password">Password</label><br>
        <input type="text" id="password" name="password"><br>
        <input style = "margin:10px;"type="submit" value="Create">
    </form>

    <h2 style = "color:white;margin-left:10px">Generate Sales Summary</h2>
    <button>Total Earnings</button>
    <button>Earnings per Item</button>
    <button>Earnings per User</button>
    
 </body>

</html> 