<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src = "./JavaScript/script.js" defer></script>
    <link rel = "stylesheet" href = "./CSS/welcomeStyles.css">	
	<title>HomePage</title>
</head>
<body>
		<header>
		<nav class = "navbar">
			<a href ="./welcome.jsp" class = "nav-branding">BuyMe</a>
			<ul class = "nav-menu">
				<li class = "nav-item">
					<a href ="./welcome.jsp" class = "nav-link">Home</a>
				</li>
				<li class = "nav-item">
					<a href ="./myAuctionsPage.jsp" class = "nav-link">My Auctions</a>
				</li>
				<li class = "nav-item">
					<a href ="#" onclick = "bidHist()" class = "nav-link">Bid History</a>
				</li>
				<li class = "nav-item">
					<a href ="./messages.jsp" class = "nav-link">Messages</a>
				</li>
                <li class = "nav-item">
                    <a href = "./welcome.jsp" class = "nav-link">Settings &#9662</a>
                    <ul class = "dropdown">
                        <li><a href = "./JSP/deleteAccount.jsp">Delete Account</a></li>
                        <li><a href = "#" id = "button" onclick="window.location.href='./index.jsp';">
                            Logout</a></li>
                    </ul>
                </li>
			</ul>
		</nav>
	</header>
	
	<h2 class = "AuctionCreate">Create Auction</h2>
	<form action = "./JSP/createAuction.jsp" method = get>
			<div class = "dropdownType">
				<div class = "select">
					<span class = "selected">Item Type</span>
					<div class = "caret"></div>
				</div>
				<select class = "menu" id = "dropdownMenu" name = "menu">
					<option value = "1">Car</option>
					<option value = "2">Phone</option>
					<option value = "3">Computer</option>
				</select>
			</div>

			<div id = "electronicForm">
				<div class = "label">
					<label for="price">Price ($) :</label>
					<input type="text" id ="price" name = "price">
				</div>
				<br>
				<div class = "label">
					<label for="increment">Minimum Increment ($):</label>
					<input type="text" id ="increment" name = "increment">
				</div>
				<br>
				<div class = "label">
					<label for="increment">Hidden Minimum ($):</label>
					<input type="text" id ="minimum" name = "minimum">
				</div>
				<br>
				<div class = "label">
					<label for="increment">Closing Date:</label>
					<input type="text" id ="closing date" name = "closing date">
				</div>
				<br>
				<div class = "label">
					<label for="year">Year Manufactured:</label>
					<input type="text" id ="year" name = "year">
				</div>
				<br>
				<div class = "label">
					<label for="age">Age (Years):</label>
					<input type="text" id ="age" name = "age">
				</div>
				<br>
			</div>

		<div class = "form-container" id = "form1">
				<br>
				<div class = "label">
					<label for="make">Make:</label>
					<input type="text" id ="make" name = "make" placeholder="Ex. Ford, Toyota, BMW">
				</div>
				<br>
				<div class = "label">
					<label for="model">Model:</label>
					<input type="text" id ="model" name = "model" placeholder="Ex. Civic, Escape, Altima">
				</div>
				<br>
				<div class = "label">
					<label for="engine">Engine:</label>
					<input type="text" id ="engine" name = "engine" placeholder="Engine Description">
				</div>
				<br>
		</div>
		
		<div class = form-container id = "form2">
				<div class = "label">
				<br>
					<label for="brand">Brand:</label>
					<input type="text" id ="brand" name = "brand" placeholder="Ex. Apple, Android">
				</div>
				<br>
				<div class = "label">
					<label for="camera">Camera:</label>
					<input type="text" id ="camera" name = "camera" placeholder="Camera Description">
				</div>
				<br>
				<div class = "label">
					<label for="size">Size:</label>
					<input type="text" id ="size" name = "size" placeholder="Size Description">
				</div>
		</div>
			
		<div class = form-container id = "form3">
				<div class = "label">
				<br>
					<label for="cpu">CPU:</label>
					<input type="text" id ="cpu" name = "cpu" placeholder="CPU Description">
				</div>
				<br>
				<div class = "label">
					<label for="gpu">GPU:</label>
					<input type="text" id ="gpu" name = "gpu" placeholder="GPU Description">
				</div>
				<br>
				<div class = "label">
					<label for="memory">Memory:</label>
					<input type="text" id ="memory" name = "memory" placeholder="Memory Description">
				</div>
				<br>
			</div>
		<br>
			<button id = "auctionSubmit">Submit</button>
	</form>


</body>

	<script>
	
	function bidHist () {
		  var message = prompt("Enter a auction ID:");
		  if (message != null)
			  window.location.href="./bidHistory.jsp?bid_id=" + message;
		  else
			  window.location.href="./auctionPage.jsp";
	}
	</script>
</html>

















