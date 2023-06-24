package bjit.academy;

import java.sql.*;

public class DBOperations {

    Connection conn;
    public void doConnectDB(){
        String connectionStr = "jdbc:mysql://localhost:3306/bjit_db";
        String user = "root";
        String password = "";

        try {
            conn = DriverManager.getConnection(connectionStr, user, password);
            System.out.println("DB Connection is successful!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void fetchData() {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM expense");

            while (rs.next()) {
                String category = rs.getString("category");
                Date date = rs.getDate("date");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double amount = rs.getDouble("amount");
                System.out.println("Category: " + category + ", Date: " + date + ", Name: " + name + ", Amount: " + amount + ", Description: " + description);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args){
        DBOperations dbObj = new DBOperations();
        dbObj.doConnectDB();
        dbObj.fetchData();
    }
}