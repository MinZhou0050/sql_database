package sqlsample;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class exec {
    public static ResultSet main (String sql) {
    try {
        // The newInstance() call is a work around for some
        // broken Java implementations
        Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor()
        .newInstance();
        String dbName = "db";
        String port = "3306";
        String pwd = "root";
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:"
        + port + "/" + dbName + "?" +
        "user=root&password=" + pwd);
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        /**
        while(rs.next()) {
        int id = rs.getInt("ID");
        String name = rs.getString("name");
        System.out.println(id + "---" + name);
        }
        */
        return rs;
    } catch (SQLException ex) {
        // handle the error
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
        return null;
    }
    catch (Exception e)
    {
        System.out.println("Unkown Error:" + e.getMessage());
        return null;
    }
    }
}


