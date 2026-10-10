
package com.rms.util;

import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {

    public static void main(String[] args) {

        try (Connection con = DBConnection.getConnection()) {

            if (con != null && !con.isClosed()) {
                System.out.println("Database Connected Successfully!");
            } else {
                System.out.println("Database Connection Failed!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

