package buyme.pkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
    public DatabaseConnector () {}
    
    public Connection getConnection() {
        String connectionUrl = "jdbc:mysql://127.0.0.1:3306/CS_Project";
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(connectionUrl, "root", "1453");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
        
    }
    
    public void closeConnection(Connection connection){
        try {
            connection.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
