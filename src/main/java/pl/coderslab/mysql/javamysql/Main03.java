package pl.coderslab.mysql.javamysql;

import java.sql.Connection;
import java.sql.SQLException;

public class Main03 {

    static void addCinema(String name, String address) throws SQLException {
        Connection connection = DBUtil.connect();

//        String changeDataBase = "USE cinemas_ex";

//        String insIntoCinemas = "INSERT INTO cinemas (name, address) VALUES (?, ?)";
//
//        DBUtil.insert(connection, insIntoCinemas, "koszyk", "duzy, tkany", "8.99");


    }

}


