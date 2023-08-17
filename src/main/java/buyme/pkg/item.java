package buyme.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class item {
    
    Connection conn;

    public item (){
        DatabaseConnector db = new DatabaseConnector();
        conn = db.getConnection();
    }

 public int createItem(int year, int age, String type) throws SQLException{
        //Update for electronics
        String update = "INSERT INTO electronics (age,year,type) VALUES (?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(update);
        stmt.setInt(1,age);
        stmt.setInt(2,year);
        stmt.setString(3,type);
        stmt.executeUpdate();
        //Query for grabbing item_id that was created
        String query = "SELECT MAX(item_id) FROM electronics";
        PreparedStatement stmtTwo = conn.prepareStatement(query);
        ResultSet rs = stmtTwo.executeQuery();
        rs.next();
        return Integer.parseInt(rs.getString(1)); //
    }
 
    public void createCar(int item_id, String make, String model, String engine) throws SQLException {
        String update = "INSERT INTO cars VALUES (?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(update);
        stmt.setInt(1,item_id);
        stmt.setString(2,make);
        stmt.setString(3,model);
        stmt.setString(4,engine);
        stmt.executeUpdate();
    }

    public void createPhone(int item_id, String camera, String brand, String size)throws SQLException{
        String update = "INSERT INTO phones VALUES (?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(update);
        stmt.setInt(1,item_id);
        stmt.setString(2,camera);
        stmt.setString(3,brand);
        stmt.setString(4,size);
        stmt.executeUpdate();
    }
    
    public void createComputer(int item_id, String gpu, String memory, String cpu)throws SQLException{
        String update = "INSERT INTO computers VALUES (?,?,?,?)";
        PreparedStatement stmt = conn.prepareStatement(update);
        stmt.setInt(1,item_id);
        stmt.setString(2,gpu);
        stmt.setString(3,memory);
        stmt.setString(4,cpu);
        stmt.executeUpdate();
    }
    
    public ResultSet getItemByID(int id) throws SQLException {
        String query = "SELECT * FROM Electronics WHERE item_id=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, id);
        return stmt.executeQuery();
    }
    
}
