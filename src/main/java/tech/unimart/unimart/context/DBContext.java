package tech.unimart.unimart.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC Driver
//            String user = "root"; // MySQL username
//            String pass = "Bmcdc54@"; // MySQL password
//            String url = "jdbc:mysql://localhost:3306/unimartDB"; // MySQL URL and database name
//            String url = "jdbc:mysql://db:3306/unimartDB"; // MySQL URL and database name for Docker

            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASSWORD");
            String url = "jdbc:mysql://" + System.getenv("DB_HOST") + ":" + System.getenv("DB_PORT") + "/" + System.getenv("DB_NAME");
            connection = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBContext dBContext = new DBContext();
        if (dBContext.connection != null) {
            System.out.println("Connection successful");
        } else {
            System.out.println("Connection failed");
        }
    }
}
