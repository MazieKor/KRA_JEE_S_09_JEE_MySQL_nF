package pl.coderslab.mysql.javamysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBUtil {
    private static final String DB_User = "root";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinemas_ex?serverTimezone=UTC";
    private static final String DB_PASSWORD = "password";

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_User, DB_PASSWORD);
    }

    public static void insert(Connection conn, String query, String... params) {
     try ( PreparedStatement statement = conn.prepareStatement(query)) {
         for (int i = 0; i < params.length; i++) {
             statement.setString(i + 1, params[i]);
         }
         statement.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace();
        }
    }

}
