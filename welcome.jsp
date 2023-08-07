<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src = "./script.js" defer></script>
    <link rel = "stylesheet" href = "./welcomeStyles.css">	
	<title>HomePage</title>
</head>
<body>
	<header>
		<nav class = "navbar">
			<a href ="#" class = "nav-branding">BuyMe</a>
			<ul class = "nav-menu">
				<li class = "nav-item">
					<a href ="#" class = "nav-link">Home</a>
				</li>
				<li class = "nav-item">
					<a href ="#" class = "nav-link">My Auctions</a>
				</li>
				<li class = "nav-item">
					<a href ="#" class = "nav-link">Bid History</a>
				</li>
                <li class = "nav-item">
                    <a href = "#" class = "nav-link">Settings &#9662</a>
                    <ul class = "dropdown">
                        <li><a href = "#">Change Password</a></li>
                        <li><a href = "#">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
			
			<div class = "hamburger">
				<span class = "bar"> </span>
				<span class = "bar"> </span>
				<span class = "bar"> </span>
			</div>
		</nav>
	
	</header>
</body>
</html>