package buyme.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Messages {
    Connection conn;

    public Messages () {
        DatabaseConnector db = new DatabaseConnector();
        conn = db.getConnection();
    }

    public ResultSet getOpenMessages() throws SQLException {
        String query = "SELECT * FROM Messages WHERE response= 'No response'";
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        return rs;

    }


}