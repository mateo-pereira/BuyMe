package buyme.pkg;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Date;

public class user {
    public Connection conn;

    public user () {
        DatabaseConnector db = new DatabaseConnector();
        conn = db.getConnection();
    }

    public void create(String username, String password, int type) throws SQLException { 
        String query = "INSERT INTO Users (username,password,account_type) VALUES(?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setInt(3, type);
        stmt.executeUpdate();
    }

    public ResultSet view(String username, String password) throws SQLException {

        String query = "SELECT * FROM Users WHERE username=? and password=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        return stmt.executeQuery();
    }

    public void delete() {
    }

    public void changePassword(String username, String newPassword) throws SQLException {
        
        String query = "UPDATE Users SET password=? WHERE username=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(2, username);
        stmt.setString(1, newPassword);
        stmt.executeUpdate();
    }

    public void changeEmail(String username, String newEmail) throws SQLException {
        String query = "UPDATE Users SET email=? WHERE username=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(2, username);
        stmt.setString(1, newEmail);
        stmt.executeUpdate();
    }

    public ResultSet getAuctions(String username, boolean includeInactive) throws SQLException {
        String queryAll = "SELECT auction_id FROM Auction WHERE auction_id IN (SELECT * FROM startsAuction WHERE login_name =?)";
        String queryActive = queryAll + " WHERE end < ?";

        long millis = System.currentTimeMillis();
        Date today = new Date(millis);

        PreparedStatement stmt = conn.prepareStatement(includeInactive ? queryAll : queryActive);
        stmt.setString(1, username);
        if (includeInactive) {
            stmt.setDate(2, today);
        }

        ResultSet res = stmt.executeQuery();
        return res;

    }

    public ResultSet getBidHistory(String username) throws SQLException {
        String query = "SELECT * FROM bids WHERE login_name=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet res = stmt.executeQuery();
        return res;
    }
    
    public void sendMessage(String username, String message) throws SQLException {
        String query = "INSERT INTO Messages(author, message) VALUES(?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, message);

        stmt.executeUpdate();
    }

    public ResultSet getMessageHistory(String username) throws SQLException {
        String query = "SELECT * FROM Messages WHERE author=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet res = stmt.executeQuery();
        return res;
    }
}