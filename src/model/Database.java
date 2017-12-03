
package model;



/**
 *
 * @author Syarif
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Database {
    private String user;
    private String password;
    public Database(String user, String password){
        this.user = user;
        this.password = password;
    }
    private Connection conn;
    public void connect() throws Exception{
        if(conn != null) return;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            throw new Exception("Driver not found");
        }
        String connectionUrl = "jdbc:mysql://localhost:3306/jdbcdemo?autoReconnect=true&useSSL=false"; 
        conn = DriverManager.getConnection(connectionUrl, user, password);
        System.out.println("Connected!");
    }
    public void disconnect(){
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println("Can't close connection");
            }
        }
    }
}
