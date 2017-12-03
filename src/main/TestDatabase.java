
package main;
import java.util.Scanner;
import model.Database;
/**
 *
 * @author Syarif
 */
public class TestDatabase {
    public static void main(String[] args){
        System.out.println("Running database test");
        try(Scanner input = new Scanner(System.in)){
            System.out.print("Masukkan username database: ");
            String user = input.nextLine();
            System.out.print("Masukkan password database: ");
            String password = input.nextLine();
            Database db = new Database(user, password);
        
        
        
        try {
            db.connect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        db.disconnect();
        }
    }
}
