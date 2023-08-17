package buyme.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class Bid {
	public Connection conn;
	
	public Bid () {
        DatabaseConnector db = new DatabaseConnector();
        conn = db.getConnection();
    }
	
	public void createBid(float amount, String login_name, int auction_id) throws SQLException{
		String create = "INSERT INTO bids (amount,login_name,auction_id,bid_date) VALUES (?,?,?,?)";
		long millis = System.currentTimeMillis();
        Date today = new Date(millis);
		PreparedStatement stmt = conn.prepareStatement(create);
		stmt.setFloat(1, amount);
		stmt.setString(2,login_name);
		stmt.setInt(3, auction_id);
		stmt.setDate(4, today);
		stmt.executeUpdate();
	}
	
	
}