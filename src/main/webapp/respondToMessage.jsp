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
try{
	user u = new user();
	int messageID = Integer.parseInt(request.getParameter("messageID"));
	String responseMsg = request.getParameter("responseMsg");
	Connection conn = u.conn;

	String query = "UPDATE Messages SET response=? WHERE MESSAGE_ID=?";
	PreparedStatement stmt = conn.prepareStatement(query);
	stmt.setString(1,responseMsg);
	stmt.setInt(2,messageID);
	if (stmt.executeUpdate() == 1){
		response.sendRedirect("./customerRep.jsp?success=Message Sent");
	}
	else{
		response.sendRedirect("./customerRep.jsp?error=Error, message not sent");
	}
	
	
}
catch (Exception e){
	e.printStackTrace();
	response.sendRedirect("./customerRep.jsp?error=Message ID can only be an integer");
}


%>

</body>
</html>
