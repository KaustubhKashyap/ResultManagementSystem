package com.rms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            String url = System.getenv("RMS_DB_URL");
            String username = System.getenv("RMS_DB_USER");
            String password = System.getenv("RMS_DB_PASSWORD");

            if (url == null || username == null || password == null) {
                throw new SQLException(
                    "Database environment variables are not configured."
                );
            }

            con = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
}

