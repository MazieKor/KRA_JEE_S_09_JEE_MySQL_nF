package pl.coderslab.mysql.javamysql;

import java.sql.Connection;
import java.sql.SQLException;

public class Main02 {

    public static void main(String[] args) throws SQLException {

        String insertIntoProduct = "INSERT INTO products (name, description, pprice) VALUES (?, ?, ?)";
        String insertIntoClient = "INSERT INTO clients (name, surname) VALUES (?, ?)";
        String insertIntoOrder = "INSERT INTO orders (description) VALUES (?)";

        Connection connection = DBUtil.connect();
        DBUtil.insert(connection, insertIntoProduct, "koszyk", "duzy, tkany", "8.99");
        DBUtil.insert(connection, insertIntoProduct, "krzesło", "bujane", "9.99");
        DBUtil.insert(connection, insertIntoProduct, "krzesło", "bez oparcia", "9.99");

        DBUtil.insert(connection, insertIntoClient, "Bartek", "Kowalski");
        DBUtil.insert(connection, insertIntoClient, "Iwona", "Czarna");

        DBUtil.insert(connection, insertIntoOrder, "Bardzo piękne krzesło naturalne");
    }


}
