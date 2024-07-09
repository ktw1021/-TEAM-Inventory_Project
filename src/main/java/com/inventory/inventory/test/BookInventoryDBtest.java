package com.inventory.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BookInventoryDBtest {

    // JDBC URL, username and password of MySQL server
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String JDBC_USER = "project1";
    private static final String JDBC_PASSWORD = "project1";

    // JDBC variables for opening and managing connection
    private static Connection connection;
    private static Statement statement;
    private static ResultSet resultSet;

    public static void main(String[] args) {
        try {
            // Step 1: Opening database connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Step 2: Create a statement
            statement = connection.createStatement();

            // Step 3: Execute a query
            String sql = "SELECT * FROM book_list";
            resultSet = statement.executeQuery(sql);

            // Step 4: Process the result set
            while (resultSet.next()) {
                String bookCode = resultSet.getString("BOOK_CODE");
                String bookName = resultSet.getString("BOOK_NAME");
                double price = resultSet.getDouble("PRICE");
                String kindCode = resultSet.getString("KINDCODE");

                // Display book inventory information
                System.out.println("Book Code: " + bookCode);
                System.out.println("Book Name: " + bookName);
                System.out.println("Price: " + price);
                System.out.println("Kind Code: " + kindCode);
                System.out.println("-----------------------------------");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Step 5: Closing JDBC objects
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
