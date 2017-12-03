
package main;

import model.Database;
/**
 *
 * @author Syarif
 */
public class TestDatabase {
    public static void main(String[] args){
        System.out.println("Running database test");
        Database db = new Database();
        
        try {
            db.connect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        db.disconnect();
        
    }
}
