
package vmm;

import java.sql.*;

public class DBLoader 
{
     public static ResultSet executeQuery(String SQL) throws Exception
     {
            //////  ##CODE  ///////    
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loading done");

            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ccdb", "root", "root");
            System.out.println("Connection done");

            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Statement done");

            ResultSet rs = stmt.executeQuery(SQL);
            System.out.println("ResultSet Created");
            
            return rs;
     }
}
