package buyme.pkg;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Calendar;


public class Auction {

    Connection conn;

    public Auction () {
        DatabaseConnector db = new DatabaseConnector();
        conn = db.getConnection();
    }

    public void create(int itemID, float price, float increment, String author) throws SQLException { 
        long millis = System.currentTimeMillis();
        Date startDate = new Date(millis);

        java.util.Date utilDate = new java.util.Date(startDate.getTime());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(utilDate);
        calendar.add(Calendar.DAY_OF_MONTH, 7);

        Date endDate = new Date(calendar.getTimeInMillis());

        String query = "INSERT INTO auctions(start, end, price, item_id, increment, author) VALUES(?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);
        stmt.setFloat(3, price);
        stmt.setInt(4, itemID);
        stmt.setFloat(5, increment);
        stmt.setString(6, author);

        stmt.executeUpdate();

    }
    
    public ResultSet getAuctionByCriteria ( 
            String type, String username, float min_price, float  max_price,
            String gpu, String memory, String cpu,
            String make, String model, String engine,
            String camera, String brand, String size) throws SQLException{

                String query = "";
                if (type.equals("computer")) {
                    query = ("SELECT * FROM (Auctions a INNER JOIN Computers c ON a.item_id = c.item_id)  WHERE " +
                                    "gpu LIKE '%" + gpu + "%' AND memory LIKE '%" + memory + "%' AND " +
                                    "cpu LIKE '%" + cpu + "%'");
                }

                else if (type.equals("phone")) {
                    query = ("SELECT * FROM Auctions a INNER JOIN Phones p ON a.item_id = p.item_id " +
                                    "WHERE camera LIKE '%" + camera + "%' AND brand LIKE '%" + brand + "%' AND " +
                                    "size LIKE '%" + size + "%'");
                }

                else {
                    query = ("SELECT * FROM (Auctions a INNER JOIN Cars c ON a.item_id = c.item_id) " +
                                    "WHERE make LIKE '%" + make + "%' AND model LIKE '%" + model + "%' AND " +
                                    "engine LIKE '%" + engine + "%'");
                }
                
                System.out.println(query);
                String fullQuery = query + (" AND price > " + String.valueOf(min_price) + 
                                    " AND price < " + String.valueOf(max_price));
                System.out.println(fullQuery);

                if (username.length() != 0) {
                    fullQuery += " AND author ='" + username+ "'";
                }

                PreparedStatement stmt = conn.prepareStatement(fullQuery);
                ResultSet res = stmt.executeQuery();

                return res;
            }


    public void view() {

    }

    public void delete() {

    }

    public void edit() {
        
    }
    
    public ResultSet getBidHistory(int auction_id) throws SQLException {
        String query = "SELECT * FROM Bids WHERE auction_id=?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, auction_id);
        ResultSet res = stmt.executeQuery();
        return res;
    }
    
    public ResultSet[] getActiveAuctions() throws SQLException {
        long millis = System.currentTimeMillis();
        Date today = new Date(millis);

        String query = "SELECT * FROM Auctions a INNER JOIN ";
        String computer = query + "Computers c ON a.item_id = c.item_id";
        String car = query + "Cars c ON a.item_id = c.item_id";
        String phone = query + "Phones p ON a.item_id = p.item_id";

        PreparedStatement getComputer = conn.prepareStatement(computer);
        PreparedStatement getCar = conn.prepareStatement(car);
        PreparedStatement getPhone = conn.prepareStatement(phone);
        
        ResultSet[] res = new ResultSet[3];
        res[0] = getComputer.executeQuery();
        res[1] = getCar.executeQuery();
        res[2] = getPhone.executeQuery();
        return res;      
    }
    
    public ResultSet[] getYourActiveAuctions(String author) throws SQLException {
        long millis = System.currentTimeMillis();
        Date today = new Date(millis);

        String query = "SELECT * FROM Auctions a INNER JOIN ";
        String computer = query + "Computers c ON a.item_id = c.item_id WHERE author=?";
        String car = query + "Cars c ON a.item_id = c.item_id WHERE author=?";
        String phone = query + "Phones p ON a.item_id = p.item_id WHERE author=?";
        
        PreparedStatement getComputer = conn.prepareStatement(computer);
        PreparedStatement getCar = conn.prepareStatement(car);
        PreparedStatement getPhone = conn.prepareStatement(phone);
        
        getComputer.setString(1, author);;
        getCar.setString(1, author);
        getPhone.setString(1, author);

        ResultSet[] res = new ResultSet[3];
        res[0] = getComputer.executeQuery();
        res[1] = getCar.executeQuery();
        res[2] = getPhone.executeQuery();
        return res;      
    }
    
}