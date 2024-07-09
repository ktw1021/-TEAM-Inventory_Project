package com.inventory.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USERNAME = "project1";
    private static final String PASSWORD = "project1";

    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            // Load Oracle JDBC driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish connection
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            statement = connection.createStatement();

            // Execute query
            String sql = "SELECT * FROM book_list";
            resultSet = statement.executeQuery(sql);

            // Process result set
            while (resultSet.next()) {
                String bookCode = resultSet.getString("book_code");
                String bookName = resultSet.getString("book_name");
                double price = resultSet.getDouble("price");
                String kindCode = resultSet.getString("kindcode");

                System.out.printf("Book Code: %s, Book Name: %s, Price: %.2f, Kind Code: %s%n",
                        bookCode, bookName, price, kindCode);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in finally block
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
