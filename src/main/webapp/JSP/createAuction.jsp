<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="buyme.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src = ".././JavaScript/script.js"></script>
<meta charset="ISO-8859-1">
<title>Creating Auction</title>
</head>
<body>
<%
try{
	
	item i = new item();
	int year = Integer.parseInt(request.getParameter("year"));
	int age = Integer.parseInt(request.getParameter("age"));
	String type = request.getParameter("menu"); 
	
	if (type.equals("1")){
		type = "car";
	}
	else if (type.equals("2")){
		type = "phone";
	}
	else if (type.equals("3")){
		type = "computer";
	}
	
	int item_id = i.createItem(year,age,type); //Item created, returning with item_id
	
	
	if (type.equals("car")){ //car
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String engine = request.getParameter("engine");
		i.createCar(item_id,make,model,engine);
	}
	else if (type.equals("phone")){ //phone
		String camera = request.getParameter("camera");
		String brand = request.getParameter("brand");
		String size = request.getParameter("size");
		i.createPhone(item_id,camera,brand,size);
	}
	else if (type.equals("computer")){ //computer
		String gpu = request.getParameter("gpu");
		String memory = request.getParameter("memory");
		String cpu = request.getParameter("cpu");
		i.createComputer(item_id,gpu,memory,cpu);
	}
	
	Auction a = new Auction();
	String author = (String)session.getAttribute("username");
	float price = Float.parseFloat(request.getParameter("price"));
	float increment = Float.parseFloat(request.getParameter("increment"));
	a.create(item_id,price,increment,author);
	
	response.sendRedirect(".././welcome.jsp?auctionCreated=Auction Created");
}
catch (Exception e){
	e.printStackTrace();
}


%>


</body>
</html>
